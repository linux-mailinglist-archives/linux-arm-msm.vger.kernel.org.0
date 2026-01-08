Return-Path: <linux-arm-msm+bounces-88050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B8AD02B46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 13:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 555DC30B8F52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 12:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8372543F4B4;
	Thu,  8 Jan 2026 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0x1Vk5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4akn6RH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3497441027
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864609; cv=none; b=nqmPz4w2hYj7tzMQOwlYJHtM4anWkO8zsM1a3aIuESd6kW2AjVrB5ZKscsljcroN6Oguvv7H15iaSP7JZEJ1Yz8JoCBlPk3Dm+kzIafT4nkhZtgov8BRVe/7/q5OsjU1GYIvE9MK3E7N+4EJVVj7dSlQg/GyrzYkEIQiFpEMtBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864609; c=relaxed/simple;
	bh=Q3UjGBJ+gd1W+HYENu/Pc2Sn5F+OBztRRngBuogIDhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4rBurnKqBbJwZsZq5FHZHcsaE6sQr22oodBxtbLxfgeHN0MLMaHqWDEab6+zEPcT/woHbLemEO28/MprX5LVig6Gv8TP7N0ZrAsSYu5L6QG47jWGzj2034iUPQ0FrJlCjxXtET8R65s+W79bJ18hMFwqc/v2wEvksjnuEHythE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0x1Vk5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4akn6RH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608469Eq2779084
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBX2Rlp0vP8KamvbjCr9HnnvFpdO76mb8cSGwyGZKNA=; b=X0x1Vk5IQqaaeDc+
	jIl2KMfUtGNadKfoBTyW9LocfiJMIc0axq3GebkB6Rt0c80ugoKF7shywl48/3kM
	iKjJMzNNq86brLcak0QwGW5TyjgRsRUQQRljkb2dhFtu1uwgY6/8mn8jRPYkZ1g5
	FtZfvEIdOPT1cOC3fj61XEU9d5m2XacXBamyxsAFDHxP7kWD55ht7FQTw1bCwZ1M
	1CYHkl0MY8qq2vYS63RN9Ykg0L1lrxhQJG9QrB5Sv9RpzWKcPVQSHpUvX8TZhGZ8
	54bKwHcMdOJlJJLIvInzlXBZJ4zxu6z0soxgDfFaqRZBQtgvHTbY5sxus4sEGeXM
	JmHrJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugx16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:29:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso8659461cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864596; x=1768469396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBX2Rlp0vP8KamvbjCr9HnnvFpdO76mb8cSGwyGZKNA=;
        b=b4akn6RHh4w4v+TIG0pdkfT3mMmG4gM5ApxfWEUKoUsvETLr9Ca7yZlxrv6rWOVUr3
         aV3VYjBFoUaKlQFn+lp6rHGeXKZF9fH4qfqc4hPUVfh126ma/wycI7Iyn++WNCl7g6MP
         avSHuxT3HUwQdwJcBBEg0ZuNOGEJjuTzbwaS11Geah1q3+8bSCOz65M33CPCT6QAUD4c
         +8q9ojbjJDg4+p3g9aWwK2tnTq7MO+Qz1+rDbmaCVVeEGKzMC7GcmbxGhzYYhmlAZ1Yo
         ozSgWAQHE+O1GiEGvqJ8uIFzAndcOfytCNapn0ec0UC6r/83AjeByruN8GV8ExYcc8D2
         9jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864596; x=1768469396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBX2Rlp0vP8KamvbjCr9HnnvFpdO76mb8cSGwyGZKNA=;
        b=s/f9lWQY9giOOSslZYFMTTUFm2/JTWXJLXvaRn5rTy1dB4FjmCl68zBueOXYpy/4Z8
         00plrjCdZYjD4SjTN7xEYDhDxO7YyDk2CBMEDeLsz7zlREj74Uc7jOUHJuIKn97xxetS
         S40qEF+0OIfd2tDFsnFnt7exMWLQwCsCHsOr7dP7lMZVPrLYVYY+HaOpADv5kKHJmicm
         7chzb5Vwg0SOhXGYDyVn0BppyPC0GQ1voTSDxWOrSYkEX/81iQOGI7CqhnlOXPBfz8KD
         tz7Iav1bz1c0Bxx7p9wqaFV7pf5TwDKLzfVPh9uqfy4JQ8vmNZFAGHFxl00hHi/L3XD0
         S8EA==
