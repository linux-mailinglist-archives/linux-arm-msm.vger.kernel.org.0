Return-Path: <linux-arm-msm+bounces-77145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21294BD8A34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C87C4FD088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692DB2D5955;
	Tue, 14 Oct 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIzByqpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8F2EB5A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436175; cv=none; b=dey91fA4ZiqEkHwpUwEm/w5rB/wsNa9eYFbNT9aUDI7fvnBD7gHhSFocyZPoLQAVhz3kW0jfIyklEzZ/NhZXyMOTYeNjTc/7/fmQR6eozIQzYjAFwDq6Ke2zNtEGZmUPkIlf9h6DNh0rWMHEp9rnezz2YZJpezh0BJtIWjNB8Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436175; c=relaxed/simple;
	bh=bVhHjhDLmZz3sKkTchRJtm+6H7mXSchASd7zOLrW230=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvYPor98hr4ZIT5emIRlWbIJ5i1dXBp1TTvRh7lrn34nvs5Cu3yqsLxZGg9KQXYumNVR/uenu/zwiv0dO4lNVv5RN2dV7cHF1tiM0HllYSGhZKD64ytq7sZFKmfpeZK7mIQuIUhVjK9mgpGWhNOLQK+8JZqM82FmG2uWiYtEoPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIzByqpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Ngs020222
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYjKTtUvBgaZV/+iOUpoJCKb8Vbb1mGbZF2yoFSadIw=; b=PIzByqpzBz4RzqVC
	viA+Qv4gO7W9o09y0BuAfFyqv+iX8wqDAr8Gy0vHqDMRcbRBpwLwqMA7gcrjmFsz
	yzJVCjSFFCZltpiZmHBmVk76nL3yQqZRf55wMwTEP4CzvGWkomuqIvehBEVOYueV
	ahNedIy9a39946/RS9+/dl7xN3xeNFGrrYVIxCMIsrznPV+pkPFctS0DUuMOmS/h
	NTlH0YITczx/cysla8tkpajRe5ac4KyKLXJCS4JslVd34l3E0wlTmWAvdgJCX7fU
	r1D6qRyXRWSyhmsjNlrOtQldHb7hj6fFB+TiiFo8JHJy+WPHzkl93E3q3O4mlPWK
	Ox3iog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c006n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85696c12803so377090885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436171; x=1761040971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYjKTtUvBgaZV/+iOUpoJCKb8Vbb1mGbZF2yoFSadIw=;
        b=qyS9PzZNRkKsCbUreV8NFx7uRzmIwfUPhowPZ4Fny+i1bLBVjROcE5KsldlASBDAXJ
         rrBQlYrsZvPMt84ENKRaJLJE/nmZ+wzqHMRzehXIS6ydvRQa24hCpFtRzTMBWMW7/yyB
         K9Ca6L1g/VzivzTmHTYhaCzX5+ldhgnsUpz97X0QWlDbO4l2i29tVSNMPFihNa/CKDa8
         DRbWZJ25L2yHXAxtzNpdh/msxtawhr4dYf04o8YHtM8MRl4c8oZPKYRFBVkkeKstlyEw
         1JF85xwk7D0zHEYoMiziaNE0h3cJDE73RTJbIaM7/zfm8qhwn06jci/6olCdnT8rAzgT
         XK9Q==
X-Gm-Message-State: AOJu0YyFxhoFqIzwrD1QVeFD3MXdYHl9QbnPkuEdpysUDEFtw0OmqBQV
	SIrYlDQQfi8QiajLTBWKmuvB96Lyc8HBAOcQZtfXOtlglszMTZFKRp3p1Etd75buNso/Ej//CUr
	WBp4xLNNF2ecdZqxdT7errSPLV+dkkjwt23on0ckluk1pDVDKY6lXjg32SCYxaBiOx8Ar
