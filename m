Return-Path: <linux-arm-msm+bounces-80107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54CC2BDBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 13:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D513B7B96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 12:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DCD30BBAE;
	Mon,  3 Nov 2025 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjNHrobc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPLGQUWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311B1F4289
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762174348; cv=none; b=XUxcf0GoI+KlNwELYP72WApB5L+KWtsceuImMy8Z9exFetmObGJ4W0w1xaGy2fwSqsULUA8HPlLrvzEujUNDWnsAGS0tqt0IHc7EMYukajf4ZYu4zQdO4HGLoh7DMBoti/KfhfhVkk290b1cCk+14feZ0mSjH1EfABqo++MMbow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762174348; c=relaxed/simple;
	bh=heVAq7NCx/flJlCN3TIsR27SjYV1cMhTibQl46WN3DI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQT11s/vjnuBfQHH6kGDgj/8GInhMWG/X+6UeFH28trvrsS01cFZwGMlJlPQQXYNgmFulHrxx4RtKivW3Wyljh4gIV1WQBkfYAjgHXZtmw7SQ+FcM2D0KHmvuZ5R0r+oAemtR5UZGCuGWBz0lJqjZxQpSHX/gr4dMZfOeHloWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjNHrobc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPLGQUWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36CFeE2270121
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 12:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufSdN2+C3wMkejSn2sfN2kc8G6SjeNpP9Coln28UADQ=; b=cjNHrobcZ0S+IcWX
	/jNdPaPmbTOxe3Rf0Lra2hCKyLhfU4PkRLH+AvzBSDW114g1m4hkqZ4ya2LrRLjU
	63RzDLutj9I/MoeLYFESF5qcYPAlgZlq7UCja7T2Xx49wv5FM7ywtVgXq4zum7mc
	Ataajo1tXUE4WAErU4xnO9GIaI6qkTB/6jLY4ld5IXoBXc5/S5APb/NW8eIu9otP
	fgQJPAKreI9D3u6WuHAFLobYvLwpu8FfPsywScv+L2sSQ+19JrWcEzrTiurJZQcX
	LyCF2lspKQBVmhgiKQ8hGEoo5AasOVKNZDJ3znp2S8Z0R59ssdDnVH8GUlwnY5Gg
	++Jj9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwah4uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 12:52:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb9cfa1b72so18334021cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 04:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762174345; x=1762779145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufSdN2+C3wMkejSn2sfN2kc8G6SjeNpP9Coln28UADQ=;
        b=fPLGQUWIWDGyKfIx8mBqZ7tlYzBjOUsVJ8j34naWIuef4l5Eb8TIXrIBNTCePKbnU4
         hX1J0Q1ORAz7/ZYmwYcq008fSyZCD2CmqMQgfcYEAMVfN4/qRnWVlxBOLVJetWOGhsNP
         NRe9YAnkbV8RPbPSnWByeFw91+gH5PVIbB7tad9gymaFPSFgreUre8NKsC1KeXa9xHeV
         hyNKrRmsxNMtQwbQzd/sVrXBEfAxPk0ker8u0xVBFihFNYRi+gf+6gvz864kpt3Rjl2n
         0vKvnuYH3Gsm4Ggq+lTBN3tRQ11BuHGRssi5Zn5a5YWTnE7s5lXmcvQ7IrQjx9EBg1yo
         Rt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762174345; x=1762779145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufSdN2+C3wMkejSn2sfN2kc8G6SjeNpP9Coln28UADQ=;
        b=jkI72x/qe2/jfA8zMkEqk/cRLDH42QDYk3aJ46jgp8nHlCr6qHQXL5PeUT4Eh50JOG
         z8wvd54lJ/kbBkuvF3lQqdReA4gunWR6p+5Qi1VF/7zwjn69NpbswWSXfzQqDdhE/G7R
         O2xwk0dKfWk8Oz1h9WsfSVDIqfgTd8i+G2uWPjOpwNA13BKPKu1g5irNMWqqR1sLr+yX
         sW8ESWu25HMSZ/HjAep5p/k7jLNnP+8O5FtR6DZJPDPaLs69nTx0c0LLQM9QHI1BY1KK
         ciiXNmWR/S/nxJtmYOw7yPV9FDU//8PaVcZEov3lljEuxPwvfSE9ccvAxm/PcJfoYipW
         s00g==
