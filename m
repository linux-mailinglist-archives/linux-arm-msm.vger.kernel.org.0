Return-Path: <linux-arm-msm+bounces-117960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GRZ/FI2NT2onjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:01:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF583730C1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:01:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d2d7zpJB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YGwhyNVn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25BA4300EF5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6CF1C84BC;
	Thu,  9 Jul 2026 12:01:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937B246788
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:01:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598462; cv=none; b=aOwQewBIKvPCkwrdUlFF+DXAxuo8PeOjKaXBk+BS7pNWfTuY7O7hcoHsKNzeDdW6CxAoSyUXbBlYBCSnIyQMPvAguRNNPNQGDV0GLduGpo1UHLG/rp5mIK717a5NAYelAGCwrYmVfeB/R9lBgfRuOK9ArwJ+sHYlY3uQvMfE+O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598462; c=relaxed/simple;
	bh=ukjLxkiHe+tw8+6yxvy29o709TShRUnzOMu/rsFUy3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEeHRbpaQMtkIPfey7ocTnn75Kc1/xa7tDjySBWTNUg8icBAcHgF91pmRyMj0zYNirzc1GJ9gAi9u5/TMiQlnz9Y8vXmsVFUDLYqDArfVEXWwfTqlQ9ks+ZtQ4u6PU9hgaRypVUnmGzw4r9gdkapYfQ0ayDPQZUp+u6W3owsEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2d7zpJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGwhyNVn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNCBb1537259
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=; b=d2d7zpJBo1tCDGHh
	IkcsmDQ2Ica9ZhM6vu5AELdqRdB4e8BILiy8krZoWLV1TfxAIszjES89Ec2T2S9C
	J9L2I0W4fTMyEce6zjfn5W+frJwVAf7wJLQyw0AHalTc+8tIyKLB63jxLbbWtkOr
	/r80LN39AXTc5Mw/nqgp8WS6cwsW3b447bLWV2Wy99L2D+0dgNfQZ2oDUjkU/RuP
	MWKGHm/nZEzXPljgnZrJPNeD7JSEVTzR1XmeAA2YsV5MZqsBCSxnC5Gnkq05K8EG
	SLJVgQIL3W9YF7+6Xu1nUK9AlC4gZvd+vRWcn8HP9DAeSfQx6zX3ap1G6w6acFc+
	57Jpug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtgsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:01:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso34330785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598459; x=1784203259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=;
        b=YGwhyNVnEPtgEmARUdhz9ccpTwIt5Wiif0w3JRISu1RA1jYdxfzvbkP9B5gM/gyUMD
         d9W4Q9LlK4BgZSos6e/1BzBmsrm9OrW6ZVhvZJn423fvW42cS0bbnP6HsAzYq63NzeB5
         lZ77bHHynaad+0an4omlHA3L2IbEOuvVeeo0hTHDzZnUKO5XZo1kfYtw7bFBL4OrG1xe
         yXmpQVfvF/F935kSRJBFoGtgvemysO+DoIWN6vjJPCOsztIS+vHvYqnoe/wK/oyQNqhd
         vOdkOLYWgm3ffTpdFpTgVXTp6MtzW7XvrBZoNrSdxGmeeSjLICuuGZA0RZ+eB5QoZOIf
         k6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598459; x=1784203259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=;
        b=Kk2tXZ49/05i9iIvSFXmBovpwWeWBDM7fKbgpGWUAPowPjoraRhfVAZQ4idz4PkPNJ
         EARcO6pnuhC+cgnVuFAb30EE9fMLJj6secqC6qL1PediQLRDYFObAEStAB3fjinlhMQT
         of6T9zslbMcThbL1jga828bY7wfZmakqzeZO4LJ83BIeddhMVkkXu3u2g2wKjNHFf3mI
         k0PLKVpFFTfZTznsTD3FIVZGPu0GvJrZB/rJkVQbTnPbrsYwPkTNxAfCtVYg0XfzFhVw
         MEHqqzLnFK84/dE9itsAEZpQTG/SsWLs9Aab5K1LMxvxkgfFYBtH4azIFzBhJ9wEAYvT
         gNPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJNN474dI/D+Bid7l1LEDycNk0UstkPH3AWVwVMAHrtb32i4TD4MUU6ftLjS21qTSwYtpRtdzezBTFQKNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsnFyvvVj/UlBz87Lrohn4vfpzVYpkw3zMblINsjszBcNKiBG
	xfQn4cOJe2YWFWulPojA4ybBnVLor4MPAZez89uL7YHkbYZoy1JGnL3QNpsujurPN3i8SanmmWR
	IZx5GDwL6f/ZiBlXpPFQtvFRQQKA1HQHCBTntKh8lNuepVsxckUpTmX4v23/jCxku02j/p9VFwL
	A+
