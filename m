Return-Path: <linux-arm-msm+bounces-98445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNiUMAyQumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:44:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFF2BAFEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6018B30DCFDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001D13CCFDB;
	Wed, 18 Mar 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVMvkRyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qw2+5jod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032383A9612
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833982; cv=none; b=VlXNAutzBIYpKP3GWT84eJhZA8TRTG7I/Bi73dFZVXb/GTbz8ikaQu9L6fbWBG35z5jHfQ/UQw/Iq+UyYtj/ETeJGTHgAelKHfLe9hG9gUCUQOkt/pk1DdO0vBjAm8rgof/xRUnPp+C+4/Z3ruAPBMcOni6ZGi2Bxed4wyiz0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833982; c=relaxed/simple;
	bh=FJXW/3/zEcDcRT6vsQx4yCfvNgCOmaWTUlZvN9z0JtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQ4fSjp8kCEYE4GGmiSCKNrHlrgTTaD+8tehDqPP+TYv2qSz6b7KaRzTPKr+5mx0KC84EdB36AX65pkY0QmLuWCXp5eFRGAj00cKigZb0zEGPaSNEhvTQ6j4I+Z7lYGxg3wHy+Gai6qy/C+9Y+eE5Stt5AVO3gqlfW8sVkf/YvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVMvkRyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qw2+5jod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi7ua008810
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lsGpyfes1iTFO709BjYvbLBk0xhDE3ZPzew/PUqD7M=; b=CVMvkRytT5dCfaUj
	vmmbraDBeymO4Rw0yDb4FmHhyzK9LLk0k+5aWwQvuw/sesBdc4E7nYQo8k2HVQ/h
	ACs2CxvUeyGu/0wDHonMWtkKn7HiJWxQW6MrZGEAEyRG3HBMWH68euP9IH5Qx+pT
	C8g2hDAVGGpjUxspmX1WhVEsaKRs302vv1hbaXL8ApGFFS6+syHwJQuoQRkaakxZ
	+sLrB6243J8NF7h3fU9cHJSAHWTWaHSmyObugqYzk4Zpbn4En8dXOfKeA/J25c6H
	SaSU4EkDb1x103YqFyv4gWwDYz1JipATQDEXe82XvLaEjKScBjAht4F8pCputch8
	SxlrGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj505ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so833863a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833976; x=1774438776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lsGpyfes1iTFO709BjYvbLBk0xhDE3ZPzew/PUqD7M=;
        b=Qw2+5jodMznapusZ9k0iz+R1mdbUMCnhJirtb0jwbCe1s5bxc824eGsxhDUJel/vjp
         cXi6PN7BsDYokZwwFcTC7Agdy/8HmeXTPypCpxQFqL7qK+VnDb51CrTaTiOS5dm4RO2t
         o+5mgHItAtyBOZS1b4g5Irxa4vmsscowfW1p/FRju3nO1D2+i5Npci6b/ubC6m6GeYx7
         nXt0EE9dUNbk7AE2i6vgbjp2w12a33/EfgddGPvA3W1QiiLBpQBbNJBQUP+xIFAmLA67
         I/1R5npdtQfnD5Ll4agFC23bRYDJnaUqb6ECRZqNfdjcHiJqF9Z4KBWivQlSZvn1SOkF
         Q/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833976; x=1774438776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lsGpyfes1iTFO709BjYvbLBk0xhDE3ZPzew/PUqD7M=;
        b=sRTIzKX2VE0nfaic9hMyAc7+ttV6XwvLLU2v7frPlna+WCYW0xvCF8QtNF8WF2v6uu
         ezTplX29D1XrOv/B0BJ6Xvn/aYv1CZbECr40mSTCzH8UPzuhDOSzbskOUtrtahaOkzKi
         hRvJUCw1OzZvL22K02sncxcHEYSg/8/UVpcL2HIRoir3V6t5xpmC0RbaILtoPqXVLcBw
         1deTRpoFMiU1fRfz7qFi2UWV5h4DN/G9k8n47VniPgITwi7RXgah6UTu/AnPrFjHmzHz
         zPu5vKnV62ZpyRubZ6ej88orsBEBX+XfU/UqhJ3Ci9PJJWqgM7isxmg3U0nnULSEDNuy
         i1RA==
