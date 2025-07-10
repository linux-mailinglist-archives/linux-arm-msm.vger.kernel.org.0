Return-Path: <linux-arm-msm+bounces-64374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61578B0020D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98BC01AA004F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF33C2E0934;
	Thu, 10 Jul 2025 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YymyfFoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5472125D8F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150702; cv=none; b=WiabygY6s1o5Rh0czNkVvq8xgB6ifMI4psH2TC6DRexXFPIDaZJugqACxcWIJm0BO7y/u6S3pY3wZ5zedFls04OGac3NgFShUdKOgB4ZMfzax1J8WgJJXOilowYVfPxafo4x3cTIyUkSTV9r8xYlnKYBeGBkJTsHfbCfyvmTezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150702; c=relaxed/simple;
	bh=4UremFvQNIY6SzFGgvRQlyRj37Xoe27g/8jhdCjJf74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZMCzmva2ZfrVHQZLl57adQ6R2JMKjhDqOcKR49LA+brAXIOTIkx1DhupMeCE4DcRg++Axox6/aripzZ5Yn97QbrHh6mnbE3tqQi+LDL60DqBkZB1wf6yRggcm6qp368ql6InQvwWxsEK3oi4P2h+NgZzmuqTzUANrir6sXQdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YymyfFoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A96Psi014493
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHPrDPbQBwwhRT62Gz3CAaiC6cJUX/A2VM2D2Eb46XU=; b=YymyfFoHa80NNStI
	Ok2AN6SGR0CYy/e4XN8Wq/bgrbE6JjZXYTyhqp2JSRWeinD9ixEIJ44YhYXLD1qi
	ukOhGgWuC/wlqHBgoPnDp9QHCdzd6xmqzloDsrsfJHeGWBN4jUxiCgfsWs5E2emJ
	/ax0bRcpU1I7CxHwUnH1fLbAJp179x24kObDlj97y3hs5IiM6eUNPeqwnXZKqYIO
	G0CvtMA+zwXMufX8G5bpBwXRvGckZCBnIe3kUBoMTZddyG7x/4anNmcKIGDdiRjl
	Ln4dfQlOO/dQegO1uZqWa5NFXGOFvtkWUi/jqFqp2vqUhb53HaosTze4cohD6Moy
	+zU0IQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b15uqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:31:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so28430685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150699; x=1752755499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHPrDPbQBwwhRT62Gz3CAaiC6cJUX/A2VM2D2Eb46XU=;
        b=Z8jeW8pJEoTRcB29dXeEB8KxpABDnzihqVALr+jAR4iPugHy3p191BsWKM04a18cKD
         7qYcZdZQbSI+dLSysm7dsvBucENvmxzwW09Ajsrq457AP+ZHo+Efgwjt03KGQtG++IT0
         34ulvZ9y6QXTWh0EmG7Ctix8aD5cPE7S5h+FMUJ4v2hc9Id8C9EB87npy+pqEa+8Z/Y8
         GnXruSDPJbxziSFS7+XRe2dkW2OckYutN2IFrA7NP1GvsAzR1tukPZBeitPnb7U0plvY
         CmZjlrBhLFRnW0V0lk3zVYffnrfsLCYS44Y3iL8ZPJTyK4p8ihZ7KSmmEUMG061TjCQx
         yRaA==
X-Gm-Message-State: AOJu0YzAx1aQmsTpCGFP3V8rBB0aBNal0QJax86x7mdSjpdfmtRH/xVl
	IMfi+BGV6C+pDxx9C3m1zyk4TLY+nHOUBmzhk3LfbdSndIqYGP7viJzbeEJhohcFrPohjVCHUiN
	QKtqyD6l0ZNLmfzuGjuF/mpWsxrl1BCEOmX+SXWI2x4MLdwlHc180Vr1Swi/fgNG/U2Sz
X-Gm-Gg: ASbGncuDp+qwM8zCLe+r88FzVkiz4hzyhb4XvD2knbnWAEr5Yhh/KdsZai1cz2jAXIJ
	sYuzFpztIkyaNgb9M8tu4h+bWcM/g05tecbwKEcp64ojzOw+tXRJKgvdPy++qxiozsazJfZrcTk
	pDT4P0uk4PsdzZyWTTxEoLZ07Nqk092I0GMIAbYEQeRusEilNm87bTO493mfNUBWJ+DqRmLlmCP
	Xw5lz7ZEsKIqpVDSDZIhYwO/W1BaO35bQzvTBEG3MBSlS/PUr80JqoSUD18q7MeRk7ZGkRPlToi
	yX34OByb3u/7bh/19ASZb2NrP+FXhAmF4dTCrF1ZQALksFQmaIt+KjsQd0g6pPmMjcQFTMXsGKW
	OEbk=
X-Received: by 2002:a05:620a:f0b:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7db9035290dmr268995485a.12.1752150698949;
        Thu, 10 Jul 2025 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/0cQF10VQQBOW78DH3CzzkILAw56kd007Ppv4uFsJOvZmGIFgtlf9j9Oq5orSKWanbpLv4A==
X-Received: by 2002:a05:620a:f0b:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7db9035290dmr268993385a.12.1752150698546;
        Thu, 10 Jul 2025 05:31:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294013sm123843566b.118.2025.07.10.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:31:38 -0700 (PDT)
Message-ID: <87bd50f1-e4e5-4da4-be68-38badd691d93@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:31:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14
 device tree structure
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
 <20250710-hp-x14-x1p-v7-2-19c10c81713a@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-hp-x14-x1p-v7-2-19c10c81713a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686fb2ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=l6tG3xHbnDtuU65x7AgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNyBTYWx0ZWRfXzQnn+ZsU2a0k
 3Bib4jkV9I39ztv69EJljEUP+LOnxWTOabVh/hqN2MkkfgpdCiMJ+MdU4ZFJvb0KNC5dj87ZkrV
 NYwEDIHRunr29ppmOa3vEeC8XCRayMocZUtIP2iWdNJf9EAVLToFU9P8HYIQorj42BRpDAWYri2
 8eWMuQartK6Jmgp37YtOPjEN/2VaL5lmSeoEx4IjY7l9Bi+e21Dc3Ts1iQENxOX5hOVd6NgbMlM
 +Avjg+m/pwIejcpav0Bjpg2VhZw7VmuNxUTKMozDrHGkhPATsLHz3AnBXoHWUF7QFwzjcP5e7hy
 HbJDgqeIiccI+pIegF/vxWlhPyF/xreoF8XWlh0SwXr/8t6PMgkLKahqQg7FM8RcEYPDjWjDDBN
 1uj4/NM/S2EolXEWJlUSfrHhqme0/AjP7KERxHdPauwGaXBeGhIaGTavO9xefuYC8nJ1/9Z/
X-Proofpoint-GUID: IyMt9lHidgpJY5p4S78uOSfAnDJntBK8
X-Proofpoint-ORIG-GUID: IyMt9lHidgpJY5p4S78uOSfAnDJntBK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=838 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100107

On 7/10/25 12:50 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Extract common elements into a shared .dtsi file for HP Omnibook X14 to
> support both Hamoa (x1e*/x1p6*) and Purwa (x1p4*/x1*) variants.
> Required because the device trees are not compatible.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


