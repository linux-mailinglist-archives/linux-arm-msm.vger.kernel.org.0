Return-Path: <linux-arm-msm+bounces-33126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFD990505
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36811C22A15
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078772139D8;
	Fri,  4 Oct 2024 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PNXeYmN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D342139C8;
	Fri,  4 Oct 2024 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050198; cv=none; b=peyqoOorz/vqUdPEwRq18elcSumcn6XjRY2JUE5w4SvHg540hPy3CD4yiW5iskyW8nRER5kspmHm03c+ReAuv+9x26zPqdo0qE1sZ7JkOJPygjBaoE5x5V9w40O39L6RQWCMhE6Y0YYVJWKmnUQ/OmcmWj6ttrVskIa0ZygeTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050198; c=relaxed/simple;
	bh=9GdsucXmNkPS2xk5nNF59TPvlbnXFgtmAMV/kmxrn04=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG4uP1z28o1WLh9DmkhOOJvt6cB1nC1kxbhFirxKLRGCiOE2wfaB5LitbdHPChB0Bbyd9MiiLW7J3fnT/R8Zfu8P+/JGcmeX0hr6aR4sDMp0L6vDlQkhVp9TCirAcBASmr2IP/dabmR1FPdy7WmzjD0vSsYIW0B55QZAZRMzeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PNXeYmN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940PeTS026484;
	Fri, 4 Oct 2024 13:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RJd5+YHMSsG88etbwaP6oiR9
	jvN/NtSoMvvcL3EGNmI=; b=PNXeYmN9ydYx1+DDjygnivWLDYBBQmvVZUHNYAxY
	D++wGiYt64DfQBOAH3j6pcQtq0HPOt5Bt/nQRdDkL/Z6fkdLXy+GaK4nsRyNpllv
	UsznuI2HOi9HTS4kTW+sfMbgFoq9LUDxUTOebCQeMuwKqMVCzqlsSo8cgQSGnjAg
	V5+nLCPRXJ9/IotUAQSkvFRmO6tKaKqpKmricE14s4qQf8iPrCWvblR35CWVxEmc
	N/zgTgrWyEJmeHWJrnQx//pDLg7cZIpLFgeb0Mx++S9m6GSfH9WzoKalFIZ9BmLq
	BLp0c+KmFeJW0Z00H7kGe6w0RpBmWOfhG4z/xEVTSCCpcg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205n28u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 13:56:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494DuU6b002063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 13:56:30 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 06:56:30 -0700
Date: Fri, 4 Oct 2024 06:56:29 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Om Prakash Singh
	<quic_omprsing@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: extend the register range for
 ICE on sm8[56]50
Message-ID: <Zv/0DVQNEsJPoyCR@hu-bjorande-lv.qualcomm.com>
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RPTibLljySJ40fCLinWqNBEH9NF5HaQF
X-Proofpoint-GUID: RPTibLljySJ40fCLinWqNBEH9NF5HaQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=603 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040097

On Tue, Oct 01, 2024 at 10:35:29AM +0200, Bartosz Golaszewski wrote:
> The following changes extend the register range for ICE IPs on sm8550
> and sm8650 in order to cover the registers used for wrapped key support
> on these platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Changes in v7:
> - bring the ICE register range up to its full size of 0x18000
> - Link to v6: https://lore.kernel.org/r/20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org
> 
> Changes in v6:
> - split out the DT changes into a separate series

Bartosz, this strategy of "let's split things such that the maintainers
can't see the full picture" is just BS. It needs to stop.

Now you will argue that these patches stands on their own, and that
might be a valid case, but the argumentation you're making in the commit
message clearly ties them to the code changes you're making somewhere
else.

Regards,
Bjorn

> - remove the new DT property from the series
> - rework commit messages
> Link to v5: https://lore.kernel.org/lkml/20240617005825.1443206-1-quic_gaurkash@quicinc.com/
> 
> ---
> Bartosz Golaszewski (2):
>       arm64: dts: qcom: sm8650: extend the register range for UFS ICE
>       arm64: dts: qcom: sm8550: extend the register range for UFS ICE
> 
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> ---
> base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
> change-id: 20240906-wrapped-keys-dts-b733dac51d01
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 

