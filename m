Return-Path: <linux-arm-msm+bounces-76086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A5BBE65E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC05C3487F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28272D5C74;
	Mon,  6 Oct 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct9bawa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BA2C21EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759762155; cv=none; b=RHk/BGqdwPKu43fJVNNt9MVFAjXbY1Wou0IxDcNIRJUlZK5iQKqXQwN9RKDqlJ2g7YM1lYm6jKofHbcIuoPZ/P06oh0fD2iLlSAU1saLMxdwy26fl1smKHwg0z7aI0aUwWyYrWU3MBTxJdK+4WxcYra1PpjD5zXaSbkKTaz+7Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759762155; c=relaxed/simple;
	bh=DDdvduZCW2Z8nIJhc94MFo1mRsBdxFtkFQo+vs858Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szHsm2mlX7CJxXp72jVVXYuct41W27i/juZokfpw4m3ZT3hf5xYEU07FCndupK6o+H3ABfcct8wEDscAgvQa6VAnUGggVuJUaT2xuVynCa8PovQyRMaRlDNIeJpp5ejiOYjbh6867+c0Jv7UdzYSbCn4MMc8dLjfENt8cFFDwHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct9bawa9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EhYf8018637
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlE28KeTREk/lFa1EGLi+mQhvzWeHGPa3L+Ltm12oA8=; b=ct9bawa9MKiXxQWs
	adMkZkOWEpv+XlRF3fhy3/MgRXxYy+XYNWljAao8TLy6MG1YecClgGv8847AFoMb
	kjTzvAwFCXdHePEctHH6vtZlDRnosDMVstbP1oOmVcgw/4OMb07masaFPyKk8mtL
	PA2B7E0/FZ+Y65WOfcYluWHA0127mAMcwoFfvXq8YHjecZUzPfUzFaJVuRQNwA8t
	xF4etEC1qlS6Rm5G271eImmbo62a/5Shjyu3HQdMBPnhXkfh/xLqCtovZ7KPOypc
	lFWH+iuvAH1WIOho4+Qk+RYpVpH7MmdAD5mIbWo2RC8Dyg+yADfLn6QeCwkO6Cxs
	miPKcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhkyvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:49:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-81d098fee40so8721696d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759762151; x=1760366951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlE28KeTREk/lFa1EGLi+mQhvzWeHGPa3L+Ltm12oA8=;
        b=PGlf5H8tj0gDgFCXqpk28U00uDuydGmIuPOxA86SgLjYCryX91GsqovqHTD5Tt5eJq
         xOaE4nj0R453xOqctnHK/xOpup1IxnO+ZedcQLC2tq3LDNEV4wcrSnaxI9Ih5DO7rNib
         rhF6Ev8/oESoWBXLcsF7Ek/31CTs9RJu8Lncu/ldhZFqW/FMaOLHyB53wCTVM3cakKMt
         EibcE7Wa5rzJApg9GyEyOY9+cYmBMqaEfn2PJ2ZvbiGfWhdOIM7IRQE4GVKxrJtC4v1n
         /FI+ryteEkIOVJXLKU7NjW1lkChf4wXnngVLJY9NFNsCcXvR+LKy2fDJzA6EHzM+st92
         NLqg==
X-Gm-Message-State: AOJu0Yx8Q56zwwxpdSQUlFhdEtr4NNuRQF9fxhXYbGpMyDx4VgZGvpAV
	pDcpfscjO6nUDF/NWr54jZaKymUTV7nA9RK3YftyChMoy1813ZueO0KIxThuWBCF9MyqObi9nIi
	09UhWnjej79Z4fBUZKpS5FV8eesupgaNxQaMxJ10IV/eaFdqJBp1LvyafaaoTI7XSrffx
