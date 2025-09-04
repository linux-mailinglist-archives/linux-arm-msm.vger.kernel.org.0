Return-Path: <linux-arm-msm+bounces-71955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412CB42E46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 02:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2731A3A9D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 00:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5115E5DC;
	Thu,  4 Sep 2025 00:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SekZQ3Il"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F7E15624D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756946061; cv=none; b=tKXIBZIKuBjcREPAkg9pbWgsTg5EVeKdovzqJNRlVWYAt4jLU5cF6lOJccDKaPpOzF1IehHw/aT4+lzCSIGknj/x88tCmYbCRS7nmRGka1xEupkpuvSPGQsyc0Tz/XH/n5onBT5FxV8v7ca0CzJguAaYwYM7bhEyayh7CsccZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756946061; c=relaxed/simple;
	bh=0sZo3zq7uZkf9+Ve/jrJfnxY0tHOn3ang3YutG87UOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyfXf7op22Pl4r5ODX4ZVENCRDGtTUkUFz78RQVO0IKI3WlL4xMnMKUiDgjFpNaGGkAbg5Tc2zX53M2rVxMXUCzVzSjs4yjrMpbwFhbRSrKSjpod6NwT0Xu8XeMcZ8fXUX2OgZR8QuZGPGTtnFsuPsgfMEOgip3QPzOeGgCCjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SekZQ3Il; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx9uD022320
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 00:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XfrJrvdyAXmQJVa0rcNZrHND
	sz8MqqvZWVWKrBmq0R4=; b=SekZQ3IlTy8JL2eV4UuBYUfIC1IkmkZsa88yasc4
	AcXVfeKGNRrY/gJMoIbwvK0vavZ/DMTZOADrXMvbo0VnSCit8/GwiSmjPXfKeulz
	+MqF11KdC0rxEXqdieeCgy6EkMBitpjSq1dgoJ04/kTDwa5vqeAZhv6q24PRL+45
	4qQ78VEX1Cv+B7/+JXavAdpr3PbAE5vwH/e9I+SnqIUU2q6ChBsq4BfbZsxM4r8S
	871oCf6XH/3ijtgwhqSYRlQy94A/3SL2aWg9X7FLlZ5YbT5nko1bsIUwuJEe1/nL
	nNVP48/TFvgcQOpMsibrZ5rCNdLwK71UnQ3xqRsIcAqxCg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fnh3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:34:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-720408622e2so8969716d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 17:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946058; x=1757550858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfrJrvdyAXmQJVa0rcNZrHNDsz8MqqvZWVWKrBmq0R4=;
        b=qS7FUawDs0YF0CokUtLcf2pRaicifYiXj02bhMIQfEY/KqEisrhi31SzeHXYBHQMzq
         gxQcwgHA86C43RprZg5MNizYJDDmX0+tCmVrEZkJSUPsoUDWI4+gY/Y0k6IKVihzo0ie
         VsWXhA1/TgXzZnUHD3LW2P3DIcBtnd5zjCa1EL5O3AyBDQie4eYYUwaijSEnWyq7TkOa
         NmvF3EucokxlRvgvA79bWaFvm426IjCGoWHbbQ02iKuCkz9MiSytjmlKIJj+M0pGeNG6
         j1bTODt+CJXj6E6mol+dye9/cMk25vPuuSav3oiwotG76YgKoDWmPUbxCpH0Ogv7IWcC
         9OGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhvagFptMmik/isUOTo4DQUqK2PmrVaLufsoDzjTlsMlPYT8TRu6EwhIG3S8dsRaKUHVrqWrWCGyNqE/7s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LtTOqgSPShpu+qR1H5W+1V4F0J2jRa+I59U3+ejbNPwMw0E0
	7bFKz9WVvwYfytj1zVoWiJzBF3J0ywoFs91N0CkHN7IsY7UT4c30y4Z6Kb28G23rw+Fm2qT1rAM
	zezduVVIQ2ACn+rjV2rBJMC2JiqycrQEyhM4VuTLHzmJFi8XdwF4FS56nv+Pt8C+5voac
