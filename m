Return-Path: <linux-arm-msm+bounces-105374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDNnI79h82le2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F84A3D5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFA08301A15A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3692A41325C;
	Thu, 30 Apr 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WENIu5oL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2FiMUAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93291429814
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557949; cv=none; b=e+mJL2l6Nj9SZBPsakOylvVePC59LDV3lPuS8OcicCq9S3VFNCHVdBe55cqaj7Xo9Yc3BXONh0zMGrxTTtroVAdWuTfnUngwVYpDAkOn0L9KHJbcwTwryWttUxg1omBXzT3XPJGtA5LcWBkZSa1X4RjdYmahu6ikHQSaDvXxNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557949; c=relaxed/simple;
	bh=r5lwxvvb5sAgW6B0ULVuKKV/yBw8wgTG5rI3ASdyRHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1iFDUqoFFG5MqBFUkRBeGocLbE8KU0GnpWYWCf5/vCPBKf1Gyn4J8ICkoQNH469nScPD8OGsvAgvawBwtKlgGOS7YDO5mLHXxVWTS5oo6m5Dq53K0qkY4FCNld+3hj0q26DxTaptLTYvHFjcDJTb8W3eSL4AxXUUxgC1zc/ftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WENIu5oL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2FiMUAt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBk8oI1820475
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRai58Oz/gneEe5ZrO+R676QRnXLBNMVr6z09xqiu8M=; b=WENIu5oLtYrZA53v
	g6UewfalSrbstg1w4QXY8/3mi+HAvWQCbeOjmQ1jegfAUtEQg4K6NTcBenv5xKm0
	3p+FAn6XIu7/oIkmcc73pBIGWZgNy1gYUoLeS8LIAJQTx1pYfNMcEo2Re5aLQQVv
	42aHSWRTaYoK/irhbh/wMh4j5kWCcWorHA3jqbaZRfubY9OI+DlwcJKtAlyFwQfR
	JQQfdUkes5YB9cULtBSOiu6cuYkD/r2W9AccnGX2bVAMJtAUY+OM/XKV/gy3qMPz
	Bjpm8lJ3PP0g0qY1tOytBqoaNvn84ePxuvFN4JfkSK2O+e+jWn6+ZNKDxUxlhdiF
	OGV2wA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6gerp13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:05:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso1002173a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557946; x=1778162746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oRai58Oz/gneEe5ZrO+R676QRnXLBNMVr6z09xqiu8M=;
        b=J2FiMUAtVgC3STsfJTSLQyzcGYkIGyrwU3SlcBntr4CXdoK2+2lQjiZZnrHUjYrGie
         f8sJ5Sj8XkudcxM7QlzoZNPr4csc65mKZgnK1NA+WdgBxHi45teUD25u/QKDsFS2FASt
         i9cFZpH10RMaOx6cWsnx9J2MI7dvL5wzqqmlp2VAMK8icH2eDmRvCnAhvNEmvpkY9x2Y
         /taL/fP0oZoxWR+HJeSkyFHuIDKd+jigVqVwraVRuJOylevv7a9lBiVvsnAnAzeO30Zu
         wmC7xRKu8Pg3MpeJ2Z26S2Pnn2zgOjZYorwAt+o+hZpYDnqp1CR7W8jAwCh3WR/62xF7
         r9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557946; x=1778162746;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRai58Oz/gneEe5ZrO+R676QRnXLBNMVr6z09xqiu8M=;
        b=J4wqILG7feALRZXtzsJ9qZSoxnxSjDGRIKpsofcuzXxSBtxmVYAZuzmxL3tc/xvX6m
         metW7+L2RZKoGAvS6FTG1hMP6ku/XxO4ZhSsaQv1TBUjsD0KSfTsxoFOVwjcerrYIGz9
         ukHVIa+3ZzIBs4blwYhil78RCNzE8dbyuZDW/9sF8awXXH/ZFsQb/9L8mEB5JolefG/C
         pSvMxb7sommTlJLIrEDnYkrI1iFDJUlpvuetwwTa1J69/r9ju2FC2LBikendnz3c3jah
         CEtgWdzYqWCASw3qk7q9UrwnN8ydliuCaicIu2RTZ+jFBx+fTmNlhndojEUGQxxcis73
         dE8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Fk/SKMjzsmTZWaZd2Yd6QG5tq2LqZhf3G1M+ABKUawi99+ZH3cMzbhvVqS4fqmi3xnGBwtEVpZzijYREC@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDKMjlbbUYd8FLHep7SENjbwAhxf0ogLKaLIWJqWe/WoB9KgO
	AtBd490vbpfv74HlYUdqJcBE1XMu6MJKu1Lz5Wb0C8N58h7i2Z934NXSD9TCOiq1VPSTt+LRz1c
	0ibQ6PXN/Y/SUIMllLambOZxqgy74LZFBjST1rpWTa9Ix0e9kXWMrAEl/6OA9DsEhQImb
