Return-Path: <linux-arm-msm+bounces-81273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65790C4DDF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C84514F01CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228B53074AA;
	Tue, 11 Nov 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3Su+iTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZVXO7OZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3D23AB90
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864677; cv=none; b=D9jwfXVIFn77/06hL6v4JaIPcYWJzBwSUYZxSB4gDLVUzeE8xI/cGpDPXGB9G3KHylAr3u3JrjzIlgjvSWRYipllO2UJjxmYhDgUvAvh1/wO/wMTuVtrofTvvF2bcRztg9k4AwARQOiplQrOe5HIAPr6Igake2TcPsX+kSNCg8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864677; c=relaxed/simple;
	bh=F87/smNyR6Os8dg4MgBs0/IhscooYag0KN2o9H6aHs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TuOj+JMRv6uYL3LlKxslS6p+bBlMQ0h2igbKEKopu0In1fojBafCivLUH2O3bZLQ4A1d4/u8F6VS++TZyt0t4jEqwnSoL1bb8bWnRu+UkC5ksdPVlI8+0KYRabd2vspp9WgnX2F2RXSkx1Ue2K+E6PND9+E0ve7VMRPJ0aqwNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3Su+iTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZVXO7OZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGZNG2232089
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ia4arzq0yyKzPIBuGzO+k/lXgqxrQlfO0SI55RDLmg8=; b=d3Su+iTkvYK2ew1w
	jWBUOujSVltPgR5efWc25takI4/oTNjJ1DbVL1TQsmHoanNvuBC9T30rXEmmUSdo
	D/PkMjbh+9K3OP88QI2vIx1vhuzbxPhI25+sTVhcDJreewlJ9r+nQIHaFv4eIhoZ
	auDE3wCzFFbk7/ZEgVxstnXLxx74DuNwcoEh1H/zwnI5eimK6A/Kbe9qzpm6WF+E
	mDh1KK8Ktv8gp2TpnPktcz8+zrzEyYVY4CvZ072qd73Oco/3ROJV35nYlbpoaAOv
	XIWz/YxzFhZ9Dwg+MPMjbSp3hTNV1jdCwi6wfxUiy9rBkoQoft7aPr00jsIy3JQQ
	GzIItw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkwsayhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:37:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297ea27c814so6654505ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762864673; x=1763469473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ia4arzq0yyKzPIBuGzO+k/lXgqxrQlfO0SI55RDLmg8=;
        b=kZVXO7OZP8qtR9PF8y/Sj9FHv5rUEGwr7QLfyZhHk+/PE7LEA+GFZPYhcPQbAk7B86
         yG2kmYOtCklIO3VFm9VMFYuzGRTMReGiSdpw2eVV7HWPKLpwkZXPb/IrWS8Mqse0ISwx
         +SqhsToHZicXDWhGRzjDnIfhEJSupmMwJCShNCMZJSfVkwD4AWadcAxDuPat+qltgBjA
         fHTqlv/scLvs2gBvsee8zuspOelUQMj9PI1K8zMs5tvDhy4oWwAB+zc6JBm4MWpu5mZp
         lMqsBy3G1rqHyqM8N4DXXcqUr1AlBjQN7URppv6+5Hx/E8/sDrONDK5QZYEfDM7/feSL
         PRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762864673; x=1763469473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia4arzq0yyKzPIBuGzO+k/lXgqxrQlfO0SI55RDLmg8=;
        b=Z8tZUbdLdvWxHtrvb/Ctljh9ketBj+VS4rN4bHLzYgcRputfgaikPKvKYOduyKrhRh
         /jPApWuY+px3AUq5m1VbDOte3dVD3cU494LsqLMmstCBnBe3UDo2zAxYPoPykZ4r7pk8
         CtjKFyAkLD/e5XoBqwZe1+G/+u+qtRYuCmOu23WEe7KEj8XM4Ibm4CkCxOnUPT7jVU8k
         I/nlVfKBsXiqqamW5d11mvkN/Qg4VcYokzyloD7uDBMXP2wzD2ello7CYqiNQHaLMSDv
         AYm3cMiE7GpgAOheWc50uJyLGmIBDrwfygCTHmiFK0fVP9qj8nmZzo5Dtx9nrFfXqYgr
         ozYA==
X-Forwarded-Encrypted: i=1; AJvYcCUkskxntfmH4Bji+6tuj5VCmTiwjy2IFssYKRTLuAuhrZwnYyhTF1uAf5HW7QCAipQ3R5ws4Db69gI/3Dr3@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYr1AqAL2hgMzX/3l+VjZT7Pi70L/BK8aor81oUIffHuhF7/d
	J5usUbnJLkYs5veIr9wjcv99JIqS5yfRYMgZ6flBt9Yd82jvGudED2KU/VQ0IYrW/cPbwcWLHet
	NKV/ogTDriO8B5cogDQSCxKxLubXDlLWFAy3/P9s+05abuG48ctvE1bhUCunu6a0f++NE
