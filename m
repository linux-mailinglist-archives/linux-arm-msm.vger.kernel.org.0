Return-Path: <linux-arm-msm+bounces-86858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A3CE6DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B37300D406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAA33164A1;
	Mon, 29 Dec 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB6ymhof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHFmT+JS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8FE315D2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014488; cv=none; b=r7Ag6tpLrfVZgXw/VzlzSmyI/4Ct7E+tsU8z61TG3eB3W83sZogNEVsqRNrzXVjEJSHqYYJh4hq0FlD1aTIPSNaMA0FILiLHiWRw4WUmD4wubb9elpEsIrQ80MxildDlnJZ4MDzW1FP4xX3HcrOZt25+8DF20RaGnDt69K+He/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014488; c=relaxed/simple;
	bh=ZChbbDHC5fAQLxNMTY/4TrWyyZUcad3MbyfTBpI+nhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5klypg+O+CDuIEyC63J9FkEexKbYnNay6ej13bn7bjXvPiIF/FJFtLJ9Ld66v+waPSrPCXGPzEocWYaF+IGglHkkp8hn3buK+hgR+Q+mPu7WGBH/ZVmZIBmra2RLpCV8RBjjFI/fg7qSB7j2/9QDPVkY/as64AnZ5bG4/PZpg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB6ymhof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHFmT+JS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA522W956363
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQFxvhm4/LJHWY0F4klwVfckA9ZsRvZEMmuWU+dANBI=; b=fB6ymhofdN1KGIDx
	dC7xX2ojl4qXKKwtclquq5iP5hyJIyo4k5iruZEptYX/jlqSrGs6IGQPnejgZFHJ
	L7Tqs7wS/jrhc7xib/TFRA3q5/NpDq1ZehMCDdQQTTdsKKvvvKggmsI/vIL/UEdc
	20HWFHSz+r6Ckn/FtKSmJEnfpntuZK7LbmB0dOoqrN/xVq/EnUVLtynCX8I2A4d5
	OGexwC0k1rVFRgY21+f2QZE0RM4lCKM3pToBCnCCOkdu1EatM3dBFXcdTn6cOAvD
	yH5Fom8IvQbLyWfIyn2wqWZV8FsxH3A2/XqEu3c4IKqVd+uC+E8uL4IoY0gWhxAw
	161ZSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk18ber-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:21:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so71394085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767014484; x=1767619284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQFxvhm4/LJHWY0F4klwVfckA9ZsRvZEMmuWU+dANBI=;
        b=FHFmT+JSAOJHALjUcwjU1M5wxpje4ok+EeqpTRsFfC76bFg9D9z+ZWiFYELFijaAex
         oKk2gxJSSgk0loT6WrBkBiWKsIQ0nq95dXxufgD8fy97D9+adrJNzwjXVjWNenGf7ab/
         q1p8LLIfrB5IydyUV1IBykFCMzigFh+iWDXueRLDXPZCOUocxlY2RfUJ+4T+d2QrIRyv
         CRAjSGQE5NYbTtWacJU3qplSSWU5+1Wc39eGyFsjpS+VnCya8pI+0CgJFLqGXfpOrj3w
         Ja0SNTFFXu085CpNP+NHoLY1pViTlUjsNagBFrsxCYL07a2kyvzq/i2aNVsPtXBd3uI2
         oREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767014484; x=1767619284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQFxvhm4/LJHWY0F4klwVfckA9ZsRvZEMmuWU+dANBI=;
        b=cyVZM13LTYwyXTTsMDH+q/CyhcGbvhJFm7mfs8xD/LDc6+7QxiSlpicuyouk00tXVt
         HOOFN9tl3QwEr2YhcH4YdHV51/z0SKngAgY8Y6cqOJBau/00RQt6rZA0SmqhCIHmweLd
         0zmqZSJCv2HfwYxfjYGatGhOu88qQR6wNRT6xduHU+kw9HHkfaaQ1kU0o7Rfv/OWrZ0F
         dwpwvFx4PAkLnpz5NlwRk2/k9ndwkwS23w44HNFt9E99nEwP/Uh7PwfIG/JgaFjvb/9l
         pkMARxOjWMyEuxVIsDvsJn/a+ezni0csp/3JTJndZFhE4CBFEpDSubIObtzFp5YQCpx8
         4bNA==
