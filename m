Return-Path: <linux-arm-msm+bounces-98423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EB3DMmJumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:17:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 854682BAAA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDEB321BB52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C033C6A39;
	Wed, 18 Mar 2026 11:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6Z7Sxue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKOXExZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C43C3C05
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831842; cv=none; b=WhAT1TZxDq/b0x6lSLn816ZwXMjtA5Rbf/I9a4kVUVDtsMKYVT28b6kh8UvQMFcyNDfikxrNFVf/VdI/cbO6UD1s+xfENZxmqhvVEzrduXpebKH3QHCyhOTZ8X9/vWXgcB/5RBU2+N1OeVx/OuC7teRiiTYcmr/mL8FCrAwnnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831842; c=relaxed/simple;
	bh=2kZItgv6ifH8YnG6fdUuM7E7J2tMujlHwJncka7/TWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXM/3/C15TuWnjZ+EsCxedoQv36+wgnxHcvh8zAvk6+Y+5i/dZF9N2eU49TUwreDNh6t8NmbPJ7mYDk9iLbdq8+hBZV65hboN3cRnR7PuZ1C7vGBE7vELglRV9/7XlZplj9dIni6ClZQVgP1Jv4cx8MZPDVFBBGnTKT0LdIeDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6Z7Sxue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKOXExZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8n4LH1145420
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l27kGiRX7dI30J6EC6k1fn7WzF6nT90eDQUhAOwj/w8=; b=J6Z7SxueakjQu4zU
	E1+p1xlgEoJkJLMF0dKIT9s60/Ntavr9zilrE+zAR7xYmr6NfLNkIrMgODn90kkq
	0EX1nqQLwSYBLpTEc5919uh7dAq053GWc9nBulQx77wWIaPiF7SOBNZaOJ1GKC7H
	sOJya/y0rYAxKqggxemMB1MmN6+ei/K7iMXJEXZzf0Q8/+SYHH9yGHC/3ZTZNdMU
	/byZRI0bULWgfiyRh3vVD2aLE0nTrDBq2jwyLsUnL6r/1Vbz9hcLpDNAP7qTE2SZ
	NeqH6/eVzMRdRYLg2cK6KqBWnSxPO0tlDlNSjNzMprxhovDkwGoJvNFVfYn3ijwH
	Zb1kLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uwvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:03:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so16716640a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773831838; x=1774436638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l27kGiRX7dI30J6EC6k1fn7WzF6nT90eDQUhAOwj/w8=;
        b=dKOXExZcZaWZ0GfRHOr+vQT+y8HhKqjiSzFQsjEDRJXHEctgc0A+2AOZ+4usoULLJ/
         EcrA4HoIuV/HMLHd6Gf4zvKwNC1JR+eLeppQd4NMj1kBrDNeFdunej+ZdYdcmjafDkux
         f3R4jcqQfC6szPc6/zuXxzqvrmadDPEq/QknaeECS3ImB9OKgiNY8yQ2HgZTyGOe60Vw
         94tUyy8pJT0npW6AfPoLeYWWsq3rrpF8aUu7c1j+iDnZ/e/RhV7V8l/linb6bpyKBUUZ
         2qLBYTHk3AyZy/ahgZbg+PmfYxyEb47wZwM/4eCwE7dKHeYukSP/aZlrgJ3edVp0eRQY
         WoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831838; x=1774436638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l27kGiRX7dI30J6EC6k1fn7WzF6nT90eDQUhAOwj/w8=;
        b=Q9HjbYNemWLxtos0ZIsiA0n08VsvBmgaF2nKJqBzAMnTnnmPymBkzt65RqwkJJcayx
         byQx6fnQK5BRO0v0tBtPPfF7cCYDlhaK8COiH43FLwK9I4ZLhjpX/eRDt+KJ2zt4lu6h
         QiTdxjqRMUv5iJ52egrNPwWrpkIl6vSzHv9CdDWRCJtJs4FixKFPi9Ez5WnZiv1mOa6X
         g5QhSgWOi83sH5lyDbYNJg4Rgyo7KtzAtaXpfdV+l2bewhjDzZKiRfqs3JY5YTjSIzfT
         Rsi+pN3BuSAAY5fb0Yt33HzYfOO17eELJzvoolJjJt6P4+z/6g2Pu/srBDHKZte/O5Yz
         wTXw==
