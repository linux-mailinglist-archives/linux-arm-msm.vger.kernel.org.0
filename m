Return-Path: <linux-arm-msm+bounces-61934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C52AE28D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340393A8F3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9EF204C00;
	Sat, 21 Jun 2025 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tw9K+ION"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765651B412A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750505658; cv=none; b=a9Ib3JKAzZysKwxP9EoSFgWA8p3MtRQJQs+49ieAHgzG13Ilz30JG1tjeW8kEtxv9OZxsRwBDW9TKjoEJJxQXRuQ1P9XA3cVQmpBzP9ujvb1SXarxJ/uH023aLGmMi7Tkq1KcCFKu9+OqDfnppFco51AAJNtQC+KCNyfFOpHe6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750505658; c=relaxed/simple;
	bh=frY2TTFiRDTZ1/fLpg8ekWWh85lRQvZjOPHO9EIHCjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlFq+436VamakP8pDUkXoDx0IWX+uPgdtDNYXSjy2fjOF0aECZizUwiVFht3a7EEjT3yT7rAw7e1tpPGx31Yy8AdQbLSmJpZy0d+7PdKOpPIsI/L2MhTUd2p7g93iawtuD95n/UFqxHtFVO7gBQRHOFnWvSIjUI5wefBxQxR88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tw9K+ION; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LBCtLR029458
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jupXXJP0CLCOPTG5xvcuf2tq7rGiRDdL12CALHVIl0=; b=Tw9K+IONfj+jyivO
	lrqH/ZWbDmOpa4fmlp+Aac+QAwsgVGnFuYXa69rzNmQ2FSwYIdd9Rxlif4oMlcBV
	GETSrkoSxNbO89n+GSa+Og0F1+0MDu0Zotn1oeoAe8BIFHipZGLTK5OiEVCC9FnO
	RG9YgIwBUXnQ1eThve0ShBBE58sAAonyFOgS0flMnNHS5nNnwRVxNBf26lU2ik4H
	7LJdz1ONPvFjeb9mn2seN/FLHbz35DRRfDjV6NbIlC89A9gzFMa+EXqwS1UVUbbc
	jjp2lCtW3OlZAdbj5RyVSWc13q7aQDXwrkZzagYmo8La/X0tBTcjyyHNeBI4qcm+
	3Fo3yg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dung80n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:34:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so72743485a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 04:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750505655; x=1751110455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jupXXJP0CLCOPTG5xvcuf2tq7rGiRDdL12CALHVIl0=;
        b=FwhYsjoYsOygIRa8cqNjPaooOKAAbJkLOd+0XGL8o+dAcDMuEZywBRNq5LhcO1pV5M
         ty3C1jTjzB1OqTL9mTeU9ze3tnYU/AmVZrUskMQY20+kQxwvl7OKqN0MCadOaCf3EewX
         LfkAfs971qtiZv1h77bVr1jRlXE6DRyKWOeuqDXAefDzKvLAU7gtAts2X5LrVJzJNz+0
         tiWlWqz1NdgVOpD/5UrSmjyFDhQ5mNMwwCdaEUedtGQ6oxEnr0iwG6y4rAjx0HrxUmpD
         Mg51onEhMBCNtGUitVGpGqN5lhkgJznli9nW4SpvChN/4ENqnpkmh1aNnD4JXbEYDK6+
         +LoA==
X-Forwarded-Encrypted: i=1; AJvYcCWVnLX9ix8Gt21XBgJX9UCcPBt7X5egozvjM003nbeLbN0L/xFnMpeLYoit45bBaAg1+rOpLgLHB2yxxDfm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6yEbxPirDQry2B8CYeKfxbkIlBUKOW8eEINDKvvsYisZ2QZev
	cw/sjPtCcSAIz/bJjWK9kuoa2XP6WRIPJNx1znZQR/XnNO6wUCb+GuimwK7NzAftDq1OMjTDJNt
	FIumIqC7mkhu0Yvan04kEwOOTrafTS17mVatpgdeWF9KT9uXbjisdh9K5AXVfDdJKhGPO
