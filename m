Return-Path: <linux-arm-msm+bounces-113656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ChYJNCuMmpN3gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFC69A860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pYZpfHLf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ll0sdbdf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113656-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113656-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EEEB3036612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3412175A8F;
	Wed, 17 Jun 2026 14:27:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698343BCD31
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:27:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706438; cv=none; b=XGRGTA4qn0tSpLQUivMGRtFlRKSK8zpnJrFJS5fdkUFEOw1dqGsDw6zL/HrRRY3P4NTyQBrBViENnj5JBxP/svBMvEOK2nPLnv/0F3lK881nZo5ZvwLGkExP1BHtaS1sgCAu96A7ISSzyJ1vuHNeBkyp05zJJl7f/n56jXbjens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706438; c=relaxed/simple;
	bh=EFS4n9bsWshz3xpJubMewbsLXsLLgJQrJAAdzYyeyBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSqfmMh8jElhz59w4Q4BsqidfWUuc9stTLFtuP4u92d8DPALYsaVlTbLRlBxlylps/2NPrG0uhQRDNTOWZ7AvRfvdEFmQ7qOkm/FNfX7jxHhGHriQN9N3zRe8TgZS7v9dyT5VEXHprse0HGwiRSQJyhfYv2X9kOaftGG1Tk/K1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYZpfHLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll0sdbdf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEEAAe1014187
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=; b=pYZpfHLf8lAVSEK5
	oidekzpgaXG+tKHMKtwM4AywhOMkdMed2gpUy819AdhqlKGdmiwOOGDWNkm+WCaH
	BiI8Qsrnz+jMNq/0XNVobb307i89lGEBr7EaJhwLT8E614PEYN/jmyFheXY+BwWR
	MhpWfczEBmrZhZOxlB0Ylj2jMD2N6LuItHe7PPxr5odRCxfi5ihi7d/V1LVI+QP3
	Wgyt6abp7B2FzbjQnzYP8CdTCpD4g8JwjeG9IWWRRMhdBanLCUJx8YX+vhIv99rS
	2djDPxN5P7bfZEltrHtk1W6dQj3cgTTmsZOT3GpmGQ0P0QiBj5jKoKpBQbGf4Qu7
	5JDAxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepkfub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:27:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c6cc4e179so1493064a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781706436; x=1782311236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=;
        b=Ll0sdbdf+2eIdgSe/w6ijFWOXKKtirtdQAu5iEgRhPW43r++Ml4dAyXYL6I0rczUc/
         iNRCg2bprMo1GCuGRorxswmcz1gvJowQvE46gGw3Yh5dxfg0Q21rS1Tp3lajUAjYHS4G
         zhXRPHtZPTplaX2iOgLKfzHSJaDyCRnSuNHPRfBcv7JB9uWIglB5PACY3AoutHuAnmyz
         q943wtBG+3N10By12vmUZjSNajFmI6GuQJGCsO3ST68mxmVPoND4ozPEvVl8fGMxXZ8K
         2io8qDMKnyu75BW7pkL8QO0z9g+AqYFVJzQ+hiRhuZA1SjqRT/NQbPCbSGO2r2pQxBHZ
         cgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706436; x=1782311236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=;
        b=QLNTyubElSR1LPujGqqxJ6RG+ThxTTv0ItijsRboSuyJq9dymcKUkGfqJ2LQbI1OPn
         vSUecidk0VheO3yRnLuDjIHS5SmzTxliluZHxrxDfPp97oF2t0nJpz18Uh3FT8vIGIqN
         /klkoM8Wp1keNUZwAUpzaeccmD6Kc+WI3HKXg9MP/9xh6TvFPB2xzmIfuXtMD9GQfxgu
         PN0WH5LbzdJcu6gvfGFTHb5xBoXFmOc+HSnIGfULSFdMt8TIufTaDpuq0xnAQN7ZDjOh
         j6XxjV4xCCoq1O2v89MrplQ2Ql4DeCFqvjDZWWAYyHJJ4MKqnYRwRFBeoO3397HfE1F/
         nQwg==
X-Forwarded-Encrypted: i=1; AFNElJ8dn2Z78Zxrj8xc6wtrklrUKzZgnhSoPnY/8mrZMHYVTNhyTZxUQojstYYwN7bNsIbAInFtgYfGEZKvGE9M@vger.kernel.org
X-Gm-Message-State: AOJu0YwEsRGUFkSLwcLpxg/7FpG6WFUzI8tJWceQlgr/l9nHqYw2JB9c
	qVDk77WBV1zk1HGjpsfEx2bIQg/LY7lWVdSI/jPLpPJRo3Bj0wgmDP/BtuSM/MAm2Gt6446B70n
	+IlcKxWXhW1JsCzQbp+QkXE3syx4jHtd5JwczePGAHuZiV7qkfCobskuBaYTUURHwHHFl
