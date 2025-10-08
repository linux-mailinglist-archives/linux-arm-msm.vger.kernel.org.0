Return-Path: <linux-arm-msm+bounces-76459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364D3BC5FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 18:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CD040548F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 15:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF8B1F8723;
	Wed,  8 Oct 2025 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkUW1Fc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9C823DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938861; cv=none; b=YSI/nRMAZBSc3WvcaF0uwmghjey/oFz6coakErdQ+1xFlweoqmGu/WlYMTX6mj4ADpB5XKbhkQkGwwNBwy0EHU6+/1c+beEFjYcGJRiaokB/bGuynMnvXDBBAoog5clTCirb/u4aq/armCQ0ialbuYbL7jlTbg2L0gVqdj7dEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938861; c=relaxed/simple;
	bh=fontDzsPl8l6lmNTuJ+hWqrLyNDfBne4+rzXzxuEZjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFPYyAOUtwDYnJprJkVhSxTB+xVqWu+UJz5Vy8j5yg1QwEPEzWWQg0Ftn+4KiwIjtkPI+eiUcmIdFdx85kfdAaCU8pnGM2XZrHv4168L3huwtrlJirzgEM8ziBHFwHy3kK5YAZfwc5cqosQZffwJR+vPmWaEOnAvlOtu4J0RwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkUW1Fc0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890WIG031455
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 15:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LE2fUidSmHSribNBEy2MhkAI
	ghJZNhUt1M2wqROseQA=; b=SkUW1Fc0E6PkWi/DdQpY6g48sxwJZh9WRl5HWW4p
	W+FqLoUaxDgKwG0906XJW+yasUsYRPH+lDGkkRzBeGi9DiUWOp+FBmleAqJaCdFi
	fcd5CnyuTnhDnzAaqPfad2BrmewWDJ39C0jBrMVYaRukHcdZrFubcccS/38pu54q
	y1cEBKiTXvUb1VE+rV03x98gPyDOSY7ka+rM78snG8sH5MThNgsH7rbT+i7Pvzg3
	5ifO/abyPFXKhHPu7mUXHu6PZ8mpQI0Z9+pw0zZMBBUsx535ab7nLWZOSX1HezAL
	SETvrWnRK89Z6epwmClBXj1clF1+wf4HGmD4OmoLRlorjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7u030-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 15:54:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d77ae03937so208439541cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938857; x=1760543657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE2fUidSmHSribNBEy2MhkAIghJZNhUt1M2wqROseQA=;
        b=tfC6cRvKnXFP3Il3AnStHFo7MBk0bEKKXGJpHwBjkEOrltenVmT7RT7wL+rIp1HaMa
         Szznag6g/DV36EUWHtwpl/OvV6vMWpsS14nf4rHGwUEg8ppd58W8NBxZpU33rCElzUW1
         by5GNogIMfYhZysbsH70JsmwVcfJfZGJ2MtDjoozOW6jMwrBdn0YjjPmPJq9Mj7WXT9y
         T2F7kboH7I2nIZ+zBct8U8DgEmzkCNXV4ltRM01h8wQGIQJ7j8Qz9B0HT+8t8uAZ2jHl
         amyz9ySUFi2XXLgaheFZ5j1xbL4hVBG0uiP/NeC74TZ1krxncN72oAl1T/YiLMUEiSsA
         864g==
X-Forwarded-Encrypted: i=1; AJvYcCVzZJ1LCJF48ZTMpnsuotZAdtzaciXzmFe2BxDvKN5nPYG6iPa3w9L/ILSVapNNTCq3kU6a9q9j72mv4SBc@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZJgBeaZHxJt3phYuQK71HtALWZik427pbsLdlrsFrLW9FqKG
	ZeVW5/z9z7GsVHq99OD7FVs+yVoRdOLQH6V3xyfAds7pad7cg5Em564yIR5z+yy56huyL9stGd9
	k1Q4TKenfe3MeMXIKUmsZ2Ej8PtJrXMXspJvtnW/VrpRtVaKy6eQKasdx54NCCLrBXisj
X-Gm-Gg: ASbGnctU5/ygTfsgtjJDOuz5NWqPc4S/OscBpIHkG+tgicD8hl0WFxrtCew8aziAedA
	ujErIh5dBBK1e627ho07KJA816yT3E5j566XXaBGnvRsA7W4ZWsm84TGBYLRdOOI3+lYgNmQzOR
	Mwvc5NL0aG9l8cnrdg3ta2cJBBCsSwl7/u498Plh1VGeHoAJit/YW5Y3ycHBUZDzFaPvmG2cGbb
	MOXMwpleKOmcXMkip0rO9NGZWD56rJouFwXdgGj4V3oI0U4ORY8GNqpyq2VvoAOYZSiNXcFmemE
	jMyYHjmu/vmvo5aUB4D+s6vtFIaJxtIjoeLQJS5grDj3pfYS7gYeldUpDbICJVAEyJruz7seknD
	Fpd/6jNUHN/MA/idbC0WXFzJXV73XKQ5hzlyw9eCsLjbuKMqE9FG0dw0Nkg==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr49493071cf.15.1759938857140;
        Wed, 08 Oct 2025 08:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvpXymT2Zr8z/4eTOthDjqXP/fGceLamBVGehb/FzKKGCG3gKvNiaUfAY1peyOGsUvFX0bMw==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr49492571cf.15.1759938856560;
        Wed, 08 Oct 2025 08:54:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00a83sm120303e87.11.2025.10.08.08.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:54:15 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:54:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: sdm845-oneplus-fajita: Use the
 freshly introduced driver
Message-ID: <visvxwdwh2mcympwre6kx7xesvsysdjw6j33kewwibzfbgrbsi@dkcilnw7gk7c>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfXxHHQO6cSj5bj
 ya1Ds3QRuh0ZLfoJ0vw4bygCfHA49cWvoQ4RVUD9EJrQzl8hRjPuyVt2sMCgpcaCIuYJDVXIUPY
 sstBbwv6q9nU8iVpfZOl5oKFM4lDnAWYBOHa/qSB6yvL6jpv5t/96LUaPHtch1ywzJ9h/NJwNLa
 48K3lqFKr4Fh6+eq6oBXJ2VYjOcpmbpazvdO2HNu7enlFk3NEaqzLqAo5qSzQ9veFK3OfMKKNaD
 fRr00GZI4iqJs3GHjSWGtE2IYFu+mV6RuBf+g+C3i5DL7ZHadBiuPnz9FV0QKbpRhxvlBdMQWkx
 VZkb1mszEHKIOZsJLtp8pkI+H8nXM7ec3i3h25wVymMpgipRa6miyzLDOjoP6jWXWmFwpiWIXBW
 8Nry+ZoN55ffs2sILgsrUIviqgIyOA==
X-Proofpoint-ORIG-GUID: BewB2oOl4qSBN4XYfPNIi6pwGDiZjsUX
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e6892a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=DPUHggLApdFq0BbWEEcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BewB2oOl4qSBN4XYfPNIi6pwGDiZjsUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On Wed, Oct 08, 2025 at 04:05:30PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Switch from older effort to support different panels within one driver
> (which already dropped support for the HW) to the freshly written one.

Please disconnect the driver and the DT description. DT can be used by
other instances (U-Boot, OpenBSD, etc.).

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 7e75decfda052..55b3e94dd9726 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> @@ -32,7 +32,7 @@ battery: battery {
>  &display_panel {
>  	status = "okay";
>  
> -	compatible = "samsung,s6e3fc2x01";
> +	compatible = "samsung,s6e3fc2x01-ams641rw";
>  };
>  
>  &i2c4 {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

