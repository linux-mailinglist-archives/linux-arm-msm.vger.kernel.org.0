Return-Path: <linux-arm-msm+bounces-83749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00909C91C63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1557B3AD9D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDE830DEB9;
	Fri, 28 Nov 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oleUNC5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSSVBAJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122930C624
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328520; cv=none; b=Ysb2Ht77HT8WjAkHVlh0NiI+tailE/SN51fomgpduwHD19bhve334oejB+DqaTAXKBSJeSp0wUpm+imgxBu40/psiaBG11+H/rBjAaiCSsnAGioY620SyhKUFu0rrTScro0O5hVSsYdgOfb/V65GG6jgrrLcX76V0aqnijtNks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328520; c=relaxed/simple;
	bh=n+ySxHnTwZYHhYXwznO2V02tjJhInxCd2qWIOf0WAac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgjTSElIf1o6PE6rvoiO+A5p5xqRrCiTVr2879weez3XLh9zKsQ9BEqCL1mJU6tF7TH1My2DAJ7MYU+upd8JLTEaRjqTeFyxBVzAqqTThcZfXBhrlHlo7nXeGfLlh0/+G1/YxQazJENlu0Kcm1CzVTOjQ0xMK/J2vZxJzegrDlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oleUNC5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSSVBAJ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8NvVj4191734
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwSYvmJb2uVF8S1x7X/dLtsqgmdmL+jgbUCk0j93rhQ=; b=oleUNC5sh+/0NZGs
	IvH7hpiAnMZGUB6n9CrUWdpZcCTACge/6/Pps3OS09jTf8ojFyyageBC8k7a9Zun
	uRjuYK1p5HUr3a3iterZEgO+vCNr1LDtpi382wCb2HG1kLMD3dVjwLqeRNnWBfNS
	+y6yORYOxEGRSYfOMBPibNhez44IPHQ45u1uVlpULpzTA9tAI5IJ+/rn+CgQS+lg
	WeaDDEKW/ujzj/yAo9tPrbVe6LkVQYTsBvoWUsmqUGaRWTkd6ot/oT0E8kQO3OV1
	kfidE063OUi0koGoypIfp2ZdFcDmR1CJ5uHnkM11A2WhxieTEJ+UtxjHwK3kBrZ9
	UK55PA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fgyqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:15:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so2410541cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328517; x=1764933317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwSYvmJb2uVF8S1x7X/dLtsqgmdmL+jgbUCk0j93rhQ=;
        b=dSSVBAJ/VFMNDdE08mPMccFA8qStTf9SAu94X3f+GGR5yWkMWVGViUXpuaZyaUdnlD
         QymkejoZdPVxGl3NuXPbvuDxAiHdQj7hNG4eK6vn8H4YP1cH8qZf8KsZXspbdhuzywjl
         mUFMKo+V0lK8BiTZlGrw0kBMBAkU8VU+MdBTuDSS10ge4Pj0RBCSX2oEJBvpT+9R7yec
         RM8Ae3IoogoYAiSufUqQcs4iTBndHrsyeUYumwnKxgATqhWiP0+dBL9ecL83ueCG7A3G
         6VcsrBtObhpmL7Lsdi7rBz4+cdF4DlBQezzJu2se+FzmwSNiWSr6N3NeL6EfOhdMC8GS
         bc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328517; x=1764933317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwSYvmJb2uVF8S1x7X/dLtsqgmdmL+jgbUCk0j93rhQ=;
        b=Jlgj0sTOqhL+b6hgoOyBP8zQfImJnR0VOS+N/Tl74eidvhXfUkzywdbKs3HvwMqyBh
         Csxdh+OawQrBQEu1v1FL7wdDzp7S16gVpQnemicnNWpw559LUMRxynXr66CVZiF2UpN+
         2ofqrz4CwtrR6W066vUgzyfVPTha+mA8w6laGeCcR9qZTJ0AS+/nw4oPxCNFEN+Opw/8
         LnnhrU8CNWlpHOnVYU2trHTswQf1cJARAaY0LO+4LuOkyGRJJF7dgBmkSRzypMdnAxBb
         2oqkDud1hPTjkO+aIk11o1L7rykK6yDc0/cWm8lbofFDeQ4PtM8wBFs2u22HBIeumXtL
         wQeQ==
