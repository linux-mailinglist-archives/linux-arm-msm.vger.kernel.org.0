Return-Path: <linux-arm-msm+bounces-89708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD6D3AF73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E52330010C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C66D3803C2;
	Mon, 19 Jan 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WK9LjOIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdX4Fmyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F531D367
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837591; cv=none; b=WzdtNA0XKHsJGuoJRO5CTpk8Zs5n6U9X3ZFoZTN4ELJS1oSzJ3k3uHzKXD4pcpUErCxPDVjj3usdlK79oy3NE9lOwnY8rcCNHhiqQWpwdopk8IorvjduYAlOj28Xp0YD4U7kEpM9kvkY5tfJDuOgibbcPZacwyAD9Q9dlYqDg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837591; c=relaxed/simple;
	bh=c3OkFEDhYwEGKJ+O2vYlOCrKcjrQs/Ezo6uhDNr8XkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpgVvrliZ0j0he4GZYfFO8pv8N6txCHVKO2hOzcFH7iSb98uKgseUpQKdUe9O+4vVpXz5FuLJnmjajsb1MEIpcWYfNwxV4wYHmsBg46o6TKZFiZ2CnwdP487P7NbpTuaXBrKqxEfV4pBEtVErbyuwjdRRrk0Jd5lQO0vPqhXqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WK9LjOIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdX4Fmyn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90xfC903051
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nc6Roa8HZO9BqKRVmPd2jMlSmAns4PxUyNcbgGlx+5k=; b=WK9LjOIX6T972Yht
	Mv+rsfk+JVkRSBfuFcMz3e1su1IxUKYWyuZ0cNkJA018RGtr30ono/n0bZOQNy39
	4t/PWv5SbQ4Hps//mgKvAfucD3pFLUl0nV6ypXStiSs5Nba795DuqZhhLSdsf2sj
	2HkfjxlxHwpG2n6yp/ooAt4HchpnNI1n++8HdyvlQeX5vHsC6FSoOy3Jdxc72FrI
	BhgawSNhz/N6agjX9M77rbV8wC2y5QYtoMq+2Lh7PxcwPZOWCcZ5n/i0TxUIrMAH
	S0wKQOjZKB6QEK2oKtlP4lJMnSKdXZnPXT9zkVpu2nY1KFFMEHjYpHstfi5xZtiT
	Ch/zUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ytc87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:46:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so120774485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768837588; x=1769442388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nc6Roa8HZO9BqKRVmPd2jMlSmAns4PxUyNcbgGlx+5k=;
        b=OdX4FmynBwg+tlKMYFAtMn82V5x0/A+ZqkMgLLoCA3W1F1XY9cuivHpwqurRxon0TX
         B41SR6qJ4M0mEs88KuhC2BeMq81Cpwlcqacf1pDQPIZmhGdwdQODIuPKVHGqkA8n3SGt
         Q7eseMC8scGafKsoewFQsBhP6J5lw3WtQdAnjBFeQdU+ruD4wBWtkB2OpqzzDBJmqejR
         XULRP8PaCUX3m7nGW2yu/RzWcnhDTbilviytoMDAgMuP10ByMmnWu5oKE+Q1NiLLQPZY
         T1+RpxH7z895GOSHEMb8r527w7Uem/kdxJiyC4YV6t8wF0cSd0YNbLY/F9+HAWqsDHAt
         9D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837588; x=1769442388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc6Roa8HZO9BqKRVmPd2jMlSmAns4PxUyNcbgGlx+5k=;
        b=YGjg/434cI8m6sojf0hhpk7nNA3Q9bvowkr3HYwnUkMGqkLu1iKfOsE8bteUovxyga
         4Bmpg57QMwtuDDyaStdfsrflA1SegLNPGg7y/yId5fVe0FTO+JGvogaAnXc3hGbAOVzh
         PHlCH+z9Xb/80alfR/a75J598+x82r2MSlyEA/9/D3yPpH8FI0xYeRXCmJUdS+xR3R4N
         qFpyH71Lavtw7WljJrfOX170bHjAcEPB4eukiSIjP127oZVQDj/Mpg50xHf5GXaAE0ba
         iH3ZJelx8TlHSOBk5YOWJlALXs0xT3Lu9THMcvaxnsizYd6sOLWM43NyDdcz4ZcryUku
         1AVw==
