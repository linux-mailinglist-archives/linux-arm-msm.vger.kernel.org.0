Return-Path: <linux-arm-msm+bounces-84481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D3CA7C44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED7C3303023F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F00328638;
	Fri,  5 Dec 2025 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7m9HP1f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDvYPM6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59152DEA64
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941519; cv=none; b=q2bKhvW9YYPBFdTUrdCtsAYveMNOEwHCuo3ZGhcSgN5N7Nh7fhczuhbql+SEA/h6+e2ppsDsyOPaNleNo+BoXekQmyVaYuj3Rd4LwU7mKfesfOBV2aGfwNavXAXd1Z4lECIRqxYQNnBJGssKLrXhuLLTSvn0lcwVcz3PBbx8j0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941519; c=relaxed/simple;
	bh=eSiwjxydShfAqbwXia4vs6sTfn7VWhBaeTZ1sxJLJk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6R5fZkbEMrv6mG/8OAoL9v2ou12fGKbTdy8NR9HfIU1FQCf7838Ihpkuj/mBKgc4QQcvME8FR9JOsIwaaM7Fy223KtKxpVcC35OaRvbJSWK30psR9FG2J47WbP077xCDjqcJL9OkUENZviDuywKWyXREXXefNw9ddw+Fv6lEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7m9HP1f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDvYPM6z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55DIUC1917643
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUQdIs49tUo2Vw0zXbxQ69nd/OiCnomRFfhEIITIBW8=; b=K7m9HP1fuI5inR6p
	wXeRV88714q1gAsmEnhgf8xvi6yRxROKCcEHO55lSLSiWt3GnjwHCvOZuvcIwijP
	4CpFWeJ/bMjqtVJlSoUsNDFeBE6s681ddPMrwm12r2aj7d42XuAXcSkjhbe9Zo8Q
	ZiFCYpGxMytoPBVVz1g4WxIRe0p4UxVjn5tAzcDgArpxm6LvLU+XJope6gawelVQ
	OhbfMekbPv+xmhGn6H60aWUc8myyqSQkdVBwZe3pRc3uL+voWhTrVHLGrCt67kgb
	MeSliII19c6hvdcJ75nV1rswXy3XwqZ+jRs1bZ9kCdSxZBMVti+db+nY1ASSaZGG
	92VwCg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auec1u11v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:31:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9373377ff51so452630241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764941514; x=1765546314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUQdIs49tUo2Vw0zXbxQ69nd/OiCnomRFfhEIITIBW8=;
        b=PDvYPM6z4Ymr+JQ9pYj7Omo5YZmxsZPLZPJx2zmC7GlutcQsoqfAGNlH+rT8MLeLQK
         jQ0QdJWyK2KNHIDe80ktaiuIdLVdOGHOycM/DPidL4LK1bjXZBIq+D/T3594TPNOfkx8
         Kd7zr/YUNPvmFG9MDSojhbIZ4Lb1iaLYLEaUaqitV4Vd9FB8UvrDzX9XY3Sa7cbKrf4G
         hYPQNtdR1Jl+nWHxQZAdw1f9va1vIUxWDpjMXuJJGNYBCjJW8Ob24tND9g8cuHwVAkvK
         L1Jhx2ajDCpH/Pu76MLxZKjuyLf5mev8A44cxkYmaCFch0s0aJ9m6J7Cj6D/SQ7YcELa
         9eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941514; x=1765546314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUQdIs49tUo2Vw0zXbxQ69nd/OiCnomRFfhEIITIBW8=;
        b=Ouc7eNtc8byefrPlU/hemvNRv7wKJA4FiACcWPqhq3hEgmAuIg6s631ij0LWG1aThF
         o1WGLNUoYlcaE6Xi8bk3H3w51ouXczo4++1gRvQEokFIGAjpuW9nm6CaeCF//JsIYZy/
         SrzjtTAsNXc7WpdoclTRTRnPgiLYjwu6c7XGmgtkN8pMrRTvzkUOS0xKEneUgNynEiEX
         eyOU8UqjIo2DmnWH6tWq9shwJqIlzJkNrDgZXU9aQqf2Vy2qm1u2TpgZUCVFKLeudHpB
         Sh3jAX1b/uIYu9nwq/NUwJM9mUJGtwAPiPcKMULVmo3S6lwxlWXlTLXgzUHGsQ/g+rMe
         cEAA==
