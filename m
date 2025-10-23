Return-Path: <linux-arm-msm+bounces-78525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C38C006D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A54324EAFF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31088302773;
	Thu, 23 Oct 2025 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blfamD2V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C32F616A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214709; cv=none; b=dCL7JcmAbC5Z/PUvGvjeHP+loXAyLVxrazbZiS6/+t5D0rfSp3WdmKtQ2i3MjoWgZnKS/DrB+9A+LbNYGeI7dtEOzdjEg/mcskwBmOvPWQjMcBnOAprTVIibbRYD1I01T009J+XwPgeaG0PIZ0WfLuI3UHou12Q8/UoLnTXrP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214709; c=relaxed/simple;
	bh=1RnLQ3v5S/1nsTAmNc4jlYHFj6K1Jk58trMvxEAtJEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqnq+Hn0oyoG0x7oRmcQtDPQ577OkyDDMXEx1yVf4F694os2mFC4LnkkzQwCsv92jy93VZC7O0lLcdUz4iBYyMEeRKWLWDfkrFBmZJZhypB2Q/h6UGCEMfmy/5c7n3sDSOn1JQu8U4d4/wRTlDT1gV7NvG9bWAxKDqTY+wkxY6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blfamD2V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N75w3G028844
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXQvqOCIifU70x6E5l/eBJ77oOljySsiWz1sAln6OEo=; b=blfamD2V0K6KFvxb
	KtyyNqCrw1doC2aSK8SH3SNG9hRhDkw5nyy47f9wMKb9WOIVSGuOX6vw6ykhAdlP
	J0wmSOXouYECU6ax/zN2h1wGVNzrC05nt89moMyGJh4IpoTVesnP1jqfoMmhniL9
	3V/IQf17jSYCd6CKvTuXx9IB2Qj6RNmvlYM1vDxYsd9XXWQg1d9Qh35+gPxSaSwY
	wc8B+FjDPtlVX/8ULr8OIPjHHffYkGQWxwtxlBowSYDG38ufYFe9pnWX6Snn6CXH
	4+5m3a8cXw7ngeLRfhvwPEkzoConjWu1GgQr11/x6kvJWgIR2qbte0DODJDxr7zN
	2Botkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdne6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:18:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26b3e727467so3276525ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214706; x=1761819506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXQvqOCIifU70x6E5l/eBJ77oOljySsiWz1sAln6OEo=;
        b=NjATq8ZMdpsQuEFAs4UBzfLeaLuiTWek5kl5B6uUjGx1TEY3JbYO9hu4A17BTW1sNh
         PLYIYw7OqYay9Z5MXPWH+mcSd81vN6pAb9Zs4JTihX8imbN1x1kqAkK8ZPxJYUhKAahQ
         DYwyrVF7ttqUJP7ljtGxwZd55GRW3rThAk5v367WPnrO6Krg+wEskhZ35h/t2tkhYLTi
         p0wAuWblvkSNegNlpL0gsNcj+APPH8cZ4W3uYwqBLU9wBPTH9RzJ2s9Gpvny4DSt48EH
         tUX9MXlR8HDOHW+iSyAiUep/8WF6pVYzNCQEbEQK54t2pAUA/gDsPDKunzyDzAGJUuxB
         DKew==
X-Forwarded-Encrypted: i=1; AJvYcCXFXpr0piC3ic29B0r9CXkNAhnT4/sWKWb7O+11W96hXWupZ0Cg8JWkitehFgMn4IcpyJvtb4zN1gQE223O@vger.kernel.org
X-Gm-Message-State: AOJu0YzOrVgIwsc4kzC7NxyFoeKEi9IWxpQvq9Cizt02seg6ZRP1UW5L
	8+DiW/v2m9aTO3uuMvx/TiVXVscKZi3cw6j47nnoh1J2huaUqYpf51sfPHeUOjixathWN+v6tbY
	4WwpwD6ID0RlVkNOSte7sBIRnVX0hTWnVmgT9uAyoOL/Bs9EUknYWP1wmScaRNM2gq0E=
X-Gm-Gg: ASbGnctweDchIEEzhWhM9TTdzpL6LFZZR88u7rXvLWxPPiCNFlfyC+QODCKAOT4mcv4
	XAMs5MdksEYlvfGXXu+me2cFu3gWnsVVMaGScHaRD4kNOdvSjWeOoVsp2oX/lxPY0QjZdXz1arT
	+VEdhJ+saGP15GkRNFcGiYBklaFpv5TmsOZJMoucpLaAlec4FKRG3ynI8T4GqhrzTyOpGJqCFkX
	hPaUZh6x6p+hIZPAkGjxU8IoupYwepWY6QXsoGxZboQ7Li4BTgzXrUSG9AP+OqiBxZcEl1eXute
	Y70GrUb/NWQiR+Krq1CnQxpyX2DtOc4rWVgKBfBKisWzbZmLVglPTZnd/b2mSkHMLKb8y7eThaH
	URb5wOnSDh36doHqGhmby3vh8ptvD