X-Forwarded-Encrypted: i=1; AJvYcCWUG/HR8Z1Djq2M6DYN8ENRd7dRUKJ1zJ4/BfdPqf0ErQMnBsDaARnabNOLrHHc5aNuGdSUVGx4NhZ/COvK@vger.kernel.org
X-Gm-Message-State: AOJu0YwW46SuBfGI6/VqG5IFDcZsUrRRgjOmDFd0eKDM7n1h70366u5D
	BMvOk7DZ3gERZ5kfqGKlQolRnHRgR6J/oPTAiUQLT4BDttga3Uq0zKvt0+5QunizSAGO6DqjcY1
	DKJUl6Fad02ywUQW7/GrZW8Fy/pA9dI3TRMyctCIcrHLc3QI6oWXbCUXwS1Q8Hmzy7wq0D7VPlT
	fO
X-Gm-Gg: ATEYQzwiM9kShBR8bE/O9P1qeLpOa1WIZrsrGcC3CmjjuCUhL3VYaM6NoCbblqa9MQy
	iGVbkFAwKkT76YB9BBARNv+VJ+/wc63MBkEYBC7TMs//eTtMP2zyHL41mf242F1KI84ScVkVSjb
	rpDZPnOUI4XCmJHVPQq8V+E8Nl6vr2mK7pxwpGNgjkRZlr3HiEhmeqolC4DUXD2akf/gZUKqlNY
	6gaMq2gi38uAymGPTJ9EQ5EeMTXHhm574QQNX+dsA6A/00yN/Wrt4dtXSSEqOTXevPgWk1vK3qm
	Koi32dxXEK43dziFY5URyoOdRiokeEClB5teLrJJh1YhkjlYu8pLqTpYcwnxulwqLL/JK7Y3aON
	JSHUSR8lmsMhybvHL/qe4elqJan+ryp53stN8pU5BdMCfhlMtn0BjWg==
X-Received: by 2002:a05:6a20:2444:b0:398:8127:e518 with SMTP id adf61e73a8af0-39b9a09af90mr2685860637.61.1773831838282;
        Wed, 18 Mar 2026 04:03:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:2444:b0:398:8127:e518 with SMTP id adf61e73a8af0-39b9a09af90mr2685828637.61.1773831837725;
        Wed, 18 Mar 2026 04:03:57 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bef2241sm2413826b3a.54.2026.03.18.04.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:03:57 -0700 (PDT)
Message-ID: <7eb3278b-1ed4-444f-9c78-3f2b20a58830@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:33:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-3-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-3-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba869f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UKym11NecJYO_-LCFOEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 1Ot70dvGu-kbpGPevTAEAhrfJ0FGJV_j
X-Proofpoint-ORIG-GUID: 1Ot70dvGu-kbpGPevTAEAhrfJ0FGJV_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MyBTYWx0ZWRfX316OVHlAkU/g
 kpLHpjMXYh6OezKPwfKD9o1CwzqDZkFsZ4FTlVCPHhQoei+hTNTDb5jj0E1NJL4XAMV4OSeA3A6
 BFKtaohACNpFBYaQvD94KNYJYAEBQHlwC0sNxewxUOMkEB9p2eZlELVpBBKCAIXtxGtB54tK1h1
 PILaTZ5g7kQapIlm0QOMX6WgcDAFXVxhMkDzbvv87PO/EiYAjpMDza7q/PRhmCtbz+HsGMNzme/
 gHDBqI3ZpTsrUW4fC/D0xEr3zsmOkBQQksDCl8ra2TNe+LcdxBYpSNSSkX3rLFEISYqGsE4ccI2
 9zNcYLT7UXSgqLbiTqUhJXSSEb6gcOxlHtKFaoroYV/a4Zo3V4cv9AiSygOnfOusEpB9OjV7jaC
 /QTygUsSpIX9PBVya+xFWJPPbpa+KBoFBmX5z2uiuPiuR9nryBWd/NHSksVqbgEkUtwOUFtImIt
 PGcOxhrwhA1CtMHGlKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98423-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 854682BAAA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> To note that iris_set_num_comv() is gen2-internal, rename it to
> iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
> set session property (like other functions in this file do).
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

