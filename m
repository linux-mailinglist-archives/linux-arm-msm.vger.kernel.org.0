Return-Path: <linux-arm-msm+bounces-60848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19498AD40CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6038D189D2CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2AB24677E;
	Tue, 10 Jun 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR26CCm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0DD236424
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576266; cv=none; b=ipCC6biPCFCF+XNK69b/91XJAneU3jcIVtnTpORLWNX3tk3ClddNwNP/acdhgqJRLdWSae2DJrJKjcn9Q6jcx3QdFCAq720QDuQpUdx0ehz45KfT/BGhuVj8ThCta+r7pVmp7EZWvIAoH6pFjxafQE1pmO1HoewBMPSkPA6IrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576266; c=relaxed/simple;
	bh=vZ/qHJY5SYbx69O6TGT6pJN0oltt/Iwo/nwAfXXgjo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzk5w27EVu3WcX6K1WFAlHFkeVtn94B+moQQSIZUnf+ARH9WQj7TeL5eeN8q9j+O27mVolaOYniZzDkjzntmnghHCCLQQMaIwI20s3IqC9bhOamRun5ry+j/JaGjy3eZ/WUs4OurCZFAd9+bfyC1+qnwTNN/8hYHRKQ8DlBRE+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR26CCm7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AEj80j021153
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EgCdyUGamjcRnI5Pix4QyBB
	IiE0+ID5FfFUhMmjiF4=; b=cR26CCm7BHCRgyaBrtjlhw72O2tcLzAg7zeNrvSw
	7rf59uF/gNJJ06WPbea6Q+VFkDj0pHcRKaCWyVo/wdoWSs27nTpP67JwUAz+ZgPM
	TwmwnvV+gJNFFZj2o9+zDIzx/hQry+CbYDCKU/G/fm0UxikQEjzxJATUHlXZ+FWF
	2kyV6XtYKtbKoPETiygC03CEOFkFi/1vdxUEJ+MVx5MNm3VPrGgAzlgN6hdlAj4M
	WRzauIusS85csVP/pr3oRVZcAGS2Qy/1TX2KYm3fBFJnG2M9ycMhxm2XhfJuCSrN
	nfYJh4oqz3KItwSwGLgikVHwmk2qn8hXbj02+71wFjYApw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn9vqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:24:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so949336285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 10:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576262; x=1750181062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EgCdyUGamjcRnI5Pix4QyBBIiE0+ID5FfFUhMmjiF4=;
        b=E0JVX/B3VwZEBXnbjqHZlvezrg/pdL8TAA7S/OFM6fZlRKg8ScsuE7QrHeAtMr6hWU
         uMBsD+TEpjZZdivSag5zbHn7lcdcC1aWAFN/elRZBnXqwmOceWhJ9LyFBhCHLsfvHUmO
         MXqr0PaSxHmZM1fAWvQkun9yF82kt4QeYjOe0z7qxqy26IZgJH3YEi+sd//b+NOEWxZw
         VAXoYiAivv/2kh802EVUZuzNqvwoO/DDproiULQVBACakbmDPEOmfaNgfuIEnES7jgaa
         BrWjkS3IGCQfXphkZKO/qooRZEPNMPhgrHIwEiH+9D61GcIM1UvS8zjuYdBjydsXMCp9
         WwYg==
X-Forwarded-Encrypted: i=1; AJvYcCXLDEPz07Pk+rb4YMEDabr+UDTDOtFYPdcdeMtfYxJx/B0DqMNGHMMa1TJBCzyCaeXhhGTOFqOj0TMz5h9C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wQQZEgya4rXBN4iIa7pxxx+ov4+Br2ByhB3fw7rcaGP3IjMQ
	hRv3i5ZXoTuLVQs36yACN9oIIAjZM2JUgp0K5UrTDhNeRrNABI4Kz+c/9raVt+Ey4kfvExgwuRM
	6lle1WVV5ahadbbmWbM8X0wytkJV/BCcj8TWLGnHPsLTHQrsrEvbqogTiIEvnAvAmg40u
X-Gm-Gg: ASbGncstgc9FsYDLlUmje38IKm9VQ99SCVo2q9IAIq8LgcScpBKBUXaFnvxiw1IxVsF
	++M7c8fg5nMPbJrSOIQdN4UiGh/3T24fXCTK0xzKK/kkIPVvpYn6ZY1kDxaMJ4DcFBjt8jXVxqy
	dAiQM97E15nMfVmtdY5Ssm1pns2sewbONRn5+FYsY2zakYatq5gwLKkY2L4EjxeNBdeGXhLQiGE
	i4KOZu/0ISc5BSIsmsPBztpFBiVsB2u5Er0zhfRlcCbhnRipHtFvO/4P2xXQGs6cs7duklnp/9U
	scWfMZmcNzgHPDo+NfKwxKe/PlqEqn/CgI1fzGZUFKUDifh663Hn1YwmuOENhKGtpF7y874DE3L
	OewyQv6ND8PC3k5zyxDRtRhIKHE97HG3EarE=
