Return-Path: <linux-arm-msm+bounces-89788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE7D3C4E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 645BD5879F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB213D7D69;
	Tue, 20 Jan 2026 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL4hTnJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlB9tvr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741113D668B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903742; cv=none; b=E2xUmyeEfdC1uv0bE8kez7SoVzNQuftfXK23Psni6wC7XrhMtZN+87oZK4MN5JD3EG1r/4QTltV9lQnUzQbawK21YsrDmTLacek8w7TOiJ+iEsK20PNcsAJa0X8YCwwobKwtpc1IM1gHPdJXBY989FA8Bj3wFvQmdpX3snTwB9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903742; c=relaxed/simple;
	bh=yz0X4B56o0xJQ7v4pyOQFGL4zSaD/UvOL4okAVWFLk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=jDVCMcIkcfRYNT4k7/B+Pq0ur9qFEc+u+88E7gfSkUcBZET5Lix+PtrbgM2rVcilZqPo1upUi2ClIOl38I4xLioccbW8/G/MmpGxoMbbZ43nVAjV+XOKkTx5FLPSA+HK4l3mgh42gRv9GZImPLbxy2LF516A5ClpRTks8JuGVbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL4hTnJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlB9tvr1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K8tMTP3366273
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CJZetFiZ5EMxXr8wlgpLR/AVlp9ScPsDs/V+VrVgz4=; b=XL4hTnJNnM664FUt
	lDX4HnSiI3o0uTMh4cH0CV4Jwv8T2yPi5yMVQMZDxs+nyQsJDAOciRjLDz2MSQYf
	amXtFL/+p826XCaNj/NllIbO7Bdn8jwEF8YQXbg9E66f+6yFpcCAXorfJVccZMI0
	IJVmEcMbRayKzk0W+/Gf4CE7ZEPUdEhPBjpZJawNJN9CgFuw8or69PL1Z3RnWhIK
	dszasiLoHDUQmlVL/CRHELkxn2/OA6v3U3dH4styP1fbwakoIhGej0tOUDy4qbf/
	5yLJ7ecnG4GSnnlVOZhDHo9qFCNLYqHLb/dHbxHsCLNqEUQJgy8NySP8cuimSbNF
	A3zU/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb1eu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:08:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso9291868a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768903738; x=1769508538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CJZetFiZ5EMxXr8wlgpLR/AVlp9ScPsDs/V+VrVgz4=;
        b=JlB9tvr1/H3A5//i7xCgpkEQPTLKu6fruALdtDX7yLiM9gfi6wi+JFMoU8oKAT+tSJ
         7OyKqyDdjHuDPw7eut3msxC4ewOXDKZID20TNv+8LQjDqdlAW0ai2EnVj8rzIng18cMl
         vj3vQ60zPDcwFKIwK1KlcmQcTdUNS04ZKEtd+tFA+GfscAo5wAncOWoltRtj8tsYp0Jm
         eM/7cd7SO7mS5JNQjTFfgpP4V6xIWQGkJzVgbZi/hqLgAquveDSFMs4uVu4B6k5LZK7X
         1nU56P0jDhAk+ECBIsSA8NG+/LGFFQef5olgVcIhG10GNa2lTynDYwroJzy3Ba1vLefN
         ms2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903738; x=1769508538;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CJZetFiZ5EMxXr8wlgpLR/AVlp9ScPsDs/V+VrVgz4=;
        b=VGV92YrJOWu4SrmIOvoV7WQ13VB/WdsNYLddxg9rw7aHO029sErvX2ODrJjTpLjT67
         SygJCJ4pEcWyLa/J4wcPkk/L6OsKqyW+w+VHFXRGIESVcESRFccxHEze1VMBUfEExoOh
         E2s/IFkRxKiVVwD1XeLsOSoggsX4Xc9+DSfiTTmfg+BuVc/Vn2/sgydFUzf1aCmqiac1
         1JzuL4CoagD64cbxgvHmfCV+37euIzwoBI530pt6iEJkv+Cp4/JMmK62lxmoR6KmFKCW
         QcTSVlAZiAMPJssdZCLPbnIXh1NInoCakRzzrIlnGXtzeRUDHmIDozqGUb0tiewotnrI
         PmQw==
X-Forwarded-Encrypted: i=1; AJvYcCUsuj3Tc07o6XdUm9bFJqc90QNWZxXdX8ag7FIxn1moDCyc4uqaByd2npKuWOebz4Buf8+5VcqTwgJzu+DO@vger.kernel.org
X-Gm-Message-State: AOJu0YyIiTbRMhdqpqFZ4Q5mAIjjZLQbeWP2zlYIDDeHlfQvu85zN8x9
	ccY536lqoBZuaaeTEpP0KBaWNYsdvSIdgZyzpNqUpaSZTVt9edOCuC0A7T0vk6qhWmhTx8NG7qe
	pC7rRIjTWF9Z7oVO/fKZ9o/jaSLw2w0Tj3j1sYT8TLfka6mtiZ0nIEx3uyQ2QXtPRE3Du
