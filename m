Return-Path: <linux-arm-msm+bounces-82251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1285C68C0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 6B59A28AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF83D33E377;
	Tue, 18 Nov 2025 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtD4xgtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV4GKeqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85833DED0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460957; cv=none; b=tkde0Zc9QJn2cwZ8WoKv3MsRTg3IgqofSvXRUR1t7tolgYU1C/flhYLfE2pliJXydvSJ/9uK0MDurTgEs80QySPQeuqNHm8G3zNUEfH25uDzMcWGEPkW3l/xn/PcE16Ac/7NEROebdjHN1Kq+9ANh4JSHLMYTsJY7+KvajLtxkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460957; c=relaxed/simple;
	bh=oNhHrsT/msNDEOJJM9+JUOOCPllRsO8OLiYiIztC8a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8u5Z5/Gx8+gMkyB8bFQFs86K3YdVduCMMTucjLY3SUfW2/x25DoXwHWnt3heyoHW4teBMow/ri3m8n85diYNJ25JceNd8kUJrEJkDNF8913QckeClm+lGy2uc/DFYSJYsarkPSNeAoyfX4DzeXX+oVcz0QXFLb5iEP0cB54wG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtD4xgtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV4GKeqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fQUe2343381
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxQmAzQi/5l12tcrIg2/r4r0TNqEbqMpm2O7Owwp/l0=; b=HtD4xgtgXhaIHxkx
	/Q4ZnlKHr/uzusl24Dx0O28KJINa4kbiaPLrN41knjBWHWrkAnhWs3v5ZD05F7YF
	0pQR9nhcwvDP7JO3TnYqTxXKHyQVVxpSj5oI3tdggeQWDhhDTTm7AgFOvJhdIHII
	o6Fa6TTLNdu5L3U+4hDOK9mmx7A+3Q2+/uSBcVgEf71S+AbThxwuub5SZk/sZVpo
	nGdBqxJUEx1oUYhnT7ThZAgMYFMNLypLx2nUkUI41Ku9cn1FGSDAbm3Sll8HTXsl
	tCdh5QyC1y2EHmSrMCTlzSUSZodRisSCEaNVqAxr52nLNyRsIVAn5q5uHdnT0VNR
	VnAfvQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0ngs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:15:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343e262230eso6471170a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460950; x=1764065750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxQmAzQi/5l12tcrIg2/r4r0TNqEbqMpm2O7Owwp/l0=;
        b=LV4GKeqGlUj5MHJqZLuCHcVvNqteiiY2hGxUdprjyxJX8JVB8EAtGR2PjMCk3xvHcb
         7On0LOKYjb9+b+NvK2OrvYOcVAD5AJHSgorR2X945dGCkI3XOikv1vCCtReiE8UMl/uJ
         Y7xG9wYYJqBmtf6sJBstmmN4g0skkEGJfUMmBnT+rHmb+uGaMlE7wJ4wApDT3cBN+qxr
         JZ5oSQR7QwDqmTRppW7WUMGHHBigdwHGsq+rFdfyNj15+eLbZG0gFGuEYaFHPPnle3RS
         gLxj4Yk0UM/i2JjJ2FqKdmJZb+6e5SD3iQLwtUrKA9m7JB0oTgDVmXYxoX8T84YOgnjY
         EIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460950; x=1764065750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxQmAzQi/5l12tcrIg2/r4r0TNqEbqMpm2O7Owwp/l0=;
        b=mWGJfH8b7iaPYiaEoWC+4DfDRzHD3B7JgqpdU55ThoIgkHYSbUQeVpbvn8rCDm3gz+
         S9VDtXp9uv1LyZYNDXN5INj4TvUcv6AgEQCfabG1+LcnBXQy0w5iRAMgnPLN9P5I8TC4
         05pYwa/twMg62ea657QRo7z+qThEppwSyVdQncWqhf7de5H/uAsCMJNhskBQDTbiK/t0
         KLyyZiswq5jRbqsvjeD8bcHeuFtt3aAA6S5naXCJw4NbfzaGZ4VxdHYaF6S6UcIQWkOo
         fmc+XYaOfFBpjswFsJYKn/tPNkX5gC6CZAMWVkEheUURjfhvpyLuQitS7s34BfbCq9UL
         8KkA==
