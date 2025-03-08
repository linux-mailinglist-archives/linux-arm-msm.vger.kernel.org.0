Return-Path: <linux-arm-msm+bounces-50700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788EA57B39
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1113A71A7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 14:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A311DE2D4;
	Sat,  8 Mar 2025 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I61oHrDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596911CAA67
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741445306; cv=none; b=J3piBUubnXhWoxi2bnXX1dwjzFJ048jF74C7BahJCiSFO9nLzyS5g1AuV1CrrDl3Daj0ocA8UCzEtDgeZi7yKbfiICdyksv5MnrkQvI0to+SIjPqSLTwrrUtbeWApwXjomA5fwmK9uWkSVoE1VdndM+1wnUIPXU+w2VTAH10ilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741445306; c=relaxed/simple;
	bh=YGBj8gADwPSMC1i2BlpYA5xPWm5tF3yekbYYKM1u4w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceh1M/+et3D0aiT6b3UYcR0R+aOYesq5b8FQ7DyeyiWokiFAxAeh8YvZdhX2IQs92mpywo2/FlG5RW+uhGClLNCpN0e44SjvGi5lVDzGauOPp95Z/jdb4SD3IByk885Ck83Rl8Anw88d1JNX895iVApcB2fMq1znmeJgIfbgrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I61oHrDf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5286RDBc016287
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 14:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvBeg08yOEUzQZPQ/Skfesh4RlnvXCh+5wTrJqrA+Yo=; b=I61oHrDfgmzrjF2R
	0z1RHS5HVx2em9h/9ioO+otVoh3cppQP5lpwFbBuoQn2JlecVnsEQqSRXws9GgGF
	5JxJdaP333l5oKmd0qEpGjLnmXi6JCYHa6cp60iZf02CWSnJUp27dMChMmNmknV+
	GSxWCiJUG5g2tmKLb6eZWpNvQPCrwnma/LM38s6Reh9EbeiWO+jQEiYeVuoAmYOK
	qAIoLh7/K+VBPU0VtRlqlufq5Ko5dMft8EKf+WBDaBCGIWC55yfBN/ewSUUKP5mr
	GCJxC+DCcDArCRpwPGL/WKho0rxe0Gk87wgvGiCbs6FMHt60cYXgov0ImC1oI77N
	sAg4GQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyt0q5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 14:48:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476695e930bso584731cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 06:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741445303; x=1742050103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvBeg08yOEUzQZPQ/Skfesh4RlnvXCh+5wTrJqrA+Yo=;
        b=m+F8Ds6F16sMMjV++BK5C2Pw378PfHhWL7z0/xkwZM3TQ8CXWHb1HSNe6FwSGEFR0n
         PvNMbvcEMs3IO2F0+TgZ2DetUYy07W0yApTIw9P/3DBkDYCzZCgRbE+K07fdbj2Hv0ka
         utLx1bH4Oa9WMhXz3k9Ig5Jo04AYQSphFbgJDsO0NiiNTbp6u0kZigCK8+grUQ67er+A
         /Egq50uDt3U7IL7LTwXQMTgCbqV9lTLxt8IBDrTAeZF+e1nY7KGt3Xhh7nFhdnYR9D5t
         aiH7EU7s1IRMMrg8Fevnhu22v4iLQJ2nu6s8wZbFwKoiGU1tSmIAKy5vJZMPZucURJV6
         t4CA==
X-Gm-Message-State: AOJu0Yz0Og/mhW5HZBjnkhdQNdLaB/I4vXDCrzLM1EAYhYA1Lj1KhHtp
	PSvEWGC9T3RrdMWzt5Jlt3W1gleOCJ2SwAqntQQQ3CDuiXzLJ7hPzvHr6Tgig96clBm2cF0XYt0
	Zcyv22T7BWzeenfTy2Oa5zmp2spuwT78pjel6cCg0UpWiPYRzrGCMrOTkDG6EofqT
X-Gm-Gg: ASbGncv3Lsq5AAzQJfCt0PxKC/+RF7G3e5sTpoBJK5Ke29vpu+7Lk0u+gU0saX7Qco2
	EjvrlYeekThag+EC/Ns+V+VuejpJY/T0H5h412iV5ZEczTVxDbxcMm3dXOsV2RpW2N7r2g7wd2P
	PhjffHU7avv1B3QW8ctPGDKcixIjdiW3aA+8ZpytcFuNXK29XZZ/wtqpkm5BDVIRfLwu0MTXKh6
	zIb0iRWtgQudRs2lk45K8u+l4ywlrezc81LYAowC2LMcrSIcEfraTcKvCx4aFCCLwCKzB4RIgLx
	Ui1DXyMlReOreciEwItywxg/ARFIt7+a5Rcai0KliWhGVUx5OzgOrWc4IWfPHuQIV0Q1vQ==
X-Received: by 2002:a05:622a:540e:b0:471:f5a4:546 with SMTP id d75a77b69052e-4766653779amr14369221cf.3.1741445303018;
        Sat, 08 Mar 2025 06:48:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVEKwI6weP/5KnlgKGURTMqm6ik4LTTk+t8W4K4EzR8nGDc4m9OO5FuyU5n7+r29SlCOPGsQ==
X-Received: by 2002:a05:622a:540e:b0:471:f5a4:546 with SMTP id d75a77b69052e-4766653779amr14369061cf.3.1741445302741;
        Sat, 08 Mar 2025 06:48:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2390fe76csm444120566b.0.2025.03.08.06.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:48:22 -0800 (PST)
Message-ID: <458625dd-25ea-4eb2-9a04-10a173608cac@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:48:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/23] arm64: dts: qcom: msm8998: Add missing MSI and
 'global' IRQs
To: manivannan.sadhasivam@linaro.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227-pcie-global-irq-v1-0-2b70a7819d1e@linaro.org>
 <20250227-pcie-global-irq-v1-15-2b70a7819d1e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-pcie-global-irq-v1-15-2b70a7819d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zfRBtFnWB56cZCV57Zb82o4WFna_hqxA
X-Authority-Analysis: v=2.4 cv=CupFcm4D c=1 sm=1 tr=0 ts=67cc58b7 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zfRBtFnWB56cZCV57Zb82o4WFna_hqxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=631 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080111

On 27.02.2025 2:40 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> MSM8998 has 8 MSI SPI interrupts and one 'global' interrupt.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

