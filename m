Return-Path: <linux-arm-msm+bounces-57980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89436AB7671
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 22:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6A03BE3C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5082951A5;
	Wed, 14 May 2025 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgCga231"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE9E27979A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253384; cv=none; b=G+bVZiga2XcbXgeZzNkjn81czjEW79g7/HL/P3V750S8mgeesKHsLDn1aA638DeApDYjP4WqrQHS6Jt8Q9DaSeanXkmIfIXbMxnj10XimnJu9KBhZfPLpa/oxgxx0R5u/r3i34kjJfgFT++945dbJHwO3V5WgcCCBhP37OOCfrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253384; c=relaxed/simple;
	bh=Cv/0x1QEmcJ/ZrbtCeY2Wt0mcpuBRxw6d5y/GH43UnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndz9BNpTTiS8h6V0c6KGMb3HTPq2Ervg5leBfNV6vbjLTELDZFUHN+jMV0bnj8wy+2PSZQQ37LBeBojvWveIWzGUWkAAipKSA5l3LxXJTECPOqfcHE9q0EMkiShaNIxAE7CAODENKx5eWsaCU3bE/wXcupjbfLitHeDQivkg8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgCga231; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EK2hDn002828
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=; b=pgCga23114O6VmmT
	itotjnT8ZAnXLMXtS6V+JeP1LinD6vPNywmC6dtAODpwHvmfbc92o7bHjC2PtG2H
	FghtV4lUgZfQCgDYfYXFhwo29/S1KoEQC5TI7ULR1vhA4452EGBZhJO3ca1YJvAC
	gLRDgZT0SX6lbShChAd2a6yr125LDFdWX/HC6zlKb5t3qg2ksvP6A/Og5Z7XZu8G
	ykqjCgbVTtioBZloyWbO9XCZ65N7k4nG8r1+Bk4aZYZ3JveBDC/29vt/V2jEg/Ec
	pgAF8QzG+RxhsRSDlb0hh+ogjUwO8m3N7dd5u96qfKh80zA8ozWPgIvzWGLgVlWF
	nSfZqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpbxk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:09:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c547ab8273so1924185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253379; x=1747858179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=;
        b=V4uJ9T9ilEQUsjolortMx5ntM1XU2jq7pDKHrczqhFSiSR0sAKEVKsSzkXVnzBoM1Q
         1XruiHDFRVWSQo2iHfdKl79uwLFIvVnYvs2WNc4eCJdMRxn1fqmfxqeAyjRopeURTQHw
         +NbZs2tc4SiHUNjWTavF6lrdIERcx1wVl7dMVsXpPfwb0fyUwqnANwzJdA/YRyebp1n0
         6/geUKd2ka8qHA4qftxXNqQgep3RNJLZ1jJq/WE5FDfZHkArBPAX5IjfF5kumS0nymfV
         qKy00wJF2TI+41vQvuyW5khWFVqwf4N45wZfIfT5LQk2NtVOrVHqxltaGGuqU7tDnF6m
         2O2A==
X-Forwarded-Encrypted: i=1; AJvYcCXdBxmxLbVcw6nWKfLIaTQ4/bv4iRR5i+PyZiI4eZiTDrcJje1JYn1gsmWvy+bsxGXDxhL7prA+lcJCrlJR@vger.kernel.org
X-Gm-Message-State: AOJu0YzrzsLnQplptch3aJ/jit1mIVV95nnYNoT77KDBRCSZgwJjBjKb
	3OsfPAwnXdELonPcfLR/hbqzvqYxQu/Pq4aeo4wAt5iP7Mum9SqPKRyMA5Gbxp7fIyQhe3JNXBB
	SCGExhrUjPDHDc2vXOPIt+5pDR0/HPfsWi9lkDfPchl86mUWKvv2MCeRWn23cjZFU
X-Gm-Gg: ASbGncvnTikv8nh25OVU+w1+duO4Bc1HiH1MvGDu3gyuXTEJKOptv/55YTGWj3KucLo
	PnNNjf+gbZIxD+0Fv0Zhjn3gmbbyeXLmhytguH1IsIIne6LFc8LlK6d139z4VLatayE0chNwoH1
	v2ARDphmBbyUX+UNhNwtZbhSU8ZpylZgbsWy/atYI2NlJ6OX9oJOOGq4dLdMhHQgaCEe73Vjvpf
	UDqkL6vJSnDI73JHkDrusz8EEPKobOEQR3LbW/ZBRkurR0y1fkOkoJtWhyia/hjHQmDdB5OVexP
	8UorlMkGasf4f+4HtG//KsHdx0o7IqAZneIJ+qswESPMRKUI1dVrD9E9asTpR9h4dw==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7cd28891479mr285548485a.14.1747253379262;
        Wed, 14 May 2025 13:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwKpgjaIiOI/zTR2/+a7CEi24XetgHuJRRRaRXDCR27dZOWaJhtL6Yv8ouMIjlIoQO3XAK8w==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7cd28891479mr285546085a.14.1747253378789;
        Wed, 14 May 2025 13:09:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fdd088798dsm5606403a12.13.2025.05.14.13.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:09:38 -0700 (PDT)
Message-ID: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
Date: Wed, 14 May 2025 22:09:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: voRQpWXBKr_IMaWKg1h9cgatfz42rJ1J
X-Proofpoint-ORIG-GUID: voRQpWXBKr_IMaWKg1h9cgatfz42rJ1J
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824f884 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HfH8O6Keqri-gfDeQOUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4NSBTYWx0ZWRfX/XdivQ0X2a0s
 CsCO2oq0rCaOmSb/e19jv6/jwFhp/lrX88y6dqndJNixDJvZL3iuLS0mWpqWgCF/otzM5xELmMw
 g9LrheQNGHSPYW55qeGdFEDpAZtsNjoQGiAjQcyg1yjQR3uXUXI3uJR9sIoQpmYjY0fj4LSYOaK
 D8FwRbvEPDQGM9p9nW72PAa5bsFtBc2lvIXQtSbHpm1GC+gNDg/vhB4BngOgFBUAIkeUkz+gKs7
 G5NM+mu9EO4jGi9C8epgCKNSjg7VfroH5UVhQkwiXBbzdutYnzSsI/AzwriZKtnkSmQg2+j2Ax5
 Mfb0djS0hL0pkq11jkB9lpxKVwukj22RPVk/CShkFUyKhDiaaIn87QJBPvwJByEX5TILTRcUDYd
 /teItqLZRdlTvwTRIwUdnLtON7zL49SZ7sfQsrZEQVOiq2gjkyKclJPTx3DI2H234QgxRtdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=817 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140185

On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Make the values a bit more meaningful.
> 
> Not sure if it's more meaningful or not. In the end, we all can read hex
> masks.

0x1d7efc35

magic constants are no bueno

Konrad

