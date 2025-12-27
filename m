Return-Path: <linux-arm-msm+bounces-86698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FFCE0280
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 23:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FB453013ED4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 22:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F2B1EFF93;
	Sat, 27 Dec 2025 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNueiVex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayCIcRbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A823ABA7
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766872903; cv=none; b=EnzS/GsVNFw9cjtFdTXiMJAq9vKcss87gyL8DBmqZE6knWZL0EgUMq2ZSlREznb2W/Vi02MI866HnoUXsobeINMRSWmk8MKBYbpID2n4t7FNko4iID8q1w484eD/Wls4H9+wwFEy1C6+H8vWWkDaEZkpw+d5Yz8xFhU3Djg6OGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766872903; c=relaxed/simple;
	bh=IWHa7LFv2rEkKl28MWNKuG1g5/7UOdjOTl2oRLBIuIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeR6Fs/2GdxYyzeyjLvoeq6gxzcmtLw/2lx70F6V5LIbhgHVAhEiBLeMAoHfqT1DMwzL6h3zw4OjsunobJ+NgIhOMLIfbhKecK0VqqpUXElt/JMdReAN9Ma5A671dgjvBDBl1x2iXclw0Zum58hrS+xGs7i0lZta/1eMbng1fBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNueiVex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayCIcRbA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRKHiZF1335837
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 22:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=; b=cN
	ueiVexldwqznBzp/R9Q+VmlM9mG6a/H7Hwi3ylen8dIGNHZc6kNvsLKYghVXIUGq
	PLq71ettTybVSNTgsQeMXK7gjIs2ur5FqxWdqqtNBb96g23IcLvzpLorWeQM6moa
	tWq6GUsN9+BhhhH9Z8Evndn4m1QDjbY5Kx+VkP82SceJpPIkxQtJgqB4Deeaz8Wi
	tzVwxREX32bfzbbgDZLgnohi78xhbHY3H7Opbwy0Y9X9GsC4ZYSdWuffW/KMl0Xf
	pncme/F/2uW8ZyqNAyq3J2y2vicp3LxWy/o4kw+cODyh3t91N9P1BIOKeHgreHms
	O5jQTUHa0lbC5/H735ZA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f618bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 22:01:40 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c7599be25cso19200625a34.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 14:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766872900; x=1767477700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=;
        b=ayCIcRbANVdFBHdVLnjmV4Lc+ANIGlY5wOpsf1Z/GNHc8DIXipA2Ux8BveJoHnl9uI
         OIY+k1G2vr8Yabnep9o7A2G9zQQjgLgDIvJiG2vZXLX+WwOE85zayiJB8CXkjOLcuQ12
         V6ZGkZ0A3ajzU7NqbZl3CB+r2AUo5koiyb+ySyTyCMHYDvT2Q2vVID0e1gJtb9n7xG/t
         +jJQ1iWEiu7xFrsTKdLEbVVGf1qhOFgvOWk7EqF0K32Bk81JP5gLbZfyRog9ffGKloJC
         mbKQqP0Tb88mAtcFjbEo+g5n5nLHAZDfJQdR1qXyKuGXp5Qp9N5G4UBrKHsIYQ/1qIo1
         q7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766872900; x=1767477700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=;
        b=ZHOq0TTDo+LvnyoHOl0at5bDeSKaaI25cfvrYIRu2J3b27TAFGkUo/UnzRiI0KeJra
         UdCR/Av2P8ne32O/vkEGAQjlr2mChyetDU0PYhXwg7ZRwdKmMWtYxD2jW3jH4mU+CNgM
         /kgtmeeDOZkexe2tMQLcOAnM4OOD7hIfxTwoZyb1W64KyYWDVc/i/S2WIVDMWD2BgmMS
         51heitCjnY+uQiaTPXE86AiaVKgxSjhKWEsTtBO/mF0S9pN493lt3sLzFFZSb76lwWSy
         DdBHKaKO7x4O2JUPhcvAWfB3M8x+UriPLsaaJ3oWq+cTiT/RTbD0upXvVdwYcgKgRI0Q
         5+OA==
