Return-Path: <linux-arm-msm+bounces-93311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCowGV34lWlMXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:35:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C315855B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 580B83006950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F9033B6D7;
	Wed, 18 Feb 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vv488xVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/RXMCLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E431281B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436121; cv=none; b=PYd7Kc3ZHDhYv3UnpfLdRXs6gVZUfKmuAb4EgybmDovGq6BsNKHB1mQQk90aiJ0vDRg4AAPdYg1Rj9Coh5bW/nVN+JSiFzLVwWYBwUPatINZ03jTWd/18uHHLLe16hCjlhusu0K3oOFeJV8M96olKB5E/l9QTV9q01rMd2YDC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436121; c=relaxed/simple;
	bh=6ZpSzjQ2Q8cSDPJlsM2jP4pwKfvfayaWDf8EqYJEigg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o2/ox6dhnsN+8IdmpkEaPOC39QfXg/xxvlJaoYK6zeSFnHAVIGdIgvnKE7YEf+EFg7OhO/p7nAV45EgxpYuLUv8YfzY68+k9rjPoFd6coWbMjgZnwntIInlkPBcXkiq8qh35oVRbsgGiDuUYDQfkOdLwZx9sfuPzzooulAA/Ylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vv488xVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/RXMCLv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9LMtm2784789
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNnZn+xmeWcZfBOU+WqjAArDp5I0MTFneEShOM7do4o=; b=Vv488xVla9u2cGG+
	vTx5gwQmmHE/WGrMERnpvZtpSev7T/yNIDGwqTtLfobF4GMtUww9e5/PI2xVALoe
	7N14JompQDiQ0ZtPlSi+wksqtS4gFdhqOAQ3hvbys1IQc9+DsQ7hi+7dpx8PjTc9
	Waa8ZC0TZsJfzmGADiQN0hpW2LDrXlZ/csQ/KGKf1lYCrB28AblTacxGwPKCcYKU
	ZjKDDdNvpjCpfUrIhHc6fQxNgkXblEJiYbnU7a3UrG1WluHA3cnKQHLdO4vi3q9r
	a08SooOTDBct1bBeb4fnzkQyha7ShkEZspzpvKXt4wpycV7in3oeJmQx/N+kMakS
	F8YTaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk30gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:35:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a75ed2f89dso214765ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771436119; x=1772040919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNnZn+xmeWcZfBOU+WqjAArDp5I0MTFneEShOM7do4o=;
        b=L/RXMCLvTjp2+1vK7SylmG80zl5vZzxs3qTSTSHAvH/s4bGQrqSIFU0jhuXcowr7ui
         Go97K/vKjVAGdGQ9bMfvH2zWJLXasrgE/QZke9mS/+xND9Y7bRQxMb+PTvs+I/DE7U70
         GxODrpmXEr1p0+SQDyyGIMYZ6wKwqUax6W4OU3QnOhu4epbvji1FtC0RqEkq2ta+jCRu
         rmRhcQ1Vs8kqeW1XNJj+Djwt4bqIvAYE/r+cWAqrmjO/WUZwWQmKV3cHawzhFg5Meaef
         SaPC5TXfwK+cxmxJcVEcOAScP1j3ww+KIPZfZ9FwZnh2Wi4RxOlqF+8R0SdunS+S1W8P
         drVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771436119; x=1772040919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNnZn+xmeWcZfBOU+WqjAArDp5I0MTFneEShOM7do4o=;
        b=oAZPlQ46vgKI0ZITfoFdEf57vQ1eK5QCYKIpRluBFMKHY6UAVl3WbxsDkGYtGnqnFo
         hDcMAin1HtuMfYCr0Vy2QOLpBKzkBRSrgZeUPqBP/yripm6rZJHMnYj15rR4ADLv7XHu
         bJPKJuGwq51dHkw3/TsUjkPP9FPMtD0cl+5bH5ilJkbKUV4PXFUxpC3Jj8/Y//ZtFEe7
         1hG7IgyGgOojTIky8ZIxlBwsT/q8WGQy6zlERNFrUMtFHLXPelKRRNgP4Qj89WgaE9Kg
         ACEL/RHkguy1IXUBa8eGGfnuc09mbyYPNarS7nrnhl2bR1w0XxlrXTZBZprEoBTGix8X
         r5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzzn95737wA8HdaYU8BhduZa7lAX+p1QJyL7OXh++IoprtUSN0OVQq2EfhLkPzgAizJZlDURWzH1HK+/9m@vger.kernel.org
