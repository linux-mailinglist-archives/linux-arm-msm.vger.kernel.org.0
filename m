Return-Path: <linux-arm-msm+bounces-82331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1672DC69ED3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0C1C82B9AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3E7359F80;
	Tue, 18 Nov 2025 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rtgjexq9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcQZ2O5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7775D32E6A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475608; cv=none; b=EW2F1DWbQt6bggVVXrpLEmaU8NcniYnTJfSg/WAjBUR8hgW13BgU6xkXLNrHM3sKItdo+9tIvHUHewxOVw0ltyQxeTFdPBCy6CH8n36e27wcbtT664U3ZN2p8P4azfXsj70u6yoB5ySWXZqCpE2EAhfIgEPeS7MgLcePnCCyzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475608; c=relaxed/simple;
	bh=5Q1boe1usOqu2qfuOr3xTCxuxivjPHrIEXF/9JvX7l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1Kxe+SmCOZk37wOBQQB/9xQVNROORg6vO2KS54Dia83a5tZPfFku4GiBCvO4kz49qYhKwin/4l5/x8MA/Wim+pHchumBHwrMT20DZCPcDuWWVaaEjxR6E+GH41CTlrXfjbr8lEygxL/ylUqSu0dCvZgkR9PG9EVCicIyf2aSOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rtgjexq9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcQZ2O5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIB26Q0375672
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2/+AALLV2LXQft4SInuayRVyMUoQ6/iN0yc5JBoY6g=; b=Rtgjexq9SSrysNXT
	ZnYBut9W//2auuN/czzprWgjhPatPBWQgq2b8ujPvWJijV2n52O/opl2X69ui5Uq
	G/Nlqd/3ny/prQmdCxbQ/kzdyIuMN/ZhudhGemK7WTBkYR47C72BlRsVjVl/lyvz
	FaxaugBDiugLmjixrCK6VVgqk6lYRkRRiQE5pGDQXc8zTMDTEFEWFoGxh9twcceR
	2wRdKcouaPFvarh5c6isuOps/b1Ij0eeKpZmhb0rTVBiqITqrZ3GWrMeaS9dY3er
	cGlcgdCYEo0KI8SfkAtQfdvnc4yz+DYY+x3rtmLe59oiqvou+9P9q7iz4we6u53t
	z07QQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nkcqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:20:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed9122dce9so1077811cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763475605; x=1764080405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2/+AALLV2LXQft4SInuayRVyMUoQ6/iN0yc5JBoY6g=;
        b=gcQZ2O5ETh9BXLz51qfSR1rSRWrwEFocFE3DrF8GtJP1AAfJ8Jv5J4uwHPB8SFLJ7S
         68tm2mt6c8rorJRY+m2kbWHXXFFwgV0S+w9yWsPkVu39lcq+rFhFsHtXbrty1coPRU3A
         yEx+l+lQD8Dy9Ga43swZU+KQhomDM97LqH2K1/wICHPT6Y9k3aAS0gJasYmv+lQTGu8i
         UwBa1BnBZ3u+asLf/GvuFOi19Q+xbpBYLiSNMdvtxoBiHHkZQqOtHlBWf9kv+8cmZXHK
         Kpfg+E/aKtuZ+1V1m+KrDZUui0ZUwhrALnHLueFShhhNBZaq3YUF8NME8RZJlbEnrkf8
         q9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475605; x=1764080405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2/+AALLV2LXQft4SInuayRVyMUoQ6/iN0yc5JBoY6g=;
        b=kyvuOIqu5792yLn3lqQ/2pXVy4cfgmsR5CWgwHECxHlZv1MvRzMTZHX+397j9s8JVy
         QvUzjNAjjPbR9KCdPEIw7Eik6f4MrQWImZng64xFSpJ7ANcDK0ygse2hrgcxTJVMMdKE
         WPgWOV2zTNAXNvKnkNy+B2vmDMRQO3vMGeHSbUSk0HhQW4vSPhD/sjtcj40QxOnwBzdZ
         WTX5NTkY9cixllaB8nPlrwE+dlXfcjrvTgQBTgcStDMo9ISQdh6S3iQJdzJOilmicLGk
         WCHgixx8EGN+OGtIBXZ3fMKGjJuJJBGQEgEuLAU7Nd2hkSsfZCle5F1QUD/qM4L4o+Zn
         L4Ew==