X-Gm-Message-State: AOJu0YwRxDPXYregJQ+dFYSnEF4Xq9rahcUceDe8huoktp7cRfO2dPUw
	lm48aS/5JcuHj7t7pd8eAF5H10obMDxp6ksNDy06wHR+Wk/A+pluDPgQCdLMPM2V+sGwZroks5L
	AOaLg3pG2SlR/JuRyti1iKtaJlij28c6FjrJTR3/SuW+LVQsMJ2sIvIs74yA6Tyx5Ce1u
X-Gm-Gg: ASbGncuTjMzzozXe7tBUxtPBtCHpEsTCqaaztnsQcjQSRJDmIaqD27qVJSi41iQDTr7
	+WilhnNAL0CFVboulNjTrjaah/xZSf3up1id2XJgA7V8aiAJC7D3IzeVjsnvbB6nyAjAVAMKsV9
	aetF2kxYUgS857r6/dwrTDpKbLosHfa0vMBK1g6DetLNIOfpdsXn8boaU/+aJ3zqAE/Tl3IzulX
	tNXQ9BfpG6LqtGK6efgCrNstEqX03pbtN9XLmR8plPN16WDLch6cim0Er0k/i6q5I7VwxyBKGyR
	WBdyWgIieuQKcmIPnnnm4UXGeZVCk8boY4/39a4CxZGfi3M+PMbiL35jjXnfq4w3SZw0J9Ep+R9
	9FT0WE96BIxpOlizWH4pZHLDH32qgJD5Mnda5tew0x9QqtSpplEqxSgdrsSXx2NIpY5g=
X-Received: by 2002:a05:622a:cb:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ee5877bb56mr267227821cf.0.1764328517274;
        Fri, 28 Nov 2025 03:15:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeCly4SWtrTkquz6Vfv5qfN7qxE5niGnUUnYaToutXBXqDV2gJCGa6u7/8eUMoPl9Ss94C6A==
X-Received: by 2002:a05:622a:cb:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ee5877bb56mr267226241cf.0.1764328516038;
        Fri, 28 Nov 2025 03:15:16 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a21cc9sm419177566b.58.2025.11.28.03.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:15:15 -0800 (PST)
Message-ID: <fcd95d47-1b5f-466f-af94-7a1374777439@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-7-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-7-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TAljtt5SuY1doX_NISiOfpQDmAkv-A3q
X-Proofpoint-ORIG-GUID: TAljtt5SuY1doX_NISiOfpQDmAkv-A3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX8PXoGRcaubQc
 008e4ADimWwDFNfFBS/EbIIR3OStEq2olOExVr9ojaG9EpeHvhujMBnnnFOWuFZosCj6W1Eda1A
 CkE29z5pCdtCJWQZGOGT0Zy73OoHlERrXVNR4ldh3QRNBz5oirLE/rDNY+eIzHM2vQ7uz8DrEEO
 C0k5IqWfAo0+FTk4u9B/3xief9/zVhD5l7HmA869hnDpjoNp40HuqCvX4K0kya88vaRMduMFnUY
 YHRLFUDMxRmUjNHRZhh7nTJKmrKR3wObPdV0UQMLbputd/7m/X6Aug/kM8ej4dQTfhBx3iBpxL1
 9JrPWdsZuUJGuXM5me2BrH85j4APeWW0TJXA8h2pWhUSpZiJ1gmE3c9sX7gAs+gR/ujj+pUcZPI
 qVjB609dy9YEeY/8HzJWF7/Of3j4AQ==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=69298445 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IqCYnrxLgLuRO9zwK-sA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/25/25 9:12 AM, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

without the merge conflict leftovers, ofc ;)

Konrad

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 9ec2edf6134c..a61f7bd65a7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -141,10 +141,11 @@ sde_te_active_sleep: sde-te-active-sleep-state {
>  		bias-pull-down;
>  	};
>  };
> -<<<<<<< HEAD
> -=======
>  
>  &venus {
>  	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
>  };
> ->>>>>>> d58184825fa5 (arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path)
> +
> +&wifi {
> +	qcom,calibration-variant = "lg_judyln";
> +};
> 

