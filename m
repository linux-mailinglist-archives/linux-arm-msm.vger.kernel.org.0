Return-Path: <linux-arm-msm+bounces-73061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C2B52847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 07:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E625A00F44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9876E2459D1;
	Thu, 11 Sep 2025 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQzlHgXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA011547EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757569752; cv=none; b=W9NPS9F1SbkaFC7DpRa64yBG/0TblvllOsejwdX0QxPWR1dNtX8hxl7GDDEUaIM4fi6GH6eeDXL2DL7Ji7dY+SivYDd/0pCm1dYqfrigrXBbvbyLriqd+jb8waYIpv668nXK/WC08Z6f8TraCHz3tot1/OlihuZ1OA7BkOdTWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757569752; c=relaxed/simple;
	bh=CNfDazX35H0BrnzRvDVB6jBjp52YwfrEvQB1d/G4PFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOoOHNEF+Wa8irghLxFGozOiOD1umDk25f/+uzFQV7Cm3XPDVXFVNNqOBusziwkBAkDJqTGX0BVg4BOHGB/fV3R1i8gWUa43gPGGAeUv1AFeKMWHAUScF33L2Sw+BPI2ZyBWh6rp18X0g/stGBYjVGmqyLq3ois7D+VgDRKvZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQzlHgXI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVE0008188
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAJVBX/BV2Mp43aITD557dcejFKZOMYbma50zk6ukeU=; b=PQzlHgXIm4pNt/a2
	5UrvXVufHJZ0SMx8tHL4Eujlxv9DNau+CemTElShteZHB2bGj/0Se5dXT0tE3gVk
	B1EhVYZJtXmKqrR6Mr5HDxCFLltIbyIXSfaqDByKUScnyqdGz0Bb7vwlKoIcY9Pt
	r1onn8e/6dlabWMj1ZWsuGcgyJHwBXo7XrWeKHS02G2vuJ50/xt6HixN5M+L801F
	c41vE1uhuGEO+qBURInUSK6yNOvtMLopEtyvFT8/5pYXoBghMEuS6bcC44Qt9O+z
	C82TfbhVif+9mkNKTTgNiCKi0NuXbZI735IGN+YqeVJltQxmEf78GoRktkN6E5lp
	FH5/mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aappp5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:49:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70edbfb260fso6784736d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 22:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757569749; x=1758174549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAJVBX/BV2Mp43aITD557dcejFKZOMYbma50zk6ukeU=;
        b=Po5hy2nMhv7aHCoaNUXGssRPtf6EOchI6WhlQkdE/vN6CAt3aiOx4ta0jShq1zWu9j
         POu/GG2cxfhT7olgmJpvEZkcT6uyFnODePn+ZWj3CUNC5bWumf3De/M/6vz1r5JJ8xbU
         L7w5/RpmtijWGwTiXb/eOCGIqwQuOAICiDOMBXTAYJ+gbIWcxeVj4IAur8v6SMBu38EH
         Z9L0/hUVLHHxCKoahjCOBgd9ihOcIHkAL9wc+g8qxzW6hvcvJMd38rcYCcTsWhrlvuoF
         m59jwKUnhOb0xbK7Uj/iyl6wk7yrpKxak8lDVfFa7pwjTCNnjRLuHtlfXd21/abyH7hl
         PVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvXKfAWzlfrHMfewgN/Dho63g4im7AYv20D5/ymNMtwQ6q1pAsaRd7vdgnyjrdfRVrSZqrr60oT6gGYuml@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5RsYUlEXGXvV3Gc/yIXCpIXK9B6XdV67a/XWwh3foWYqfmY/m
	CwUT495BQch2r9HCkgLT1Hg7npwVUnqBjjN6J36nmAqeMPb50AIdaW6a/a24fdM9iGqcu4OVGx9
	KtgABf9OQYff3HIpjHJarXIWqmweALuQ0yROoY9MPE75LCmjMft1hp4PPEFd9COWDoZM1
