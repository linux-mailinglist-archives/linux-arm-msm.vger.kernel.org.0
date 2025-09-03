Return-Path: <linux-arm-msm+bounces-71911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE42B42619
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 257347A77AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1B52989B4;
	Wed,  3 Sep 2025 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqYqChm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B79A296BD8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915164; cv=none; b=sezNC+9KyarfKO+NHHQT2nNUMf2QuMBEwktKZsiEjlTxh24kgMC/NM7xHV7kLDFCSs2iqjVELH4zaCQ1BNn1Pf63noJAwatppDoc9lRcrcqf+RQrWgU+Jz6ZZvgvxd7P04Jf+/yAw7xvXaoyNpZbb7NZ6x0h5vIHVj/YlzVQFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915164; c=relaxed/simple;
	bh=JNMPH5k3WcBdGHvIhwkV+wM3E5WR4tEjM8O7jMB819Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BY4n6y9qCXlTPpyq+fafsftVCNDNy1azG5a9wIB5ECvSzNryAXtpx7KzHrtdjz4KfqoW/CD08YwHqprlQeBCiSG8+1vdJcCrxzBlqRuGpvaHaRx+YsDqplbqD7UfnJwPvohUzEsmvdnx8jGpVttWUamgaDjPTIvyOpXp9FbPtiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqYqChm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx1Ch005058
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JoondHVb2/f/1ydbXUBDu0DfSCvLLfXEhj4RfdZtE60=; b=EqYqChm4V7FtJ0s2
	dC2mDVa3bh3aETlAwgSrvCJEWP+tYhRPU41BC1mYldl00uP5rOf+SM6imdLX3hO8
	iyaotOG2w1gay7YinUkAHkF5KWdBz6H+5f0lia+pSXibg9mWzmT8vdxl/3ikvOd2
	cmdvk95hb7ZVN28riyyspWzqBBZZGoeisRq6Ih3aTn3eNzUbcHDnb6+yyI46kenF
	nDEOb7lVGLvSOHqODRLf0j6O7aANS/bY3iS1X0O26/6eGctx1KyI7Dt8S4s1WKgJ
	EutSRf6QQMTHQe1meKGGSFiqVevhdMQGZThqwxlwam/ne+ynW9kndmI1uhuYaIBK
	YFAg0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s4cj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:59:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso255321cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915161; x=1757519961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JoondHVb2/f/1ydbXUBDu0DfSCvLLfXEhj4RfdZtE60=;
        b=ADnS9m0HTEX20C9iBsdlqMrDL/6JDcACy1kJhZuFrMzgKWqQDGD0sKOTlFo+kVD0Br
         1apu0kdy4mfucS7y+jghZ7fcCSFmLzJeyzAQwfvKiNVSquBjH6TXVDCn/0vE08d4UVst
         pbjuUawRZ8AJVQUvzZ8DHS3A0niWD4wK/PJ/rfezYH9HtJGpnmJj4WYHwpdbM/N+mbyy
         G2v6SKWmfemFDFGSRNjxNOguhH/kTFKFFbFizz7ZBoRjMZTQXcpoIw0LY75OucgbAPZ4
         5mhSoGmZcHigzDbrGmO1jGIgyXcnhRVk6kURZPX1b7t7+XmFG1R1dDzTFuqQ+iQHHD8h
         CgJw==
X-Gm-Message-State: AOJu0YyiJ2VFZhb3uKYci/N7heDDXn76iPHgoFB+WbxNZnXbvAZFDO71
	yzV5Gr9498XjahhSv76H8TAPl/N/ZGMTXiUOge5rC5eg/K/OTesOgQYRf21/fbkNfvLXAXaEOe0
	vZMfCieAep11rRJwyJAQZ4l2M40jrxN+0heqshPQdNXXd03FGSmh0lHx6hECcgEzlZ+BG
X-Gm-Gg: ASbGncslnCRus/9sKJxxxDRH1AYXCKmpX5E7F4nUiExihZlLJi8wf+dmpoPzMQXo1pa
	KHBCyN+L5lIU8ApFTF+fiFwZ969uiQ3auYx6iYHVo9Z8q+GRVKs/JUA4KW7K4y8pXgKvORMTYob
	v1tDuPVgXIBbyQhOcrTh5EFeGRVylEh7U2w2Qv9MJzqU8lZOhbCCOJNNv7k85jIqd+TUef8ujwN
	JVmm/+U2YoMt61h0tDRZ4XqN183wcF9rb2P/OA3XRgQ2zxZ5uz1TXg2NqZGHWEtZCwRnaRxbCNC
	1FXV0NFRChefOIRWRGuKo4+pLmSnoWH/QVjwhz1jCUQ6Ju7j47Vie/pHEOB9q8mHNq+0lcKY6ED
	+RdH65j0WqKc9AecAQ+GG+Q==
X-Received: by 2002:ac8:7d0c:0:b0:4ab:6b8c:1a41 with SMTP id d75a77b69052e-4b313e8321amr143129711cf.7.1756915161012;
        Wed, 03 Sep 2025 08:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExgTsN6zBLbfiQxn8VdgOLVcjIE+dE8RIguKNUapAfNMSnt7dg9W7Uh4W7sqhgWh6QlyYMZw==
X-Received: by 2002:ac8:7d0c:0:b0:4ab:6b8c:1a41 with SMTP id d75a77b69052e-4b313e8321amr143129451cf.7.1756915160366;
        Wed, 03 Sep 2025 08:59:20 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046c296c90sm180845666b.83.2025.09.03.08.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:59:19 -0700 (PDT)
Message-ID: <a53c6bae-710e-4939-990f-5974346f6c75@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:59:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: lemans: enable static TPDM
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX+u4uDLJh9kQO
 rAemurrXUvEWWkPZC3VhpILHmAX9E5BT8NQSuGCfy4cIaNjiGNao42aDrxZdkL/RS6I8iNreuTv
 CPGV+0ntSfyEYSdxT9sJpfMSINzJ/+7yX7lCgF/zm5xY0JisWMBFigDZBeI3/jzXDZI6bv8SE1E
 uVmv4h5LwAEcFzO53FuKM1MWF5QMBVaHr7eg2C+ehWeaxS+bL8GQvKoCuif1XXgF04GfmYq3d8S
 3q6K1FCvu4+jmPfV0rfrCPdj2X9n+fcM7SJuHTnBcRgiapdT8xISDRldT1j+HpppqJ5sXNDi8dT
 7fVdgh1JbNyll3pJyfKH6MPlC0XY2NR/Qcfrrk85+09pjgkouOFFru+EGBQg1JT69TXbG+Ipryb
 ZL25Sfvq
X-Proofpoint-GUID: DYGSILrB7lA8Gd71Syj8c1Q1aWYXROlM
X-Proofpoint-ORIG-GUID: DYGSILrB7lA8Gd71Syj8c1Q1aWYXROlM
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b865da cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_EvAq3oGWgLp-oLdTm4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 8/22/25 12:30 PM, Jie Gan wrote:
> Enable static TPDM device for lemans.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

perhaps renaming 'turing' to 'cdsp' would make things easier to
comprehend

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

