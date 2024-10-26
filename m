Return-Path: <linux-arm-msm+bounces-35990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A794B9B1703
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74311C21708
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9951D14F8;
	Sat, 26 Oct 2024 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxqRcKor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB201CF7C7
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938472; cv=none; b=mkuFmv1fF5Szylr7UVWNEB4yazS+RuDWDdBAbQYXjEDp2S8376NuITOchEO0xI8DPCOrEghM88+5XJF9iFehu6MML8o21hTLR8un/z06Pa8R3TUQa54tXqB5BdfaxwfOQZ0GIZ9/UjW1ku7A74iVey3VNasSdm4zztvDS9Hv8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938472; c=relaxed/simple;
	bh=QARV4EjB0z9QM00KDCl1cRNblE9JjjphgNZbZBTDSAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2mhEHaCfDGDo0XhdSyPVmUPElTOFHTYi+eb0yClmzOOqZQVvLZ2ixxx5b2V2sDWYseKVvzG8XyiIWtm87DP/VVW1sqt/GkFZ7LkqPeIR0x2lIjEt2E//2sDb0wRA6m4AxWbuXwmf/CXm9OeQMh4hhpLVdbnGrejMWk5rwVZkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxqRcKor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q5jm8X006545
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzFIZT0jT6VkNh8nT25mmdrrEwIfz6lQ7KVoOuF3F9o=; b=IxqRcKorKRdd5C4E
	qZqtiyA9hBuWgeNwesMBicWQlYfLk+0Sud/DyY+8lnQh0bPXOJSLVHHbTthOOqo0
	qXF3VWx4SZL1KfOkm37CgmbSI1fCQNetDdFivRAR6eNnrqQkb+Eb9YWk6uaYINfh
	io/7UdoqfzveD6J43CFR+s8Zn2ATRNnElMGtijivN5Oza3bzntnQZm6dxY4IbJZY
	F7T8K5nTNnw080FDhe2+xlrr9fdZPOIy+Sb6Qb3fSq1h0KcuoKeKP+/z+3cI+2MA
	uP/3oSVCc66nHUGhBUPnYcpDZcVIidNLq4+Tq17QKgf3igAzLgP2yXPsavVipwvC
	3JObyw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq88mr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:27:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe91571easo8710346d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 03:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729938468; x=1730543268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzFIZT0jT6VkNh8nT25mmdrrEwIfz6lQ7KVoOuF3F9o=;
        b=SCQDtIgWtakqV5diZF/p9QXkzRIYSSW7v8yI+CPoTT9j5TQnwM254Q0zb//N9Wj68T
         zyt3ARVWFbF7Yx0VvdCl4pytwr9zR5dw8b9ybK0RrB+AA2rky4Iz2ceVZsMvqZFuWgM7
         /fj1IclyLXAe30gssFO/jqTFagW+hmzgfjq8+y58E2aCQz57hmrrxkhglb2hH6etmR0D
         0QuKj/W6XK2xnPo8P1emMWUqRN0S9s19/wVlKqH0t0W/VB2ZJoZVpbaoqOmmH33GEgOd
         tiZodTsFTEvIGz7hW+3FOjEW1aXgWbHZZMU13ABj/5RPVdC9VV+3nzLFCxvsnlr6XFEl
         0ANQ==
X-Gm-Message-State: AOJu0YzspJ1DQvX1378wH/xUSRywtrmV6MPJHX0XMSnHE09pXwe0OCza
	6eQkc2QSmB8586iIjm/X2hVi9UI1io1AiuWiVJ1UneHtQWoQuRm0P4FptEyaxYX6AtL+hf7B0vP
	GsVpkXZrk71RBQ3OxpbKGG0+/om04BTa5jfMboQ+5I+wpZwrQYDx+OppeKZZqDDUP
X-Received: by 2002:ad4:5bc1:0:b0:6c3:6d25:2578 with SMTP id 6a1803df08f44-6d185816bf1mr15219226d6.8.1729938468494;
        Sat, 26 Oct 2024 03:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCNDP+6JHefX6RVjlAZtf6vip20ovujCjMO0p56BAyhfQufvRH2h6sFOUe4+iPWQTZMoRidg==
X-Received: by 2002:ad4:5bc1:0:b0:6c3:6d25:2578 with SMTP id 6a1803df08f44-6d185816bf1mr15219116d6.8.1729938468131;
        Sat, 26 Oct 2024 03:27:48 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f02951esm161891666b.71.2024.10.26.03.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:27:47 -0700 (PDT)
Message-ID: <07f712be-e30b-40e9-ac64-5fd8a26b145c@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:27:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add Xiaomi Poco F1 touchscreen support
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        Joel Selvaraj <jo@jsfamily.in>, linux-kernel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
 <172839929004.1375659.17484732521935836404.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <172839929004.1375659.17484732521935836404.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RBWqMilJRzx4GPL0t2shyOzXNsT8xfB-
X-Proofpoint-ORIG-GUID: RBWqMilJRzx4GPL0t2shyOzXNsT8xfB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=782 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410260087

On 8.10.2024 4:56 PM, Rob Herring (Arm) wrote:
> 
> On Mon, 07 Oct 2024 21:59:25 -0500, Joel Selvaraj wrote:
>> In the first patch, I have enabled the  qupv3_id_1 and gpi_dma1 as they
>> are required for configuring touchscreen. Also added the pinctrl configurations.
>> These are common for both the Poco F1 Tianma and EBBG panel variant.
>>
>> In the subsequent patches, I have enabled support for the Novatek NT36672a
>> touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
>> Tianma and EBBG panel variant respectively.
>>
>> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
>> ---

[...]


> New warnings running 'make CHECK_DTBS=y qcom/sdm845-xiaomi-beryllium-ebbg.dtb qcom/sdm845-xiaomi-beryllium-tianma.dtb' for 20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com:
> 
> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: touchscreen@38: 'panel' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#

This needs a bindings update

> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pinctrl@3400000: ts-int-default-state: 'oneOf' conditional failed, one must be fixed:
> 	'bias-pull-down', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
> 	False schema does not allow True
> 	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#

I think these warnings are unhappy about input-enable (which is not really a
thing on TLMM, see:

e49eabe3e13f ("pinctrl: qcom: Support OUTPUT_ENABLE; deprecate INPUT_ENABLE")

Konrad

