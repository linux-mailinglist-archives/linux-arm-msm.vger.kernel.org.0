Return-Path: <linux-arm-msm+bounces-48977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C003A3FF03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 685BA3BF576
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4797205AC7;
	Fri, 21 Feb 2025 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxCAVyD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5230A2512F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163372; cv=none; b=V72egGwKzQIM+4XvobK+xQiJ9bbaDZRfBC9hHcvD1sG41wRS0EBbSnX9amzmuRJBJiPSemAq8kfL7Gjcdv7o7hXCuhjUxnhoxgEUVIXZ1USJhwwjq0qeNujJq5zr99HoiuxAwzMUo9rgOwmFTteKWmvBnriVPpldoORuz537x4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163372; c=relaxed/simple;
	bh=1bmbRUwk+BNNq6gA9Bpe7TPnHF/oaA/NQmpJ9nLPe3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hd0K16X/NmZwOv0vLg+fAdHMaw6m9JJACuEcqocAKQ7Q/iwKTwzOVpZ4iSGbI9FCkq3UFocOPZYO8eecOMNkeS73tPUssuNvMVnPxXdGIdALLS5ySBPe0LAnjNMRN9yk3f0btLMglY1JpLhNBTGRr9pIh5ZqjP7gku8ceQ6cE0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxCAVyD6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDKUXl014993
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qTPvB+ML5+rJwIEK58ICt4gImdH4pwy2IL/fBgWr1SA=; b=nxCAVyD6rvRK7Hjd
	Vi49z7faK9MdnpvKQcgAszbWY0X4GnrlAGnZ4TZ66glYyB4MvLHrD6wQc2Wk93wk
	cEdQnkqlrVjW3+KO7Y1agbDERVmc9v9t3DTuAyXggy9FFKrThEB3XwUlBDZtz70/
	8ejV+cIthIRrf8yF6sVFjaius9t1JS7K/p3185A6xTxNFXrTlaoVN9nDMfnGaypE
	c6MzuzzYbPliwNl4osgjc+F7vLcp/sociuDTe9dvTrUXUYpWDKzgnIFpW2RQPiNW
	qKkyMwZncyb70cdikeuBQUXS1F31CVHE7sdz6CDtysR9m5MoU5l2TIUepRfgb74B
	Kdog8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1awrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:42:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471ef402246so5420731cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 10:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740163369; x=1740768169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTPvB+ML5+rJwIEK58ICt4gImdH4pwy2IL/fBgWr1SA=;
        b=eYh4IQRyICnwlKDkXaF3DbO7DbCJRun00cpiib3AGqp4kHFqfKdowVuijJz5mgVJyq
         ZnLTd10GKh2rGoCzVszLrqTA0KVrLyDnXeS59FjVMKcy19h0Pn33j7kDb1zCb3Tkiafo
         JA67sSQElpBLTF828VhHuVaOC/9+6DfdhucAEWCc0MYtkYia9jX1g3Wtj1YN5c8Dx7dC
         tN+iJNgVlllm7xg0JVjdnKYm2Gn2wtJ11jVpltJy9dBZOyjs8swHgUC0NpsWQTSm+8Io
         1MqTSLy9P3DLul+1cW24BqfO+1HJXXqaZN/Oj++eWZBABsLzuWC6PQvDfpf45umBUx6e
         5b3A==
X-Gm-Message-State: AOJu0YzEyAUEZrtgJshx2H8bF2Xj2qU+YyF80FnF4Mn3Ocmi5HbHDrpU
	tvfujzgTMc9rzclYKeK4i6hDMUPlNyiQdQuFsYP4P0dvC8RIZ0/mswvN9e/gI8z8s8/IuCGSs5A
	R2A4fuRoNSZAhbM3Jqg6A4quoIDJM7ukZwBYPVgEssmwmqtCZYrmu1joLKz5bX359
X-Gm-Gg: ASbGncvcXWGDdzC61V1hWFMRTgNDmCXAWWskSw6wKk0dsNjeixUQhYr4/db71ADXxMo
	GE53chbTU8VitmldJz1jBqiJxNguql6gM9VmSrtomqakYk6eZYsDTy0MJ+NLnPLWvd8k7+2kpaV
	bTP2tzSn7uJCQmI6Cn5hlyMmVudzzFoUNrJ7GglW76XaUf8hoDVRqtj2DNuuXmAlqGJkBUPQhkc
	MIL86K3dAJq3xxj3Qkdt+oStRuK8TUeRO2NV49pup4Fa71bl2bVfo1HOzK448FEQFyPuJQzMjP+
	fsvWFxTiLHxfQkFjEX2TtZlJVHb6/+ftHAXIWpBn2LArQ7yn/nbEiwNsY4PGnuR5eFnlHw==
X-Received: by 2002:ac8:7fc6:0:b0:472:c7f:a978 with SMTP id d75a77b69052e-472229762c7mr18992281cf.12.1740163368940;
        Fri, 21 Feb 2025 10:42:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+yBJIomD8Ov549FRkPq+6wQGUS9vVvqGnim53nFKLCag4DBYC4EeexHxtY+4Cb7py38j4iQ==
X-Received: by 2002:ac8:7fc6:0:b0:472:c7f:a978 with SMTP id d75a77b69052e-472229762c7mr18992111cf.12.1740163368623;
        Fri, 21 Feb 2025 10:42:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc9ff4fcdsm645841266b.87.2025.02.21.10.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:42:48 -0800 (PST)
Message-ID: <5ecc0d40-f2bd-4ad4-a4da-9b5e85274746@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 19:42:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 3/3] arm64: dts: qcom: sm8750-qrd: Enable modem
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
 <20250221-b4-sm8750-modem-v3-3-462dae7303c7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221-b4-sm8750-modem-v3-3-462dae7303c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gj-32tIh2m5vz9wQrq4BOJ6kJ0T9FRsn
X-Proofpoint-ORIG-GUID: gj-32tIh2m5vz9wQrq4BOJ6kJ0T9FRsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=660 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210129

On 21.02.2025 5:33 PM, Krzysztof Kozlowski wrote:
> Enable the modem (MPSS) on QRD8750 board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

