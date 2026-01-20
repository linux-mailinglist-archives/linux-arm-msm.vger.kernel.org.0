Return-Path: <linux-arm-msm+bounces-89849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBxXL0PCb2lsMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:58:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8C48F83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D304E78B45B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CD444DB7C;
	Tue, 20 Jan 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXDW4IGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IabMKjdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455C43D4EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920236; cv=none; b=IqWIViJfYDmX6CB9hsPo9NDXSfUXUx0KpUYGiLeQIqVZOBTKKCs05Aqg3Gtq7NImSWJhzqCJto5f8mmKbEQ5EvRcMpQ3RStdt8fHAOcwMhOp2bgbDfT8zE8DW0HBJKn/dHyEDj3/0OzIpsLdvUT3xBwA1RvZhC6AGCtsDBGGIlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920236; c=relaxed/simple;
	bh=lfDfPgLnzLb3DFJx/z1f+XkYJVZarEdcqDRTCYUPooI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qj8USWck5c7FOd8Jo8vuHfq8KqTOqr32VHEd3SjLdMi/chnaI6TNTfC2AihQ6d+uvw8s/hRXDPCWcTB3lWRUOHoQtpHJITAI+OhGlRISYVVlcpIVNt5wj0mDZcnFYxddOE/ZTVe5J0d+w1lslv0sTsJjkBTo4D1zShv2YvoUQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXDW4IGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IabMKjdo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDgUAN781923
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2F2MscGUxOcgirT/V5wZPZEuDvjWdo44geWYhcKaiJk=; b=JXDW4IGN4Wz0LPrN
	pZWHAkDrMhhIkdEUc7fmc2sfuLODg8GKIKVMY5Lvbev4z99jcTBBkmMQqdXuWpV7
	KP2Ew4VD2+VmNcV0iu1w+FEnsAFSFnv6750j11EOanrSavqV92KwC0vUuo1U88sm
	JJ790XauOMG92IwakOKxYF+DVyOn3uySpO6sSUFNZLl/cfn6FLvhbebqURfdGukq
	s9ewUJ8rEnut5G2zIURU1V6cAYUy08+hws/dBSj2WOTdTo4l3W+HyXHTNe62Yzbh
	YMVFj/hnqNo++YHmj5jjesXCjCi8Ana9niz38QrVx1sd643xKtEMk+ggVRDyeyv7
	GHujhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatyr657-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:43:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946586903dso1544276d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768920233; x=1769525033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F2MscGUxOcgirT/V5wZPZEuDvjWdo44geWYhcKaiJk=;
        b=IabMKjdo7IbfcJPBa76Y4gCONRB7MzHJk/CzGqHPRSJ19VHBhTjLh0DAUMg/VPZ5Ap
         PP78RMIO3J8HYZ2pkYbk6NexX/PmXNxlNq03TCX1pyAgFLyG2yRINIQHwX0nKi0R7pO/
         yZNcddHx/aQ+Ku636qBbDFUSrpIe/WJBOnWvGq0bUEARwt45PE35l9E6BDtYSJXLQd9n
         A3RKonAp1bl+Rmcc+L7+LVJSfdNUVAUHpB76CBeSMtwoFjswGhpS4+gliXjYgnKlAxkC
         6CVVTwQ9x6dy8yy8ep+v/4h9A2QpVa36p3Zl+MmR1orFcr4Y0O1VlARy3+MC8zzUQufV
         NK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920233; x=1769525033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2F2MscGUxOcgirT/V5wZPZEuDvjWdo44geWYhcKaiJk=;
        b=tfYK55AxuuVwDeJwOoBDl6mtynSmGcg8aPZ0MHPE8H4kMJgNRpQMPF5sFeE19WOheL
         kXgnhil+YSRiBqLwpUhHcHfK4d4Ab7HzC2ODCo+OV9d6i6K9pBUc3+g1GGG2FRmO1uFA
         hCsoZUp2IDaJdmXYAXWa2HHpaAB14DOw3Zp1j9I3zRaX+KXgDFhbbxAphqu7u9f1z/DV
         IZ8SfFx4uGS8/F35AWm7cYVUclzNznHhxxw8w+j7s6gVA6LCyXezyUAHySVyRqKAayCs
         KYjRcoQ6HaVjnH6Mjv0wEqgOZsfP8jCKL0R1cXuPrsrmv6vfxUMm5zfhEGUTsWUlL4CR
         VsQA==
X-Forwarded-Encrypted: i=1; AJvYcCU4QH9SaqDw8yXuQbhGWZhdSyMoRHsyNh1r6hZWuGfwWpHm42wL/3GlMEK8VbGPvk84KghgOHPgwL8n328S@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0iWkhnbZl6X8zEckHaVXeyLR+heNOzRRjqRmj5O2nqtVTCEH
	XvREX1Wa2PTGLL0uDr01vzWprYgHX1q8N1hNcNmRao1lY8JCa+4elugE/2GiDxDmJ91vgyY6I9k
	LWAX3TfRL98VUI9dLBoW9DXiwBiypV7wzGpiWSLp8hPvgdEOoB8TbvoZZFjR5lda/w6Tz