X-Gm-Gg: AeBDievMPgo63f76ZeOr4dmfTJVlmDsyTWiM76OkeMgePFTIzP4lZlU1Nb5tYmPKC8s
	ENqiqnHcFWrMA1heXHpQkdR9xXm3U9Rk5VsCEmfGqAx/YPzx8W8Mr1ENFnIOV5YNBAvcVvVnALC
	TaZeC6xR++UdGraOjNXVUaJQpw4uk8ix/+tIbEcGENqGxaEbx/+F62He6PhURqVipYu90bX4Slg
	gceUmBtRfDL5Hx+KSWLf43eC/TYFgu5n2dT4JGFg7WG9J+9ak1zUe//yHnUpvtlQ6gjBrlrlLox
	LXGazr0KcpJhFIaRRHLOdtuuGFQk0Ezndj+hQJgzgEBDo+uP3NDV3GXXOsZRumcANPZTjKjW4YQ
	vrIYc4U3YmBQEnovs8ZaivpaO9Zsev6qMGMfbanJ6OHcki9WbVrO+Cj5Bz2o=
X-Received: by 2002:a17:90a:d44d:b0:35b:90e7:c44f with SMTP id 98e67ed59e1d1-364c2fc603cmr3231180a91.7.1777557945567;
        Thu, 30 Apr 2026 07:05:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:35b:90e7:c44f with SMTP id 98e67ed59e1d1-364c2fc603cmr3231120a91.7.1777557944934;
        Thu, 30 Apr 2026 07:05:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c71f2sm102755225e9.5.2026.04.30.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:05:41 -0700 (PDT)
Message-ID: <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:05:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
 <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f361ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nZGv5R8-6QsBmOCzOLwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: soy9y0q0udwqRzB7hTahwBg04VfbCsZc
X-Proofpoint-ORIG-GUID: soy9y0q0udwqRzB7hTahwBg04VfbCsZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NSBTYWx0ZWRfX8lVTmSinsuQv
 9KJt/BVjuQ/GEupaZtt0m9xzLJ98h5S+tBdI7BEG6hu/gUjJvN43A1baF0MG9an/ffYA5FouSZO
 Tbo+IwrDgeeA0zCPAdY5M7Pta4uaJtjmG63cTC1u32eXCpinfqJTMqjAoGz6bopilTgncU8KcZX
 XwkcLWT5qlfllyn/kTyTc/nI/ecOMWyW22Ey4DJmTJXAQ9vF8i9mDdUANhG9Rbw0UZhCwdcxfgt
 jeEHF8TDTNBdtgRLRtuvoZnaUKRI1J2aSHHJPm6OC3aoGfrSfHiwK2B3TY9/ZoaJ5Cn7R1kNLWr
 18bvtUAC0IlRA6k+QWH3fuH2T3fZ8K1eLaF/Ti74zko39P72UCWAkYUy3+fc3rp1a0jqEyOscNd
 JIoXvyZ0kktx2FHRP2gE76giYtW4Vcc/hE1OLY02LUXKSGd9MrTGYu8WcZ3XRrQ9wuZDlnkiY4x
 HUnxFTM7QAZ6p9PZL4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300145
X-Rspamd-Queue-Id: F11F84A3D5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105374-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 30/04/2026 15:03, Vladimir Zapolskiy wrote:
> On 4/29/26 20:09, Krzysztof Kozlowski wrote:
>> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
>> are already treated by common.c code as pointers to const, so constify
>> few remaining pieces.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
>> 2. Add rb tag
>> ---
>>   drivers/clk/qcom/gcc-nord.c     | 2 +-
>>   drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>>   drivers/clk/qcom/negcc-nord.c   | 2 +-
>>   drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>>   drivers/clk/qcom/segcc-nord.c   | 2 +-
>>   5 files changed, 7 insertions(+), 7 deletions(-)
> 
> What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?


It's on my exception list, not sure what would be the benefit in practice.


Best regards,
Krzysztof

