Return-Path: <linux-arm-msm+bounces-42017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324129F0CD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D50165B6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F081DFD8D;
	Fri, 13 Dec 2024 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/vKQxAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2F1DF736
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094787; cv=none; b=SFNp1Zu6puHpXM4WXQogdNoybaapc2EVIBSvS5YmRDX+fNRFsARg5UuJN6k5Tk4KUudC/pPfJG1t0uhTQLDyuR0VZDHerZUZYmbeDsSPsCxxajGDtEsBALSf3iwIhr/HjuIk41LvRrA+MSoGZYMh2uUAPoTLOAsi87Dmj+hbFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094787; c=relaxed/simple;
	bh=1sJQDVL72VcKeErh3nbOH9yrJdYI93yt1fBf8g+slXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTzJcv6hHB423y1yUeJXcdfuhxys9u30ME/2VLhvsNmZCWj+ubTctb3KaN98MQyhREazhjqxVxCVhTx45PR09pZFFO2FjCn8k4DcjwOPfcDc/TUJsF40nuvNne09t5k6T0UPDkTb4Bl+UARABtpACeAeb9ypejd/bCbPIdxg3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/vKQxAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD45lu5017226
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+eV3bBtlbvxhn0lVz/tJ4AtCvy2WoiBPNjuWp3jNDSo=; b=P/vKQxAi6zvAQ8Fh
	c0WHGtOodR+4PioTYf3lBW6WHF9skSvckpWHvRQ2z2uxSfvsWszdsxL/FgievStc
	ld/7ZbYAypt8MjwS1G4FSw4oCVmb/teH/f/jeG5id0joxoIbpxmJNqWOz/3A4ZIU
	Vxnkxbpmfn7mQaAbqrtfHBbQ6n/F/tBdMsIS4ZTuWZwULv2TEEWo6dJw6KdaqTIE
	56T0TyejjObyNtvRrdAtbVcDXwlCf99xm5Mrw+DeZJRfhf8p5UpMcmP9nH9BR28T
	24vaJoQOsCmiDvQkwOhFjDW3DqNdYImCEExf9glxPGvYOg3illSbVqirBqQeKtYm
	NkQ++Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn1by2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:59:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46792962c90so2322251cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 04:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094784; x=1734699584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+eV3bBtlbvxhn0lVz/tJ4AtCvy2WoiBPNjuWp3jNDSo=;
        b=XuNopLhHpRyX5a68njixvTP48hagsq2dXsCrWJ5BnrdZa702F2LQvvBvmia2fAfQS4
         PPEoTzVeQI7O5VWJoGLFaUFa5xS6Xb4qCzVjEu6/7sAZdPznNxOMs2evh2ApZqi0OjOW
         sCLR28YQWuDGW4KJti6k2FMYI4TvD4Ez+ZnFYn858cK013zr9leuWDd0lDdqTexKnZXy
         KBTXcV8I/uQUgmz+HmRuSpTg/UnlgjKDmymj9gbASR/CuKayHETs1AReuU20kV+zEFwe
         yci0kMYGAcHL49L/ico1AjmEiQ8c27aQ5O6u8fsm1UPFIyvqgah47Qo7WjK/rWHEXoSO
         ivvg==
X-Forwarded-Encrypted: i=1; AJvYcCXy1BQlRhmCVpQyiEfRJfpI6VZExPn10lxjbo4rydd4d41G3Ait839Zj46jaIZpzI1vTV6Q/ifPNmtQs1Cb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1+VavDbLaE0aJ0Ll7ZwCGNMUwNJrOnQ1V2Q5gENh8Orh5s8t
	sHGM6VRBPRVPAojdAK2kysAmccfX81CcReBo5yLp39w9djp65BDjWpF8eQbd1xwLwMzhF77cIyQ
	bpWK7ThA8AuAu0NQBou7xQdyfjRVDr1lykI4vZXwZfCBl1NuAeV9WGNSOExPwqBYr
X-Gm-Gg: ASbGncvRTnBLC2iT2YoTIDTKw2Q06so+9gezQ/cyUR4fESWaa4Mg8U6z/ZXbVpKapIQ
	T75Eh3DKHCYZDN6PBU+UA+ZfR0yYCKCu4UfhjnAoUBzPyOYTAT607zdw29pLyl8DOu14ROHWj7Q
	LOtY9lpC/xS7i7KWQ1D8Lu+rAUFI9dUbYHNtZ741iDEzvO1o7NJQvQwq/5O2M2JuB82ZMPwvyzi
	Wv4djsTizId1lH0xZ2nWaKROuVWbgO6pX4VTovHfsKuPhtMJasE2Xg/AZ/yDeUug0eJ4orXAepa
	RMu0FrCRdp45p7ZGbzY4/MXZzfFR9A/JHaFl
X-Received: by 2002:ac8:580d:0:b0:467:5715:25c4 with SMTP id d75a77b69052e-467a5718efcmr16859641cf.1.1734094784042;
        Fri, 13 Dec 2024 04:59:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTMVkScLMOAUpwlo69xsAMyYTOhOnL3+dt2mvoUtSmgo2ideD0opMaFY0HbLG/Js8xSim8xA==
X-Received: by 2002:ac8:580d:0:b0:467:5715:25c4 with SMTP id d75a77b69052e-467a5718efcmr16859271cf.1.1734094783581;
        Fri, 13 Dec 2024 04:59:43 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa672d19498sm822746466b.5.2024.12.13.04.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:59:43 -0800 (PST)
Message-ID: <556ff23c-8b2c-4ea3-99dc-84196e3f0651@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 13:59:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] arm64: dts: qcom: ipq5332: Add tsens node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amitk@kernel.org, thara.gopinath@gmail.com,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241125050728.3699241-1-quic_mmanikan@quicinc.com>
 <20241125050728.3699241-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125050728.3699241-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iqxHAwvjgaDHlO_i565q9Xg6LcK7MCX4
X-Proofpoint-ORIG-GUID: iqxHAwvjgaDHlO_i565q9Xg6LcK7MCX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=848
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130091

On 25.11.2024 6:07 AM, Manikanta Mylavarapu wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> IPQ5332 has tsens v2.3.3 peripheral. This patch adds the tsens
> node with nvmem cells for calibration data.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

[...]

>  
> +		tsens: thermal-sensor@4a9000 {
> +			compatible = "qcom,ipq5332-tsens";
> +			reg = <0x004a9000 0x1000>,
> +			      <0x004a8000 0x1000>;
> +			nvmem-cells = <&tsens_mode>,
> +				      <&tsens_base0>,
> +				      <&tsens_base1>,
> +				      <&tsens_sens11_off>,
> +				      <&tsens_sens12_off>,
> +				      <&tsens_sens13_off>,
> +				      <&tsens_sens14_off>,
> +				      <&tsens_sens15_off>;
> +			nvmem-cell-names = "mode",
> +					   "base0",
> +					   "base1",
> +					   "tsens_sens11_off",
> +					   "tsens_sens12_off",
> +					   "tsens_sens13_off",
> +					   "tsens_sens14_off",
> +					   "tsens_sens15_off";
> +			interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "combined";

Please move interrupts properties above nvmem

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

