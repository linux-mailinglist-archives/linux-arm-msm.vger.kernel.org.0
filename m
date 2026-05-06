Return-Path: <linux-arm-msm+bounces-106122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPwEL0ZT+2k5ZgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A44DC6E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB518303CD00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 14:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE85148097F;
	Wed,  6 May 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iN1G/EWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yo7D9eiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A46480355
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077597; cv=none; b=BSYf0Qrr1uPaF4Y7tAXe/4qWHE4WYM3zwymruuYs+Eu/ZFEq87P1u/q4ioSI/qtKtwu+0YJ9pmfjv5LnautjSAZvM0GiS31UKDvKq/NK2yyhXMGCjg0c2KSi0ag3c2bvo5GuVQ74F3NjUgZv9dJh+L9W8XZkXOXRtykwpiZKCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077597; c=relaxed/simple;
	bh=srPsf9DGtjuwNp0lmZ/jXjqw3neX9w70YKOrPJckz/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp2Xux0U+Uw+AjvNqPUxwHnDwbh2Iav2szYg2HcKZwkSMXBXC9B2ljCi0G/2cMBaBdNkF6CdxNb3G9OOx9hgw4lPmVYzOCfrEHLT+1EITbzU57hmYR1iyDTRU15yZTKU5lkFrKfPUWuvmk58kpiwXXKUAWCAPmqfn7tgoavympQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iN1G/EWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yo7D9eiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A033D1985916
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=; b=iN1G/EWNwfgWQKL3
	YAX+dNLrgxe2qqzkPQEvOTz9o8n8gYjG7HIbqbrC2dQ48IromOGPqNvckoG7DZUm
	YMO+2WEfAZPWoygw22tPuxiAD/h6hOndd+qVPjNqUqVRFRM6tGdtUqqM45pMfRdp
	XocTHk1vLrByN6EWoqEqhTNyBZBHOB5b5YceOBvwtrKR8MYSM71ZWotYXEId+SS/
	UMwJWBgTzPwoMThpSEhpbiqecdJibaGDgMNoNp4Bq9RAIKotGSQrGHjBacQsHnz0
	8LDRjA1lCwoPo8jw+yGY+eQz4Qi6m+3mXezqCYhCE5tTPSwx6+s1H879cO2FAT+i
	4t2eFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp0wbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 14:26:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-836cfd84728so458073b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778077592; x=1778682392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=;
        b=Yo7D9eiMa8oK0ox3A5Yd95jbCTL726SMeb64gC/InS2M+6Bzv/1XDDCUsA6LNEK3pO
         BsQKikcao7dJUJy1rOUSZCveADpi7P5eBOO7uGyym4b3J2S4KRhA5JABKu+SP4PUIVQG
         Lwh3267vxKvOTvaR9qbjernTOYycxp1hYpYzolwcSpD53oxsAtog84pUDvWrgudAbKix
         HCPVXy4sV7ySWOy5JmiKMip1eNM+HJP7e/aKriggBmk7Tcq/6y7SU3k9vCQ8w5srm9xI
         zDm/0/NiQLuI1A+A+dZCMyRf5/q9aeP5p5WoeS4s8HdC/J2H7we2nAy4JPZoDoy57a9O
         nO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077592; x=1778682392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=;
        b=X7uo76mneoHQpjb1towlOi2aj9Pt7gk0OK21JtBWnkz8ojaJGhRs7Cmqi3dIKs+Bu9
         NDL1KVDfpTqOZkMdL0z2BVoIEobHvY+4Co1CzfgkaEPSRa1nC7c2P+HYvtc2AVw4bq4c
         tLxAOpdrKZEbon08EPplyPTPgctHqZUrgRSsunAGX51AZSNxC3H3R1AMbT04SYEKwmk7
         QhiuArWYwqncL2dld99drpMpagIt1NLJNSIvjCQ3UUJIKtENItVQ8FOG7GKnR24Y4V/t
         +NeiXyzPEdx1TfHrIi8GMBXRKBtxVVXdlyy6SxU5uMNs8RJDhgrBV9pevFGSj7rayzNx
         R8Kw==
