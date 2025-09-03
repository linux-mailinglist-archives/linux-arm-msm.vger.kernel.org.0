Return-Path: <linux-arm-msm+bounces-71878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DCB4224A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9E2540BD0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E502630DD30;
	Wed,  3 Sep 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH1qtGH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA230DD06
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907016; cv=none; b=Bs0ckC97XqsN++BRhJZm0+KLyo7vuiPMIY8LO9c3EgThPxHbdRz2Jmb5qxMgTqcy2E9yYxd80p8xSHMBhA1Uea4V1jlWzp1g7sIahNAurp9ocJwiRtloaFmfY6U+seIMPiyoaVxTP9q8b0na+sacfsl4lDLwVl37Z69O9/x052M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907016; c=relaxed/simple;
	bh=J2saHSevTBJMdQGQ/k91nD+umoYJ0UhFnd6gQFsyAaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxZ4Nkb/gaIdvz0HCfQm0iTN/qDzwU28AgM6xtT8B7kS5hHbPJAIeEWk7j+W54Fx72SIZj4Mr5/Gx8dmjrJkfbKRroUyc8EuJJzMyKs6kVGKYePJ5KimUGHqHZIKTvIQxwSusr7OrtXI9kI5FnluowrB+ppG8hvAuNKPkifIH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH1qtGH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BZxdj024831
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 13:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhAEVb6Y680w1OtPE9Ykdv0IK3xbZmfs2ASBVN73JdY=; b=UH1qtGH06F5VANyt
	SwvNUMngVUmItbvUX8SL9y+hu362Pwrcw+SUtieT+429RsloOLjAVd2akdLzqQOo
	iP1mPbKYoX502uz5pRx3YdugHFLOFNt3j19T/ru9nHQ70AI9v1UZPFKqli0mpK5H
	kmB6vHBq7A1iEnhja5cm+j7e+A4Cks59rW2EbdsWV/+H0blYVR3ElttLP4ZRzek9
	ptkTlctmEy95uyZ4SBXg1WBM7vfzECknh028d7FxTNqpE4EurBnLdPe6gY/JAJH4
	cZhqxxuETUnwg3U7hxALCgMRGmQgt8mKa05h/hz0/o2c5OaUw0QQEipPih8JSJ96
	HHVZ8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0day-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 13:43:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so3831621cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907013; x=1757511813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhAEVb6Y680w1OtPE9Ykdv0IK3xbZmfs2ASBVN73JdY=;
        b=g8R/spwW1P7T8ZHmdGocfPcc/HdurazpRxwI8AUgrEHCZt+CDkAXweiKPjToP6zZpi
         jaNuMxkeyk/xoWkfBx37TbmXrAA2ErTuzKtJ+a3y/tJ3yBku4blnCkbo/OMAY0a+CPXS
         w7ylBrj+Z1Oggl2wm0ZUKXixwoV5W2hj777Fi4ih/cfj1odCh9U5wh9CEKK7OT/+rhou
         PrFGwwSsnPMqZzl2jMt1YVO6F1X64LTcduRR5yfhnSvy5m7PzMte/vpjOsrRamEzAzMZ
         ILxI5rT17+pHfuWb9FVEZrsogoboN7qATfCKOXZolV5/9FVPpHEb98Qc31+0/48W3xC6
         T7og==
X-Forwarded-Encrypted: i=1; AJvYcCUfreqlRKHTS71bgEPuKPZvLlcPAByjbzs3lq05PVrkZT/hvIcLqg8ThbtthsUn7yNqFbWOvarEznPaEs4L@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXK2SNXmr4uqEF2c4y2CYqsCRO0D5a43S7eS3ciYGts0PeGQJ
	YhfkoPxefMy2OOtHY4BlNw/98nPw5BY26lRueHTYKYZRvDhpqYMALa/SLL9OacWhWeFlI+rf0Bo
	8zvlkdterqmWebKwO8hOp2/SWhnfSVjoow4ypKGEQqEinS7MdfzOvcz7Vg/6bX+7a6uxu
X-Gm-Gg: ASbGnctL9sDBr2EryIAQkDLarnQrOBZ1pB5HSZXCFr1F40QWD1N8GtKIkbGJvRRyUjc
	5TFINxfRMNrLYokBMBm8tphEjCSGbh89gMMy8QvuJVtGGtTIwqtUMFj0AOuN9QzRKQUs+Bb1rn6
	BUOnWe7uHr1m+BzZxyMp41HBclIFoWO/zD5vhB+MIMt5XyFuVkstve1coWbh1D1K9sTtfPXNfUG
	35qSG5bU2I1m/UdP4qYxY+FYWlY+XwPqbBr2hRyTRgoZDvoA5vcmeB62duh89qKjerMbCfWOF18
	GmV7lX7HinH8Xih14OMYWm3zkjNDn1coobz1NpTJwb+stgzQsW9QzGO+Kg7qRWp/Zpy81aAD1xK
	cI9sKEypp5hvUwMZNXqc7LQ==
X-Received: by 2002:a05:622a:1b92:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4b313dd0270mr155416971cf.3.1756907012996;
        Wed, 03 Sep 2025 06:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF56Xam6gZtEwPzJFWPQ1ApnzKwNAHz4Gphd/ZewfD8xSeb5FB3EyFo/YQ8Z02OaDwf9p54/g==
X-Received: by 2002:a05:622a:1b92:b0:4a9:a320:f528 with SMTP id d75a77b69052e-4b313dd0270mr155416621cf.3.1756907012428;
        Wed, 03 Sep 2025 06:43:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046eb335f5sm107990666b.28.2025.09.03.06.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:43:31 -0700 (PDT)
Message-ID: <7a43753d-a0a3-4b9a-829b-5a997ce46625@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: unregister ECC engine on probe error
 and device remove
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX5gxjYo2g0V/T
 ObJWBskgJBpVp0XhReJSWy7jO3+ZxDN0quDjJgnBvvJMTagyfvDeDJvXN5M+61oKO5KYLDkIhQT
 eiRXuwhYMJTWwNOqvmjZkTQwfbcA6T+rTq2UvohC5spD/6RYiK3koHkbMnNs9x5jD1j9MKBhmrW
 GOWnORTQ8egCRgUMydASFREMoq90UmIvx9gw9I4YETjm/1YhvKoeLv9axBveuXVP1yp4M30cf4j
 KIR+yyI4KbyBmJJv8kzHRjspMbDO13ZcyNXby4rqkmjiMB8Mx3+NTdODYZ8BEH4+3/WnqqKjeNc
 5ldnCSi3EcZFUFyZ6Wj5scb88GNVemeK5BptUw5gJOvBaN2/EVWURrKd1hK8wC9czd/lNi2g9ox
 7t41aIZQ
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b84606 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MVN0ImEU2R9ubr7hOacA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RS65g7trOL1MNHnlCLye2IkVcV5bZmmL
X-Proofpoint-ORIG-GUID: RS65g7trOL1MNHnlCLye2IkVcV5bZmmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/3/25 1:56 PM, Gabor Juhos wrote:
> The on-host hardware ECC engine remains registered both when
> the spi_register_controller() function returns with an error
> and also on device removal.
> 
> Change the qcom_spi_probe() function to unregister the engine
> on the error path, and add the missing unregistering call to
> qcom_spi_remove() to avoid possible use-after-free issues.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

