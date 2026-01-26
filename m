Return-Path: <linux-arm-msm+bounces-90476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J01CpLCdmlFVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 02:25:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80322834B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 02:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9892A3004222
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 01:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A45156661;
	Mon, 26 Jan 2026 01:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOtrpY+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDNAzA/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF870814
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769390732; cv=none; b=Sj+C0xtbQ7SlH+eU5YgbEqw24UzJ/FNGH3oEViIb3PgdCo2u1oQQ7okIGgSHv7rLbQN7Vx4NG8ocYMGvs8QedkhOcmynIqYyX7PMuP1C9wiZVN7lyOmiqb+Y8IRd1gi3rC0vguwurY6N1975vnhfSZHlcCSc/VqbIB0l0AfLnqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769390732; c=relaxed/simple;
	bh=Vf9Bm1oAhFnP++38NZH4vrPXq6PhSJNG2y7cZhli82Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBQ7aXGR7jrj2cx2BYzRF8bHQmhxkLfCBYXXH0KkQOaSenY+8InPLlZ2iLZmOKEeYzcmG7XlRUJoLkP/h7P350Bl0jYxDCiZzqw7NjhNd/WOhvf3HjhlxE9CuWQIVrogmY0fNHtHkFjT3IqKc5/yrg09nFXSTVXNXVX9LUsd/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOtrpY+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDNAzA/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLCiYL3982275
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 01:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ur4CDdXtLLlROC75I7d8SJKm/tTLgWlRl1ZO+nhrsO8=; b=aOtrpY+wNpyZkQUf
	VQUFWAIN5TyKFyN8mEXB8JMPMIpL3T3sCfvmAbuUEdcQ4UtzIaeXczjm0kzBXzQP
	s29p/knVehl82m5O1wLyrJZ9yf4mrAoon1DXyjnNkZGfC0EwYHSl32ZBUxJgXCSE
	73onpMa89nbtB5K0c+UuYB/RSWV0Z2D7oT+TGxv7mme5x54rM1lnme0K/AEqRzH8
	6UF+ZRNiTiwB1qynJAciXYkMj3S0ujzd3YE5rCfMhjBnMI5s6gDqkTCKF6HxhaH/
	2MFU/qqlEGvwCnkGzkTdPO4mkvu+0a+ux+JLP4KhpnJesrMPifO5D343uQzSPBpg
	hwjYuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24k0rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 01:25:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c213419f5so2653477a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 17:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769390729; x=1769995529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ur4CDdXtLLlROC75I7d8SJKm/tTLgWlRl1ZO+nhrsO8=;
        b=bDNAzA/vCoHH9AJBPMgPwoeJay8VaQMnCwBNCS5tU8Z+1JprQuu12Fn2tGVrHedZUl
         PNTe4H1+1jW+/oi73W8XIyQHAIWUx2meHcy2gJN+D4pp+VjEHXe1UXdQVcOKim+h8XOG
         M+UF0iaHITsXuNMd+9oTUC32fdMXLasR0Aff2K0OO4rfm3Uu+OBwge5PCXUtnxnDnqTo
         r5OvqhrTdSVD9SJdBIufYHaSHWtcqX59fDWkd1Ya0Rg8U9DPVw8rVXN+Ne0YtEPuCAXs
         oTrnK1ymjsJa7eJvmndMtRMwlITRkPvcz714QZghUJWhnBwFHBROUxP+pOdwijGG0Ofz
         9j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769390729; x=1769995529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ur4CDdXtLLlROC75I7d8SJKm/tTLgWlRl1ZO+nhrsO8=;
        b=RqDF/YzTCfc8TMXR7bpm0bv8G1YMjZAa4xbHkrpwMR7yPT2UH0baE6ixmeN7TiBWA9
         0w+vZ+jRDMfG14D2aiHyApqTwPp9gsmPkB5qfsSITbN2hAaJ1SkmbvWauF1m7sdSlHQA
         ZrVQGzB1NQhDnUaN9YM9n02OTgimu6i3qY9MC92baXM0Cb8693T2Xc7yAn5ZLuU0Kccy
         0gT/56FwvPAdXOAwI2tPX3kTQ3OLvxsnfgSoqJmXfr7xYvYcclczZcDVIL5xB0jXvT2Z
         bs1FBQj2TVXpNHDuo0s4B8NJAjRJiQdwHi/9URSv3t0ANR58gZMFvAzuF15za5vRDwd6
         fn9w==
