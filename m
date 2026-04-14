Return-Path: <linux-arm-msm+bounces-103093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH+3Ha0N3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:49:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368E3F833B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03287306117D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AB43BD657;
	Tue, 14 Apr 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXsKBTM2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfkXU9mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E0363090
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160026; cv=none; b=TOX8J9GtamJG6OsZ4cNDtN/+8gTBmyiHczmuE/hxYI0es3OrYB4yIoGCTR/n88Zky/vWrmSKlZFDW1c++TvBW4arc1ORmplPRdKywP/CU/xQ2qBHTrkTFTZekpgtcJ0EV2lkJD2hU+z+jOXHXNNc3aZdgykqrn8ILkdDEBHx2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160026; c=relaxed/simple;
	bh=bjuwUPJGb9fXauot3dZqpj3OmjYfw9KmiKsmItE1Hr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmwnM4iMCUlmmXww6Szucdv/sdumDrlV9xFvymSI7zyffwjJe/ec/HmvylspoYn5QJX7tOAo5dmgmQ4XDUqMjv1gu6PimXYYS1wEMCU8ot8v9DQzKvCooynWtIPLkwqD9YxyhXnZYmLZXXiqqeM79k7o1eW4C1qMNoqsyK1wdAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXsKBTM2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfkXU9mo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6NTq22633313
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F42C15/5cFyYzvnToR9Xb100FwBKpqaf4bheTzT88hQ=; b=PXsKBTM2lmiMQFU8
	wZ3kMKj13svV0ITG3z/mbJbStjTyMVqiUmy/BwsAQaAw5bScJhH63U2D15e+esKr
	1XWrNSm0LrnMIFc2SUmrcXTKm73TPo+ywwMrpsBuZtc0emEorRnK7yB+RJaoyNeO
	mcY19v4TIqxzQFF1HP2QmoM5vxTra0f6VYYKld1K6GCQ3uFU265AXsVDEQWhvHCZ
	hjSr59Ky2tyH72V/Qd1xEcDCFtxdTniVEuCEYLdsPW2b32qYy2rEO+Yum53ay9KZ
	cuf9QIL28nOszEKv5OMwls92jQaVJslxVTwFVfkzdnSkyzpLj7xkWPHG6S0YF8MH
	IcBDVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca55s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:47:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e5791871fso5071057a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160023; x=1776764823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F42C15/5cFyYzvnToR9Xb100FwBKpqaf4bheTzT88hQ=;
        b=OfkXU9moNMFFzgT/XD0o7l/ZViC7DVmV0xH5omREUhXrvrOkmjG19BktJLFjPNhBEt
         vSpB9EfZDNsIJrLgCft8ZGm9EvEM4YaRrSBHZRtjBH6wgTYsTLWGBcsOsR7uxOWdJcND
         7XXTtF6K8wqsHP7aFLvOPziYu94F2+PSqLsh07/p83utYXNvwnQWuZXj7AHZNEt+jjdh
         PLGwQvmuqsTJ6PFSyTK7a03eu9AYmO8bi5VNxsJpbNX7qWabbV1VKspf5iKi0Tt0lXg6
         slVeC81I8eXcx91v6BVpWsw74HqODtpft0Z3W7P5s4qlfyXGdRy8GyJtyzDptT6id1e/
         0eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160023; x=1776764823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F42C15/5cFyYzvnToR9Xb100FwBKpqaf4bheTzT88hQ=;
        b=T7kRU0qyU6fJ6uNqXlqnUQB9owiji3WuCO/E9tAJhsFGXNeWapRQqS0SO6q5DMnSRU
         qG0+EuUlIZ0LQQfroCYBjC7sNOhqtDR3KIUSed/JPEcWd5MiegAEgDszK4sDqr7JAvtX
         M9UQq0vLwQB2aVwUpGCZ7eoAuA9c29TlZUovAurxb4DuFQRIh6I0t1rtHQgv1/uKFX2f
         q0TtrBKF7gved61hSBtiObLJztDMgyErEj1T5ilONkshDoybyp/WCep5N4+YqLv3UUAN
         x3/TzZQisj159xfQAnTF50CEd8zBZFvfsVVn4meHCTMGP/IUeuZwXjUNfBgpEqfsom9K
         9hvA==
