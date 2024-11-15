Return-Path: <linux-arm-msm+bounces-38084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D139CF61F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 21:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E31FB2CFA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 20:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94D01E3762;
	Fri, 15 Nov 2024 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cm+KtutM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D11E32AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 20:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731702373; cv=none; b=Xr4YBSlFsksUAzX7XNZtvMbIxGu7UfgRceak/8BJ+FmOrmvonLaTBd/F0rjF8JcbaH1m5mehlyMxG+4r4CHaZMDnjq6N3421vKIcUdEkn3g7dT42YuA7GTepOaS9wsjbfV5U4UV/hf0Y/l01VLq4cRk6BU9dPAJ+4+y8H+830U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731702373; c=relaxed/simple;
	bh=Ag3npkmnft9gD62o1XdTSBWLaK4jEsKzFWnv3M8CBS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOcoIoM0JvP2k9kRuxRRbet0xM2dAe8dn+ezJDsyevXYb1iWHkfXbbx4qkVAGWvKgQlaSFuZ5CEozueabx8DMzfOBR8/OlyuN2O0OQ2R20+sQqTaOYAI07busGD3M6vVL+ZRo0Z+1vD1BZTcdFvsHu/+ZcJEL6oFV4GEeSfw25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cm+KtutM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFI5SF0029678
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 20:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMaPm1+IImUdO7cISBLcl9c7Iu1WSHE+iCkPkVlturo=; b=Cm+KtutMRhf7d9kY
	zGLxREdMiXLY9z/H3sT06+8p+BjYGdVp3oK6EI1TlsQ/+JvJs+IAE2RrsXuF6MBx
	E10lpqEH8dhwfj7cmwD4556FqXRGH3H4hkM+koYn9EFU57xY+q4S46vwpnlQFPBK
	fyOnMsKl1j/sYNDnCshbAWskVxYYV5DDCBt2+VUuZOuLSgu+KxZJ2saCRWiDRdQJ
	z+82TfeSO4QjPWsIPlF3vGxghioeN89Dir1vIDkaDD0Va0XSjJI5D0oJh7NRBOkN
	dq0dl2xKsmSAKmQjjJN9sgMCAbSTYaOa0LqONP+4afV3D/Rx17AjGaTSiWK1KdOJ
	k8nPYQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wjqamjej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 20:26:09 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3e65ee7154bso460350b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 12:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731702368; x=1732307168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMaPm1+IImUdO7cISBLcl9c7Iu1WSHE+iCkPkVlturo=;
        b=EOkjRikQPrvDY9fgcO/TbJrC36FBOZKqAnln9rajkz93jf0caHgGkMnG4gn3B+fkFl
         DNCa1j3XFYrlDhPdruwDX2DkrpJ1dDpPV4G0nYvvotMRlYt1OPPvufIyPVJrnvdqxsRw
         k3OUbN5N/sakeXlmfym+ovxtF3LCN8TeiOhYzGO87NMYeYTrU/MNGKOsMMAzpWEQHbkn
         AXMT4Yz7kU9GzdKyMeKIOH3mTziTGg1cxVslRBiSHtSpeHD5KaWb+II51RDTsHW5s8qO
         S1B2b0pIGw4bkwe5G3xP7yhoXrKZE8xn7LmTOZFRoClyfdiT0ORWVWSQr13tPFmuBw7J
         280Q==
X-Gm-Message-State: AOJu0YxwmzDjFFWW+MEVCa/FiBDZgdvquX4fMHZRZv6Ganbh0lBT7InA
	EOV0hVR9oGdPwBvsZG7rtLkio2vOJHXyUyjTgKEw4DhjoJuEKbObEeGhOIW9nR9bjEj6XpBQAfp
	JQQxwWppLX1jirz8YNkuGtAlDq3thPsjscxek9Q5VqBxUlBi3Sj8EvURwLzZWQ5oj
X-Received: by 2002:a05:6830:641c:b0:710:f7b0:1d9f with SMTP id 46e09a7af769-71a77a53decmr880161a34.7.1731702368461;
        Fri, 15 Nov 2024 12:26:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtR3/Q2/qCLJeKACK4JhpVADHvNgsg3j76CniniMUeFU85uyl/kGD/ZyaH9K7cExGWRaIdJw==
X-Received: by 2002:a05:6830:641c:b0:710:f7b0:1d9f with SMTP id 46e09a7af769-71a77a53decmr880154a34.7.1731702368136;
        Fri, 15 Nov 2024 12:26:08 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e046c68sm210747166b.167.2024.11.15.12.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 12:26:06 -0800 (PST)
Message-ID: <636c2392-bcd6-45ae-a7f7-ed893479d3dd@oss.qualcomm.com>
Date: Fri, 15 Nov 2024 21:26:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: Add base SM8750 dtsi
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-4-quic_molvera@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112004936.2810509-4-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 30OhZJc5o7cMtm9jdnqknHluc_fsmuIt
X-Proofpoint-ORIG-GUID: 30OhZJc5o7cMtm9jdnqknHluc_fsmuIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 mlxlogscore=708 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150171

On 12.11.2024 1:49 AM, Melody Olvera wrote:
> Add the base dtsi for the SM8750 SoC describing the CPUs, GCC and
> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
> reserved memory, interconnects, and SMMU.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +			power-domain-names = "psci";
> +			cpu-idle-states = <&cluster0_c4>;

So here and on x1 we use cpu-idle-states instead of putting the idle state
under domain-idle-states in CPU_PDn like on other PSCI OSI mode-supporting
SoCs. IIUC it works out to be the same thing, but maybe we should stick
to the latter for consistency

[...]

> +
> +			gic_its: msi-controller@16040000 {
> +				compatible = "arm,gic-v3-its";
> +				reg = <0x0 0x16040000 0x0 0x20000>;
> +
> +				msi-controller;
> +				#msi-cells = <1>;
> +
> +				status = "disabled";
> +			};

Any reason it's disabled?

LGTM otherwise

Konrad

