Return-Path: <linux-arm-msm+bounces-63212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE5AEF811
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6678E4A0786
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2847B2737E2;
	Tue,  1 Jul 2025 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adflSpn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC3273806
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372041; cv=none; b=WGm0mdQze1CYjFZCAee4VpDN5DKPj46PHlUpTHRxz49nlG6cMVU0qwknKyCxZUQges8vvnwo+kkpHZa9nP1c0EX9lWMTH0YSMxIJXyNaIbe0uOdaIgAupYro9gxq1wVE8GQsaSBNpjlUncsSzMVB+9PFNuGbdjIFgGVYMBqsAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372041; c=relaxed/simple;
	bh=fc+V5d2QW7CN+ykMr7bx8/ln9xdc8qfTLHTkKZZLnLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TI7/lhrXD7d4E1YGx6H/AxgxOLR08pmU/lHGBCijuCKYOExrQ9j4YooRA8X4YWaDD/ZxCnGanLr5QUvUBHiYxuL3vupJH0DD4JSlI0r8estmlDLp6bqXiQle06FF51/yzL4wwcNUoiKc+0pq4Wf7Kj7wB9T5b90h15ELdkggIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adflSpn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619wrJt008139
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 12:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVAZKe6MVUqSmIfEve8DecFvZqjhdtqfXn8WNkgPtPk=; b=adflSpn2QBv+mRfF
	T9Kgjq27zZYwTvH/mIPtYnRLk/yvkQTMVRDKF2PY8vdNEyyyX7RTL9IJ7F2cNoRr
	Sk93tMuVJbXBkIMEwt0/P2dUTtf6b+5Al8i/icQeg8lViSVA82M4RglDrKYC+fEl
	CH5YsKnadCLo87N92Rp7repskwDFJwzFZECbR1XZajtCX/mbtxX+VxZIW5wvApBJ
	zrk4YH6V9w31PfHRpN2MTMLYrELYjtxsW+Lk++TbKIkD4zCwSG7cIFP7JOHHBKyG
	uUcrkfUgdTIEXAB2VAAWWeDq2sODEHc8TyGxkdLZVucUfOTqpgVCfP5pXng/EGwD
	aj6qXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmwgwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 12:13:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f7413beso20446846d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 05:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372037; x=1751976837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVAZKe6MVUqSmIfEve8DecFvZqjhdtqfXn8WNkgPtPk=;
        b=GyouCGy+1X/paa1OsCRWWCzca8ZyavFK3mv7esZLUe4OMu11lMCqCj+/EkJVJYRR7T
         F99pO6Mh7iZ+3OiAU124sWRK/eIgdyVK3cM8s7ccVMU7u2JKzOKPx2NGYdGp+cbl1x8q
         xXBQUCjcVs3uTh9BwEGwyP88BCmvP07r8NwbaYJdvSryH6tMS7jqnwh+DUzYOJ5z9B9u
         mXclFl1guAGc053kFcaDeMQPBi8vVnedgMG7rmS7u+4q5AKG5jvQ5nxL8NFORnq60jhr
         j6P3Bv9I4AiFA/j+AOYQZ/qEZFVGzJ49ZN51JysWvJ7QHDZlHZaE2sIhxQylKKVBGqOe
         YZfg==
X-Forwarded-Encrypted: i=1; AJvYcCXLlDSvcftVAhTkds/auUSz8GbQv84PbpGTMAfY5UTPU5IC8qxSzEhLbdE2TWALq6iXjFVD8mCK7LxgEHpV@vger.kernel.org
X-Gm-Message-State: AOJu0YwAE+PHAX/ckFw3PWLkFB4dyMPCfZ0tSBo/7K2Z87Yn1YJK9lFQ
	Z0dcyviL5jInp/JxJTSDY3bDzH2IgfnBQdbFFzWPPTUt/6i1tiQHnBwPRbH6YGosY2OkIF0GViE
	VutY5PYZXieHBDOmM3eUdAUgunESSlF4joM1YbeZOOpV+uiFuYyVCFSBiTqsZ1J8GTGBb
X-Gm-Gg: ASbGncv/VewW2SYAQ15lDQkHmhK+r1j93L9Hlum5OL1qeDu/w+3nZl4cxUVLcySMVYb
	QprGF2ARmkFN4aYzBO4k7L7XwG8HXwCdr2ieYen3h5c5jRTDP5/d81uhFaRfhYPMgIj/CCuJc2K
	9nfUeANdj/hnqVvBS4eaoI0yxSjc/SF0Usoaw5LxAKJfD705ZvMah1IBa2OGoSWaPchoZ8OjlSc
	cTc4PXUsF9WgcZgsNTMTGuU8d5KAWoQYPHzXD66+1o3NuGGMi1I4JFFECK/EOHgHt9cn+7CbW4O
	BuKhh+Mw0P4VUpSaD/DmWxskIJ9OZgU4yI7gKUN9x1XFccWyohvPC/Atd2HEsN8BQGRowQyyLo8
	gInupXeh4
X-Received: by 2002:a05:620a:43a1:b0:7d3:cad2:ea27 with SMTP id af79cd13be357-7d468a93f78mr96973085a.13.1751372037044;
        Tue, 01 Jul 2025 05:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDi3p+4z356QnL9luRZ4ca2//1Ovbgx/iA7XNkUbzWU0a4/W2qizB5Q3TbSGueW9e6IvS/8g==
X-Received: by 2002:a05:620a:43a1:b0:7d3:cad2:ea27 with SMTP id af79cd13be357-7d468a93f78mr96971185a.13.1751372036558;
        Tue, 01 Jul 2025 05:13:56 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6b407sm859796766b.117.2025.07.01.05.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:13:56 -0700 (PDT)
Message-ID: <bc805145-b63a-4528-9c59-973fbe4961d9@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc
 support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v9YY4fOkp_xuSHOQfLaUUJJVxjVdiHAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NiBTYWx0ZWRfX5gw/XMIHjOCr
 eAybrp/MpRiEBkC1oO8Rpp3sbzkSkne2pxU2QTpdFEHOEM2SVKvObE16Uxi7uvtXPlw4pjQMEEj
 TLnke0IPyMoW+mvIcoP6XC1ZS0ixopQxUaQff08WlI5lHLTYNW2x72SFZQX1j4bHjoini6j3pvy
 CrdBpGR5Xh+GJp8g6gjWf4fGo31G06l85JBVQVcW7ydZROogWa6F0K0r1FLxiHyUCnkgNT1wEOi
 qBtq/nLP7K9ohGcg4isGmj4WFVrDtR2fFrhiDNXlKyuk7SKU4w1lyGImPzViaTlit1k47cROG4F
 yPFBDi1qe41BVCtk/AsE0KkatfmPYWVweM+wlPpd6G+vCfuB7cdGET29s2xvKzNuC7BRvG6L4ly
 rYmftwl1gKIzn6iPoE0eRJUw6XJ6xmKYrtDbpPWHUokkn7W+BLwQjA9l6wGAgsugjtfZ+qvR
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863d106 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=S-B96e1FEKnLoGXqiSkA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: v9YY4fOkp_xuSHOQfLaUUJJVxjVdiHAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=882
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010076



On 27-Jun-25 08:55, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

With the agreed rename:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

