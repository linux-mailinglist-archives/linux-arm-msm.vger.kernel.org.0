Return-Path: <linux-arm-msm+bounces-78384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8DBFD7D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19E474F6BD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC8D23958D;
	Wed, 22 Oct 2025 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obU51Yg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2706B246764
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152413; cv=none; b=aJTI21Agqcm39g4/peZ3MVQTBwI1yjwyroCnS57TJTh82J4oTN9cAsU5kDLyARkPypa0Rb4bxER4ZM+dgJg8erHMBaAT/9PwEGSFRu/aHKh/bglSh6rwUfRJeqT+DHJ/QKRzRDV7eie67YQB5ubkwbX6mXEggF36dRZDfJ4aoHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152413; c=relaxed/simple;
	bh=d0FaEugcyz+mcWUvpZbnDCiAz5LX94+BqS7F+b67vYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcXYbCVHhY0SRCb+a+bt0ZDD6PVjXcVvSGmsNgt0Ot17Li5HTiHPQtSrNknXTImd9raC2UooHXfldxS7YoxeTBV7GN93JO7FUuI53OKrPwgkeeAkaoackcfRKcJ2dyx/QYI9Fjb3aFoiIqHGUrHdZ1dIYz/MME8xHif1xa8eNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obU51Yg0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MF6VkB012419
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrnnrZ55Fby43d0eVBtuLjCArdYalb05Hj84nL88vGA=; b=obU51Yg00K2aEXnl
	p09wDX5p1u/ITgB0b+RUbklyfcC8WbxvM0vVBIJUTDtERKDgjfcCqdf+PosOumkE
	47KBTMbVibalqqmyJeG9Cxu8XiOCplIiZXg1+xOGGKliRf4oYIjDVarj0gZ5QNf8
	0g1jKJQL6Mmg9LrPEvdQb95YOH5KzI1aVssPWpap+8u0+54k3UIO5rqQQ0f4f0F7
	X81B/gF4Lq+dLILVxE1OnuAtA3cs8uT9z462hARIgCr6VUYselAwH/oN4L61mP7f
	2gaqxVx4gas9r+UZScw1kmx86hno0QIzybdapm9KnJxFPjl7ogEfCPeioBlzS0vn
	TrPDSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0k9sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:00:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e886630291so4153161cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761152410; x=1761757210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrnnrZ55Fby43d0eVBtuLjCArdYalb05Hj84nL88vGA=;
        b=V5Ui47rLlLX3TEjIg5AND4hjzTX6smH2YZoIMxXa7O7Zxp5KAZcSxdQcg7/wh3UuSj
         z7BDpdC9X5DmgRASVqez3Oa3FKZXUxA4QT2vNtkMpaIHfAFOwE0Fh97pIzZWsfaQ6LKD
         TajfO/PauTElvP9v2WNbOwrSYu4wHCyqtgwVH7I8JZCGREMQTs1YJitXFu6iJlY6yBm8
         vggs8Mld3XnpiVycR55poUv+N1JGTXnIFO4XWpSwX+J6xsU3kOLwTUUOyD0euDEVbDrc
         OzhyNieCcSiM68B57kH/qRjHrlZJEAJtq2UeKY5lF+8tTF9X2FyB4w0X3l4dePPPnkFd
         m2ow==
X-Forwarded-Encrypted: i=1; AJvYcCUTwLmPMB+kLHJ35O8IVHAGm7m5M7fvOB+MCugMPDKXKWjM2pI4r5EacM5RIPzYxZ/l58aa+rfURSIf+kph@vger.kernel.org
X-Gm-Message-State: AOJu0Yx56vMTY89xaduI2SPxk8Fb+uGGf2MRozwLIN9ozxnif46Pwn4l
	LIDw8Uj71v0tYfJa/9pr0F8wEkS4V7OoXSUzl0kx7P5HTIShfRG3vHq23U4erNj1apLKORja5Tw
	HdAhjJ1T5BicXJSKCuS18zz3R4Sf0M78eC0amN8mmoELc4XItpvPbgEbu8lfdZNJYsSHc
