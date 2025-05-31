Return-Path: <linux-arm-msm+bounces-59961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB03AC9C8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 21:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C5B1882402
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 19:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9041819F11F;
	Sat, 31 May 2025 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkEgYvgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E019D8A8
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748719597; cv=none; b=TRVtC4GbGYmNiRWoKgyA86h8TIBZW/mZr1HLeQKEphvlGxjs/IvsdhxY7qoHwyzitbI1HL3TFtme/6d7dS9gOJfv8vQwCAaqxwt8+IiCl0np6RyC8oJR2Ui2qN45N2pfLi3nisoFk4l7KoiWexhjTtODH1mR4/OcgRKTUYzYa9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748719597; c=relaxed/simple;
	bh=C6PuGWGN9MJXkw2ORL2a11VSngX8qZR5eK+WKh08IqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYTyuTi0ftW3ilLDbgNGwX7Kb58bRzZABKCX7oPxRu1hGnKS0bJ9HydFvx4916vhLRdeIpC8CtWiMKgkGasWZiKs3wDgEbSoBixD45iKCvxiLCTKk0vqshEVmVySZK8ev6y1WPIjZR1GM5Y4suxr5gHAncpj9CpZyrW/OMVxMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkEgYvgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VHpeSd010743
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 19:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=; b=KkEgYvgSW1tfljJG
	OgLzcdEiLuGCiMiRdn5Hy5LiNRJpBwT4QYXmH8roanWxxcWpV2k391goKEDBn5zC
	AVHl2yAWt6ka1py0J3gDwBbBu5vz3rBtnml/YCigCxpV69EObug2Xn3WY11AdgBP
	B3Vq8iNJc0v+K6id1TU8t2sk2y5iY7yB4c6FmdueNn/F9Y/APY/EI59DhC0faVvc
	GHqGkH3l2CJ8gQaMFK6vcu/0xYgp72WnLaTxbmiVSP8pQZrMpukHOIlYRcbjapF0
	2mN/yJYCSswuzuKKa5v6Uj95Wfg5aEgC0yE/5XG2YWCVnGkX5zk7vLmdzzbs36de
	grrIow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw98qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 19:26:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso28438085a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 May 2025 12:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748719594; x=1749324394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=;
        b=HWUH+1f8whSPYjeHcxtk7/Jq4r3zA1ryd6ZyEFp7tfqhiKfYyaFfTmOo1hPncv4HgF
         PlB4zXwsizo5MkLlYjAcdtUlKJhztPHglp28aV6i9BCGTLs1eKfHhgc3XC6lhEJk7Bhm
         4ONwX/FWqENVgUzsfqn16i+uiSR4Hozp6VUkHhirdxT9+Jj52InSGYwlqCTGvqq9Fkkn
         EUP9ZpDQeOqafscCkXwSd5j49WgFZVgIMlFoepwX6zjezavmAOJ98A4v5M6Gd/HbNC9l
         FhDrjS+FTjHo908czmQN/5vKoZQDzi6/oaNNHAZkf749F6mISBv6XxpP8D8bJ1NXP3+g
         SihQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9i8AXg4TnRmsrUTrBBj/dj2xnvPG7X6iHDXDlJklsur8nYrIX2fWC+pAexMUmzC4pCUB8K6ci1Z7DqypS@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMFQO0h3qdU+YYK8t+xCXSHmjXm6y4rHs6o4pPi94SL63jizO
	bbQlCSOTvU6het3/5+HDBF7TxYEOekgWq4V7KIaR5g39A86zMeuvAMwm0gzeFJOj8JiUCNcQr5w
	R6rrYc18Vwook4sjfese5be4h/ytLwYEYviWa/vjwVnSd93AXBf4fPpd4QQFgKvdOiShv
X-Gm-Gg: ASbGncuQowqiHRLb7ctyQ5XqxsW7bJxR7sgY27cdkbD5iOmwDQLW6/POgjCDWvtlbmb
	Rek/b0ejrSUI/YfYnxAqXaK38jQfHSYFwUFnHJ8tlDX+o9JtT8VtmiOX8tN25TnGX4wP+agfrB+
	tvtoez24/jeMIGefvqf9Eh1wckCUG9X0JnLN0xSr+xjR2YXFshrrBfY0xnh7A6ZVCW9DS7298sV
	DHvuOe8lQssNSE/HGgjD6KPD3MbjpWBISg1TnM6wLrnjkHzhMix1SfIqiibZWAnD7QHv6Ifj0V2
	JUNRWcARzw4kbZHKmsoiw/iYDtMOWDLD69tv3bchcDO0qzbOHxuuhcorrkJyRNjfvg==
X-Received: by 2002:a05:620a:394c:b0:7cd:14b:554b with SMTP id af79cd13be357-7d0a3df914bmr403843485a.10.1748719593876;
        Sat, 31 May 2025 12:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgWeFsZuQVBnuevfLlI3W+HHd3FvIh2wDCmEbb3BOsXmzJcbTj7lwjNVLtEsvsVJTLk0yQ6Q==
X-Received: by 2002:a05:620a:394c:b0:7cd:14b:554b with SMTP id af79cd13be357-7d0a3df914bmr403840785a.10.1748719593528;
        Sat, 31 May 2025 12:26:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6058563eebbsm2805063a12.67.2025.05.31.12.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 12:26:32 -0700 (PDT)
Message-ID: <03d76a6a-f027-4529-a917-2c5f92530de6@oss.qualcomm.com>
Date: Sat, 31 May 2025 21:26:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683b57eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ICgkrN6sfqZrQ0pjF_MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WD2REpwLDjald2JCu7zcnAhKXQvuEUEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3OCBTYWx0ZWRfXwJfPfmz1w7Ev
 4SOAPw/gJ4oiRYA0ng0q6RpgF2TOTF35339HWWxo5rIWeOMKgpIz6+XFz5pWFZMcgDPEPLo1g36
 s5LKHwpZ3XXe4kJ3zX4T9eOn5FP3LTsM0nyjSHguztwvoKEjo89slCTFv9n1ftmTJ8zvqKilWL6
 clJSwVztMPvcT2rqpuIcQ578kzU3594Xkfa299+r829wPp5MYHkSq8eSbDwczR2+jo91aiQH9/R
 AAsVBWPJ/mYPtaf4530GgwJ0QLSi8+nW/N/fqIbS3Y+WWIZjVlNpLQfy/QC8SICmLauqELInSeT
 0MZ0LRNxeCh2wvG+m6nbEThxZVtgYiZULhUPP4q2Zk2ELluIR96nrofE0OMxvRHBP9W7sJrzSmK
 TWEEGwxxbF60hmb0qjbwnH6uk66Uiw9FtcupQwOcSzYbQBHDNyiC1/37v2zNWOPhsOqs7O/1
X-Proofpoint-ORIG-GUID: WD2REpwLDjald2JCu7zcnAhKXQvuEUEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310178

On 5/8/25 10:15 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..430f9d567 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,17 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +
> +			pcie3port: pcie@0 {
> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;

If you end up setting a v(n+1), please rename the label to 'pcie3_port'

Konrad

