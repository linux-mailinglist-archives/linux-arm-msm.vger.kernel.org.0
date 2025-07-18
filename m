Return-Path: <linux-arm-msm+bounces-65612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7EB09ED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B587BA827CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2B6295DAF;
	Fri, 18 Jul 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl8Endv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C72957A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830000; cv=none; b=W3K1q97RAK5srTvoPieURwZVaxrAiuUWLRaub0Ow9tOZw8JKk+gkWIKAGFGqT1H0YD0JSmkX+FXexpVt4mw3dHMu8rk4GJ4OHdzDAo4JouxX2majWxwQQywSsSHTWrGbdo53XPajhny5R5azEEorYHSVJ21y5VGt1yWqlPbtJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830000; c=relaxed/simple;
	bh=FEsohNymRGiyNhA4nSjJcgLjx2D983xd9vijBWt24rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otgrSq2bxxq8wjFkpwpmZU7JHWTD8MQN/DxEkKPKPDMNkzDgRoVNAGLaDOs5FdSgJdkK/qWth2ELw46L0KJxy3osrnCr7SQXga4QF7UHUf/+Ut6QpLsjRNH8yzSXgwHHZ7ITdArOYJm5oZM8P5uGsGsZ366Ngyvqbc3vEEi265c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl8Endv7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7dx9M015613
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XqdkQsTPxt7V80AMIAUMJZ7h
	FhUw+ACosjR1rjJFwmE=; b=Gl8Endv7QmU/nfL9/gxigtJswfLUlhZ4Iwh1dDO4
	paXBCU3B+06ttzNQeNYGckeAILV8ZKJC+9GWp8rHC6QdkhjlPbMpnFF87Ydn0rSp
	uBpodt3sDBgUZKGKjNTcbiEOP3nTDsHhTXzu++A4CRWS8ln73SWDPyLLjmAWZ2uq
	cgOa9shKAdCX+Wu18jJVwSSwybBMlZEMjYpKLP0O8SwW3H6bzbh3/HMjUzehhnsd
	jB/d6ij1WIgOMtMZgBBLmrjzYkBKEuU5Rr19ICBuudipoE2EGiMG6aT7iJyPvu9h
	DxOZLJvrLLeP17Dagpufn9vJSA+cn6sDMk3Qg9ZHkNSR+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dywuvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:13:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dabc82916cso306820885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752829996; x=1753434796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqdkQsTPxt7V80AMIAUMJZ7hFhUw+ACosjR1rjJFwmE=;
        b=A31ay9dYjTAgOLdH7DFRDHuNyz0CdKMMkrtpdEUvX9mAaxJhAOXbYVbVROTVqDQkKi
         sKF6Ea4uQgDkVe0LATBCKjy9BTcmZJWGh21T4Gyf5X8lUZGdYOu0OK4TKjh60hUl9us3
         S/mpkKRf1yZSltgQAuiA6e5C1SMAb863t7/UaIdEizlfm3qKQMjGRBubwbZcBw/cOK8D
         zjKkHD8z05i63Oj8FzOlwysokOHe8RrQbi/J+lKZwMno3oWAiF5tf/DNFcAoSCFZPQgy
         iY5tU5opdZZLBhq2HUffwUenDfmR4s18tPmqTa6sgzXvkaGvAwZhdYifSsKxqNmbKaHW
         XEZw==
X-Forwarded-Encrypted: i=1; AJvYcCU3uw1X1T1lZcvf8kPCAUhh6E6rj3eaDwjPc+C5Bxlb/T/k2k3hNgbR9wP1q4PwrftbqDJjZiobIy5/kbGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHxr86KVYzxabeXxHuiIk2PqJerUcpFCv9zRTnj4u9+XD+N3Z
	kj7Aa1kF6+YG4nG9fWvsHXdR8U9DD89aB7qs/ukvG0LwVxJn/e0rnisE5giBjwB4kv84K2Oq7Dl
	WiQS7ycFxG4o/jCg82R0TDLinzn2QHuvFxbQN1nmReAImg2ajv9w+bPg6GrsQNFC85Y5Q