X-Gm-Message-State: AOJu0Yxo5WIcgnFtGHsDZCcqep/6pxbxAyCC3p4wPe861i5pPQ2wT1IC
	8lmT9dxAZaYdVK7Mdt2Ou3WQ5zhSPbT0jX9du0dpxieGWboy9GzvHjPvaCEtrFNl6PpyZS7/8NA
	4yjQoZtjVZe7NOHfHaE1P3F4fUyyzUg+1Zawgpp/hlEpmVcsuZAUw2VoPlztKniIkKIcg
X-Gm-Gg: ASbGncuaxtrRrCbBx7WgeoJA1Ej9K2D4CWsRzRcwUvZ839g8luz3AebtrLIqIS/cwNe
	zfHZCkwHNYKttiSZvHcpB+JACMWEUkP+923OL7KbEhztT4EeVSZXvRilr+6Ibxivv8yAsuDLMzQ
	beCWbR+ZODGtz1CorPruOAK1pTHIL93ky6iL/8+fiSNAuvHmgSVsIk/cGOxuPLXDHG2iuhOX0tf
	1BNvcjT1I2cmqKB5/jcVyNMPmX+3E8d+A9f9cIjnGTmqml1HLU6kNR7eYtQgzSpvd4MpVERJJT6
	1e3PBIMNy6lew/sLUB9pyNHhxQjTAeNC1K0a3JhofR4qKWaxNU84OlrZCRIWjzVZ+7UGHIEBXir
	myWgbtFcyDunP1j5Ftv5YYQYs5SW7gQdZt42d+iqZFQ9lp3CVfqn8WnE9G/QuiCEpvg==
X-Received: by 2002:a05:6122:804:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-55e5f65ac7bmr1440638e0c.0.1764941514072;
        Fri, 05 Dec 2025 05:31:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIP19+UfEnX6wbo3VZlXqWiaS0KkWuEmbm+7UJoS4tYldEo6+X+0Rg41ZheRbrHG34I5XZkA==
X-Received: by 2002:a05:6122:804:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-55e5f65ac7bmr1440625e0c.0.1764941513642;
        Fri, 05 Dec 2025 05:31:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368de11sm3690410a12.18.2025.12.05.05.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:31:51 -0800 (PST)
Message-ID: <755b7579-757f-4ced-b3c4-39c20e6b25a7@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:31:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 squelch detect param update
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204044644.3072086-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeAZjyE8 c=1 sm=1 tr=0 ts=6932decb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=82mjnoTymtVJHuoFAx8A:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NyBTYWx0ZWRfX/cntX7Fqe67Y
 bnHytaHAW5kV/bE3irxkvfRV8SR/3Znlzou3We4DY8HFFwaVotnjWDUz9SG45GzKgEYqLjmoM+0
 vHbagCV2SKAIcZ7FpKE+tjfG0AiD+BKxjomUrP5nx5vkJ212APBDTV1KqWCm9OAG4nBWXg+WHlu
 yYfSjbAGs8qCiVWBb2PR7TfhP7O3+/2mCSrbdKpmcrM9UAmYhyRe49Jhco/AsmUyp0mbV4mgGS3
 0KssfHNqHoHsaKXTzx4BocbEEOdq4FizOqaSs6rSVSB4QI1Hx12ill6K5gW8e+fxYmN751RBzpU
 lXSNDaeQOQWLBxHaPdYRZzvMju5wFcQn86yumw6kTVjFB12JjEcnN0rAPzv0ssWb/FL4AfTM9A6
 r5IhpvkHTL+cMA0+S9RmE9JwGT7Ixg==
X-Proofpoint-ORIG-GUID: LNZW0AufYoi7i8Bwp55iaFUbfx0h8oCV
X-Proofpoint-GUID: LNZW0AufYoi7i8Bwp55iaFUbfx0h8oCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050097

On 12/4/25 5:46 AM, Krishna Kurapati wrote:
> Add support for overriding Squelch Detect parameter.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index 651a12b59bc8..a75b37d4e16d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -37,6 +37,17 @@
>  #define EUSB2_TUNE_EUSB_EQU		0x5A
>  #define EUSB2_TUNE_EUSB_HS_COMP_CUR	0x5B
>  
> +static const int squelch_detector[] = {
> +	[0] = -6000,
> +	[1] = -5000,
> +	[2] = -4000,
> +	[3] = -3000,
> +	[4] = -2000,
> +	[5] = -1000,
> +	[6] = 0,
> +	[7] = 1000,
> +};

I forgot to ask, do these values apply to all of the supported repeaters?

i.e.

PM8550B
PMIV0104
SMB2360

Konrad