X-Received: by 2002:a05:620a:3192:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3a8819d38mr34794285a.13.1749576262225;
        Tue, 10 Jun 2025 10:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJwAL23sxfBB/KttW8whRTTbhx5/KJQNW3ngwPR3f5kgUdwtLnj09kuUoauwaIYW7FJDmPZw==
X-Received: by 2002:a05:620a:3192:b0:7d3:9482:b21c with SMTP id af79cd13be357-7d3a8819d38mr34791585a.13.1749576261848;
        Tue, 10 Jun 2025 10:24:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733156sm1622634e87.243.2025.06.10.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:24:20 -0700 (PDT)
Date: Tue, 10 Jun 2025 20:24:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Message-ID: <5pbdk3xo6jkj7gwxlgvzdz4nxehjm6izgejjvwafxitvn6lm5p@qhjfezk3dvdh>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250610110047.4yc6zjcvkobxerml@umbar.lan>
 <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rtU4ync0_y1wzfqOKDaYEhE_z2D3zP9N
X-Proofpoint-GUID: rtU4ync0_y1wzfqOKDaYEhE_z2D3zP9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0MSBTYWx0ZWRfX4uqmSgwnM2lN
 hvdEGXiN9b5MsdhXvB6dF2tsLSOklh2FIzGpduxaM95PlDF5SrsrO86hyVxh3xnlyL8WuwJJLUc
 0hBZtfsrawRiFPedTKDGOGKh8qLdKUvgj21xQnKknY5WmL+2k3WdGLvFVbjikgJzMOG11CdoAW5
 YjGuu2iCaSTGY4aTfCPWJxwD4+rquhMfriE+MOFWNgMbV8HXDCjp/30BiwRRKpZyTmRBMuxTGpd
 AWM216zTepusL1wmZ4LR2YDgI015KEfVfH4JE1C/q9KbcKkEYuANwnl6gmx5YUL4XfKudCE2+m2
 jA8b4Dsfus8Mgt09YUqigmAVxRclHq89vz4TXVEAXYtA4ymHIF3nBM6miVt1pogrKEFC5fe5BhX
 Hl33fru9bjMSydlR4UagFzkgE4LqGDJEDrG5ob7v5BnUbuPBWU5CGVEKBsc02w4vkbB8rxOS
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68486a47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=yhNm8lLqjQGDdp7WpVgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100141

On Tue, Jun 10, 2025 at 10:10:33PM +0530, Krishna Kurapati wrote:
> 
> 
> On 6/10/2025 4:30 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
> > > When in host mode, it is intended that the controller goes to suspend
> > > state to save power and wait for interrupts from connected peripheral
> > > to wake it up. This is particularly used in cases where a HID or Audio
> > > device is connected. In such scenarios, the usb controller can enter
> > > auto suspend and resume action after getting interrupts from the
> > > connected device.
> > > 
> > > Allow autosuspend for and xhci device and allow userspace to decide
> > > whether to enable this functionality.
> > > 
> > > a) Register to usb-core notifications in set_role vendor callback to
> > > identify when root hubs are being created. Configure them to
> > > use_autosuspend.
> > > 
> > > b) Identify usb core notifications where the HCD is being added and
> > > enable autosuspend for that particular xhci device.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
> > >   1 file changed, 56 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index d40b52e2ba01..17bbd5a06c08 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -95,6 +95,8 @@ struct dwc3_qcom {
> > >   	 * internally by mutex lock.
> > >   	 */
> > >   	enum usb_role		current_role;
> > > +
> > > +	struct notifier_block	xhci_nb;
> > >   };
> > >   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> > > @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
> > >   	return 0;
> > >   }
> > > +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
> > > +				    unsigned long event, void *ptr)
> > > +{
> > > +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
> > > +	struct dwc3	  *dwc	= &qcom->dwc;
> > > +	struct usb_bus	  *ubus	= ptr;
> > > +	struct usb_hcd	  *hcd;
> > > +
> > > +	if (!dwc->xhci)
> > > +		goto done;
> > > +
> > > +	hcd = platform_get_drvdata(dwc->xhci);
> > > +	if (!hcd)
> > > +		goto done;
> > > +
> > > +	if (event != USB_BUS_ADD)
> > > +		goto done;
> > > +
> > > +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
> > > +		goto done;
> > > +
> > > +	if (event == USB_BUS_ADD) {
> > > +		/*
> > > +		 * Identify instant of creation of primary hcd and
> > > +		 * mark xhci as autosuspend capable at this point.
> > > +		 */
> > > +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
> > 
> > This feels like an overkill, using notifiers to set autosuspend flag.
> > Please extend platform data and/or other static code in order to set the
> > flag on the created xHCI devices.
> > 
> 
> Do you mean modifying pdev of xhci from dwc3/host.c ? Or adding the
> use_autosuspend call in xhci-plat.c ?

The latter one.

> 
> I thought adding this notifier would be a better way to identify when the
> xhci probe is in progress instead of touching pdev of xhci device from dwc3
> layer.
> 
> Regards,
> Krishna,

-- 
With best wishes
Dmitry

