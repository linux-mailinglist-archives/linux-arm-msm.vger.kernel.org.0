Return-Path: <linux-arm-msm+bounces-65810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85798B0B642
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 15:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91C62165896
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 13:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF1A21420F;
	Sun, 20 Jul 2025 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3daBPK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2C19644B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753018470; cv=none; b=u9ayd5H004A8GTpAS5xB1TaQ1jJS5NwXPkQgBzH+/7ubb3TkUg5EcqizMuZUXocgWvf2ZDGRHWdrwbD7JnLgZy5saUPIq3D8AlMYWRWS4m7QHYJI5cI5NVSaA6+77H0W8HmPj/73ESP3ICXDm80yGOPFmoO+8azovEkwhTwB2Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753018470; c=relaxed/simple;
	bh=VuY0DHHFaW7kyXOA5c0q4PBG2btCCQS33OOoPi2jztQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSSVHkuy6GFV43Aypj/1TS19MW+KIwQNZSHy3Nk/4LyWcqxceXoISjBpXq10LwHa7DF+pm2k4DfXFurFldClgtvuUGNlOgpswI+cFgqCkaJf4DR86ZjmKKnbnpmw3P+WW6uYDKtIiLjJfdlgGPfSjK8oSua7KYst+OeLt9LaPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3daBPK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAunog013853
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 13:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9aDr5oRJHrA7ID3S3AHv5io5gP+ebOQU/9zSgcDQr7A=; b=D3daBPK2WaSqDkWf
	R7U7oKm+JnN1qJL3yztiiVTrCIC+5wi7pfUCWU+yc0IzfPHXJ+G+uu8PtRyRtN4d
	TQ3FZXGujxIrDGdz+RHA9gUJAZoTd2Kc86ORcL4s/CbtgOF9kHVSyG48/H0DTePT
	eV+p0OYx8exMhrWV9794p4lc041iWeiRzcI0qIuRz0obcpzRjElHuIWXzO+ul4LW
	c40MG9XkFNqVlWwjmhio+0UV4ecdVP+qff6zGqQa3nXSx570ZTtM5vZ3/Q6ztm4B
	05qyWQVZ4MbGkkaBCVx6Y/3wVP4VwfB9QrwWItC6JxorEkVR045y/NYgz6D/scRq
	0MYkyg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj6ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 13:34:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso6158559a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753018467; x=1753623267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aDr5oRJHrA7ID3S3AHv5io5gP+ebOQU/9zSgcDQr7A=;
        b=Z2VC28A2Xxt6qdrdrFhcGfcrEgGsDUyLxVC9UVyP35ZRqI5JlMfJAidQUYtVPMfUbW
         fpNFl5nXBOPAeXrdW//LtDNMBGHkfo0caq6P1EEIVbfXyGtdKMNgLyOoO7/843CLpOHJ
         c7bl8vkItbHe6C3RLc3S8PlrTYvuCsgTR1FP6l7hzRlEW4nHY+bqPHvtfu8ZcSMK0/UW
         gJP+hG+2EsztKkFLiMU/Co2KQFmqXFei7InBVrrVGlXSTh6Uc7gXwdaIjzDgC0JBlbex
         D0bF1EmFtEkyie4r4xDRb4sd2XlyFpY7DNKUVwdYBK7kjIsBy8eMI2TtQZ38M4cWZiKv
         h0kg==
X-Gm-Message-State: AOJu0Yz7oPNcdwP4wTNUPf4zGqqGW9NU1APGQckS5YAOTDVmADFMigJ4
	eL9D+K4D4m+XXBjGfUcjno96S52WlobQAMbdi3Nwh/B1jIAgeyaUEv0aZEgmjS+VUxdNj3K3z42
	MDtVPdgGsiqWdAPtcTJWCtF1ujZoG7OldD967P0xowSFjrkVdtX9QiX2oK0bPocQ5yvJx