X-Gm-Gg: AfdE7cnskk2ZNvzcJlHO7yI8ls4Cz9o+cYXrJ856Zr0MNSEsLEqg3orkwZ3pfemBwa6
	7BVqNJ7vny2x42z52Zdvbmsydzc8z3VXTo5Ad8f1rmoONa9nUI6DY6ertQ+O4gyMZ664c55m3Pa
	Nud4Y9S5LdJ17vdjJZNaVvIw7dH/bDmmCuI7yucVGemFz2CQpLw4udbtXK6Tt6fAGh2+aBQIqkM
	LerNTdCphXv/37kCwovTKuLM8gyWckb+7aBs+B2FffTeNUJXiIEB3n7q7uo2qXe4rJkWXBGAWTP
	ilrh9ApIdhROmC0y4saVcrvREE33KSdWh4JCMMSDdha23lL/VMLVoODLBSa8PohH18ONph1MsNQ
	RPPyQ+9hidlxRVgJ5owexwiB0ZbXeNL6WjvNnuUs=
X-Received: by 2002:a17:90b:2c8c:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-37c94cfcb5amr3893312a91.25.1781706435938;
        Wed, 17 Jun 2026 07:27:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8c:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-37c94cfcb5amr3893275a91.25.1781706435350;
        Wed, 17 Jun 2026 07:27:15 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186aefsm14340442a12.15.2026.06.17.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 07:27:14 -0700 (PDT)
Message-ID: <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:56:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a32aec4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=C6ffOseXIbhiAUGq2Q0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Llx8T5F4TPAkUBfHZq6IN1BzDhOfuIqM
X-Proofpoint-ORIG-GUID: Llx8T5F4TPAkUBfHZq6IN1BzDhOfuIqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfXzfLyTCrFme1N
 02CiveuefjotX6qvPT9pM3N+1rrp5wvdGpucjzJsquWTS4dM8OLBrVCmZzTfSsOfHXMre/q7ZuB
 9S0djpDLYzvay71M0o7YvxtYHE7YbwaNTgo/bsJgwf3RpKRoc2IELhKe9kyFnEfDHCkpgBxvARb
 YV7MXqNb7LOSOYBR9YbPs7LlkD+pb7DLP98Zy4EVcLmNkWxFWeBrTE1v7ohEaOwIv9k3Pb6Mst6
 R23c+pTilXaEY4nHmQMOvS7DYyQLv9dBpuB6cr7DsPvjWleUdolrU7n/hmkjUjawg6HjL1Aq0fM
 cKNStyYjUFDWP+Md3tN43TeNd8RgJxdqIccUSt28uxDQK1lgwlHj0rWl+m9K8+35gBImYJhh/aS
 kR7E5im0HZK8191Z/pIYIfc5jJCtv17aJopOgHsrTbB/yq/8drQHDVfPn1rZrYqS4E3i6+wEoW0
 zy+W/6yFJ0zk6y14yTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfX4GX3NCH7/aTd
 ptu9sFLZnKcME76cGOaRKAATwTotgoaiqoelJ4gT4uQxu6MwOG5xqbf7R3zMYCMzDUEYZGKwglb
 bDfTjyG/r55nBUaO2lsCE7I38YbZss8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113656-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3FFC69A860



On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>> On some SoCs the SMMU registers require an active interconnect
>>>> bandwidth vote to be accessible. While other clients typically
>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>> vote, causing intermittent register access failures.
>>>>
>>>> Add support for an optional interconnect path to the arm-smmu
>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>> is acquired from DT if present and ignored otherwise.
>>>>
>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>> during probe and runtime resume, and released during runtime
>>>> suspend and on error paths.
>>>>
>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>> expected to have an active vote whenever the adreno_smmu block is
>>>> powered on. In most common use cases, this requirement is implicitly
>>>> satisfied because other GPU-related clients (for example, the GMU
>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>
>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>> vote is missing, it can lead to the observed failures. Because of the
>>>> precise ordering involved, this scenario is difficult to reproduce
>>>> consistently.
>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -53,6 +53,11 @@
>>>>    #define MSI_IOVA_BASE			0x8000000
>>>>    #define MSI_IOVA_LENGTH			0x100000
>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>>
>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>
>>
>> Ideally, any non-zero value would be enough to keep the path active.
> 
> This is true for Qualcomm devices. However, you are adding this to a
> generic code.
> 
>> Here 1 Would be enough to keep the path active, but might be too small to
>> reliably keep the bus active.
>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>> power penalty.
>>
>> #define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX
>>
>> seems to be suitable here to reliably keep the bus active by BCM
>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>
>> LMK, if you feel otherwise.
> 
> Shift it to the qcom instance or provide platform-specific values? (My
> preference would be towards the first solution).
> 


To support platform-specific values, we may need to introduce a 
LUT-based approach in the driver. (Bandwidth voting values cannot be 
placed in device-tree property IIRC ?)

Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
can evaluate if this could be moved to a Qualcomm-specific
implementation.

To clarify, this applies only to the bandwidth values.
Since the ICC path itself can remain part of struct arm_smmu_device, 
similar to clocks and IRQs, as it represents common infrastructure 
required for the SMMU device.

Thanks & regards,
Bibek


>>
>>
>>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>>> +
>>>>    static int force_stage;
>>>>    module_param(force_stage, int, S_IRUGO);
>>>>    MODULE_PARM_DESC(force_stage,
> 


