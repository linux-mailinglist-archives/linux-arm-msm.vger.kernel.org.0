Return-Path: <linux-arm-msm+bounces-90769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DEhIwS2eGlzsQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:56:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FA5948F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39613046016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709023557E4;
	Tue, 27 Jan 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCrpUSk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3V8dcRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEC3557EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518341; cv=none; b=Oh98VAjJRYHDd1cA2i2PTveLjUMv7RgRm4JhWKUSX3SS9p+jp8bqKsETD+NpskJDaGgJdLxWeOAvm2GLtmoVvlFEF9GSqWSekAnEbunsEQWzWEqpyIhTlmBaCFZCHdnQPuBIXxfUeZXY638XWteG/iJ9+umvOrO8AnbZKviyWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518341; c=relaxed/simple;
	bh=ne5lGuOUXvClLvLqjxO8ixhn65c+c0RN0P+7qSgqwwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNadAZiogjIOGYGaRvek2s+pR0xBn93ercguB/gwl/1Re7qNDOBGKK3qVgbELJeYHXOf5Y2GJiTtWfSuNTpM4qmF4fPbJF4y5qKf/781l1jhXzLMKBFEZBnfv/2OaOQiiWDGjfK8BWn33d+V53L/DakAZGa1gimnxCiaPSq1jZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCrpUSk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3V8dcRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAHAjY3714753
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=; b=WCrpUSk0Nh9wdcbh
	Fo+ten/wdGiQOiLHT0QyBFfckfZqc322d55xRVMEuU6g9EijEwIXYb8H51/vA2xf
	0edmpNWQEzfpjvPiCic3HxswW09BjH7bU9X+3Zw5fxmK2nc5a6N3BbSHVoKJ0Ztn
	+HSl2F8O1sX0y18apoVW9+Nh1PsWZRqhzTQhJ1/pbdvlJ0CSGce7fHmsr8EmknkP
	vdy4PLdcvYHZGqGwMVnaxlSqWpQbNlHyfssC2mDNKqptrTJgtB++IVG/7Qj4hUJu
	auqjIsXl19ZieAECUNN1OTY0auD65XyZc8eEqVDIkEfl9ApVUPNhqjuLTAFQ68ct
	/mpayQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0b0yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:52:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso11020383a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769518338; x=1770123138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=;
        b=a3V8dcRoAb3dqFMAzJS61tZze5ayjgorIjtMBXPeDfY9D+5U2ROplFU7UL4oHZtXR1
         oC/XLfiQ7jl3NANnzn31yDRIP/6xgKwNfBaa29yBauqHmL1F1UMjQ1/Kiyszi3wl96Ui
         iuVYxsopKqQLIblT4SjQu+Y47kxyEKv4bBri0LltFFLmYb4LkZPMuFx4H5wZTTgBQttq
         2O0h/ae+ZvMqcEXxd845nFyvVDzegsf7ChTfXgKqBP1Z4+gpst3tEzdNkcmcWoMr27d9
         9Q2x1rgBp9gndUNniv8EHMrUzHVJhd80a7kVa/Gi3hSHpWBOmB0/XR3RQfVeQKDTyTSf
         JGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518338; x=1770123138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZmsUZzOar+YS2D9w22Y1U9KyUG6BCOh6hWMj2EvhdY=;
        b=It1nRKAeewOK36ujSxGemmPeamjn1feVAgE4Ed0xjhXWynUzMB2vnWUZe+cRUNTfYb
         SkF1avK/1Fo/xuiqOj6sNYiqGR+EmV7H/6+zKlOeDOUKO6NEqu1NR3F9f7rhkXPNec/7
         WVtcJcItYLdq66XXPGWEsugZnoV803kMAOi9HpzPhLC5JLaPelNnT9iis3hm01u7+fgZ
         9p1NfdQh9av5J54sat8vaNPgti1dnIhxkAnlpYnRtHj0H7zTLxG2+jEVYoSC38FrcaC3
         n0Y3BRyhPsGytb1zICGTZlOLC/V61bTlADWFn7sQUoDyZjVeFOBl/qYnphlewJzjbMjc
         ZOrA==
