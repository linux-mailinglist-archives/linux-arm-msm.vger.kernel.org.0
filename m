Return-Path: <linux-arm-msm+bounces-106390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHwVMj6S/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:23:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C94E92E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D775230610E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7963368A0;
	Thu,  7 May 2026 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/3ZyBMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keZfJyB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7D3F54AC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159815; cv=none; b=og9hbpiXd51OPMgPIgMwI43Dq0C8Ql/ApT8qAjqB7tGB0Bpo9U4xgSFm0kxgAQmYfripxBKW801uu5F4uGIWPtM7cFLnI2NHT+0WQ3flGtDIbXX+wY+G+mHhiunmkpRXIk+8NfCgTP9mrUNQytbHBzKv4Mo2mhN/PeL+jITvFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159815; c=relaxed/simple;
	bh=6mFJIFXsdza4XEXxwuib24eKPzJVv86TyeYu8FjwOyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTklnhp8/R/DFJoEs1NxLrKM/IpUKA/SjI7ypqwPcj/1cOl5QQW8PcE+BGr4xaYNIQnr3rQTnG4vsWsv+aS8h3IC+veVIULUIN+dwVuNZqhOj2AHXo8KTf4fVdciyx+TVhiQHK69KIQR2FYC7ihR7phzkGAP+tre0iZ++biFFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/3ZyBMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keZfJyB6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647APveL150997
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L//Y102LyJw6sAUPlrP+tV4oMg5X5ISA2KjCfHXjWGQ=; b=H/3ZyBMWduB0LGom
	1UmNjfwYoi4T5mUNutGsh2/2dzhaHF4AN+vCC/OF3YVd+ERinOtXByJdPfZEmP8k
	TXdJY93jKM4EzjJY4f0XLqBIgkHFTwSow+u8tkN9aw/emr8ZYUEPrMOZgkkJmpa9
	4ZsSuLh9dzHH6b0Xaicv3BVi0PCVTittdQW6UU0B4T8GAuuB940FqQudY9gQBqET
	7QUZYPvAT7p8Vb0ZYOgAFdpB9rl7HjhMlYX9OoVAnpK3r/PMHw0krMMAGdf/ChXQ
	BEXjUuSij5t7KuFFecy4adKMrFU/7z1clLAnShw3jwna7W0Sg+zZ/AJuLkMSBiT6
	xTjoNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsxuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:16:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fe2d6793so17240905ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159812; x=1778764612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L//Y102LyJw6sAUPlrP+tV4oMg5X5ISA2KjCfHXjWGQ=;
        b=keZfJyB6Oqap75J0WHGfbzyxD0/UWbOLtC1w+X28TEbHwl9PRGK8UFnbrPEQVZdltb
         bO/OF935+9XU2UsKuE/0uF+dRPiBjYdm9x8K4P6iK98y3G5uCKqlvCW1oj5wll6C8tvP
         mkez1WFysOOtDGO469WLxGp/6JSNKcz5iDP84Z16wyI7cmSnyxPZJLdYoEDEZPz99J3Z
         0xt7+amyCCgsOhK1x78VtTK4bXCZdmgdjqPdWIEko3rIfUUh6G7kXm2myqkkmU+tVBZD
         vhLp5wDQd2heb9TY9ZstDwG5WDENZ+7aZGvOH7PsKRDSiq7TLLP6b9l62WxFBfocp/JH
         DBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159812; x=1778764612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L//Y102LyJw6sAUPlrP+tV4oMg5X5ISA2KjCfHXjWGQ=;
        b=COZ/BNnDO0PcpduFScHoamKy9PTGO8QTXzQ7QEOeo5RUYAoS+wMuGOP5LOYD9v/qwY
         BOA/LYsKYz7PUyvll8e145+9pFKX/xBsH/I/HDGPBZ0ihNW07ntYSLG6beoyO7hvWaFy
         oi585d2D9fbPQsymtliIYKeDLtB1UAzw+cIca5PJ4TaSPG4jHgbbb3w0cSEL4lGqysJI
         2BCKRDljkoisTYbgnWXBsh8hj40tD4EAHAyVaB1js1P58zVzlLd9gDA2kKp0wNW1IAWN
         dXumvP6W1VT18WBUaVhADXQ220AJFdYyEBsnSRNNQ9wWjB1kDxCo89unbx1Gd3Aa4Rd2
         xdKA==
