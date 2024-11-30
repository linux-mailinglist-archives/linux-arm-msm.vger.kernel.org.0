Return-Path: <linux-arm-msm+bounces-39715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1561F9DF076
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEDE928126B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 13:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6251F1917FE;
	Sat, 30 Nov 2024 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7qbHyrC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583B43179
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732972462; cv=none; b=EvuJlGra5mrmGV7B12KSJUo7sKCnxO+vKiQcsLUusae+A9GJyRTIdsQ3oGUjT/2VSEdUOvZXjdmiRMYN8VdsQJvgGmlCVCZzRD3BadCJdWv1IcAps6bXt1CAlacH/5kx/HnVsZo2ZRjdleMfTBAXepzPz1cnPJhXtgPO+nfMw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732972462; c=relaxed/simple;
	bh=kLX1VYA8sW6oxdP+/dNLxcauKYs7nG88C4U391PejSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FI5ucaDySbO96eGdtLAWaEG6elnz1BLvVWKLKWbaNXvolKb15G0yAHYh7UPDTCklb5RHVrWir96efJy7sGSIsMK0UK8uXIPmn8IXbIurZWAT2BHLqr0etBgHBdii2er9Bq/LDJ+A8uPdVDiqksDM4qEEata3+Jn4iSHcTXo7uoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7qbHyrC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU3Pa1o030153
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 13:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l13Ngj9yg6PunixOCdqY1iHYHScDPLBYSD9xTzyt0g0=; b=b7qbHyrCQgJp6fbX
	NNtWz7cTMfuVMLLZf4KwNp95e5ri8UeehBdXlR98ztNKTgjSLSDdwQLu6VGhdIiy
	gOrh1PR6L+t9o5rSamPdvZYXOUH+eOHkw5NcXyMp7aPiu1SWC09kMkyECE8bwxwX
	qRpfu+AGHzLRq02ywAPQO19QbQVySyHW0v2O7DwZBT30Ap/LdroVKfsdyWUvOn4a
	VCrwgq8dYcghCEl3VaASoaFRa6vYAsZDCP12OdacWiKiKR75Cc1O+2H1Y/fX9G8W
	5q1NlVQc1wZ8gxgcS0TppVbB+8Q9f1hT8NVotib3QbR4tmY4GuLXoqtJGQ5FZHjc
	vXq5wA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tst8rdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 13:14:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d87f10a5c7so4539436d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 05:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732972458; x=1733577258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l13Ngj9yg6PunixOCdqY1iHYHScDPLBYSD9xTzyt0g0=;
        b=u6SqpCB3caGJDKFTNfGTdoIn3QdXm+xFLoSxldg1yPkLRXYuFqIuW4JfLNyiF9+/kt
         DG5sIq/A42keVMGmSARFXo3tKZ5e7VFFJlDUSG1M9VMUET1miZ/UFU+s3d3KvdFFZ57+
         Ut5rtwWhz0rEcSNL0ba6GSzeyCC6ZqLeWjjT9INPo7KasyK+JpQdd9+nLud1TXrVHyRb
         eP4Wr64ILoA5xfIfeZFqlKiQEMDyDVAk/05sBQM/GPQqwutXNn2mI+AsQeEU8IOtd8Yn
         CdRIAhEYvG88nRcjlmJuc0Rk+ODiVSV/FgxEbX1khPBLmDODKm6hj6EL7HnXDiv21D88
         7/yA==
X-Forwarded-Encrypted: i=1; AJvYcCWfEqiDGri8gBPqDUxtlLmvXAC+BZ6349uBi+6/yzDBZEHzP6IwiGFnwRkKXQ1rw+yETuH4qfAgnVPiH+DK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzimh4EETqYXI7lVpEOoR9tLeHtphtVe9uQBNiY3bLOVtL9VBpK
	V95pk0UUtccdUROYiDYcsZoglkHQaKwLVwILJH/klEeF1q473IUT1ucFXYJ3tZqPRxWpcQEZQam
	ndOjVbgfDKqnEpvRpFdA86rrGtPEVpS/mIWbEotAUC8OgTpuOF/BdeE3ha7X/SctV
X-Gm-Gg: ASbGncuUFRAGFUWyei+StE75LTv8+wP5/BpL//PEePPyewW8QYKczI+YxF1jVYtiziC
	nPKfLpSEAUNAAQFkjCpWkvmPU4UYJtMyWuysUmMd45NZntuwQjw5b6kP9PLhMPfKdIXRJsTWsYH
	3tN9FgSx0UND86eo1iZ6S3x9Mp/nKgY2BW/qCLlnH5xffi+QTERtdTAUcNaMmWhKvwjgHopUDVX
	ZF3tR99a5bj+M69S7152uXcrEI0dgvuMb7IUCuMA3Qa1NU+/CcseXyFZ5vQ4n/icxfFEJL3yItg
	N9NmON3xC/tGVLtV65IAFfwVWc7Pg18=
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr99634461cf.13.1732972458209;
        Sat, 30 Nov 2024 05:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtTVwwWV3W9+rLGygXE9EvB/WZiYgfOlNYU0gte1Iqi7uX/ksU1QhL9Hub2qmRCfqcXtBFbw==
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr99634031cf.13.1732972457739;
        Sat, 30 Nov 2024 05:14:17 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599905c56sm278909366b.142.2024.11.30.05.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 05:14:17 -0800 (PST)
