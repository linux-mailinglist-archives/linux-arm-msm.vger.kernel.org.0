Return-Path: <linux-arm-msm+bounces-98110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Le+KmscuWm+qwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:18:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D52A66FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFFA30C1F96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F70835AC12;
	Tue, 17 Mar 2026 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQ/FW/UU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6tFopZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357835836F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738808; cv=none; b=JL/e+qZhgh2O2EUm7UYPO/OJYyCYO2CpoCcxgYlolraHyDlwDI44E7vs9+kV7mCMdKnMqYDU0o/Unwbjrei+L/DgOwl3CLZTHUvpB3jtuWLNsU7kQsBPA3kA+pF9Ir24oJocp8Wm+9+HnMJTSuDUw2f8eKprVPDJPo8I+9phfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738808; c=relaxed/simple;
	bh=49ZmSMBa3fIbsc2bRUAyFXHJMaHOr0WIFqlPhvq9Mrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3m63qDDmHZjQOdtmy8xp4lxSylhqUzdYjZ6stOq3j8SvcZSda3uKQXm44VsL90Vq2k3bs7o2LisU3yEegZYI4gcSdaW4Nd8UAUVP+25t4VMFP2KyP3uFgRPrlT2bG+LznuXaI+izMUttBEIX5xOhsorXhvRTxm5R0oEgARSE/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQ/FW/UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6tFopZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4q3mE1428759
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K6SGvmy2neqF7oKqmqCg3YHYc88NEF8XYNqYOQhlac=; b=fQ/FW/UU5xsu0EbS
	7t9QMiIdW4DVLUlV0QwaEQfDJQ4y4+DhqyILGSycKXBCmDDcwe4W8NbXedQRQNzF
	AFvMqLQlmvtatgjL5NORZjgvNAt+ctqBXJiNNBCOP60FNG2rWTsF10hP49rcthSJ
	SYBJdFs+6gjktlAzvLbCvK7sNP7hAiGEQoNYeN4S112xByo4aHTF+ejEnRf6/sBN
	0xxiALkXyzZxr3R3Ya+5Spid2A1RR0TYq2DhoWpZLQZwES2gVwFafrZenTKPFcf4
	w4NcoU7Y4PdH2GQM7Xtc1fIsAQaRQDIoagkr+vy+owmUgyKE1QA+Q8pOrvy4II8f
	bPCOlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99c30n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:13:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7604c6a8so383360685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773738799; x=1774343599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6K6SGvmy2neqF7oKqmqCg3YHYc88NEF8XYNqYOQhlac=;
        b=N6tFopZuGmtCtqLeHYHCrU1jNJqkuQUeKJODWTtUhtUHDCbiXtp281fQiSu4gIRKHB
         IiwoCV4XeENDm8eUEW23HT/IMdYZnhL22ZSEgYtTm3siCeZjl7gO9nWbpGuea8HDH+ki
         CVMfm8cEur2DrG+1y38fNgQb2yJLS+sI8gyc0/NjbMq7hPRiQvn45njvHmZSrdatXyyq
         +4OZQvLteOfipZ6pR3bi7r6Rw87XpnPyG3AABNnUXJAuDTNn04Wf8gxtm4MKyxuHTDSz
         7SK7zibM4O5dug0z3gbVSeDj1o61UydLRWv76pLabEsjAUVMHBwYDWjXOiyav1lhnT+K
         B+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773738799; x=1774343599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K6SGvmy2neqF7oKqmqCg3YHYc88NEF8XYNqYOQhlac=;
        b=cy5LDRsoH1WuGFd55reSA8JSBDKJQ506LfsQzqu783WP+/Ky3xqar/TvV4fugR4tTh
         2EE8rZGJsqqIpSwh2HK7S5Ap46SGEEf95iYCtx37XeDaqBXqZ7mqd95emgS31HpDNMDG
         tAWrOr87aScOf5bik5er+MatJUBQLnHsOBEdxKX13GeXzDlItKl44W9A21+o/CybD+3s
         DEc0ep15+o8OIrnmxSmtCCuZbasEcg5S/xK00JD0W829L1NQK1ukIqYj8+P/dfiUirph
         /FM9gdZz+K2YnO49EOpS71mVEUWhxKHiL0QblhPFFDFCZ4pyRmseHhjcaamMqp8x6vYh
         OYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwkeAWkxTr/CgL+HBHyiB9ZFY1230y9/0zZOiH5CdzoWzeEcv7W0NnXfpVdmJgnLrD4Y4hU2ZLMSLyZkda@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrpd9sXKgvPTwS/p5cfTBPmGBGRbPswy6rMrT+2UloNRnvGXS
	hBcEbyVKRkdI2LVrwo6taaqu0qPtRrFjmrlMP31M+5klHKTwA/EALsLFosH+Jvhd59yIFFGWheP
	ozKhcpoeDOM2u/9o5R6Keg3WqIflUFytBXKqohOwm8aPwEXxvtNMxBJg57Zl3IjJsD6G+
