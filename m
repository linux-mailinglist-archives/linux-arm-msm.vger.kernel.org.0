Return-Path: <linux-arm-msm+bounces-46400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4DA20BC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 15:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54E201886120
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A951A9B29;
	Tue, 28 Jan 2025 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyDIc0pp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5C1A0B08
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073291; cv=none; b=OMSUKrUfAAahG99M59nu9rae8ZHbhz3eWihfWta9VGLJ7Kyhd/8ioYQtEXmPPeBUIptDUmCGa6Yd14dIPkF0miowqXYZDEc/Cp7FNvTjnO8EmEExNQoOHVLtLRQ+HTaE3z4L2ln9aNdz42MRv5naoIF/UHqAutqLilIfc4yj76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073291; c=relaxed/simple;
	bh=gbEFTZYXXqqLxXjipk9QgAoXde5WC5DcV6tWcO8zuDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBI+XAozluSrYvKuKoAyE7nLqppVBo/tQb3OOayu9aQmkjdpiAYixL39UcQ+zc8rgQyDy08oXDtILwzdQI5BIlx89f0G3ud1a0d9yRCMXwlfhzIhmr5qyyrfMMnJyVauTuU67egw7QGmlP91AkxYf+VQ9FN08KVkYWaGud+b9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyDIc0pp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1rbs8030348
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dmt1xz+iuLIC18Lw6YWHic0kUAuDcmzyCH1VTEO7o4Y=; b=ZyDIc0pp697cLiJj
	+PIg+7ZzRb6SBbnKsGjXH+DXk/Dd8wdo2c3qoqep580qlggQr9mwqnAe1R8PzrUV
	mrzUIcXZP2hJIyuUIbQd21I+x10xwWC6GVGQ+uqrAFcc4BeqEFc5tP32ylgx0XdD
	1u0A9ok390yCv6pOo81m5PR4mzudknfqewuVXjwem+ukWcZr/QgN8/FWSOz3zTU4
	3b0X6zP9UntedosFo+D+h4YtI54eIL8UiR0brbRrkE/HFORLUMpJJHxtlryVbtqU
	KSCONm9agKW0hhLIzTZG/UPLonS4FBQkRaM1ExSPENYLGG5nV08Mf8iOKqnpENtq
	gfSq1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq1e4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:08:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6ea8fc9acso96889785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 06:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073288; x=1738678088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dmt1xz+iuLIC18Lw6YWHic0kUAuDcmzyCH1VTEO7o4Y=;
        b=pw5ntgdkfM5DHOWnm4D9WyaY6TR6Y6AsmcJ3ND5kX7fBNz/3F/oD07SeWra59qq89H
         r6j4faj4aExh/VHjSuuk2d3yvSFaoM+ODU1Oemr9elKJOWc2tzqFaUbaLfe8BXLKBzPN
         XxMdFdhw1g8gfvBKeD1sgB8CS50QZRAFsE/dlWgYCbNsxxSLIDnDpSIbQdJgP0/w4s0d
         OjFbmQ1Y7UfiepskyW76OLdRZD1w32iQPU88dUYNcIbb4G+VNfjAYI4xJg1NTAZ9BYkR
         MIFVxKz48jxPpLb+Upw9xWcJaj/KytVByw8BZFzFtG8Dj04Y/xkTtAJnlV0rNlegLjhG
         0X0g==
X-Forwarded-Encrypted: i=1; AJvYcCWM8gIKA3AdMFWNzw1sBKQDFkjukYMNCNLC2HniNwGNghaOWFdkwIXZ4C48mzCma7Gu0AYMeX+ZXPuPuSeS@vger.kernel.org
X-Gm-Message-State: AOJu0YxUuFGKwazURA57824WIw++AmCTrZRBVNWmZ50SaTiibmCVoA/r
	k8wHoDOpOQjhRIDJAzg9Zh8XIH2vQ4J3Cd6FVw6JluUzhkGb/BH5nnGLL+g2VF4+vwrEomPcFqq
	W8K28UKB9QdtOF/8rXMShs4ziISnMi9VY62ScVj859FTuSfSMlMhNIS2U/j5UKEzY
X-Gm-Gg: ASbGncsyhT6PXjzLvXQ1bJWdDg+bG1luQVELqeeLGXtnbxMl3edJ7ERcaVAPfcadhDZ
	s0yTRmuALfC/akzSA9p02RVE4RDi3C45YlqmEzATrpoeO0o+Al1VXZdQ5rc2llWL46TfPD+2LxQ
	qqSdUYi6+wthtSlMaiYXX46BzZq9oLAbnLl2Iff8OokgKi0TpHd7V3Xt2TGnuOXCV6CpnDBOToB
	bxsRfEM/Lzy1AvoBhUHXCsjHI0eiLSxiHmDMD1l+d7CdeYCF0Gy9MBFYPA9TP7lGij9mxT2E0jY
	m0U/x2gK3GPePxNL1vSlIxYCkyu/mKuC5GfffnsUeCyKDYHvfzEvjini2aI=
X-Received: by 2002:a05:620a:405:b0:7bf:f916:fb04 with SMTP id af79cd13be357-7bff916fdc8mr53674685a.3.1738073288261;
        Tue, 28 Jan 2025 06:08:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXllgt4NvniruW7iNsLxNWhK6cgB7BOeYVODqKMyfbrJ2Xv+GBD4G3q+q/m8qYnZO7nql7RQ==
X-Received: by 2002:a05:620a:405:b0:7bf:f916:fb04 with SMTP id af79cd13be357-7bff916fdc8mr53673185a.3.1738073287860;
        Tue, 28 Jan 2025 06:08:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fc2ffsm797046066b.147.2025.01.28.06.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:08:07 -0800 (PST)
Message-ID: <dc8f6c41-fa96-4ed9-90d5-a529e34f0513@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 15:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: enable GPIO based LEDs and
 Buttons
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250120064508.2722341-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250120064508.2722341-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oV4cQgElurEqajCMBb1bAySe2KH5S5El
X-Proofpoint-GUID: oV4cQgElurEqajCMBb1bAySe2KH5S5El
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=753 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280105

On 20.01.2025 7:45 AM, Manikanta Mylavarapu wrote:
> Add support for wlan-2g LED on GPIO 42 and wps buttons on GPIO 19.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

