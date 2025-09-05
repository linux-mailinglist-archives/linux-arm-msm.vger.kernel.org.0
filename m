Return-Path: <linux-arm-msm+bounces-72271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0F7B4565B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259615A27DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97C8342CA2;
	Fri,  5 Sep 2025 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2zS+f7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ACF29B8F5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757071736; cv=none; b=jf1Tts0Wh1Ea8EKSWjhkDim2/R1Dqg4MOpaJh3zVWn3kwmDtTaC0aMuL7Z7hSjDnO/2bEl8Iw55slVL5aqMUFokWZya2HDa4s+sHeCyveLBobKxBSu5DeCtt4B8izLM2goM7ogxHuYINNqB6uoNjnLK05vrz6gCcOuNaTG29MX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757071736; c=relaxed/simple;
	bh=3ugSzQ8mvx7yn8q1JvCBgipigbi+7LXFxjkVmnr/LK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8nBN6h+atcDTNkq0vf7UidmiC0nTQKaEKtt3jKQFNpisHosUdPf/ChJKjfvRsTB9+I2QI9IUo1lk3Pozh76rbo2LZJlrERhfOJSzhXk+TGayMkPyDBK839gbDHRv3jrsySBDOcG0MeNTp8wlumLbnnz/wdnd87Jbpbjb9ogtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2zS+f7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857IsU3031930
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 11:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6doEwX7B7ZWbprEQ9MoiuAdrhDwCLb/kSHRWBeUn8+s=; b=S2zS+f7dm6Ryl33w
	gRwg0Dd74Ijj9Oiq3y604bxa6dXaPtSVUEl4UxRChkbrQ4BRD90kxJ5H6I8CQDR5
	sqxP/cMBUAKZFsMlTQZsoVW64GGckIBflvE4b8wGDQgW7qpIVXmp5TrLid+oQXjz
	CS0foQya7UephyMqG6d2VVD2JF0kOPMx8y2vbN6E3KJkIcG/O8LV8IUML7GBirk7
	Fd3n4D9bNiG9Bsurrp0fWDWfiAXagTM+huY8J8ULPixmkylAxnFk6L0bAf/5Mpsy
	3aYvSm9eFEDpa1qJup/E7P5Vuw7NHP0VXX5h5J4RgFwHJGX01HnVy96sSXggi8QX
	er+R1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0b0w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 11:28:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7724ff1200eso1805706b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 04:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757071733; x=1757676533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6doEwX7B7ZWbprEQ9MoiuAdrhDwCLb/kSHRWBeUn8+s=;
        b=cbtFIhHSjUDxsboexk8s4sAddwJ0r140I230AdbL9Y6hINN75XkKMC56zMs4oGbuTs
         9h042rst3le5mlI1zNC7pF9fghqmH9qslBo6Z6c49oTU67bp3ZaCWqjd+52OPYPxEVYc
         BtoKdViFGAOKZc7wU7Xyqblv2psD3bSmoc18Ks0GQEzrwMZDtZAXNeBbCr5V/Cu5QRgC
         vMyaGecUfMeTUoPW4bFY558WFSHlHs0Ia5XQnznybbpNaZ5Dby83Gj01e7uWAPpP5CJF
         GnMFhkEzXmuvRgE78xGy+bLLqSRkJtAuBxg8dgKjQ6Rxj30h675ZsuCnla8BOK0/PQqG
         tuog==
X-Forwarded-Encrypted: i=1; AJvYcCX4VWnZaZ3Fh7AjVap/X/SGpJFq93d7GMItN2rrHErLtUesqf1WrlOnzEP+0jX24TM8OzdO+wQaZDsIPvxl@vger.kernel.org
X-Gm-Message-State: AOJu0YwxiEwphOVQ77ntPeaAc4KczvoEjJXnlfRXU9fMI2zZaYZ1TC2v
	2BnMgzb5gX4rXMmNgIixgyFLosDfpGydfxHz6OlfAacIrUKFApLPEPz+fcCiRTLN1D0cI0kzHU3
	GY3fRBKeWJcQXvyZCcEuH9x3xJGk+U53qYRniz5Ug5eMVTGXh3dSigtjgvQekY0HVUTTQ
