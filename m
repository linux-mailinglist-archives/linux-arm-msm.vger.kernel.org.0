Return-Path: <linux-arm-msm+bounces-50695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC46A57B01
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2C83B1F4D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 14:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18741DD539;
	Sat,  8 Mar 2025 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRaYzBAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49080143888
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741444212; cv=none; b=S6cxyLaEq+opYVnCs8e4wijJEQF26nuLApS9PyEqNLotJnUR2E7rOrO5f9CEnlhJ6xu/HfNreo2Q0EZ6ZH4sJ9sHINpfcgAe+1iwTcs+EuKnhgrBcZRa7oDS+iFaAbsnJNsngaDotHV9MzaMs2oR5O8f8BfaZeTJ+rJ10Ewpi8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741444212; c=relaxed/simple;
	bh=F5qBzGxYOLt9eCgdLnykjzrwTu/UH8kucdR9MrrYK1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNHYKL35GER3Gj7xfPkO0Tk7KQrVPs6PSsNI19bA+77cEkGEGcGcCrDIjB/J0Gd6l0a3r7HqmqxaPa25/9Y5DH9SquqjNSjoqAg/eTg7+ZWNQfJQx7C5UxjTWegj2iap6uMlxrIgekd9mPaQKTWL7jEEhF37dcq6ysHE5NePE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRaYzBAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528ERAZf005962
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 14:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hiRrV2lDctabAYQ6GC4gGrhzwcW37m/6E8TpuE76Wg4=; b=lRaYzBAFRcrmmDJ1
	n2vJHuxWkLU2j2SFdypC+JDu0hAM6tbi6AqKAoQ9nclAaHjVBdWkTzzefGYhwUYD
	IpUdedjqFuJEKQRCnqSDsbJzpJlMLlHo5mA6FQXNRiqG7KMM4vVBm1H3CapLHiu4
	EPHUvqHgNVTzeU01XZDkSyLdovCAmNhl6LnC1CnHZM6QucABksnJWAHcT4qjbQv4
	SlCzx6YwcPwK7Ehnsq/6At8PMV7Xb0tL1/GsAoZLFXoz9MOtFGHNBSaLTUgGg3HG
	UwR2rOJ/Y3UzyMLZbSm7iC1lVjorzShmUyJ1NiNax2jkSfUoOvnbOw5hGs0km9Ry
	EHaR3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rpew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 14:30:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c638248bso55189885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 06:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741444208; x=1742049008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiRrV2lDctabAYQ6GC4gGrhzwcW37m/6E8TpuE76Wg4=;
        b=sxq8kXPn89Lnhu3f5XBRqngy7vwWafaMI3HmbQCC7Dl4TE0qLp1VoN5OFqPWVlq5hs
         kdM/8uTAbCKd5xaPmpcsskyHDzkSfMIZTPswod+vZwQTyZxKRwYRXys0mVzcP/WCtUu4
         kjTeUL85mHKx+uoSBmHmjcwSSJpqMz5qFinKGv9/P6Rtm0Q+Ze//W13GiETpHfYi/ZLa
         gWczrRPsMir+xG1qbqVwSIOq7yFbL2ap4BG1u7/Y0cQTKWbIrZOQtSfzDyABkPLvtFrL
         54qE5fePoJGEdHOWkzZSFllZR3g3DUrQe9rZbx/jlxOJtQ01E4ZRrpGfPBndaaw1/gIt
         1Cjg==
X-Forwarded-Encrypted: i=1; AJvYcCWCB3o/OdTTSoxN25o4i1OmnocT2jqmeEIlg7d/Qrklh5a3mEa1MRATbR/NDq7By6PJGAQ0AKxwZWDnz8Hz@vger.kernel.org
X-Gm-Message-State: AOJu0YzUighkRV1nHpNfg/k8+ktxEMuG6UVhHXa7rxhP7w8LtQt8wQTv
	s2xp/tlgurD0XyzIKIHsmL28+g9a4mwf/FV1ONCmOy7O1j5h75+n7nWqsvEnag3e480vXLB8Vnh
	BaY1QUqtOOHPoH9P1adeOwmNh8uIVypIdvnPYRvCCpO5UjjeyTrtzJj1kRu+T5piY
X-Gm-Gg: ASbGncuIWRO8GHzNvnqFld9ZkVfIG0vkn70wDdxEmjGr2VpKwWM/cRNI9cahZlwZjuv
	H4Qh2jYVadsO+lQVfez8UHg/miMq5mS5uYrsOW9TI7T/9ZcT8Dj8Gw2AZ9SfgrYnZ5fUoFgIhnF
	475bfqDGeJHtD4gzkAh1WLZ5BALyRS0nhpLByjrWOlO5yt1qzWY9b53vFlSQWk1N13sLgg+8Lnp
	qDOx+IwBpVarb1DcIFdzt9jb/Okl/jZuB1u4wlLoXodwsOaAUmzhWQmzX07d4v4e+S2TAz88UFn
	6w2IyeQnRw02kgUu9jyEEiBRjYT2fPTC0AmuF9p69z06G6PgNz3UoJiDZhup68Grtrc6MQ==
X-Received: by 2002:ad4:4eed:0:b0:6e8:af1b:e70e with SMTP id 6a1803df08f44-6e908dab8d2mr14444936d6.8.1741444208067;
        Sat, 08 Mar 2025 06:30:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYzTmfYwrmQbqXEPPoiUQdcPwYzdBk1aldTn4ZYyfsbMEMVk0wKBrs3w6LhpEi2xGwz/bX3A==
X-Received: by 2002:ad4:4eed:0:b0:6e8:af1b:e70e with SMTP id 6a1803df08f44-6e908dab8d2mr14444706d6.8.1741444207650;
        Sat, 08 Mar 2025 06:30:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac284f76a22sm20376166b.149.2025.03.08.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:30:07 -0800 (PST)
Message-ID: <e7347992-acc6-4c0f-a26b-c646668917ed@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:30:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
To: Kaustubh Pandey <quic_kapandey@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_rpavan@quicinc.com, quic_sharathv@quicinc.com,
        quic_sarata@quicinc.com
References: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc5471 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=oJ5fhsqBAEL7t78JBU0A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MYlQWVUmj8ooSQ1fZkTnLiFH_zUtxTDc
X-Proofpoint-ORIG-GUID: MYlQWVUmj8ooSQ1fZkTnLiFH_zUtxTDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080108

On 4.03.2025 4:21 PM, Kaustubh Pandey wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Kaustubh Pandey <quic_kapandey@quicinc.com>
> ---

This is a patch to a devicetree of a board that is known not to boot [1].

Were you able to confirm this change works with a relatively unchanged
mainline kernel?

Moreover, is the IDP still used, with a final SoC revision as well?

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com/


