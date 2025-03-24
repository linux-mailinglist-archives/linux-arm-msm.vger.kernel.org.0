Return-Path: <linux-arm-msm+bounces-52390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93FA6E3B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7DB0188D08C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 19:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F33919E7F8;
	Mon, 24 Mar 2025 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XU6m82Rb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C18199E88
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 19:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742845163; cv=none; b=dSoE98kkuHJHig35IyMaV4kgMp2p6mQRN+YsAYOzYpFm0rda2DqonyXgwe5q5mSBXC3XWK1FY3QT+dipjtDlYwiA7XQhk8DS/VnXo3ZDpD8ORUV9TzZeQ/GXLw/JmT3CzHum0c5/VdeziQDSloxLOa+3JXCgWiLtW7BktiQtul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742845163; c=relaxed/simple;
	bh=XU+3ff2wCDPJCiDraMaKy0/I/DEH24hGfBmOFOZn45g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YF8bHt4JDxHhoPUNG5hOBvZRcgU+mv8Osfc56rsk28VSWi9HQBEJEOxNANWYgrpc2/qZHPnIIfaDIV899MyVEogLR4nOmC5UWjtk9EHp2jKu4w66Ptd49NjEZzcAseA2/oCTJqpbkxnp/ovWd8q7STJA/1uOi1gKrwaujOO1nIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XU6m82Rb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9Pcp2022155
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 19:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aq9nswubh4CvJAyZ9x8Ivp0JYqniIFdvl4igqnNOPXc=; b=XU6m82Rbcvg6Iklt
	ecNNzMlshf73nEnPd22llaFTpdEtm0b7LIuMomZwEa0DtqCGp/6GeZJ7rbl3BpI8
	SL2qdSeAaSPqCuSpIhY2dSM1t77gYKJRaLIlHxArKmE/TFBoRit6ttbd2x05tSHj
	2xwOuEbvc21HcKbqtdUWB9LQKEdMmvZe9Vg1ApXT3nThHSK3atPeQPA7pG1mpCHW
	2XXM0eBk+Ed4N2BF1Kv9I9qPv4g/OleqULgOROT5E3KNyRvbkMBGNWIATQ5dPcN2
	Y2BaStsg6pvjEorTJf7DuPYRLrSKiYHs1hsP8dhztnOl3tCGTQXqetN/DVhygdL4
	ckpDjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpcp5ae6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 19:39:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476695e930bso4748071cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 12:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845160; x=1743449960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq9nswubh4CvJAyZ9x8Ivp0JYqniIFdvl4igqnNOPXc=;
        b=DyjxKD+dBCa+Bcddt+/Q6G6b2fnG5EZParDkv8YXi5kc8o3WCsQoQJ8h6UJwZenjJB
         HQGJ7qeUYH4TpMS+SM81kBkKIzXLly9fiQYvtfRvm7ce4z2yJR5k1F5tNFi2puUlqw/U
         r3KR8JseyxZC2w1PH/bN6g6bo0JVGleuIaoTy4Cw+eiEYQ/PqEyeQSxI8ZDNTJjbZY4c
         Ti0eTmlLM0UVgKqF3F9fKtX0IA6dfMVjqH1g6oehBrr2V+NXznF/XU3fgZVQf/Gph/R7
         eV4Mf06ZXlDEHndsgWJrOl+k7lzg+VQuWfs1IT9Xdw2L82/IOVSFegEmAbMO+O9OIAm/
         SD3g==
X-Gm-Message-State: AOJu0YzfYuj9hCY+ysBH1+D4NtmpYyrWf73WCO45DpmwOTAfeRy3GFAi
	Db+g/Hn2m87xW0TyyehAmugySxrRaUt6uO8aqcttGbd4rUPtf6xay+w/ZcMIHGwZL1bYISGhO7x
	s0QeWJvBeTeonSf2hVDZmlrzstQCr/iQHJ1qBcqqySUVqHsQYCsKiTVCpXNbH/u/B
X-Gm-Gg: ASbGncvKsOjlOUYXUCrPAkBE2Y5yJRvfigtD7xeB5J5RDVMPEQdhzOz0iVhhpYwRmzQ
	6Yn9GYWI482/TZmiwUoHwVr4AIhn8TF9HWxG9E6rvNV730LFtUdQmlJzTBCOKfyjbg8MBiPv9F7
	hP1eBTJQ+yExhe/zI9TTTXAfvbVIaKySGHP9izNnM2R0hnLXv00ILUaCh55gyod/jkHp4H5ezW4
	rE/ev1vy3NySkuJppbP8WLmZjBYWK2uEZl2y94hh3+sccmC9PvCebKh7jYQA2u1lyjnFVa0Nrro
	aVvVKHnRqCwy4JLq6KIh/T5MPkhxGZdUjeT89EVdSSwWUp9wWQHZmQ46IvIrkPAie6FcsA==
X-Received: by 2002:ac8:5890:0:b0:474:e664:691b with SMTP id d75a77b69052e-4771dd87882mr89906111cf.8.1742845160061;
        Mon, 24 Mar 2025 12:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHviieFK1EfENsl4a9Pml/b1ejxCDE5UyK/0Ef2r/1I9kvIRSgTlksPYavU5w4Abz1YKLR2A==
X-Received: by 2002:ac8:5890:0:b0:474:e664:691b with SMTP id d75a77b69052e-4771dd87882mr89905691cf.8.1742845159499;
        Mon, 24 Mar 2025 12:39:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf687fbsm6561703a12.4.2025.03.24.12.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:39:19 -0700 (PDT)
Message-ID: <8ed64d8e-40f7-4a2f-a758-10ac5f08254c@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 20:39:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: ipq5018: Enable PCIe
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        20250317100029.881286-2-quic_varada@quicinc.com,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-6-b7d659a76205@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250321-ipq5018-pcie-v6-6-b7d659a76205@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nDw-EN1tGiqVyPqiRKtBi_An7YutRyRV
X-Proofpoint-ORIG-GUID: nDw-EN1tGiqVyPqiRKtBi_An7YutRyRV
X-Authority-Analysis: v=2.4 cv=PLYP+eqC c=1 sm=1 tr=0 ts=67e1b4e9 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=QQJSiojk9BBBe0YzEv4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=527 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240140

On 3/21/25 1:14 PM, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 432-c2.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

