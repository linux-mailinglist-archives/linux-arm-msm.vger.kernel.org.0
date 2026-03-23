Return-Path: <linux-arm-msm+bounces-99177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KhrAoUOwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8AC2EF7FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CC37300E177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7AC387361;
	Mon, 23 Mar 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxzKNDzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYXgK23y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD2387358
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259826; cv=none; b=XmsnMt+8kiGOJySAIwp0sAvChBBX5NF+I8bUL9lzw4VS4UDZbXB211rXtqVI46hi3v8eJAvJ3y6V/Tuc1+R+QC68zOaUlPx4Ir9DVCh7ptzRdhSaHVIHJJX7ygMePB0LPMRFpXtkHZTbkE9Af7iKZFOeCWZPgNd9QkEVidCeasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259826; c=relaxed/simple;
	bh=l6SUlmw72Z1obSDidpLnagoC23CRG26xGqAcaYvT+Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkRSp3ESFsL/Is//BNNnsUq6Zzn27pgBPDuMCCTlcE4b7S6n6He4GbjOZcRSjPvtmf9bqGSnh0WmR+YOnyz6l2esTEAJdbaOaL9dl3MaWytG1hTgzkfsJBFKdE36c9im5Qt0ABi6foOwI+SVFaFR/jpV7HFux0ua1ps8i+/CIoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxzKNDzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYXgK23y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5VcU0930002
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=; b=mxzKNDzhvCQ4cOMH
	c3bg/xSB6XHnYlrqgFJZx5Qf74Df2qeN5Q3iGufWYs+gtg3QECnFAzmFEKOvR7Rn
	z1YJN4l90zxPDQ4y+LqYn1O1vUpfIiIdQJX3nbQMrCZMy5mEUQKTsLmbdVk4luXz
	34HOSjGW5gAOikjERDkGz1ENJ7y5TArxhr0DSQLvyDq+iZV+xi1Tozm8av50D3cK
	PR+jMCrnPySvBdeeayCHsVphFFvxMy6mKUgq+HJge/qOtDC/6ILiBqpG/n1x0D4T
	MbmzZ0mKlKMR9CzHlYgZlK8p1CzXMFZrFyQP8+5mpexjB3iAZhQefn9IWG66Mlx0
	oAVtzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kducsn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:57:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso25414511cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259824; x=1774864624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=;
        b=LYXgK23ygBaQmoKorNJt4MUmp4LgAiae1D28ypK/hH9nS+2DQO2RpPqMSCF2dtPhis
         UYGUmp4QxZPBUHaMyuC/rjwz1WGKpgwEaxyDsJi8g22ho8yOQr3bbBl9c2S/W6b4Qrxp
         x97EMPWCAUUYXkHUeO2sTgNd3txTfNomiD/BEy7ZR071uLEU9DSDe8YW/Aafl19cnVVs
         NRuIqrzzCkJiS3bpxw7lNwGT6zVfobwUNGnn1E5twQPaH7mP11GH8G1c5P1OoOzQ41uV
         ueJtX3W+sGNBV3F6F5bv5zKP5LSV3Xn7cJg6u9MZyYpRiPI7mmQTwK1UCphGIamEzY94
         RLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259824; x=1774864624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=;
        b=Fdj7yRgOeNX7wvgzRIcS9xqLiK+qhTwsM0dyI53xSfsQlxCOFiBtrd8rO36YyOJXHq
         aa2XQos0NA5Q/sbKu2+jvst2hC29WY0/pbDSYzjIFH/jFtafPOLbM5oIp1NLSm4zVhdB
         zAaqUDBAfu4RFiDJFIB2QtFdbfXbje+fIs0BgiJnqVbIhvFccgfuPTMLOIz0R1+ySi2a
         vciokoD7ptfG1tQ5Pct04p1SMmGT7w6D0Mhu4eQczQlNOuZdEh9JeJdJe6MeexL3c02u
         EIf/bsCydVWeMT7+6oVjaX/1QTtI0e6E1K5iNvNY/rEhQ/saLEl9qIejeuQXGmu4B38D
         sSCw==