X-Received: by 2002:a17:903:8c8:b0:277:c230:bfca with SMTP id d9443c01a7336-292d3e57324mr66629695ad.4.1761214704432;
        Thu, 23 Oct 2025 03:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTvHNcr2Q4NEwC8d4MLm5CmnKWQFx1aJoWBr0IhgqiAMI6t5IKZWuVUChlyP0voh0nbGgtMg==
X-Received: by 2002:a17:903:8c8:b0:277:c230:bfca with SMTP id d9443c01a7336-292d3e57324mr66629485ad.4.1761214703961;
        Thu, 23 Oct 2025 03:18:23 -0700 (PDT)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de10b53sm18460375ad.23.2025.10.23.03.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:18:23 -0700 (PDT)
Message-ID: <c83d3438-2baa-4c93-b8cb-5109d2ad84a3@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 15:48:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
 <20251007054445.4096630-3-sarthak.garg@oss.qualcomm.com>
 <d0e2b0e3-4e32-4cff-81c8-fe943084c570@oss.qualcomm.com>
Content-Language: en-US
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <d0e2b0e3-4e32-4cff-81c8-fe943084c570@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oCcelAR_EqiTH9LPDSHfdH2uAuejDhh-
X-Proofpoint-GUID: oCcelAR_EqiTH9LPDSHfdH2uAuejDhh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX3To27EzGho7n
 HG8S6KmP3gBMacUEu31vwJUG8Oq2X8ILwkjKxRVxAq9jF0VC3r4HxOy4VV+YuaESUIVICCfCxjE
 a5XOr/KIb9A6qE0qJeQroxnjOgC6X8l3u51a6WD0nyu/9PF5kwxgLbv876hctvgyAJAAJgyoJ7x
 mqR76gn+TBE902NKLeBw44AnwdVm/nF+qPUps0QWEvSDWlE3Q2/ffJFzJ08oslYSvXRzjc5npUu
 QFj2WOVqLX5wfZfyC17CJ8b/QhzQ/eZE1ZoO/bMe/qannD8Gs4PiCRHm1M5Iv4jLA3ssuj6K5eF
 9IcxCT+pb4z5WhE3gAgT6nvAZ7lhB2W/1zqEKEkAhsKCSvRR5m3473Sh2gllxtkA+nmf8cDDiiV
 RnhoPF/kjP6B/4MYfQAZuNNzuR6E/Q==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa00f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DMDGrHW2khae0FuLqQAA:9 a=hK1Zo0tywebNB7qn:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090


On 10/8/2025 5:47 PM, Konrad Dybcio wrote:
> On 10/7/25 7:44 AM, Sarthak Garg wrote:
>> Add SD Card host controller for sm8750 soc.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
> [...]
>
>> +		sdhc_2: mmc@8804000 {
>> +			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0 0x08804000 0 0x1000>;
>> +
>> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hc_irq", "pwr_irq";
> One a line, please
Sure will update it in V2.
>> +
>> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
>> +				<&gcc GCC_SDCC2_APPS_CLK>,
>> +				<&rpmhcc RPMH_CXO_CLK>;
> Please align the '<'s
Sure will update it in V2.
>> +			clock-names = "iface", "core", "xo";
> One a line, please

Sure will update it in V2.

>> +
>> +			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> and here
Sure will update it in V2.
>
>> +
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			operating-points-v2 = <&sdhc2_opp_table>;
>> +
>> +			qcom,dll-config = <0x0007442c>;
>> +			qcom,ddr-config = <0x80040868>;
>> +
>> +			iommus = <&apps_smmu 0x540 0x0>;
>> +			dma-coherent;
>> +
>> +			bus-width = <4>;
>> +			max-sd-hs-hz = <37500000>;
>> +
>> +			resets = <&gcc GCC_SDCC2_BCR>;
>> +			status = "disabled";
> A \n before 'status' is customary
Sure will update it in V2.
>
>> +
>> +			sdhc2_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-202000000 {
>> +					opp-hz = /bits/ 64 <202000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
> This can work at SVS_L1
>
> Konrad

Sure will update to rpmhpd_opp_svs_l1 in V2.


Regards,
Sarthak


