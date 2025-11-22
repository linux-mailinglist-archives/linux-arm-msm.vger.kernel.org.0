Return-Path: <linux-arm-msm+bounces-82975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8869C7D1EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80FF44E061F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 13:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BE8220687;
	Sat, 22 Nov 2025 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oikzx43I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpXLUfaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F0117555
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819762; cv=none; b=RlaVa3cn1oVH7UReezJcL73Mel5cdCwLq2Vl8ikwS22BmX5Q0FrSzjT6sSF6eFjmQGn4H+BDTp4Pt1kcT238onjP22/mXLunkzWCrqg14TNo/XRyc1lNbRJCr61T5/Pu45ydluKewlkzZFVIVOdSDfw6/xJmTUrC4acHQqXpMqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819762; c=relaxed/simple;
	bh=OMkrdbTwEAyXzEnIeLNxg6LxvDzp8j3ZTyYVqmcggb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4Mo7D6j+QsKjYP3yHLmOXHpyNEKR5/L0NCUvOHb+9txG0CENhiJw2rIJVXxX3N+J8Fs8iV3PYPclbS4/pf/C5isSGuRRr+HpuyrXV+dXrOIREok6VFfvcGZRV6oIvu99VdByewOcWsUItbTqWW2fD8M1ymSkP75z4GhdRmkO/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oikzx43I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpXLUfaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCbou92728909
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1OOe1X9AcAjdPSLizU3SANSr5j5zr0pJz6UYNGyGyI=; b=oikzx43IbM7CKAmU
	85AwYWFP08aLOVstfFY1+YxQ6vt2qNNtkt4fbXEcuu51vfqg6zCMO+pgcs2SD3r4
	oL59Dp7hJ1XQsAqUtZsjF2herzi27Mycws9gHM4l+ZyKVtrjmExrFv3vaG4zDK96
	Ejmha49cGt1jCARCon8pCJgR5ClySrpzzIn8BDo2BFRcYwI2DqlN/Ts/DmlHGvMT
	FCn2KXLhnERjGfV8voYU0Jp2C/2XWshEN/sarlTfE8qC2/dLfyH01VDTCZ/DvEDe
	R7BAP7JWIT6C6jCxf+aqCxS8Pq4l43Lo3axnHSMbW/+1qnRR/yg/A1+ILfERCAD/
	JplPng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691grq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:55:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2fd6ec16aso59978785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763819759; x=1764424559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1OOe1X9AcAjdPSLizU3SANSr5j5zr0pJz6UYNGyGyI=;
        b=YpXLUfaYtDIdCLBvEMryx6GwtSguNYDLRAsSVAK5foOFC5GjD1/PRPF0Rvb1Nxx88b
         8S+84qzxAi+rqtZ6MAtuRvfozPx33/xwHqnRqfy/5WiCdoS9KJUqK7vHN6zWjaAn8tMf
         gGx6AIjPc8PPQMpQ3O88adXkpVH0kBFPRwmeFyQjRnps9Ab3J45mSBTxSwGON0NuLaGw
         JeGiP+L4WOxEazvis9YRsrErO0uPGQD3tUd4IpfSGCNymsxEgopUDvvZJrEplHApzVOb
         h11Kg3Mgj7yvIPM/7KFv56pECtJseylwinNOpwRDHvDStDaeHnbufrsWowsiC6h8Q2wH
         B7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819759; x=1764424559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1OOe1X9AcAjdPSLizU3SANSr5j5zr0pJz6UYNGyGyI=;
        b=YNukRUEdEb7JuwJ9q3NCc9CQmExz0R7JsXBYW42Tuq40TCcvagi7k93WiVF0dsvfoV
         oCxWf8L+c8waUwGPzk/ErUII3l+TM8aiYrz0ny2p/PD5hwm61qwNcXWtAy62dLTchA9C
         gJf8lxgZM/C/Ehs5dH2bWb8Fk/X31RSISbHlCmm4jr59tpi7q9Qa4wTb/oWkdksJSEth
         F+tZeQfBm2Ab5XuPiX4v7fHV+h2h3hYbpH6MptOd22BODaqoHaCjKngUC81jw0l2mje6
         LQbXfkNgqw9zE3xMIcyM96KH/iSUUzl2x6IfmxAFCS3rNxzsAp0CzrihwVz8inZv+pwo
         lbXg==
