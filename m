Return-Path: <linux-arm-msm+bounces-89554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEECD39CB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 04:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C0D4300762D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 03:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3570623C4FD;
	Mon, 19 Jan 2026 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/2KDSL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBOBcqJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD71E3DDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768792417; cv=none; b=kz62+Kj7TdgNb8vjw3OmhdvPgUhlRKGlC4a4/Vsxj/gOa4k19D6QXBVp8yR1DLp7s89TfvETJ/T7kYBo/2dQsMrEHbzvTcvky7ZZ8jpB6L2Ik3d5JllsGydbUYRkQjEkESjk/9fjry7ol9TUCZH84TOqG2mtj3AXhi+VbmId/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768792417; c=relaxed/simple;
	bh=yJaP3ZDU0VbbqslTx3U2v3HckT6v1tlTz0sWdow1EcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kruWahdFQoub+3YWn0HUXlCXHBvB/9bl41P6mCOwUUzkXf/mvAARQt29QowDr91I+QskKKj+QHKWtvtXFb1uTcJNQzoWQpQeWy7sBoYCebZ0oNF3ByMfIBPNVk1mpH/+hQUHjEaun0B46i0MoCQTvkucmdfFin7vUK2K8nY6woE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/2KDSL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBOBcqJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILGn5D3749902
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbvgtPeWZoKawED6AUWH0jnohwDt5nFV8+58M363DJI=; b=e/2KDSL0SZgv4Idt
	4n68ZjLS2dj2wW6Ul6YA4axvxcoYdZilx3d1uo7EJL6Z9azotfTAS5VaaEjLD9xo
	h7bt03HH/+AQveorGKM3PgmRPVvk3DpH1zOSRtL376T3gBBIddsjI8tHJwnhs3Cj
	n860vNDrehL/GW61UIE1809ehPoiedhSnZPURA6CaGAkwALeCBNYj5JWVVDVztLy
	dP2KsTCoKftSWj/mrQyKOTRwg/3gVTExV3R13kiWraIriNLyda33hqu4JbVGg9lP
	vR7kKaAl9bwmnmWnmGnstHFfiovNuVreLVlpQt3zE5+jIgR+9kepAj97p5dE3cWl
	wbVn3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79egenr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:13:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso34987905ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 19:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768792414; x=1769397214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbvgtPeWZoKawED6AUWH0jnohwDt5nFV8+58M363DJI=;
        b=HBOBcqJNu+L6caavPxCQe1Ephex207J0a7NbQpIPfqKWSedgRAewGsAPu9hKjLjKUw
         TGrHcB4UaekjH7lYk8WdrrsFBT1IyYfFiUeR2uJgo+5qixm1SCQlMcHp5jKuBqc/cjMw
         gaVUHzR3Xti1BOvj5pk6ngmtdAfE2zJfbwlub1TjCpyPu9tutJ0Hg1cB85RF0RoCSp/z
         3phvfMNR4Kr0zWHq7hwapuooRIEjcdf4mIgaI4yPDShAXvBa6taJTyWW8/t37FJzM3H8
         aP4FckI4xoWwklkT/5ezGzwxB2aZiGjeipUF+bCwrdeNNn6XcbB8YR/PVYOk5FN0xiVJ
         5iiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768792414; x=1769397214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbvgtPeWZoKawED6AUWH0jnohwDt5nFV8+58M363DJI=;
        b=JJtv2xRd3LHsNUXR9ulMr8OgvAhX0bMiEqxMLqFAHHMYP264zd7cyO/EOljZ6tzi/9
         AiuJ6mYVW5OxnHxS3ETVMHAyQ8p7hHexvdsOIJz2uAKN7L0B8+/Jt+yU5+xuUNEq3l7j
         yGI9IpVXpLXRi6t5tUYZPQAUILZPV2dLVtf0l1ZVDqfnyL3ZEM72fVu87ahRRfFiWU7Y
         m2nhlgRC2IZ+5j3VwEF9++QBoP9B/3pKr2GPi+jbbYbEYAKsvzQQLs8KjkVikB0kE18U
         1ZbInOpiNkUGKU1EjO392l/0Z6rKbDyPksxyhfDlGQ4dd2gN4rCIFmSzaJJapR96wmRN
         ji2w==