X-Gm-Gg: AfdE7cn8seiZ3owUNqWaAKjqg5QuDhk9h1yjs20TobDsFfpBkY9TYKePd17I6UETjI3
	AgIv0tgQwXSUmlTAarz2BxuoDvEkhbG8gQzRSGYt38et2BNIShyOlfmL3F6HiM/HZ7gv1I3uznD
	FrrY4XCTC5xtyLlY2qNOT9cOUc42kjZZgMNj+wQU/X3E+DMACEHmN4nwGsVPNf/OzI/SciB/Jjf
	1Q7I/XjAv0M7CQbTug2CZk7IVQInTjrKosAEQSQaiTwcXzNks3lJRfJNEZC0UpnBS6w9i5NU+wk
	b7zcQEoendtFkSFvUqx6WhNpqeGRb35xryhRWIksIMFteSlLETGeWnnJbMKx8FAhuNdHt5OqBeb
	EpYb0DjZVSDkvk32j1GAapFSA5jBZYxkCp1o=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr297580685a.0.1783598459344;
        Thu, 09 Jul 2026 05:00:59 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr297572385a.0.1783598458706;
        Thu, 09 Jul 2026 05:00:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm381852466b.40.2026.07.09.05.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:00:57 -0700 (PDT)
Message-ID: <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX+z/F22iuM0O/
 +25eQVb7mmu9JI510Aq9irihcqUdwqWQpq/36Dm3Ahi43jiH7ztVxpV3Rb4hDFkonvnYLG+RgNj
 MJFkUfB7EdVj8nA2xq3rHAtfEm/6ud8=
X-Proofpoint-ORIG-GUID: UYJxBp3NnaQVOumz7CxzfikR2LNBzC23
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8d7c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UYJxBp3NnaQVOumz7CxzfikR2LNBzC23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX10YnXh5AVv/8
 dxMFktBWn2VhWqeIQt3ZQDnxICTWdJs8yid/oa9nH5N6Dm2g1WT54pmD24DxvcFN+rABMJLU1DQ
 6JvUT5jQHf7MuzpKve9mj3xeP12ZZZbWSgNzbXO0jbSdqr5o1o/YSJzg7Vq2E0sahkcj1mAY9rs
 5nUcWjD8pzMWkagB0URciNbGRQgi7CYE+/3TTi/STrt6gzZzd/bDLNVzXWKpPsCgko39tPJn4Ni
 egBObdChRLxGRYd4K+PfhhICIogK/NBDqs17JKCt+SNRYtYRVVy/1ynHJYMl6ynkhfnVxCUGEqO
 JMgYmn+rTdvPSYkyeseTTSLiuhUnkb/ZeN3sZdjFBbdkn9GL/OfKhNeuVui1/u8c8hJHtI6F3a6
 A+M0kyGvE+a2Bi3TZM5qhH5FyCPr3pJkGayJGCKHQmRM8ST1N3c5CukZg6FMXXbPZSwkdDgxyQ4
 qPvXcfdRYAUypyyTMOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.90 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORWARDED(0.00)[lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ALIAS_RESOLVED(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-117960-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF583730C1E

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

For the sake of simplification, can the resets be enabled
globally by default?

Konrad