X-Forwarded-Encrypted: i=1; AJvYcCUsBt7LckewGeW1xlwwvuTUVTtsBbCPv0qRnaNkgjp1naFtuDXcIAeLh6h7WMA+Iq37Nx4yGojjUqvxA2Hy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8bVdwDiFNzFL1uHxqOqpsrx/5FiCwjnmcVuS2Axv/GVbIpPc
	wQE/mqACp0dvtC8BOJlH8BJRBpwyD6km/C0/ZOnrRN3FuhInfA4mQqZyKn0NdSxZ2x/74jsLOh4
	zHo3VS4CzqPpJx/EGP6GZ1fxhasrOAd6PcaWmAokBr4shxlrGn2D6jPpqK95iHR8ArV0S
X-Gm-Gg: ASbGncundzYRDXdBLGtzl504i5ejdWTFGoRafBTIeJBMLHdZ2kNBJIJtAT+jr8WSBnN
	uv2oiCiuAGk7TnQJZH+pjdshLWWsakZxjGgByWUOHI5mQ5Q6n0pUqo1axU+YEHPtiSVBBxtHku9
	/Q6MPMri54ytzli6xCPh75CRHgrw7Qb+pXPL6iXTnD2lMXzaVZiELoph/aYVltIFUX73GchAXw2
	VXkNPhy+6+hsdvb4iTBZqR5PulpeLxGQldjxNDCGv8mg9AFphttOxf0sG+Yz89mnotWF9xzCuH9
	/4tKobNZ1LzmRA4yoRG8vQ9h8vTFLr2imEdZaPDT9y/HpBKtvO1LYMiYPIdQPPmXLORTLTF5S50
	hi98KadzgJS4FQEgw0jGRZxvkVtgA9LqxwooOlnAw2onc014imoE2UGZiSFy2YTswLEQ=
X-Received: by 2002:a05:622a:252:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee5b70f141mr49143011cf.1.1763819759176;
        Sat, 22 Nov 2025 05:55:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQnoiO79VD3idFejfcP7dPdiRk2fgiH3fSmEboyc4erh9pW4HupMZNmFBJq9UtWU7JOVfCzg==
X-Received: by 2002:a05:622a:252:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee5b70f141mr49142731cf.1.1763819758736;
        Sat, 22 Nov 2025 05:55:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43e2sm724651066b.39.2025.11.22.05.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:55:58 -0800 (PST)
Message-ID: <e177d393-de17-4bdf-a0dc-002ae5b7f58e@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:55:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=6921c0ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UG0UE7FhrI7_8MC4d9kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xcCS8hgWPMULv9deQeQkE9850GYWLZkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNCBTYWx0ZWRfXyea9L/XplsCw
 BNCvLZFkUl6uUNOM9R2wOT0yru4Zk2wHHTrvajJn6N/lm8VKpzpWlOGNUNJ6f19dTbncpRV4b5E
 Tln1cTmufB3NoVb71+9qiiaUtCYJtxWz4Xwa+kDG/lYzKvbFaCboKkoYav9yG2XBhP/n7WYO2eq
 CitWJ1yaux8uE6TyUdFvNx2vL6QNItE6cSwURinKxyxfWIlmLYAt+UCEARi0sg3z7n5vWcKbXN1
 P9COTsVzRVSE1rBuXqMqePGQFxyFs/OXqhrvECDnfhw4Qz6aB44oh//rkk33yTYs9FJB+duWXqH
 qeUu2tyI6lGD8dfDrfsKqX/bV6dgSdQiy/+Up1KPBiE3FXSrEAH0Kba5PyUzkxuxysxXjroVKUS
 yprzZctd//tbOSUCIE3Ow7o97lpsdQ==
X-Proofpoint-GUID: xcCS8hgWPMULv9deQeQkE9850GYWLZkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511220114

On 11/21/25 6:56 PM, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x2f000,

0x3d000

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

