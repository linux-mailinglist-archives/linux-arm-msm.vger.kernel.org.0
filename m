Return-Path: <linux-arm-msm+bounces-60847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4DBAD4094
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB9B17A98C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3874C246327;
	Tue, 10 Jun 2025 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzJnLnN3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62524DCE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576207; cv=none; b=lBEN0B3MlXEhKTLoFkyO/OAz5URPpTNMbbnH2qDCPG0nZ9nVlfpckO2yQS3hjH4kkP1/1Oa1bRe/n3Nk4axtuCtDIKjOPCV3f74Itp+zQjrS7SbZ3ljusJPZ87VNBkS4115tSjawPVXiiLJYc6Gwj5+2qIticsRAppDmDwx0xK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576207; c=relaxed/simple;
	bh=CrHjv8+FliCkKij6pchH5GclhBXNk+Zv1FLg/wN+vjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2uy4UdrKbznXIRjgx/2N6sjtGNzesenwGJAHAufBuqMpq+I6EDyU/89u9JPPSucIRZgOXO3eBFKquTPYnA76VqDeUAIZGvl+ZINTHBtLcpFod4+1UEk1cEMm1HdosvyZIbZa3xCQbDvqK5A0jalVao9HcqgAJsveJArOclcw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzJnLnN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8ZW2U001845
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j8m/+/ge7/FMBMM5Zz1Lr2eW
	mPr1EQ1sZArqncuixgo=; b=jzJnLnN3AQOtla7exJkHRyGXSMCuT6gfTTSDVMCP
	Jb/JTVDdGsvDK5EfJCzis1w1NkF8vNEz8foGSve5trO15hk4zmVHrkw9YqkzXZI7
	BIWLcAJUfimiy2KG15W44s4uaedW+ixQeA/D03J6H4LJ/xBaGNT57NNb7mPspN+V
	DFKDGnT7V2OJfJBN2Y1fbS8nEsD/acgonCLgx95bRElx0FF/cFIbbhNc47eYSGVP
	QSt1Xa3beVVra/hJMfBE/DC454eUn7g8KfYxaNDsl311o+BOP0Zj0B14bQ+sbYs8
	8Ess+Ngarz5tNaUuxcGuooVOl+AbtqlWz0MWz/P1VUg6LQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxthfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:23:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so1037007585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 10:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576203; x=1750181003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8m/+/ge7/FMBMM5Zz1Lr2eWmPr1EQ1sZArqncuixgo=;
        b=OV0s0NFGt07BjODcHV+K9jT4gTUKLlyVogmsJqyViJiIKwWYpj+wKR3Yib6o+spVsJ
         nQupy35zKZUBwmgKICjCEEDzhb1Wt+aRoxsp0ZxUJCcixDmUr0LVNTJD5jTXfbXIXbaX
         AlDnv20+Vu0jn9MUiy7SeRUI8V0fIJER5RBVA6ndaNk+jgs29F5GcEWAzHkO0IIWBAEW
         k7ZmDMutRpcbG0NQj3sQl3jbRLP9ke3Dx7vEsT6BcIIfD5vNisipm6iXyACq1iq+Zeqr
         yB+CjlMOrwglMhE5+QvmlPVTOzSGtE/662xFg06euuAAZDRu1rNu1YbObBo7JDfTkUzo
         2M0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWF01U8BsHf8QEDJ0YdskCQ1L+waSnQ/kukUEpGH2otqptQuGpd08/qA+gCcJFuBPk92+GsmfbAKScvky78@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKLEnDrXZ8COmFhPf/C+WAaxSjcQWalxFSR3fG6BO34KBZquO
	U+FwWZSZ9K4jmMzwsIgc3C2vwADVsdlpOmIUaNj09qqDEYqogc094TukIMcXpAjkWzf9bDPcgSz
	T+eno5QGya7fIVUVECdIpghRdd74PyyHuuaccEkG8/rdRSl74QRlArj8x+R6fISuLFrVN
X-Gm-Gg: ASbGncukpZTRZgGt+Ett4HB6IM4LBumtOO2puslVbKCiWppwm4qqUrxr25JrThB8DgF
	ZMOnsTbquQUl8o2LB8vwLCrb2VES2MJdlwmQbglTM9tFaCTr+b1JRA7rs1aX/N/LEtjEQ0FqXf4
	t+JkvilxXcs2m6mR1v9HkOREnrJvSf9BDAXpdYWT2dY2d682kstiUT6hwjw7qYkFQm07VAm1nbj
	s3mKlV712LNFZ4yPJVezoowu7u+eLR9hCxQuXvdCPYSl4fQJ7UcpqdboKTYYsZwHwc61D2jpUJK
	2t62L19Pak+VEgirkZrz7N+cKEzwPuSV96XR3vOTH0F+HvRQYuwlyVIvi+ilfmSyKVJQojmWXp6
	WyKBZuc8j5b6EoR2VwrhjHNRPEIBUDSNpwVg=
X-Received: by 2002:a05:620a:2697:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d3a888e055mr32498085a.31.1749576202255;
        Tue, 10 Jun 2025 10:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN0PxzkvuqH1TCV1n3E+M2ROth6uwGEKPKCYKjph+8DU1Styao4lHQ9jN18yyZpzx59sejKQ==
X-Received: by 2002:a05:620a:2697:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d3a888e055mr32494385a.31.1749576201840;
        Tue, 10 Jun 2025 10:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773139csm1622912e87.208.2025.06.10.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:23:20 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:23:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Message-ID: <shpn2wf64trpnulc7dsyyc76mafeila3amxl53wh4ksmtv2jte@3lccqv6wz72q>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250610105812.jepct55ic5snglno@umbar.lan>
 <aaeafb33-9897-4f47-b4f8-4b92885c3795@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaeafb33-9897-4f47-b4f8-4b92885c3795@oss.qualcomm.com>