X-Gm-Gg: ASbGncuH+w6Ez+wDmwYcwVKHRqXhO3omCwUKiXJNRP1yvwuxTSdUi9s2LV3/EVjFImB
	JXaqYhisK5zq6WrQKW2iU25aIFOsYj2vtWRFIFLZYunEiDgdMJns4aVzpcf7N4zNYqjLhDmar8t
	jyyh0KwBuX9RmB9BWyGpwZhAVTw9Zpt3DzQiwpJFVKip6zMMO67GkHrAdtKva+1+TLDtdoo240y
	pN6HlMnU5Y2SPWwYy1pV5IWUlkYp5+AS1t5xxm6J0fnFCFF8fa0o74NBze43mM0F1LTEdEed98r
	woH/mJkHGr88lQEh+mDx2BsEdkAl7JwrtdcOY99Uv4xKlQeZZOkJ9UFZSEkHv0CMCNfs17OsJ8l
	z+x9B7hi1qoMCz/SJaaPQG5ibcnU=
X-Received: by 2002:ac8:5916:0:b0:4cd:3f47:9786 with SMTP id d75a77b69052e-4e576a5d012mr107775221cf.7.1759762151090;
        Mon, 06 Oct 2025 07:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsDo4zO8lELfurbcAIQw2WuxQVGEUp+4FMuw0QWdzjCHovaEMKDgTH+6sh93R5GKV6EobpzQ==
X-Received: by 2002:ac8:5916:0:b0:4cd:3f47:9786 with SMTP id d75a77b69052e-4e576a5d012mr107774921cf.7.1759762150515;
        Mon, 06 Oct 2025 07:49:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1169018366b.42.2025.10.06.07.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:49:09 -0700 (PDT)
Message-ID: <8a5eecdd-d80f-4955-8ab7-cf6fd991a3b7@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen
 properties
To: foss@joelselvaraj.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-shift-axolotl-fix-touchscreen-dts-v1-1-60e26ad4e038@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250919-shift-axolotl-fix-touchscreen-dts-v1-1-60e26ad4e038@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfXzgQr9LAzL9Eb
 5qkgmnp9uVjKfBgd77AvAdGpyAEO5S2GOPalI7yfsKhY3cWq+w+GZd4sco65iHZZjwyOwQSqDc+
 6k+qt+l2AXa29MwTRScIICjHf/oDCWvX8PlaFpz716CsVJz2PrZ3CtwF0iTVxjxNx40eEE99289
 gzvhzm2j97xpv5XfFX/p1z6/7rZKox+EdBGDTVe3pyWC+6YTx2daqlKeViNfCpzMdaVHZ3/Wu6l
 oJ9PsV1RmnwXTTwzppzP38ekvTB2is46b7eU+qQeQuMChJAbo2JyXodKXJUzIWEAnb1soOZyE9P
 hFaI1dtR87TvZ4xNU/3FQJqg2+5TQn9SkDhqKcfit+39S3UcxAYmDnxl3HITsaMxU3t1HkWu0YT
 ClzJy8jUzsczLpxYF1JjisU4hqVozg==
X-Proofpoint-GUID: eu5frIPIZF-Do2RUCiKxZiMgTZYeup89
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e3d6e9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=pbvAuR7eWiNa6Kevsk8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-ORIG-GUID: eu5frIPIZF-Do2RUCiKxZiMgTZYeup89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

On 9/19/25 11:02 AM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> The touchscreen properties previously upstreamed was based on downstream
> touchscreen driver. We ended up adapting upstream edt_ft5x06 driver to
> support the FocalTech FT5452 touchscreen controller used in this device.
> Update the touchscreen properties to match with the upstream edt_ft5x06
> driver. Also, as mentioned, the touchscreen controller used in this
> device is ft5452 and not fts8719. Fix it.

This is a little difficult to read, breaking the paragraph somewhere
would help.

> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 89260fce6513937224f76a94e1833a5a8d59faa4..d4062844234e33b0d501bcb7d0b6d5386c822937 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -434,20 +434,19 @@ &i2c5 {
>  	status = "okay";
>  
>  	touchscreen@38 {
> -		compatible = "focaltech,fts8719";
> +		compatible = "focaltech,ft5452";
>  		reg = <0x38>;
> -		wakeup-source;

All the changes look good given your commit message, but you dropped
this wakeup-source property without explanation. It's fine to do so
if it's intended, but please mention it if so

Konrad