X-Forwarded-Encrypted: i=1; AJvYcCWvWfqZVNb9t+IL0n5ZOP9NZS9hj68w/QDZkMBtItbuMhZ+tLsUXl5gGaDijVV/tWAi/ebK2tya7uziIMCP@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRo0PVAzVpyB5dpcoCzm7spJRXkc6I3khpklYAZJ3VzKIGxr0
	OuEo3yItoXYPXnABDF2s9rVeNXThZGr+/fyT+qBe81OdEbC/mg53QKQw2p0GYwkQG5NgFYIIQCt
	tbN8GbLhFc7w0D+E5hOsDeBCeRoidyHPn34Jj9aqMxjgP6bPTy9urpF0YGJ0C4UgUOL/G0hHtlM
	bk7aqv0v9TXz9DYosLiX3TQSIh3eckBCxwD2xRTAbgmoQ=
X-Gm-Gg: AY/fxX6Jqop1T401b7R9oZ0MpE0/Iaoy6uo9Ud9ssSoMMVcKXOTyWdVsFyEhsAS25Ks
	0n6TtY29AqbyoM5YaXgSZmSzbwQfkbxBedQCoAqkYT1PY6EZy/ND8RidFtZtb/nlQwua9YRkE6B
	UTigk9x77PsjpdVOgKfv5rKTuGOi+wXgpJcRRA0UO1ZrcPBvoDer8ToKxq46sdb2HZ
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id 006d021491bc7-65d0e94d552mr11403591eaf.16.1766872899881;
        Sat, 27 Dec 2025 14:01:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzb4zW4dLjwPdHMOvYj05wm+MfjPb34VcT9TsoehzbCF6wlzIIoa+dPdGc9MuUQSmkC9V5RnjsUikqHujWASk=
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id
 006d021491bc7-65d0e94d552mr11403583eaf.16.1766872899502; Sat, 27 Dec 2025
 14:01:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 27 Dec 2025 14:01:27 -0800
X-Gm-Features: AQt7F2rdY_C4YMdsNJkz061LDwa5bm0PMmdQw-ruVy63uR-ECPDsV4GuxQEQy3Q
Message-ID: <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: EQlUgcUWYHvPjYGsD8cJCevzjBNVrht2
X-Proofpoint-ORIG-GUID: EQlUgcUWYHvPjYGsD8cJCevzjBNVrht2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIxMCBTYWx0ZWRfX48XCEamk92VD
 gzOWYccfU1OKKQGStyUqv9exM2RJkkFpBVk/TzOjm6GlKBIRZjw8ZrEr8tbgLpGs25i9KcyKJrZ
 vyP9bc+g74wnK5J9qI4EtQ7m5+B9Ax8FKRaIlrmzeyWh2YGYkYq7L9CE7TmA6ZltWtmHVABpXp2
 23UOj/HEWDu/H81LX56U6uqB+MQn3X/auJmCnK+t3c+r2AhBpW2biu1sbZp76NT+AlAR/s33isL
 m4Q76StcJwF5h7W+/mWIEdR26chE9fCIQEd7WLKXNI8DqtLxb5Nmn/fUoQqAK76bK0uDibTEZIl
 Ywli74T9kZEq4c1qKMyFtiYZMpBYuRFlrXV9K+CWw/RjHSKKEdcJ5TWVPevcP6vd1dE5UTBJVWy
 akugRGb0JGPvWP3ilihERU6eoaU4bv8sa6bj1089TehTnN/oD+EoFMd8TCurxGYXnuLNE+YaYEO
 VJB+0hEIzFw5MqkHtZQ==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69505744 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4-z9Zx1dy9oFOqQo8oMA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270210

On Sat, Dec 27, 2025 at 3:05=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
> "reg" entry, not two, and the binding defines the second entry in
> "reg-names" differently than top-level part, so just simplify it and
> narrow to only one entry.

I'll defer to Akhil about whether this is actually needed (vs just
incomplete gpu devcoredump support for certain GPUs).  In general
cx_dbgc is needed to capture state for gpu devcoredump state
snapshots, but not directly used in normal operations.  It seems
similar to the situation with mapping gpucc as part of gmu, ie. not
something the CPU normally deals with directly, but necessary to
capture crash state.

BR,
-R

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 826aafdcc20b..1ae5faf2c867 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -378,11 +378,12 @@ allOf:
>              - const: xo
>                description: GPUCC clocksource clock
>
> +        reg:
> +          maxItems: 1
> +
>          reg-names:
> -          minItems: 1
>            items:
>              - const: kgsl_3d0_reg_memory
> -            - const: cx_dbgc
>
>        required:
>          - clocks
> --
> 2.51.0
>

