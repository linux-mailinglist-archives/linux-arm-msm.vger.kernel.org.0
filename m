Return-Path: <linux-arm-msm+bounces-105396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G1eLLiG82kY4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99E4A5E7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72FB73001A52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98A5314A65;
	Thu, 30 Apr 2026 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jn827o7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOPbJq1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4039B488
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567087; cv=none; b=c1DhtMVoegP/+nbWIyY1c/eU8lt7V5bXT5dpFU4ueBx6d+p+i4AvxD8QggVgnvdo/IytkBKYnmJNctJPxdu+1zynp3TnNMlkMCGGJL1BAlGxRKIvZ6b92+hC65asLTEPz4gyGmHf9aH7c1vLG/fcJtH/1zM+jmF/jm+2Rjwe6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567087; c=relaxed/simple;
	bh=HDacjiJRTkF/d7qAHBlPL58TcUbocY/C1IV1k0OLmhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3+GFJV9cYgiDY8Z71WLpHtvXKjoGHgW4Kndlb07iJYgMkuj3X/WnlgvnivU1M22VIDZrSeapFXD71Eo7d+wcgjbhGKJmGPfg/QuY1Dcd8bC+Hmt9IfN8l2Jm+YKEezzKxxaZs0xb9BiseGfWy7DWvo+tU0UQZ4VMODf/oxgRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jn827o7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOPbJq1o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDNfqi2480941
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqmzBDzIc4d89YtrMs1rTRkin0CywGJKMq1Ax0RRuzE=; b=Jn827o7zd/+HD/No
	EIpHo7GPny7NNfIu9lkHRPmHBoE5BzuTPcFUgawUz/0VTDm1plCKXYBLpjRARPgy
	ItensockB/qrDsHtSonCsshriKOtDaxhWPyjqTScqnhgd+qYreVvTzWyMzBlzo3p
	vOlHq3PJLU2sk/A9HhXUknrzUtiIWJViUG1f3KYj/evzzFztaAK+FDkYlcf6gmVT
	g1GafT5UL3dmQsFK3IEYnCMe2A3M/X9hQSYc8NFaVpojaXG+ljhVA46VkuyrBHUA
	N5a07z39dzzGolinhWJZG8yKK57x92YZlpKKz+DZJM2LZFpRl0rIqi+PqQbsJn0r
	scn/ew==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6gxj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:38:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56e072ac05bso95843e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777567085; x=1778171885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqmzBDzIc4d89YtrMs1rTRkin0CywGJKMq1Ax0RRuzE=;
        b=TOPbJq1ogE0QfdWjmPytcYt3hmFzs380rJUpON6FQnluxRVd80jL3pGC9/ix2zwoEw
         ALdaWBxxK6yAYYnc+sYkkvKlMrh/Ci/KAIpleNFk05Y1o8x6mK5G+vhUrovG0peoxHps
         ro0QyedlQAig5CPcSvpwZG6lvyZWTLuJtxR8kdcd03zehBygnMvv71CUkDSkmyWYkPF5
         rBr/Z2qiBvQDjYzkUM2TPExwb0/56YhiRbqUpgFFfRbfBfnK/Zlwn0z74fCS6u2jpSK1
         elkexWfEzp1e0qgT0HKMvEzkcgKyN+Al4LuTYn8udjUea1S4ouLTf3JF5ewNKP7CM4u/
         928A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567085; x=1778171885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqmzBDzIc4d89YtrMs1rTRkin0CywGJKMq1Ax0RRuzE=;
        b=Xk27hUBgyzaox168ahxeKyGsiOQwzW4D3JFbyhegPb7SBb+uHQJL9VchX7TVT9rb5n
         4xrnERAKZLSou0ByBVNScd7KQysiCqGrUIcdxWWlNdUyVUcZrZrxm2UXM0hdnnJvbGjW
         +N9CXcCZ0ro0EAXcIl5YK07cHw5P7Bo9QYjcWFegr+vmBg6YoqxWUcIp0i7DsJTYEnJV
         aSbetcPOi8664UQM/B9YC7LoSw2qr0ffUI6UL5EhDdS/6FZ2PeEHFLlXAqWFPgOF6z8b
         CDM5gai+z0mLr+8Vf8No9Bq7nDG2pFwfOZ3jMOQbuq6PkQDf/KIRxG9+bPIHPvuASqCo
         xb4A==