X-Forwarded-Encrypted: i=1; AJvYcCU2O4Ln8uCXO9DJ6hlViUoqgETZvqS0IFlRnte7RVr9KI9DC0a326BPyo/PSehkvh0UiUh1DeJ6Xhi7nat0@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxK6QY+3rB92OOyHESDdXaL4X04bJ4B/86ZxrhR3alvtkrayg
	XV44Y3CalQIt5FYyu8qDwJj7/b/C28GKABXTOfvKKz+3/BOz1VE//ahzhrQSgZnpFinLDoQf8uE
	wCWEBaTesF6VGrr3owXW2sEOwU6HWpciCOTBuIO/kZkz8My4x5Bxns1Qg9bj+mgFxFRhY5fY95b
	Gr
X-Gm-Gg: AZuq6aJyRBv0lztGysBOQYpL9990lZXCR6zRlVQlmRS5reqhckpohEsrPAvROZ8kDXw
	43eXJnoCaMBvA4R0To7OzsIAcRE2sLao84Dh7H23iQpDqgMbyCXstV+9n1iR4B9vMlQNOE8Owjd
	uNCKvCsWykXvQFJaQQDc8Xe2Q/fqQAyG7JqnKBvdu6WXIFzFH42M41LplRw2Kp7PjijB9jFykPr
	s6nJ5/alLJM3xhNfUDoKxcT7LgTEY/WMhp3kPV4huofalRLVUX4t8sYfDrr7gVKf0dMlzfyMtZP
	I9j5wuU850FcERjbNv2wxHlIBw3n+EEdX6PO1uMqZJZuTpSxBxmMOtddxWxc8WAA98JAaytMPX1
	3YfcqmLxEq5L/xIHJQYghZqMsso8LOPfCow51zFIS+MIKzW46X39V4yufRK/Qtxc=
X-Received: by 2002:a17:902:f647:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a8452bc4ccmr29847255ad.31.1769390729017;
        Sun, 25 Jan 2026 17:25:29 -0800 (PST)
X-Received: by 2002:a17:902:f647:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a8452bc4ccmr29846975ad.31.1769390728507;
        Sun, 25 Jan 2026 17:25:28 -0800 (PST)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cd4sm74438875ad.40.2026.01.25.17.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 17:25:28 -0800 (PST)
Message-ID: <2a8ff39f-7a78-4902-85d6-1267c319d8a7@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 09:25:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: add ETR device
To: Rob Herring <robh@kernel.org>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
 <176917840185.2044151.8624555547965761091.robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <176917840185.2044151.8624555547965761091.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxMCBTYWx0ZWRfX7cr9YptAx6fd
 U/ppgpnFw5ESbIjihCuCvfwIUSOwdcMEqf0ZX3tt4iZaWGFLcAcNz2MdBHm8J1JO40MJNkFeVkf
 fzMHJlYmy23fH7mVvc1leawmqiMbrRq9LO3BBzHbDxNB5ciSdyaeu4edpdRh+LrtSwTps+7mYt/
 +UTo0cb6Su9QQDjZgWJiGY/FI4ILYdhkt1YE2v9HcQy5jTqzqeEunr4FbLsnRnjBuOFdOgdK2lE
 tW77sh/rZnhWPHyJmb3KNQUaZ3MaB0AH8DjNQTpx84bu1acXxVh88UKcULByegZjNgMZK/yAciH
 1beL205/MBMT/qdHGfcX1MbJU4Rkjrft2mQJg+Sa9IYbrDiaex9+uOwAH86l73HgRsEZQEXb/tv
 72S/6PpA2i7SokiEwZgaJdS69ExE7XBoY0QQEfdv1bA/+EB9YKOsT9QCvvTg405iEozQbvBjTAZ
 jZkm3Ox2bgXKaY89XXg==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=6976c28a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=7VjZp_oamj8JExNPJH4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kmd_kBN26bGirBe5XS7x13CdCiQPGQDg
X-Proofpoint-ORIG-GUID: kmd_kBN26bGirBe5XS7x13CdCiQPGQDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260010
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90476-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80322834B9
X-Rspamd-Action: no action



On 1/23/2026 10:29 PM, Rob Herring wrote:
> 
> On Fri, 23 Jan 2026 15:10:46 +0800, Jie Gan wrote:
>> Add the TMC ETR device to store collected trace data in DDR memory.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>   Base: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d (use --merge-base to override)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com:
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml

Hi Rob,

This warning is not introduced by my patch. I think it's a false positive.

Thanks,
Jie


> 
> 
> 
> 
> 


