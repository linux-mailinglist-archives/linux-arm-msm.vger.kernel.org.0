Return-Path: <linux-arm-msm+bounces-87625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A193BCF6BCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 06:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A1AD3002FF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 05:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A8B2F361F;
	Tue,  6 Jan 2026 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTYb+aAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfVLCRuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D26A2F1FDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 05:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767676177; cv=none; b=Biw6RdjHDbzDwFEyLcbt10sdbQHJe0IKuL9sTHTRHYmlvdJCPSs+3P12nLQab83qY73y8RIfpgna+159sQUfcS3cM1NYQg9QvbPEaK4OEXG6djE2T7ySsakV8RL+y/0EgH5SfT3uXHZwmpJ/khfv4izHi4wkpbZGeFxc4qdheOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767676177; c=relaxed/simple;
	bh=yLylLMnfbComcKS5YxA9ESsOk9drHuwiQKJ8nVQQ6vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nywBgZRvfFjBw5oBF50m1Uj1oCDvM6qaM6XQGDRVFIVrShTP9KCI4rVySxL26jK9sl9AsPB6Em1nW9YB/YFdNkWZIWI/qakE2OlH6b27VHvc54620R7rQXHkNNNYPt0mK/4wbK0Bx6lG6Kl2K9um1Ysnqrgk8ftYJslU63NfycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTYb+aAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfVLCRuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QLFA2854353
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 05:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SOD3/kMNlfHRzbXU46DK5ZMa8EeIhEik++3HN8TI8M=; b=oTYb+aAgfp2A9v2J
	orEbkKgpTBwvRdFlaqhGnsrOvu11w6tIS0w2/5KJ0819eaGHV4lGAhjw4MBiYjSS
	r+UPeIyW4T5LZjLcvRasq/kcGBUQOpeolPhpqUmd2sNJ0DrA37bU4Q3nFmnTZpPi
	/oH4j+aiNqoWJzs62DiaqObqZ+tnbNvu9uK1mnVKcEv7MowI/ET32QqdgJt1mvT6
	QrUoPaJbpKkL2YKzC7oz6y3CbzVwkT/1k54es74bODoqLgz0v/q/J/hptgauJWNm
	gi6gCLwQfLebAwmMhOiwvI8VWpW0ycMt7NigMWgWFh2eTfjYd6b8uBiA6wPaoW9P
	e1qpng==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus2w75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:09:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so508471a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 21:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767676174; x=1768280974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SOD3/kMNlfHRzbXU46DK5ZMa8EeIhEik++3HN8TI8M=;
        b=RfVLCRuFN1maUxJOeub3a1dy2uR+BVrB4jZk/k3CXzwgeH6lqdrR2GHHQYAm7bdRu2
         QCs00KmT6d3ctIOwgxUIS5BTQg1z2GtuPTTQJBDhBI+OLYKvCBSDL2WHe/QdhlxdF0Qz
         VkGUSGtkgnVAoqixFNriKF+Z8+iKvJJKQ+NB2f9MYiqoJVRInoxwr1VMoCL3zF/vX/0Y
         TMVWNTBDMSEbBuUg3cFQwdenETSNmF9P1PZQaL0YT37CzJBre8eAz+s3yjyuDgvOwPpG
         kvBg1yvVV5TlNf1to8ASLbiPTIfVjdBOVPozB/JEoCwlf1S21d/aDc5xi6uVV0mDUuEQ
         +EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767676174; x=1768280974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SOD3/kMNlfHRzbXU46DK5ZMa8EeIhEik++3HN8TI8M=;
        b=Ijx5YgJcxYV7WRWi9nosiA+r4YULPQXDlTusMTIk9sWIzXwbAd7PJAEIuA5w/0i8cY
         03yOhf44SNfNFs3MF2a065IiYrvarQbzF3q8CO79wmuoeom/KhdrAU+gsLvb00CCEEWT
         DiWQnXwf5vn3cbKRWGT9vBZgLRvXF8efojsTi5CpwRlr7E77r8yvO5kK2ZhkY098W9Bh
         Jo9tShZ9xhVcGgn8XQC6hhWwmfHQcFvSsqFhXlMBmnMCPkqaeBpKJc0yqN9UIWDN07jL
         E5Z2aRvH9aEaF0Df5QAgyrI/QuJgEzSldFmQdp5yJMIDKrE/Plqk+vLCpX9Co/a/1qG3
         qsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZItesFlyY6Y/sbvPEIb21DRB+Fs8hXFfFe3Age3WqtJSpcQOuxMQyQAcrrML6g1ofaq5v8AwWAd0Y93KA@vger.kernel.org