X-Forwarded-Encrypted: i=1; AJvYcCXs5ROuiyIJh1bHisvi1+6hUCYcu/oYd9hHlC7Smqpv253acbPP9PMf6rH4AMQ0FJNRzkawsiu8nDZj76iv@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzR9e/GqzS+quJAI8BOtCf5+nl02og9ePB1MwGgOqecLrFq1O
	sMQkQIvq9im1q7Uku9t7jxlmb5ZWUgjw3CHXWqGqDfssanV7Yq7xdx7Xt7k4k4Kvpq2iW4B3ehu
	IjisCHYK9jkH/qv4FZ2rjeJSux576ZmgekF23sFmHI2NJAqTaX0LUPTSNvfqPq2dNvEY7
X-Gm-Gg: ATEYQzy5Wlj6wtMGvKS8Qv9s9u9UTRT2xktN6lQpQbTqWtEZWAUnPnBArjFKq1+ZvKz
	yRtBbmkA9+LdDiB4IPnzLTpiwA/cSUtDktqFvwJsFJWTSIDRmrPrnIBtFYmNmK/Cphw7CqS4f2b
	3fEI4LCSFui0/BnCSPMgr9dyBBjlhMi/UlOfrlw0bebCXx+eO/JvwKG+pP4aC5i3PHzwQnWbSEf
	WZEluK7JAtSZdF1cJXopxSfwXZQcShcTvqgwsoxmirr/BJ/IVQ2HgfkxJ+qZMBwY8UbGqCS0jgV
	4UCDwR+OceePgCdukS6e4j/Iv3c7XQxWqGODTkl0he5FceRvoVCCfFpdnbSnDld7LD46xHR8Fv6
	z1z8WH2IGIEJ4LWtLoRkdBSbvUWSgv4QNPRaIUMjdJINLZjND9l6WTw==
X-Received: by 2002:a05:6a00:12c8:b0:828:d9a1:c5f9 with SMTP id d2e1a72fcca58-82a6ae6d883mr2661302b3a.33.1773833975969;
        Wed, 18 Mar 2026 04:39:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c8:b0:828:d9a1:c5f9 with SMTP id d2e1a72fcca58-82a6ae6d883mr2661289b3a.33.1773833975506;
        Wed, 18 Mar 2026 04:39:35 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b597a32sm2665720b3a.26.2026.03.18.04.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:39:35 -0700 (PDT)
Message-ID: <f1da3728-4cc1-4461-b4db-05009f85e8f9@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-6-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-6-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OCBTYWx0ZWRfX4Qvrz5qj7PRJ
 MqAaI4dqGV6fRyXOB6gtAJJeK/dtG5Pa3FRVlfrV7xpco6n4HvjrihvoVNH2oGQb38U8puZBUtI
 hAKQPx2nmRYQg3vSKNazKh1Jni6CWj7pIZEBtmvSzrRmp/3Wr31Wdy8pNghbvvknD5QFMZ1htiV
 3+QCJoYfPspMqhFNCyepvScYzx7wfJJq8KrPS4z8pOPttnqGXAuUb2igT3xPk03nh1ltZXhRoXI
 MP/Jcwo3ZGElBJiHuOkVkDx/NsZVRdiFWPMDM2dACzUvTC7QAODOgeHzCdT11gZtf0LfHkMhK8J
 7Bw9WCxa6bfVyyCfNwRb6S1fehX9RcqoBJCYRT7dZ8f1a2oFIBcDfBHOZS/F4ZHWzlMSk96DjDY
 dK4bMiAdBrNl7g2Z8vkqn7g+LYvztT0I8fstYBd0BHL9wwQCoZqWzGA8Vq8AFVcEd4rjHIegzcU
 fwsB2JDgY67KDOF2G5g==
X-Proofpoint-ORIG-GUID: kuQgGEKBiIn6KLAU0awf8Cn3a8umV6KS
X-Proofpoint-GUID: kuQgGEKBiIn6KLAU0awf8Cn3a8umV6KS
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba8ef8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=49nlwYLE8u8VGWQf3g0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98445-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27EFF2BAFEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> The get_instance() is a callback tightly connected to the HFI
> implementation. Move it into the new iris_hfi_sys_ops structure, merging
> all core callbacks into a single vtable.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

