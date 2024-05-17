Return-Path: <linux-arm-msm+bounces-19997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F13D8C8908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 17:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 140FA1F25F7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 15:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D555664DD;
	Fri, 17 May 2024 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b79j1uRH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550488479
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715958579; cv=none; b=C19JBhBnVpmyfWSTz78f8Jo0sLqDQPFqpKfshknsHg5/ytV5WabaH6v8Mm+xhVd+UWxGsyK9T+r9WKLeOD35Ywn+zynDsHapgA4zckLKTLgwEHAvDH4YOKWxI+JjUrXeoW3IAr40eJm8yb5BRdRHgBsVPce10TP8FoMIz0mi/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715958579; c=relaxed/simple;
	bh=UvHvPf2ksMfZjTugTHfqmbhPX9a7mAPXwziPNvDMZ1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l/csp8CogXmsiIhNRCpf4TaxezE0TxM2ID0YAKQwHoj3DmS94XCYpf7zXlTFI34Ns3K+ArG02emzo7IChdfy4hvh14yXgA1glUHivnoQPW3AKKHPhss3em5lCUykICdd7XX5ScLXtSnSqOawRc0cwkpil27alXMmNqx8lFMDoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b79j1uRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H99Dl0008010;
	Fri, 17 May 2024 15:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=m+PG3NVc/y82Bd3gd9A6Qlkbj3ODvLR8RDXfvRjUSDY=; b=b7
	9j1uRH2g4km8ovoCEZlde0my1/2ktV3oWvkWJewpWgOtZYv2taJYKVMDsgesp1cB
	3EefBAiUBVrNSh/n+jbSXeKz0PtN4iDiSHmUrg1ACfJugLdYV5Ddp6iKa3+PmgvF
	khhPF/A4EVyuVqS8vTbqqmr1FAVTRucZHDPMyJxsXri047GJAbJdU9m7jVe8Zvuh
	wwLqW6TIjNaP8qxPhJ2w+JsrP1TVXbIrmqpHZk/R7IL5NaepGgmnIm6snX/YHARb
	DtjARjqdUNKDB+OrtVv0oVKWjlV9RCFVt4XKbAkv3KoIkZjIPHP9vZrpBcLI4oyE
	CWLtcM0kCVxYCdNOZx5A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbgs0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 15:09:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HF9Axa028750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 15:09:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 08:09:09 -0700
Message-ID: <a8a17485-76af-0b19-b939-c05a1473767e@quicinc.com>
Date: Fri, 17 May 2024 09:09:08 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: enable adreno_smmu by
 default
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: MSM <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O Donoghue
	<bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>
References: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6pXSITuVufbWliD838vqkMD0P-U93N2K
X-Proofpoint-ORIG-GUID: 6pXSITuVufbWliD838vqkMD0P-U93N2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_06,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170119

On 5/15/2024 8:27 AM, Marc Gonzalez wrote:
> 15 qcom platform DTSI files define an adreno_smmu node.
> msm8998 is the only one with adreno_smmu disabled by default.
> 
> There's no reason why this SMMU should be disabled by default,
> it doesn't need any further configuration.
> 
> Bring msm8998 in line with the 14 other platforms.
> 
> This fixes GPU init failing with ENODEV:
> msm_dpu c901000.display-controller: failed to load adreno gpu
> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> 
> Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