X-Gm-Message-State: AOJu0Yz1BPokQKOrPY9lU76Z4GpgUCKyyqhqqMZ9uMD0HmoxD2QixYZi
	ZgWQcrqEKIptM2zkyWJNncQGTrhTxTJR7YKP44CW0wwcfsjo8JmcnGa5w6eIwn/LqGbaC9cnzgd
	8utoD9EnQRdco3xHpxhK/geazcEY/Z8yr/TSoxI0qwes2dahGrwKb4oDVTuP1cN76YK8b
X-Gm-Gg: AY/fxX7jav9RsZ/1ow/h5Nv7pLqkriMdSp1reLxlzc9ODgdl0LSfuV9hlLRg8iewyJB
	qBQ/tDc2LT8YDMec1spks9VfOoAWFmVUcjTxx8y+1BBgMjMbXKrjdK+/Nh/U2By5Kalper1gcv+
	QYJqW66Su/F4tyFAo08YRkKbBs/WrHTNs752KVmL+8igLZe3l9u3MuekGSE5dDqYbw1xDt0c0fM
	jh3ZBIURfFxMnO+6mD89fsVV6rCcPg841Yplwc+Q4nTaRxEXVzyKSkrrZZJkOrQk6ZsjjaokqYR
	m1y62OVEeaTH5BHg5Hp1VY1sh9MF30bi8m07da89uQ0IKykz4AwtCqokUFmxYv3Gl6N4LxXQaLT
	P61UALpmt0TJJ6K05E79bOZyPVRIma59wt1e0t4ZHrlV2yhiCqqNsaefIAu3uhDFXaTc=
X-Received: by 2002:a05:622a:143:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4ffb4a9a78bmr55886461cf.10.1767864596121;
        Thu, 08 Jan 2026 01:29:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCxFAviDmUzwHekCFADRtQYZCQJZlxVO/OkZM//n7Kd1TZaAtX2ZL+zp1lC9CgvTfiUiqZIA==
X-Received: by 2002:a05:622a:143:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4ffb4a9a78bmr55886371cf.10.1767864595668;
        Thu, 08 Jan 2026 01:29:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4484sm7141571a12.7.2026.01.08.01.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:29:54 -0800 (PST)
Message-ID: <a1905df6-5054-4ee2-a8fb-d130f42faa4a@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:29:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX41R8Re4/5KYQ
 D8RQ/t90IOR15y3ja3ylLbu6UA0Cvfgi0U7/a30mMyf6AsrpMe8B7sbbVxUMkyoBCZoxEC5zzFU
 63aYyz3m++vOSbWrJ4C4GmaZN/o1M7ifKI4JkRoEQjuXUZci+JZMwk0/zPsZXp0kKd5mmDNRq88
 lSI4qYz3CJUuISb200ZL9bYSj1v3Ija5JvqiRNHbCTXuMzO17u+dWYklZAPK1UW1YIpbv8gUQZz
 ZKCU80M2GUSZfLgRMpTGpKtaSGqLiyAFRVeCEstohp4xWYuBdiFkBXe1tJQXGGRU6ZVlVRfDjfO
 SHJX0hM2x6dgD3R3F0UdlLzHbqTDuS0NlMC3NmRiIMr/IOcuevlxjtXOFzmpVXNyB//5uVAkpm+
 VnpsCplukRZFEuH5cvvl3lU+FhbfllXpeOAruQrloPT5IYjjYgnZ4KgLCas2tWHbzazA3HZdYx2
 uChIb7/U4eLT+jEzJ6g==
X-Proofpoint-GUID: 1yzbbtHtyZ2Dp7SJ_H-auAJkfeJfIHcQ
X-Proofpoint-ORIG-GUID: 1yzbbtHtyZ2Dp7SJ_H-auAJkfeJfIHcQ
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f7915 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h_bAiBQL0yDKBMXIJFEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/7/26 8:20 PM, Mohammad Rafi Shaik wrote:
> Add pin control support for Low Power Audio SubSystem (LPASS)
> of Qualcomm SA8775P SoC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


