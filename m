Return-Path: <linux-arm-msm+bounces-51922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB0A688FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06252166184
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84A02066C1;
	Wed, 19 Mar 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvWuU1Da"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D11E1DE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378504; cv=none; b=jFypeZbr6a0m8atkbmuvgu/5PK72rC9ylW3WKQ8viZNq4JUy7gaF0xqQhNt8jrIlvR9t0BQZd81Jp09OpS9cyVSw8Qbit18t6dp7KKA47DEXU72oBzybOJMEU2kE5gDrZ3VV3IDX2KP+4eqxsh9w+QObNFex2WqbZtLE5YCGN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378504; c=relaxed/simple;
	bh=XUe+jsxf6CToNNlzFKXj0FuOYSurMgVx9HLYqUtrkAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2xCVhKo3HPMh5Q15WyPl2I5RYX13NodlgdKs/1zskNRVdEs5HqZtambpou5j97dHX26pihuqSFbFb5zy4kQUVziWlfugslR0eQSTnIy40ZMsq30ENNSJ/jPBC9PWHM+TyZ/6uTgt7+RQz7gTqQXN4+DmXxbu1SZkmVMSjP/uSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvWuU1Da; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lhtQ020631
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ar7fCbKOyGZpKMOTQA5T0v9
	4HfMi68v9XDsZNUCZ7Q=; b=FvWuU1Daaxee/BDGkLvLgqqvZWHnpWs/fPlhMvUp
	CQ5/POZUPHyvQl4f9sl2XyT9xOAPHlE+EEskQZPL8bNPpVEOeNNdLlk02SUFDCs1
	coOw1ypM/a1jqILUU88yc4gY47LhEUdVLnTmLrRlKguqtI8z0auolSsl+Cunh3Ld
	GFCyMEulA4h/35pSI610co/Zvl38EsMXhCeuKN9OuEVO2aK6y4sC7YedaPzgJEh3
	DHYMboN689VPlZJlrQar9CV5Px/ZOmQmo2mF0Qng/A0kyXwnkLV05p1AdYBkDlnh
	7lU5RMvnudsC+V1orFMKWProvBhXIiPKYYu4Wj8/pd67yQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx34wh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:01:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47682f9e7b9so113002241cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378500; x=1742983300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ar7fCbKOyGZpKMOTQA5T0v94HfMi68v9XDsZNUCZ7Q=;
        b=YHvT9RFYDTiUQb1b1KA0Bf2wkFMDPyoA2B+S3z5QmQpqt2K6qOoIYUFNwaNi5m+plf
         /UjTOzAeuuxF+ESS52/Pw5gZgJZBAsXF/NVuukNnYtlRwE+SCVf2wjI35Q24flcJ1YSO
         OqYTPIuFfBlPeXiSKHrsnYS9QindaZs/5QjX/DOoA+ltH6G95SyvP6y0msf9KjXvxpfy
         iG4Yx5IXHNG9jS5ynkL+wxFflVacfiWmUMy5dARYIpL2W1ZuJFYdcUIwJqJtjxOP5Pce
         TJRmrGaPRgtE97rSgZJBKvx5Y0vMdaSjhhobRA6WqBgEUd5VuxNXJbsDs35r8wTdLos9
         QNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXSInMF0YMv6uDxnty4OzI70QW9rUwfBq9IOruSlI40CKVK25Xw4dXv5KHTST/jIVbAl9mcYMib9Ml85oM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVsdZ19mBUUfJF9t/F1g/NCzIgjiRDjAoDX+1lIZcVabPmDoF
	b4DWob7e7yDISasI0PIoOdZa9DE6ne493IPNCFA+QkEb8/2U+vhWIvTl4yx5PFXoEJPQQbh+5dn
	D9nNM/HuJEtsxx/K48j3wMoxzg/8k6n3xS5IpeenGUcweYmHViFZA40Whh9Sx3Ztb
X-Gm-Gg: ASbGncsV262c6MVaq6M52UGAUmS7Lpng00WHNSmnPtFIktk5nSMz9E3dTx3jQwjsVf1
	K6Wp0jS1chm6/vM/73Qv8kahZQfgZeRPMKWISngAd4oLFjRDWORFwDwVhpvPwjKsJ+z3fvfM0hG
	TNaNEzfKWGvNgdOEH/ypJyLY5fDUQM/MfP77X3vVFGq9s3ecvCDfkZgEbmhztACvmAVT0f+SDKy
	LZ3Ce4BZ8+T0CsmH1lAa5D23fSvSofTWpKaMTeVcupMZBK4gntTG5Ls7OB4F/VdASgmEG1XpAgA
	693+UC3yhDIurhhaioPnbkAU4bCxO1gfwgKolAquopY7e1T6z0hSnt4b5xeHHXoxL93+fEZ/w+k
	cwpM=
X-Received: by 2002:a05:622a:198f:b0:476:9e28:ce49 with SMTP id d75a77b69052e-477083fa83fmr36529541cf.43.1742378500201;
        Wed, 19 Mar 2025 03:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn/8jRnkAWhCa8HlPDdGVL0sr7qdZWUT3wVBvjOrwpblEM6Qa/FT2Y56cp1uYZGIz0DEa7Vg==
X-Received: by 2002:a05:622a:198f:b0:476:9e28:ce49 with SMTP id d75a77b69052e-477083fa83fmr36528881cf.43.1742378499705;
        Wed, 19 Mar 2025 03:01:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8352sm1962602e87.7.2025.03.19.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:01:38 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:01:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, andersson@kernel.org, lgirdwood@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, perex@perex.cz, tiwai@suse.com,
        dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
Message-ID: <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67da9605 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=BBAQEGfUMlneDKUuzf4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ivFD3ah4gVI07xps6OgmET5z15syVgmp
X-Proofpoint-GUID: ivFD3ah4gVI07xps6OgmET5z15syVgmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=723 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190068

On Wed, Mar 19, 2025 at 09:16:35AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi Switch is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.

Is this regulator supplying the codec or some external component? In the
latter case it's likely that it should not be a part of WCD bindings.

> This patch adds required bindings to add such regulator.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,wcd93xx-common.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
> index f78ba148ad25..fa00570caf24 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
> @@ -26,6 +26,10 @@ properties:
>    vdd-mic-bias-supply:
>      description: A reference to the 3.8V mic bias supply
>  
> +  vdd-hp-switch-supply:
> +    description: A reference to the audio switch supply
> +      for switching CTIA/OMTP Headset
> +
>    qcom,tx-device:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: A reference to Soundwire tx device phandle
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

