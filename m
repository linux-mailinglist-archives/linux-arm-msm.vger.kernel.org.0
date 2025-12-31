Return-Path: <linux-arm-msm+bounces-87096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91021CEBDFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 826FF30000A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FC130F927;
	Wed, 31 Dec 2025 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDkzpnG3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrRWMJdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4522A80D
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767181981; cv=none; b=q7FgirZOjZ0+dIYsEWP2vtTd8TohLwUBwodESl5kSQeW5+bOmu1T21C1iP5U8FcoeGyKOMkJBO7lyxzAYG5PEC8IkW/r0b40nn6GjyqQiOETknkEZ5/Hjn10JQB2jt6iIdur5hiT0ok6422yZQJQQE2CDqq/QU3KLggo+J7VqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767181981; c=relaxed/simple;
	bh=lkfEDleNSodrY9E1mS7olTOQa8hDTN1Yc0q6zuMSnXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmE2rUh/ifVjc1KyqssRktwg2iEOKVvTu2iARZ7cYrQiMp8AD07Ot81xw/nOqdonxJgymR8V2tiUYY+9zXvqByXDiH/n5ZQ8agbRHHgx64rhxfE0n6f4LyNFWGtardpYo4rIyBvNPIoj1zjDvYkNPMq97zbi9cBDwE1YLwrNRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDkzpnG3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrRWMJdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV623qX2050271
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIRN+BgNNuec8PINp7IZ+l0JeMYrVOprchsUVNfphIs=; b=kDkzpnG3xgKk8Fqq
	+TN3bRMddZDqzFO4PO1+K/s63h/R3H1xvfl2ovJ3STqSYq7apeOfAQmX6C6E8OL0
	Fme64/phuiPMYJheCC/Vjb78x+DalpO1hh9HrmgvQqKJSxEcZJROEwRvl611eEmg
	HtzLp3GMLrfcxoTIYy4jVZE2SZz02YcOF3hWr/5+108VhJtAQnls2VCeff1Twzlk
	mgwRGlLN9DhiJZ/ncXThqsfItuvf4nstPiF8Bvluz6TtuXnf/Dee+FttWcloHeuu
	EuczJcCHQeS6+HXHjA57YBfukW2z3uz/kX0x8EVDyFFRwIVcK0YAiIj1rC3qNgUT
	Z4QbwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx748jj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 11:52:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso36144411cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 03:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767181978; x=1767786778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIRN+BgNNuec8PINp7IZ+l0JeMYrVOprchsUVNfphIs=;
        b=UrRWMJdU8+tfwL1kGkoIfB/HxlCXSi7ZU8eWOrIhipEHKQ/9xOp0Gz6/ncnNuRNxOl
         wTq9MQXmPT3+TPOl8rbwNAgSyZm2OOP6NNdBAGa0DS/4FevyqivlrTVspFwbl+Ir+5UJ
         WzE08Ckeseqh/mvpRfFdZRvAbG3eYL7kkIW8ZASI49FvImu/wy4A2J1OhkDSJ0RKVNxg
         HlmAemDvKM2ohHbOE7F3FMNaM7GcpGLBUrJYghVaWS5Y5F+PPHiR43luowkqrb7uZYzm
         lmWytN6aMYkx+GYiN2xu+hmfGID0DuDSQ+nOTzZo6owvbNJKTW5plcfkwxWaL/jEPBFM
         bN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767181978; x=1767786778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIRN+BgNNuec8PINp7IZ+l0JeMYrVOprchsUVNfphIs=;
        b=kR7l6WH29ZJ6cEW2p0YkxrJ5fSK5FFAZ2uty2xBSjFbqE8udCswswoztCElJV7FG/Z
         iw7sadj3xnrs/J35EL8ujLTuvqLs3/wOl1jWYl4WiUxvuMMrGYjI6ktB1j+7J8Zybdl/
         JqoW6uaxrqotcAtIe5huGsNAquxpJPqTspyGwetOcjc0HTu1oHq+X4n4aA2H0noZgm9B
         w0fobT6MZgX8hIyvW3OfKXnvGsvh2uAKEpljW03PMhAa9hJ7BW1CZUafsrAnNdnpeWGo
         Pp9aq7ptr03HfnTL4pgsPQL9iuNP6VwtTt8Ha+AW6HyPleeNtNxG8J8Zt/x+csudJB5J
         nFVQ==
