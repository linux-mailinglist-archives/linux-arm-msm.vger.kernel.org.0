Return-Path: <linux-arm-msm+bounces-73062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E10DB52862
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 07:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28FEB3A7A82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1AA253939;
	Thu, 11 Sep 2025 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwHnlDp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10F241CB7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757570206; cv=none; b=oRvki660Ti4DZsHv96iJQhW0ttoPFjk7WL0Vcp+W+cJDH6jinPpZabdyg53zPmE95D8F4b1sagl1J1LKk7XmTKgc63KWs9DEzciDDCbE3XKK3cl1oifgZak9PUEdc/2Zn9s025zTSy3iWUwpkLf2QX4fUztGvIXQwQoNzNwelkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757570206; c=relaxed/simple;
	bh=DmshXf/5scl3Pm/UJbDqoYcBADlVEZ5RAfxYLM+kk4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlmqVtHwzom7U6fEMCj/5gEEOwlI2jCz4y5yRbWHvGGPkaRB/kFi29koIO1cL6zZ+wUSz4z2LFQebp0gUfRJnKBpUR3Ztgn2w3C5f8d7y8Cs7SRkewBlhiorQds5bb4sGGis15GZeahOJADKOu/AKfiTU6ubnNsCuckEN6UcJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwHnlDp/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IUjf026249
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qrl5C0hT9w9e5dT2xeERuIRlc0KOrzACJwYdylUap00=; b=PwHnlDp/ETMk3YYU
	poO8JWPb67K5IavZXTuLwG9jh2l2IjAmMTrG5cBBCrhfbE761CfkGE3EV+Uyt+nC
	SdUk9JR34iezNr3YpVyOxIueASf5R86tfD4tP80oCgsUIND6KsfrhbY0QabWEX+L
	g/XNkVK03pIAODkXX024d/TOZgGEENfCrahBIT031EEfHKqVv2BP2CEZ+tnPVGfD
	L363AJllhbvILVG8kC36T4rkECu8zweElQPJJYA1x6xlDtzZDZ17wDcdQE3+moyn
	KkxrbviquK5hCJpP0szRw2xeNd2hWHHSYblshcVyaSfWQjn1rO1Zr9ZIjK4UCakv
	XBtUmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h1dgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:56:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72023d1be83so12914456d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 22:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757570203; x=1758175003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qrl5C0hT9w9e5dT2xeERuIRlc0KOrzACJwYdylUap00=;
        b=vC3B6ddzVReTNXpf1SCBfpf9oKHEWAlmgxB25NomCfErSWc+xBDMfGGh3uI3qyQXNy
         YbPidSYuT+VnV0MpGFuVqJIoXjamqy+ZZTvWWx9iNC4XbGryiJio2Ev09Nn8e3BxIVBg
         pLoqhy2KelQI+g+2lRXnlnGHUJ9k7T3UCjx+cWYJfdZXWersD3NHtRQVzh5euU1jf7Zc
         YgtJmFZ92/OGVkBCkfdReMYJLj75WqlPFWvFxeGOkqOMLLBdIKeIO0xpynGfS3ILBVsP
         GXB9WL9JhqUZ1gMTcaa9aDm5xbPqnNcCOkWZ/lS1H98NbozvA3BLIydtSM2vfZAXh+wb
         Npwg==
X-Forwarded-Encrypted: i=1; AJvYcCVLj8nvA69zCNCJ20ZjuALIISAErOz/30hoz8TlAC83vNh09F8XmNuUlziphRoLyYRDXmBj5jXA0f0Ek2Bc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aDPhJxsBowPn/Q0wH34XxOQerjfgK4TuVkjj4zt7CTwnObfA
	12rb8DDb/Xsn/H4mbEVHRWja6KvusBTQgLJ5mdKD+HFfbEh3eO4//N7EAKOnzfABI2A+vi2SPeM
	axlRqh6zcn/VslEvF7o3Alehfl2+bFl1KdYVARTA6gWF6prfeylf4106I0Ukx5B4CAqdF