X-Gm-Message-State: AOJu0Ywp3hesAZ9OQoqoVPx0DSJkmj8ZqA7UWboyV8zeJ3Mj2VlpHe7v
	cNS9vcZzUgk2cYInnFcLaMh9Pevqq0zRB/1kmmlXt0vzkrE+pO4NIDwKQdZEJIgYOuZVSAFXCUi
	IOba6ouIrNhpwnooSVaAEQphbHBYgeofrIzI7rmLZ1F2+tcOU2W7y6jbibvZFIkh1TM6A
X-Gm-Gg: AY/fxX7cwFvUOlCH5OIgTS8Bk6OuZmNodE+F+JzSd/v+oI/LhJMCeLbgBKb2xNvFvLW
	5K//AD4kpKeekOwSlDIav69E16KFl3ML957tSqag01EJm6XJlhqp7wpTdTJBjdn6fok2VNI0ZMZ
	doiCbYyK9hkANMmgFfr+aw4zlWDHiAH+4kJ0qYj0E7bYcyKS/+i+2gKcV650EXy7FbsiM2wkkJt
	oNLEcnwtJcregDHMv2slem9QkzTyu/fZcMbV0wsuDdny1bDfMes6FEJMtLOaSX6cB8Jo9y3OXZ6
	B4xCEooibNt4Kbid/+vRKmaDIrGCDsQAdmoepLPng4Nwh7v7zzjwBoYI5L5MYGM25H0G4tKDLwE
	5cYxp+yiNyr+EPAxPuOa6Q5MiPOwCzgLOa+WuVXKocgMWr1pIXU4Gb4yEt6D7vVRDgxI=
X-Received: by 2002:a05:620a:690e:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6ca431652mr6136885a.6.1768837587827;
        Mon, 19 Jan 2026 07:46:27 -0800 (PST)
X-Received: by 2002:a05:620a:690e:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6ca431652mr6134385a.6.1768837587351;
        Mon, 19 Jan 2026 07:46:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbd23sm1131712566b.51.2026.01.19.07.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:46:26 -0800 (PST)
Message-ID: <fa77a048-d553-4345-b61d-0ad488574443@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 16:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6125: Add debug UART node
To: nathbappai@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
 <20260119-xiaomi-ginkgo-features-v1-4-3c8fae984bda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-4-3c8fae984bda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e51d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=PxOV3p0B5uiKmcZMyNsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEzMSBTYWx0ZWRfX9l/rkRgkZGVV
 nLGZvrV5ufkBSZsgNRbx6XZkOhH9peZiK9voSOzXsuUXvHtUkSfyuS2eUp0QLKLhKid1XKxvQ1q
 rJT7QVAn2CQXZD1Nyqdjubj5UrmlpJGDkFbe6Z9iYvSNrIW3rP1wI799zLNZSUrmtHNU6lnMTAW
 jxxqc+KWXfej7kdP3GxVTbBsJeLCpywXI0sn7RkQJjm1T/ePvV+aPAluNRe5A4CaX9AWDAcV3Ln
 TIqOvwhow80q55ZPi6KSlmrDTb7YUTiPCUfakpJdvJWpIYGbbQ8d8V2c67BAh3djX2pFW76Qo4O
 NyOHF0CR05WvEp/pVugwd/EdtU5c3+TIhbbyvlmqukGNKpA8ujuY8IQ0CkEdi4n2i8rCRCO8GQH
 Tl9jyLGD+rOnixnJ9miiP6i3reAbF7ksGbo8vp13rozXv582gT2PHf18/xK/ls3JQH/LY8fqhwc
 ykfALqJ8L1DexBDeTxg==
X-Proofpoint-ORIG-GUID: 2ih0hDPrhJomU7N8EQ8BEty5BOwfQJoK
X-Proofpoint-GUID: 2ih0hDPrhJomU7N8EQ8BEty5BOwfQJoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190131

On 1/19/26 4:13 PM, Biswapriyo Nath via B4 Relay wrote:
> From: Biswapriyo Nath <nathbappai@gmail.com>
> 
> qup0 on sm6125 has 6 SEs and SE4 is used as debug uart. The uart node
> and the associated pinctrl are added here.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


