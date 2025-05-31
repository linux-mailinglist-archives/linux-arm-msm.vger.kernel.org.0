Return-Path: <linux-arm-msm+bounces-59951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C75AC9C44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 20:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4131A189EA52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 18:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C948F40;
	Sat, 31 May 2025 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOt1W4ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491A6199FD0
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716063; cv=none; b=UScfD34b4eQZtCINVsjAPOYExId/oHv8LdKa+PpuQN4WlLGQMB+GcLpDcliayyR/CyrsG7TqTxYJQlMnwxmVvg4bWu+y6iCAekT1IomW/yixZJaB5Z32XG3IgNBsRZ07RYG8lPoAMh4rHbpVqvlEKrnLa+usqckGKvorWspiBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716063; c=relaxed/simple;
	bh=QVyTy39kGa7O/ePiyt+9nmFnLXJK/m+e+8pa1txDyEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpTXZcGe9b3FucF8TscnY7d5uNd8mcNQbNFYmMZUr57MAXiblsDFLFdc8Rl8SbHcgRTTQF0ux5DPtsCqazFzTthsRHD8EIVrOUFq6TJaWFaJ2bjRibzAyEYSMUMkomZsw01Ye0CHXcX1peOEhQq7SKMtMsYZOsGILPqVbfirktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOt1W4ok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VF97PV009209
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 18:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=; b=LOt1W4okxakbYLOA
	+Wk4LRUaEH5afMT2rxrcAR0ehLnk0BQmTiKh3x3YqPwgqnsXSToeEzfR9wHASoHp
	KUgabv5mkXnIK/LodEMYUssWg/PgXv7ceS9crjh/KoeMdFFCIZ9UcA7YL6tjUoU6
	92YSDS76VRgKVeUlgZ1CPNtd8z/EUGR4lWACPptAgMZb5L75eJsRw13FI7GhaRyx
	oz8kITxX6ysSpQPFfXBnRra0rXELn3rs3ia53CKwu03mo1QxEMSAf8OfkmqIpMzc
	DyTWrnfQUGOOgIXDlXX3uIZPmEpaj54KaGnxUB0OPuDyc2R+/R/aYVFON+8zAO6+
	9mBQKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw96pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 18:27:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a43b81f624so4092401cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 11:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716059; x=1749320859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=;
        b=KQLLCVTR6Cnnky4MffusPxizcizRo2EDZt53us2Ac3te54eCyKspakYdDxb7oQemaw
         lkSgKoa3atIn2+tkAVLisZlxXuHpk9hqtlUmcWpR5BM2YTXcI+46UyETf35Oni/jjjlQ
         wqrvcFUDx0ngLL4zUfVgTAsjbV7rqrjxXqjDheDWTOQtekQBkRZ/JKKJdP20q0foZonl
         6HTx3ris5VpCHbnapxoEm5aJpGCQzlktZ1k8fHbZc7mCFjgC9fD5y5QsKtPq8Z+1sDcG
         7qHnAme6zxKLClkP7T1fjc/RlHGko1zOYHIL2uFWue8s77z8qZti/bl8BFKJRiKS4JmG
         wWsg==
X-Forwarded-Encrypted: i=1; AJvYcCX7jdVBEMP5UNxpfrL9uZbzZulHnLiF7coPJgYSqmpvklrb/BV0lsaXrlRA1sYTGtAAU94Mk1uunnrNNTvr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5wJipO0afOQ2BzpddomrKMxhgLjp0scNlrSABWglvkW3MQ5Y
	nrlmCvCFkcKCBQuBFcs/616Y4lDPvoO33qoZPGLF+oVERwFAfc69Kmq/41rh1MEH5j6H9U9725+
	9jqdP9H0qfKjmTI0X5GoWMoJ9D/anVXXh9cylGWdw5ypj79Mg7vCrvWyycoxZtCJR3wLb
X-Gm-Gg: ASbGnctUz/0tcbZ9EF5pHjQs2IY18uR/ag9xrRA6t5QsQ0akkPqJmzob84v7tzwQcjr
	Zhe+RHz+9r8SMioAxIDgTlG6D0pGlCQyRHQGBGClg2qIiUUEEMTT1bKjCXmTqYh3o/ZtnJCpTUw
	BQZJsOJKzoGqNMHysPO98Xvtk+HZZlzNLk712zDrJsPiAFH3HAJr3KYGXUsJfrNSkdMv8jfJIe7
	PsfDgqVe56gosDS5XMYXKViF1IMIoEn7sNeU7JMTbe0lo9T+gVou2TcdlagYB3MZhrkM3LtvE3k
	8BHbfOePxi+YTSQnkOGyBTuqxgBSX60jhPw95BXsJ4Ht8n0MudsItapXUfeiB1Pbcg==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413429885a.2.1748716059014;
        Sat, 31 May 2025 11:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4okjwDO7D+IbmXbi6WJ92L36mIWN1ZbbjDie9mCBjaikBKTLN4+hEu+tJwMEbwza5FLtwWA==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413428085a.2.1748716058574;
        Sat, 31 May 2025 11:27:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef7dsm530456866b.6.2025.05.31.11.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:27:37 -0700 (PDT)
Message-ID: <d3ee0492-afca-471f-9dc3-456a94bfa355@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683b4a1c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=IZQIRLw8iM99TnyeTF4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _-7aFAtfpkx1iBKg91AkXF4wFGwxfmXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OCBTYWx0ZWRfX7hjLXfus1LBq
 IWqxVz5zzGrB7FNoHY7bjt1jJRyHs2yu4rk+lFxqw9aqueYgWAiZrnblCTlNcB0tJUOWD/9CzyA
 URJSq/q6rhcBw6hMFAV5OO/gsXkZgFB7b4AiqYuq3yEmZ+K3c7DvXlW1DNQsVsoTV6afvM3irwX
 MHi+g+dyraRo6/nN0q2uISUkl8PTnOQfK0uABzejm25iHY3Bb0E/GW0dnoSwfztnjItNmFLEKVG
 XW0sq0yp7VBkyZ6pcYpGH3RZ7IKNJUrzvyxSC9l7/eGbpRZ0NY//o20W1UGw/XzpwgLFrdkaxsu
 KnPV1Vxtuk+0rIXRplDe7yxTzk7vWTqZUg8vVRBRJ1zrGaK0q+JRQ23nw8o82j5LQcfY3vH8dbp
 7stx4eOtSBgJpJTS6nCwuwSDUAxQIXbzi0/IOwY8demaBvCZjOEKRchVnKqbF7hRtEGtsECs
X-Proofpoint-ORIG-GUID: _-7aFAtfpkx1iBKg91AkXF4wFGwxfmXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=895 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310168

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
> Unlike dedicated core clocks. Core TX clk is used for both RX and
> WSA as per DSP recommendations.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

