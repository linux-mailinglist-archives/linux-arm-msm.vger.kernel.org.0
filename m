Return-Path: <linux-arm-msm+bounces-103698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPS9HHvl5WlkpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:36:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF942837F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14CDC300E491
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382FD3890F6;
	Mon, 20 Apr 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzsLQ890";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WergwKdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C683890FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674160; cv=none; b=FAlDZlfebe+9KD9dn+YaZSO/78NC3Hvs5K6V2KfJd7aGFaIFsNMyV7rm17PxMTDDbV4NHxZjfZUN/C/Tjkemxvsp5ldQY2GPDSQBHudBpGb29na074SFxD6aA4cJc5tEsurgHauk/eDbn3o9X/BeuXjDKeBHhVBtnej95PuK9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674160; c=relaxed/simple;
	bh=QIlOSZmWcb6P8R70aiUmd2u5X8bBGWzHZfJEiu1HpGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9TxMX9X78dc3AKpi9R78UQKwDi+SoZsF8s2Iw0o49x40TLRX8uf8eK9NIZrPd9zx2805dT/xuUAcRJNl92qkqI3U0aGq16UOrs8AU34DEeOP5+kBaDP5W1HJPn1/9x9x6MRF6KZtHEGzW5d5XpCR0psJgo4yEdosIzqam6gH8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzsLQ890; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WergwKdn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Xp3D2582464
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AfuYaCz83sCcUIyO6KUjE4K6fBh6EBGSB9QW4d+KAdc=; b=QzsLQ890LqlzO2tX
	dEYA23ZDm0ziaWvz30CHcST1aUcthcOBZ4IdaRjfnZ1cEMmA257LYiCGcxnyChwz
	tkjgJk8cNMcrcvrGfHyIiDnaMyZnh/kOcimzofF5IQuG2N1JboNeD8QstkLFXndH
	PTsZY+U0IP1xYLI9BMTMpZjNvGZtFkUFELFRg/JO23IJY4MmdZvbUs3bP25gnkBL
	a261v8f3JaYRN01+001uX4sG/lmHvBaYIsP0NBlHZa17eJOGypbVOAcAHIMEgMq0
	XKFlr0qihuIX21wZY1uRft+tT8IsMn6ciboIlIn3MTNqhT0iJqlAey59TwJEb+kj
	zxuYRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qan0g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:35:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d59968444aso87221585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674155; x=1777278955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AfuYaCz83sCcUIyO6KUjE4K6fBh6EBGSB9QW4d+KAdc=;
        b=WergwKdnrRQK6k+lCSX9H2n/ePa0g8oH24HhC5rSpPsxfJmlH/pPMHhF+il4Kdn9rk
         31p1CsC+SWg4mkI2dt3oYZDW9XIBc4UUprkxsksbDs3p2kAmFmtPbUoCV8LrmcLLSYZo
         4Wtah+gSH5mL/19/IIfiwF9u9qbUoWp+XRp8Tichzh32bADHZrsKUXkPLfCPanPkI35R
         Q1z9l6xuN5pZp3iDZizapWu5+eHDMK/g0wKKEKZuj50H3r6HKMmMm5+hfP5a8efBpHVd
         mIRzJIro2qz2ELVW1BOe95+Ew35Aa3Wnp6yi0Xwmjvl6yUaNlT9DvwrIGdbcUrCB10m7
         cA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674155; x=1777278955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfuYaCz83sCcUIyO6KUjE4K6fBh6EBGSB9QW4d+KAdc=;
        b=GbXxZvqrnCUdTEeUVPfOAKDG8NQgeEQJv+OZf09piMZvSIvyaafOv5ay5kpq9INk5F
         IaX4B9IOg5NWGH09m52OzjCCLiVdohgXKbP4GaQQb+qZVhkArDDZJhSua/ylaqsesAL3
         ghUqzREZnUZWevmk1K5msIMoi4FO4Qukpd31TXzdFsVxs8zuUqqWZRkbcTCHDIKVbkgz
         lC5fyeui3yT0UeuZy6maB6yD/4xxYdrM3tN8yHfhkCce6gQC0TFH7aAkhDGutNLC/+eu
         qUBBTPGXp52Bh2NXURIz/X7sNxJwofykqM6uztt2k7MmQMYTxzw7o4Du4Gsw1EdWcX9h
         5ZXw==
