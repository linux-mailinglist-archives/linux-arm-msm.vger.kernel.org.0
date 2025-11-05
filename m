Return-Path: <linux-arm-msm+bounces-80415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27DC34B5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BF611889B5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDEB2F9C37;
	Wed,  5 Nov 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoIAx0a/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVh6vPIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6F1261B64
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333863; cv=none; b=ujxN9aviEZ4Uu9ziIwfetlznI9xH79y7x5u4/qSXf9+Ajf2QPNDVfUPze4W+3ndx4y5k7IcrBnVsZeURTDKxkl9Aafqg1Id0G1dgdPk0ZxgEScyawp4kqx3jRrJ7arVMGTuIgC0/3Vp7LewgH01kZk4RFIvLcOD89AvLP2mn+TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333863; c=relaxed/simple;
	bh=ymF0tfM4u2SvWoGHJc2mLhZccjE8NKDBOsISnM4qyPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riKCAZX/8Jr2ORMvhsTzsdY9klNj0KkTUuzwxsbfbnnpV0fDlw+kFSGun0tjja8aLrnNcQ20CQRXbLWkoCUqhAKbTbm186hcE2+146088PpEj5jIw3HmZieF3KNGHiQU6DGBsoVHMP7T/pfiJJ8FbxVrcDGQk7OLVUINxtGnX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoIAx0a/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVh6vPIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57uQcO159403
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCW9tJ4BvEY/1LMn8PhBqu0RVJSBHYZUAH3w68oicgY=; b=AoIAx0a/jq4igDaN
	z/BGuapi5xx78jG2BJVo8GsesdYQEzIJ/xYdtDkTTvR0ieKeCOeq2ZSuFieJXj/d
	egtAlWy3JcKvtpbDMV9U+lI0vZy+7JYeToZI0FAxgF79SuWXcWvDymSUMY2hyT+O
	NRzCOvn4ryeX2pagNXdtt2+om3SgwIBVmoKqMj9XrG4RW+SGlSbBUbeIv+QjyIDZ
	U5CKTPuhE6CbCctVWYtTZoTcxkYdNj0HbjbVJVZLPi+Kx/Plg558+AXi4Res+nEo
	Bz/UN2CuUPMcaLrpJcrh69OjHP3KOz9unifQnqrBx/8B5+oDDuo9mFmtMCrfWqqi
	pZZOHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt0725-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:11:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-883618130f5so248122285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762333860; x=1762938660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCW9tJ4BvEY/1LMn8PhBqu0RVJSBHYZUAH3w68oicgY=;
        b=LVh6vPIl9mV0Vy5/LPMVtwrfCkacCCbuxzyGsbPiRcf4s6ha7ihKA3iqB6D+dY+nQN
         ZflbmF9nC3Ip4FQjQNMesUVb8Uabu7wTXuqcO8JMzRCCqzAw9gvl6mt5tuFpDqcou0Jh
         SnZgpEaRK6wTF5EtR9uUzC7/pcZlnGWW+3TxYRu3P5S5CMsIp4fB8uTGPEdjOrWoXYLk
         rk6owpaI/38kfKjb47CPYhj3yL205dGwcTtPVf/9oOrsDAwXbELiY3O0HR/p9RH+4PV6
         iZB/TWpVeR0cfX98fALw1iZNoq91stTf/Xs38TGXrR6YZbQKO2Ob/saqCKnTPYP9pZv8
         vedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333860; x=1762938660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCW9tJ4BvEY/1LMn8PhBqu0RVJSBHYZUAH3w68oicgY=;
        b=LLPl4tknWg6t4bzyV2oPcpoXDbLqXo4LlaG+oiwofpCVhUQ9E37Zmcv389PfALHpyv
         OK62sZrB+KaMIHyO7C2Q9GuNCpQCJirnxrEeflRoKYIOHSjCwIIp1Ip/EDWWBRyFV5mV
         ThTMfPgMxJ3MmUEWyAhsu01xsL/toHOZqLKBSn7lmCZLEizonV0qsqSLbak2K3OZv2lJ
         S0PKhBkLxBGAhZnaz/iC6BGyS7UtVYeC89riXQDCu1FZft0sE+i3Zb1xNOY7/oxPywDa
         C918f5dmTSFdQnjvFMIWgv+xSslv4OBa6rBJhWUQFih1fHyUr7cFVP5EkH4LI/bxG+Kp
         VGPw==
X-Forwarded-Encrypted: i=1; AJvYcCVqiSoc16vdxF1sfd/OAE6GIwPO2WX1u8OM7NV2qqrhMZ7rSZ/sdW0gaRp4jIcYmjqWxg1XOl8lVkxvSWhZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64N+v0qWHzm4doWUuD3x7khj0GiRA/s3DM32WOQ6/PGwcCIWD
	wykeCn3bnIki+VMrJ5PRI07ssIwK0/dWRS85pSr7ViHbvUGk6hVY0FSAfeTQ4Itxr7nqCPq1gGl
	7xMqWCRsB6VOwe6EDXU5g2Al2VHvLBeRtqpgHMNDSVrA7KQQCs/amRsO2AE9VjxDEsakG