X-Gm-Gg: AY/fxX5XiH+ui3FNZF2tqBir1byqkmpQw2fIVRB0YOsWqVmjY1r1iQgyAYaK50U9FA/
	8OyA4GaK/cnQPxFP37o2FyZlqxUpGbt/51NO0eMdEsBDahPRiwsnKQkvATAwOGA5Dwix5lpnRWx
	HK4PnCCGkOmCA77xF7OcxZG4t29avamjQEM/LT8HacOiaXd/7XFbRDUf29rbJhpOVARInSkYf7e
	hQUoUH9F+m1pBduQBQEL8BwNvLwjJrkE5aOVCH3x9JJbRA7aC0WTcDX7tlUuPy10TkR5+9ee7XM
	smGWIV1hKpKtZS9qu92kQPcD1SU6gudNtutvCRQesI/ECRyYYm3SYy7IV6F4MlWUJ4Nl/ImUpSx
	RAOc3qD4UGPpYOJ7UoEPc/kDc0z2af9gpRTnBEK5JgD6PvFi7EGssq5oDM9SGzVQMg8s=
X-Received: by 2002:ac8:5ac2:0:b0:501:49f9:7495 with SMTP id d75a77b69052e-502a171fe7dmr164515401cf.10.1768920232658;
        Tue, 20 Jan 2026 06:43:52 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:501:49f9:7495 with SMTP id d75a77b69052e-502a171fe7dmr164515151cf.10.1768920232227;
        Tue, 20 Jan 2026 06:43:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-655a21abc55sm12521521a12.28.2026.01.20.06.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:43:51 -0800 (PST)
Message-ID: <99796cc0-f29b-40d0-b8bb-ebcbcc950b23@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:43:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
 <d8c24f26-3ee7-4966-a11b-1e2afcad93cd@oss.qualcomm.com>
 <908b64f1-f6ac-4c5e-9c72-1174cba62017@oss.qualcomm.com>
 <f10ade51-b29f-45cc-9895-d66a319ab26c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f10ade51-b29f-45cc-9895-d66a319ab26c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMiBTYWx0ZWRfX2ZmuCh84qXYT
 39NNGCLnD1Nzuc42PEm2sbb0GmLJm6vSG4DSo8qxBIMYHJay8eVUroChBSF6Hj+Lvv97HAQHTub
 3k+ZkiXCpIk3bYwVhNNesKneryoM4/bvXUbBn+0djqkK7YtFE0kTmglMet2SsPmi4Ra4upB17G5
 cJAg0sGKchksHVVOgc9eu2Y+mFhuPjoz8P8np3HhUECHTW92dyguHv+TM+OivkTEmM36XBljzdJ
 RJUwbLONX96/akYQBQelPYfCpGp3VMkBBd1ETSdk4Hdr0mK0WlKWrqQYyAGAKWxVZ5IgSt1g5l7
 VxWhudyertSeaS57T/WjQywTb38tdJFcgMjkj4xwoBUu0JEQGVlWdt+ZKZHars8W4s//ATzz/GD
 tUFJWRcEVJY0ED8tHtUPRUgN2w6w0Zo2zu1twYlq9navYUQxYiQ3uARXbk9p4+P+A+tC16DEyTS
 WLmRy4KLR92m9eZeNXg==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=696f94a9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=INXtvDbky3fP8RKYrpwA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 2o6Z9BSzECM4XXJrZCGmZGtelCr1Pa_s
X-Proofpoint-ORIG-GUID: 2o6Z9BSzECM4XXJrZCGmZGtelCr1Pa_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200122
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89849-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EA8C48F83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 12:25 PM, Akhil P Oommen wrote:
> On 1/20/2026 3:44 PM, Konrad Dybcio wrote:
>> On 1/19/26 8:00 PM, Akhil P Oommen wrote:
>>> On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
>>>> Add the cpucp mailbox, sram and SCMI nodes required to enable
>>>> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>
>>> Just curious, does this patch enable thermal mitigation for CPU clusters
>>> too?
>>
>> If nothing changed, we have lets-not-explode type mitigations via LMH,
>> but lets-not-burn-the-user would require a skin temp sensor to be
>> wired up, which then could be used to enable some cooling action
> 
> In some chipsets, I have noticed that the gpu cooling device throttles
> GPU to the lowest OPP even with not-so-heavy GPU workloads, making it
> unusable-ly slow. My hypothesis was that it was due to unmitigated CPU
> temperature tripping up GPU Tsens.
> 
> So, I am wondering if there are any additional CPU cooling related
> changes required to get a reasonable overall performance under thermal
> constraints.

Yes, something like the aforementioned skin-temp sensor at least..

Today Linux will not throttle the CPUs at all (they're not even declared
as cooling devices) and we sorta agreed that in general it's a good thing
(tm), because otherwise we'd be coding in a cooling profile into the SoC
DTSI without taking into account the cooling capabilities of a given end
device (i.e. in an extreme case, a PC with SM8650 with a cooler that's
3kg of aluminium vs a Steam Frame headset where the SoC is centimeters
away from your face)

Currently, we have cooling policies for devices with fans and the only
other action is based on a skin temperature sensor (sc8280xp + x13s).
Everything else is left up to the LMH defaults. AFAIK work is ongoing to
create a more informed solution, that would have to (quite obviously)
live in userland.

Konrad

