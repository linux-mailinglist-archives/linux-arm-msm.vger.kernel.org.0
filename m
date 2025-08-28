Return-Path: <linux-arm-msm+bounces-71125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D195B39DE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A63297C1785
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2808930F7FA;
	Thu, 28 Aug 2025 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwX/wFBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970B1B0F1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756385830; cv=none; b=blJMGnhsPDFr8cTyEeuZ8Adt7OrsDn2jwtGDgz0SxbpNsmYwjYalKAyWwvU/KMGBHxtkzX2v/21kWYytwjqiuul3VZd0oFapqEL5tBKgME4kN9/zl4U70waWO38PFdzQOWVaE1KUr1uo0hf5TEKPlNEitQffp8Ci2f8IhQfxqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756385830; c=relaxed/simple;
	bh=A7cad3BmlPy/Qe9kysRgFpvyRFOn4yebcN/WW1Y/h5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrKVvjXdmO/K90P4nw1s+wRIEU1ni10ZlNkbpGGpXX+FQOW7vaUNkTBqQacmEoY5r8Yr+WsckmlCtw58gAUqcdU1UL4QawXpB9twnJ5V5gxV8sPRDHF6amNVkEz7Ms0x3zZR9AnO+uTMgLvyMmyto2mBTqvdkWttKcNJeqsHiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwX/wFBm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S9SbkB005837
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgqQAQ4KchFaH1d0/JwOmtXxNXtrGHk+dx87xXF6dec=; b=hwX/wFBmNgyWLANg
	J+UgdxKE1/wlSCUDIo4H0+8ZmZNELyjSV7p1f6DOGU1bXrzUfJgw+DnXNf5ZEZhf
	S60XDAi6ifGlozQX0feDR5JtA4tKVe5gtwHt0VWja4Ao8BnRUdfcfgJfbI5U/baV
	wtptJp9i+OoIQC9VEz19yFIY03jFzIR9Tp6HNWSNDn2X+76qrjDLvUxRt6UQylkI
	QN7b/gPoVEJKQ5gGUM8UkyKyYlGjOmdjpZWayC/uwjcxCBD+ZVvfrNwEtexTSTHv
	ZfRA1nRJWgCZFeVrWltuDBpx6ngdXzLuWk0Bc31jPZIzuZjAKE4mDM4+kGccs0pz
	TQfjEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpghypq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:57:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109919a51so31215801cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385826; x=1756990626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgqQAQ4KchFaH1d0/JwOmtXxNXtrGHk+dx87xXF6dec=;
        b=LjCHEuL+rjYw5dtjRh76zvH1h5FetSxJSXnQaOUC5ttXsKAFwY7saRhe+iOAVgrsJS
         DNgcfa+X72aWiN72lcGaoGF0MVM1qMargFCTOq3Ftzo+zHUJ5V6iT0Vb6Od1kiUlTqw+
         DtlptR3OGgvuAdEtPM7Np3uGer8diXq8E0aowD7D+o6nWWOGYnSMGG6ZPfUbJF6fy2xU
         U8jhb7Hi+Kix6KxzDOYhSJ6XCu5Ji2G5WZhwElyVgVGRfJR5DAlFgH5jt3IRjBdIUlgx
         gUUgLjqfcdqob7XuBcXiwH9aPMnIJSNc2/e2FkSe51/SYNxQ7LxNoq2N+OIWtkDrYmag
         8pMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTeTCBiBQTX47LbC+HfeSSYTP1RmPUJ7Hu54+ckS0ox+tiBJNf+Yp5fhBi+uPQ2nD7Yk2IL7f2CI4BvcbA@vger.kernel.org
X-Gm-Message-State: AOJu0YwROf2oxo/X++ZxdoU4os8JBO9tWU3DBDeb1g34WHYszqeBTamn
	AlSWiqER6zeGYDLeNXuAd0WtXdnW1E36qzzxJht85ILKn8rv3/GvKCLaFzIb6E7+doQnNR8EXGy
	sxbFVh8a6aHI7Atvc77mpRGgdLszu7xsz3B7GHDLukKUHpgumHohFG1kV5nPAxJiVDowc
X-Gm-Gg: ASbGncvt6syjqbH6DdX9WzrxyZGZrRRSkeIc61Z7kuPh+DzmpLW0jQLriRldrsyfRtI
	OB7rqJe3UCLenWwf2KPOyfUudTMXNTBaXlYypNXN771qWYa2PT8wWx759yrnayIaHLGlQL7JBBE
	Bo6Blh8XdCug8vYySKJ6VFwtyUeE5VoWJUkw5sEdBlcYiJihkAV2j9/UUJel2rj48EVE7FtliJC
	WBOmKAJwQ9KR1gSj9BynAam/y5LmaeByVIY+t4bIf/Ka4LlOP4XkXq6SOc7DxwJjSf2ttp8UR2A
	GksHX4NXUUV5/QipIvq6L16BOpRTiJtLTKl0oTHv6lK8h4qw+HV8od89+qdme/XeZaqurFotCiF
	yiUyaCnaEBmfvUprVlWSMEUxXjYr5GCTSpxVoWJqqK6jGtiMsJsxg
X-Received: by 2002:ac8:7fc2:0:b0:4b0:85ad:7916 with SMTP id d75a77b69052e-4b2aab0e427mr276090671cf.53.1756385826338;
        Thu, 28 Aug 2025 05:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNc/yDmuGpGZJWn4ShQMOMzt9j5GzyojN6uEoc7LfUnq4nqYpVKDjcBVD9/JUfvz/QuIJu0w==
X-Received: by 2002:ac8:7fc2:0:b0:4b0:85ad:7916 with SMTP id d75a77b69052e-4b2aab0e427mr276090171cf.53.1756385825600;
        Thu, 28 Aug 2025 05:57:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c1dccesm3228854e87.67.2025.08.28.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:57:04 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:57:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
