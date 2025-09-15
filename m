Return-Path: <linux-arm-msm+bounces-73485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B616B570FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C14A189D065
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4433FBB3;
	Mon, 15 Sep 2025 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlWe1GND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA02D3207
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920441; cv=none; b=NSUGxLD+OsVl731qbFHxttOYHVqcF+mADNhtAE0Dm9Eg8s8ZOlxDGRX3o+qPLHwnzu9nLsENpSA6LsyCyrz+YfJ3zZrSbvEKrgg0FsAj3PkaJZPV+HmzNXob2elAcgvcX1HzJehSsTsYaZG30h4UBc6IA0h0a6fCVClCNz72lYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920441; c=relaxed/simple;
	bh=+qi+uECUZ98pigQwnsb5bPSO1UgdPNw9iBM2lA3ss8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0zWL0IVrvj0bYrSPaI8+RDKRIWpuEClk1xrw/2UTyPd5VZU6OK1TQmyEKU9W7k7hDKxFWpvqYQ8H9nVgaiouldE9efHaDMJ6AIJghuLhT16WM8SAc9DvWcM05b59t2BmY3gZ3i8v6TJ7LrPixW3R6q7aCGMkWH19Z9/6hQ0ms0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlWe1GND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMkUMl018191
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emyETxTvEXx2mZ3XPuIpV3lp2jjKDrPuyDEjXKQ/XZc=; b=IlWe1GNDLj9PHlzX
	0NoO/JtNnK4kMpIJb0b53/nibupAAFIrAKaTWRY0L+GuJ1J8oTAlCl5WHG8o8gbJ
	VoDc+jueQd2m542UD5v30+1lPd6oYEncJHffItnpxKxMdZaOwjHhWDPjWT0rBD5F
	7GImqbvQ/Er/cH5rK8cpcFG8vQ9oDW4NwHm+rr7y6biXLFCPT1CRzTRoOJY6/zgR
	5ll/hBZnFfAWaSVYWVQpU1S9YkVULmVbd9pe7BUqK4AnVnOu+mX+bJCRBpD8jws+
	ejotWcadj837X2Y1PiE3DggxSKkChPO2CxYd/LhRE58FIKv9blnz5OZGIKThnbTM
	SzTkBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072ktsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:13:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b77da4b375so9448151cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757920438; x=1758525238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emyETxTvEXx2mZ3XPuIpV3lp2jjKDrPuyDEjXKQ/XZc=;
        b=sO8HhvE9ojoQp1Lx+miupIsI1OLlOtEx5gLWDqJ0774ZOqaJRT2L/7RNq746gs+dja
         29DniBWi1cKBBGMF5JssABhJnYt8cBv+OncsMsA1JPF8WinttNNE2MJbmp0qT/0vyCRe
         c0/B2Sr6CFN3JwZF/WCOCB6ejjqCph1sVlxWM+YmA2cp9MMZX5ac/yo02OuyGukdJ5FA
         Cpyo+utgsMQ0lyM0RjRItq+z+p6Yz3q+yA0PxHle2aJ9+2uKxtLzogQuyaxV3H92C0BL
         nkeP34dQ4qu1pW8MuIm5PSJwr/JWEhM12BaeK53NRwL2ypwP+3e+OgwnexZUtGSTjrhs
         oIJA==
X-Gm-Message-State: AOJu0Ywcj+Tyiu9anAZRfPF2RkkZM40bhzB3+s2iRDqN4izc/3NQfDEJ
	DEpHpjygQz+PUEhR7aoxj62TQfonla+EDZjPaJ8qPs5yWfqXyKjcr80G/sUEomf6JOBl2vz3qPB
	sw5yBYG3P+hxzv8X/vsDQpJ0jcxgWykxoWn64D59bKkaH9u4gBSEvM9gKu4vq6bLiDlOe