X-Gm-Message-State: AOJu0YzNyVS4Tl0KMBaMSY35HxmOOQRG7/NRBjpbrHZRZSJlmRdLWVf2
	NabqbxJnVjXFVjXE7JBlgEWjhXBHGFRE++uH4TkDHi5nZx0jVqnhsHHeCcd4fR7BFQEGyvinCC0
	WbPn+NmihJUoo4DqR24UYyJiydzBsyCTGid+gMy6NX4KlyylegXg4dCGaUbEbgMpsH+2n
X-Gm-Gg: AY/fxX5JtcQeDuLND5wAT3Lz6lP0DAdE46PaSL4LF69gYkeXz60PVG9yU+k5l/2M5E6
	FjXBgBeJzbQjWR/Lwa0AmVqjwrxbZeDD3SKIE2vbiwMXW88MqKKzx6LGlME6BsEoCTsEnv8oGw6
	OrkNuNg0s/VlMUWYy/JKS5HwsL/T539GUZJynQVcT45bsZD4rxnlImrWTCsmYeQ8tzHOWIvONSg
	BtG3mx8i8thVQF/JoDgsOtjTNt4SGIZwdCZclmd824BUWHbsBxgKZB8kUtby7Y3ctf5Yqkr/gb3
	H51gflWjHP8+Ki2+uWIwQUVdYA7ck0RNDyN7AYqaWvzd/nb7C1et5YSwXJLnV3EzLqN1QtOMO49
	H9L+gmR9NiFo1fECQPxQtnlezga6xRcSRyQXeVf9moqfJ7g==
X-Received: by 2002:a05:7022:61a6:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-121f188c67fmr1608373c88.6.1767676173665;
        Mon, 05 Jan 2026 21:09:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFThhMjB++4/K7Cfub+aD0s+vY0i2Zl9hrVvNzgeOKOfo4k5ujmMqUBKzWI1psutADRpneDZw==
X-Received: by 2002:a05:7022:61a6:b0:11b:baa5:f4d1 with SMTP id a92af1059eb24-121f188c67fmr1608336c88.6.1767676173072;
        Mon, 05 Jan 2026 21:09:33 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c239sm2032747c88.9.2026.01.05.21.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 21:09:32 -0800 (PST)
Message-ID: <bdf65a65-baee-4afa-a4ed-4dc51298c304@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:39:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
 <20251021-knp-usb-v2-2-a2809fffcfab@oss.qualcomm.com>
 <41f71be9-595f-4a81-b089-27bdcc778c8a@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <41f71be9-595f-4a81-b089-27bdcc778c8a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: auZcF4UvKn_EynXFsPF-UBOG98NIY80m
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695c990e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ocyYg2yDLqSr0WdFaBIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: auZcF4UvKn_EynXFsPF-UBOG98NIY80m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0MSBTYWx0ZWRfX61NTbLq/T0C+
 ++vqkz3iXSzk+B04h4dj2zEq+qbWWYOKKywFlvdXR1WjtTZNSCMk34ae1fAajC+OMkGEjNBWAGJ
 RBN0BMbxbCHS8RpxnGyl02pTDONkCbYoZr8lFi+vcruKQQMSj8DKBUuGt9wLkX9r8PVb0nw/SPv
 bXhfCDkBLMa9C/rNUDx84J53fWIdJLcvO/KVhuGK8r9BS2FzzHWOZvNUzegRHS7l8J1d7KSC1B9
 QGVpAmopKGHvxGNepykeHv8ISET7GgjRGzkfNdEgL6b6oHhOwbztepwPLvG+af7hZH9Hkg6ViNH
 wLTXcz9o9LmrTyVPiXmdOjIK3FBh29nGRV1cCKWWMS6FOWsU2IFtL8nJ9q3SMx56i+9LfWPnyKx
 NHUP2FNzqprDKsNDXymqc9pNk1UxQLGoFfvxvZ2K73DW6YRPN6apA/vyzjCYKNyLoN+lUdYIyxa
 TlFPhHDJ0SNzDiP6nMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060041



On 10/23/2025 9:09 PM, Krzysztof Kozlowski wrote:
> On 22/10/2025 08:50, Jingyi Wang wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
>> fallback to indicate the compatibility of the M31 eUSB2 PHY on the
>> Kaanapali with that on the SM8750.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Hi Krzysztof,

  Thanks for the RB.

  I was about to rebase this series (phy binding patches).

  And wanted to send the following after fixing conflicts (as glymur got 
merged):

diff --git 
a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml 
b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index 409803874c97..cd6b84213a7c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
        - items:
            - enum:
                - qcom,glymur-m31-eusb2-phy
+              - qcom,kaanapali-m31-eusb2-phy
            - const: qcom,sm8750-m31-eusb2-phy
        - const: qcom,sm8750-m31-eusb2-phy


Can I still retain your RB tag ?

Regards,
Krishna,

