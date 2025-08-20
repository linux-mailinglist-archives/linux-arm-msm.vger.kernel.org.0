Return-Path: <linux-arm-msm+bounces-69956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6EB2DB54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B53A1C802D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431712E5B16;
	Wed, 20 Aug 2025 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCNU/iKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50C12E427B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755689651; cv=none; b=P6QFU4H1zG6dpKp9QhIMveJald2W6h1OAXgDWFaXYas1lbXPNB2q4y77/ig2cFyt+i7sZShpV2xHDFb8xmgUAByYiDxRBzfNeW+52BeGoeQhMLkQaBuMK1v9xSPoS+zUWzV4lr+MVNlzGZYs7VQ7p5Pi6+E5oJPrBrd2tDHezOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755689651; c=relaxed/simple;
	bh=fnFlSvGRR/TSyKfoUhH+X2EynjQebmFIrPk4G7+w8Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq6l3/tDcW5cbu6iUX5KO98oAx79YykpWTkQkw+nrIexxusgoshF5gej0ahIneGiRGBKT8Xk2cpnswzTGzmPwZP/5V2najoYc0PEmbXHqze4M5+hg83WcfuGF+0tnw+znrI/yUDOZS/FiIRIPbk/Or8TkaDsN5i0dTdjZf/V09o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCNU/iKn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA7Lxb011391
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XcNX4ZDYiBJ7hPbbX3QqeNKI
	VB3toybrjSkdSm9Gk44=; b=eCNU/iKnkqs2/ujRIBoZ3cftAZtZMetCNlRfqUcS
	WBDmgpb5vugP2hRdIcOiP+bTSMIgTQ47Ax+2hnGjqmlxM/13uTFqFs/SC4j6bA+J
	nLUx+pO3Uc6UG3QnR5IYcVJcJV+PHR8bBwBy/yZtefRJvcoU6zXuqUNNLD3JRKiW
	IrjKsYtFqMvvQ0AR2q0XNA0eggWzuVla2/gY0AsDXVP0L3PuEh73qMlD0vSSQuaw
	qRqQaF3gaZq9Qpm5dZRyy+roT3jMPAHnSjEYp5TYJC5ZeKCNgmOLkc0CVjTvUavU
	wc1/3eWdLpk7HpxWlfX2c3/sTguSODbFm9i/Upn9w6kotQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhjgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:34:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a928da763so147595266d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755689647; x=1756294447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcNX4ZDYiBJ7hPbbX3QqeNKIVB3toybrjSkdSm9Gk44=;
        b=AJAXlaFpU0zKiM14uTkHSqabqAyXS1UPHLGx0O7gIRVoKYGCpl+OlX1kH6HMTZ1OmM
         7sjvnJ8+b15pnkIU551MIVWlNyGUw/arOri3cTp4v+QZUsGCS3mP6wYF/xtwxiZzlL+b
         eve3DPpsn7KW4eRHXCicU7z1JvpiA6Tl/S7cKKRyCbFCsbUg9gmAnbUvo/Yzz7gjnDmH
         Q0dvRkCPPGBvvb5tR20SKb8CCbsOnkDI3Ml2QY4WQY09ZpB4HyzeUsAfF8ipme0V5bUD
         /ShY0+OKfwOvx5gm4XXbHOFJKNp08L8t7xLawHl0B1ca1hT8xW0MhPOqknxJYP5hDdwA
         3lYw==
X-Forwarded-Encrypted: i=1; AJvYcCWNdxgRyWCoNNdcaO5apAKCcSORGPKh1Hmf7PYCAjoq8dfcTVggjjDoVIdQgWZRjjHSmV843beFrsrJNm0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgkgzvzw5x53lRl7Cj6IUJB6tfiGufTUyEhICYV6OlHIvkhetZ
	7aOiUWZNwTtcVn8l631KZqrpKnyra3omGrn+ElWIU1c3B53z06YN4jygRYguzqGLLK4wnL6CUC6
	DP7sH+4sQQCqPbgLd8DS5MnJq0S/QxbUQZK6r4GE3IVoqbM4/YfPYdZ98WTex3QMvU38P
