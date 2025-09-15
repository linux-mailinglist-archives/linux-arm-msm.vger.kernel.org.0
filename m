Return-Path: <linux-arm-msm+bounces-73489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F96B57155
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D15A179835
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A8F2D6608;
	Mon, 15 Sep 2025 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7aTH1U+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE7E2D3209
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921082; cv=none; b=r/36ls+J5Tjgi7306YJXLHPx4koFvwEmfidTXR9Sck4sETK7+REKx65WHnfShGwXzQztG2zqTBNO47KiucFEeBm0AoedN1TlK78TO6FAonKkUxbt3Pq40p4hhMKgKvxiw3v/AcFrYvjXa2D8YkwkC3K/v76aDoo01B/Lj2iCJro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921082; c=relaxed/simple;
	bh=v9F4i8TUborpz/spWW/4XqdCnVrGLjq5qMMvSVfHMtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgyePqW2dFaTJZ4rF9QJaOFy9aYEgHhwudcCxgaJe27eZMi+3JzzNkP3RdjVWf7H8cevOfnG7eWe0vazItxIDZXYRweaNblPATa2ktYgMEvhkZLRmyKRd8fqxHNU80jIdI0nQdpXxUDQnqnRxCSgwgoRcRos+1+HwCODJxFxW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7aTH1U+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7ICV9020279
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1rxht/ghut2kYsSXQA/bEwDqukX2wUUOiOiBXSJJsM=; b=o7aTH1U+X6IQ6KDp
	U2lWa8K99eXcw//1FxlfGPjmtIe6M0ieeFTTR8DWTJ8evOIhepeKin4g+5USKPAj
	Q5Y/psr8db/m3mhibd9N6/ebSuw8KBHhz+LQQEudzRrjvvPAinKT4DEgehzNaevN
	ndwuPZhbR3dwV3vpiut7r9ZuDFKx02tBWwiV01pNFvUGTn/KAU/6AhUN8fpcwzpI
	zEavhS+ERDtHU9e3I8MQrbfxR/Xn0iy3fWjbcuaHjfeGaW0mwv+ZX5JxCAAP4TMi
	oqKI73//XUtzzhOkTI9rymDgYOTsTbzlQb9NgQwD8YgwgigR1/UUHQ1m0qotzIJY
	AAab1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqptp6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:24:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7802f4ccba6so1099426d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757921078; x=1758525878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1rxht/ghut2kYsSXQA/bEwDqukX2wUUOiOiBXSJJsM=;
        b=lF84FoJKaE5qvV8HXEeM9AR8z47ISEA1qRHsOrzlQu4vRExwWyAR4VbFsnwu005hWY
         bv9fYOtAVHDcPfB6s5nAgRRtsnGvip3as1uZuORdFXipNqQFyBlOgo28HPdfzL6hgf59
         Y8AV7UtqR30wFu9msgoComxJK239ZTWQzmS3gIjKpyHAhCYlegHFjcgt13D8JAlgHA/D
         Tz4p7J0lAd7Rdy7OTb3cT4nVqhwxvIvnSsoD4m0U/feVWESZGZLMm44OPPfe6dPMwwrP
         x/wOSV6ez/7uk4uAQpyEo6JbFqAynmRvWLbwzFgmzXCJBd42hg/u0mMGC0YLRhHa9ceq
         +gmw==
X-Gm-Message-State: AOJu0YztQBY8NuehEfj/jnlXhr6hgsWH8ktmqf8vwoEdnqgBpOPcNdTK
	mQz33QMUNlJf35n2ykMV/KCq12wiinGrhR9rDnoGohiXyJEmLpcAUQ00kvAu4TDFKOtWMK1r3Y7
	rAXYCPvUCBionlk12RT4/LWi3yk0NaOcNw9tUoVDnDqaCKYhDusoKbUELZqLXO0SQZPsxbV6khu
	tj
