Return-Path: <linux-arm-msm+bounces-43672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F8E9FE919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C030A3A213F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3B81ACEC4;
	Mon, 30 Dec 2024 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk4h/zE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F761ACDE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735576975; cv=none; b=gbn7HErbVrYxNH6na/oiDJ/qLiQM8KaPAhp30H+6p/cNrZUIfkwKugA4Q8fe7Pp5CuDceboYqbEd71SOcjcAFP8lByI3NIl+YSlL54UDP4RRBuarAELdRIF0iCoEbOZ+TvrgfxWeddCeEKtozKnCZC9oOb0LHCN2tXFDTzqVi1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735576975; c=relaxed/simple;
	bh=R1I5Ze5YuP/XuejTOCio4xdAgI8ATebpkNoS4q1KCYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fo2cc1djRpFvfCMbxVHN6Zj9sUokvVED9azrP0PScv9k1t75GWwVZyf9JLUwLG3FWt/3n83XvkqbsuTJLgZcjUXlz9ndC11JWZwQHlLLKNqmFfyREchifd3RAytl8KsM5WSQi0vcKFUe3B3V3qgfGybZJy/hCC7BczseRVj/PN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk4h/zE3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUE5nfD025622
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsTYBLS26qzbs00MIBo1jXnvIoJrDZq05HZL196SJIQ=; b=Bk4h/zE3Ag9sUqFP
	IoxMXTtHThisI2yd5ylYSUrRnsMMTeQjNqDNW8DQ59qet1WCnWqQ8PiXiurXHcSM
	n68XKFgJGsE2heXvLDXlJsVdiBCzdxWYM7d/hTLSoU0Ge1nz7WCxJWvCb04ywhq4
	H7l1eIyD8XXP+7qgFmeOazHmINSXnauujFnmPkIM6AmgH/8750gvr7AAjQ+zECRR
	QmNABUy6/aNAM1s3p/w2xTDmSmuTZeAaHWckB3sqZCyp19y1AVsw/nPVKCeWA+FK
	64JYMJNozTe8fzpfVyxUPKboFYytPWL5cLJHBXhkOLzSyZArNl8Wdr1XuHnPJ/gQ
	Vq3cAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uvyt0bst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 16:42:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a97dec51so6563021cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 08:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735576972; x=1736181772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsTYBLS26qzbs00MIBo1jXnvIoJrDZq05HZL196SJIQ=;
        b=WU4hRLvocNDltcEcgIzHPpzo5/dP/DON2ByQRAZR6UXniorjPg0H7VDZcESA3FxIet
         bfvJDY7wccwur6rbuoWLcWqJVsC8TxeYomelwbwtW76RSjP6uEKiPxTnoypWFykxpepd
         bfosb3Ew9Qrs3IZzLta38GEqP2rYxu4ogtr3UOzzoX4sMPIQMc04yyd8oxIMUQYmXv2K
         /r3WMmvoE4ymDCrNN7sdo7HfG5qIA4KTX+M4SVK9atgFfjtFsGY5TwV68VE0o9POmo1V
         6QwnrSoJyODMWAJAP4JZRtNs/JDxEdQpqmM4CBBD5XfF1Rm7VlcI2pW+iR8adRIXST5L
         Bk4w==
X-Forwarded-Encrypted: i=1; AJvYcCXtFzfJcrJE5RusEgIK5kLjVFkJu3ghS+RGQz3sdJ7r8SqStcxol1Pyi6K7FlqORfLC0iFoaajbvFze2R8V@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnzhbrv44kkEZGqk/YtTr+ArqV1XVNSAYnlGrtI3ZeDLqS7cYZ
	DQwe0NMpF8DxdH3+FcQvfaGzdWVYzkeyTBciNl5FVCObzppV8YOZcAf3HwOvIIzIIM14rZfH1Lw
	B3EYpddQnGdOrBERh+IIY4mvxuyz9bhngUCVyg+I43/Z2VWrNRKtsDGxH3GLHv9zx
X-Gm-Gg: ASbGncufsNmbzmi8O5CpP1S79z8jHhZ343A2DRvZtDLLuEmZLmro9IIkpvEZ8i0sEdE
	04jQcRF9WpQNkZVwubrQ+rVH5cOhvvwuAAcNbJgYV98incl6OsqUzrPbETnDg+SB7Qpa4AprXeJ
	IyDN9wW9wzwDJl5MSzLGMR1Gs77jzwozIDNcNWauPm/FPDGQ1vvOPFqVezAz7zQh8tbfqfEEnnp
	6eHhTxhFKu8+YADuUMoP8nebUFC+hBoSeIiK27cZUvoXfvSKcuw+Y422OhLm2uebW7TY15sUqXh
	EOO9AtiJTwABq9t2Q4fLRgbXcF2SjXpipW8=
X-Received: by 2002:a05:622a:18a3:b0:467:69f8:7548 with SMTP id d75a77b69052e-46a4a8cdd86mr208421861cf.5.1735576972053;
        Mon, 30 Dec 2024 08:42:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIy7xGKGDPvgEzDqeM3nr3hMma0PCQ44hiJdF9vr2/Pxo+0LRbKgMmJ+4GTzIpVw2taOoIkA==
X-Received: by 2002:a05:622a:18a3:b0:467:69f8:7548 with SMTP id d75a77b69052e-46a4a8cdd86mr208421771cf.5.1735576971673;
        Mon, 30 Dec 2024 08:42:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c8c2sm14773658a12.84.2024.12.30.08.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 08:42:51 -0800 (PST)
Message-ID: <e3dfa3a7-feb1-45d1-8dc3-c403cb92c7c0@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 17:42:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0TvL1xanZSGzMLAXJaztwfmcwMHZPyT3
X-Proofpoint-GUID: 0TvL1xanZSGzMLAXJaztwfmcwMHZPyT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=914
 suspectscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300144

On 9.11.2024 1:00 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 08, 2024 at 11:54:05AM +0530, Taniya Das wrote:
>> Add cpufreq-hw node to support cpu frequency scaling.
> 
> CPU, not cpu.
> Also the prefix is incorrect for both patches.
> 
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---

[...]

> 
> This doesn't follow the bindings, does it?
> 
>> +		reg = <0 0x18323000 0 0x1400>,
>> +		      <0 0x18325800 0 0x1400>;
>> +		reg-names = "freq-domain0", "freq-domain1";
>> +
>> +		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>> +		clock-names = "xo", "alternate";
> 
> Are the DCVSH interrupts?

32/33 for silver/gold respectively

Konrad

