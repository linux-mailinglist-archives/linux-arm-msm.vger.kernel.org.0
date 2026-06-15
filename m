Return-Path: <linux-arm-msm+bounces-113063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TComBeFkL2q4/gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 04:35:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF46A682E33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 04:35:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=djcq1xGx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hmovp1d6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113063-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113063-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50E3A3007966
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 02:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54CB24676D;
	Mon, 15 Jun 2026 02:35:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E26238D54
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490906; cv=none; b=Qyp2UNE9gRu2EKEiCcpmS5OxC2KT/kAxVT3NOzUweZoidprQJ+xD0VO5OJpzkyBqUs/hTD3ak3fMmB5duVEreQ8Tmav1tCzgaXNK9S+TIiSwHmIrrmWIrbF45U++n4U+csBdfLd5yzvR9k9roBsdAefWMb8gb18d/D+ch+eRpyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490906; c=relaxed/simple;
	bh=W/7n9BTsGPXhC0kfTEI8Wgc1IM06yj89XCro17EXdkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL8YZxWhXkUDC4yOg3sxYsQl9GDN0kFma+behTrgJysGes8VrdJXYJsne80PKBBD3DDT+5NpgCMqy7L9MZOZngw8gfqn1u7N2pksstkWuzSAEqFWEDzdRAfys8dN9xrx9F9yiHmZAvihYubJaZfuid2ewJyhd5MfjvufHVb1myA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djcq1xGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmovp1d6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hqrf2727505
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=; b=djcq1xGxm+uCJfKC
	OhI0aQux9VkqjKfzDrBf/QPCU84kQmsZTVG03jWAgqQIgU2NaXuHHLblHdRmTx3c
	D0RdjBXidrixAS9QpEOiZYlu5vU8UkK4muVbNLoRyTmjo9kqZOC2dqfQNWerzVF8
	HsNHTKxfUYjMpKIt/w40D8ODJ2zZIQhdgyI75PxlnddmnOuOB8rJTbi+4kmsNkiV
	6cIPjKY1R+on1GDuH+80t/GziLm7MKJ6ysRVIM7SCbLZNzN4zXNRMsFS/SK3WUD2
	XieavoyNbDeThcgZL2DfoZjguKpPhQLpYnn60bIuhUTqQynIK7xqZCCsqyVWOv9Y
	uVYJBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye156h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:35:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so50671785ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 19:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781490903; x=1782095703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=;
        b=hmovp1d6RBPNClxxpX9TNYZT8/R/FfPCVBT4CSm+yBCXCSlItT7v2MvYCd6WjFahu3
         i26NkJECJn8A9esSKcco+NtCqXyAjE2Rey921YQB65FSW/wp67v+eqkbhTDXubF1C00f
         S9ieaOfo8adje5KmjFkdVKNXNc9/g6W1Glz/drmgGNCHNspsjkGkIufko49pKLoRmQqP
         um1Jgz+pe3aBiEoU3O1S9+Kgxu3QoLKJu9iS3kiV+3gumQn79knWoPO1gjF0hnAPLpix
         wn8WUlCkwSFBPcsptidXGvzgfIfKcCzy4QJIrAahtGetciGSX17mUi2wADqlCVNTDsJR
         AKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490903; x=1782095703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+xrAMAdANe2IWoZAt1HoeNb1ap2Q5xfNcWHP37qP3c=;
        b=j75kckjeNws9f77oQc8EQm1rKjZ3maPT4rO3Z7TgoPQ3e3hWgteHaWHOUi2kMSkDvP
         l54y6KBxnp4V/nzVs4QV3jIQv8mVqnR73PW3iT8iP03CSEsQS1KbBJWPcMonQ9nCADaf
         9diPKlfFHy6E6fqB66Rq/Tz+RmMN/fEev4g85Q93VqMTaY3k20DB4wnZOyKUzM2Dw0Md
         JRhNpx+aA7X5uKtLfLDb6XBig2C095wU2o/QLH3sbJdTQNVI/FEzzBfwyeqV+MQI+hCy
         Nl1f113grvQ+WFrik/W0MFujTYBRLOevJgd25HBjoNvLeamszEx9dYLqz8kkMgE8lq+V
         IFdw==
X-Forwarded-Encrypted: i=1; AFNElJ+g+67Lm00SkAvhXzX5CPY0CQ+4sqVJ4tDJsZiXOcqKS/NEdd+1BTdV1ca0MAfArbe7uECD0JDLN1bN/k3O@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1cbaRzvkCphQNSQYALNUaHZCRRz8yU0RU5nhz9+eYZDS7Tbl
	WGqOjltsCCY/T+F9DX7395DhFyZC1h4RwP6qWqXsZ/SME+WzMpFJlvd20lZxgSjmwO93Q4nvIYL
	2d84d+xj/NhLddFGZ0uAKsmDDtHxwp2S56ZXWRWeMuLjq42WtRzT53FxGRTRULA2lPL9rLg2q6B
	q8