X-Gm-Gg: ASbGncu04FjethuepXA3JyE/qsH/Eis+MVyOjK8UDHUNI/smtVeH+whii8/Yuz9gWoq
	pXgTVERWtBFVtL07NIpZ8Pe79/3At1/2xWVHABN2E8xsOt8N5a1+JHluzVw15p4tEog5yxvnppY
	er6dPBxen2l5UM26iuyBUKs1xRQQ47D/OjLtPlUwlcGZbDzmhtAsjcUbmTDRsSlEOJnSekHTnHe
	DkMnstfWtQ6uPTh7w9jWENjcZRMEzLOAZWAdnANlhq4hQEwwh+/N3sFXFdwt1hCnM0NXq9YEyiJ
	J8QQhrhSWCQmLlYcUFAgknuN4Gd+XRZo/TERjitXEi6vKzmoihx19JwCs7cZLWo3z40SFZD3+Gz
	uy2fQBvmCDpuhqPwjYO/YFg==
X-Received: by 2002:a05:6214:2585:b0:72f:27de:9443 with SMTP id 6a1803df08f44-767aedc8d48mr99088696d6.0.1757921077940;
        Mon, 15 Sep 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8t06gELRF9V0qtmrxwwjLKo02PZlz+YKW+xvnTDzqlwlOD0FP7KqC7COKTcSwV6etpfo0qw==
X-Received: by 2002:a05:6214:2585:b0:72f:27de:9443 with SMTP id 6a1803df08f44-767aedc8d48mr99088476d6.0.1757921077435;
        Mon, 15 Sep 2025 00:24:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ae181sm8875935a12.22.2025.09.15.00.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:24:37 -0700 (PDT)
Message-ID: <9a18cfae-4fcd-490e-b44d-6f9345cc7c3b@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 09:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 4/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable UFS controller
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-4-045f7e92b3bb@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250914-radxa-dragon-q6a-v2-4-045f7e92b3bb@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y9vMXPHBC2ilgdll2G0dYeEjer_x9nUM
X-Proofpoint-ORIG-GUID: Y9vMXPHBC2ilgdll2G0dYeEjer_x9nUM
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c7bf37 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=ksxQWNrZAAAA:8 a=JxrhfIILcghro0na2cYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX9agAyoZd45eZ
 yV7ysl7qwaQT+ytsFuWTRGypDXlvup7/5dPWJ5xGEk4qF1F8rcn8g4je8Uhcsytk+pI/xUbOtAi
 tBlZITu9foiP/4NFnR3F39CzH8sD3gv/oOhqfkeOJQuE5AtI9sWt0wBVcEK3IG0+Gwp123Qw+22
 2yCrsEt/4/Sf9lJMrlO5avklGDBQvRgvtUz/iGP1ve8q2JLaCIKH4lJVU+r9a1yg11M17eMAiCZ
 w1cYBrG6b/8SSpH5i+47xfx0w1ibQGVNKQipV5qgzXcHJ73CBXaN1J29t2P/dGzPpYw0Km6Kgws
 E4z0fC36g4pHQwKAarsOxDipcjBcLi2rS4sBW3nqzNNu4yWZ1ae5bjJfohmCw1fmvf1js557H1v
 3yCmqN0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On 9/14/25 5:57 PM, Xilin Wu wrote:
> Add and enable UFS related nodes for this board.
> 
> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> 
> ---
> 
> This change depends on the following patch series:
> https://lore.kernel.org/all/20250902164900.21685-1-quic_rdwivedi@quicinc.com/
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index d30cddfc3eff07237c7e3480a5d42b29091d87d6..3bf85d68c97891db1f1f0b84fb5649803948e06f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -482,6 +482,11 @@ &i2c13 {
>  	status = "okay";
>  };
>  
> +/* It takes a long time in ufshcd_init_crypto when enabled */

Huh? It only turns on some clocks, writes a couple of mmio registers
and turns the clocks back off, could you investigate a little more?
> +&ice {
> +	status = "disabled";
> +};
> +
>  &lpass_audiocc {
>  	compatible = "qcom,qcm6490-lpassaudiocc";
>  	/delete-property/ power-domains;
> @@ -938,6 +943,30 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <1300000>;
> +
> +	/* Gear-4 Rate-B is unstable due to board */
> +	/* and UFS module design limitations */

/* Gear-4 Rate-B is unstable due to board and UFS module design limitations */

Konrad