X-Gm-Gg: ASbGncuraTEAgzY33ske7Wi39OecvBoN+oozh9zEDUxIVpA4SOour/iV1I5e1J43zag
	a+QeaJETOXt5FJj2MqiDJbdeuzaEE1ikuUoi9Y/q96SmzE7Gr3a52MbEEhCdE12G81C3oPMtLIc
	efKrXjMeOpa9q1TBmrz2Sv3nrI7eb2ZOPIpypho2OrAlhqyYYGjHocU/vgEB5ADKBCt+b+RVAu2
	0GYDYGOe+yGq3FZG2Qz7SyIG3+JycCWDL+/9hQXKuvBbYDFYEgnZyFfdGOU2aUpeSophZGdfDeo
	N3Waloc1J8jV6nOrncWn8ZC6ne5TiguZQLQmtfyjSi/a9e0f/hCd/9kOfPKHD3TU9cBrDqPnfkW
	rzUADG3ncYP5xEchkOmuB
X-Received: by 2002:a17:902:d490:b0:25a:4437:dbb7 with SMTP id d9443c01a7336-29840fee954mr19743465ad.4.1762864672975;
        Tue, 11 Nov 2025 04:37:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0q+p3aApFgfFXqkFESOn3QG4Gvbs1jnstOAi+s6mYdXc9o8PALRvTBIKDC6BrvFmGzWhTuw==
X-Received: by 2002:a17:902:d490:b0:25a:4437:dbb7 with SMTP id d9443c01a7336-29840fee954mr19743165ad.4.1762864672475;
        Tue, 11 Nov 2025 04:37:52 -0800 (PST)
Received: from [10.233.17.95] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccec04sm180165815ad.102.2025.11.11.04.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 04:37:52 -0800 (PST)
Message-ID: <a3d1c1f1-ef52-4c68-b3a9-8b394da32208@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:37:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
References: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
 <lr6umprjjsognsrrwaqoberofivx6redodnqwnuqtpp47axhiv@nho74vyw2p4e>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <lr6umprjjsognsrrwaqoberofivx6redodnqwnuqtpp47axhiv@nho74vyw2p4e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwMCBTYWx0ZWRfX7U8Vg+zyutSS
 h1i2AeBewFzfh3FVne3Kzz5IXVtAvJK7ElSQC0DgjWF55CxzvQtRLXetSbSJRcw7OPcOQfQk9Ij
 2+iq8tEjBCL/HQsPpevh8coD6TzKnRxna5qPO65yaXVog2epQQtoUC8Kap/rXYQf4cBOHFAHipT
 vIWxnrSM1ZR84amQoklmm9ZbPIkjHLoEaB9h7ZjO9B6xxAWVzIjUF7ivLMwXC9UYTkJ+/5DxlEu
 Ur4J1M7aBjV4gwMbjM975qt+SbJ/CDrCeamtfSu2pZKjyrRIPz+TTzzk3zSIHRMecGyNt9shuHO
 AeIdLOpUBpMG5lGpyq0QPeMSQ0kIO40Q+P4g4mFstzdtjWr2O00ZzzAdcRWFegPAeFxRPDp0XYo
 n6PZLb741DzpKiBRdS+WklIKDzYIfA==
X-Authority-Analysis: v=2.4 cv=Vosuwu2n c=1 sm=1 tr=0 ts=69132e22 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F864Gg6nNBeLBzAGB4AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: A8LjjC7qJg-NW7aRkhurpd9fwxPvrUz0
X-Proofpoint-ORIG-GUID: A8LjjC7qJg-NW7aRkhurpd9fwxPvrUz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110100

Hi Dmitry,
Thanks for your comments.

On 11/10/2025 8:39 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 10, 2025 at 11:27:09AM +0530, Wei Deng wrote:
>> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
>> Bluetooth work, we need to define the necessary device tree nodes,
>> including UART configuration and power supplies.
>>
>> Since there is no standard M.2 binding in the device tree at present,
>> the PMU is described using dedicated PMU nodes to represent the
>> internal regulators required by the module.
>>
>> The 3.3V supply for the module is assumed to come directly from the
> 
> Why do you need to assume anything?

The M.2 interface provides a 3.3V supply, which originates from the main board’s 12V rail. To represent this power hierarchy in the device tree, add a fixed 12V regulator node as the DC-IN source and link it to the 3.3V regulator node.
Will update commit message in the next patch.

> 
>> main board supply, which is 12V. To model this in the device tree, we
>> add a fixed 12V regulator node as the DC-IN source and connect it to
>> the 3.3V regulator node.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 115 ++++++++++++++++++++++++
>>  1 file changed, 115 insertions(+)
> 
> Why do you cc stable for this patch?

I will remove the Cc: stable in the next patch.

> 

-- 
Best Regards,
Wei Deng