X-Gm-Message-State: AOJu0YzZHFVRe6rbTKNJB9mLwMrMmCetDJTi9wUURRu0KCvV4LiiGgkY
	Y5LwKBam62OLHUTiX36x9H/8jpNQo2k8Z1iuzm0t9TtzT15nwfLc7gcGG936rkhb7L0ZS8yeLSr
	c/Amqs6RmCi/5sFGzeHChPfxHBRFyW5p70nwph6TjBBp46zNfvFDX2LUu8Me4wqktSPH/
X-Gm-Gg: AZuq6aIFlI0DjaOpUs0cqeaw7k7mKkhAZ3BZW4NtQn+UqmxgB4smvCtY/r5V2pYZUD8
	jXoH91iUz7/ETjJ3Vi9SRtfg2VIaa1NtbD8K9+VB3IgfwCGXWP/37oOZSsH6srqu1PycjVEe7z/
	txL9sVgA7n8WtPqtSuUKPxPJCrEkHQYSTt9hN99oWwx/wuXFq72tUOa5RTefNXdfVVz4QlQpDjv
	ntgyUJj3j7GDMMAUvdN6MEiPqxZo53kqai47Y3gCldSefKJ6KIJemMLSbjVtuuQy5DT7NqrTpNE
	HRrtfvWDGQuk3zlYHdn7vcnoOHeZ8CZIrxD3Oq9aDiHsh2xOk4GFFt7mCqwepHAsK+f6pUBqK8J
	lch3BFPxQOmyKpj5OFQaZmRrHKds5WCls56NUhLNZhp6kfbCNXQ==
X-Received: by 2002:a17:903:2b10:b0:2aa:e843:ab11 with SMTP id d9443c01a7336-2ad174dd3c2mr126622715ad.28.1771436119464;
        Wed, 18 Feb 2026 09:35:19 -0800 (PST)
X-Received: by 2002:a17:903:2b10:b0:2aa:e843:ab11 with SMTP id d9443c01a7336-2ad174dd3c2mr126622325ad.28.1771436118678;
        Wed, 18 Feb 2026 09:35:18 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaf5506sm133262885ad.87.2026.02.18.09.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:35:18 -0800 (PST)
Message-ID: <6bbeaf2e-47a8-4e99-ab5b-71452f2cc9be@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 23:05:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wui0w7VEn5k7qaLEFblnbZf1yu5_b1iF
X-Proofpoint-ORIG-GUID: Wui0w7VEn5k7qaLEFblnbZf1yu5_b1iF
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=6995f858 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IXbkkVN8uJs8XsqYossUiQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZD5VXX6mDgfP9xSn57MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MCBTYWx0ZWRfX8jfWQEpttGb/
 bTkV+RMGPlLyr8w8fm6YXZQBw7MBj1PwVPog55sH/whMgacz8ctsuFFfGFVQ3LVt1yKHRUAjTD7
 xZlaca4ssQyAasFmPJYWTugKr49nCSl/E7VYZdz/OhOPVAdlWa5ttW7KM8O2ewRRWPEObtuB+yu
 xD0BcLUFyegyILRwl7LqmdpbP2NWVwkfIQ4QDG8VX3clnTJ9BoCcyjDczkrF+xMdbVaXqWEQrV0
 lKYZrLAnxt3tuXas9V7H8mDvGhWWPYZxDGREvFCBfsEtp24AEGDvmW9s8kh4aBa6SUUjGesvbPN
 VYxNH4elZiQYP3K087ulBcnv679IErgruysB9Uc+Zlk6NTK+KNRK6XDlfV/e09yRYZIk08SEUuE
 ZB1oBMg8Who+9U3eXEptXvRrZ2asZb8EIjRNTGUYyTDkP1JUfTKw6fEs34Xkd6qZZ3rg93TDXE3
 9MntpFUtvQxDcMnHIUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93311-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B74C315855B
X-Rspamd-Action: no action



On 2/17/2026 6:30 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> Split from previous patchset, because I messed up commands and combined
> wrong patches together.
> ---
>  .../devicetree/bindings/clock/qcom,glymur-dispcc.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> index 45f027c70e03..9de4ba71f1d9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Display Clock & Reset Controller on GLYMUR
> +title: Qualcomm Display Clock & Reset Controller on Glymur SoC
>  
>  maintainers:
>    - Taniya Das <taniya.das@oss.qualcomm.com>
>  
>  description: |
>    Qualcomm display clock control module which supports the clocks, resets and
> -  power domains for the MDSS instances on GLYMUR SoC.
> +  power domains for the MDSS instances on Glymur SoC.
>  
>    See also:
>      include/dt-bindings/clock/qcom,dispcc-glymur.h

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