X-Gm-Gg: ASbGncsK3C9pyX5xFIfK61xP4imfnv7O0cMjODfj8MWW2x7WGa9u6Js0gXqt/d389bf
	dZJhvr6uRdiCYfcK3shAobn8P6bK1eg/14NTD2xbTx+gzdf6eFKZICAQhN+AzG+6Y2t/2guIIDu
	F31I+bVjOPAO0kp+leqIF2sT1kIx1K89FdIyhh8rHw6BwPDjFMRmbANHYBPKyqQjk2IS0YjbpR9
	Bmt+n6vJEu2pWyw2hxRt0Kehz4jO0rlgprsZzS20CHUzfRBolOreSf6BhR9m0rZfcDjK2bkwIja
	8XIKmtMY4bMTWXtMQQKljv0+OQC4BzP95umMMg9WCDpQ4F6dKDU2geb/REKIh061ijZQSSQtPrS
	RdB9EI3ESBSR6xVxHoV7+6GgPitvXLAxPFyoM7ojILUQUqK291fTrDV9h
X-Received: by 2002:ac8:584f:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed7212be7cmr24340181cf.2.1762333860129;
        Wed, 05 Nov 2025 01:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWnlIzLWzdXzrCXM2fscuvqw2ZiRnNJleeX0g9kOp0j8ErvOz8HDHza8o5lI+lsGnLS5XxaA==
X-Received: by 2002:ac8:584f:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed7212be7cmr24339861cf.2.1762333859590;
        Wed, 05 Nov 2025 01:10:59 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm438025266b.54.2025.11.05.01.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:10:58 -0800 (PST)
Message-ID: <2c9c3a85-3702-45a0-81bc-f6464f8f02b5@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:10:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-1-7017b0adc24e@oss.qualcomm.com>
 <0608ca9b-083c-4929-a4e5-7d76b2590637@kernel.org>
 <20251105083402.dvm2w7ezp7spgtz6@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105083402.dvm2w7ezp7spgtz6@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NyBTYWx0ZWRfX4EsxbQ8kfpKX
 lpfC+GORJ1s9dWHxDyMM1gmdL7BRPYnNkDtb3luFJwqhOAlR6XPQLs406exNz21esDHKZDSYDFe
 hjIvbwlMUqN6D81W2Mwoh6Ih79xnL597itjBiBONQBcyJzh1/DyHZ5nr/vd0wfLXbv05mRh6/yQ
 /qPuB/JaQkZ6qXUUxROciqouP4HBitTN9KuJLyeKNY35FYBF6HgpG4HGX31amLkIGZT3izX7dmR
 Y46NxIDcGEK+xObmrVpAearkncERf982ww3PFBMaXZsnTBl/xSIcb/ieMWhp3vG2sb2GA2PsHCK
 t+gO1vSesUwHV3abLQA/HbawVlLOpepTIm2YaReUnMXTN2LtDSxBjOfu+xTY0i5+eJvfoxO0Ul/
 r84OkCsZ5poN/g1YDoro1BlLICTw6w==
X-Proofpoint-GUID: I72vP-hs8bJarFfEq-IQYN2oOlaN-OaP
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b14a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Vp2ZucIk61sbSZnEYCoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: I72vP-hs8bJarFfEq-IQYN2oOlaN-OaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050067

On 11/5/25 9:34 AM, Mukesh Ojha wrote:
> On Wed, Nov 05, 2025 at 08:17:14AM +0100, Krzysztof Kozlowski wrote:
>> On 04/11/2025 08:35, Mukesh Ojha wrote:
>>> Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
>>
>> I don't think that's true. Washn't Gunyah something new? Like since
>> SM8550? Look how many Qualcomm platforms we have in the arm/qcom.yaml
>> bindings - for sure most of them are not post SM8550.
> 
> 
> I should have rephrased it, thanks 
> 
> "Qualcomm platform which feature QHEE based hypervisor or a module in Gunyah
>  ... "
> 
>>
>>> configuration for remote processor and when it is not present, the
>>> operating system must perform these configurations instead and for that
>>> firmware stream should be presented to the operating system. Hence, add
>>> iommus property as optional property for PAS supported devices.
>>
>> So which platforms actually need to do this?
> 
> As I said above, almost every platform which features QHEE or Gunyah
> hypervisor that support PAS based remoteproc subsystem should have this.

For added context, QHEE (pre-Gunyah hyp) has been with us almost forever

Konrad