X-Gm-Message-State: AOJu0YwjHpU01H32BXzpUbbbMdYMTIjk3PEt9FKIBXfhwzfIQQb3cBTH
	YHLTSczi4HSKZbijiqdKlV5UDE/NvYi6WYXWiM11AqCeAvg4EGM5oLfO9S1zW20qBRAK1bZp2xY
	c8AS7+mXWadq9CCz4Y24Aw8h5hqAA0EU1dEXzdJeTr5viSDH9Eu5Zk2qtZ3QwtKCcmLRr
X-Gm-Gg: ASbGncvECFoezCei0sFSoHsPexxuruqUiH8E9dtBcetYSx52FGZzWCfc5+Pe+PeSM35
	A6T04NSflYgx1mddjd6PQWkHMEosKMSicgzq/W6rdkTDzN44HyVoy6dvpu3geoWoUQW1X7E+Om/
	qwXEglbO5BUloCP96UWnxTvZeBKbECIrmf6JDK6atmt4PzBt+i1KHNdQ5RAdMuzJGktArUE9Dnc
	2/Pq7Ya5hTW7j0gxnqJEZDVSmTbnbv2Fo+aDN3J0ajidubCx5reHmOaZLEMBeGTDpYqXxdGEUHH
	QSCDbNsJ/R+Z2hpH3vH6X7lwFtVK7zt7ddeq8p5uGj65u4qVhcxdwT7L5B4JDRrVCono7vM3oiQ
	0me0qNRPGpjH+HFzvS409bC1gZmSM/udXFpgcFcex5TxCJ+yNloYq6sky
X-Received: by 2002:a05:622a:835c:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ed30f7f5bbmr90085481cf.9.1762174344774;
        Mon, 03 Nov 2025 04:52:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQK6aZxb1evMm9CSUc6V/nzcWHXNYMRxGxQJOJEOdgSqxZTkvtNL9OfqFSj74zG4eUWypUTQ==
X-Received: by 2002:a05:622a:835c:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ed30f7f5bbmr90085241cf.9.1762174344325;
        Mon, 03 Nov 2025 04:52:24 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70ada0c289sm513580566b.3.2025.11.03.04.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:52:23 -0800 (PST)
Message-ID: <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:52:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=6908a589 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=ITMobWRzqwyUaGoyGfYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: yD8qg-FmJDrrXNgHfeXt2PMUAmJJUYIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExNyBTYWx0ZWRfX4vyNbhuyuFjS
 cWyuDN96IisEvUdupyKMgHOjQR/oc+WhIfUEOlPBByjXbaylYk4X09ohhBukM/8Nusgogb/N0NY
 CJ/T3o9WU6LQpuHvjpgp+VY7pUSNog9Svypl1LEOIRrhQGkS+Ul8YMtX0KdXqGBUWat6/NdYjiK
 g9eyS+SKjZT6h+yxlZtXm9MgLT25fy7ROYRRwqbf+fQ/kyEx/rrW7POdnCh3Gpcd/ZwDlLX47WM
 0T2e0IkQh+8W5EFS0Mo9e9AM5X5Y/jCJ4Pb/PxRpiMHnhjuz1mXT182Erx+L8jkoROUW82H5VdD
 XHlX4EIN0e44seut75BxUwhObLxiCT0EqT4jD0qcdYL46kVMvykCfeJAsutar2exddAru4coj2+
 eqOBOSZAn703JW3Up9fJI0WXLVuYbg==
X-Proofpoint-GUID: yD8qg-FmJDrrXNgHfeXt2PMUAmJJUYIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030117

On 10/31/25 12:30 PM, Nickolay Goppen wrote:
> 
> 24.10.2025 16:58, Nickolay Goppen пишет:
>>
>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>> In order to enable CDSP support for SDM660 SoC:
>>>>   * add shared memory p2p nodes for CDSP
>>>>   * add CDSP-specific smmu node
>>>>   * add CDSP peripheral image loader node
>>>>
>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>> cdsp_region, which is also larger in size.
>>>>
>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>> related nodes and add buffer_mem back.
>>>>
>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>> ---
>>> [...]
>>>
>>>> +            label = "turing";
>>> "cdsp"
>> Ok, I'll change this in the next revision.
>>>> +            mboxes = <&apcs_glb 29>;
>>>> +            qcom,remote-pid = <5>;
>>>> +
>>>> +            fastrpc {
>>>> +                compatible = "qcom,fastrpc";
>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>> +                label = "cdsp";
>>>> +                qcom,non-secure-domain;
>>> This shouldn't matter, both a secure and a non-secure device is
>>> created for CDSP
>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
> Is this property not neccessary anymore?

+Srini?

Konrad