X-Gm-Gg: ASbGncvSb4lLFUUwLdlHk7rLdYQFyKAriJUIjij1ykcyLBOGRnA/OKXl9OKm+cgG9SP
	k5mRIH7MJdvjpgshjE/uFgb8/AfoW+o8/XuTys5KHu8J84SBeMVmAgKik5P6bXz6FmIMgz30YrT
	JniANUhmUcYFHfeF6eWDpjONRAccXH8YQ77Ql1o2auvrGF+wjGKB7jdKRzA6ZtTjjbScjNE0N/t
	G0AShwRuKsh7mCqycViLPlveWgaGWDEzKHsdcAYZZyb2rfaZJvPj6GRBN5+WQMDVUScCG8d+bxL
	T+EttYDJDrqdewWZUb1nX9u56s5Z1qdqDLCMAhkoSBrcQ//TRCrPy3ccY05PMmMY7nw=
X-Received: by 2002:a05:6214:3015:b0:72a:679d:3560 with SMTP id 6a1803df08f44-73940bb3714mr189836626d6.51.1757569748843;
        Wed, 10 Sep 2025 22:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv33l1lT3f5JIUGjoNlxGeEhADQaiwhDfuuPedj6AJUeuHITft8OXqXep9x1O23/mT5xinFA==
X-Received: by 2002:a05:6214:3015:b0:72a:679d:3560 with SMTP id 6a1803df08f44-73940bb3714mr189836386d6.51.1757569748212;
        Wed, 10 Sep 2025 22:49:08 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm1020544f8f.31.2025.09.10.22.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 22:49:07 -0700 (PDT)
Message-ID: <7b7db1d2-5f53-4b08-920d-67a57d975313@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 06:49:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
 <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c262d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=WkAs_pJEH6EIBUO6gLIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: DR3bRaEkcDVf7PGNHTpjFrYYj_96CDyH
X-Proofpoint-ORIG-GUID: DR3bRaEkcDVf7PGNHTpjFrYYj_96CDyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX8evM9hVvWI2T
 hALCB+4j+QDXtpCtwEzDs2jgLMwtlQ8ZSwbQY36mqn0JrJ9G1+FDJEwdFjU0GG3OW0j5BOULOe2
 sqTe75Q7NBZL4jqWrYQO5Iml0jHqdMxgiSoEV0mKhp4C+eHV2a4HQHGhzvwK5EZlWsCxDUWnwYO
 0f7cYW/AxZgb21kIaaPC7ciY5LsTo4LBWW+9jsVxCXYetM2veUexw/bRHOW6jEiZSDa3HNpVNtx
 2MxYeCGGqAu1lw+D47R8Rl8K9wC+1nmIrizG3/LZohYP7I4Pe/Wraepmct9UNF99iyCQp7XRh15
 z4Aog/XY/rJ7DQcrDoszpz79FGR9BOD2+uqrPtexOBbiyT3WZkiJQRIugGwDHp7/Y5EDpIEly/I
 mLYog/W6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000



On 9/11/25 1:52 AM, Alexey Klimov wrote:
> On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
>> This patch series adds support for Qualcomm Soundwire Controller
>> version v3.1.0.
>> As part for adding this support, a new macro of_property_read_u8_index()
>> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
>> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
>> the register offsets, new entries are added to the variant data.
>>
>> Tested this patchset on X14s and Glymur reference platform.
> 
> Well, I don't have any Glymur devices and no idea what is
> x14s (I guess some laptop), but I picked the series locally to test
> on sm8550, it seems there are some generic changes, and
> qcom-soundwire probe failed:
> 
>  remoteproc remoteproc1: powering up adsp
>  remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
>  remoteproc remoteproc1: remote processor adsp is now up
>  qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FASTRPC
>  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 12
>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 13
>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
>  PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 14
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 15
>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 16
>  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>  platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 17
>  va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
>  qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed with error -75
>  sched: DL replenish lagged too much
>  platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec dai not found
> 
> Are there any dependencies I am missing?

Looks like there is a bug in sm8550 dts, its adding incorrect number of
ports, which is why we are seeing this error.

Its good that alteast this series is detecting some of the bugs.


--srini
> 
> When I reverted the series the audio started to work again.
> 
> Best regards,
> Alexey


