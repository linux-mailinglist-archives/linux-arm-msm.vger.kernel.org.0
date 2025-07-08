Return-Path: <linux-arm-msm+bounces-64039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3BAFCB2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BBD63A90EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1993D2DCBF7;
	Tue,  8 Jul 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3kZ1y6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383A2DAFAE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979596; cv=none; b=RotrPGGR+UX3fdAE1+o/wTxd5FdnEHjDh5YRlMg5gsQq8pyNJukYgzprjh32457I/ze4gOZeys4wAdh/ULp/PN0GNSVQK8Che8ei6RQJELexruq/6qHGSLgOP952vZaO6L3CP3r7ZbSlE76+mEY8KRaDISJ/7rCTmZji+CcC9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979596; c=relaxed/simple;
	bh=orTMmSyNbnUzuFP0Q7e5Izz0mU8u5v8F0gBzLpHJ0wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plJwr+h7XfUAHJupJ6HzCdYXSAtcvjgVEhPvRWtDVe7VAvvWumMG8hxzQTmJYmliFFY5ItuPriAFNaSvepEDgGRnpjmo8vtPeLK0GrMrN+/a7QCIiwTexgE75cBJcPRkVL90tw5MKJBvBV8Mno6Bij6/li+bkKDxgmX7C1VMDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3kZ1y6+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAYlm029341
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 12:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHC6JKuoqLCmEa3XL9EUZYEa6oZuv2TGka1KS57uh1o=; b=A3kZ1y6+GzGgLxfE
	teDVcTwRy7+O6oKsQ8ysmAmzskILEuqu/7lZgTrsG+BwGdvHUujbZIsTYdSVn+Eu
	Ya2FJsXNi6LrAdUCoqk0QYQrjdxBJXZKmHCLOftBqIT7MjHZQ7B0AIa3xFgMa23C
	98sqwDynDBpdeu/IVvL5Ewo2CrJkbmkWhRwAmwRTwpyB4s8+5sl3NrmglgbzKtyu
	gJJysYsKkBFo7LyIuThfIIRywm/6KTpe3F3olppKDzrYFjxWwuG+bPE3sO5F236E
	CEzlu6agR9wCLmppRxHVVCx+OWQ4IzS0ZWw84s8D1FspS1Qoya3pW+Ud3eo/UPdf
	2t4E3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xx2j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 12:59:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a78573c357so3511831cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979592; x=1752584392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHC6JKuoqLCmEa3XL9EUZYEa6oZuv2TGka1KS57uh1o=;
        b=MBX7B7TYg1m1LR+gTW4rrU3wRQm5WtC8oVOtgNYqGwHWLJullG9pvT3PJtqYZO71YQ
         e1iN+lr+mctavF4WpJ5mRz0XRaZv4VC+aYJJL5OK//Dwky4XRNB8hMbDWw9g+Nx2m/ex
         xWUzY19l1WlFrMoLF3fou2UYd7ctMXggAloJJNxA71ueGn7KMHLVWV+is/68nDOHCbJp
         P5n5i9AWKOymS/mF3usMBk/J5uqWsiRDCe8cNA0ftCM0H5Al5/WQUqO3uKNPqmA341uI
         3VrO5ig7BLpcxh6fkYnQpcM3QB+TN5BuXwXzpU99hUQF6f2Z3bCO8YnyHbZE2jdLC69f
         ycTQ==
X-Gm-Message-State: AOJu0Ywb0XDUQM0pfiiBmV0soaZVdQpRntAQtr0ey7m4cvmai4/QugMP
	cgzvqQS5EgGVsEWvwgUCg6Sw21xLWyydzBC1sTftveI4LQWDQ/d4WIpuZILF3czNVg5lkfFXgiu
	78IGVHVRj2KmQ0BXkbuSzlcIDwcHNFJQnbZl+nJ4WvI/2Bi9oX+Tm39PcqGqNZStniqE9
X-Gm-Gg: ASbGncvAEyAIjCiYYPcsZVHBLgx6bBC84JC0JQyPo4YAZ+Qq+xPqg64aj/nnPzNQzyG
	f9PeHUwz+ZK7fxLGaULIC62SW5fIj4umT7GrJ4ge/BucH/qJ3E4ZXSUT1ez6FyGWmksvKbRIK4V
	MVxSoOTc1Oe5oLsgjfrNUcG+Rdozmh2T4Z9tVuRwGqcb+bj8r2/vYJhDE3CuW9xfrd1Z1qjmPKF
	w+3t4DDnfCdypO/lLie6kE3JmV9WeAdtenfhB4WQ4iyfsHmUCBiHymgaRD8CVGVGzQ8sNT4u3jt
	Mhv8Jh8MOEGTm3wctHWiS3eNzAwduzhiqB74Gv3B1j/aRBv7iOI2qhhhjSMZneWsjK9n8ht3ccP
	issI=
X-Received: by 2002:a05:622a:58c5:b0:475:1c59:1748 with SMTP id d75a77b69052e-4a9977451a6mr100569111cf.11.1751979591967;
        Tue, 08 Jul 2025 05:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGpMtDCSDvrmPqDsjhCiPEDYaKFNY7K8YHnf9+piru8qyLOVRyTkfkXiQKQuqfvq78x5rumg==
X-Received: by 2002:a05:622a:58c5:b0:475:1c59:1748 with SMTP id d75a77b69052e-4a9977451a6mr100568791cf.11.1751979591382;
        Tue, 08 Jul 2025 05:59:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac547fsm877173366b.89.2025.07.08.05.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:59:50 -0700 (PDT)
Message-ID: <0c30f2e8-bdec-4694-812f-c792703563fb@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 14:59:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/28] interconnect: qcom: sc8280xp: specify num_links
 for qnm_a1noc_cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-1-875fac996ef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-1-875fac996ef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfX8W3J7zKs/+th
 4JFrLkVG7RZycNDMXbW5cHn6t9KnGrITQvrwU/GJZLKacJgWbLS+9JtLziGETa3/oJapBeym2iY
 GfNipNrSR5dxNcf/dR5aRzHlKn9G8IamBomc8+xXPfa8jCSsJ1SgnLpEZaFQHAkVuwSneUxAk7k
 BT3ZRH1ZKy6w8j5Opm89he8gWRlBRsBO6KVb+thE1RkvUl/82Wlg7MHIk+XsQhVMx9nixSznKig
 IvEbkU0UCtJkmhvZWDCubH60r6o39UgILoPYQ7zCuyoF2gsg8B8EpEPOHKk8BFqnVy25csYbLAh
 NKARIC9TOkVP66guLaqUmZXBhTwZcjRYaMC3Ev07XSa4iNG3J1CM8UxiiVlQYlt4mO8kKpGvhWa
 zjZiBrqnDm2cSgeN8bUGUNhGTRf9cAEXfG7yatNvg0tvEcbU73C+hhuyH4Hxb09Jz5CYQK8t
X-Proofpoint-ORIG-GUID: 75hnavmUm4m3RDk7s8s_Js-6liDE00ex
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686d1648 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cF7TeHIyr2-eM01_ESMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 75hnavmUm4m3RDk7s8s_Js-6liDE00ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=825 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080108

On 7/4/25 6:35 PM, Dmitry Baryshkov wrote:
> The qnm_a1noc_cfg declaration didn't include .num_links definition, fix
> it.
> 
> Fixes: f29dabda7917 ("interconnect: qcom: Add SC8280XP interconnect provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