X-Proofpoint-GUID: d9c6pD3M6rmlheOHfZmbXNG4yvSb4IqB
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68486a0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ba8jTNeHwYO7qFVAJGAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: d9c6pD3M6rmlheOHfZmbXNG4yvSb4IqB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEzOSBTYWx0ZWRfXzaPVfPyRGZ2V
 KpCbwu31WGGmelQ8a8IvVqooZB4M5/ezhcfhnJFE+mHUanhFU/TciOXYutc51zlzE9QlZIDKfkG
 7NrlgjCp2ARoc7ODu8VsiDqV+gKFFpcVAL8IJ4+SeIuovEirGIdw9HqQ3toU39UP6SiRHDYnAdT
 J6qrD92fPwbWxAnSQ+zaeBuvb18Hc00TNOGHdqPHTeB9hxBma1VYCPymKkUq4d6gyCfRdvOAeC8
 dL3cX8g20hQTVMFUINux1zAtn3OJ7Eir2dkrdyIgwm1N7TolkjtU+J3ze/2cE4q5j6K17GaLl8m
 pvZmXUnRcNgo9GHXofGMLIF8/b/XndpsWkxxrV4i5p/sHDJ9oU0emxkBjuaH8EOr7jg8DgBKK+3
 5qk9dBjd6Kpucrt5aJgbHlZ+zzfWqV71ofGaB7k8etFoBoQgDqAcUJ9ZKwT5Oi18ne/MEmYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100139

On Tue, Jun 10, 2025 at 10:06:24PM +0530, Krishna Kurapati wrote:
> 
> 
> On 6/10/2025 4:28 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 02:43:55PM +0530, Krishna Kurapati wrote:
> > > On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
> > > device mode are generated by controller when software writes to QSCRATCH
> > > registers in Qualcomm Glue layer rather than the vbus line being routed to
> > > dwc3 core IP for it to recognize and generate these events.
> > > 
> > > UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
> > > to generate a connection done event and to be cleared for the controller to
> > > generate a disconnect event during cable removal. When the disconnect is
> > > not generated upon cable removal, the "connected" flag of dwc3 is left
> > > marked as "true" and it blocks suspend routines and for that to happen upon
> > > cable removal, the cable disconnect notification coming in via set_role
> > > call need to be provided to the Qualcomm glue layer as well.
> > > 
> > > Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
> > > there is no mechanism through which the DWC3 core can notify the Qualcomm
> > > glue layer of any role changes which it receives via role switch. To
> > > register these glue callbacks at probe time, for enabling core to notify
> > > glue layer, the legacy Qualcomm driver has no way to find out when the
> > > child driver probe was successful since it does not check for the same
> > > during of_platform_populate.
> > > 
> > > Hence implement the following glue callbacks for flattened Qualcomm glue
> > > driver:
> > > 
> > > 1. set_role: To pass role switching information from drd layer to glue.
> > > This information is needed to identify NONE/DEVICE mode switch and modify
> > > QSCRATCH to generate connect-done event on device mode entry and disconnect
> > > event on cable removal in device mode.
> > > 
> > > 2. run_stop: When booting up in device mode, if autouspend is enabled and
> > > userspace doesn't write UDC on boot, controller enters autosuspend. After
> > > this, if the userspace writes to UDC in the future, run_stop notifier is
> > > required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
> > > event is generated after run_stop(1) is done to finish enumeration.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
> > >   1 file changed, 73 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index ca7e1c02773a..d40b52e2ba01 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -89,6 +89,12 @@ struct dwc3_qcom {
> > >   	bool			pm_suspended;
> > >   	struct icc_path		*icc_path_ddr;
> > >   	struct icc_path		*icc_path_apps;
> > > +
> > > +	/*
> > > +	 * Current role changes via usb_role_switch_set_role callback protected
> > > +	 * internally by mutex lock.
> > > +	 */
> > > +	enum usb_role		current_role;
> > >   };
> > >   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> > > @@ -118,9 +124,9 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
> > >   }
> > >   /*
> > > - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
> > > - * validate that the in-core extcon support is functional, and drop extcon
> > > - * handling from the glue
> > > + * TODO: Validate that the in-core extcon support is functional, and drop
> > > + * extcon handling from the glue. Make in-core extcon invoke
> > > + * dwc3_qcom_vbus_override_enable()
> > >    */
> > >   static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
> > >   {
> > > @@ -641,6 +647,53 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
> > >   	return 0;
> > >   }
> > > +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
> > > +{
> > > +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> > > +
> > > +	if (qcom->current_role == next_role)
> > > +		return;
> > > +
> > > +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {
> > > +		dev_dbg(qcom->dev, "Failed to resume device\n");
> > > +		return;
> > > +	}
> > > +
> > > +	if (qcom->current_role == USB_ROLE_DEVICE &&
> > > +	    next_role != USB_ROLE_DEVICE)
> > > +		dwc3_qcom_vbus_override_enable(qcom, false);
> > > +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> > > +		 (next_role == USB_ROLE_DEVICE))
> > > +		dwc3_qcom_vbus_override_enable(qcom, true);
> > > +
> > > +	pm_runtime_mark_last_busy(qcom->dev);
> > > +	pm_runtime_put_sync(qcom->dev);
> > > +
> > > +	qcom->current_role = next_role;
> > 
> > How is it protected by the mutex? Which mutex?
> > 
> 
> I see a mutex lock in usb_role_switch_set_role() that invokes set role. I
> think that should be sufficient here.

Please add a comment to the source code.

-- 
With best wishes
Dmitry