X-Forwarded-Encrypted: i=1; AFNElJ921blpM5+d95t5U8+sNOtYSUXrjIPYtOu4tBTlFRjaywlXxkYgh0KSzZ+qR+7xgxnkFUb4g/EPUywmkqvV@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3xFi4lLFtL4TtwIxqBg9Vlm/SSht9rSv4EL5cBKpRhAu25kN
	P5yeZ9NF/a7M8ynb4AOBC2MjhI26O9bJrx9XJqXII0nQQQ7SRex9UCVuU8g9ZwBAhdrDrjG1Kxt
	v1ij0ADgRD7XHSMWDPk/ejGVr7WdaR+Cs5x4ZdTnFKxKoh7VG8RTB7rqSq2zvAfXMyoph
X-Gm-Gg: AeBDiesirGHfnMTbMC2+a/J9tbUkaUugGw91WmjYTMF49JTnaL7UgHLGFqmWCpjiCFP
	ttEDzy5SgZ4OAQik9RYSKNP0GRgwD/zItPJXJQSxk0U+KzTbT3wYbpG69+IjmzSeQP1Tu+n4jqj
	GeCmTxeQkQp7kvKtSL/y+ugTDjdQEqbwExIFVkmrGNXFR7OZgwa+m+4tb7EaxPTzQI8iGiQiesu
	L2dXXbtaeLE30qnt0IrU/XrMsdfaJF8yorSf4DqSltlwAzio30E3Q4+5LVjJcVHRF6QkoFiw7Py
	bBGwdpMR20GYBhWcjCYhARa0Do/aSifVnhtDUNXgfQpw7Q8cuJutEsTEJdaT1/olq4NuLb5Ug6B
	GMnFgoOS82EdULlrUq2k3Gzjz+qGgORR3iEo3LUn/dvw3qNZUfGPmdjY6cEsiMvE9
X-Received: by 2002:a05:6a00:98f:b0:835:3f9c:c681 with SMTP id d2e1a72fcca58-838fed5e872mr6814171b3a.34.1778077592396;
        Wed, 06 May 2026 07:26:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:835:3f9c:c681 with SMTP id d2e1a72fcca58-838fed5e872mr6814130b3a.34.1778077591827;
        Wed, 06 May 2026 07:26:31 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm7146996b3a.25.2026.05.06.07.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:26:31 -0700 (PDT)
Message-ID: <0c33ae9b-db53-4557-8fff-27c2da69366c@oss.qualcomm.com>
Date: Wed, 6 May 2026 19:56:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] media: iris: Add context bank hooks for platform
 specific initialization
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MiBTYWx0ZWRfXycKD/SYADto8
 r2CEdx2sxj4CVZB8hIVAbZyPOJh2548dDs1dgrxjBkp5cWrCRxXYF3m3WdRBWjjBwTj+mpuGwO/
 xfV3w+aL7YKL25Fa4r8Rx58Cu2q3fpE+3IVwMutFfvvZLftVQ/FriEt7/H20o+WNQ8JwKPOLwy9
 vLqZ5O85cjZt9Ik/SxX5vA8BEL52v0Q1b4AfizlTyi2PJmGHUp7wSEjcWuLA7ExPC2Yh1IDRK8F
 ytyeU8D24G/H7jXKqrLmm+/CU2JQ6EQCe5/CO7JKKN0NCst1jXrIusRYvAQW6lWS36Q8JA3JebW
 C8I/P3RDLuLTkKdQZ4MEAOTv3LKZYoBdXdZIDPo0BnmuMT25LfbRngmuVrJnqpubu4aZWWUOuv7
 XatFLFWEcyvwpURODo7+1F23fdVyr/RvJVhzqOa4aEnZF5S4ztPeuSWHiDgdxM+GoeT3tIQvD2k
 ZuWfGH98fAR/kXopg5A==
X-Proofpoint-ORIG-GUID: 8MoqnbnirOWbYp22jeJrWjNYSVGe-lw5
X-Proofpoint-GUID: 8MoqnbnirOWbYp22jeJrWjNYSVGe-lw5
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb4f99 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LctZHUKdXz4wyCJjwzEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060142
X-Rspamd-Queue-Id: 426A44DC6E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106122-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.
> 
> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