X-Forwarded-Encrypted: i=1; AFNElJ9EDzDFdaO3T8pw/kbrMauG9iwMqmqhjr8mf/qvGNAKzqRUf+Uq+pUUC1KBCmZ488I79NOInnFrh4gyu9hm@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWLIiF4HGN5LE7hqNRCW+dCYwE09nAl/wgMhISESE0jjdDvM6
	AiQkPOkbjc+eYMLowI/x+wP0s2H4mlyab+WnhXnWbP+mUt1SkF6pmKCGrNKm57yvuX9a1G8P6VL
	pBp7NEaszKykXenDaaFbPVmM6FPB+1Q8JTI8+cqLU3ZIxMm166ZuuFH82PF6/SUPJev9t
X-Gm-Gg: AeBDiesnQOqxSvbZxkAjLwhFf++9k9IT446AD2vXjaf2tI9oED7pT987UsvFCsCc8px
	3PKgawKtOVA+tFSzh21SA7cCJLyffN7xPT+tNuu/9pkqkr3u1pl8W2a2Oj7bLEFnrJycNZXInaF
	fmwSukj7jyqGQxPpk3nu/QAYDgckbJi61MyN2q5WTjQ3pW3L3FpE//U3KKxeEZHrvcmmAtdHjKK
	JRZMXJG4UFb8BIIJiDgBGlJYtuXglnM/VUYNVXq7k1jN5JDU42Wn6zAlHujPQ3DkDd79SParYQc
	O5PWQHuAdFFhUYUZfM89KCTFacUE0uwmGBCCRN3WSq2A+WUGBAgNbYZsoywER/DGHmscpD7tnyi
	dIDKgCbIFTqjTmDww6IfjD/3GitlRht7NpA2K8i4RrQeV8ToVG/P5uA==
X-Received: by 2002:a17:90a:d607:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-35e428856dfmr18244246a91.23.1776160023376;
        Tue, 14 Apr 2026 02:47:03 -0700 (PDT)
X-Received: by 2002:a17:90a:d607:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-35e428856dfmr18244215a91.23.1776160022898;
        Tue, 14 Apr 2026 02:47:02 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e78168sm1520481a91.12.2026.04.14.02.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:47:02 -0700 (PDT)
Message-ID: <9ac01a3a-1ce2-373d-33be-1c10853604c3@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:16:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/11] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-1-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-lush-reindeer-of-storm-bbe918@quoll>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260414-lush-reindeer-of-storm-bbe918@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b6BGxKzVBnaJB-eJAHc0Bz0sTZecKuvb
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0d18 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=J1jT_auZRQXyn7_S9LoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfXy2H1+2TAjNVE
 aVFHfNwd/z/bVVqYPL5X6hPeHVEN5VR8rS/aNzCaGg6t6X+Jt6v+rT/7eqlsigfothyh82xgOw1
 372xa+eL7nenRRyKBJmfr6Z4BRLaEyUfpUzrID2ZNFd4iMo+f4fSwy0gQBgUgil4N44Oi/WMA9H
 zMLXp9iXUSCiaELldP0fKJEVnsHBr8Jtse+72HxOZDhS8tmmWSX1HwDFIatpQseX5UtjqBY5lD1
 rLCjEP7NVIEfNc78lQJC92rdDxS/hnMGOLathe6tV4voii5li1DYcVkKqPj3/pavRatYKHVgDnI
 tJK65ksd0UrgrgQdN4bt8cB+/211kjo3AdusPlrDcq706uyDg75wdLw6vrDmvGYwFKRSNxyUghg
 wbMWBuAtX7nJ0VA5fDai+7KIHrbHbPpLTMI45FkOK3jYFoIwYPiQCNcV1zMvjtAQnqlkAtthb4+
 XwkQxQHXvscqHGTYPhw==
