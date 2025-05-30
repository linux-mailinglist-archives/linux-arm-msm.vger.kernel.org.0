Return-Path: <linux-arm-msm+bounces-59876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F5AC8C66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33C64E4C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CD8223324;
	Fri, 30 May 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hd6mzy//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABD22126C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602293; cv=none; b=YJdMv0LKuWkxY4TVjf3Lgi6tVSwVcECwmretrA5dG9bK9EQ3Xu4AXoY88K/RYaINDsxIml781Wh5b/9SvGtwKqbm+sDhGJviVbaoaeOT0jsMrkUAkB7YqDlTj6+jvYvFVKFz7yGmBy7nMtEiVTkFmpxm2p3hu18lQARNkAX3bQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602293; c=relaxed/simple;
	bh=UE1nkwZ0zcjYSP/AylrjxytDKypTft3B0EPtc4t1pwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddrcTfDbYKrkDMvwKDPepnjdFmJnYAP80lsFlzua/G40peT/ExpK+JXxo4L4PNMxrvk3DZWE9CEmzESMjc32cp0soDTl6x1ewbHuP+7IfqyyNQpNPXkAtIyZC8TDFYFftCBidv++qPdv0xFzszXEug1rgK9az7i00uy3/y6dv6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hd6mzy//; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1ZKvg032767
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ykz22sxUN2Hw1bYKpmMC5UWd4JotYn0mF64c25jalVk=; b=hd6mzy//zMrYdi3m
	2bJGbpXYxsa0Ab+btr+D3e0OwypGudXa8qVJLdhNU6NI5ypfWMRaRstAVuaPFel1
	Pwdetbzwieg17uDIh6Da1+/YMeiSUtWLopLYzsWqIZLXemeoiAq00AKIwMveO98Q
	VR3NUXec23B24SLjGEKo4y3d85RPhoYRGoAVFnkov05BRxzaO4LIOWIEgBjo2Aw7
	EUxuIY942YqFbDf32QMCyJnnZM5jHvt5zzJb7nKmQ0lB9JElbD9W1gFKbREVa+C4
	ZbY3CbByO3v+2rD1A5o+xhissJVFQ3twBCg5OTgx56CuXOqwBkOpNWRED4kUn0OD
	GeEd7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk0s3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:51:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so40414785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 03:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602289; x=1749207089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykz22sxUN2Hw1bYKpmMC5UWd4JotYn0mF64c25jalVk=;
        b=MSTF8QCeBPm3wZjXvZs39CErCj09gCeWy5fAlnyMrDZXyzBggQ84bmnpQD+ZJ+4zLF
         pEyru8MoluiAPALHqhZBiH4Qz7t1gz3NVgNwf4pkl5vpL8kjhngJshC5/uGkUz+9Ctqq
         IWO6zO6wdKYWye4Vn8JXWg5sQdto2zYcEZmZD7MGQntA54d5nssCjkgUcOg8KBRS1b/p
         3uZYZc7XG7Af5HVWuCaSpAeG4QM+KYfOSFiDDRRtCPsvkaqGL4bamtJtP3WXYsYb68EV
         yhGowZX/IrT5ab4h2GCaEKewUn1JYrsZGM6BKPHgeYbGl+K7mh3JwUWD4NVkGBxIaykl
         898Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhjN4ZoldMMW9D4X1Sh5ltK9kqEiHCxiqbO5Sqjlf1emfKSxjvFq4/ILV7B9rDA/qpU6EOmbUhp+XexIld@vger.kernel.org
X-Gm-Message-State: AOJu0YzSEYhgev0wxCGK7U50ZtTfjHxOBWpc5rpcPXbSulQgPADKqNJ+
	5iPGh5arZujDBX4QzN8jMPXuJTsgaSNuKevowk1xq7GYNNF6kAv8kwwUCBEi/5TjrimMSiMVHJE
	lFo/5CBNGZbfYY0dkB7ie5SvKknxyHk2pUQbO6Q/oRi0VFshnABoSBlUGJsyXXrAO3ga2
X-Gm-Gg: ASbGncu5Xv+snBkUl/MWi7plhZekg0DGL5BjHG62tBq3eCwBbJGXGOhhTzKvQmxLFC/
	pkkeOvsR2RQJBpxjsLZzcBEiXo3CDYAZI2LyROSu8I5j/4s92y9CPku4JQJZUUA3DiW2oojXh73
	C6G4a+1nEzoAq2W4UDcCZ8d0JNFKuh5NNoMXetirfcRocNIAyBO7z3eQSsE1KML3GuFzg68mbVy
	HTx8/rxsRo73TKee+s0Kt+zByakwGe0xB6A6XIQguSlLSz3YJ7BVYGnbzqW9mR4/S82bijY3ni5
	2YLruPbjmtS4sWz7U9lT/kOmm65EhRd4/hbinJP0caPWYifCUbDSjQk66ZF5Jv3mjNvn8MUa708
	O
X-Received: by 2002:a05:620a:19a9:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d0a3d97b79mr114733985a.8.1748602289503;
        Fri, 30 May 2025 03:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHziPYjNP2s6LLQZYshTIYmZqGevpTj1cIMCZjPhU6B9bmfaCGLTz4ZXmXiuXBtFAGhr5eO8g==
X-Received: by 2002:a05:620a:19a9:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d0a3d97b79mr114732885a.8.1748602289173;
        Fri, 30 May 2025 03:51:29 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c593f2sm1428259a12.17.2025.05.30.03.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:51:28 -0700 (PDT)
Message-ID: <0f855d7e-a85d-4fcb-aa6f-6254b509e259@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:51:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-2-c0092ac616d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-2-c0092ac616d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68398db2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Y0e4vqo_zEX2NYFcfF4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FYSoAHbuiVDlEIZfvhLX5cOxxH6zSvWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MyBTYWx0ZWRfX+BPNN2McJw3B
 79ZRkcAJWG9ctW3bLYgS0s5VTuIv+GLIga5cQYwteyowefagbcFYHedr92kw5wJOIEJfHrQ7cJT
 glTmABc7l66yTAiy2kSKTrTPIP8JtoHf0t6WLRMJcs5Y6sg531Z1nKF0wGYZ2l3eNHeZFfZ/Phe
 Kq1VkDpALME7QFqrnvvL3gq/a70THRONa7o3VjoOUB3MnjmCA74gLMjwjUF6mUsEEJRkPwY6sKl
 IYRGhNgleG5rrR7mP4CTjGJed8YXBcVg1ndb+Frbx7hly1GC2X0jOzKxIH66KGhpmozuFan3FJc
 aNBE24eXADlWzUoVV76xPoIbQ15cYQ2qblQFs2rN4KE2Bx8novOZQDtAcK8lHgd4MCg04aIhVeQ
 jZqLOucs7ewA+CFIfFZqM9K1nB8e5cHZWV7ZWSxCDwzLHfLuXLg0AE/JruvGpHVzxeGdPALZ
X-Proofpoint-GUID: FYSoAHbuiVDlEIZfvhLX5cOxxH6zSvWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=696 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300093

On 5/30/25 6:02 AM, Renjiang Han wrote:
> Add the venus node to the devicetree for the qcs615 platform to enable
> video functionality. The qcs615 platform currently lacks video
> functionality due to the absence of the venus node. Fallback to sc7180 due
> to the same video core.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