Message-ID: <13c83db3-12fa-4555-9e86-e5dbece8cb7a@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 14:14:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/31] arm64: dts: qcom: ipq5018: move board clocks to
 ipq5018.dtsi file
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>,
        Joseph Gates <jgates@squareup.com>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>,
        =?UTF-8?Q?Bastian_K=C3=B6cher?=
 <git@kchr.de>,
        Andy Gross <andy.gross@linaro.org>,
        Jeremy McNicoll <jeremymc@redhat.com>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        cros-qcom-dts-watchers@chromium.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jun Nie <jun.nie@linaro.org>, James Willcox <jwillcox@squareup.com>,
        Max Chen <mchen@squareup.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Benjamin Li <benl@squareup.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-20-b9a35858657e@linaro.org>
 <83990b97-3f37-47f0-9cc6-fdaa730a8df1@linaro.org>
 <zdhevcnj6gszvaayhu2dghubwm23cdoyeik2dcnqo376gcstnz@xv46iu6l6yvu>
 <90418b49-5b19-4bef-b0cd-398bb562aa8c@kernel.org>
 <26lttxx7obu2oqvf4xnooqi3o7qwodhjzyjh4trjq5tlj2gzxs@uwihybmwbdid>
 <7778fea9-c127-428d-9653-e66e84f23c98@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7778fea9-c127-428d-9653-e66e84f23c98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nvwCoQOWygUXiGmwuwU4U_7M6_B4wgaf
X-Proofpoint-GUID: nvwCoQOWygUXiGmwuwU4U_7M6_B4wgaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300109

On 30.11.2024 11:43 AM, Krzysztof Kozlowski wrote:
> On 30/11/2024 11:26, Dmitry Baryshkov wrote:
>> On Sat, Nov 30, 2024 at 11:00:32AM +0100, Krzysztof Kozlowski wrote:
>>> On 30/11/2024 10:57, Dmitry Baryshkov wrote:
>>>> On Sat, Nov 30, 2024 at 10:29:38AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 30/11/2024 02:44, Dmitry Baryshkov wrote:
>>>>>> IPQ5018 is one of the platforms where board-level clocks (XO, sleep)
>>>>>> definitions are split between the SoC dtsi file and the board file.
>>>>>> This is not optimal, as the clocks are a part of the SoC + PMICs design.
>>>>>> Frequencies are common for the whole set of devices using the same SoC.
>>>>>> Remove the split and move frequencies to the SoC DTSI file.
>>>>>>
>>>>>> Suggested-by: Bjorn Andersson <andersson@kernel.org>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> This contradicts DTS coding style and all my existing review. Obviously
>>>>> that's a NAK from me. If you want to merge this patch, please kindly
>>>>> carry my formal objection for this and all following "move board clocks"
>>>>> patches:
>>>>>
>>>>> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>>
>>>> I'd kindly ask Bjorn to chime in as a platform maintainer.
>>>
>>>
>>> To change my NAK? NAK is still a NAK. We discussed it many, many times
>>> already. We have coding style for this explicitly mentioning this case.
>>> Could not be more specific... plus all my reviews for Qualcomm, NXP, TI,
>>> ST and other platforms. I would be quite unpredictable or unfair if I
>>> gave here some sort of exception while expecting different code from
>>> other platforms.
>>>
>>> Please carry my NAK.
>>
>> Of course. I didn't mean to drop your tag or your objection.
>>
>> BTW, would it be possible for you to clarify the policy on external
>> references? I mean, is it fine for DTSI to reference a label which is
>> not defined within that file or within one of the files that it includes?
> 
> 
> It is fine, you have plenty of such examples of shared components like
> some audio blocks or PMICs.
> 
> All Qualcomm PMICs DTSI (e.g. arch/arm64/boot/dts/qcom/pmi632.dtsi )
> reference them. Chromebooks are even "worse" here:
> arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> Nothing gets included there but hundred of phandles!
> 
> Are you planning to "fix" these as well?
> 
> These are just Qualcomm, but same cases are everywhere else.
> 
> But *that's not even important* because I do not suggest to move clocks
> to DTSI. I suggest - and was almost always suggesting as best compromise
> - to follow DTS coding style by doing opposite of what this patch is
> doing. That's why I NAKed this and following patches, except last two
> which are different.

Many of these components are simply not "fully on board" or "fully on SoC"
on Qualcomm platforms, and probably others too.
A number of components are tightly coupled and there are lots of circular
dependencies, or in-between cases (like RPM(h)cc which abstract clocks
specific to a SoC+PMIC combo).
Some are effectively represented multiple times.

There's also a lot of internal routing which can't be well-represented
in DT without adding thousands of lines that Linux would register as
virtual clocks that do absolutely nothing. There's also clocks that
are not even visible from software POV that are physically connected.

And as the final point, any given platform requires a fixed frequency
crystal is present and will (to my understanding) not function otherwise.

Hence, I think this is really form over function that gets in the way..

Konrad