X-Gm-Message-State: AOJu0YxXsMdmxxo2n/WSTNx5VB4SL9qwKxxVNz8QS7lrUYn1hXtXxYg9
	X0XV7uw3VSizoQ+C3tcWJS+dwPyrdXNvKhWb0mLJ5kJDyxCI3U8WAr0as9rytnTt97R5zfylFmh
	SIsWVVfpko0Dv4JyzWRPzRaZGVygTLA/Qfa4nSeBc1HqChisZ29KdqvqsLmxhluB0iIJG
X-Gm-Gg: AY/fxX64w2VJJ1s0vTmv1jQ7Ex0BqHlqPCqnhVvMAURaxVozBc+a8dlTc7In2WQSp8Q
	b7Baz0NVsNQ/80xVVyDSw4FXQCR12jtBxGzfkTECXm8DM/Q1gWOe+OJ0MkDjlXRzb/72lk6b1+m
	pbOEK7isxQjyKBGng5S9ikn/gIU+8h20PWrG4FHxeLEPyjKVT1cqNmfD30nFJCieR7ZhZghUAE/
	G/FUDdeNmb67l7ZcitM3P+UK1xFqS0zSfSt0IsDvTUpuCP/a+EI++rhkaH2Oroh9UlMqN+b73Lw
	Cq90EXi30suk4MkVCXCGMo33+JTlIumhUH6sN2jx3fsM2HI+3Fg58Z3HtL0yzcpEqWjeAJzSxoC
	tzF5tiRFYGXqsacqvFBQgdGJemzEPibKYVZMt5OXf0yQzVOW2vrC7I0jfP7tFpJmXTxbSqn6KG9
	Np6rs=
X-Received: by 2002:a17:902:d2d0:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a7178099e8mr104818625ad.58.1768792414202;
        Sun, 18 Jan 2026 19:13:34 -0800 (PST)
X-Received: by 2002:a17:902:d2d0:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a7178099e8mr104818315ad.58.1768792413683;
        Sun, 18 Jan 2026 19:13:33 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb373sm63575925ad.72.2026.01.18.19.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 19:13:33 -0800 (PST)
Message-ID: <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:13:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNCBTYWx0ZWRfX4arlP8pKdVU3
 uKDy1cug7hW4vhN4+xsjkzFLy7ZNCsWkEHwnE6ohjHHQ5B2kjiWeF65iUryUYYZBb0itUoriGlh
 5A7WTz1vJtXt1D6kNwG46wn+xkJv/LYjiMdfYElzy2yRTL/ZgwXpVA1zd9IwoZ3AYf2R6TzctQt
 TCk3M2eE21MT9dWYXEFw5I5WJJhyZdv1lhZNWx3A4tbeug4SkFoRL0BgWQMigqTuZA2o6OpXyfc
 DVWYxbq0OgWmQAME0sg7Y7l8CQPn7pe2XSWb/cOVZ5FCrUWlVnqc4gvg+V0br3w9sweLwIwi284
 VgNB6slMwDjI6sIioQUwIovJnySy2+Dhgw/ihB+u1BlTrA+hBkBkwT7L0PdnAhTtc/wYc/b/lEN
 L7OHmUMYGUTSf9HQ2W/hK5D3ERZs223SC4lACOhA84i9hsmiaCxOwyybpn62VSsz3MkSe3Oemo4
 Q/8T0sXF47xYlOP0nTA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696da15e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E4a1J00B82a1_SpTfIgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9a2p1pGO2Wdk825onOzkaOyKQk1NyXwV
X-Proofpoint-GUID: 9a2p1pGO2Wdk825onOzkaOyKQk1NyXwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190024



On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
> On 16/01/2026 11:41, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>
> 
> NAK.
> 
> Warnings were reported at v3. Did you address them? No, you completely
> ignored them, so warnings are reported again at v4.
> 
> What do you think these emails are for?

This warning is caused by the pcie3_phy node in purwa.dtsi, which is not 
introduced by this patch set. Since it does not impact functionality, 
would it be appropriate to fix it in a separate patch?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


