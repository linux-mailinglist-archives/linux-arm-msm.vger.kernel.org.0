Return-Path: <linux-arm-msm+bounces-116247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f2CSHEN+R2rwZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:17:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FD700892
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:17:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nngNj7Cz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QgLtCjEq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116247-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116247-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B373D30314EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2716438D3EB;
	Fri,  3 Jul 2026 09:02:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3C3955F4
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:02:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069329; cv=none; b=lyU8kutHDK5VEtOtmxtvFvdrGUh1LOzWonwFEV0MpzXYp8m+VKmNyk44iltLKrX6+oRcTwcunB00I6FXo7bGkrtIik/gVIJ6frbph+Zg3wmUSKd0gVZWrQQQTd9QaKJVkYmmEA3r3FBCaOmTYUI5AS5yBErcZDi+DRurHkPpNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069329; c=relaxed/simple;
	bh=9IrDLhsIq5pxMA+Xyj7gedboJwc+A2jzTnMvFrrHZrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y24XNDceOwV3iKE2d12MD/tcFYFX4o8vp64ZDpWRyZUQMG9GyZZJzQOB8QMAoOyydmSpwgR0oeonc12wWzNWXInmAAxeXBzxyBy5pyEyInOmA80tUrUAURtCFT2BlZaZHUGkgR5e+gNHO38VMDizJ7l2I+nUlrPDgubiczqLaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nngNj7Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgLtCjEq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IV683195235
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh/lLxGT/43ZnY5veH+mk6rwqDnxwCL/BIwTp3/F1QM=; b=nngNj7CzYxeTmYMG
	TF81T2Q2hEfwfW7HU8ssyMycqqbpofTvqzp4NLOVxYbj3R4vO2ne4VEcWRPxnVcJ
	t7+c37NlQPL7gvPwDmBT6M1Kt6jjDiRLhIP89+TwxUqoHGdrgqy3sbtjXRbAK/qP
	fymevA+TTgYYvLdKgO6UWCYrRheAMUbxryV9SNQ9NlKzOgSLZV8l5uIFuxpXQDlm
	il/gBwxaRkwJKjMhEuQa5cKIkkLtEsPeb0bKFkpbTEVgR/19RV7ScpuSPaxalRoi
	tBD8e5TAu9QCKs4xqXRQjVnd+nnhlvcLXnqQ/08FW7WZaX2NOrHtu++VgqGJRLSZ
	dtsH1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrcaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:01:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso430618a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069319; x=1783674119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xh/lLxGT/43ZnY5veH+mk6rwqDnxwCL/BIwTp3/F1QM=;
        b=QgLtCjEq+YmAikXS9megB/kPD54P6sbfA/7ChxpOi03dt0pzx9G51mJ30j0NBM69HU
         MsqmsJP09FcyZHH6GAtCohDn0G6UU2ajm/d0JOVIHJU/ymFLq441O1gZAuV4O6jY9jiY
         aTES0wVYbJTxabxebQ55n1v+qWh3R9EoAB7tpD2+Xra6OVHSbKa/EdgVUHSc8yJxoGon
         +uhl5qo2+VqkfE8ktzD//66R3K+Dr4M1LhQCg+Fa4xV2boZeSRoUVdHr/eSrC++Ndq8O
         NsA6CXHNpcZsn1EzgnddFwW5wmJ3jpdJ6Js/Zc3RkdIA6xpDNqUp3HisQW9PvKtVSNcw
         ZPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069319; x=1783674119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh/lLxGT/43ZnY5veH+mk6rwqDnxwCL/BIwTp3/F1QM=;
        b=h7VqKHCkwBgcANsdDMz3Bt2hjyjclwmoV0WKfIbQzoiJhrl/qxuld1R2qbFGUU3HU9
         79EBCcXo1LVqbe3fti1TF2CvkQRYdKrRWvOFm3CHq9S+QAcwQMb6v1koa1QXrii87WFv
         Dt+k8ypCNflaUZT1OxjTvIceSRfZ1g24F5vDoZwCnwEu7lrkVt70G2tqR4L4ErgjZuyp
         7eeVCH9Y4eRqgEtH4ad6LOMpt1erG4/uboDceWUp42+1J3oz8KhTVwFW4pybIGY5nsyz
         dK+PJ7cqqrD6xuv1SJZiAyXBtMNJZonS2c9WiYyaagRZYXPUypzonx3ex2o1Md5BTf3r
         p0PQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8/tx2May2oPNuiBV9sxWDJ5BKzM1+8tOA5eVLa6M/w4iyyaxw4NEgSuGAO/Lx+vwzYgpihj3L20EabYn6@vger.kernel.org
X-Gm-Message-State: AOJu0YwucuLwcY9D6qHYvmvnN7kCXRP3DTjxJ0PDwu2sydy6seFv80C8
	vfMS3VwJvTuNCeSvpBf9WuEffugPTnocnPYojU/XPzfLFtsPnTyE3c+tvBy/hwwRkkHRVZzP8LZ
	Q/ua5EM0PkLC82MgNhEhPBuN1GSJHGN1PZ8Sv3P3YaRImV9GjQdmTGAiYeDaaAHdViA/x