X-Gm-Message-State: AOJu0YyX3XSNVbFUiJ74Mk9fEgOHOUXWuTqKR29wdkj1qaM4XKUpZ67P
	Yq1ozw5XONQlVV3XtWgQmXuj57PW4CunsTGvVVwvDLNuZPoH256nr5AaehSeGIYGsXh1VkWDo1g
	0lXeb8QXk0cEKVEzjowq4FlLvOCLTa2gAXD4e2BTLceTBnFkOdaytHqRTs5D2o5A40sBP
X-Gm-Gg: AeBDieu4uG9gobl1VqrTBUhalMRW7mYyzqBsnfhVoK02GEkyyZjxW6QyJt9bmZqgY5s
	AykmP5Ll4uXmeoAVcpvjYo74ZbxDwYktRGXfVH8s+/LRWLf74E9dLZoBF975XDh7uNC91DnWu1f
	ELGa2EbybHwj5YodzpcUh6v8ujC9wHEaoh+kOQu66XZ8TLFwM1AqFv9Lm8deZ5eyIHs+V8sY03R
	KHxtZlNO0npd6Z8SB3nvK0ZY4oIXxOh2UoqNretTsALCus7ykMd7B3sBurrUY0kGZwmM+zKFHNy
	Jtw5qYZqcrQeFV9AEbi9szVxMo+kJqCRi9/BiUwde5sMuIvF72VPl8VabTeXwkRtuFNH99RropI
	ZOCECfoEoJtuaNEAdMz8m7/q8aIssXTJVvfUlwk9Stho/PBSiB27Zjbei+jc+eJY7YsDM4aC4Zw
	E587zFvH0SWX2Llg==
X-Received: by 2002:a05:6122:2057:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573c95e5c03mr618685e0c.1.1777567084824;
        Thu, 30 Apr 2026 09:38:04 -0700 (PDT)
X-Received: by 2002:a05:6122:2057:b0:56f:79d2:2e62 with SMTP id 71dfb90a1353d-573c95e5c03mr618673e0c.1.1777567084448;
        Thu, 30 Apr 2026 09:38:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d8c2sm18068766b.17.2026.04.30.09.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:38:03 -0700 (PDT)
Message-ID: <937db5d1-f5d4-4de4-879d-e6f4d51e9ff4@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 18:38:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Teguh Sobirin <teguh@sobir.in>
References: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yYJyH91rj0jBPUnZIZzNEMKJye6nX2bg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE3MiBTYWx0ZWRfX1MO03kWJVNF8
 ijOIsDSAbbkLiDBBxNVDltAW9oV8sFxrb14nXTTy3EjMxPJeUPQrdziCLe3VGAZQOIQw6hvbXga
 pi6EhmFtDYq3ZCj1bKBM7UW5+v73WLPmJkyQT3PD7VKeV3vJkwugWlM2Z61IsQOAA/pK0L5SHyv
 DPnjuGpBCY11sEemIsWL6F8vN/4P2OdNnIVSbw40nosbIHCDUdFTQbZCNE8QjQSv9W5f1dheAgA
 E6T6isVfz6JETUCbMYH4lepvfup1Tsviz97S1ARhFt+6EfebkzsF7gDfcjTgoIOQSatS2tDnIPH
 rjAq1wndiUdt0QRQDMdtO1muAGwYdQqlfbZOPX7jf3jSJLTZAhZUJHJLqZFUJrmsgG29mdZIWsf
 cAGHWEs13AUF1J9Pa2cSdTGFdST7WBtkUnQPqSuoFXYHaOvVMhPLy7VB1O31vgfEaTZURU9cpFa
 dHUWinB3n0rnUMSnlnA==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f3856d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=ggS85ixeqhIU1JcMt2UA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: yYJyH91rj0jBPUnZIZzNEMKJye6nX2bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300172
X-Rspamd-Queue-Id: 9F99E4A5E7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105396-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 6:03 PM, Aaron Kling via B4 Relay wrote:
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
> 
> The initial port was done by Teguh Sobirin for ROCKNIX and was made
> available on the AYN github [0].
> 
> Support has been removed for things not yet supported by the upstream
> kernel, these will be added later when the related drivers are submitted
> and picked up. Such includes:
> 
> * All panels
> * The Odin 2 Mini backlight and touch
> * All rgb leds
> * The built-in uart gamepad
> 
> [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v6:
> - Fix comment style in patch 3
> - Drop a pair of unnecessary pinmuxes in patch 3

It seems like we've had a bit of a misunderstnading.. I was referencing
the output-low property within some nodes specifically, not the whole
nodes

Konrad

