Return-Path: <linux-arm-msm+bounces-78127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5FBF57EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F833B9F65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1120E32AAAD;
	Tue, 21 Oct 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXetdccY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B0731D736
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038778; cv=none; b=Fu4OwLwSLYsvoUkKgEOsSdJHH+g+lmv3kIFljIy/PXlxHFqJ3EXg7SE5FgJLQVzjUT8oMgQZwrjDBKPoCvG2/27mr5KYHCXORfst/VKbMsZG87MsOL4jlMYqt+iA2r4NMv1UB2wFK/gQA6gayjb4yu7I98vTfShTjtNck4E6NP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038778; c=relaxed/simple;
	bh=2f6PNo8akMHM0ow78qncOsfP9ik2SgrATiXZ5mfN5Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3WHtK3Q10QHhIwX5rjPLO9h08jbNhDDnm1qwe7KvQ2O0ryZNNYsYCrdXW23nKQk4PaA2w1FTRb5ntEP+x1/P/qmRAYco3MsRuO3wOwTNk+2WgIWYPfL/hopKmdxEli81MNZD81XTSXlXoUVQzdIElmcV8S2CEmSCpJqXpqEk2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXetdccY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8LwpS018809
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQ5S6LYVVpRZCjWQzqjDh+0QXNJqqNKilZF5XszBUgY=; b=XXetdccYjTQFAUBU
	pI/Ng3rBDxgZWVvyJ5/MzH8r1GnX1690GOAPRzS2De+Hz61YzXqNWURS9VjYQ07/
	C4wU2nUM2jNr3T3tAbtIgkvYOZ8gcJl48rJ6gFFkeNXkMyFfzRKSIfX73dCvq6ki
	YDZRvpcQAqihMqAqsR8SgBU5LpHTuc47wv6G8JDD/NTBzEn2mp0sFfg+lqrxTEM+
	i9jGUDnLZRh3I0DsUr8so+cVrpzN8kD8dwCoditdTRROy2Ml4wmZOt7FbF6Tjca9
	+Wll/ulhk+Xt+JtM0D9+6lsKzyctt7k1E11yY7OGXKRsJfbRcOoO20K/o1JbPNSG
	yFiSgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469g2xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:26:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f7d885f8dso211896485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038773; x=1761643573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ5S6LYVVpRZCjWQzqjDh+0QXNJqqNKilZF5XszBUgY=;
        b=qeU+iqY3whyXkhiOoIJSzwJsx8OFxBCS3DHQ9WVJO4eXTE5riBVUfbM6WHET5RsFwu
         Snc6f0/+6XAL7z8vyMd5AFytHl6c8nN0kh5qn/l6LVQSZwiiIa0xkVMP5xwJBqyIUyr6
         iHxYvEFHwDnJnhfKkygJlQuCiJFmw+DgVEqreUcUfwQLFgKf+b9UDKFu5yUBE9s921Jd
         bFnrf2lKB+bPlZV/SiwS6ICcWi0M3hVvD+XeULe1lskYL0xsvg7keGJ+HEiJRcA0VCyY
         nThAkWzg/4Xzcc82qNmY8UOZmKw8JyfBVK0000NQEArRw9avx6c8ABrq/XEDlJtVngPb
         pxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEFy+8zEap6bEjTWF8iumpCmUJBZdbFOOq0FxN/I65uMfJXZUxDyloHJJEin0YVVUYW9NDFWmWobEaN3TS@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIvBG+kvzG8AvCKeA6UV9EpN/EB0crSsm6zzzAlZSUE/fuONJ
	3r4b8NJfdKpZ/uQABS7NPoESblhlafGwdkRDdC2cqY93m23eTWFlk9zrpKwTxbiDIfZ7mJZh6at
	tc7+rbieTCoVaKPQ9G+kdAYxy+wgKQpzw3Ndwh1IjPYGsBCIwFvMz1teXOrpSQuTz/1xW
X-Gm-Gg: ASbGncstUxlRQYX6oGdDotlAKjlfydEji0PeBDV2kdQoXY6GHJcy7kr6ZtDtArI8wrH
	Y3nw7OikBfcra4g3axjp3pnCwILuGJtVGPbOJQcn5liaHiBSnyocW9uM5qS93peradEWTdGXtfw
	K8W1IXmcmVb42qCq1iiGEkQIetKKGw3rN8KlrctiSGTiuT95BIMMkCQaQFTnbxijT1B6xOQal0g
	LMIyvSP1FNxpcNeBVerdBR/eEx8wkanir/fpHR9NvyWdw0MczFrmKLHLtEB2ahDfON9qEKhEnQR
	k6XZR3hBdKkS3IWQo0k60O4sUXU8hgO0lPrqlobEl1O9nLOI9no7b16+C9DvJD1Vr4BC/yxTYWP
	AWLYjjqwpluko5qz3CtXItnjtNjnlus2AfuTm2xKeDWRa/ks+8qB/PmDt
