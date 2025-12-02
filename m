Return-Path: <linux-arm-msm+bounces-84098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDEC9BE9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 16:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 307024E02B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 15:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5999C234984;
	Tue,  2 Dec 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPNMFAXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6xKrh32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D3248F73
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764688527; cv=none; b=ipZWz33ldJiAlXSPh5zTWLe84hmyLk2g+UcgQ6xuOj1RSe05lV7GQh8cmb39irdjj948HoWkzjaOLRt6qz/wXOcysgrFkZpA5xzmqzLnwbEuAbdWWBlBEEGw/i1DaF2PWLG6lg2aEzI3gUEqwr0OohH/7sbQLPRTMs+hjADhOqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764688527; c=relaxed/simple;
	bh=mGU0P0Nsy7cRZBHB3IqZ3VM/AZWSLy5zNKhSVRTPp0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCyxP27F5Pm9RVu+KF5oJfqo8HIel5D8jgtEgzu38f9KtaA03WnnmrMjVA6ffW3Wxv0JgoibqK5bZH6cBmqwWF3zaRvxAf8+/sxTaZqXJMcrf2FXf3mFDNeSU1gyvwo8SOFR6zHX6XcxSvvg2OUIP4LkQpooIZTy0m4TJnQhME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPNMFAXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6xKrh32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2AprvP1591477
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 15:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8yAlxqtLJ3wQnUHwPJgBmoZqI7/nkyvP/IJINqHTj+Y=; b=FPNMFAXCE8oDEgNW
	rdHreC7p+vUlIEkgj95fpurVePgH0A6MFFKh1ebc5LAFE8iZ+lyXcInGeSrJ1D8l
	shbtwdgm4xeAODBhVItTMozGmO0gMsxdCX5nlgKV423Z0uiFiplAZvrokOc5cT9R
	9ZkWa2Cn4xJJlbyhYOKHc6jpdPrGc5wvQzE7DHLiw2acWgVaDvXWCDPaJ/RrxHTl
	0r0WcSoDCX0APxvjUY5MB+LB2Ol13QR7AKxoo7+5z4DlF5ENgE5OzqzZY1Ge9ryU
	UoBWuRWrQOkvDfCxawBcPxhA8jsrM5qKfW5xDf/uOy0y8RGJR1K384aBlmYNO01j
	HRqL9g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr9yb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 15:15:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5deccf35f25so273202137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 07:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764688524; x=1765293324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yAlxqtLJ3wQnUHwPJgBmoZqI7/nkyvP/IJINqHTj+Y=;
        b=T6xKrh32WlazcKN926x4pXEjgdPwFzVjQztsiRL5tGD8knYQovfBOTU/hem2715Yn6
         VqHhZCFx6CWCpJY+rX6GcDbXNaX2Qe+1Cz3lGcV7RTs1v2TFeBBrBlC8GZZ7e3g6esE9
         0gECTfWr9r+LFdVg4uEPDnkiXMkuejVl/wjGThs4XJiGX7R600AEo+bXvCJJjcpTGHHC
         qo4CCW4I1SR43ILozgsmldVbE0epvVYXcXtM7vO+g1Nift2el2n01izKZaxVWsN7xgBp
         4JGBtZ175+QfE/481gstBSzkBQfH9bof15SQa3Mv7EhAvY7UYpxJDFDtrCrWp+aaa0dy
         4hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688524; x=1765293324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yAlxqtLJ3wQnUHwPJgBmoZqI7/nkyvP/IJINqHTj+Y=;
        b=bhjmkI7eR+DENETAXnfLufG5UjMuJmfOP34OfVXeBDSIK9AKAYBI4davglvB9lt/uG
         Vdpxx+/EvpbjdcXHwkGmCuGCfupnZycLzF2wWwv8l25Ah0HFNOfZ1TBjHp4DH3HzUJCe
         ND1QrRdXUnnrvdMj0PI5OlHwcEm5S0xqPFtWAUOY3+inlWinMTGZABM5fWYLCNayKiWW
         R95vfRaOV9x+CBu01BXkG+gnfOpTrSxKFW9QbcFi0i490AP8PkrIVzQMHXJmb3LCoU0F
         5ImEa2eNOvyP3EplO45imMcuNDTKu35fvaOUTpOsX7tag/wi2QI3b/iOw9CMP+6fuJR/
         GonA==
