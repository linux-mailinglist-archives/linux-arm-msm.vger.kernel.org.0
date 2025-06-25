Return-Path: <linux-arm-msm+bounces-62446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92FAE826D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 359FE1745B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494A125E828;
	Wed, 25 Jun 2025 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtQcZSTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89925DAF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853703; cv=none; b=TXk4cpEFlBaBX2x7Eq45YJnlzhP2J5xizDX2hJv9xAgSOG2n8Flgw1kh8s4mjImBDcsxt5bL/YwdWhiZMYOHOMFgTEkMOroXls4DpwN994sr+ZlwoWNgc157NpyNAyRTkdMPOd7Yq5BPJombCsKIskt+k95OeRuL3pVp1gPc3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853703; c=relaxed/simple;
	bh=BstwL6Lomg7h/FYZhuoW1Yju3H4iRMB3OKjgatbUJ3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AaQiH7AuxiivGksvO4O+2PDWyCNuB9iOMusFDWNB1hlj9HONez2+i2+YF07ytrPz4cQJVDCVSCv3I/fmFgJLmAKR9EWGuz7CdKF1KU3e34wWEr4TF0ow8GiYGVCBI+YAxlYKSmZFn5Hnta98RTUdv1yiFvqUorccXhu1Gi52c+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtQcZSTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P47hTX021079
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1gfzAeFtKqZIDDDtaPRRz5e9GMjTtPvXyVmnuqxQGU=; b=EtQcZSTztSRJXn5a
	laHE6wOQWmi7B1EmsIVw/UsX1VQu0Doumpv20ZAQMBQiinVyY3OS3Lcknyyvm2SE
	uutWc5ASA7rrp3KqhUUseYazm62o/692VUdCwDFlcQYvc+Ej8rXq9S/G/UgWZPlw
	0XruIvrTb7JCc9kq5HS7yotXAzgEGLJvGrn0J7Kqm3PXFjx8fRMgQDA8RC4HqG/0
	0rMwehEvC7dYuoCc+S8vTIpyRjnEQfExGLbhechktPPA39ayfL/E04t9Br+dyE5/
	2wDur+P0Qm9lhcpgO+xyHK2IxaKtzf4GaGFUYBCQM50q7hC9gtFjYAxgDbKtS0w7
	qlHeRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3ymv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:15:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so89138985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853699; x=1751458499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1gfzAeFtKqZIDDDtaPRRz5e9GMjTtPvXyVmnuqxQGU=;
        b=TVlOCSoiWzo9j86LfhtvtA6DYquM3IRlZsqpU72mnHfL/tNKFrLcIdSpT24vcI8CHg
         VjDY2Bky6xmxPYiIzkxP4uEBde7R6TeNWQ+hxA38uuSFmRs/a5QN0cd1NGXpa0s7jj4j
         IQeUCcnOHZpLH5AV/eaDTcN5IGHYXznkZovGq5BGY03jsEjYVD+kc8wKUyGE9fXPAPMv
         Q4LbwY3dUZrHazHWlVk14Xrmgoj1JmO7f2mE/cobNcuPdS3syGs8WUFxx4pkI0qq+9Bb
         bEmHkv7e3Bv9F1e5ZwJOAP8LjtnoZM7J34/klQROfRtXzvCKXqAYW3vyNS5xmBtw32CL
         XpzQ==
X-Gm-Message-State: AOJu0YyzYhl8rHbreg0Flf3qFyJ6Uu9Q61L7HVXTW3BZCsWuhX/EIHmM
	Acv2rCZIA05bN8abkmbldpKnxjuVBwjWJz6fbGSTHPWf/C5jlaAj2tUgANClgLWlHun8Ip1NBVJ
	lMOVBA8VAB/L0kjFeIqmsm7zsxnDKglUdqWoCAnZuJh91f5o0+FPy7oz9VySYiDZlVkL8kuowLZ
	DV