Message-ID: <kndlhnsihvkq64q3tgai2jrij5mzh3c5kehe6r4imj4d7fgbc3@l3edsktmx4y3>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
 <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
 <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
 <osav4kwxytfuxvnf26ugdw2qasd753smywsux5punuegbkxqgq@fp3r4esqiqyq>
 <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
X-Proofpoint-GUID: E4EGSbM8X4SNPxHMFaZCyfwwMlgkqyRl
X-Proofpoint-ORIG-GUID: E4EGSbM8X4SNPxHMFaZCyfwwMlgkqyRl
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b05223 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mEe_ubnSu4kMW0ft-g0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX2V3CXZobnvpG
 YGj+jvAyOi+F748UNZqVA34wyX/foqoDqf36Tm2BauTnLVEDheXfO296UywtwqgAvPhhDoRcZGu
 PTwV5rYCcO/EawRZd1X8q0qlv4iIz17NV1LZMAd7tp+PKU6tasFwrUuA7D58kWvHHmk0DIjCd77
 FkY8/bSIfsc6TncSq4pD4Hiz5Lolsk3qjjFdGNbxAGz1tgDQ0ODixXyhtbf1jlIhpR9j2bHq6J/
 hTZL1NIVn0Z1QMmgGrBKHIGM+xtQguLFkaWupA4Uw76UZdRh7YYJbDJGKFEHaunSdCaNEx31Hnr
 BEhspmWlft9xm7A9DxhOLuZIowqR7hp4RW1cP4oa8JfDj+kQYOWdGYn0r39rbgWp38Xttmf4Hav
 snN5dkkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

On Thu, Aug 28, 2025 at 09:40:51AM +0800, Xiangxu Yin wrote:
> 
> On 8/27/2025 10:31 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 27, 2025 at 09:28:00PM +0800, Xiangxu Yin wrote:
> >> On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
> >>>> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
> >>>>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
> >>>>>> instead of hardcoded lists. This enables per-PHY customization and
> >>>>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
> >>>>> Please split into two patches in order to simplify reviewing.
> >>>> Ok, will split reset and regulator part.
> >>>>
> >>>>
> >>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
> >>>>>>  1 file changed, 53 insertions(+), 55 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
> >>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
> >>>>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
> >>>>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
> >>>>>>  
> >>>>>> -	/* regulators to be requested */
> >>>>>> -	const char * const *vreg_list;
> >>>>>> +	const char * const *reset_list;
> >>>>>> +	int num_resets;
> >>>>>> +	const struct regulator_bulk_data *vreg_list;
> >>>>>>  	int num_vregs;
> >>>>>>  
> >>>>>>  	/* array of registers with different offsets */
> >>>>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
> >>>>>>  	struct clk_hw dp_pixel_hw;
> >>>>>>  	struct clk_bulk_data *clks;
> >>>>>>  	int num_clks;
> >>>>>> -	int num_resets;
> >>>>>>  	struct reset_control_bulk_data *resets;
> >>>>>>  	struct regulator_bulk_data *vregs;
> >>>>>>  
> >>>>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
> >>>>>>  	"phy_phy", "phy",
> >>>>>>  };
> >>>>>>  
> >>>>>> -/* list of regulators */
> >>>>>> -static const char * const qmp_phy_vreg_l[] = {
> >>>>>> -	"vdda-phy", "vdda-pll",
> >>>>>> +static const char * const usb3dpphy_reset_l[] = {
> >>>>>> +	"phy_phy", "dp_phy",
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
> >>>>>> +	{ .supply = "vdda-phy" },
> >>>>>> +	{ .supply = "vdda-pll" },
> >>>>> Please fill in the values for all platforms. It well might be that they
> >>>>> all share the same current requirements.
> >>>> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
> >>> No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
> >>> 12.560 mA for 1.8 V supply.
> >>>
> >>>> However, I didn’t find USB load configs in downstream and from SoC related power grids:
> >>> Please check the actual HW documentation for those platforms.
> >>>
> >>>> QCS615
> >>>> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >>>> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>>>
> >>>> sm6150
> >>>> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >>>> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>>>
> >>>> SM6115
> >>>> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >>>> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>>>
> >>>> QCM2290
> >>>> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >>>> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>>>
> >>>> sdm660
> >>>> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
> >>>> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
> >>>>
> >>>> msm8998
> >>>> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
> >>>> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
> >>>>
> >>>> It seems the USB power requirements vary across platforms, and the
> >>>> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
> >>> Ipk being ?
> >>
> >> IPK: Instantaneous Peak Current
> >>
> >>
> >>>> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
> >>> It mostly works either because we don't allow mode switching on older
> >>> platforms (yet) or because somebody else has already voted and that vote
> >>> keeps the required mode.
> >>>
> >>> As you've started looking on specifying proper current load, please
> >>> finish the work.
> >>
> >> Discussed with chip validation and power SW teams.
> >>
> >> The power grid tables are primarily used to ensure each module receives 
> >> the correct voltage, and they define the Ipk for each submodule. 
> >>
> >> While they don’t specify recommended regulator load values, the Ipk values
> >> reflect the expected power domain strength and can help estimate the voting
> >> strength needed for each supply.
> >>
> >> Since regulator load is mainly used for voting, I’ll define init_load_uA in
> >> the next patch based on each SoC’s Ipk values to better align with hardware expectations.
> > If the Ipk is defined per module, then it's fine.
> 
> 
> Yes, under each regulator, multiple submodules are powered, and each submodule defines its own Ipk value.

Ack, then it's what we were looking for!

-- 
With best wishes
Dmitry