X-Gm-Message-State: AOJu0YzTY8jHo6MzislAJGDZRhuIElvtZcJfe4eZek9NkIqKGIac0t1y
	ICVy2cQHoDg5bjWqX6IPlMqejMzTjoKpS7jrGzjvtaWaLSvqpyh6wRJUxJkYNO+RS15CD1kg9eH
	tIjBC9lhKYC79Im2sSri+REOfQ0JyzBQTwmb6cN3WzWEuphJVvpl7w/2JMqxw8pia3/V7
X-Gm-Gg: AY/fxX4mbwCijMBwkauBonBxG4gFxbZD4UiztXkwEf+jlBsr1ExYBYep3hxp+6nGGeW
	DhfrI9l4WWCs/0P+4FogX9WpQUlLd8GraJ6WRI3v8SxI4+rlKtCfWWW/lkijGnxcc/aDjnpwA15
	Q/WnV+KuCxuIRXYTzSqGrwPLZW/dZ+j+OKglUFG3kzjL/u5Kf7CFwE6G35W48MBIt6iYuG5n3zG
	xHWTuT5o4efLDo8akiQEsVl34pUPsNsoy3tyrigeb3B+ZBOOfOfeFOJpqGoheHZk7rNH8ffIFrg
	iNck4/Xd3/vGZbS2JxgFKrYZz25Aboa7NspFoPMe6/DGboLczXSTLaUac+ZrkD05qA6cg/j6aIX
	gUtESefXq7JGO8pGI35/8fJC66Tjxzy+YIKTVZF4uHM5UuDEvMJGYbSKBgnND8jaiYg==
X-Received: by 2002:a05:622a:19a2:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4f4abdfb09cmr399191051cf.10.1767181978399;
        Wed, 31 Dec 2025 03:52:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgunkNErCZGim6m8hhI75uoM5KaZPqIb8v7Ufo8RVVQN6sLhOSiT1qqVYs44WwO/9rWCfh/w==
X-Received: by 2002:a05:622a:19a2:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4f4abdfb09cmr399190911cf.10.1767181978020;
        Wed, 31 Dec 2025 03:52:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b372esm38283354a12.32.2025.12.31.03.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 03:52:57 -0800 (PST)
Message-ID: <26838d5c-230e-425f-bd38-0160d30b00a0@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 12:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: qcom,pdc: Document
 x1p42100 PDC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
 <20251231-purwa_pdc-v1-1-2b4979dd88ad@oss.qualcomm.com>
 <209c49fb-04a6-43dc-a3f1-8451e3946d06@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <209c49fb-04a6-43dc-a3f1-8451e3946d06@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qVxXyYRUHFoo4fe2ooHALGaPT8WNmaDc
X-Proofpoint-GUID: qVxXyYRUHFoo4fe2ooHALGaPT8WNmaDc
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=69550e9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3f242UcOTUeKJ-iiDoMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNCBTYWx0ZWRfX0J7SWfrOrhix
 10TbQtgMdzzDJn4YdnmBEXAb5QzWFtUcfcaRp8lLjS4UNKhJDLuOM8WD5+eNFWaQvR4tBFOv5BZ
 nljg/yTWpgBo87CwEaflYjk7m4NFRHCX9R6MXgsrUX1byo9GcQEe1b7H1pd2ofqWledSrf+Y4bB
 /XKw3N85JhSqPvmu1rEhlSkEDTiGYcS7C/1/u6Tkmed4EldVTR/Wi83GnA0LsN4psCRt5X3+A33
 L3ZG5jX+lJRCXhO/uj960lu98GQorF8M1epnBJXeF51iwe/oGj8zrXvqoJScX3fBpr8sP7rztL+
 SgZpi7b41g8WNk/Rt3FWj1OmwwejTjGdJU2CUkEM2Sr0brXLTaexvfoqtURfJliUDbLnuMN8ktm
 S+1nuriV5yL3SefpH8ZBcQ8MHp8FzvDDGT1HbLCyX6caaE5iz8BSUzitywg811rurAmiLBPxjpI
 QO5AcxkTxEovIkCO1Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310104

On 12/31/25 11:49 AM, Krzysztof Kozlowski wrote:
> On 31/12/2025 11:18, Maulik Shah wrote:
>> Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
> 
> We don't use Hamoa name in upstream.

(the file is now called hamoa.dtsi)

Konrad

>> bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
>> hardware register bug on X1E80100") is already fixed in Purwa silicon.
>>
>> Hamoa compatible forces the software workaround. Add PDC compatible
>> for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.
>>
>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> 
> Your are describing wrong bug being fixed... or actually not a bug.
> Every SoC should have dedicated compatible (see writing bindings) and
> missing compatible is not a bug.
> 
> Best regards,
> Krzysztof

