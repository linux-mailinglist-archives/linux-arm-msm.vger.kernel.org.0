Return-Path: <linux-arm-msm+bounces-44576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B1A076CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D02C37A15B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2097218AC6;
	Thu,  9 Jan 2025 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ue0KuKUR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9721883D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428313; cv=none; b=Wnd1etAxZlTvrjc/SzjFjlMfIDLpd9zWI3UpKtfO6feJvkQj5mDpwL/MSJ3C2v5J0OugpsTtxJVVK3bfZVSiDe2V3MY0ozbhwr8W6OaDekZURBzQ+2gDHf9OIAqdjtuym652zXmaoW3WeRAHnGaBujlMGYEJ6LT1KPCoLdgZdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428313; c=relaxed/simple;
	bh=rEfDHif2k/cUFRgYFQXP363rHi3KLnxYgxFlHnkElyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZBH/0VgEtc/zx4RWRFVgsZQuPR1B8UquPWhKysgn6qA9Ic9MiT/gvW44zuUCSopGM6M9T0YafPj5UjOT5oELLRetmBVVhxxHUobrvBgxwyddrQJ4DYko0mUJuGwYZGG8Np4AUGrm7vhTrM/CiLFn0VQnv3i+sTxoSpAonEeF+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ue0KuKUR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5098xJTS008540
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 13:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNYgBzr7+PYOLhPzCHQQoOI0wbcUWcQWNOky2FZhSeU=; b=Ue0KuKURi6sp0qiW
	zB3DHfwgYz+1JOG13cZS9gwXwdusfdj9QJFr2rsdnlCNvJegdkXkpNCyZfVO0+s7
	muNIxr3gHQvclg9JG6PH4fwfqcC7afyIeB9EBWE5GPzl2RlpcdAIFywZCkpm5/ga
	L8gPYi5wdXLMPBjMccXLGpPuoSh7t64Twbrb0MVCCRv8OYsM8L5jyHbPtOTrgTRU
	jS1tVY/06rzzz/92P652BPs8Ye9R75/SFQ4VmDPFjHr6MJHSI0mPcYnhelstVWZB
	HZSy7Ydb75zQW+RWy//4T3qZ1OAwZTfG0LmgTHllszaJZY1HMFjPVdTgwuDv+YQ+
	nqbhMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442bdxgjw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 13:11:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46b3359e6deso1831331cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428310; x=1737033110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNYgBzr7+PYOLhPzCHQQoOI0wbcUWcQWNOky2FZhSeU=;
        b=lT0ut+EYZAIRJ+fN4JFJ/PZBfIyiwvz6vzwfUrZlIhWngnCaZIoyzM3FDB+f+qmuV3
         r2Rm0qoR++BWTeCXxnX+qR9I021OJUzyjVtXVAFAlclu2LSOXHp48LGI3pTTmhJ1XvCx
         qZQ1dSgTox27vbkcocQoLZY8tnUQkcCH7CkriKkZ6SnpnB3iyptQ0rbIUKZROmba6yEJ
         d/eH1u2WL64uRSl1lNJTR74wvLR/etb5geSlnieu6QCm90k3bv/eB1vHG8NCJaISffmd
         hUSzqhPzCm++rZCRhWyrgTHH+nAB6oFWQ0QFKUrCtgaFs3Z4R1/5OR9unqf0l0t4LLov
         ZCCA==
X-Forwarded-Encrypted: i=1; AJvYcCWOreqqC7Lb55peBQOlCPHfemsSmt85M/BZBVsfmytHhtXRxlAsyb99GQfAme2KUXTACXAt5MSBSmd4Sc/H@vger.kernel.org
X-Gm-Message-State: AOJu0YwGM73SvYkgRfxaMh4m7je8Xx1HeImnyuGH3kenV+qI1xiTVle/
	36oN/l6Jop+pN5N7vNRHNYuu5YSflfSl1Ct8Crwf5kKxdIjZq7B8wfQXH2d0JXchH8RGdGOhCks
	XAN/jfhbs0EA9nZkn+/PD+oU6fIowlU4dGIvjnWsVuSeZpp1HQOnYy4z8pEGUcsxy
X-Gm-Gg: ASbGncu3emSI/QMnlEOXqIIORC/S3T4Xo5UjupLjGJiT7wRlPN4h8l0569RF2C8hgg5
	oFxxJehzO0jXdpuJgnKZ79AUQSbD1Pw+nk8ptBXXLbdrFtrUHAwJEjGIZVJCpqJBKbe5/WjHb7E
	sxA16LPzhNQimtwA7D0YIL24tlbC3niV/57yMWKOcr6o3HoCJ2NAph6FC/L84pK4gv8zyrpNz3r
	BsZ8JQ1aaSihHKmx62xSwU+giVIR6ty2R6LsTK9CD1QQCbBFySLowPd63c51yVZJT5ZrF46xnOi
	GV1rNqPYaNjTjMMuXAkmu4ZFuCOccLAmdx4=
X-Received: by 2002:ac8:5e4a:0:b0:467:825e:133b with SMTP id d75a77b69052e-46c7108eed3mr33342341cf.13.1736428309906;
        Thu, 09 Jan 2025 05:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCeDVZrbZMWQibNMNrxaFt3Ya9WrO8tuNQ4vIKOezNZklsG4aWWaAtbuPScIua3vZy2tUY3g==
X-Received: by 2002:ac8:5e4a:0:b0:467:825e:133b with SMTP id d75a77b69052e-46c7108eed3mr33342061cf.13.1736428309525;
        Thu, 09 Jan 2025 05:11:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99091e9absm592973a12.45.2025.01.09.05.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:11:49 -0800 (PST)
Message-ID: <f05f86ff-abfe-42d9-b92c-7788829fe95f@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:11:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 6/8] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc: quic_viswanat@quicinc.com, quic_srichara@quicinc.com
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-7-quic_gokulsri@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250107101647.2087358-7-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9tLgHmilwo0iRN6wgdUHEXWyFZMeEUyM
X-Proofpoint-ORIG-GUID: 9tLgHmilwo0iRN6wgdUHEXWyFZMeEUyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=920 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090105

On 7.01.2025 11:16 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---

[...]

> +		q6v5_wcss: remoteproc@d100000 {
> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> +			reg = <0xd100000 0x4040>;

Please pad the address part to 8 hex digits with leading zeroes

> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
> +			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			clocks = <&gcc GCC_IM_SLEEP_CLK>;
> +			clock-names = "sleep";
> +
> +			qcom,smem-states = <&wcss_smp2p_out 1>,
> +					   <&wcss_smp2p_out 0>;
> +			qcom,smem-state-names = "stop",
> +						"shutdown";
> +
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
> +				label = "rtr";
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 8>;
> +			};
> +		};
>  	};
>  
>  	timer {
> @@ -488,4 +526,28 @@ timer {
>  			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
> +
> +	wcss: wcss-smp2p {

All other DTs (except the odd cookie ipq6018 which sneaked through) call
these smp2p-foo instead of foo-smp2p

Konrad