X-Gm-Gg: ASbGncuw7eOerfXnFIamuyobY/Fv/yNlVxO77zwJseqgrdUhp7zLdoJYFbnJ96YRyWE
	Tlm5tl40v4wRV53MTUUHM9SoB8SpwmOMtNAZBfC5S85pPfVtfKc9YxyQ9P9PqojmZCXcM2BaoMp
	nKH9qzboYze/y286iujfSqgwhY9B57zN6q4YfeZIAXc2FtUND9aA0QmjSnXxmahOlYiuMUoe97E
	5JN3HGIhnhDurg6X250O9ZxAcp3p9eQXmyXJlTX/pj9JFJhqv8Lukc2sXLZ/yATx21UllBH3yF/
	S379zqsDPmwCntqpwsmKq65vvyelpqjFvlp9bUHXWPPe7IGC2jUesmVbnwQtt4O8nHGF62SSRwY
	nrsW+8jXn42dhNMkVFjt9RQ==
X-Received: by 2002:a05:622a:1649:b0:4b7:a71f:582e with SMTP id d75a77b69052e-4b7a71f5c59mr16755171cf.9.1757920437783;
        Mon, 15 Sep 2025 00:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXY+2EbGQYmMpg3d61biZVOZwP82Fg9wIo5OW+2n2MKk9HCpqgiBtHZ7vUG59dorC3yHP2LA==
X-Received: by 2002:a05:622a:1649:b0:4b7:a71f:582e with SMTP id d75a77b69052e-4b7a71f5c59mr16754901cf.9.1757920437037;
        Mon, 15 Sep 2025 00:13:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0bf0334ab0sm349700166b.31.2025.09.15.00.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:13:56 -0700 (PDT)
Message-ID: <9557fba3-ad11-49f1-beb3-d23bcb87fa18@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:13:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 3/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable all available QUP SEs
To: Krzysztof Kozlowski <krzk@kernel.org>, Xilin Wu <sophon@radxa.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-3-045f7e92b3bb@radxa.com>
 <0a766f8d-657d-42bc-b3b4-33997b919d7f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0a766f8d-657d-42bc-b3b4-33997b919d7f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX3s0Llq3L6d/6
 Ic/sSWOVRMrLyBBPuoDGkIp5cm6WYCx5POmqeLepDvbFJPwWBuK7iBvD9mVKxSpBe6mWbfIEV1m
 aZ0f3bjnZEtO5qMAOTP2af9EfqldpuIBUEj7oJlMeAWYZemv8AAz9LD8moiP6LsIiZSf705sC9x
 T6yp0BFypVqWkykfUW7HFljOlIG06xH1UctJJD5qIS64S+LrjcpWIAyLZ+TxiLB/nlU95w7FSiA
 XDeeyf973o75HeyAt1T6QCctYpflCWvdSpC1zokjCTpRsZZ9sUpwgYqAz0BM2BVSNipgMZsPu3y
 0Y3TH0fumfUlR1f31MA999SPLN3IEq/J5f3HSUv92ueaAqudih/BuRxyFSyD40D48/GOvJle3pd
 DRCWKkux
X-Proofpoint-GUID: OAZylTVtXDVvw6BNaf3Kh6jaUe9t4QBn
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c7bcb6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ksxQWNrZAAAA:8 a=6z9ov410QEpJGwptJD4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: OAZylTVtXDVvw6BNaf3Kh6jaUe9t4QBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On 9/14/25 7:36 PM, Krzysztof Kozlowski wrote:
> On 14/09/2025 17:57, Xilin Wu wrote:
>> Add and enable all available QUP SEs on this board, allowing I2C, SPI and
>> UART functions from the 40-Pin GPIO header to work.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>
>> ---
>>
>> This change depends on the following patch series:
>> https://lore.kernel.org/all/20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com/
> 
> 
> No, why? It does not. If your DTS depends on drivers it's a mistake to fix.
> 
> Fix dependency or squash the patches.

That series also includes bindings changes

Konrad