X-Gm-Gg: ASbGncvY1bsnYVmayUlTPPmFdZJSUCFvNKoHMdRV+6xYZKd2+O7geA9Mu/aNXIEDHoB
	Nwvp2hDic2+a5EY8nHUHP4qnqJr92p5ZRUKRuDbNPy+cq2y6Oo5BXqjLmfNWyLQs48E9uSHlYbL
	d3RQk/KbvHJhhenbWLoa3YUSwL3CB8lKt4DDcXLrzr8e48GerafWpY8Q8t+qOWyFcW8wPPjo4i5
	qPUmrfJJhXM0TRFn8/XGYxYhU/UcmzI/AuUvmEZCQGIMRmqco25ExiDTagYaorjyT3QZuxBebbA
	nbxBA2PP9tz1zNZbkRBgqo1anFbtndnvQsBpmvQsfYM8J82OwRnEgGDvO4f+p0PKdK9C2fsvZP1
	i5lAjJQ+RRPs/ezcspA9+7z2e3gup1XN2SI6Qlc4bE3MvME0mQJ1y
X-Received: by 2002:a05:620a:63c7:b0:7e3:2cad:a101 with SMTP id af79cd13be357-7e34356ca74mr1333187185a.16.1752829996382;
        Fri, 18 Jul 2025 02:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU9LSFJQqHNFp5kpMH5LhaMG5b/m+Rc+Sp3X+lOp4tCy8yEj/Le//csSQhKYGhEm/cuwKrQ==
X-Received: by 2002:a05:620a:63c7:b0:7e3:2cad:a101 with SMTP id af79cd13be357-7e34356ca74mr1333182585a.16.1752829995802;
        Fri, 18 Jul 2025 02:13:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a9104896sm1502151fa.36.2025.07.18.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:13:14 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:13:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3_4C79LYfWlRu_bBROR-YLagLyEjqboW
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a102d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GX5c02JtZ_BarTZei1QA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX63DgvhV17OqG
 tnhZUXM6bxO7EoBFCgBzIuY7n9Mt/6Esccj2Q/Ng+p0k13LJ6tUJ2iiDwQlRncyIHKqf7/9dphZ
 2Ci3ZYMbGdXGWkR3/VSPawPf0YjevmhfxaiZ9Dei5ceFFl8OmbwKd3qCZalEcqoCbKNxm73vkW1
 INcUpyofBCRGoBLr5/gzGCM73cg41/1mkPtjBKIYqwwQxywWzuk+jAkBT1KdkqJC2HDbHhnuaPd
 8+s0cPnXhtofpkrt2TA6aqt7qRRVTFwLGXDY5/4gYLzGc2sbWQqCmFInA0qgmLPjZUWXcXUo/NE
 jjPcBHjvXh3fKRxqXTzD5HeG4/XdcXL+ecKpgxxckUvIywJdlq2Y8S7T+k3KEpTBsNGdAfsxFsq
 nDVmGWxqd0myUrvaheKEUjkx4hiPj4NxPQmqGoxFx8vnuhZ3u11VLT6wJaz1AYWRM/zFPQfi
X-Proofpoint-GUID: 3_4C79LYfWlRu_bBROR-YLagLyEjqboW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=809
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180072

On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Please fix the patch subject.

> 
> Add x1e80100 to the dp-controller bindings, fix the
> displayport-controller reg bindings, and drop
> assigned-clock-parents/assigned-clocks

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------

Split into two commits.

>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323b..4676aa8db2f4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,6 +29,8 @@ properties:
>            - qcom,sdm845-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
> +          - qcom,x1e80100-dp
> +
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> index 3b01a0e47333..0e699de684c8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> @@ -170,11 +170,11 @@ examples:
>  
>          displayport-controller@ae90000 {
>              compatible = "qcom,x1e80100-dp";
> -            reg = <0 0xae90000 0 0x200>,
> -                  <0 0xae90200 0 0x200>,
> -                  <0 0xae90400 0 0x600>,
> -                  <0 0xae91000 0 0x400>,
> -                  <0 0xae91400 0 0x400>;
> +            reg = <0xae90000 0x200>,
> +                  <0xae90200 0x200>,
> +                  <0xae90400 0x600>,
> +                  <0xae91000 0x400>,
> +                  <0xae91400 0x400>;
>  
>              interrupt-parent = <&mdss>;
>              interrupts = <12>;
> @@ -189,11 +189,6 @@ examples:
>                      "ctrl_link_iface",
>                      "stream_pixel";
>  
> -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> -
>              operating-points-v2 = <&mdss_dp0_opp_table>;
>  
>              power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

