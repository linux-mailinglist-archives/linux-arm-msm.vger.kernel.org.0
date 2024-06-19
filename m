Return-Path: <linux-arm-msm+bounces-23206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21DD90EA88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 14:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEAB31C23F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 12:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B333013E8BE;
	Wed, 19 Jun 2024 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j0fFlgaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0932913E883;
	Wed, 19 Jun 2024 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718799072; cv=none; b=SQFtHnNP5zGgn9KWIK36mMaad4iqJwkB/UoiLOeT8ZAgsI5c+Iq/7MIQGX1A27Tx6WdndnmmIKvS28a27krnTXxPG91DNIe+RQtC4HtWZJXSqTUFiEVrErdhKmfzSMgtTls8pazll9D4V2UfkyvUDeisIPOMOW2kr8q9GNXlWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718799072; c=relaxed/simple;
	bh=WriduSbwbn/qSGKRQsihKJkVQoJS7zLsV4IDFn27vqE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2ONeKtYG778JCG/4BkI9Civ/Gj/KpdGgbCvxpzNfdYySrDTRFfdo5afwUsjj7P9E28lv5rXA9KEiZFQKbE7IUeghtMmh5RrcABGrxKkdIVtDkUK6yRTdWnbl8LxoBwnTNqzhgPBE1PfqtlH8lCzdtlmvnG4Y8mVyvwXDBerU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j0fFlgaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9CJLe026483;
	Wed, 19 Jun 2024 12:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0l/9AqPR4e/gX2FPodZGZsB9
	iThzDI4l1fEjSO7phl4=; b=j0fFlgaChrhWjrBG4jrDP+XTx7zf85EhnFTYrJZ4
	oH3kyuH4mdwRW3PxeXGrtAiuHrdVM4/sQur98CQm61cJVu++dwq+x4K6JaRp4396
	mNk9ObWqYrWfFMvILClIIzVUSo6g3R83+7UJwvVdRAqiQaRgFcdqZhzMepl09PpN
	QfqIPpGW+8ifrn2KhtyCNr6cWuzBWVy+sfRQsTv77WYJ1HrQK8wqouCNkTgmv1z+
	yMVucvD7iF1z/d7Bv20ANe3C7Vf5aLAaNdDfXltivQXj8wb+j5CI6XMLTSSakJgx
	vUE564nUUmds3ijPQ9tMiLQ1sW2n8inXKqoMQAfAJqVAFg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4hnn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 12:10:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JCAnHj029599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 12:10:49 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 05:10:45 -0700
Date: Wed, 19 Jun 2024 17:40:42 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Komal Bajaj <quic_kbajaj@quicinc.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Message-ID: <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9QKnJF0ty2M9ngem-9x81nldQ0AJbDmh
X-Proofpoint-GUID: 9QKnJF0ty2M9ngem-9x81nldQ0AJbDmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=492 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190091

On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
> On 19/06/2024 12:56, Komal Bajaj wrote:
> > Enable the secure QFPROM driver which is used by QDU1000
> 
> Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
> Qualcomm downstream stuff.
> 
> > platform for reading the secure qfprom region to get the
> > DDR channel configuration.
> > 
> > Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 838b4466d6f6..c940437ae1b3 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
> >  CONFIG_NVMEM_MESON_EFUSE=m
> >  CONFIG_NVMEM_MTK_EFUSE=y
> >  CONFIG_NVMEM_QCOM_QFPROM=y
> > +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
> 
> Module

Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
should be m or both y

-Mukesh
> 
> >  CONFIG_NVMEM_RMEM=m
> >  CONFIG_NVMEM_ROCKCHIP_EFUSE=y
> >  CONFIG_NVMEM_ROCKCHIP_OTP=y
> > --
> > 2.42.0
> > 
> 
> Best regards,
> Krzysztof
> 