X-Proofpoint-GUID: b6BGxKzVBnaJB-eJAHc0Bz0sTZecKuvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103093-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aa00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2368E3F833B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 12:55 PM, Krzysztof Kozlowski wrote:
> On Tue, Apr 14, 2026 at 10:29:57AM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,glymur-iris.yaml           | 220 +++++++++++++++++++++
>>   include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
>>   2 files changed, 231 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> index 000000000000..10ee02cd1a7d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> @@ -0,0 +1,220 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Glymur SoC Iris video encoder and decoder
>> +
>> +maintainers:
>> +  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> +
>> +description:
>> +  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
>> +  decode accelerator.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glymur-iris
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 9
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +      - const: vcodec0_core
> iface1 goes here
> core_freerun
> vcodec0_core_freerun
> and the rest, based on sm8750. Or which previous variant did you use as
> the base?
Ack, will use sm8750 as base and I'll update.
Thanks for the suggestion.
>
>> +      - const: iface_ctrl
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +      - const: iface1
>> +      - const: vcodec1_core
>> +      - const: vcodec1_core_freerun
>> +
>> +  dma-coherent: true
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 4
>> +
>> +  iommu-map:
>> +    maxItems: 1
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    maxItems: 5
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +      - const: mxc
>> +      - const: mmcx
>> +      - const: vcodec1
>> +
>> +  resets:
>> +    maxItems: 6
>> +
>> +  reset-names:
>> +    items:
>> +      - const: bus0
> bus1
> core
> vcodec0_core
Ack
>
>> +      - const: bus_ctrl
>
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: bus1
>> +      - const: vcodec1_core
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - iommus
>> +  - memory-region
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
> Use existing, most recent code as starting point.
Ack, will use sm8750.
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/qcom,glymur-iris.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    video-codec@aa00000 {
>> +        compatible = "qcom,glymur-iris";
>> +        reg = <0x0aa00000 0xf0000>;
>> +
>> +        clocks = <&gcc_video_axi0_clk>,
>> +                 <&videocc_mvs0c_clk>,
>> +                 <&videocc_mvs0_clk>,
>> +                 <&gcc_video_axi0c_clk>,
>> +                 <&videocc_mvs0c_freerun_clk>,
>> +                 <&videocc_mvs0_freerun_clk>,
>> +                 <&gcc_video_axi1_clk>,
>> +                 <&videocc_mvs1_clk>,
>> +                 <&videocc_mvs1_freerun_clk>;
>> +        clock-names = "iface",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "iface_ctrl",
>> +                      "core_freerun",
>> +                      "vcodec0_core_freerun",
>> +                      "iface1",
>> +                      "vcodec1_core",
>> +                      "vcodec1_core_freerun";
>> +
>> +        dma-coherent;
>> +
>> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
>> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "video-mem";
>> +
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        iommus = <&apps_smmu 0x1940 0x0>,
>> +                 <&apps_smmu 0x1943 0x0>,
>> +                 <&apps_smmu 0x1944 0x0>,
>> +                 <&apps_smmu 0x19e0 0x0>;
>> +
>> +        iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
>> +
>> +        memory-region = <&video_mem>;
>> +
>> +        operating-points-v2 = <&iris_opp_table>;
>> +
>> +        power-domains = <&videocc_mvs0c_gdsc>,
>> +                        <&videocc_mvs0_gdsc>,
>> +                        <&rpmhpd RPMHPD_MXC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +                        <&videocc_mvs1_gdsc>;
>> +        power-domain-names = "venus",
>> +                             "vcodec0",
>> +                             "mxc",
>> +                             "mmcx",
>> +                             "vcodec1";
>> +
>> +        resets = <&gcc_video_axi0_clk_ares>,
>> +                 <&gcc_video_axi0c_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&videocc_mvs1_freerun_clk_ares>;
>> +        reset-names = "bus0",
>> +                      "bus_ctrl",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "bus1",
>> +                      "vcodec1_core";
>> +
>> +        iris_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-338000000 {
>> +                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-366000000 {
>> +                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-444000000 {
>> +                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_nom>;
>> +            };
>> +
>> +            opp-533333334 {
>> +                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_turbo>;
>> +            };
>> +
>> +            opp-655000000 {
>> +                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
>> +                required-opps = <&rpmhpd_opp_nom>,
>> +                                <&rpmhpd_opp_turbo_l1>;
>> +            };
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
>> new file mode 100644
>> index 000000000000..5766db0b9247
>> --- /dev/null
>> +++ b/include/dt-bindings/media/qcom,glymur-iris.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
>> +#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
>> +
>> +#define IRIS_FIRMWARE	0
> For what is this define? IOMMU map? Binding is quiet about it, so
> probably this should have some prefix to make it obvious.
> IOMMU_? DEV_? What does this define express?

It's a function ID. I'll add prefix like this IOMMU_FID_IRIS_FIRMWARE.

Thanks,
Vishnu Reddy

>
> Best regards,
> Krzysztof
>