X-Gm-Message-State: AOJu0YxYDSmj3FlJBgJAxMBfNJa6tNuvuZe6rg9/1lAGzhGq5I7XAaZ9
	Jef//sG6MdvbJIMXaAGH/2o0bAG+yOMts/j+Xozd3NJXn3WN2eRTkjlmiB5fG/mdNxVKk6Hgytl
	Rr5azFeScW/iNu1QdacTnAdBWBKcJB42SCLy6EM0p6POw3RvXZABNqERAXJQZNq8a66c1
X-Gm-Gg: AeBDievEsE3mYnx6YKCmqyDmNZp0cvGFqnMoiLI45HW6rf8ZL29Gv7UQae78l3iakiz
	cY652fOO7XM+982qWsPgnx+sQF3mo/FUNemkVbkUB63LkgyBSSosbxtwWQyItB5v9fbGyEq3l+l
	mm5ybxxFMxj7COc27z1Z6dqhXP3nanO821VUNwl1wHyzzRvCe0IWy0kPes0mB7lJoWw8y/9409o
	hyKSDoLwgWw5MTnKyWA7Aq2Xssra/KSDDzlPBzW6k0iIke+8/dHYL6j3YB75CmouDZEIV7oEkSt
	QA/Q9DAl/sGHRd8WYb2uzxyk8ZkuK1eX9Kp+rgwFetJOT84AdqkIERkRc4IqF7n3Fx07tqjnQB+
	pIB1xXewZDTTXv+58Ed/WlMBfjlU+ACQWOwKLNoPc3JSO3yGV2KfO1GmAR49uJZNFjvd7uFXI3k
	uDRqURSytbI1kU4A==
X-Received: by 2002:a05:6214:1c43:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8b02811a810mr153078996d6.5.1776674155568;
        Mon, 20 Apr 2026 01:35:55 -0700 (PDT)
X-Received: by 2002:a05:6214:1c43:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8b02811a810mr153078816d6.5.1776674155124;
        Mon, 20 Apr 2026 01:35:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1c38csm321047866b.41.2026.04.20.01.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:35:54 -0700 (PDT)
Message-ID: <20691e21-bf7a-42af-afcf-7d6e75308e9d@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:35:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E35h4u6IpLIu6xt1-mX2tFfAQ5Iem0SI
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5e56c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m32t04jroMyMv4Ds6yEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: E35h4u6IpLIu6xt1-mX2tFfAQ5Iem0SI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfXwZ297OnxdR3Q
 SiH4WY6TBt+ltbqxcUi0Dn0e7GnUU0M90zBUxMOKPnu8m886OuAvaRECJmrMOxFfS/+A/q4L8t+
 MszXsbC0Z/VBmLf/pVD0jE0+w8CIjdVQyHhPjD+VAiWPg7ZFOQCTZhf+P9xzv4R18yAb9ofdWNE
 lcv9vR7CkwhisFpwxZo7cVPCTDyiGZLNAQks8wJC5b74ne0apgLgpCQEAxPZJ4HIF/tVuyGMQFW
 og/2/CyLmEoFz0xpe4w+PYairoUFCv/blBxtI/a2bZVUw+UDtDcln1cDHGiTar3c1J6XL+fW0ox
 cUhiIf0+/o9Zww9TNS9BLxdhy7inLeLtYfLRs/7QkMSlXWgPcQbZB55znJZgCf5BbAGt9kEfdbi
 pPmybsvu4SZsWXpljV5/h/1eLg5If17GE3hKqIVASa4oclajg6zkSvVICtQwG+8uYr4BT9JT/1h
 SuLzYwbcmoNYW2131+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103698-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36AF942837F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 6:43 AM, Kamal Wadhwa wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> All rpmh_*() APIs so far have supported placing votes for various resource
> settings but the H/W also have option to read resource settings.
> 
> Add new rpmh_read() API to allow clients to read back resource setting
> from H/W. This will be useful for clients like regulators, which currently
> don't have a way to know the settings applied during bootloader stage.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