X-Gm-Gg: ASbGncvB9EJIjTcawHfoGbkZ0KPnnMGk35w3sRSyIoC/4/E7wcw6Z/lyXSmNQ20HVkP
	UrQaa9/8e3gTBBMwf2YP4KGmGJDsThFjlmQJNQCrZyWd5DExj8oa+rIt1av2TS2XQCMfTppxtSk
	7yZYcln3Yi4e9TECANf4M26X0Fgss5w46vQy0YL+eq35lU3KLWo4dKKtk8Wu9TM/x4XWGyq6DXG
	LMVxtnAqBR/xpJNTfNyUu2OpmH3vcM8+tFRA5o1DZXmUsBFL+FUrs4VC+qUsyI6ErPmnahyDg3O
	vEFKSFmOV0O6BEFDXydEfF0uBGugmi9Y9kV+eWmMjml7sfpabny2maL7fkRfhGU/dTBAlI7kWec
	G5YdOKthC0Ea5lQVWt3L7yg==
X-Received: by 2002:a05:620a:440a:b0:861:ed2a:2f9a with SMTP id af79cd13be357-88352ba651fmr2122068585a.5.1760436171322;
        Tue, 14 Oct 2025 03:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt0D7zWO7HIZAtXl1MAeQkSXOlc60URKPIzuUVE8zwNTntzw8XcV/pBFh7aasaW8fEsIs7/g==
X-Received: by 2002:a05:620a:440a:b0:861:ed2a:2f9a with SMTP id af79cd13be357-88352ba651fmr2122065185a.5.1760436170724;
        Tue, 14 Oct 2025 03:02:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1e89csm10859296a12.19.2025.10.14.03.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:02:50 -0700 (PDT)
Message-ID: <ea12c0c7-c629-4014-8bbf-862264182c0b@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:02:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: r0q: fix reserved memory regions
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-7-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014044135.177210-7-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4QpC2-uUt19lMMo_m44T4ULI807Q8uUE
X-Proofpoint-ORIG-GUID: 4QpC2-uUt19lMMo_m44T4ULI807Q8uUE
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ee1fcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=w6xXu69wQtdwpxc7i3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX/hx4h5MS/oIi
 jsNHSe/ZAn/3yDMfPkjQ4lMRVFUQs6VvxXhZMDnEEaodIBCI8aMVBoT0xVUX1vwcrCZ/+kDiKDz
 CUlQ+1fzB7xAMuFJCU4sMairiqVLPBTBmUFCrbF2GrczK+BmSK/J4oqoWxgY1k/2gsgSJtH+5zH
 Df/P1dN/nPsbSUeOKXNuA9RZjSP4LLYJ4rGarEAk/GaVRlwI/3zgWdGAHpUIH3fnGMFd51ZZvdw
 i4rHnRip2/x6cI3pFZe4lI/kwKNJj1MxjYZK4ZvV0b9ZF3uve9wDZmPpY++bNUnnldVEZJjLLL8
 ykF1ba4Mrr0n5f6kW+b+CzkrTxF5SQKf4LR2GvzJko9cbpM07hGjyr8Rj7virW9ZbMUAnmLauet
 NNpI5fvKQ4NNyUKdEBDgbdkpPzqFWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On 10/14/25 6:41 AM, Eric Gonçalves wrote:
> ADSP and video memory regions in SoC dtsi is misplaced on this
> platform, fix them by deleting those nodes and redefining them.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> index a3b81403d180..8ed8a67aae0d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> @@ -10,6 +10,9 @@
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
>  
> +/delete-node/ &adsp_mem;
> +/delete-node/ &video_mem;
> +
>  / {
>  	model = "Samsung Galaxy S22 5G";
>  	compatible = "samsung,r0q", "qcom,sm8450";
> @@ -64,6 +67,16 @@ splash-region@b8000000 {
>  			reg = <0x0 0xb8000000 0x0 0x2b00000>;
>  			no-map;
>  		};
> +
> +		adsp_mem: memory@84500000 {
> +			reg = <0x0 0x84500000 0x0 0x3b00000>;
> +			no-map;
> +		};
> +
> +		video_mem: memory@83e00000 {
> +			reg = <0x0 0x83e00000 0x0 0x700000>;
> +			no-map;
> +		};

Please keep the entries sorted, also with regards to the existing ones

Konrad