X-Gm-Message-State: AOJu0Yxi3LQjdTFtE1I7kQ06PcSMnbVH8la1us77P1UzdI8nmWUvUPSm
	aDWcCth/FaQPuk5NfvMgvUVjSviQx23nke/rTiwf/XgzmZ47OfHLYXUdwpONJ54bF0vTGHAHtYO
	aJkcxx+v1+F7tmeUpfz8Y8q/HG6sWqcZSOIO2q+dNKpdUPrz9ybewSu/zXTrrAaE/8KJX
X-Gm-Gg: ASbGncujwqS57pBXtr2wNsj4MJvD0i2EmAQUHBf9eIVK/qLCDfO9oZvPbsyclLI0nSb
	h53DNadqb5z8UewtgJ2j7nC1vNqmSOPl6nHSZk0tfoIT9T6XLd24xWlUkI8XRxERh7jyX5rxKf1
	DaxHv8n1FaN5dRaT6LbXD2686A6b/CgrQREroZ3vgR0SWRVdvUQ20JrR0KO6bX6B9GHBV+7Zq0D
	cPdzHAgWTUneUs7ghDFHpQC/ndVJyLb9ByLBcECB+4qhlB2+hbHktwTn9+2ULELurNOkAmYzmLy
	G2uqoNDW/OiKBW1cPSBD3JY+bBKjTHb7Ax0z+CF/X8zNc0s5anlN9ZANX+zwbWEja2wXE3ECKiw
	zeLjx2WBSdvoZbD6BhFHYKv5HBjAhRafhtaMVpLGROcVnfojwk2F7UljIe17a2cqTfgc=
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr28265061cf.9.1763475604724;
        Tue, 18 Nov 2025 06:20:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFf3ua9XMPxt97OmQZiG04Jcub0DiOP6BVZV4CbSqvSSL0ciKWfsTGoNSH1JnwQyFmEUXiKw==
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr28264671cf.9.1763475604341;
        Tue, 18 Nov 2025 06:20:04 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1384595466b.6.2025.11.18.06.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:20:03 -0800 (PST)
Message-ID: <a25bd3e4-95c8-47ed-8b2e-93c168283205@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:20:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/1] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
References: <20251118140406.1551669-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118140406.1551669-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNCBTYWx0ZWRfX6YO/cRta60f6
 CdYie8S1y1oJ8RDtXrUDUfsfKMkkyRiDbeZvAj55baj3jfLzwGPq4NxK/ekBvO6QdiqFiQIBJjj
 AURWx7IR6cLWLhb43NfFWmOJ5uq+53jv76sV3DMkL+UAxONW5tzaqEhVdOsrI9ceDfnScTTMIuV
 hEJDetbS2zrH2GV+W8fi8fXAqtwzrd3vt8FDjyWFNU3ctNS5ZO8IVGw+nEKuZr8wOVHrDFwhDSb
 q3TL/tPFBmy4lECKBtZSSN3T89avJkBBJYVn2Mi7wTCrH8HlfGXHDCWqviVJt3wKMrhmoeND5ov
 e7hL+hkwPvoC9oA5xpbAc1skrAKaBNXm/SK7jP9QGT7bqfn5QsrFdpnsRL0Gaa8ZJUqene5ZOTb
 EqTt5fj9MqX4SMKmkvjOj4fPnJP7dA==
X-Proofpoint-GUID: 2_T2Q-8DZXelI1XmbB-9n204JkKpFp_p
X-Proofpoint-ORIG-GUID: 2_T2Q-8DZXelI1XmbB-9n204JkKpFp_p
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c8095 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FGZa3Julx8tyuso66rIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180114

On 11/18/25 3:04 PM, Wei Deng wrote:
> Changes for v2
> - Update commit message, add firmware name detail
> - Reorganize patchset
> - V1 link
>   https://lore.kernel.org/all/20251113130942.2661069-1-wei.deng@oss.qualcomm.com/
> 
> Wei Deng (1):
>   arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
> 
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> 
> base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
> prerequisite-patch-id: babbcf9dd8722e19d91b01eb45756f58e58ba6ac
> prerequisite-patch-id: e641f09d4139ac77c34757bd08af2db746de3963
> prerequisite-patch-id: f5dd3ee9979e2a049badfb51cfab184da4501870
> prerequisite-patch-id: 40187dae2c9518a10866104b9fcd5a481ac67d51
> prerequisite-patch-id: b9a2e071f5ddcc70dbd6addcbf738afdc9283cdc

Sorry, this screams "unmergeable". If you have more than one or two
predictably-soon-to-be-merged dependencies, you should instead wait
for those to be resolved. You can help in that by testing and helping
to review them.

prerequisite-patch-id also doesn't even tell us what these patches
really are.. prerequisite-message-id is probably better

Konrad