X-Forwarded-Encrypted: i=1; AJvYcCUvh30s/B35rZmJUZJmIj46vapC2f3a8xfmppONnsWiyIhixrtnpYy/3x0WXDGqmtZuz3pCtrL5i32WvYPf@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJuPmz1MZdg/QNzHfaqZF4QVSi5TwcSceKth3qifWtLXoROX/
	38twOckxXmaGIw46dpp+5DNDwY2EDOnJ3M9MtbEH08e+hJAVCVicHucA1qpCvXoC2PBypLZDRES
	4PD5rVhpsBskP5bztRb4zzomvl2PGPwumMsLkLhlGOFhUNGUW5TwUP/x3z3eGpQfiB1x9
X-Gm-Gg: ATEYQzw66tMOEASFAYoVxnDifhSAvcdcJtmQrNAD8/MkDjQaPSs9D+KiCO74KqZeqj/
	TOu9OZKOAsqb2ewZtN0gAMDN0Rfj+KbyJzY4DOCbE6T9H8unBqE98F75vCm7+qaSBv8uwJwMWPq
	pxwGqeiaXbjolU+MtT9hVxV9XY+4CfrSnWfkPXGkdjpT8wx8RNDF0I3fQ6HM3ago6XiNaXjjfmg
	ee365Qe/FEZvSKObHTwRO+Wduase1DKq6W5Qi0lncZ+1n8D9Sp3wRiCWT34JWnFgOKduDaLzPPh
	ci6UpvGgLJJ8aNmdkZ5ewz9eWWi+oCOTVbD1kl0Uy1umlDprCse24dCKYOaq69W6VofTm6UKWO2
	6K+2KEFN32U9rG0iJ2KTD2NyHgWYElfldfNpDhjhvlCGlGI3SG/aQvhJ/gYd8wlZD3ws25dp+5o
	Sa++c=
X-Received: by 2002:ac8:5a8a:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b37270a84mr144313051cf.0.1774259824210;
        Mon, 23 Mar 2026 02:57:04 -0700 (PDT)
X-Received: by 2002:ac8:5a8a:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b37270a84mr144312841cf.0.1774259823738;
        Mon, 23 Mar 2026 02:57:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm477970566b.4.2026.03.23.02.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:57:02 -0700 (PDT)
Message-ID: <8c79a273-8ee1-41af-83a9-af963081263a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:57:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a
 regulator as powered during boot
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXy0mJy/IYdhXh
 l7GzAKlEIXrXy2BiHMYVW7N73qhE9YEZoR3acLgkfQnXW78qLvSL5qMd4gN1M5YQPtX1LnbaJnJ
 yBS0f7vJhuhpmYTiGYnb0ZqqL2UkAngoFqppzpeTcTpxHj/Tutf7RerZOilri/Pa5/vw9nEsWRH
 JU5WI2DW7uVEyZHZrVljhYQKRcxbhtWfxao6YbK2yd1oe2AnB1vPsVoFiw9oKofUzEPUSZ8jng7
 F0yaU0EtNku0hW+ZBAWw1Jf+T2JlPDzmFuvQ3Nn6bdiF2hm8+TDqKJLrOOJwD8A/vMl4cQ9qGJC
 T1KAHZcn3Pjs+t2CXQ3aAbY0C7VgTBq4JUXUJfQLw5jBVwQwr/XkAjJYH0HMLhV02eJy89fC6/w
 QLmYPhVR6TlWR4yyoRXGNStCF6C1/jBk2wDhTu4UnmvxnJB78N1zhw5+cjamblZHozm7D1MHtoQ
 KW2VHLxNw86vkDXR4Xw==
X-Proofpoint-ORIG-GUID: 018b50-x-X5HCp5glGdgwQLVnyrl0HZQ
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c10e70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i5pV3rSXluZByS3FN8IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 018b50-x-X5HCp5glGdgwQLVnyrl0HZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-99177-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F8AC2EF7FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 6:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The regulator must be on, since it provides the display subsystem and
> therefore the bootloader had turned it on before Linux booted.
> 
> Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