X-Gm-Gg: ASbGncvbmqcpCoqZ2mzklZMHriknmlcjAQCv1Gs204hZkgaSzl9icVSJpMNlJaqDOUM
	FQU7UCMOjYLVlVwhyV7lDmemXnr45YvbeFTtYYzGOIpfBgoSWBuSLP4sShgoT5fxQeKAFpS5Kp7
	s6ZoikDfbg8+jQ7C92jOwx6bGETpYGthxogb2ewdf5/ZTzdqSVmSXrMvPYokYsUqRQKgIdSzggs
	bRSMIrW/q+TkDKf1nzEvufILmpAsIC/uhGKEykU5JibuODA9jN8oM+tcYT/Cc+P/c7pafYzlIYt
	QNg/apsS+y6OvURh7ES1dGVReqTmvL9uEbZPuSZ9aNBeQWG3uriZBy7LzttQdafDgTjsq5qh24m
	QTqeYnODCeLytd5TcE8VHNCPV8Uv3qx7bJUlqscVM0953Z+jHkObo
X-Received: by 2002:a05:6214:1c83:b0:70d:843f:6b8c with SMTP id 6a1803df08f44-70fac8a7b89mr177520376d6.37.1756946058076;
        Wed, 03 Sep 2025 17:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGja7X2uK+OYgomkOzPWpjLsAEHmq25LEESvoGCpov8TlZrxYSLZ5iKF7ssAy+77a5qFU41Dg==
X-Received: by 2002:a05:6214:1c83:b0:70d:843f:6b8c with SMTP id 6a1803df08f44-70fac8a7b89mr177520176d6.37.1756946057510;
        Wed, 03 Sep 2025 17:34:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad525d1sm814295e87.139.2025.09.03.17.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 17:34:15 -0700 (PDT)
Date: Thu, 4 Sep 2025 03:34:13 +0300
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
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Message-ID: <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX1H+eQt5uzmyj
 gwXNJtMyGHqJUJOYVqf/r/3KdERK6+/aSAxyclesDMAf+8Pq5TGoM8XTMEjp4bzOaCuLxbjQgbZ
 pwbKeJmAs+VFv2gyFUkMsM2WBq03Zos4YZ/GtBpomc7aSGE4+n3b8O0QnLOi0nqlue3oU34ys31
 gWcpVwhzEZ1jlADkWBkWcRQPWSdMXQsFhs9lPM3sWURO9PRCfg7BpKlJqjOJwwy5oZn/ISntc0s
 wOX28Pvto2pzz6pvpKL7ZE+tRwNpKT53v3jg3in1Y6DpWxOKv1vT+43pLvFrOXr/pVnS+EuqMqi
 ZZVQyc84nSZ2R+2FaBrjJ2HWJi1tog1aUnv6kJD3sUwJNZ13brdF44QWvOb2Un/c+NYHe8+5pdx
 kqEUWZ2w
X-Proofpoint-ORIG-GUID: gZ_PrFzy9tspYt45QKjPtyhLs9sfIBSi
X-Proofpoint-GUID: gZ_PrFzy9tspYt45QKjPtyhLs9sfIBSi
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b8de8b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YChNujVLCtOUS48-0VMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> While SM6150 currently shares the same configuration as SC7180,
> its hardware capabilities differ. Explicitly listing it ensures clarity
> and avoids potential issues if SC7180 support evolves in the future.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sc8280xp-dp
>            - qcom,sc8280xp-edp
>            - qcom,sdm845-dp
> +          - qcom,sm6150-dp

The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
into msm-next-lumag. Please rebase your patchset on top of it and
resend. At this point I'm interested in DP bindings and DP driver
patches, the PHY part can come up separately.

As for the compatibilities, I think DP on SM6150 should be compatible
with either DP on SDM845 or DP on SM8350. Please choose one which suits
better.

>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
>        - items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

