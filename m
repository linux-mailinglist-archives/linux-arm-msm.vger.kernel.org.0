Return-Path: <linux-arm-msm+bounces-46375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A8A209C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59493A88BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AA41A08A3;
	Tue, 28 Jan 2025 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcjtIjhB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899F19F135
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064292; cv=none; b=n8zxkNAPc6Uyd+0UAUhTUMKdnXj9e05AlRZuEdLzEk0YLqx/4KeEaolXSV2t5kQU0SCDrI1PE9oRDNwTHJahOlWtXGEF+bwnvhaEqUY45Q5tCozdbrd+sWV2NBJ5sJ6oNZHuVqj/jOKOM4fF2Fec2zREnR2WCZ/CZKtL9o5MYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064292; c=relaxed/simple;
	bh=0BgJYAFmIfhKmUiJdaRGDiHPwseznBuyo9kvKgzoZC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z44ZUdXYz1VUAAFRGrEtgLuNboEGWiYvUU9CxKnC4v7yLXzci3pdbrHadEE4gUeucWDrlX8wfSgdT3HaJiAw/L3sDPlI/Kr2YnLdUFCWZuYy+MWX46Ohil862gFwcA/beE6PDfPBidaewBYLfGr5jyCYwzKNmYQprCzAcVNeXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcjtIjhB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S2reEJ002277
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6g2echZ7j23XTXqq2EVMBCfIeLtHvBBfpj4T6nbNFPw=; b=JcjtIjhB+rwU6PJZ
	on49s2BRQJb1L6kyZYUCWxsPP1DR4Lwniz2tu6Ypqnrkkr+pHt+fkr/IwmBL7iFE
	2AnT2IT2E4jU2N09jA2iCIURWMullinXOL4x1uSTTqttG/W9CMf4y+Q1b7q5h2/Y
	8Zcli1tBEZw+6OK/CZzpZi6g2Y3HY/TM+w0UssSDWMibNrTrx1MtFZvE2QCBWPjN
	fQMMrOhXBGcLYv7Q0W27AlFc/dH4aPYK+qx2TN6NZ4Q3i0sWCx5QLtbIJlevORq8
	6ifAG+V7gzK0Cibr6ajfn7cPgZlp3I7XM0Tfr52t/9KAN3UnAAnj7LDDWc7i+qz4
	MruBCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44epuus1af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:38:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46b3359e6deso13897951cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738064289; x=1738669089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6g2echZ7j23XTXqq2EVMBCfIeLtHvBBfpj4T6nbNFPw=;
        b=Z0PSHXiRQn412rNVSpOBo2iQZ7CLR6AfqdnkaI3WCloR7f2pZhgTjaTunYImFFy8/i
         mUQK0nA0n9OHDLtYCgIPO14D4fe1ZdqOd7Qi4aF0xk+yzUNFzPwEvm9Izg/lkZAoLxs6
         F4FKhoJF4NBY1N+rgvaPdxY8jKrjYt/ShaKH5DOsOxU5BZTWZcX72L441AHeZme6Za63
         PlqVQFs4Lfd7jHPsQPysc4MF8JwJIvp3EPnFlNvDYeZuvhQT2e2GmLbr3GkSmB8zBn0z
         Sizd3hoS/8G/LilP1y2VuIOHF+PwjWtjayykt10kLKeEFUFiPZXH8qa20iIuF/SjHudy
         3CBA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9z/IUYUbNS6zkeZZkNzZsOdfMHG/rcH0uPS6+3GOOmZkKvArSaUVYZLKlnG83P2gtJcavkaxsWpMxIst@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YkKpqcE1Fm7ayjTJg/b5Mb9oeLzVvV1vSdgHlVSiQ0rXGVkH
	H/VD6deYk3/CN1m4EjLczMqTn1sFSvW4yyysd2GvrfEcMBv0Cn54fmXRdHkH6KhYB49w4syyWnM
	LLWw6SlGCZnY+dzyJZ+y/S7pWRhOaDcjfcZS5twFnmiFbakuAYoUOixEvN9Z40xv+
X-Gm-Gg: ASbGncsa/izMGXhUX6AF9Qtr1r2wKqJEm3M2zDoQZRv+NlI3XyMB1SYwoZBtPUsUK27
	J4yUOM0CqXvzpijK5d0bH8kdTNEa6w5iQJ/RCoeJAMnfJjX0PPWsNLtQyy0oJze+Vl+JEp525wR
	CkXbDNV/xa1hAPxDXPHC7Y+Y1HxUyDGwpAhuqq72upwuC9Bj+qU/ZbVQy48fOp/CEtOizhPc+c3
	dCvhLWv+4gpZFT4u5Nf3ltnb+zZurnCVcyJ4NIvA3KdvnJtyQYvNJuDx37eVYY1WTWzjReiWp1z
	s1nfZ0pg6GXi5d4yNhu6r6WQ04HUSI5kSdMVs7pYEnLL8Hj2EYaaX20eMk0=
X-Received: by 2002:a05:622a:608a:b0:46e:12fc:500f with SMTP id d75a77b69052e-46e12fc506cmr246727421cf.0.1738064289121;
        Tue, 28 Jan 2025 03:38:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCf2Y9aDvZCCSYPHZnq/Vme37o1Wy6pWQCZOXgJJV7jmJIX4dtvvrEwoqFnFZJe5GemRYcBA==
X-Received: by 2002:a05:622a:608a:b0:46e:12fc:500f with SMTP id d75a77b69052e-46e12fc506cmr246727201cf.0.1738064288803;
        Tue, 28 Jan 2025 03:38:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fc485sm764439766b.160.2025.01.28.03.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:38:08 -0800 (PST)
Message-ID: <772b211d-ca23-4810-8d92-a67892da4fbf@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:38:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250125035920.2651972-1-quic_mmanikan@quicinc.com>
 <20250125035920.2651972-4-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250125035920.2651972-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: x_7wO_s6FJVwmU7aX5EbBaCGFgCVboYf
X-Proofpoint-GUID: x_7wO_s6FJVwmU7aX5EbBaCGFgCVboYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=659
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280090

On 25.01.2025 4:59 AM, Manikanta Mylavarapu wrote:
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V3:
> 	- Replace all instances of ‘0’ with ‘0x0’ wherever applicable in
> 	  PCIe nodes.
> 	- Place both compatible entries in a single line for each PCIe
> 	  controller node.
> 	- Global interrupt is defined for each PCIe controller node.
> 	- Remove all clocks except the RCHNG clock from the assigned-clocks.
> 	- ICC tag is defined for the interconnect path of each pcie controller
> 	  node.

This one is wrong, please undo..

Konrad