X-Gm-Gg: ASbGncvQ/3fd/WZaIsuBIbwuRq7w5xeUCDAuVzT4IR1B3aTvX/GEb6AxkP8672DLEsi
	KbDc0j0uXhhT1cbOEen0QB/w0Y5G6G7wNONz4umWF7CL0/b6OpcUvLY8Nehrg9jI6OwOL3IqLNR
	CXFPirjQlI+Bf+Wygq6xQbm2Q9NPAzFffNUURJak0StxY6Bc3DeIQVUVVy9kRVc7hGSuMwib0A5
	2tjHg2zWUM1QtvpOrcKio37kNYVXiLPTDKFgrs1QxBvmaBvHJS1xxDQbO6bcJBvZE5s+L30wmWp
	Iqo4z1jESb1wRPZdswefdAbbBSNbXfwrOsCnmJMdSULhvLKRL+u0kssvJewiGRDa0hQ=
X-Received: by 2002:a05:6214:224c:b0:728:a449:2187 with SMTP id 6a1803df08f44-7394587e1d2mr211055276d6.62.1757570203148;
        Wed, 10 Sep 2025 22:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEctnZbvL6Nob+WnC7gYxO6xEq3FJkrxhfSF7sRsmUMyUoMSDUtaNN2Zbm0L9GTtQcYr+zoig==
X-Received: by 2002:a05:6214:224c:b0:728:a449:2187 with SMTP id 6a1803df08f44-7394587e1d2mr211055146d6.62.1757570202741;
        Wed, 10 Sep 2025 22:56:42 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e03718c64sm10121535e9.3.2025.09.10.22.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 22:56:42 -0700 (PDT)
Message-ID: <947514af-5039-4ed7-9d24-893e8e6a436f@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 06:56:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
 <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
 <7b7db1d2-5f53-4b08-920d-67a57d975313@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7b7db1d2-5f53-4b08-920d-67a57d975313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9M690t8rwFGfYNOG8-fRPG0R-WfKemMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX0bnBHF1+7jar
 BN4+ONUnqlDSkwOoEUDfcsWlPY+LMnw8LkQSAUnrLT+HdGpvOZ0IRJZ7r1zXOZFsjVzrXI4Yh9w
 QKr2IYBSETncaK9jHxmg4Dsw0ZtmrKSkTlmLyqv28tcGZyDW8cxG/7X3EiP8zS0PjudKD+ld8Q6
 QSZwop54UYvuoqLHthzvH0JJG4/j0SwiQAYk/emVqA8xJ3hWA+HGx70GpiTVpQ9BRxZpy4dUIUN
 +k+PkIPQiAQAKsFCekY5pRbpAISq7UlrEQ6qtKK5w2/yRMw9DZPV8XP+k/0++8BjRdr69+sGKk9
 9cc9A20l1zb77q5pcQjmEHC1TFWDMvPy5wZq0lDWzuV2eEA0lLSHITBMWWaMyV+YVs5YN5BOSpu
 Fo7Coc/0
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2649c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1gS6Q4nU2R3-upBo_fUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 9M690t8rwFGfYNOG8-fRPG0R-WfKemMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177



On 9/11/25 6:49 AM, Srinivas Kandagatla wrote:
> 
> 
> On 9/11/25 1:52 AM, Alexey Klimov wrote:
>> On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
>>> This patch series adds support for Qualcomm Soundwire Controller
>>> version v3.1.0.
>>> As part for adding this support, a new macro of_property_read_u8_index()
>>> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
>>> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
>>> the register offsets, new entries are added to the variant data.
>>>
>>> Tested this patchset on X14s and Glymur reference platform.
>>
>> Well, I don't have any Glymur devices and no idea what is
>> x14s (I guess some laptop), but I picked the series locally to test
>> on sm8550, it seems there are some generic changes, and
>> qcom-soundwire probe failed:
>>
>>  remoteproc remoteproc1: powering up adsp
>>  remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
>>  remoteproc remoteproc1: remote processor adsp is now up
>>  qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FASTRPC
>>  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 12
>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 13
>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
>>  PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 14
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 15
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 16
>>  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>  platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 17
>>  va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
>>  qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed with error -75
>>  sched: DL replenish lagged too much
>>  platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec dai not found
>>
>> Are there any dependencies I am missing?
> 
> Looks like there is a bug in sm8550 dts, its adding incorrect number of
> ports, which is why we are seeing this error.
> 
> Its good that alteast this series is detecting some of the bugs.
> 
Am suspecting there might be other platforms which could hit this issue.
Eventhough allowing old way is prone to errors, we could check the
existence of those properties and allow old behavior, may be with some
message or warning that incorrect ports are being setup.

--srini

> 
> --srini
>>
>> When I reverted the series the audio started to work again.
>>
>> Best regards,
>> Alexey
> 