X-Gm-Gg: AfdE7clviltbNnTgyJJH2BlcreigDfmtKxO6h0jAglHlwLteImgQCf2q9ci2GHhRSjd
	C5PjQ9M3p5lNGCQowW7JESxIcNdUqNmyaUiBatyaogQujGjRI+pNNYkfo761jttPSlaQhH992O5
	ermyLwB+sHq1azlGrw5sQu7zjnr3A90Qtju7uZgt5/n65jC3urfN9O3+KGgu3pD9j6Vz6NpJ2tu
	emBhMZ85zttAkhRCItXduL/ZY8ylVTohMrfM+47WIa+lPCXuj3ta2gDBTXlbx29tOrL6wM0frn9
	e+Pd/5NKBKxidkb3SQi6Xe/OswIGLerYgY7a9kNQ8DB0X0ykBSshurqBU7Hohk6hgaELCikrbgp
	+1SotkyasHljfY7VXihqTDrlLzibqPoO2DJ4wcJjS+xQ=
X-Received: by 2002:a17:90b:4986:b0:37c:8628:f79e with SMTP id 98e67ed59e1d1-380baa6b3b8mr9269616a91.16.1783069318950;
        Fri, 03 Jul 2026 02:01:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4986:b0:37c:8628:f79e with SMTP id 98e67ed59e1d1-380baa6b3b8mr9269581a91.16.1783069318454;
        Fri, 03 Jul 2026 02:01:58 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815d3e7sm631015a91.14.2026.07.03.02.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:01:57 -0700 (PDT)
Message-ID: <bb8f2283-93b6-4ea7-ada0-875778c89b3a@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:31:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
 <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
 <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX4mrBJDuT9qB2
 IbIv6yqJ+nKK+qpInP0nTgS//w/DnU4tV6C9bhR8bkOWkOCgaoJLIqMdVwmpF5qd8RZh6a3H36J
 HNcP/XWQ7yvqeqZQXV5/pSbj3ZV/0RaAUjkkQ8h7dSDv2wpidwLBZUdP0nf69Wq/oQEIu1d2ZQk
 baesgV3k9csprzMgHJgQWonhdVPQtqXrASUzXV72qCHWa+SSZrq7fe6htDMmZ+zPPMpNvCSJNfR
 ItwX7/gsogX5188VSERJsah/uy+4vBJKjh93dE3/ViERr9nx38rbbPVup+Gm0BdckQOrCkS2ane
 5IsB8Th+JrI10oe4VPfd4xe1wDqXXlZjpIOm9w+zDQZp6E+XPDN8R93VK3KLeSpNnA4GwFcuv3/
 hY4h5orFRPP8ybMM234vI148zGig9wha1nF9lEa6Dp034wig+yFhw+DLxap+9L1lW6jSIbr4TT5
 Fh7iBuBTsVc2AMOpzwQ==
X-Proofpoint-GUID: pVxmlXZJwhKc7NJsPhDCP4in4LLRao4o
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a477a87 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=jbDwVWhXRwVoBmlK3UIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: pVxmlXZJwhKc7NJsPhDCP4in4LLRao4o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX3+2upgRjlGxh
 M9khT7Ss3Ws31WTYcdwAYXchnt7gvjG8KMl11RkqJ2Q3qv6o/DlOSQwBuPmKXkjYtO7sBAPlBKn
 ttIW5bWHmI8JuN4cUlpKRBRerK7RauU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116247-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 300FD700892



On 03-07-2026 14:27, Konrad Dybcio wrote:
> On 7/3/26 10:38 AM, Kuldeep Singh wrote:
>> On 03-07-2026 12:24, Krzysztof Kozlowski wrote:
>>> On Thu, Jul 02, 2026 at 01:47:15AM +0530, Kuldeep Singh wrote:
>>>> Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
>>>> `iommus` maxItems constraint.
>>>>
>>>> Fix below error:
>>>> dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
>>>
>>> There is no dma-controller@1b04000 in DTS. Please drop all the warnings
>>> which do not exist.
>>
>> Kindly check patch 6/6, it is introducing bam node with 7iommus which IP
>> describes and hence, updated bindings before to accustom this which also
>> helps in avoiding rob's dt-schema bot error.
> 
> Krzysztof is saying that the error doesn't exist in the tree (because
> the offending DTS hunk is not merged), so you shouldn't claim this fixes
> an error, rather that Shikra simply needs it

In previous patchset, krzysztof ask was to add error in commit log and
hence updated that.
Maybe some misunderstanding!

I get the point, in that case I should simply say below and drop errors
in commit message.
"Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
`iommus` maxItems constraint."

Hope this is fine.

-- 
Regards
Kuldeep


