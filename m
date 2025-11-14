Return-Path: <linux-arm-msm+bounces-81921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8A4C5F72B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 23:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AB43B126B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47E532863F;
	Fri, 14 Nov 2025 22:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8O3T/Y0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgvW1MuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21536309EEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157610; cv=none; b=Yie2VFU0R0O2qZyoXBLT6awDVjGej2QQH3qxLD6ybvKz2Ri0z0gyD6+D99lGxmrvHVjcYmUThwDv11PWnzCWp+ROHQrstwZX6iNbIG90JR/w3AHCWY4D1mzxjIPuDdIN77bz/Fj5GHNFNtCEmYZqTzYzL7csWDcJLXOBMfUJvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157610; c=relaxed/simple;
	bh=r5s0GfHyjbi+M3Rf/uyY73uI4nivET7Rd7rzMr2n0ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuFndEmQL1kqXk2/jxuYO3IEfFDPb7/UW5QVG29p4kCzleSr4mPVaaib1ZYtXol9cfUwnqCZ4nD/KT9UQklghKX3r0K1IHnW5ro085iD5DBn2DSnnR+E/MdoyvsCfdoX1Em6SSece9YmtnjbFLSvDuNiiDKTLuLijKKJR7uoCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8O3T/Y0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgvW1MuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQD38446778
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dhsg9V4O2PfCtEA/vBefinsnYcE1U/mrreMf9u9w1eQ=; b=N8O3T/Y0RR9s8YvX
	wV5QwdkfqjBoxVwBwY+qvWO/gMlx8Z7IOCGumNBh6+EJTfmlPrpYcA0wfhFCHNO3
	oYnZHtStFIXffKixS2VMr2T9J4hfrqnGb95BNT7NCn2wxfXaIFJN/i/m8j05vtng
	oq60dsIwQR7jqjHAzELwrh899VajlPhLQgZHiVCUW3bZ4mBcoRRy9lhQe0Z/xH7g
	yRg7tIRDi4TnT6HdHs38mMb3jL9yXn9YlkuXKX+Fsa6NoBKIuF71v9n4fJp/061U
	E2izXNjvfBVyOMANinzLtXWuiqBSA4C93p9WHUrQkSaYPRsPgUEtk32i++9eEFVK
	XoO/rA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae7cv11sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:00:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87ff7511178so8149266d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763157607; x=1763762407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dhsg9V4O2PfCtEA/vBefinsnYcE1U/mrreMf9u9w1eQ=;
        b=MgvW1MuStcFku93Gep03K53pbR5KHmOEAuiCYtOLAkjLA8rTMDd6PoH7Lja0kguVTJ
         e3RusZEvxOfscZTtW67OAR7Bq+3wI/Gi/ih8Yq540aAT+C7akeGIIk8Jb3WF2+LoVcub
         775Fi/b8A68b59TIFMAcPRdfHNC0nEMrNIKoXcl0BxZjYB8h1g6iJwTbyjPpvRv/+wqW
         RBRUivuepXuFaAz7D4wSIn02o1uBWqyLDb8OckSz50vQHAZdrlPc7dzUxDxiziXYZ9sC
         s8Mxsv1Lqj6MlSiYlj6lmEongI0cZXX7VhY0GV3mPLhWB9oreNw5/1Zs5TDL8BOA/jQs
         GbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763157607; x=1763762407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dhsg9V4O2PfCtEA/vBefinsnYcE1U/mrreMf9u9w1eQ=;
        b=Xg4eaZ4rWX6wZFwSVBuAwB4BSZhO162Usa3aUSDouu/DN45BSRE5J0o7s3bjbBdV/Q
         0UhijUTkH9NOUqy3sqhwPFOHkPHtXhSGMZNC/8J4ywWnE4fmw0L0Dcs5/udU8HwUF+cZ
         A7qMlrW1lDJzZh8+1QrwiZb0C+ABfC3X5HNbthv3HbGt873xUCwTL9Fk/nxAfSeZiFh/
         6SWjj9/MYuKXXbdm0bsns94ypl2xs/GK4mLNndzhfYb7AW0uG+dN914WSCogatk0r9tg
         3gFCdu8trCZ4Z8l8tjKLlHLt9dnkdFtE1CtC6ew7oKik7l7PF22mRDOVNaIyoSTnkV09
         PxAg==
