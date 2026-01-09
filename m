Return-Path: <linux-arm-msm+bounces-88229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F8ED08217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B59302CB82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16245358D30;
	Fri,  9 Jan 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk+Pi/6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNUisVBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EE0328B47
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949928; cv=none; b=AjjOC296aBp1RR5AW/WWsKw2ZUAqBcR9xtTlLTffJ7SZCZg6z3PDvJAn2BBQrsNlxokfmUDQihVI+0U5vAr28SZgKu3PXAddCW71YqoWQwr4Cb7z+HrZaHYhPvFg5Md4sCw5sw1dLyEEm5k0vzpMW3b0W81I20whm9II/6Rt3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949928; c=relaxed/simple;
	bh=YINIDNZzi9CYPigJeqldTRwq4RKKw8w8rUNjLXDS/oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1mLC0JCk1zr/5i9pEkRV0IYLDBOYpuXsSS8O+Oqy7h8d9PUWCMmQ80mRuuAV/hSGZm1o8XhNHCP9V8VZ+0lPmV9T3WmQd/P7xj1Le0Atzb78QuOeqZ+R2TSaL8P90kqb8tXtveVcRi5pJEr6TScRud+krmORjDdxSKrg/7lUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk+Pi/6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNUisVBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098eNDg3728466
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JC/2PIARWmi4kmr5mYkW0IX6da9jvU48y2O4jH+wrng=; b=Sk+Pi/6fOHGFMnGt
	HoeRxrhvD5KCBfq6Ve5UlIY4GmjWnka6C0nnrotU8eAQfR9t3OSivgrHCbcw3o5L
	ggRZwrynSxeTRfp2y0e4hlzIFLqt2cZgJplcrVhK3VYGmn21q6IhHk8iwEqP9+wU
	IqAItdS+/LkkgSjtH93JGKh6Zvun1MgKDyI5JLQW3Zs5zpyjA+Qa/5WqE/Hqh9EE
	jfbqev7wGhxS7LRXoWq6nkG7hmasKGBfBjWUT09FFLEgP9vlhCBhHlbLJ2UJQNhE
	ovqzoWNq2Yn+VhO+XQkoWYAvWg9NpzU7XMPw/FS8DoLbfmceh4Q4XIiYaov4kk9G
	z81m7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhdxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:12:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee409f1880so9695721cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949924; x=1768554724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JC/2PIARWmi4kmr5mYkW0IX6da9jvU48y2O4jH+wrng=;
        b=gNUisVBx4/4XKSVQZjir8QSzpwRLSNWkSuipd1OsqznTF8l2q9zulA6prGvrlgcR6r
         z7GUJPeLWdWcUKm8wuIfrFFcLXaeZyiWR+mgi8DFZLD6wksSbjVVJj/hvSjQ8uCuCzRT
         sJ3h0xbyanqptttk2Vc+XrD9E1kMUc3qjUN8BtED252bmDp3OCI/rHhgz9jbVn/djmSf
         uoWQH0uhX7FFT1odO39I7bCKZ5DFUJivi0FPDUpeYFknsmH5YZpQpKUJ3++oZjJQtPJZ
         UtleHYS9q+YNVTA+YLt+mfnQ24t5QqLl1YHqJCtfNeJSJPOs0JBQTXRBTUZDGL+e4EDl
         yRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949924; x=1768554724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC/2PIARWmi4kmr5mYkW0IX6da9jvU48y2O4jH+wrng=;
        b=CsscW/5/usQO1eh8fKy8Oblndv1h0BAV2VSMjLFgqpv+03UFg8wo2+YIjFX3VIf4P0
         kHk8M7sRrGJcjPvpIV/k99eqjGOo8GW12weI4v/NZaBe+j2JpK3kmOsm+nTzNNoxX4GQ
         k3jkqlJM0pfk4gJxLxfGOeCNCiSrD5qS1wM5swS8Arwp1GE4qzkgCtawVv/hNB9r1CEZ
         IrhJP8laL3flOwANcZUczX0CNIeAMYh+fmW2szD4qBad8Trz103v5q/gZrezQKcosu9z
         Ip4cThMTmUWW3ZRG2Y6zsNCfvG9RG7/wVDQB5blrSFS6B5CJkkksj+2+bMulaeC5C42P
         uZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEyZOJbCUEVG/fcN2Zs4keWeBT9HXLH07zpcm63UeCqMquraxW3iogZlmuMhmDoEK9uzVlVy6BY5fiPUy3@vger.kernel.org
