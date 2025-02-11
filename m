Return-Path: <linux-arm-msm+bounces-47601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B4A30EB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B0B43A7790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B044E250C15;
	Tue, 11 Feb 2025 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNu4mvq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A8250BF9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285128; cv=none; b=JuPLXfJiQcmuLKvVYE08wRmG4Vi8siu0dMOG72XFJbP8YJ5RRIBraTKLVufqW3MmwmgfZ9Epf6IzKMHWsxIb5yTzbyap6UBvoQDutt3Zy9ms1sTCq4MyxkL6HNXg5rl35l0UI0+s09LlJykCiepEML+ILTiwVVLGi167YWGlz/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285128; c=relaxed/simple;
	bh=0kVKqk5IG8JfqeSpFKJ8BTtJxmpzxliMEVgSL/PtQ/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWnUGAdHR8AJaDjUQvpAH8ifVJ5tmx7Uc4CKrJuLMSBihzoxpDClYmVie58czuWs67KxvkLePvHYPjVpIQPtNShpllIi2UC4/AEfzpY5B1cS+oVMlyRvVu8aG+Da3coPW8cvPQVfi0hA8bmz1uAo1X0ILRJROIJnE6xSL9ZFV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNu4mvq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8oaqf008247
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5ZlX1YetlmrIHMSkZ7v4IVR+ij3Aa6gQsqhWVYajoY=; b=NNu4mvq8Bibvup0q
	emXXlq3IMFDCVOSvu3WyMYVa8m4UjZpgX0w3jf39xpGgp2RJYoxBwqUO2LfRKrP5
	hqTxnROGq/o1SUOGLrrjEhkBjzq43sEhPndizH1kD/jMHE7PcgpLodHOBUcSEr8u
	FHVf+1W4Zm+MCUqXWMcDid+4F3J56qThuP41CBhnuyOe1YgiBe88LBHhsrCYR9tO
	iFH3PN1CYJFwW96hWdzXPw3Kbv4BZwaFKy5Ub/Dv9+TWtOqV9XUeGnyFVfHBUoPg
	jB8ykGcsm6sLTkdGCVlWKG5U5rRCQaPhK6mIx3jnwvQ8hJZ7nvGUv8mJoSvMVyDD
	K+1J8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh4d0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:45:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47181a14d8bso9695441cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 06:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285125; x=1739889925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ZlX1YetlmrIHMSkZ7v4IVR+ij3Aa6gQsqhWVYajoY=;
        b=TdB3PpSCXlid/skhXw2chBU/13aqHHS2lvxjJRFejsKWGhCJbnCcJta6YU8Ni6d/UF
         NOiqyTYEr+lFwFShCQ5nliCjQA1Pk7Ut4B0aYwi9gT6W3ErLSJM/jrqZKuGqsmdaiJZb
         1CR0nE9nD2zPt3md3wZz7hxi3qpxy0i7f5XP/AlF8UN0rvwVxcCmBOvMPUoK3rb7NWNw
         43UBzlgoE9+BoD9y0ALfmIoKhmvaNkUpoOisPmMVanMJXKeSu/Jk/pc+dt/wWPuWnWSr
         rrIujDuFWwTl+PlWn1wIlZDP0GGf21xWWQbtJICAZlBmg9UIxUkjMAhhlw/ctI+10PpM
         AqVA==
X-Forwarded-Encrypted: i=1; AJvYcCWfJn3lFY/S9DvhkaJ/PhTQvqxdIXxYN2Y8oeXFZZjokju8xE3lWCz7PajgD/L7OqQSF3gGEHYS4iVPNlwb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzits+GvZpQN10mrwYlcr7Wtpik0BJBzmaj1dAMgvgqXKBthSdg
	t6iSMGdgrnt6HxwBdWSDS2phC1P3lAYZRx5XB81mo0X92K7lXQb89N6LyALyAaAkNUV0S9mQ2qz
	XJJpOjpWFF3aAi4lCWlYpGueZNW7cjDzbYglxll+RZUxWsZ+R1RLPWZFZ0TclG0of
X-Gm-Gg: ASbGnctMEDrPOO7eWDHQ9lpH8m3EQ4rI3jtNSVUHq361pFoJqzZ6NATT4GykufmvZeW
	JSnHdagMaU+cABylv90t+tyMoFJDNoHG5lKwctfPZekUZCWMI2GbyF7h8h6QAPgyWpY7vTFjtDT
	SzNrtKKpnauQ9fqsf1Ev0JJr76jTH2dcvAgT0/+a/93roLRv0Z8yx5a1DH1qMOnUpo1kJ+A19CM
	mJnx8wT7eGz/oEPcP3Ru5eMRL6XRssduIUIxZeDKbXMms1PihSNlgYwrHKDdkSwZ+NWexe/yBfe
	pTdOUbOQZDIp3w5WYV95/3Rbzgz4SPMS0kgjSBXTBvcL0Drwl2Ul6nqAAB4=
X-Received: by 2002:a05:622a:130b:b0:471:89e5:5154 with SMTP id d75a77b69052e-471a3e0db5fmr12104571cf.12.1739285125042;
        Tue, 11 Feb 2025 06:45:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZMSc6eujUP6gA+rQWjF9sJt0YkUCD00xhY+fNjYpiy1BMcxtRBCV1dPRg4/gTMVtVYU5GQQ==
X-Received: by 2002:a05:622a:130b:b0:471:89e5:5154 with SMTP id d75a77b69052e-471a3e0db5fmr12104271cf.12.1739285124385;
        Tue, 11 Feb 2025 06:45:24 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bf1d8aa5sm439955066b.62.2025.02.11.06.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:45:23 -0800 (PST)
Message-ID: <fc8483e2-b149-4f7c-b62a-9e7d0f6e2c65@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:45:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm
 channels
To: Rakesh Kota <quic_kotarake@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
References: <20250129115226.2964465-1-quic_kotarake@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129115226.2964465-1-quic_kotarake@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o_cjnf4YnKd4oiObFknthZXBcYuVB4bZ
X-Proofpoint-GUID: o_cjnf4YnKd4oiObFknthZXBcYuVB4bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=924 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110099

On 29.01.2025 12:52 PM, Rakesh Kota wrote:
> Add support for vadc and adc-tm channels which are used for
> monitoring thermistors present on the platform.
> 
> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>   qcom,spmi-adc7-pmk8350.
> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>   xo-thermal, and define their polling delays and thermal sensors.
> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>   channel for thermal monitoring.
> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>   and define their registers and settings.
> - Configure the pmk8350_vadc node to define its channels and settings
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
> Changes from V1:
>  - Update the Die temp name to Channel as per Documentation.
>  - As per Konrad Dybcio’s suggestion, I have sorted the pmk8350_adc_tm
>    channels by unit address instead of alphabetically.
> --- 
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 114 +++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec..54ad11d33b38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -9,6 +9,8 @@
>  #define PM7250B_SID 8
>  #define PM7250B_SID1 9
>  
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -212,6 +214,50 @@ pmic_glink_sbu_in: endpoint {
>  		};
>  	};
>  
> +	thermal-zones {
> +		sdm-skin-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

0 is the default value, please drop these properties across the board

Looks good otherwise

Konrad

