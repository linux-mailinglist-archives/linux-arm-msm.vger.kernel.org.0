Return-Path: <linux-arm-msm+bounces-79660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F64C1FB4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3AF41895C45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC8829C33F;
	Thu, 30 Oct 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNFLjVJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhuPOhEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE8238175
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822263; cv=none; b=ur8MracgOgHbbKtUscua7jHQ+oo2bajX8BZVB9W138/EDPOguReH/vk7N3OVO03RaIunANFkC3vdtrc97D2GnF7koQ83s+7UHGibLCfsE1+RioCvFvjh1SehpgFXQqAI/9FfGB/+NLIAXDmqDgyij/Ayvi8BPqNlg8FZ0tV2HoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822263; c=relaxed/simple;
	bh=l9cMvC/Bdx7ApaAEaOCjkhJrDDxNmTaoeqW9V0WqPzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hww857b/m4Y0s1vaBNrhFtfTOxtd3lgk3JAQyhCgyrDBo1NMfRCNVWfuinBjjMa3mthHzdeKyBAl0pIudO/wxA3IERk5qmFTMckTtNRs2JrSkgDlu/jOMOiijLA2k7VIIXGsisUcyJKdcblnQd2F4HGaDT0KpqcQsUdGYCTA8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNFLjVJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhuPOhEz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9SQ4r1994958
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkbO7JtA2l05+kuFfUn1jkZdLBXtFJAG0KtFxR+o3Qg=; b=bNFLjVJOsDweYezT
	bjzPcm/tCq+1FcJeNuJvpuJ83Os/hCddH98GpPsj8Fx03nCo8pvq7gUqgk55GRwx
	RZBeDTUyhT62ArZdtpSmBxBYeA32WdoZ3YAVeF+7VSP8p8aEwdwVvTYMXF5vTnJc
	X/jQ5ueorLmXK21HgZmqQGFlULjM5dLtdZ+7LCIpLagL/Yv9VQQMnHg0l9hWxFgH
	+Eoq+sgG73xl7oQ/AVDhkM+Mf1RySgYzHMVj5hj/ribSRNn5yFx489yclFjDPG1E
	9D72gSgd3fuDn0BWK4j6Olw5vzfIyDfDZEQ3WewlRpyLAttwqiewv4EBFTawKwBk
	drv5wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr71km9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:04:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a22b021830so27655485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822260; x=1762427060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkbO7JtA2l05+kuFfUn1jkZdLBXtFJAG0KtFxR+o3Qg=;
        b=YhuPOhEzCmEa7CoURdIuo1wisJi70wvdcOZOQDwt5udJa5PCqjRRX3BH2yq4yuVALM
         +BPIjSqusos5v651c3BY2LmDRo5mXXuadLGcBiLOdlrAMiSD4ZHdbwtN12YfH1CZhEkz
         82X+gSZATG/x6nhLg8iQMMByEwy6LQ9NFb45x/FF2pDZq9db90m76XHYkj7IOjYvIwAi
         8QGD248xYA8hSDfDTvW6IRo1Qv39ogt+yD0MODah8YAZrGZzx30OQ0+Y1PWL58Q3B6Nk
         aHBIoJrTXsk0FRB8r6+7RMtOTXSRiX4YBwohiP8orbLcg3jd6MIeGXuy6G/ev5gQOQr9
         aG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822260; x=1762427060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkbO7JtA2l05+kuFfUn1jkZdLBXtFJAG0KtFxR+o3Qg=;
        b=Xy3ZHDA+25MTZXANEb0l9AClhrbTOLIQtFN2CvHz1Ah960ZqfyuYCQgXBdBkfmuIqr
         qoxAEwQFvJyVlfx5w3HFuukT6h7dDa4sp2RNQsHXi5SBO9Vm4DYSXmGq+m+sG2QQmfIU
         tWgT+NnAi0wiOh6YzUkuNu1gvM7t9huC9XXzMbxFSZ0aC9EIPrGxrzaywR+s7i5IdlSZ
         TU7BMgsOWE6Ifpv2/n9h/bCIGS3bdirnBsTIJ/wP0S0wMaTfqLkbUgsKOysbdZCZ81At
         99lD1B4M282AJwG8lVBB3ula174sGRP6TKKtlsnKsBH/SRd3laL3mLTSuseDN9kk0VRs
         hIzg==