X-Gm-Message-State: AOJu0YzYiLHjEYXaWkuwyM08PKwidqz6wcOErZHx4ThB34Ed9fT2NNks
	3K7Sis71XKAyAfnb0S9i7seJLOU5xdrUZUBNs7h7V0/+FfJH/4BafHlLdEp+3JZ82D9dYQ+sBmi
	LZlMjSHc6iUsoAyEZClzcpz+KQXejeqgH0jDtx6L5SVXzpaPhInMmPTxL7YL54/9zJ44Q
X-Gm-Gg: AZuq6aLTyegCC8kDD91dgdrB0+lupCJrpLtUJvslL61VSvqV6Yq1DMJzxDV4206sr79
	b8OhLRZl11YA8NGBBzi44GzpTpW7ULmVBkMeA9+i4sqwuPWf1hLV4vjzS4vWrkejOZTy/9c+gyC
	hIIqTk0B/vKJBhOlJSeBiyA2AQ2mvpjjNHGbftVrEkLw59pLT+XZsjYUSmoJgDlCi1VWVRFL3tr
	kRYvNT3YwosZ5jqg5s5nedRR/ggOhqqKUxJzMvjsUybwYgpOV2jDl26hWVmo+/rxW0enskEV8Vz
	lna3JaUHEx5oHmPs6fxRRvGgcce0lJh8zbjGSq7OVjuDONSa6uldjA+b0TTJau1hVvGWyFiOBIZ
	E/RgY40VttqXIs6ZUecb9DUklHDE1s8ng
X-Received: by 2002:a17:90b:4a88:b0:353:2e1:9605 with SMTP id 98e67ed59e1d1-353fecba4efmr1642193a91.6.1769518337650;
        Tue, 27 Jan 2026 04:52:17 -0800 (PST)
X-Received: by 2002:a17:90b:4a88:b0:353:2e1:9605 with SMTP id 98e67ed59e1d1-353fecba4efmr1642162a91.6.1769518337184;
        Tue, 27 Jan 2026 04:52:17 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536aeddff9sm5409630a91.0.2026.01.27.04.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:52:16 -0800 (PST)
Message-ID: <9d3c78e9-db4f-4ffd-9097-f48e73d62c8d@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 18:22:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sg5o1SoVyv1nSta2v41qivEd_PIonhOn
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978b502 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hxDPLbPtHj1mDd5Mi3AA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Sg5o1SoVyv1nSta2v41qivEd_PIonhOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfX6f67MnHGiQO4
 R6fo06wqdKdIrDC3sDejVfq0E+NTLP/vVvkxpTZp8RGbX1wb0QV6xvcPjV4Tgoi/hpT4gwnl/RR
 BsTzpwDS5Af4eu6HyOAPpti4Reg6F6hNu8dTaqZ7DVj3ArTC1ES8PFBRRE1L1elMXi5opJYiRll
 vT1VYgqBmIJVcbwunuojQlS8ybkIHZGkpQdi8VKNGHY8R+WF7qroaYDZnUnYemxb9iu/XhK6NNN
 +np5t27klpBRj26Q5JDFGTh5auZdPToIpUz7z0/LhT1II85BU0rirjyPcKVC2vvESG32X7LbjRR
 VBg/Tv5hg9Cx7sSmvUKKYsXCq961v8yW+aIzsLLTD9ikbUBcMeBIOnwuRetc2g1KcQ6fL/HXYAn
 QYzPC1K/IruKKZsqG/pv+pvT5S2if8MBNmfkAvEeNJE4atBC+BJCLtjLZEpSvzRKELWCaS+BjCj
 zUeKPZxDL8fWXebe3zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90769-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37FA5948F5
X-Rspamd-Action: no action

On 1/27/2026 5:41 PM, Prakash Gupta wrote:
> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime-resumed to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down
> SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with arm_smmu_rpm_get() /
> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
> with the SMMU powered.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

