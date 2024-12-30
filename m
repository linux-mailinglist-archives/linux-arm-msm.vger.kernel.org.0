Return-Path: <linux-arm-msm+bounces-43646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C369FE6EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 270B07A0F48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FF91A4F1B;
	Mon, 30 Dec 2024 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItAbCoRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4F725949B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568140; cv=none; b=Daa66psJL/ErxSu7VVoNG3yO5DxJOiiBZkRspT7h8ckTcYt4aIhwoFfOQwpN9GkBarEe2hqTJaPE28fTtYcUDr0HpiHTLcI8u93yPS/aVvOnyeGgcfzFb2NT3OTNM+VRlEgZZY7X4WWdH8eySFay7kXB8kLBkaINsdY5BEdjR5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568140; c=relaxed/simple;
	bh=2gJiDrg83SW5AzpajXuqJjoZxEcycpK73A6wF6BlEw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHDZgjr77/7jbX/l23ioJ5F0slqIrfHA6CVeEz+BYizDuqqCr8yDXeFaE4udvMhgKBvQAsWTm8u2VV01x8Qvid1Z4QrOiYF5mFCtCHO9oS8MfHQyCjFo6okRvJZYXDIipf/j7z8QFLBfv4BQ2fw8/7bDwUpXSkj6YWeIvEDm31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItAbCoRg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9Lnq9027860
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PywX6BU9UcYXAQBoM8N0DJyd44/lchAxK7xEfOTSNWc=; b=ItAbCoRgA91tgvZq
	TaQn7GhKRBBRAMImQHqwYUDuqiEXPye+j8EkQ+iBp+9pYcWecOufD5+/DZAASUs1
	Ly5CAYqMmA996xE+bC7M+BHV0aPld7cd2V8/B7eKpnW+5skZiKEqFrnd17n97Eth
	ginsjNz9F8wTAuZ4/hjqdy47T1D2chDc2sc51BHs4F5kze90yVXnVdOtrMb4+bY9
	eS2DOJbYwgWAzoIS3wsXId4nyelwOlZhONlNamzyO8Jyq+GZInUKw7HxmNMeQ/Xh
	pgZ3qTNSM9fWQB+sxMq+4gdBTTYd7w+a/l3XdpQnMYk4aRp38TPKTRHexsziYOk9
	jEd6xA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88kgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:15:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467bb3eeb04so24156491cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735568137; x=1736172937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PywX6BU9UcYXAQBoM8N0DJyd44/lchAxK7xEfOTSNWc=;
        b=WzrzlEzy4IjbCzQr2t+irAD3TC/fZrHRBLrfS3CrwSHFyEU7+qSH0lYQfR5L3oLiOR
         h5/r1MS9THd1xGfRmG8H/dp06MMFzqb1g2fkWpFYLwIyOM3/1XjWk9gc7aJDp7Uopy79
         YFgrD92SmG78ap/EVwfGya6mhW6Aon6edN37t7VH1Z2dQopAaVpeu1a8inpMWt0eVlgA
         4JFlg3Dalca/Yh8HlaIcEDStl5sDHO4KVUNNdHisjbwjARhqU9Lsn/VPsmYuZhvn6iqR
         b61niN/ri65caemxq83OTkjdNILSSN41B6vmHJgXgVDg4KhI7yd1NpJWpLn3iBSzEL3K
         2gsw==
X-Forwarded-Encrypted: i=1; AJvYcCWpQigzsGAIZnLuNcLkGqWkXBaT3dQHcptQ/MPORru6oW9MKjfDshf3yTguCPXHxPtQt+cJ47J/9vGzWTYX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KReZ8npnx4fxv32jNCE9ajgZVA8vv5ncnWIg+VeV3+11GhX3
	ImTMb7m9Oslyu243joXCO8w6GGXSPgkLGB/7EB/6N3xB27yuzxg+7bbQTb4+g93GEpAnU53qFSi
	K551aK+BJJkxYLqu4R1tACDfW72f//ppupuGKreLPqLU0HiiQZ364fiXQQBLnsigs
X-Gm-Gg: ASbGncuvHCI4fOp8L+PoArlZ6hPV3o3I1I/8aYIjBImjElLrsjFAB/PkyBwNGjkrPsz
	R8MLMsegKel5ntfOnQWN9Gch3ULuZ5MTBt6AC/YAKAJpj3Ez56aF7bfg5/h9djeuJStv+O+7cf7
	oIvlL+JxHgkWhPTXb697Vlo3cuek0Id/Ap0Vgakr+DQcKispRouJCF8CYc2IT+Pjjx2YKMyYIEn
	ic0GIo0wsOsSAr9OtCR2wh+2qvjmyKUJyR2EyB6kJe+CjxDZpjFxw0cOlU5xTphM1Mn9f0HXy7V
	EL1tiWuzmdYWYt2ZbJb/P46/WjVRPjFPnLM=
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr204199621cf.2.1735568137311;
        Mon, 30 Dec 2024 06:15:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeqG3snSa1trEhInzGZS8PZrAUjWlvEMbkDearlGy+9rV+yGg2Nuls3EGHim3OtC6duVecdQ==
X-Received: by 2002:ac8:5f4b:0:b0:464:9faf:664b with SMTP id d75a77b69052e-46a4a8b7f74mr204199351cf.2.1735568136947;
        Mon, 30 Dec 2024 06:15:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f26dsm15303185a12.20.2024.12.30.06.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:15:35 -0800 (PST)
Message-ID: <cb90fd75-60de-4df7-bef1-e5c832601a75@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:15:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU
 Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <88cf612d-cc3d-4cfd-b6ba-49739d598e69@oss.qualcomm.com>
 <20241224070018.2264908-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241224070018.2264908-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pxyMcAdHlv-NTzmKbXJGmSGfR5Y2OeaI
X-Proofpoint-ORIG-GUID: pxyMcAdHlv-NTzmKbXJGmSGfR5Y2OeaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=944
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300122

On 24.12.2024 8:00 AM, Chukun Pan wrote:
> Hi,
>> I think Kathiravan only wanted to make sure you have the latest bootloader.
>>
>> Looking at the documentation, I don't see a 1.2 GHz frequency level for
>> this platform.
> 
> But from the merchant's publicity, ipq6000 is 1.2GHz:
> 
> https://wikidevi.wi-cat.ru/Qualcomm/IPQ6000
> https://www.gl-inet.com/products/gl-ax1800 (CPU Part)
> https://www.alldatasheet.com/datasheet-pdf/pdf/1246071/COMPEX/AP.CP03.html

Could you try to boot the BSP software and read out the related
registers to determine the real CPU frequency?

Or perhaps, if there's a cpufreq driver (I don't know), check syfs

Konrad

