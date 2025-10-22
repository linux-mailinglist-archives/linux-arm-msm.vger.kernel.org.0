Return-Path: <linux-arm-msm+bounces-78376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B4BFD686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF5F3B6C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01232323411;
	Wed, 22 Oct 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExFBEa56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FADF329C54
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150537; cv=none; b=RG2DxG0WLY8d2kbZxo3Ln8B6g+kuAUDc+ovfYNUqVjFfHju6CuAHa3YLNsf3S79GThmpdTk8WQ9kgwyCXGOioVoOo7CXO+dgQOcr8DtZ0Sg/czFlDtZftglp0b8RX6Z6qDzHbdICybbLXB8czw3rbrURzBzEFNqGfZhxaaFacgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150537; c=relaxed/simple;
	bh=gnYSeDQF9A0l9V1yfEhZWeQeVljEZJwDS8hyZnA8a8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkAkL/Dkps9gKlLoXeLG2hNndsWQvBnJZDx8LUGh75/1tyv/515m14wcs0rsFTSy0wx6A0NSdjJZOprtqL6sE8iXlqTfYWVgmc1TW8kW7IDElfawU0Zkq1KfZFnK3YmZ9nXRQwRiDhf3x23N4FFs2rXFOk/GOS0xbkQbOkFO2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExFBEa56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAIu95004443
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q1jLNGTOlSGGQO46A4daF1PWlbiRuH+dyUe66KEnmxI=; b=ExFBEa56mge8uk+V
	+CJLI+jZIHwDXJrL+phLYqFdD79kE0LukmSVvDbNE4Di0BuB2LLTfoyheCDkEbNp
	7QqkPThxhvxm3HVc5hP6FG5w7CZWjj8r4muWYgoXLJS1o9cVVctogpmDqf5Vr5I3
	zsMzmG3MZGUmOflouet+PO5yAmtdLw+adUF11CeLOKEVocMD2X5SazR3NIlR+lBn
	9k4vnpFEfqmAVpVCFNezpHvzmMYNiNgjDRhFivu+dRBVIeVDrCi9Nki7R/I/68C+
	p2w8QyYeoRfGtYh52NRFzHtr6LSYsIXFo0GLa+Jvr58ctAGhnMnozDc4ZWHbuUg9
	GdvNgQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfnax4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:28:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1d388a94so23220856d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150534; x=1761755334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1jLNGTOlSGGQO46A4daF1PWlbiRuH+dyUe66KEnmxI=;
        b=DBgyEOCji7ptQGwqePyevnoBUUWLVz3SvznsLRzdrmMmrFyDBUAKmqPlqt1d4pdSyd
         LZEU4gar3hrkpr0M8btjg41oMk/XwhSgbXFMlpWzVMHjIHSZEZyHtu2RNDK+3QRkcUHB
         GuO1Ati9MpYilva9pk+fEAQvjnHsyaWnq8BevlCTsxNQXsw7dU+N5vaTszffY93b3Uha
         0jxMo6+o0P/k1+DxcFZbQnpacSwXIWBbCox9H9OfCyw5pHuEJ/+mOKkahFff7l/tbiVS
         wResGOUaKMOvf+vVQ+C5+9mw28log9jXf/7+vfIepHCaduA9+9h88o/Q70Xzt0Sk5fl9
         q76A==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZgiCoCdnd1N+PIrE3CgQJSoAl/oXTdmjaImCjpYe/43z0SURuJ4UF6jzNe1FK8fAwLtN/AqaXRKyN17O@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/R+vBN5SDK0RcEXz6VErpiPlwpVAvJzcnKrWzlAJEdQ0A8T1
	+fXFeKRd5GCY9CdX4PF+okbxfJVyNCAoZZ5wpEpLrn1wYxTE4nKQ6Wu6LemTi9mLWMNGVVonsE2
	x7umFLfVAhy4D9Fnh8vvv78gNCZfjYFSA6yD4JS9+WaadBgMThspqrUlLK/jaO+VTjeHf
X-Gm-Gg: ASbGncuMrFwOc8sIXGmw9kOfZAGTo7mW2ZO/rFjsF6YleIcBaNsPe4Hwj7YP01hKmqM
	Bc12H1Rqh460V1pZ7rseDv/jaXu9RxLeWQ+f+qfzRoRM5OjlYiXBuUU/mLflvQRaM3Bao5tMMRF
	e+ZD80REfiKK7UmjdO+PjJoYW93zbQnQJReXlXGzIWwQaVhIzRhbL1Rj/n3dLPLfwjjQNyE5TX+
	CZfnjL8NGFuaGL3V62P+ON+9rFAj7ssx37Wyh/Y9aS0pYNs954iSxQLbFS/xJdA4Dsb9royJrh3
	HcG90JyqJGDFidm63rg5C1IbFDPZkqNlc0SyLaG2/tD7ABW+9O6bNhYFL/4XsRpH5YcS7oNql0X
	IpOp5XvTC5S17xgeMGA95xjMIzqgT4JZ3jN0wBymlEtr2dzyAb7EpB9tj
X-Received: by 2002:ac8:5f92:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ea116854c9mr63132011cf.2.1761150534407;
        Wed, 22 Oct 2025 09:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4oJ9oXYk26oTyLnsc4HCl+yoXOudlAJ18eVcGWTDYAU+63VcV76YKqc3oyp7E8vwvDJPtcQ==
X-Received: by 2002:ac8:5f92:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ea116854c9mr63131831cf.2.1761150533950;
        Wed, 22 Oct 2025 09:28:53 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm12526984a12.31.2025.10.22.09.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:28:53 -0700 (PDT)
Message-ID: <4d69e9ba-caa4-49bc-a66a-d085edfead4a@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 Left/Right Speakers and Tweeter
To: Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
 <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kHLiw9Mu81YJQRAsqTQZ-2xpA335t42d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4usLnU91uPUY
 yEqhTdWpgMN+XolcsBmm0gIhPq30Qnv4nCw/zcXONIw5JngqiSyZTJWsr7wXdOAerPPjKKJFS4V
 XncqMnK6oUo8JdUfypicfY3ZHalF5Oj4dWew5ZwZDc/llGzvKjdu/BajO2fbwAIcyLjojA1Bsbi
 Wzj+MynXPeUXvKbx5pEWw2+2/2eefr7Det1bDwSNuli8jAYfE84gHyY8k+asQx2o6qOG+6Zu8NZ
 rdDcYi1W9yNzcVIEB/EdgOr6LbzgTfilZVd0F1E44pp18Ojgc6uuTvejz4xNycw9OXSxqf9tHmN
 dZyOA+3hlwvduZVPQk2kkEOhOFLLV+xod0vcMzccxYtXbY8OBWhs2cNNR9DlL2o7GZVWP/MqO8i
 GbxDFYffnxQm3uPY5TunPpBCvQpV8g==
X-Proofpoint-GUID: kHLiw9Mu81YJQRAsqTQZ-2xpA335t42d
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f90647 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bOTh6ypEQCZma0slNj4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/21/25 3:50 PM, Abel Vesa wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Enable left and right speakers/tweeters on the X1E80100 Dell XPS13 9345.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +&lpass_tlmm {
> +	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +		pins = "gpio13";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

Drop output-low in both definitions

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

