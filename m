Return-Path: <linux-arm-msm+bounces-82243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BF6C68BD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2B09C2D382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9706433121C;
	Tue, 18 Nov 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ul7N/Xkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbRnJwej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F632E72A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460245; cv=none; b=HV140yyjm1pX8wYXHkG1dbpYJCW+n7cMYyi2YNiZqzOSdvt7Nbr+iYWyBUQmKx+H4GIlczqzWy3ZbBqu+8xgPVCEft7inLwqbrMDhJ+A9nQg4oI9k7gz9ulDuoOHQ082t9wDBuqlLT5HiMvpKgvGbk/eLan3kgRHhL62dhKxnV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460245; c=relaxed/simple;
	bh=uaXTbcqUswTm1lO0owD4I2Nf6g8eEhxs4aDT6oNCWxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQnDcyJGym1yQWPhDDxB/WXHg6lBlH0aeov0GFDACLVd/204wmC65lca/expkXJLCvNJACqvv2SBvMcwXddYwpfpnw9V6tfMH2a51QG/YhwyuaBRdSFrmX+1n6qHLny7YEfeXfnc5EmXtjtBMWNrh4f92kwpNgC+PjjxsKQCkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ul7N/Xkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbRnJwej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2x1h2375942
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1mbxhSjtOo9c8WVV7gAU1V0GwN9HsgTa+1rC3E/DasA=; b=Ul7N/XkhYF2oMhcM
	wCvqAJCwop1tnKiOhklHsTwNEb4vnr0PyCe3+XVuEQ+XJ2F8JuYQxEx4bGnvLbr9
	uju5MD6ryP6WbCdS2rg5tYcfeeIS2Q8NacbCNFDsTbZohI8gHBoXxRxL3aDpeVra
	ylnZMaYcKbv3Q+86sS1CP3RDiX98q7Fqi/BrTNxmFTL96jcCOyaScEkZmHQhDmbS
	TZh/4Dwzy0pj6Vry2GhXajVyf3ajveowRMRBfYZvrXXCFRnEKQCZN0hiweCXQsWq
	mkGlGa/4YLn8sqQx/zRCakkBvyVWce5yH8VGc2syX0c24JPidptA3Utboc41kTGx
	2LfFKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njqur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:04:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b21f4ce5a6so135395785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460242; x=1764065042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mbxhSjtOo9c8WVV7gAU1V0GwN9HsgTa+1rC3E/DasA=;
        b=IbRnJwejytHG+vrISZa2XrnE4uBmrEztbffqdrUpdaJ7oX5EUuIV2uSo5IndefTBQN
         H8jm0Hycv3BF/AVc1fqtz+PLy2NbTZ+4VyeQKHjFJ4M8OmIbPJrN1VRSNtmnNf0/HR8Z
         rQX3SwuDTfiX0HxoYl5AwS4dyIY+XWym0wBvSqXF93IyK9D7TR3FeXtkZK18XTASvnAX
         B/Owne65fIAUxxgTStjpFti0D51h+T3X6gU88yQVbOAUT8yPnQgneYjOhBOL/jpBEsZl
         uofQuhIIuZp/znJYi65I8ydHJS2AqZBcH12M6ePigXSgN7mn6V2g7adex06GuPGVefK7
         YTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460242; x=1764065042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mbxhSjtOo9c8WVV7gAU1V0GwN9HsgTa+1rC3E/DasA=;
        b=g4heIEuIsGJ0zztK8gCCAmHaJGAEZrZwjNXYRqWT12rbNSkdt3iimW4TQQFqIDgILt
         UIBtdiYuk98t80p81GJTCBIKqVo2hNh1dfHnlG37DrMm52og00jvbUpg3hgeu2mTBfTC
         Irt/U5Om2xuLnUipBxPjMbv/tYxjYqha2N6PY9V0+XbiWqRTPZh8f6Wnx5fDaXm8mk88
         n95vipcJw/SC+WMPaWV6AM9gzFXS2fXWy/KIg+oEls1XO2/lL5P7CN3mkGnrArsqn3P0
         Ojd6Aj1I6uWvztsXU/pqeRwjxOvBHjkpR6Mn3k1BwDKjKthIz3a0L98PYsPoSPrv3QjS
         +Zew==
X-Gm-Message-State: AOJu0Yzrx5HNC1uExrDpf2tJ70+3BBCcOuMmmy8RStO/Pv4nR/GtS8YQ
	7hmS566MHYaZ7H+HElbhuXHwtO5LAgfhzNtj0gwHKcDK6B+0lSU3gF66EI+W6HGkR85mO8pWTvf
	sLfq5bjlz4wOX2TjKS6usD8kvZ2d/T7a2bwHpnft0PzvhuK5rSoI9+qNeOJXzyexFT/xu