X-Forwarded-Encrypted: i=1; AFNElJ813OeV23JTseN4nSbckV7Z6SbN+jaTT4lT6D/WU4bodQA6LLMIH2hjlD86Ajw79is0sftZozE1R8/rnASk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44wqiOHYwcXTJ/nwOHq9/8UX4ZDguCcLjUKjSE3B61JHRX/tW
	L7e4DOLCPQZkTV+rDS+dy6uMKRdirg+F4KsGcu+afixb4P7a7ZAiqqzzhGmkhv6Kkt7hpMFgOlC
	/n7mJS8h1/msOotq6beRGQaYjpmCihfXXJdJpIFud9agdbOFbLU/wHrD9vYy2TlUBCES3
X-Gm-Gg: AeBDievpvcfVvc9Z1+Jpapjr+GboiRaYP/rowsrISm5T+Uj3/kZ42KQUu7KGUKqyu5L
	ISoeXGtId68UqLkkedsm9H+3OBxTM86xpNxC4HXRW6eF0YgiuluX5PlBR3ag6og01440zErJnxH
	NgAE9nscfkj6jButrBwLC+1eHyf1OUV3d9vUDOj8cEoExyYdIXACUKYtytCRoIuduJSDqdAy7A9
	OMPhtzOylisIG8JRBB4CaJWG5dYBE0V/6Y1LS2qnVrA6RFLu9LUD2gHXDony2mkYz6jtZGCzrjS
	fuGEPCIL/+vZN7s0RHfBGK7NPseTj8A9fm32ePXyHHHOqjHxVefKeBNnOHrpMEVj/n6+TCqWhWW
	9xhQwJTmyI4JSPo04jtbhYXeetxZLDPz8h5g5Du1g/gx7mW1j4nfKkvmYcX0PVJAp0jI=
X-Received: by 2002:a05:6a21:6d8b:b0:3a2:c685:f9af with SMTP id adf61e73a8af0-3aa5ac432aemr8576049637.50.1778159812166;
        Thu, 07 May 2026 06:16:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d8b:b0:3a2:c685:f9af with SMTP id adf61e73a8af0-3aa5ac432aemr8576009637.50.1778159811692;
        Thu, 07 May 2026 06:16:51 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253582a6bsm2164561a12.5.2026.05.07.06.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:16:50 -0700 (PDT)
Message-ID: <9e93df45-557b-4ac5-b762-0d7437df4e52@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:46:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc90c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sQl9ibgnB-ql-ZCiWtgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: otiDqRwSjZNxZv_ckkXwOAFUSCEAeXlm
X-Proofpoint-ORIG-GUID: otiDqRwSjZNxZv_ckkXwOAFUSCEAeXlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMiBTYWx0ZWRfX3DeXzfwQP3SD
 SkEa4Pg42tAEIhYEJGFlScNxW813ET4fOR4OdQfs0TVsUpmNwi9PuFc7ZYYUWNX+EWP8SJu8nGr
 VFnNfUSPLf5v0o3HL6TLe+mFuSkD2EHJ/kcfGcALhsKQifXi3D+hG7gjlBN8OFeFS6erKKjfmmH
 Kzx51tVut9PfgYmaZdqHtfNNSh7FkemgbYMwLQmTLOa+Oi87AN2GI7WCGfLdKc8c2ISpfn2YdFT
 HmDPahhfqqBKD2l1f8BP/ZYnqRdqk/Z/WiE+s7C1K9HQ0kI/DIoLmPyBkZxhgYIu3Ye57fvDXYK
 y9S9naqdTDAd3J4CT79ZEp0DYVJ6DAYkiyqejZyGYDB4ETo681ColNLrEOCLm6S9kHWKuip8tmL
 ikfue6k1El2hJfUEuBhcq3k2zxr0tYpXj5vWIwWdtyzPqOXGG7q0asMT8t3CRM3uJcENfUvG0Pi
 ylsGcviToC9FfhMvFgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070132
X-Rspamd-Queue-Id: 385C94E92E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106390-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
> from the currently supported VPUs. In preparation for adding AR50LT
> support in subsequent patches, introduce a platform data field,
> wd_intr_mask, to capture the watchdog interrupt bitmask per platform.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
>   5 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