X-Gm-Message-State: AOJu0Yyy+1inlwEGBpAuZ3AkOpFlpGYoj0ouZXOkBSUis72cJLlIaajB
	CzLk4IUT6ncxmNXpuAH6i8HklJor7MZXmDY74tJKp94WYMe+Mamofr1zNm+nmOhhBrX6aKBOYVQ
	BhATgaOxV1t3z9aip5eknXfBGQ2BsX3yIobVcdPhPzeYqjCRN8/TP1srkFLX+ky69MVqn
X-Gm-Gg: ASbGncsxj5FAJ6V8G0U/a01Rl56yuW1V8jvKe88tVcq/H3qJ8QOzns78miQRCaUqb+t
	1+11u7AxYBtaOW0OWiyyx3+FMFXwgyEo0s6q2LJb4UJY1wpqRXO0VRQg7PSRgqK/30IJhvzDoh7
	su+48+r9GJwxG5yzRhiaEtA62F7s5qvPe72q22upDNjULKU3sIiAdnSW2rIgRKz5PPQwKPRsgPw
	MiIMWBlMNmQsYpN3nzDtHDjyavAa/Xci6FgjC/N0qX5Y0MQP0xH/h145f4v2Rh2NOQ28/+3hrnS
	W4yaKS1wv1KbvD7iTSjegouR3p6BtvV+MFajcP9yk5t5xLH3aQohgCB6EAbTFBb/jcFjLovqXhI
	JqGyeSbB7fB8LC4WXNJqpzqd9v/PRuDHVKS4wCER6aLDDhQMgsIfZSS9s
X-Received: by 2002:ac8:5888:0:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4edf35dc331mr45441401cf.3.1763157607390;
        Fri, 14 Nov 2025 14:00:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfo14dt1ip4UnFu2BOFMlQYOjuaJjdF2VfxIKRu/T8WfaaD4L+TUnaO0BZykHk+CqTg3rWCA==
X-Received: by 2002:ac8:5888:0:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4edf35dc331mr45441061cf.3.1763157606896;
        Fri, 14 Nov 2025 14:00:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm467529466b.25.2025.11.14.14.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:00:06 -0800 (PST)
Message-ID: <cf2dfdba-bb1d-4255-9db6-7aa6125265bb@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:00:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251114-enable-tpm-monaco-v1-1-4ed566838698@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-enable-tpm-monaco-v1-1-4ed566838698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O0ooKS4tJlqRpUwcIAKAj6Umow87qCsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3OSBTYWx0ZWRfXzKQWJvCPGTRT
 GdqxqmxSP22mSPDSXXKFZJeJKU1tovEt8yckRlIKswgMWgNXAOxJzPleLhqSpuqftclaUVqBg/w
 AGja77ahuxtMpMTUW8FYtmlKae/O2Nso0M8Z550e6NudW2BRyjmfJEAX3yuriwVKYSVPHQFhdeJ
 FgoJ5vQ/xxMstLYaGkZ9vkXiW9MwNgR9INLv0iEHFXmZw20PTfoc9O90TmpPG4N007/SaSyxFDj
 lISbEipKt6BXPDe7re1kVYxuUQeJBnBLGjciqxCuhZCXkkAhP50At9PR7YwMJPrd8eUv/3W6mYz
 tpjN0K1D13GI9fIMAJnPzMR4ESWUBrEQ+bu48FSl1XUPArElfyGWANVgrY+anzYa6/65W6Y5/d1
 GJL6KyhpAj4qW2TbZHHyHq/VB0/4Ww==
X-Authority-Analysis: v=2.4 cv=Y+z1cxeN c=1 sm=1 tr=0 ts=6917a667 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Snsp7wKnPOk6igoZdcEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: O0ooKS4tJlqRpUwcIAKAj6Umow87qCsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140179

On 11/14/25 11:17 AM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI10 on the Monaco IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

