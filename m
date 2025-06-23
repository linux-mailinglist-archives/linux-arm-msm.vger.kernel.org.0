Return-Path: <linux-arm-msm+bounces-62095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CAAE4763
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF525189E72C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4F51A01B9;
	Mon, 23 Jun 2025 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV8wi9OE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A7433A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690293; cv=none; b=tfmaH/HQp/SxQAr9SROpQ3WJH1MFOC6iR8Mk9G5j0Mo8KCeEcDuu7WCtQ++hC/uqWxTb3KaASjoOAx5CJEMmCCxUp+XQ+hNqIuZLCRjV5FZS7nXYYzBSsE3TCJa04fCmWaSB3SI3GLQDAW87Xk4LO4NnFLjs2vx9V8jI6UbwdLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690293; c=relaxed/simple;
	bh=zRmzez14Q8uePLJ3L4CKjWqTX0r8E0d2mwlKujEpwic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/5Fx0vMVDBFIR6elTeYHKm3/DnlIlKw2x84ZoPicfG2DONh6lxbGtlXHxoq7HXsBG2AXqkRyQEQLgOwKZZeHLmwSmzxHqrmqy8gdxgV4I04v24+TUSaaCUp8Wv87D773jH0/gI5D2pe7ER4Ach1hcniVoxipxLEocNRHX0132U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TV8wi9OE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fRBl021631
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUh+2DQfUB1PNyecxMnx9SxZiBcDBwza+kyMM7WfB5Y=; b=TV8wi9OECocW/REu
	cWSGTeWehvwSUzh7GV/zAv6PtD+aIwLODoi1hJlxWH0TKb2gaGSZTBlcr8wef5GY
	K6mTQ1CVCHlfJ6j3KaG/40ixWcU8xevYJ44zqq5dhRd8IOswVUAmQjyR7YIUXRrJ
	bqbrxnVcRUtNBqeG3qz/rPhezB/hHJJWqMM2rrqe/Mt9pkpieoTJckVkxVJCWPjn
	Ws16BawcuRLPxytxFHh0QaIb39P2Rk//rGvaUlVSEZaMQ8zPqzk4L1uZPgZ4sq6/
	31T9L4elApDl5f6EYx6kzHtapz5Xh48ECkV07MSUaCW6Xx6Q5Q5J3x9NIPjSL2WX
	0BftZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rps6r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:51:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso114162985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690290; x=1751295090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUh+2DQfUB1PNyecxMnx9SxZiBcDBwza+kyMM7WfB5Y=;
        b=VBbXTrsA+ghJ//0cW3ZWEAC+Jfn9mTO9z6vV1wDOmvIfFJ+wCsuxeoQ538lPs42RYd
         peOMeMJvJNXBM/9rkQs7OwUslM3xSQSQ8skgSdXU67K2ITzZDoP+X4YowXoxCA2SCVWg
         YxwGOuyMHdW45jxP4lYR0uRw939vwWbHL3mXUTPf8H6BvDOg0Qmjd+ljAp1ojAkCd7+D
         1oRluyx7azjvAUtdWgHjvZZHlYBE2GCL4G/jHl+8xydzRK2oYVTcD8X6lMJcrMtWoXYI
         PwzKmJ3gHLUvxrFTp9ktfzZXo4Jh51SiFPEDr9aP2FiviQ0avxE4mrElpkKEMul2VsWh
         Nf3w==
X-Forwarded-Encrypted: i=1; AJvYcCW5okv1ET4jepE1wfxkpN/t9vHJz7sU1Vt7KsUGOmzR9MOH9w+57P6hXRi9gG+RpEvCHBzq0ulGLkOgwzjX@vger.kernel.org
X-Gm-Message-State: AOJu0YwGP/WTIiOcWlUNw3IXIoY1aWoj9WJcwgHGZQVpCGT/OlVN/yz5
	YszzSVsIxVrnat5e4f18Nw5oFjjX3p76IH9e3t9/xNYHk8BbGHz09y6onzvdpheZGAZvYPnQjZA
	uj405WeN/ZRiVXO+fDATzX1xg04rR8APGigmZ1BQ0n/3yYTgEhOarK4SAagQEgHvvAoSg
X-Gm-Gg: ASbGnct86ghrqZwoO7Z18kBm8YpWJUplLIPiAHncD8o7cmlg58H4OXIj4YpRwJ7+42Y
	HSrvq0DpdUph2b+7WcvZVSWcjxojH+nlRwlt0YIGcMFA3IMAVxbYGLthUbZriPceLJYy4FV/641
	+SbrJUy7edO55C/KaqzIggQHidv6GMo9BxLxBHrlaqvhpRs3f9ZfcovtsnLRbfSRM+hzpzBrmWL
	fb7BxCJ0GKc7lSJ5aAg9b1881vlmzVGkS1GM4PnBYdWz+MCdD0vDLfIZNJKsAmWx0cwc2GUakv3
	yNA6I7wImHwtBttERL6OBSVNBQB3/zRbZYoro5BQSMKzwM42CD7ldoxjQdtktPZkJ9pw+trB9Va
	W29M=