X-Gm-Message-State: AOJu0Yw5iL/Dl5clHkGpBxluIrTEzi2sjCcWB+pJqf6GKzgFmGMSAgkd
	rxduZbXYVKy8284Gy/Gr5GdfJrELVlU7ubuXH1rBFw839tSHHokA7O1u+mEAEkrA39rUV09QsU1
	+0AiD5AgE25JZTevcUXalxQBdvlzrZmh/uhZal53Db6+q0D89o2cf1tZPp6VF9BtrctLJ
X-Gm-Gg: ASbGncuLYv5V2khFomRlSJCHU4pUVN0c8rTv0LGu7FQjw5ka5ycCPKoDBBt2jLnpIwC
	haZy0be/Rk3TR7JLvur34WbuZle5dilK8l/xiRp2bg3AN/BTXPreIjpawpeR+azRI6eI1bJF+8G
	bia7ASr/gPMlU7vDhBw4Oo6mc7MLUHZJr1nf2tZexdmd1yU0z9Khxh0vvWcFokGWdeYWqo3eGOA
	hFCjbZ/aFSFsp6RgnTVd2cl5wW04GppSiOPcSIud8QmKrqI1awLGFrRqK4hbGKN5nwjWlYYDCYC
	UO6Qq7l5F0vRzjzR2CQx9kegg5aqCoaw9uFeHKBaGIRDsmvZxGs0lVyTtNhIA+jbrQLqDodCUek
	DiL667TjBD4GsY7Sasg5B3njPbzbW1G2Rr3vkD8mgWgX9H14ji08XfBKf0z+pDk+WyA==
X-Received: by 2002:a05:6102:291f:b0:5de:31a4:8702 with SMTP id ada2fe7eead31-5e1de121d6bmr10164743137.2.1764688523662;
        Tue, 02 Dec 2025 07:15:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEST8ZLfQ7IQ4y4gZZBC2oUywwREAPPojaVrxOyuZtrigcP/fGYB6QBsnTg1QYZhBSfGmIEOw==
X-Received: by 2002:a05:6102:291f:b0:5de:31a4:8702 with SMTP id ada2fe7eead31-5e1de121d6bmr10164685137.2.1764688522664;
        Tue, 02 Dec 2025 07:15:22 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a5f979sm1515119966b.69.2025.12.02.07.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 07:15:22 -0800 (PST)
Message-ID: <b18846d4-0733-429c-a667-a0c3c872f009@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 16:15:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1
To: Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251202143757.69817-1-ggo@tuxedocomputers.com>
 <20251202143757.69817-4-ggo@tuxedocomputers.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202143757.69817-4-ggo@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692f028d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N2CewTqjCUGRCYXJoYIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: h4HINzNl-Ef5eBeBUOsph31za_yIFifX
X-Proofpoint-GUID: h4HINzNl-Ef5eBeBUOsph31za_yIFifX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEyMiBTYWx0ZWRfX+ABVQyKZ8rCI
 Ho51YOfHU+na2leoS2IIgkZw6D114PpalDInVPTYkZ0zGK1jRUz2JRrPI2SVw04skaKQFF7I4mK
 Xhc6YskOWf0mNeZojtX5CBbuJjb0i7P25LbTWpiqVK3DuhgeJAnOtei3HK/kGz7p2HH+XPPkrRx
 gQcRGtuoNeimE7+OL4vzmetO3lpmzpQ+XY8mlO6dYaYISfR2BoegCI4b/eQcQ4RIQFXOuGIigdJ
 imSrmF5t3uKslF4LGhIeaqK8VYp54MJveIga20EbCyfxdm2H+7WrO/D83W+esOuMuwtwFJFeRl2
 GCzl2kOtY7qWdugvoZbaAGT4G19XVSHEoW3SYgDOvJppYTAbYYoW0OoZ4/b0KKiO7Yq8vLZaWYe
 CdQe9XLob+SieVgqnbR5I/JUlTOrgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020122

On 12/2/25 3:37 PM, Georg Gottleuber wrote:
> Initial support for the Medion SPRCHRGD 14 S1, which is based on the
> Qualcomm Snapdragon X Elite SoC (X1E78100).

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/medion/qcvss8380.mbn";
> +	status = "okay";

Please add an \n above status

> +};
> +
> +&lpass_tlmm {
> +	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

Let's drop output-low from these two, the driver controls that over
GPIO APIs

> +	};
> +
> +	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +		pins = "gpio13";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;
> +	};

[...]

> +	eusb3_reset_n: eusb3-reset-n-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

Similarly, for all three eUSBn, the regulator driver will assert the pin
as necessary

[...]

> +		perst-n-pins {
> +			pins = "gpio146";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;

PERST# is active-low, switch to bias-disable

[...]

> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;

just like you did here

[...]

> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio191";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

ditto

Konrad