X-Gm-Gg: ASbGncuqgVxDUv1pkTJA/ZPpDUqAdjRPPPmIyEcNySdA4uBTJX4qA95koFUesbSfhoT
	ua2kvyMPJScUsJ7IUWW2hEWZ/65u5Q/MCrE5L4X46Y4Tu2d4U8T+ecgsrJ7frHSZG7d3d401lTW
	s7Ib0u06FFKkNaUmnn+gzmfZjK76/vlty+ZS50/vWQE/oIF4jv0eaMi448yEgsm0VNhNYnAhoui
	u+YkIHWANVMWn6HPxJuUK+aGQGU8o3oOYbAlpeBR7lo2nO/yntzZjYHJAl1tmDbIrB8CZ8ce5co
	2WskYXhf6NTfHHECBiDEVdT3mVw4utx4rbR771a1c45gHugRmYUpcZmwIkoqsBre17TnbvaU6eu
	yAmOAnsCSPYfJbusAMhC6ElQwvhtZlJ016ckEP5fO0f4Kv/vGRcfZ/3mC0K87Q/rkmWc=
X-Received: by 2002:a05:620a:710c:b0:8b2:f090:b165 with SMTP id af79cd13be357-8b2f090b5b9mr560852285a.4.1763460241897;
        Tue, 18 Nov 2025 02:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIy+KkT45fjbCFwlMY7g40iK0YvJB14Bdt0inaWn+KSTlHP5BpLyxOcvzr4gK8mYGxwtnkSA==
X-Received: by 2002:a05:620a:710c:b0:8b2:f090:b165 with SMTP id af79cd13be357-8b2f090b5b9mr560848185a.4.1763460241331;
        Tue, 18 Nov 2025 02:04:01 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad4635sm1317084766b.26.2025.11.18.02.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:04:00 -0800 (PST)
Message-ID: <350ddcc0-cbab-4b58-8b50-5004f27688db@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:03:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: qcom: dts: sm8750: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfX/GtoZlDl+8Eg
 pNnE1USYSwJ/0kvZqTUBpSEQJp+I3hl2HJOKVB8n04KfbMsxTO+BghrC+20AOzx941W/U/WCcew
 h29CssIxgBFRs2BwUx0oflJwc1yZpxY8vW489KhhkyUgwuaGRq2SZA/HseugTvjMKN9G47RLoDV
 eRoR5FR1k5qQlVXHBNHIEalCwxwkq1m9u6uWYtAeBlMEyodoVmBUlN8T1G4KnJaGy5gOpD1GFf3
 BRqu9EHoj0Y3VrSPOlCLp4/eyDVU+yHhdPJi0WS2xtpQXAzQXy4Iup6Ec0idPWpbLT3hrkhmljC
 K0Zsp+R+BebO/vrpdfQbEyR4L/a8nZgZ3XJe0N9conIRBWYkL7uxwYc+TJSxNJaj4XaB94q+/4a
 uuDwp/m9ey3xvXR36IwsY8LnULdqcw==
X-Proofpoint-GUID: knUxRnqzc3wzZAggdTtIJ4ZmE2_yATcR
X-Proofpoint-ORIG-GUID: knUxRnqzc3wzZAggdTtIJ4ZmE2_yATcR
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c4492 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=esBNrGW2p1ruLeLRUMwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180079

On 11/17/25 10:31 AM, Jie Gan wrote:
> Add CoreSight DT nodes for AOSS, QDSS, Turing, and Modem blocks to enable
> the STM and TPDM sources to route trace data to the ETF for debugging.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 981 +++++++++++++++++++++++++++++++++++
>  1 file changed, 981 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3f0b57f428bb..56c2605f3e0d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3313,6 +3313,948 @@ tcsrcc: clock-controller@f204008 {
>  			#reset-cells = <1>;
>  		};
>  
> +		stm@10002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x10002000 0x0 0x1000>,
> +			      <0x0 0x37280000 0x0 0x180000>;

This region is a little bigger but it's not described clearly. Is there
a reason to use this slice of it and not the whole thing?

[...]

> +					funnel_in0_in0: endpoint {
> +						remote-endpoint =
> +						<&tn_ag_out>;

Please unwrap this line

[...]


> +		tn@109ab000 {
> +			compatible = "qcom,coresight-tnoc", "arm,primecell";

"tnoc@"?

[...]


> +	tpdm_llm {

Node names still can't include underscores ;)

Please also rename 'llm' and 'turing' to 'cdsp' unless there's a good
reason not to

I confirmed the coresight components addresses match their claimed function

Konrad

