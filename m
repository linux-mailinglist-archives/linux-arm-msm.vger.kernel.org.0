Return-Path: <linux-arm-msm+bounces-42065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19E9F1021
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05720188E7C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B741E2613;
	Fri, 13 Dec 2024 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fusBVjgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D21E2610
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101824; cv=none; b=ojjq/yRZWIDFAfJbGyoBTBTQk7ocdL2bX6rI6addBbFsxejZONW70HC/dTn17ZjZ3oGGFc/VlveJdNTYwpLITov1BZ/PnUNt44c37CbPECuOasyWGKMBOi832CjyUJnnOXZWzj5b15sXW9uqp9KAkd+EQuEbUCZENdWMVVpKA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101824; c=relaxed/simple;
	bh=CK3rLLzpiXhXNZv2awCI5dlzwKLn18KynIqrlKfIWS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZzOLHYr3cYqjlVIVg84G29s++rsavrAPyU63XFNmovMuQlLHdHGXMWF7+BljAtUGsTAH8L1f3Wt1bu/4maKQraLoxcofcT/QRZthaov1XwnJ/1DF7+XEBB9RrjofzIDjr1Kcgo2zrixXnOUxGr8ehTymoX4PbLOZZA6nrVgDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fusBVjgN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9N3F8006860
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic4TkTyxhhqanbmclHumG0uyeTN9c7JqFV55yYmF88A=; b=fusBVjgNwhYqW4ig
	YOl27Kb6kcVo6ckdg9nFu+xV5KOTdlE1CpRDnVYBfn0Ow1NFiufaWZ+p5h/gxDS7
	DdB5GeqILVAbkbbunHfRD9XzrpH0gSiFUc2ceQLBoiJEPt0m+i8J1l5LBlj5xrKP
	FEJiwgyjaztvqbCqE84vYI7vRx14/IhIvQ/NnShXu/T6/UskRJ7vXhFN+kcXjxyt
	QLLBhOW0GvYlDnK0L+tpfR47paPPE+JT6Q52KhS5LISiA1bbpuhbDGYQkUTENAjc
	idgIcsPOPI7mfpc3LEoPfXgAeFuboZa31XXXFuj9RdsDph6svWkvDYotxu7BJhzk
	kLuz+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xutgbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:57:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6da2abe1720so3165026d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101821; x=1734706621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ic4TkTyxhhqanbmclHumG0uyeTN9c7JqFV55yYmF88A=;
        b=ehu2+0UrooA9ARHl4ZgAMW04Av7iss4Bm0AYATGr+LI9rYIXnhaRnuyO8O4PFcZS/7
         V4Fl/if4dudgL0yP6ZDV5hO5AY2T6laG3x1A1sAoe0cmu4nFJFCEtppxxiytMWVu+OnI
         xmtL/scAjTW325NMH4wREkS6v3Xrh7M4vg38hkgRhyZtSkLivN94hTGbMW+tMFejP+V0
         2k9w3g23Ty9hPgc+icYN3GBZtCSNGqDo+boCmzQWb4ExfKC/w84kATaNGnlSmOs+G3JG
         13VFWd5ac4Z6CL9t23E+OuM/xenGJp1oJTxEztBJ+cwomQidAI6GCUyEYHMD/8dkdWd9
         +J9g==
X-Gm-Message-State: AOJu0Yy5arG22uKWbkQJwlbHePtQSY3CENpRqnVfHfk+Pi7AvHjdKdGI
	4SQTy+t0kbHqFRQrRn+5RLj2epWVhMgVoUP+OKaccauIn0vX2+0g+iTm8LX1mk+VTzUDVBMtYJN
	ia3tqxG4bH7LtBYQn/BuzBiB38CIDPiFR1gFc04i8uqOzyqrxVEr+gVYIF52d/bO5
X-Gm-Gg: ASbGncuuFMF4PQrT6U9TQyqzuzCcacq/EjjgU5wdZz7+PhR30fzuZek8EiFOmnMKBnC
	oOANVph6UrfWFjmBzdm0OXWfI0dcG5DQ0cqb+qBSP9o4An6dT3y1rp6HRQ6CwZAB8k1YkQFBZMc
	7vmP4FCFCN0/BWnKUw+SoHZUWdmmxYiQWJiNWpZTD15lK3f08t4IS1LiSNVpbqMVChtEsARV978
	WCRAdKD9y2EbUTww/CzeKR1UxKOphayWFZjDftrvP4o1D/NlUlUs4m3oHYBwHI1N9wCT0gLAYND
	YV3QDFagEtUfM4jm1OlSxKMaDAZDHphElryj
X-Received: by 2002:ac8:7f8a:0:b0:464:9463:7475 with SMTP id d75a77b69052e-467a571a0f3mr18700541cf.2.1734101820371;
        Fri, 13 Dec 2024 06:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHODc20z7j/rJOwWgwD5YBYqoVh/j9s6j/7ssKsXE/JLg/BfDiEG2ghMhwDfPjVViS3TL+jcA==
X-Received: by 2002:ac8:7f8a:0:b0:464:9463:7475 with SMTP id d75a77b69052e-467a571a0f3mr18700361cf.2.1734101820032;
        Fri, 13 Dec 2024 06:57:00 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a394d380sm501367066b.77.2024.12.13.06.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 06:56:59 -0800 (PST)
Message-ID: <9a7f43fd-a720-481e-b8ca-68150c202b74@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 15:56:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] arm64: dts: qcom: sdx75: Fix MPSS memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-20-2e0036fccd8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-20-2e0036fccd8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mbxxugFMHCtR9_HgehXaJ6IlXHFuu7wF
X-Proofpoint-GUID: mbxxugFMHCtR9_HgehXaJ6IlXHFuu7wF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=950
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130106

On 13.12.2024 3:54 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Cc: stable@vger.kernel.org
> Fixes: 41c72f36b286 ("arm64: dts: qcom: sdx75: Add remoteproc node")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> New patch
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> index 5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303..a7cb6bacc4ad5551486d2ded930c1a256d27655e 100644
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> @@ -893,7 +893,7 @@ tcsr: syscon@1fc0000 {
>  
>  		remoteproc_mpss: remoteproc@4080000 {
>  			compatible = "qcom,sdx75-mpss-pas";
> -			reg = <0 0x04080000 0 0x4040>;
> +			reg = <0 0x04080000 0 0x10000>;

I think this should be 0x04400000 instead

Konrad