X-Gm-Message-State: AOJu0YzfyEpTRYlVEInXhzk0ZsV89Sy67Br1ySXQ8lMA7fdN1v3IvMRJ
	r1UDm9ZUiLDXVO29wbPH1dgs40w9pfeI6Nrm4HLlNVlqdSz7HREiZ3iYxl1DKKTE+yv8MBIN79W
	VQfojQ1Cod2oxB94bMO/HMrJPtxTXqiz0/BO56BNmituZYCvBdE4pN7lFU4YHSBMgEiW1
X-Gm-Gg: AY/fxX5TKOn7HYtkD8veu6vesLtsVA8/2sFujE0QrpmthSoCnfjzgZFSWUvNLlFrzE+
	/0+2N2jnfADw+IbX1um5bwoNrdtgLp1dUECfjj+TyR/29jviDVYJv9a2ethr3mJOsCOkjgdXiug
	9huwZrp5mP5iWD+LscTLlyBEkjoM2bffBwkvqX61VAnsp+xQ/CIgD6Ee6H1aPQQR+CuluLeS30E
	WzyN997NZSBFiHv4/KnTz8TibHDISuewbEpaHmPxaDCy8WYN6Cf4+S+lL1HEFF2UARYXVnVF8FU
	Vfzl3pjJIujMESJsIP+6QNqnQ/7PNF2P8zTvvA/i76re3BT9q3MSqzSTHZfmcVxAOAWo8/JJi5h
	hw3oQfb5B9dkE4X/rAHbat86Fj/T+ijX37jx9v3qKHZjGqGU+gLncoSuzfQ3rK+e+UrQ=
X-Received: by 2002:a05:622a:1391:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ffb487fca3mr94824561cf.1.1767949924362;
        Fri, 09 Jan 2026 01:12:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa+XzyPOQmE9cIFXniJA5ycEu+R15FVpb05dTWzpy5XMbGBla+MEJ4uThrEO7lxzqFJKiW8Q==
X-Received: by 2002:a05:622a:1391:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ffb487fca3mr94824411cf.1.1767949924008;
        Fri, 09 Jan 2026 01:12:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d508csm10938507a12.13.2026.01.09.01.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:03 -0800 (PST)
Message-ID: <cb8b5f75-7fcb-4018-9785-4fa4b5074b3e@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/27] clk: qcom: alpha-pll: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-14-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c665 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: BnmjjflCNwVjOM5Vqf1A0OJrp6eXsp3J
X-Proofpoint-ORIG-GUID: BnmjjflCNwVjOM5Vqf1A0OJrp6eXsp3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfXzfWjnKKaE1sB
 CmrvqLIOeP/kKGCqgEaMiKu/mLHLrvPvNC7ZziE0Uohkjy3wyE6sCOHwCKVB71jdkC5yNcIMxuB
 iUxtQmRdsxZWNwuFYt9jfbZe05OFK2bIgzq4gL5/yXTktsT3wY+bD9+Nx8bXjyMMguTAGxB/izm
 B/fYduMs16HQnnAb4O+4k0Kt7y0vTNqBlQ26eVMq7GTzcb4ujX3gyoXDqy3VOp+xqcTC62Du8Xj
 a5hAZpmYCZ380tocDhlQWwkbbKWTIhzqzDUVbrz+MZuUwblnCj3mCXAc0xO7QLWs+9S61b2caPD
 x/BnhYnN00GOmYUhH2hVdOkuOCkM5ohNdzAYdc3c1sxxDZAp2v3bkFCYbmi5XH09WVJc7cqpbjo
 iwP/sdIWiPNNsbuaZrXS/WNHSNxZ+DngIFWfNvVmmYrgw65mafJTSuzctQiWZTYI2sbOWxooqsf
 UABJOzFVBtgAiaBTN/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 0e56e3369b60 ("clk: qcom: alpha-pll: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