X-Received: by 2002:a05:620a:f02:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d3f991e683mr650813185a.9.1750690290281;
        Mon, 23 Jun 2025 07:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeRbjwyAk9ZnxdjVR+ztXT7T4QHUFREQAUwKk0CQHe5tEcFnckPNFWjGRkQcD3IT8jTYP2Zg==
X-Received: by 2002:a05:620a:f02:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d3f991e683mr650812085a.9.1750690289889;
        Mon, 23 Jun 2025 07:51:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05433aa56sm720624166b.183.2025.06.23.07.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:51:29 -0700 (PDT)
Message-ID: <2aed1a50-7ad3-4e6c-a8e7-c8b24a66d6f9@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
 <Fp48ghZvedurtk8ta0jccDkZvg7whZFgX0Ra7_AQuMwS12QxAxHqgcOMP_SbXsnLNme2LWWz6ZshoGFTQT6nVvfe-4B_v-2hkRxpgcb9bq0=@protonmail.com>
 <92f1d1c1-e62d-4f77-b55d-110d8ad56a06@oss.qualcomm.com>
 <K0VOX_o4DQFENShBki5YS11cHp90jAhtOYFT62ycGgps8JLh6a_SyDqoXyVaPhMADabNwpGyn1px_sAgxeMCJFNSDjyagcqk6DrNh9AECE8=@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <K0VOX_o4DQFENShBki5YS11cHp90jAhtOYFT62ycGgps8JLh6a_SyDqoXyVaPhMADabNwpGyn1px_sAgxeMCJFNSDjyagcqk6DrNh9AECE8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685969f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xsC4XkDQC8VCkiu0ezIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OSBTYWx0ZWRfX3oWvG1YMTOG5
 b/H9qCGTL+XwZsJ9EH2/O/JlyqaM1Dk6VxjktsooZqQLBTHBKkwZGhseolTnBmNKUnjrWZQOMPt
 G6u7brD6zJnTeIUkaNNhONzG4QGlAhILLZ+dRmShaRKlnuPqaMnphlwWuX5ZX6wjKVDWojQkTMg
 sijCmKpLYBHcCj5yAkrl8erVxJYWPCCK5EgTsPpOTSyJPwSDdpUuNZ+X90kchDMl9zx5JE4SsA0
 eBAFCESOskSW1SjpPizVQ749OvzdVovs7Oy8vAIf9NiPZC/uzlDLyls5z9dT/UkVtXg2ScBOhcq
 c7xlB4gb+s1md2Ajzfufz1PWhxspSIeW0PzJshxlGByQ+6uiWwgx/T1U2EUDrkWNS2p69ham1LP
 ezzQPFNvs5zhf+q8mEZKMF/Eu3rpqdb5Pv/2ZQ7asdy1UQfnXEKJhKmOGF2dwHk+09evQp+O
X-Proofpoint-ORIG-GUID: ks8R1wFwtzZuCpePQ_WQhe1iLGLdeIhC
X-Proofpoint-GUID: ks8R1wFwtzZuCpePQ_WQhe1iLGLdeIhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=788 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230089

On 6/23/25 4:49 PM, cristian_ci wrote:
> On Monday, June 23rd, 2025 at 12:11, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 6/21/25 9:31 PM, cristian_ci wrote:
>>
>>> On Saturday, June 21st, 2025 at 12:17, Konrad Dybcio konrad.dybcio@oss.qualcomm.com wrote:
>>>
>>>>> +
>>>>> +&sdhc_1 {
>>>>> + vmmc-supply = <&pm8953_l8>;
>>>>> + vqmmc-supply = <&pm8953_l5>;
>>>>
>>>> you should add regulator-allow-set-load to these vregs
>>>
>>> So, do you mean I should add 'regulator-allow-set-load' property to 'pm8953_l5' and 'pm8953_l8' regulators? If so, should I do that for 'pm8953_l11' and 'pm8953_l12' regulators too (sdhc_2)?
>>
>>
>> Yes
>>
> 
> ACK, I'll do that in v2. BTW, since I've not such references in my downstream devicetree, IIUC what you mean, 'regulator-allow-set-load' property is now required in mainline for regulators supplying sdhc_{1|2}.

The sdhci driver calls regulator_set_load(), which requires that property

> Also considering I've transferred every value _as_is_ (except for max and min microvolt values ​​of one regulator - after the kernel log complained ​about ​that) for regulators/rpm_requests from downstream
> devicetree to mainline devicetree, since other msm8953 devicetrees seem to share the same situation of 'rimob' (I'm referring to
> 'potter', 'daisy', 'mido', 'tissot' and 'vince'), I wonder if it's not the case to standardize all these devicetrees in the same way. Any thoughts?

We've been there before, it's all good until one device stands out, and
then another, and then another..

Konrad