X-Gm-Gg: ASbGnctZoPcDlg3A22Qf41rtPGYazT6FhjFooZWrrO0ZdUPzrDYKh8Apz/Ufpjmw5u0
	wt+ETc43lEYlFixM3a9n/cOJnvrFB2mi41SXm7WzJ6+Y6F5ZfqUCFY6k2n2yMah74r7FJYRSiSn
	aZyJNYE4rjOuY3/YBMCyyX9W0gzpY+mupN23dXLMgurKM8CzPXvjoPc15Pr+FTRgG/p5F7ySxga
	qsde16yBVpsLjTNF/Bp7ZivOQVW2zWZ4/C84l2XLUPAjFbjgwDUHnusUuzez8pB3rfvMvB9V/Cz
	hDu/bACC8I+FvvYEkn8Xn/cakoqe4CTFfBKM7tLQ9Zk+QzCN5hFA5NboQXo0X9fAOHdgjZuy5QY
	B+gU=
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr131707885a.6.1750853699424;
        Wed, 25 Jun 2025 05:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZq2S+jTksBRqpXBDAQ+dq49dxghyHxfABwCdBE4cKnYNFStTwAfphTFb+AxDCbzEKcboAQ==
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr131705985a.6.1750853698953;
        Wed, 25 Jun 2025 05:14:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ae978180sm262145166b.46.2025.06.25.05.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:14:58 -0700 (PDT)
Message-ID: <da6daf53-11de-4ca1-892d-73754adb435f@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:14:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
 <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
 <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5MCBTYWx0ZWRfXx6E9opO7FvbK
 7CpSftSPP5VWvZObHZxa9PR8V/ay9YKmFu/e1LgXbd5KrWdKv/3NrDth8BcmeyzwrJomyqzgKkC
 JkS0cJ8gF44nRpqJ0oVz+t86koCXYR9E29YyZ2D2gBoFYpP1lL+grmELAlgnN6eek7XrsZw3f84
 GvHAI5j4K+F1/xlm+3gejVH0lmODHNfQv9hSAlXPNnj9bjS+fCgGRQHZgkuJrYhAssq9o/4j9yq
 AVit4qqi96aYzapKuo9dz878BMNTYtuDshyOdp3u72MVHLPI9AVUJ1DEZNa3vk9h1ukgROhAQHF
 srOTwDSVtnBiI5uxYPHoV0VF5rO9rnaRSOpANtMBJiCakvM5PeZ/hUcQsUBW2yioCs54hwWaLcE
 oRFx05dljcJPRdwc12bIm5bN1ZS7o2ISGRyPv7OCXdfU1Yg9BKFeG2bYbWQyiOLXy/2jiYtW
X-Proofpoint-ORIG-GUID: 23I509FEF4FDFqUD0mCn86BKuAXWX4AB
X-Proofpoint-GUID: 23I509FEF4FDFqUD0mCn86BKuAXWX4AB
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685be845 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hHLQ3m-ZY_siiFXIcXAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=686 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250090

On 6/25/25 7:55 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/24/2025 8:08 PM, Konrad Dybcio wrote:
>> On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
>>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>>> first SE, which supports a 4-wire UART configuration suitable for
>>> applications such as HS-UART.
>>>
>>> Note that the required initialization for this SE is not handled by the
>>> bootloader. Therefore, add the SE node in the device tree but keep it
>>> disabled. Enable it once Linux gains support for configuring the SE,
>>> allowing to use in relevant RDPs.
>> Do you mean fw loading support?
> 
> SE0 is minicore, so we don't need to load the FW. But apart from FW , protocol specific configurations to be done in the SE's Image Configuration registers, which is taken care in the patch[1]
> 
> [1] [PATCH v5 0/5] Add support to load QUP SE firmware from <https://lore.kernel.org/linux-arm-msm/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/T/#m37a6b739c66040cde5b6b0121a03da7ea6715842>

I've heard the 'minicore' or similar name before.. how does it differ
from a "normal" SE? (+Mukesh & Viken)

Konrad