X-Gm-Gg: Acq92OHqHOqclDcPb7Z09hsFtsvY7X0nPm3xPck6Ty0zVPoG+wpwLaoiEDju0IUE+qT
	Xer5TayKMmNALmBMASis9g3FkE+COxlggi5WiuLJkobedZ/upmLuWZjvC3GznJgUkJtTuKRafmE
	m8rMfZSmS/XgGttdXtbM759dEttsF01/m1i+WKpa195cMOMgmksZhVZ0dHVD1nVhP9BgbuHFXBw
	3puvnn3KUiNOMz7rGw8w6OZOtMAFSJn7ktVCJxCQlFh0CwaNdlAupB+hkow/tsVDPuQ+QQ6Rukr
	0dy1aJe+MbijxXCmisakrmDYGCowR5M7eEHL9w6sQMaD10AsxfRR4C5VXEH/DXPaxmdB6lQL08B
	Js2qzIKC3ls4H/DczQVLMkOe9Jo0793ejc208jpkkbPUVYHxgg2wrAHU53Sj+PPrU+jrJ0Ua4qd
	BRdH3wGway6gSM3Fs=
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr148067975ad.5.1781490903521;
        Sun, 14 Jun 2026 19:35:03 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr148067615ad.5.1781490903072;
        Sun, 14 Jun 2026 19:35:03 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52c0sm84925985ad.13.2026.06.14.19.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 19:35:02 -0700 (PDT)
Message-ID: <d98e7611-4d85-4559-bc6b-79b85bf8dc23@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:34:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add the tlmm driver for Maili platform
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260522-maili-pinctrl-v1-2-0a6636f5c277@oss.qualcomm.com>
 <feea89d3-3f71-4ad3-b5ac-35ac57f2fefa@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <feea89d3-3f71-4ad3-b5ac-35ac57f2fefa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VFSxp7bZkct9O85eXHlpXTFWjuL66qe7
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f64d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MkT9_aAdxBhyvtWCMUwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAyNSBTYWx0ZWRfXwiGpUyBBGrYW
 xo3wmwEVCJbioiD6f/F03hsmpIpmw74lSHuPFMyzqBu+P8oAVT8jPoQO9uVscAxwtkRwHdLvMQ2
 V6gZ1RxEDynzs34gWoCTfKtFYaaYMpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAyNSBTYWx0ZWRfXxRa44wMnlbvj
 N9plRCyb7C58rSsWiFqpDT6YCDn2eer0JtJr/eaQmBzw12zA1t9IxwyUDMv6o8mQNkq8Rn8t0fo
 Gog2GhdmlEC9LFdk97I6jMAgIWXSoAlgH4KVqcLrhujgkqpO1Rb1tbL4iKXyo7tRMSSuUVHuxkM
 f2G85JlxcEeNMtjdlUd4nEK5K+rFkbq70UrQKIReingno0kR1hMPQyZokZSSNd2d7CdJS4j5waY
 wTM+frsF2O/vMoNyYIqFv8cPWD173B8ExMF6pZMZpIBB6L92qJbwgJStxhGGAcneTvPBNPk5cQZ
 o0qvYyaL/FnKSOqzgFGNQtR8pSGc/rnCdl2m2u4KlIUPTR1JMDZNBBCSxGWu8OLAZDvTSCz8Fmv
 IzbVLxC07NXvSXYlzb+VeJyQa+2eo4IN/yMhKVF/MzbH5+JP/CBq8z9HiwsS1etykzXejObXaCz
 AHLiUAGzZH3fJjmDgrA==
X-Proofpoint-ORIG-GUID: VFSxp7bZkct9O85eXHlpXTFWjuL66qe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113063-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,tor.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF46A682E33



On 6/10/2026 4:08 PM, Sneh Mankad wrote:
> 
> 
> On 22-May-26 1:12 PM, Jingyi Wang wrote:
>> Add support for Maili TLMM configuration and control via the pinctrl
>> framework.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>>   drivers/pinctrl/qcom/Makefile        |    1 +
>>   drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 1641 insertions(+)
>>
<...>
> 
> Can you please move "MODULE_DEVICE_TABLE(of, maili_tlmm_of_match);" to immediately follow
> the maili_tlmm_of_match[] array definition, grouping the array definition with its associated alias declaration?
> Please refer [1].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Thanks,
> Sneh

Will update.

Thanks,
Jingyi