X-Gm-Gg: ASbGnctu2rkKEdwHiv1gA4z1INusJWtwP4L/AJLCsqI3Dj9CXLbLYBptFkSaMJ8PN4F
	H7jJo4jiq0pHe9+hB07kzQYUcIhJvidxUG8C6R62ev4e6kl8YVWncaXwunTI1JVdygEWE0w7rx/
	4/tBBmKD/sJhKCY3IGWIYmmewkgBIez0YDjSI2WmQqT2eFxsOoPsegPo2XsC13aD0L53treQQv9
	lEOw7a6XkFT6kipilSxI6izxCngqctHjCu2hwMn82JMlPIgFam0OgJAkC2ILvg9jgfNHdAipA7l
	t2Ng+EVnDzTE7T2aV21sFfhtHkLTcBDJzCip1Uzovrc7qOPHt65HoY+kEvvJ7FKZNuqvPm/DHoc
	W3g1OAw==
X-Received: by 2002:a17:90b:5385:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-31c9f3ef43cmr21544684a91.1.1753018467340;
        Sun, 20 Jul 2025 06:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP33IoISya8Q5bWiUZ17jVGNmc0QJE6AZXbO2//c50jlsBWR9t1ni8wZiqCl3Fzwxo7OxIuQ==
X-Received: by 2002:a17:90b:5385:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-31c9f3ef43cmr21544666a91.1.1753018466935;
        Sun, 20 Jul 2025 06:34:26 -0700 (PDT)
Received: from [192.168.0.168] ([49.43.231.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e5bec9sm4357251a91.15.2025.07.20.06.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 06:34:26 -0700 (PDT)
Message-ID: <0c17d5f2-acbd-49e9-a1ff-ffac70a8c921@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 19:04:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: add glymur interconnect provider
 driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, djakov@kernel.org,
        lumag@kernel.org, a39.skl@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716151535.4054172-1-pankaj.patil@oss.qualcomm.com>
 <20250716151535.4054172-3-pankaj.patil@oss.qualcomm.com>
 <37932b96-fc4d-4321-8986-8f975b0c1350@oss.qualcomm.com>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <37932b96-fc4d-4321-8986-8f975b0c1350@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qFOg8m3dTKAxibrjNqu9vh7M-Psgl76k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEzMSBTYWx0ZWRfXziyiH0BlDmgo
 VngkvV2KnMqjktNlO10We3pWts0U90Eiue0IOjReClPjzwJRC3OAefpNzFEX44rrX/EMxBLWT6e
 Y/bCMzbjwNHvqp5z2Sq46Rqo16IPvpJ7tAyHdSBksy7kHnVQvkj19vk3J2fvoQIJNQAlfgYeHA9
 scGS8Ry8cNcG6vmgGK+SI7CAG7jdRXoeuo4r66xnkDnA51YJbIUMEJdf8JZnz667wxk/axEwwDm
 U1wHXLqK0Y6fC/LqI8owS66y4roeSPlBPPMK0YHmYvB8DKUf023glWgV8wBq0n6hJDWk81d35qb
 ZbvShnCUgbQWY8N5lVJeRqj6BhF3TdlT3ItLewbFIdI8LfqCCWgJZnor2pAIZxaW1m4N6tBi+KZ
 YL1TpijM0LMNb73L8beypx3Zq+mcvM/S50AQD2Al296c75FI/5+D+ZIxgvmbLfKvmBgJ+lRs
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cf064 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=zhpjAwSWsGC/MCksz6s7dw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=b4-VgOCz04Za3pMyX7UA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: qFOg8m3dTKAxibrjNqu9vh7M-Psgl76k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200131



On 7/18/2025 2:03 AM, Konrad Dybcio wrote:
> On 7/16/25 5:15 PM, Pankaj Patil wrote:
>> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>
>> Add driver for the Qualcomm interconnect buses found in glymur
>> based platforms. The topology consists of several NoCs that are
>> controlled by a remote processor that collects the aggregated
>> bandwidth for each master-slave pairs.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct of_device_id qnoc_of_match[] = {
>> +	{ .compatible = "qcom,glymur-aggre1-noc",
>> +	  .data = &glymur_aggre1_noc},
>> +	{ .compatible = "qcom,glymur-aggre2-noc",
> 
> Please unwrap these lines, i.e.:
> 
> { .compatible = "qcom,glymur-aggre2-noc", .data = &glymur_aggre2_noc },
> 
> I'd also request you work with the author to provide the ICC QoS settings
> for this platform (which would be good to see as part of the introductory
> commit).
> 
> Konrad

Sure, will post next revision by implementing the suggestion and QoS support.

Thanks,
Raviteja