X-Gm-Gg: AZuq6aJSugbF2uuEOelLKUADsGxi6GJBlej0gaU2q1NbJyFv3+/ZpJA6HnfgbpNg+gY
	Uzf8fIuCEHTz4a4v+vGZKkdWxec296yLMDqZ94chLOqasrT25WOD7VLtnFtRSMCirfAxQ5RcTtp
	MHEse6rChe6Anqgl++f9Zhi/OD2c/cTdmF6JaQ7fXBbosXReCy+9h/rhLWpJ8b811AaqtNAKKmR
	HkPUe5UXcOXlAiObJwDaJ3sYrR31UgESeLZZI5tXOrAnvSg/+XWV3lB3Dm1iq0/qum3RNLNcto6
	xSAGoG9JkPiSIy8fmRswhNKr19sqjJ1hBXXQKufWA2mi4lGJcevjkofJO6ulrfMvjnMAkkcons7
	JbVsMIwQxcjU2Hary1s/nOr4TXejIrUutLm13
X-Received: by 2002:a17:90b:544b:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-352c407a7e3mr1236595a91.20.1768903737745;
        Tue, 20 Jan 2026 02:08:57 -0800 (PST)
X-Received: by 2002:a17:90b:544b:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-352c407a7e3mr1236574a91.20.1768903737276;
        Tue, 20 Jan 2026 02:08:57 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352c150faa1sm1663686a91.7.2026.01.20.02.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:08:57 -0800 (PST)
Message-ID: <279d96ed-865c-4f15-a67c-ee1a94ea2c3e@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:38:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible
 string "qcom,qcc2072-bt" to yaml file.
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
 <d180711b-7957-4252-b34b-81312705555b@molgen.mpg.de>
 <BY5PR02MB6946637904902544E6767829F189A@BY5PR02MB6946.namprd02.prod.outlook.com>
Content-Language: en-US
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>,
        "Rocky Liao (QUIC)" <quic_rjliao@quicinc.com>,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <BY5PR02MB6946637904902544E6767829F189A@BY5PR02MB6946.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b5V96pLfndOIrtTqWalXUUiAPp8b7iNZ
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f543a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=mJvZe0GqcyW80rR8KUMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=M-Yerj1wOn-OpK7r_3ei:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: b5V96pLfndOIrtTqWalXUUiAPp8b7iNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NCBTYWx0ZWRfX34QoQ4aC62e8
 iXdvr9QprcqHIfoyS1aAnH3rE3xU+KQcfq441nt+M6FJIFac+B/yusIXuC+Ak4+QWi1XPWp69o/
 nSl6FGEWl0XH3digsx5DMaRyqSNHYS4fSVnuW38wjyrpj05kq+dGdNWwy2vS0bNSBxWKJKjIojk
 J5NpGKTlUHP6fgq6P5Te7Lx/pHfnh2+70xHQJKO7q+UNCuJctME+seoLCBO32C9K+qTo3Klm8/t
 hPTh9+Te1Ezc4qAIlsLTx8R4V4tb6IJrDUcb+Bd+bCXBcdeWqPBvN+82qmKu/zgt58jHwUafsUD
 z3vJ1HEb/Wy8kKK5FivSdTl1wyuHJfImxF2ErwEuueE2aS6zN8LUu9XyCx55f4KKt9bXGdLMWCx
 03sFuX1UBDhVlBxZLUCh9pGZ2nRuehi4KHbxSYSNX6z53KAPm22Gnk2egnJ2aMamxBF5RzmADR/
 N3xs02lok0oB9ZOkU4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200084

> ________________________________
> From: Paul Menzel <pmenzel@molgen.mpg.de>
> Sent: 17 December 2025 19:44
> To: Vivek Sahu <vivesahu@qti.qualcomm.com>
> Cc: Marcel Holtmann <marcel@holtmann.org>; Luiz Augusto von Dentz <luiz.dentz@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Balakrishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Rocky Liao (QUIC) <quic_rjliao@quicinc.com>; Mohammed Sameer Mulla (QUIC) <quic_mohamull@quicinc.com>; Harish Bandi (QUIC) <quic_hbandi@quicinc.com>; linux-bluetooth@vger.kernel.org <linux-bluetooth@vger.kernel.org>; devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>
> Subject: Re: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible string "qcom,qcc2072-bt" to yaml file.
>
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
>
> Dear Vivek,
>
>
> Thank you for your patch. The formatting is off, and the summary/title
> (subject) has two statements – look yourself in the archive [1]. Also
> the prefix seems wrong.
>
> Am 17.12.25 um 12:28 schrieb Vivek Kumar Sahu:
>> Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
> Please elaborate by giving more context, why it is compatible, and I’d
> like to see how you tested this.

The compatible string "qcom,qcc2072-bt" is defined in target dtsi file 
and it was tested on the hardware. The corresponding target specific 
dtsi file is currently merged in downstream.

>
>> ---
>>    .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml    | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 6353a336f382..197248d6f7b8 100644
>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> @@ -28,6 +28,7 @@ properties:
>>          - qcom,wcn6750-bt
>>          - qcom,wcn6855-bt
>>          - qcom,wcn7850-bt
>> +      - qcom,qcc2072-bt
> Lacking more lines, I am not certain, but I maybe this should be sorted.
I'll address it in next patch of this commit.
>
>>      enable-gpios:
>>        maxItems: 1
>
> Kind regards,
>
> Paul
>
>
> [1]:
> https://lore.kernel.org/all/20251217112850.520572-1-vivesahu@qti.qualcomm.com/

