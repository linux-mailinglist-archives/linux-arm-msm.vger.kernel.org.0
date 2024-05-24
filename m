Return-Path: <linux-arm-msm+bounces-20381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6E8CE027
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 06:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EADD0283B57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 04:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100952E3E9;
	Fri, 24 May 2024 04:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CoO1YwEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12B21103;
	Fri, 24 May 2024 04:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716523596; cv=none; b=cQ+aPiIQj5U2y1NPmh6uYxC3SvbPfb51NOzpGW9BHlrEOz+qUIG9prPwpFuGaL+VtAcueHGkR/uMif6AS/X921OF37SUW5n1se1WouCuiYs8dplrxQbgUUKqz1roxlwNzIySK8bQuFV9cYUzYv2pdcWN2WVG4k4b++j36FHUPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716523596; c=relaxed/simple;
	bh=AUgE5y8wUm8AHEoy3rloeWlNGWAGdOxfmBQ7siVTi0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cZdKLlz7y6T/Q4doo9+i1dU/O3qF3eGp09J54OWsQ85snru0EImnAZIHJwbDbXx3vtr49FqFAtMMEfBt1vyzyWG5GZ8gXts3AEyEemQDuMddjy0f5vEX98o2PLYDflZBX0KdJV04On1i+I4CeRYSIRCqp7iByAS673uj5MlllMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CoO1YwEw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNPCFf007607;
	Fri, 24 May 2024 04:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvsVHHGQMX8vsgLsUH1hfDe87KvwavpeCjJC8JQ4OaU=; b=CoO1YwEwnsCvO6rA
	bjcqSeF2iE023pE1AOzP05k7E9+fJrYUIsOBm6biWHFRsYdz7PHleli7b/mY1XJe
	D24b+thoJnbxII+bzeiEHqTjkqfnLhIxPCXO2fmecO0v04uW7aqa23w1J6uohoc8
	WtMUDUsKUD0WHEANA85+rUIg/Iv4lkTO677O0Z4+ijtKId0yepLo2PRl8S/0sUpI
	xCXfDP7u4LuFFRaKXAYM2h0z9GRYXlZ7jANXrOTCPGx/ONLvPubuWq4hLv3eI5HJ
	b8v9Y4wzYh0ghtxBAdzWJGslmNpVDrodeAQ9xhgkl25RGFsDK2TdHqcVIgaR4zSg
	+9uyyg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9ts575-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 04:06:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O46Gfa022937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 04:06:16 GMT
Received: from [10.216.21.109] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 21:06:11 -0700
Message-ID: <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
Date: Fri, 24 May 2024 09:36:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>
References: <20240524035350.3118981-1-quic_mohs@quicinc.com>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <20240524035350.3118981-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EXSyIxdS1tXOhZAk7cWSt9yHgp3wbtQC
X-Proofpoint-ORIG-GUID: EXSyIxdS1tXOhZAk7cWSt9yHgp3wbtQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=713 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240026

On 5/24/2024 9:23 AM, Mohammad Rafi Shaik wrote:
> This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> QCS6490 RB3Gen2 boards.

Please ignore this abounded patch series. No need for review.

Thanks,
Rafi.
> 
> Changes since v1:
> 	- Use existing sc8280xp machine driver instead of separate driver.
> 	- Modify qcs6490 compatible name as qcs6490-rb3gen2.
> 
> Mohammad Rafi Shaik (2):
>    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
>    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> 
>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>   sound/soc/qcom/sc8280xp.c                                | 2 ++
>   2 files changed, 4 insertions(+)
> 