X-Gm-Message-State: AOJu0Yzy7/054YoX9FRuueBg2s2V18SEHJqpb4ei1pCYhC28mkv6sp1R
	LwqJ6IVUppptgT4SoLnVTQUem4f1DGZMcfUmLWrKeu9a+NPwKPhcOEwmC1Ip1f87T7yhrwjI9VL
	3E+aOTirqAGlTRjHMtbfsy9Oto+hvhG4AX5MaiaqtvnyCkLHa1skIWwzUuXOf7+p0mv37
X-Gm-Gg: ASbGncsvGaoQqcfg1VjhUuw7EPqqjvMasBvbAOsctLPdagpjc9QKMMY77NzNYwC4ymf
	TyzKMXObY/Ijx7JtveoyyJBDR/Idkd2HZQzYbJj2PTrKLGKbZLvzjEka5voDs9rxDmtUPspNRBr
	J5YbkvpD8kH0y8ENCOT5tetWqgM/RR0qTjR4wYiLR0gQQKKz+G2KgZrSp6qbmcTLhR9x3mZ/Sco
	ykugT2TUPztR7cTdm8JDvokyl0AZSi1gn0kiuosP7EBILEgH4zSGkLTlqdTCG8ZL05iuymzRfMf
	9zoyLCtw/zXShBlEmwUwS2kegympNoBsctgT53rU0WWRFvjTr+2Ywrc6Ly3GrTDe7WU4HC1R+cn
	l1m3TrfKa9/2q0NekreFpQTT2Rzy00+d0c2Y4QVh69TEYQNc7SuSvdw7G
X-Received: by 2002:a05:622a:155:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed15c06266mr56987901cf.9.1761822260140;
        Thu, 30 Oct 2025 04:04:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDBCBzdYODWamLmkDbBUuXY29vrJ8tqPdGT2NUt4Gx1O3hoobdrBluCz/hkhrbJVlKxHHiw==
X-Received: by 2002:a05:622a:155:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed15c06266mr56987301cf.9.1761822259508;
        Thu, 30 Oct 2025 04:04:19 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6dad195456sm1178555666b.72.2025.10.30.04.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:04:19 -0700 (PDT)
Message-ID: <d94cbbf7-9720-4d5d-aaf3-fbb79a47c7d9@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:04:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: add gpu_zap_shader label
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-7-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-7-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX+EjSveyT6W4U
 wUvjVaUCCro67qJpnazXA9bVnMdRM45923sshTWOaTYArB2tvShWYyRgydyoYHMo63tb4qtxpKR
 SoFoZG0htd8932P5KXbJgTOwiYtpsyeA0bf5eVsT4DTHNHqNsFXF6uYVjDMu8lAFpi7vDQM0C6K
 Tx9KQsoKUnp6mK6hrww6PSsSzQ3y93Rj85vj+GJKbmX8zqfLq6cLTvGOm3aVVFaENKS0K/B7lh4
 GiT3PRzwBhukut9vuAzbV4FltJCJOr2foC5yHCH2fAfU9Ou0dAYWEHaABs1gmP0nzisocoY2O2Y
 MGKH4nKb8d8zBhnY+oSafmLAG1AtZunetcDtcLkjVMrZzf59jVyjOl2kabIJLx6Jp/HgKC5fx7B
 go3YHU2d6ubZXKslTBWI+3UQO/5pxA==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=69034634 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S6OGlrJxYZSBbBCeTXAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: VT0womTbDpZ3Wc_XnIFEEkG2BSH-bFdy
X-Proofpoint-GUID: VT0womTbDpZ3Wc_XnIFEEkG2BSH-bFdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300090

On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> Patching existing DT nodes based on full path is error prone and
> generally not recommended. Follow the pattern introduced in the last
> platforms, add gpu_zap_shader label to the ZAP node and use it in the
> board files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Let's pray this gets merged in an order that doesn't wreck havoc
or require resolving conflicts across 64 files..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