X-Gm-Gg: ATEYQzzYeWefhoHmuzQyfFf6THX7Vf3URK1mlcsCYd3QFLIAYXv2pVhqCPkT/cuiTIu
	fpmAhKvjxeM7tpi185Bd4mA+YqPN7sV02yVMhCm9tesXEjDTZ2ULu1scw9tz27nysger/q2KR6T
	n7pC9k78dhfHZfSYp8ikQybT/hq09VoMpH/gPhOBZI/Cv1/M40WLpZgnAG1EQXfwuDeL7yaFs98
	meITUvOGxf9ZFRLJmkNgoctBvJzLcC8P5WzRH/wwNZ6Ku4Ca9zfRgDmLjAjPnbOy1C5ahCKPefh
	LuzyVdNjf/A5pENrdQDkr4aNAFYs6XVucxwfI23gXGvlXr1Ek8rlvhc+d91gABH4xjRPK3Lx5Ix
	t7bUe+Sv+/zcRItt9p4U28qEi7YjToQUDF7tHGm1rjW3HNPRmcfe/D3Z9rD7HRIfUUQ6ZXXBj4o
	hzGJE=
X-Received: by 2002:a05:620a:bc4:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cdb5b8cb21mr1682552185a.7.1773738799289;
        Tue, 17 Mar 2026 02:13:19 -0700 (PDT)
X-Received: by 2002:a05:620a:bc4:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cdb5b8cb21mr1682549685a.7.1773738798737;
        Tue, 17 Mar 2026 02:13:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97baaf7a51sm326081966b.40.2026.03.17.02.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:13:17 -0700 (PDT)
Message-ID: <384e46f3-140c-4b88-a3c8-6cbb57ecff99@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:13:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to
 report errors
To: Gabriele Paoloni <gpaoloni@redhat.com>, mani@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: mpapini@redhat.com, dnita@qti.qualcomm.com, rballati@qti.qualcomm.com,
        bijothom@qti.qualcomm.com, wchadwic@redhat.com
References: <20260316102618.7953-1-gpaoloni@redhat.com>
 <20260316102618.7953-3-gpaoloni@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316102618.7953-3-gpaoloni@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b91b30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=7xeWrTpDXsmdGRf-d0wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MCBTYWx0ZWRfXzyIYGAen8LXA
 lWoPq3qUueX1mtF7dBWNewqOCo1SFNiqFe/blMUIwOxbufpG8LfTzB0xYD8CRXOp7wM2o0auX5t
 HAKumTfsS+G+CZpbfFl+iozA56XAJOfOB83yBAup2hWdxw9ycsU7yZqXeBVRwxZ5MFr62pSu2NT
 bVlV5PlfLwiWslJ9ViT/6YTr414n63rkLtEAnokU5bZLc9EK06kKG+wkcP/wHrfHD2iwDYG1i1Q
 /GsryJMJhgLfgc8WVzDE6bxZv6uB/+A4fQY6Nq5zuOE+3oZk/pPn5PQz5897pwMGfhiz9rTftzw
 S/XAI1w0ODavL4hg52oxroEx2B4LmvIC2U3qWq+ugSPUBL7rkBtn40R3du3//WOTiadfcJZdl44
 CNSPKA/cbEJYw6oyHMjewhDv1TwlfZo96xXyMtuDEn9xZSue1qkMAonyCBTybWPPQ7zKDj/1W4t
 fflR/24X9QYv1ILy6ng==
X-Proofpoint-ORIG-GUID: He3y9Ip71fLUBGbJEd0NiflEtyrT3AET
X-Proofpoint-GUID: He3y9Ip71fLUBGbJEd0NiflEtyrT3AET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98110-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 124D52A66FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 11:26 AM, Gabriele Paoloni wrote:
> check the virq value returned by irq_find_mapping(), also
> check the return value of generic_handle_irq(); return IRQ_NONE
> if either of the checks fails.
> 
> Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> ---

It certainly seems useful to inspect a function's return value, however I
noticed that out of 47 in-tree callers of generic_handle_irq() within
drivers/, only one other driver (intel_lpe_audio within drm/i915) checks
that..

Similarly, many other drivers never check if irq_find_mapping() actually
succeeded. This makes me wonder how you discovered there's an issue in
the first place. Could you please add some details in the commit message?

Konrad