X-Received: by 2002:a05:620a:471e:b0:891:c59a:a9c0 with SMTP id af79cd13be357-896e1ddc72fmr204397085a.5.1761038773181;
        Tue, 21 Oct 2025 02:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEERhuwHy7Nh2HueImJqZRTj9hw0JMYU3iQfmrba1U60nisbmo+Q9582QrJk2M4uByUxCrjRQ==
X-Received: by 2002:a05:620a:471e:b0:891:c59a:a9c0 with SMTP id af79cd13be357-896e1ddc72fmr204395685a.5.1761038772716;
        Tue, 21 Oct 2025 02:26:12 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm1038843066b.73.2025.10.21.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:26:12 -0700 (PDT)
Message-ID: <7abcb827-4a7f-4855-811a-4212b8357333@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:26:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
 <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
 <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
 <97afc64d-b384-4edb-9665-a5d654c19771@oss.qualcomm.com>
 <168c9cee-5f5b-4c45-82bd-45c911da4dd4@oss.qualcomm.com>
 <f8b85e89-c546-4bcf-bc95-d109d453bfb1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f8b85e89-c546-4bcf-bc95-d109d453bfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NXXMtkLHZ5UI290f1bQ8kl7LKHI4PPR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX3EENlU5bPGdo
 T0keekWk+d9PMzSTIayIDzltw2L0vq+wni8PzhrjPZkP4/twl2y3PEqM8+ueRZjPq0P+m50j+Ep
 5HX0i58X1CUvDmtFDVvMc5HbMmSISZvFrdyXSn6zqay/CSsPbUhonTBX3wCCxLuhc+gUHqY8jQD
 OaePHjV4ue3LVT9IKtR2F01MQ5Xrt2dox+T0+fe5YHWT6DS4e3g9v3YDMVwl8NC+SSFE+494qnz
 ocFYbJMb3Ece8C7ghThswghFdsEraUot66vICLiqQgFm2Z7u13hGJ2N0Fep2McLQp2u5iElunjT
 V1grUG1lcP58huGVCfNOdRBTA61n00QvUVxJ2luGdCtZrvPhwCrs8bGsZd+Gg55BvvAyhrRO5dS
 1OTztDG8oWAYfvMfQxgNg2W8hggz0g==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f751b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OtXjWRe8G1RkqavMlDUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NXXMtkLHZ5UI290f1bQ8kl7LKHI4PPR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/21/25 11:21 AM, Srinivas Kandagatla wrote:
> 
> 
> On 10/21/25 10:12 AM, Konrad Dybcio wrote:
>> On 10/20/25 4:42 PM, Srinivas Kandagatla wrote:
>>> On 10/20/25 3:39 PM, Konrad Dybcio wrote:
>>>> On 10/20/25 4:37 PM, Srinivas Kandagatla wrote:
>>>>> On 10/20/25 3:35 PM, Alexey Klimov wrote:
>>>>>> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>>>>>>> For record path, multiple read requests are queued to dsp in advance.
>>>>>>> However when data stream is closed, the pending read requests are rejected
>>>>>>> by the dsp and a response is sent to the driver, this case is not handled
>>>>>>> in the driver resulting in errors like below
>>>>>>>
>>>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>>>
>>>>>>> This is same for both write and eos.
>>>>>>>
>>>>>>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>>>>>>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>>>>>>
>>>>>>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>
>>>>>> I was also reporting this error months ago.
>>>>>> Thanks for fixing this.
>>>>>>
>>>>>> FWIW there is also DSP timeout error on Audioreach-based platforms.
>>>>> there should be only one for SPF get state command.
>>>>>
>>>>> qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>>>>
>>>>> This is expected as we are checking for DSP readiness and it will
>>>>> timeout if the dsp is not ready.
>>>>
>>>> Can we make the UX better by adding "bool timeout_expected" in the
>>>> path that we "want" it to fail?
>>> its not that we want it to fail, its just that we might fail, if we send
>>> the command too early.
>>
>> I came up with this to potentially work around it, but it seems a little
>> heavy-handed to avoid a single line in dmesg..
>>
> Yes it is. simple thing to do is wait for few ms before requesting for
> SPF ready status, that should do that trick.

Sounds good!

Konrad