X-Gm-Message-State: AOJu0Yz34t2HSSddgON1ZYujw2Z+ufzHN36P/S9NHDomd4UgyitXGLY6
	dTjeJyGkQcL4fYbS3AX/NQeG5kx3m3x90ahDO0kewpwKffheEP69OqW6gLC1P7/5UbjJ+g9i36i
	xQ5URyYNu9WjcBdcBnEN6pDZGMusmepyws867/KnVlJBCskQKnYO5NAvzZuLXePVkhOGP
X-Gm-Gg: ASbGnctJr0sgtbLbO9Hc6z//hDfnPn1hNRD5ts2c1XSpSRCYmk5ug+6izDoGjvTmW0n
	iAW5y/5WFCMNu6G0lDUTbMZupesiXuC1mbDLi98BEXv8UW7ihFamhcD7Nwhn5RCDPDvGDDwD3w0
	hg2WWP+9HurfVb4jZPScBBAC7g5VOpnNcezmF70W+Hw9gDHViWZOAnLw0eEoN2vrf7TvZY1A+Cj
	cERPwtbssq9snaVZMxsT8UNZeLPKJ3Nmi1ITSW1FUPRjuIU7AQQOlaqTglRX01laowt5b4tsWmp
	mBu0ptGwh+m/rL9jxaQXVqqOqoNHh9Q5TKES8AUnmAkC7YQ81ZPGKVENofyU3kavaRA40zqXb6F
	u6bgkDoZIX/cFKO8h0Zg+f/alfg==
X-Received: by 2002:a17:90b:4f92:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-343fa7412d4mr17099529a91.30.1763460949879;
        Tue, 18 Nov 2025 02:15:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8OnYBQVTnULke6ffL6/6lpUUQMDuYfOqlcHrnVpJUuu5DYdV0xlh4GGq7XhlBr8Lc/gOZIg==
X-Received: by 2002:a17:90b:4f92:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-343fa7412d4mr17099502a91.30.1763460949430;
        Tue, 18 Nov 2025 02:15:49 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b0384abfsm962647a91.4.2025.11.18.02.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:15:48 -0800 (PST)
Message-ID: <a9317023-2284-4e9d-8963-ee5d28288415@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:45:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: clk_mem_branch: add enable mask and
 invert flags
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VatTnplwceyknnAOtdIWF8Kuvxql_eTN
X-Proofpoint-ORIG-GUID: VatTnplwceyknnAOtdIWF8Kuvxql_eTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX5AXTkwh5EZz8
 +wAhJd1Q5ECVFuHtcL3hL0bUwwnkJmMXmjTJq2mVgeaYPvDVchfRpYEF1VQJuQPeache0k0Zdto
 5qeo2znKbuskXgVcF6+EiYAmkP51p0ycXcpP+KMrEaHqfozGZAbquL7T5A8MGopdKEpbzOtW92W
 oB0czNGju4poYu80CLcrNHeC7bpptTpr3kv1DAQWskP87HKxczRhQbEdFbUZJ2SkRF2sEOpkQYp
 TMlrZxIqKH0yRbc0Dpjnja46FgqD6R4s090iLuz2laG4t+o2HkBl/tFGsXl33ZZ2t8zhsOww4yB
 qGCaqiSOg5D0sriCtK1/qz6WcqoelDYT3D1lAq7EnImqKT1QrJxe9fXgo2Cdr6FUmdWL0yUhpEH
 qfDMlXqh4KMWPJ8XCSNDS1uiqf+BNw==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c4756 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180081



On 11/18/2025 12:47 PM, Taniya Das wrote:
> Introduce mem_enable_mask and mem_enable_invert in clk_mem_branch to
> describe memory gating implementations that use a separate mask and/or
> inverted enable logic. This documents hardware behavior in data instead
> of code and will be used by upcoming platform descriptions.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