X-Gm-Gg: ASbGncuiH4uLfQXHcMTABzxXAj/M5L7OYXTxVclF3b9iTkdaR0wTNkP6It4bcDD5fjP
	dCKRGQaSFLK9lrMWRR1o+wrPQS/vQOb3j1YfJ190OZ0FjRGmbldiduKqU1iNpVAlR10W1Qs7fVx
	zuKAYrX68puUcicyOS9X6P0rIPRQ4V4xsz9yo3yY6finiCissF0KR5rZGoW9pAesI+ZlndJxROX
	qdrfX/BU670DfjtOfU5NqG8vVq4PNgKrc03NJEw3OKGtLrAvVu+iorjTSp3kBWB5F6Y1pXE1wst
	VLUbrcg1sNT0MBydNyNzLonzNTHidQDD/2hG21N0wF+2FHNnp6QVF/hzEs66OkOMYRmiuDAeapZ
	F+SPFtppBpB5xqSAHJ58P821mw9jNUPt5WVfh0FaDUdxzsE4XDSmomBEx
X-Received: by 2002:ac8:5f92:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ea116854c9mr64095341cf.2.1761152409528;
        Wed, 22 Oct 2025 10:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQUFwRLBSU0Bj9Ad35drvIBT7nnB7O8zLCAvqfWRt+7y0Y2eQF1SsS1fQrrvvKF+FtFsKFpw==
X-Received: by 2002:ac8:5f92:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ea116854c9mr64094571cf.2.1761152408650;
        Wed, 22 Oct 2025 10:00:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb52621csm1379069566b.59.2025.10.22.10.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:00:08 -0700 (PDT)
Message-ID: <be816a6d-c4e6-4cf1-b5dd-fd59515a42ef@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to
 QUPv3 nodes
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
 <9b887bc5-eaa4-4271-8770-3458efb528bf@oss.qualcomm.com>
 <f016d47f-919c-2944-ab8f-68e450e5836a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f016d47f-919c-2944-ab8f-68e450e5836a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX5Rl5UPApULpP
 6PsluNU+9szZ2oAf1mSzsNMn+PeW9HKbs6DRh4yrmij7rmCnkZwu6634VGYTwNf4Z9FSlmNIRo/
 o5O51H9NKbZaQJRjVRODTxVSdfT6HIbOrn7nyEIvIhQDK3+dWx3ADlFa9sTiFpG+wsSWngh20mx
 iMrAyVz+IPrm4vfiDD+CB5imyKn7qggHkxptS6D0322tVkRH/XHjv5w/BYCwoHtcQgoDcTbBa06
 /zTLQ5ECiWaBAurBxR5bzeztx1Jn5CfKNX5/RaD7Ktejtb8ORD2RxBI06hDYlByGfb3e0xkWuGS
 BJS1L/oz4dUTbdokCb68bIUZx2qgeTbhcdTaF1+cb92kF21RAGByKY/M9wME3KUfMYsySEAcgHE
 VcbTsCpXVCOsk+8J8EmxCk+U90RmkQ==
X-Proofpoint-ORIG-GUID: ufMIqlCmhLDJFNWh_Np-Ok746r3i9gia
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f90d9b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jWXY1GJHB-k3Q3zv3vIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ufMIqlCmhLDJFNWh_Np-Ok746r3i9gia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 9/26/25 8:43 AM, Viken Dadhaniya wrote:
> 
> 
> On 9/25/2025 2:22 PM, Konrad Dybcio wrote:
>> On 9/25/25 6:26 AM, Viken Dadhaniya wrote:
>>> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
>>> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
>>> ensures secure SE assignment and access control, it limits flexibility for
>>> developers who need to enable various protocols on different SEs.
>>>
>>> Add the firmware-name property to QUPv3 nodes in the device tree to enable
>>> firmware loading from the Linux environment. Handle SE assignments and
>>> access control permissions directly within Linux, removing the dependency
>>> on TrustZone.
>>>
>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>> ---
>>
>> Viken, you've posted a lot of patches like these lately for
>> specific boards.
>>
>> Should we instead push this to the SoC DTSI, to limit the boilerplate?
> 
> The firmware load from Linux feature is applicable only to devkit boards
> (RB3 Gen2 and EVK), and therefore, it is being added exclusively to the
> board-specific device tree files.

Do we expect GENI_SE_INVALID_PROTO to ever show up on hardware that
can't make use of fw loading though?

>> If I recall correctly, you said these ELFs are not vendor-signed, so
>> it should be OK to have them be assigned globally
>>
> 
> This feature is intended solely for use with the development kit and is not
> intended for commercialization. Therefore, vendor sign-off is currently not
> applicable.

Well you conveniently never really mentioned this in the driver patchset..

Konrad

