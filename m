Return-Path: <linux-arm-msm+bounces-66662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A3B11AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E84514E07F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014AB2C325F;
	Fri, 25 Jul 2025 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5VQftU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B42C15AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435049; cv=none; b=vFtmH5+zUaVKvftvS6Q5+v4uY/Xq1lTvjByW9sdQ2ufuFfWwhus2gkdGkFVI3XIDxuCFICQS/JQmSGxrwxu2hgRxXM5P+GcrRFFTGWsyQXI7qA0hPlkUyIZN+e6NjR+q1D4hb5hawQf1aMf1I55Hf62IUGITQTtGKNG2eLjc5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435049; c=relaxed/simple;
	bh=bOBAINPbtYNFViCYV6WDeBjBQ5bXvQbgtV/iznpIBlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBC/ibcP3+Xe4q7zKQnt39dJwpQOWgTyXMxJjD/wHbp1TATpRbnqP2u8jzBYDpeRXxAF/ftScEp0ap85ThCbDLXUCdsXYt/lGDPnLoF+0LlBCWk2BzdcF/fhiLJrld6aEd7HLtL3GPNH4QGNhbTHmugGOpIAPS15SrDgUNJF/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5VQftU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLoKaw003687
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KMk/UMFV9pj90RnZdgAu+v7lUkWr8SQyyGYLajB+lk=; b=X5VQftU6nL/LgeEB
	oA3ZHJiilg2Cr0XlOhY7uQgCURzZfpw276dpG1LCUQbL7dpSn4v1T063GO7U9M+p
	UfUd4ZI2bsEPrdRn/DdPHScvSoF+5UFzuVr/pyXh6DmO5ww4qvgV+u3KlUQYE7BO
	bQxYlUoa2vizqLIxHqV4dbsS+RnXmiimGOsi74QCy2LKbZ9baAkfGz9sjXy7EN0J
	ICpY1EVYyRx046ZbwH+q6eLxFv5fonAZxqRauIX/nfjGhP/d5lZIsdcgbLZ3IXmq
	4M4Wa/MQ+Y12mOzSx+h088zG9yB6sRdADoZHWkLO7N2GvlzH4NbGRKMWEIZ0X0XM
	HfFswg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2xhfx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:17:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4abdc49ce0dso4320111cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435046; x=1754039846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KMk/UMFV9pj90RnZdgAu+v7lUkWr8SQyyGYLajB+lk=;
        b=Giq2tTL5Cc7mVu8+CB468K1pC8FHn5e6gcCJg/xW4/66hOu87lDg+Wy8qia62vYj6p
         qSizwmIqNEOmx3EKiTtoGPH/GRkmVQxZx9bMD0sSA2ZHxKeUJRju3QnIayakuI/07Aa4
         EmKZEvEiwlPxdZ8MNhIzEas2JjbjK9AS0PN9IXZPlQ1I9ykK6Z3vR6ZdGDhmzEETUi1b
         EhJi3GEanMvCGi6XCQSqLWjBGj4LnhgZJ4r7o6R+XbZsJ2/ole0DZDe7Dab63m28JyBM
         0zhKaQGyNAKMJyqLw8YGPkSYcSq4qd0YeUpPZ9l3mP+eaNF4fZP+c3qU/OQAYalByCRO
         pnqQ==
X-Gm-Message-State: AOJu0YzucP1VS5z+hHeuy/h3y59cMuyPZUBekdsDFJpBoF44icEJugKJ
	qYRHR/LQEL8wTU4SHq9Ler0i5yHsDWWaJIgslI6sNpuKEJzG4adshys1wbksvQCRbn3SirNajsk
	b6flLS6hlj9A7il8yPbhIWiZMZJRcrVbef5Uyslpj062dnQGQdKYd3H5nfNEXvjc+1d42
X-Gm-Gg: ASbGnctpaY45JgDWRM7ag46F4qS4za6Rx2iYZA8TdTGRWddWD+qSdxR1mUgC7j0shcz
	HfRiEhHB/qOyAL7L+DKQE+naoxUAZjjIhv17fncN516dhzOWm6ZL6OFKnDadS5nad/7pE/T34zJ
	xMKgKKNFSwoe8tRGU1zA0ZrFI9It9niaHYdiPg0EvDEKa4DF3Zow9zJzfQAV04saIvj/1pH5xbd
	lyCHCF0ZC2AtuyBXZTwtzmr1QNzAH4bvP8Z/i6x3CuGiapmim8+PQ2qXZkPrqLh+Rp/OL5QQxqy
	suNARTcc1FUKEE7n4ebGazwQUZBp+D3rIfFcZllKCOT5EAtW6Ur+hpHQIX0LQXE4Ny/AimRO5W1
	sdzmKW7iKn+DChnTRlw==
X-Received: by 2002:ac8:5e0a:0:b0:4ab:7daa:d84d with SMTP id d75a77b69052e-4ae8f05f1d6mr5130381cf.14.1753435046011;
        Fri, 25 Jul 2025 02:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv5/tQIemrC+cdKCLUc8nfT6WzE6Q7lvlNrkKLdqn3e6ZiyHMyr+3x/nQjJZgEZbx5Og6OjQ==
X-Received: by 2002:ac8:5e0a:0:b0:4ab:7daa:d84d with SMTP id d75a77b69052e-4ae8f05f1d6mr5130201cf.14.1753435045492;
        Fri, 25 Jul 2025 02:17:25 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff42c2fsm234902166b.131.2025.07.25.02.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:17:24 -0700 (PDT)
Message-ID: <452c6a6a-3d65-4712-a105-386d8540f2ff@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:17:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250724155632.236675-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724155632.236675-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u7CUN6pRnu45EDs-L9-xBU9JCl8NkL1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3OCBTYWx0ZWRfX5m3GMRVOg5lP
 kqWJhjKkxn6KkD+9G6ABqEinCqHaevIFODCxYIaDukFjptecUIhWAUCjgCpkpU5YlOjFmXGA2j8
 VAQMfcSoq8KIKy3LC9fsxf/sJ0SH7QHukcjCdrTvbwHzOL+7aObgY19xpbk7bmUCS5ofcb7TF3R
 DnsS6Hs/PpvjWS7Io2QLIW1D5lMP083dmgAHYwMCO/u6dNd7CKDMsSZJEZcgfAamvFhR3AfrOpp
 DK73ObzxyfcGmTcFz48R66l5vV2+CmPam06kCgdCuRL7Wih4yLmEY7SMx6lBnIueNPCRlDjR5We
 r4i5nl4tZPaGHmQjPsh+doH3bJMPIfK+3yf+pu0DBY02aL6bu0LyLPOhLMCtKIfQBJWbgKYkDxz
 zoevXxP54UaBHhWmNjMuP82QRKPIFkaiSEChYG2RALPwJPeMrpTyBLbwABIO42EG4aGtCSpQ
X-Proofpoint-GUID: u7CUN6pRnu45EDs-L9-xBU9JCl8NkL1P
X-Authority-Analysis: v=2.4 cv=S8bZwJsP c=1 sm=1 tr=0 ts=68834ba7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RUmmF2Cuiqa3jFE6LK0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250078

On 7/24/25 5:56 PM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index ba8a359d8fee..a2d9aaa641a1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "qcs9075-som.dtsi"
> @@ -20,6 +21,57 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	dmic: audio-codec-1 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
> +	};
> +
> +	max98357a: audio-codec-0 {

It would make more sense if audio-codec-0 came before audio-codec-1

Konrad