X-Gm-Gg: ASbGncvTxu2oOw5Uoq136yyVljqcKF8jBw8h7g0WZNu7zDeVdpglbBqnTS0jgUhL9Xr
	7MI8vJOsDlkEa80XwzREKVoMYeTjfZ0x7SvdcB0WD1tgrGgfKGMC0d4GqnY5WGyThGwWtrcJhbb
	OmpIHU2XrdXSHpGQfp/mRWPxqWubChziGzBS/NLlNTP99zjIzA1EwadhgnfcJw0GfPp6pK+LMbg
	sIqH1JfIsUCBv7WLRVul8Gp+Mv74gSYbaIJobc7QwnVsTGVnKGiUljv6UPDYcnIZQVajPBbjePw
	URcz/5hFsw6f+OXA7uXtHluw5ylDI/C+RfIyQqrT5GnIwOKZxcbAYowJWAkJiAUzx/NleW0EiTz
	TFhg6gwjsdwdc0aOKaIUwnACoFEAV7x6ewrnDGx1CowgE3G0IbtSD
X-Received: by 2002:a05:6214:2467:b0:704:f952:18bb with SMTP id 6a1803df08f44-70d771402c7mr20425706d6.46.1755689647370;
        Wed, 20 Aug 2025 04:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKE0JSYrOpvMO2WcRrh53W2VDmbQ14HSNNSlF+so2tCr9GefhcpbJA6wUwasEOVbgwxfyTww==
X-Received: by 2002:a05:6214:2467:b0:704:f952:18bb with SMTP id 6a1803df08f44-70d771402c7mr20425116d6.46.1755689646629;
        Wed, 20 Aug 2025 04:34:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e084e46b7sm233240e87.48.2025.08.20.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:34:05 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:34:03 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
Message-ID: <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX11M6HhJWTe0O
 Flo9eTGvP/upnasQtZ3L1clVfgiy2B++3Bq64RoTneKEI7rqXWdwefP1MzhHPz0njJf3uNm4OBn
 6tVNKTZMBmTAMopB/svnfO/Dzy6qS3wXvbsuEMOC0vYMuKoOOLpNeYaYDhwL4QUi+A61QZYbOnr
 4i6tNQWf2V5RGTd4PqKI4K6/hfDTql3mu/74iZ9VHmE0ncNR/r61rOZ4uWhHk8qQLKdgR0vq9tC
 +lNkdV6oHwKJthJh1shTjsY3INZcPW5haq1GHB4Bc3SkyKEn/QBy2JODRbcMyLEBsqWHJ+mr9+j
 fIIGp7xPX1GdGZZbygXszfxcwazjlkjNAxgWBvSrSDS1EGuKnbhdy+6JTJr4mxOB0qimoXlHujy
 4TzDtM4jTCHs01En8Xo8K5v2ehMCGg==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5b2b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LJgbN-Jd--P93uwsTkIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Bq3PwxUZYQIWQ3aU6bQVKCmpE0cy4rK1
X-Proofpoint-ORIG-GUID: Bq3PwxUZYQIWQ3aU6bQVKCmpE0cy4rK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:46PM +0800, Xiangxu Yin wrote:
> Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
> differentiate between USB-only PHYs and USB/DP switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>  };
>  
> +enum qmp_phy_usbc_type {
> +	QMP_PHY_USBC_USB3_ONLY,
> +	QMP_PHY_USBC_USB3_DP,

Drop, you can use presense of DP offsets in order to differentiate
between USB3 and USB3+DP.

> +};
> +
>  struct qmp_usbc_offsets {
>  	u16 serdes;
>  	u16 pcs;

-- 
With best wishes
Dmitry