X-Gm-Gg: ASbGncuIrARUjIFLOxgN3fCSbv5Dg/x/dn95suio6XM/OqLiPI34BiGEvxi0EdZMbhq
	GCMzrXcC13B7Iefytnd5sqwsoW1DYEiBhWNvbfBz3hwT9hRlki9k5IIwL19pcjehs/MXrTEcoRW
	j1ar3Qa0NTzZR9ic0A9rb0r8O2Rz/NqnUvCnlRTbJnE/pI+2sXlIJgdwiI9FUiCgvMb8FvOV8Af
	mZVbCn9rTZNgZ4jANwp7JUfs2bpNxWZc+Aa79zpi4fR3laY34N2VmMBy/uSqCI4sY14WsWVeaih
	4inmVPkwb7OaK+scPScfK5+y+4ySn6n0xDKC537OwUb09YCHrIr84Rq61mMctriaTOmPoe/vmN+
	uKw4=
X-Received: by 2002:a05:6a00:3d55:b0:772:260f:d7b1 with SMTP id d2e1a72fcca58-7723e3604bcmr25696927b3a.16.1757071732602;
        Fri, 05 Sep 2025 04:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmc040gyAr2RK4dN/YRekXNfa1QiCwtAj8aUqPxAsXMK2YDB2EQlpTKgbizPwP+r6FMgGAKQ==
X-Received: by 2002:a05:6a00:3d55:b0:772:260f:d7b1 with SMTP id d2e1a72fcca58-7723e3604bcmr25696900b3a.16.1757071732064;
        Fri, 05 Sep 2025 04:28:52 -0700 (PDT)
Received: from [10.219.49.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26abd1sm21340180b3a.8.2025.09.05.04.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:28:51 -0700 (PDT)
Message-ID: <0ecedbbf-4c08-416c-9ce4-64af42f3e215@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 16:58:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <b321019f-3ff6-4c6b-8285-77ca291492a2@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <b321019f-3ff6-4c6b-8285-77ca291492a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rK6ubMatV51wXSsQ1yiaiwI-3QV--ifU
X-Proofpoint-ORIG-GUID: rK6ubMatV51wXSsQ1yiaiwI-3QV--ifU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXyawzLKEr3hjq
 yljwz8UNYHUmGGEyExeX1X1S44fPU5H9UdUln+49P3ltr5sL6/Pa9nUhiGS9s7eLoRVGp13KnZo
 zOCm1a8KE+i05vY2D143k410FtLcI/7ZGbyjsLKbEy4zS+7KPChjPx/r9SWdhUTjNEambWsGAtk
 Ev2TZTxBiXuuhvsNHwDBGptJEEJ7w1XhzikMC69nJig/qS86/44FJ5W3sYbqJ08yIn7VpRLKQgR
 5SSGE/J7I4fvcBnLoHpP2A5O1z8jl5vteXi5HRbYP8DyU8862U6c6QRNwg/eRpKlx0I52pG84zo
 lLNg3WA+Fv3sBUFrvJdHJkel4/mrbYhwapbrMBlSAyorZZBZfUPGycDXUBZaQNrrQdt5gg+eOm4
 +DFdAPb5
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bac976 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=drAcfRgjDz_GiM-E-9oA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027



On 9/5/2025 4:16 PM, Konrad Dybcio wrote:
> On 9/5/25 12:40 PM, Mohammad Rafi Shaik wrote:
>> The current implementation does not configure the CPU DAI format for
>> MI2S interfaces, resulting in -EIO errors during audio playback and
>> capture. This prevents the correct clock from being enabled for the
>> MI2S interface. Configure the required DAI format to enable proper
>> clock settings. Tested on Lemans evk platform.
>>
>> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 73f9f82c4e25..2fd06354923a 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	int dp_pcm_id = 0;
>>   
>>   	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> 
> there's a discontiguous (i.e. asking for another 'case') QUINARY MI2S
> 

Ack,

it can be handled with another case because discontinuous id's.

> there's also a SENARY MI2S, but that we don't define upstream today
> 
yes.

As for SENARY_MI2S, since it's not defined upstream yet no need handle now.

Thanks & Regards,
Rafi.> Konrad