X-Gm-Message-State: AOJu0YyANm6kLS1EYcR3sWpAFsk7gO+WTvxubUTBIjVLp2PZXPaBUIxg
	9TKZT/JjZAT8TlZgW2d7Ee5bKg+8kQwOctNhTNhiKK/g0aoNGXU5j9kqZyPLXAvu21rVubCMQ88
	4vAUelG8z6FszNwOjYp/sPCC7vkk9QVu+1/PbYZYVilUL+fwoP13L1A+0ATApaLfKZ1s6
X-Gm-Gg: AY/fxX6IztDEVxjv7r3F5eY/pa9FQEGt4aT+XNW/lYWeVMW6kylp7WmM817pFEtPnZ7
	ZlQbArezdS7VtT2CqDHytrot3k1f/qKPVz6SdokpfIenZ6ibuU1QYjI39EJMzGU2zN+h7P1/Y/9
	WJ0cD1RQNfWJHrsoYyFCjgxVhOdqTlCa6TKU87xye61l2boHkMZ3FGeXQVdvcGitWu8NDFB3+hE
	+Xwr7ZOjeW/Yvyx3ylhZMpASI8dcwQsIuH+Yrwb4mGz3k/+DrY8EWLGUhPLhSDQARbk5Qz7S43H
	pT05/8VtkqScmwxeQ7YrR58vism4Czn5E+PzxzhxbTpZoVIbZTEFDugkiYyA4MwsPisBhvwlcw6
	lKVnF8+HnLelM96Zg0uQsSKn7N2L4Hmx112Y0SwsHhbgemp8yIH+c0hJkPmR84DA2FA==
X-Received: by 2002:ac8:6d0e:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4f4abdfc9b6mr233744261cf.11.1767014483548;
        Mon, 29 Dec 2025 05:21:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7uNc0BU7MwWHAX9o2IkDbtGYyWIU80dvKOL3/iaMyzg7IlzfM2y2oSXq4sLPfqUR3dC24cA==
X-Received: by 2002:ac8:6d0e:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4f4abdfc9b6mr233743871cf.11.1767014482994;
        Mon, 29 Dec 2025 05:21:22 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm32017264a12.1.2025.12.29.05.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:21:21 -0800 (PST)
Message-ID: <4ab39442-153c-4e0c-83f5-373195b06ba0@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:21:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: talos: Add CCI definitions
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: alDomWemqN9f52Nm1GKEwXSdS5UEYVQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyNCBTYWx0ZWRfXwfwyI+TKVjYS
 9KP00EhN9AKqrNwVoYnmFpmJ879LgoeBPHUFqZ8c1qaMz/eQb1oi12zy4lJ/HKx8djCTdT1Ando
 JlHpDicnbMspS4qwY2D1wKrn0eeccuhhME3r9GHoicAz1dRGTZEqZeeCaZZh3TV/LBDtfOKcEi+
 EDQ29GmNdEDgbLWBTlClLtJdhZvwsLfHAYb0iveWXccp+oOUi7RskuakR2Y27QE2k6QpnDzRoBU
 x2DFP05RTxinr8XO1FczzNcViVuYHyxkWJwT/w396Cb3hhbyZCSEn2ESb7DiOE0qb/cbz2eNhlj
 YyPPlgGVVcWRWT1JaVDlZEN8pl41g8e/JRkhxA38SbWs5c4j2yBqeVTZcNHiTHIdddD5A/DnU1v
 XTWN8iHjXu1jV0yFjbLhkaOwt0vi6cdt7mJJATw4UrJfIHCIrebr9HoPzgOPupJc0igFDs9Nrbp
 mMHvs0yUgA1K2ygQoiQ==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=69528055 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BlzpOQTak3MflN9jAokA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: alDomWemqN9f52Nm1GKEwXSdS5UEYVQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290124

On 12/22/25 9:44 AM, Wenmeng Liu wrote:
> Qualcomm Talos SoC contains 1 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 76 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 2e2fa9dc11aed6e8413488302710bc219ca9b64d..ebb1807f0222c075d4207163ed4359a55616d903 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1550,6 +1550,46 @@ tlmm: pinctrl@3100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			cci_default: cci0-default-state {
> +				cci_i2c0_default: cci-i2c0-default-pins {
> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};

Please match the style used in all reasonably non-acient additions:

cci_i2c0_default: cci-i2c0-default-pins {
	/* SDA, SCL */
	pins = "gpio32", "gpio33";
	function = "cci_i2c";
	drive-strength = <2>;
	bias-pull-up;
};

[...]

> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
> +
> +			reg = <0x0 0x0ac4a000  0x0 0x4000>;

double-space

Konrad