X-Gm-Gg: ASbGncuxuJ69uP/Wc5WCFYHjK8vovz2/lI6hIQjKMQ3ZXrbKYJGh817EXrvTOcLE7BL
	x16sB4Ju3ZXKqSCOJ7JXt5AFILbdJc+uzXrnKTSxnOes1P2x/BL4v+GvqPmofGKHO2Sphi2S8Bq
	W1E2+UT32G3fbbnxSszT31iZXSBFUgskWhZ0cmKqFjeoKf7DFLCLrQSgV3JtWItk02lPEpf4K9+
	7Z/o+iaUtelWNXDu/DFK4ieAhc8ZFU479p8h0Y7OpYEvvBgDmPzdERbEPjkWHoDKmDownPRrcBZ
	+yPRwIJpFMgmh2vEd2q86/gzVJN3YQMH9YPMG2KfrmYE8rqY4E9MyEiMJgMmQyCkV46SdMMGrFR
	j9Dk=
X-Received: by 2002:a05:620a:24d5:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d3f9936b58mr324763585a.12.1750505655439;
        Sat, 21 Jun 2025 04:34:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4OouuaJ6w4x/c8MGc2W1x/PoYi/AddPaueSZ+TZYl9OF4B2EEGCnNe20HdRLDIQTJWXjtWA==
X-Received: by 2002:a05:620a:24d5:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d3f9936b58mr324761385a.12.1750505655031;
        Sat, 21 Jun 2025 04:34:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408301fsm354807666b.96.2025.06.21.04.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 04:34:14 -0700 (PDT)
Message-ID: <9830cf03-911e-478a-adfd-2302bd3512d5@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 13:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: Luca Weiss <luca@lucaweiss.eu>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        cristian_ci <cristian_ci@protonmail.com>,
        "robh@kernel.org"
 <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht"
 <~postmarketos/upstreaming@lists.sr.ht>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
 <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
 <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
 <f83cc435-7736-4003-b5b2-a84e2fe725c6@oss.qualcomm.com>
 <0DC5CC32-231A-4802-9A69-7BCBB21066E1@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0DC5CC32-231A-4802-9A69-7BCBB21066E1@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vviWAnvHBwsn4sKgjxSET7CBJaTN00Nu
X-Authority-Analysis: v=2.4 cv=N5kpF39B c=1 sm=1 tr=0 ts=685698b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8
 a=Buv9VJQQgbVt63ATjJcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2OCBTYWx0ZWRfX2L5Ps9zz9fR4
 QJwWdmNxmOOusDEqYjHoTK2icflCP0lC45pEQaDaZlWyFYOFZI78ux6CHDQSPh7NxYwpRCVYDy7
 OdA+Avbsv4H8xh0I335esn6BcIxXGLfo35yWDb8JKjkCey1O6w4iVO4loCmsuf9AjkVK3mAH1bf
 VxSDE0UdbihE9T7CXtRRt0BdlNWVYhikQTUgIDgJMvenj+cwaijHb7fuy55WLcFrZJqq7AODIr4
 /qkmYt1tMm+GG14hthL0BU2j+AL3fTDmDTchNIyecgk2SxtDzHsxx69GNfHWpbjKrnPqkrx91CO
 z5V/EvL9o/EDyxUb1+ZYRdI/Pc32XE/TWY9BDelyMnayuHJZJ89sxXp6ks4sPiwwtdKQ/D6COD5
 6evApnENfdXmt+NtCw3BK6IZvtKf2EZPlnz1dHehFuFadMdkIgfWhazTWB/ECN/4EoxaeC0T
X-Proofpoint-GUID: vviWAnvHBwsn4sKgjxSET7CBJaTN00Nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=844 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210068

On 6/21/25 12:53 PM, Luca Weiss wrote:
> 
> 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> schreef op 21 juni 2025 12:11:00 CEST:
>> On 6/21/25 11:27 AM, Luca Weiss wrote:
>>> On 21-06-2025 9:07 a.m., cristian_ci wrote:
>>>> On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss.eu> wrote:

[...]

>>> which means that you should only have one value for address, and one for size, so "reg = <0x84a00000 0x1900000>;". This is different to most other Qualcomm arm64 SoCs.
>>
>> reserved-memory {
>>                #address-cells = <2>;
>>                #size-cells = <2>;
>>                ranges;
> 
> Huh, why this mix'n'match in this SoC... Fun

I *think* some of these older SoCs should be able to address more than
32 bits of memory, so it makes sense in that way

Konrad

