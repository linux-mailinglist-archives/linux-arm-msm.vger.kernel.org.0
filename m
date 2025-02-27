Return-Path: <linux-arm-msm+bounces-49645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF7A4782A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFD616B564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD17225403;
	Thu, 27 Feb 2025 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnmlJ1iS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0942065
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646042; cv=none; b=r1IcwmBH/zJYvAxIxDleJ6mIiPrCrgoPNQRzuyC2jiQpjPR68xAd4pdW37Fc1+JOzKqqOYiloXRkfvomPsZlpNNm0gqhGsd0z1qbDyASwEiMY6o2CdfOrMS2b+A4JnyuqPd59wWf08319FY8WCgZsN06CPMVUjFvGEQCusm0SzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646042; c=relaxed/simple;
	bh=i3wWe6ahx0nNYsdmrz7shy89KbnD0dzmfCNsWOogpJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqqKwxM9eClPatsU4dfy3f1KlJA5gHbCkytmwfHxNL4tXrn2WJSMhdMgJFX1f91sqcqg9Shah5reqdgV8F/EL2+fDp3GlW6+Ys6VxK3utlES+5B3RJLy4Ngn/sC3UXxRfBrvwRDot8bY7x9GFUblbfcy9+kU25Q3BGqBFnHLXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnmlJ1iS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QL9mfB025285
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGYRnAFE9J8dyYPOqeyvQzfEJJ9gyHSuD8SyRueTGg8=; b=FnmlJ1iSkppGX0of
	ovRe4Ynm5u+lnllk/9EYxSLSoy5jw/rtxW6hgpujapVHFpO7gL8PYstwfRPrZU/E
	ywHXl3xx5kIhSa3ssL5P7Z3aZ8o5g5o9QJn/j0eT8izlIW+rERR1j/ZmZZ8m6uL3
	o8azSsZY95zhzayRxKGlr/CdPhFCQQroHpGWOIyVTUgWoDgO6GIQyfDackQy9pcP
	Flz0HFH3hyTaqaGu3mZsB+JkRKAMAEMdElmCSXPQ1HlLXe87IGX783fi0pvFrI1+
	pObFeQzXldj25dDniAfi/CG1ze0Msv3fABikgyRo1B+Nbh3tdXaECCD6ZXVZYGFH
	Fn9S9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmmxmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:47:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c097c2e602so17601685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646039; x=1741250839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGYRnAFE9J8dyYPOqeyvQzfEJJ9gyHSuD8SyRueTGg8=;
        b=EeVwgJj+hxC6vZgY9whkLBG0z+oNHKfbBSu4HsYsIQZwLYwT8TLbA+haB3QTfJiub7
         +sZOe7kG6wKagZax5HL8qCfPudZvr6q3xE/wGw0u+UizEXOyn6U6G2ZqbfLFOf5uyW1A
         CLD2ADpipd9r0c0EVtQ1TwnJKV2dNsj05NAsn7aAQ1s2RR3wljxyU1hLHDroQ2DcMWHm
         HTylGO2JnZQKFcgkJ1aVa04rrtuWZTqBtYeKpp7TdGunk1J0w6Oz67pYO0A8GwLn/pQQ
         v3RNOsz+muIaS/nAsrj2t+yHoiYXlinZvQh70xUk4uWSMzFaEfDVv1Re+8cRHNMiFeJD
         PXDg==
X-Forwarded-Encrypted: i=1; AJvYcCWVs7cA9VqdE4SBMV78kMeWGqkAMV+FiEdw6vPQkjpD3/QdhuBbNVo+r+FaKp0pDzW+VeM50L9XR0cdxVyW@vger.kernel.org
X-Gm-Message-State: AOJu0YzgAKelur9KIH6CC5RSzqkPad1T4ZmHVbKFsLW9GYW2O7e86e7l
	3ZajMewpNFpBZpNCgC7rimVYQuNeDgngr6ijrOWVgjHaLE/4Nys3m6Z0V+ldr1TAC92685TdBgP
	7JjBy/xSmOMDgAYsf25D9bJNSHJ9WkitWaCjD3I1vykn/zKrCP5CbcnEGl3fIolAW
X-Gm-Gg: ASbGncuXy69Dx+LA/FnwPoLKGkpYw3glpHKYBCcIud0NCJnpSELglfFeHfcQ+zcuMyw
	ULFmTK///uw4IbtwAOgNl9ijB8TM469koxw1URVxsr3O0V+9C1/deKiuaOObGlWsBn3dEGZIwyc
	LyQVlqvDH04OqoypneAQUNn4bceUnes8eEXIzg7IBfP/QmPHB654imK1rnMLJFBUE16uq5DBloR
	V37sWEEyepoB3VUyxnaMCQ3EweDRxmXv2mwyJgUMqYqPvq9ulHANK6wzKwyObW68pQuJV3Jj0v0
	Opdhj+ZaeTF6hb7e2NIbgEbF5aFnuppdDfwszEeLrH1AKfVWry9dFXcrv6+0XWue2F8m2g==
X-Received: by 2002:a05:6214:5851:b0:6e8:9a89:b248 with SMTP id 6a1803df08f44-6e89a89b5ddmr3406926d6.1.1740646039601;
        Thu, 27 Feb 2025 00:47:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGBKDa5jKaMrMFMUtLLimq7Kv7aKbeI1R4WnniZsF+zqBRHKHZRtVkdq92ChRGiaRoWmBWBg==
X-Received: by 2002:a05:6214:5851:b0:6e8:9a89:b248 with SMTP id 6a1803df08f44-6e89a89b5ddmr3406786d6.1.1740646039230;
        Thu, 27 Feb 2025 00:47:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ed7ccsm87625666b.96.2025.02.27.00.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 00:47:18 -0800 (PST)
Message-ID: <38a66de7-db0e-4c9d-8cef-48fb64a80f34@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:47:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on
 external DPs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        abel.vesa@linaro.org
References: <20250226231436.16138-1-alex.vinarskis@gmail.com>
 <20250226231436.16138-5-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226231436.16138-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bsoONzOXibvloTuQdKt0RoHZLw-0fJ78
X-Proofpoint-ORIG-GUID: bsoONzOXibvloTuQdKt0RoHZLw-0fJ78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=812
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502270066

On 27.02.2025 12:12 AM, Aleksandrs Vinarskis wrote:
> When no link frequencies are set, msm/dp driver defaults to HBR2 speed.
> Explicitly list supported frequencies including HBR3/8.1Gbps for all
> external DisplayPort(s).
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

