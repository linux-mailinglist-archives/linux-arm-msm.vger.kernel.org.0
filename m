Return-Path: <linux-arm-msm+bounces-40852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320C9E7FDE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 13:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29E9018844E1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 12:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FCD146019;
	Sat,  7 Dec 2024 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekSiNk2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D4482C7E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Dec 2024 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574761; cv=none; b=iEqRc3VDHR1kY4DXWFw36zPTla51MqMCFaLByNtJvcwuwc3txSiBb14P8l/KLTnWUc7TOfJaDgCFtqX5gdmxu40szmlorZBnxYkoib0WdQ5Wx7kFAi8XnCX3wYvhRH+O68fOn58xrDkUqOQ/gQauEv5rKXqV2O6IM44BM4+Of00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574761; c=relaxed/simple;
	bh=azUX6QjhKkZXkY6xijKfOhHqxkK6wJmGsZLPCnqm44c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNOVoI0yMs0QhFi4Bjq6aHMyXdnVtxUjrocoVcnhyHqtEZ6Z8evkq5seKhXsZtngISwB/7JvossBz9cfwdgrQyF4mD+GuAXvyFP6CIk6RYkcYbZR8cV6rzQ2YZHcXTk/+SH1ZCZciWDpGj2tITuQCXHYmEWUy9HXWmm6Mf7xVO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekSiNk2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7ALe6n015459
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Dec 2024 12:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M92CAdkic6Iwv4reDSMoGjp/K6oYfQp/wrqMiHWSzvI=; b=ekSiNk2Ox6mo4Y81
	3mzkonUlxfEJAYcBwP0h9jYedTY0ks7CLKOEhnK97G6vEEFOS9kvnyc7NndAdwRN
	neTR34x8dM4CXeZpCkiM8YhgXDxUKGW2ZO+S+8i2oPJwZgXWSK8SL3qTR2JePIWC
	hiMRGZ9BlO8FSDc/UdivcLvaIxD0wqwkU059Yyb2OFALVJFZaIa+GiZ+DnGBq9nh
	kcvMQf6fQSZdl3+nEZxyGMPniKVhJkJVjlyXZv+yssKLaqcA+E6tP1R2LtyymY7m
	S0xNw6eI2QP/zWeE7RaP0t3bf/5j4vjDzoGJCETb6AyDibZokVPDLOzwFMTqIi+z
	YVglTw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpggp7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 12:32:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f77bf546so2510836d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 04:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574758; x=1734179558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M92CAdkic6Iwv4reDSMoGjp/K6oYfQp/wrqMiHWSzvI=;
        b=Whu/csmIC9c2hjznEsvpSUcoh5gcCVlEkR0A+XkYEFGMOA6Hf0AxfOqmGCnMW3zWPA
         DspLtajBWSoUul68Lnavy/oNym5YFg6BaPb28lWiVOdQ4qYnCcKViLZBDTW1MasqIGDp
         QMZruFiQsNsdfU9xA/oBIPrqcYoWoIF6jDDmba6Ob4pU6jHvt3IOOHfeQBd2wQKHyyhk
         6H4MCo/BGDlm2vNVZsynyc2d4mBFaRdvnM1uIXUQN3le2xgvy46/77ey2cNWvl2cN1OD
         qqEQjFPzx8CsD10eRe8wzD1pyjG7o55l5WOR9HfEfEirvKtSlAo0qisfQjo2uuDvc6Sa
         q0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXOGjp29bx+nFLLatNP+iRfraZmQ1oykvhmGExWZP/UqPJ16+Li7fvBbcHbxDv9fHTaFLs2kn+ynvSFjKx3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fFxPZdj5AokaCLArwQFWYEah6wz18cJoDu4fLwUf6N8rdqXz
	gy1kfMRCzBAdMPsNygbhr8zdPlAZ6t57McNj3snz4PyE0odM8K5uzTOjqLlczFaHxwgYi+3e0Dk
	kQ79h2tf79OB6mSMrRSXF/YwJxhzwdUVi2cYRXen6skmqXVXAmu1zss7Y0cLXaiCf
X-Gm-Gg: ASbGncsKbnJu5nLQeA3H+ixj4zZ5Pfqsg4wRtV7hPdSldosWKqHO+7BBn6iv4a5FS2s
	QmB3L4VqSFsTn0e7P9H0MNK4kMkohw+Tfd3wZP6ctjWF+vw444a57lbQs4sDPojKobsDxAZdE31
	BZAUQNyBJIjYt3BoiZYr4shP5JI3D5LzHbBd4UNYLtjLSe9GpKHq6lfYnQrM6UNDwiRD77HQgHR
	czHKm1meomuPwhtVk1i+sF+SfGW81dPGnhxQUVhbGo4B6rVe24/1j30fQqDXfUNUMkj7cHkcanc
	i6n/NeAi7b2FBM1n6WVGjdmmmMvLDJp7vnw=
X-Received: by 2002:a05:622a:1106:b0:458:21b2:4905 with SMTP id d75a77b69052e-46734e23e91mr47843311cf.15.1733574758461;
        Sat, 07 Dec 2024 04:32:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3wWXdprg/kZHC+CBFAeMYZnaaMhc8iBKhfLMgGFCoCHZ6CdKvwoIOqu1ehiQUHy2+VrE+Xg==
X-Received: by 2002:a05:622a:1106:b0:458:21b2:4905 with SMTP id d75a77b69052e-46734e23e91mr47843151cf.15.1733574758072;
        Sat, 07 Dec 2024 04:32:38 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62602cf52sm374919366b.115.2024.12.07.04.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 04:32:37 -0800 (PST)
Message-ID: <05e15b8e-d7b5-4af0-a811-4222bce0f99f@oss.qualcomm.com>
Date: Sat, 7 Dec 2024 13:32:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Add watchdog node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
 <20241120055248.657813-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241120055248.657813-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6T3AA-5i6TK46CFAfz-JKSVXvfmdlE8w
X-Proofpoint-ORIG-GUID: 6T3AA-5i6TK46CFAfz-JKSVXvfmdlE8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=854 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070105

On 20.11.2024 6:52 AM, Manikanta Mylavarapu wrote:
> Add the watchdog node for IPQ5424 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


