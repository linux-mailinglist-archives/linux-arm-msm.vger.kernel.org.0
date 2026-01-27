Return-Path: <linux-arm-msm+bounces-90754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE/gA7+peGl9rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:04:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84693FB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E1C93017061
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20263101BB;
	Tue, 27 Jan 2026 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQNZz4Ep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpsBIk0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1E30F938
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515451; cv=none; b=RhobtDNSM6t+nvXyDxCFp/mW7ODHjEDoSCjsrb3NBx51bCCJ3kgNYBlKo/dcsN9vjWpiKA+lpZb4Wzsz01fzeveOYUI03BXUi23zu94I56ABXGHdFs/e7l9NLMZuBtSUH95iNE4t1dZeWXR8L1gBbApmeZnjDXkwqemjzK6c9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515451; c=relaxed/simple;
	bh=DcI/jI/4iE19cpkE7eoNoy+0lbMB00f9lcp4pzRZop4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evMGiYpuFdCiiS86mL3Ipvn3mY8C+JzNc/9U2nGpBHYVoTHeejQ0ixJ701pklrlLYLgYo84OAcB/x/PEpGwWNPasYlAypb34rNrc2NsHC8hLVbGvEgCnCMURgA/AWEpmKHl80CQXSzbEc61AlquPdYWhnH94SZrnFL6Dz9XSx3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQNZz4Ep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpsBIk0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9sjJ4787073
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4tq4up+IfT/2cgrOVF3wgTzYful0xQAMJs/XlKjbaA=; b=DQNZz4EpYMMC1mk7
	0Rc9oGp/KRTcP3mWqqNRq3RoWkJazrZ35tay11qnUTmQ0lMspnc5qya5w7IUsXJT
	WLayr76aJx6E3MhXcMYzLkFNw/RnRD4+Qdm42pRLsH0Ud7bw/D118kQCppfBX81G
	t4ObRY6iMvYnwE7imdMQPUyGtb6GeDd+SljsN/LcGmNktueGdJklD44h9wSOgLVn
	t0nePHiRL+F8j1ctjQBN7gmDpG9GGJTeuRDKt/kmG6/Kp2fqfOBXA2j6/f3nEt7K
	Tz+Z8SfNfZb0EfBJqBAtEN9pLPMQNub6qNnAsNCZo87KTNEJJ/DJLI8bTaKvdmrD
	2AdzXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93jf94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:04:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so153585985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515449; x=1770120249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4tq4up+IfT/2cgrOVF3wgTzYful0xQAMJs/XlKjbaA=;
        b=GpsBIk0yj0FLGI3w6GRdayOPmd0M2LAE5KN2tXxMjSgEcfsifwUF5O3mXVVnTHrHdg
         y8KAgKML9l6pgk4WJ+3N93CBcmPOLXUxARYceQYgyYpPZYscs503kw/+9rtTEEDCc2se
         cZN5unphQeYX1mxu5T+RYuHwh4U0QPipCdVPB3fvHbVL2llMPVFNqbVOqpWd91Ul6fzz
         9PhkyD3l6ZFhP8pOpcmvG3YGTjiHn++RpvFN/vc6wlHtPnBQIxJeQtZV2Kb5w5SQT9l1
         uVc+4Zx04N0AI8go92do2wKzi5KuDirBD2O0fH/IkbwJIe99OkH51vCHre5FAAkTf9W/
         JJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515449; x=1770120249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4tq4up+IfT/2cgrOVF3wgTzYful0xQAMJs/XlKjbaA=;
        b=VRCbW8+BzUt6qUTdRyKy9AW7ZVKnbfYR/BSCj+fb5HjOU5RxrhJRPV7nD6JmSDRmym
         8QEZW+sQbSCx1j+3pOrzbTYJQINTC2WEPpSD6LjoaHz+Ilzp2YUQwnM9qV+wcjw4KT4d
         PigUAlOAyVYFG78fUNYSWiHyfLL1lAKC2i5WGQbDVjFj4rmRzQU2TiVDlRCinhOCP1uU
         wQqtxkek2Ttl4kxD/+eS0jX52AdTiTIGpwrEFm1QM4xgAxfhU46i7gxQbgptGMx/mP87
         KhMaDKNiBuNUwAc2qkcyQ1mf46aSGo3GijawDLdQReQ2UrT82dKZbn1ouojx0q554g9/
         mQaQ==
X-Gm-Message-State: AOJu0YyaDIY+zg2rRGxNQpmNDQkmvrQVTL/UzoRUtUqssWHopxCe9wuZ
	+a6Rc1bpkIu6MLBPbeg/PsD1aJCIS7L5DYlrxCKYeDf80FOnTE/dneP6XhylqWfYSO63wCkoMl2
	43NuhQnFOzgwaoSoHKV7lCAP2LSVhVxlEF/CRY0km3cUnCnQ3Lf4Wo8FQTHoP8N04cA/i
X-Gm-Gg: AZuq6aLuESea+/51AW+5lRa8Ph42iAtQ31ol7IWy0gWs1BHLyxOVQvu7iGpvCV0QGu1
	q2vff1maG003/6jLXXu3H948MjQEezWDTYOcWTR9AH8VhlSys/wp32+QvQeoo5RUqkKokp/TY4c
	+54C40GkCNZhn9YiuRxLXxQMpRRKVmmfaPXt5zEBR+/tqTy5IbF9hg7Whlecjg4mJuCiGrLxHeM
	gKLLMqHDUxhcUtfpHYwDBtV17TJf9oPpbIGkV/QIBI0oU8QSgcHsXO9mAm2MqQjfQTR9cDuykF8
	FhpBf5PmHjM1asmHIPzo0lX/0ggU2/7OE63WxCl8fblkFMgyvFBuhBnykaFsVZQJsuMWqH1HIQn
	Wcowcb6bumhnmuBgS7QC1JeBbEFnmsyZuXm7aAlgXrjhNOM1voYpOggrO5ozQbdSlzJk=
X-Received: by 2002:a05:622a:44:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-5032f74b06emr10916641cf.1.1769515448401;
        Tue, 27 Jan 2026 04:04:08 -0800 (PST)
X-Received: by 2002:a05:622a:44:b0:4f1:ac43:8122 with SMTP id d75a77b69052e-5032f74b06emr10916171cf.1.1769515447976;
        Tue, 27 Jan 2026 04:04:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b5efsm6652408a12.18.2026.01.27.04.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:04:07 -0800 (PST)
Message-ID: <ad5ce24d-4847-4363-b8a9-69bcd2e4695e@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 13:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: add ETR device
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX33U2Svyh6FXT
 mMs/J11wi/OjvcNNCSAwKcFRfr9Z0/BK6U3XFyTWSy+sva3HcPlks5B7ENN+1YKjsFTseK/z0//
 C87/jLJw7CtN8QGqb3y99bG2E+rSo5NnHgOHRguvhqoWUE5tCWhT4o+N46RcERPO2LVCdo390Ef
 lAKspaNELA81pvCk0W5+mXS79niESldX0RpRFjI62dG1czOVZahigvu5T7Vy8oCcN1Y1NqTdVhU
 MVatN7zemSn7qUAb5Vy+iCC+I85+jJ7wg3dfVXKpCH1ea0pGdUIWvml1qntTJ3ckXV4YDXZdI/v
 J0wl3s3EgozRH6IrKg5oDgkac6J7i7OGZ/46QBOZnzHCcwk0PKDNHoIa2DVaP8VLkogMDFpxpkH
 Rk1OnVzX50cRQz/0xacFUHvSlN3lWiKYDA6s5f7UWkDt19S5YKEo2V6vZlIfEqPFKptcE8LbV4L
 B+KaTqJA/JxyY5trJLA==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978a9b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FVcTPOSHcKpnnfN3-twA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SjdODCAte4iMsaBln6ch0Mpl7BSXnAXm
X-Proofpoint-GUID: SjdODCAte4iMsaBln6ch0Mpl7BSXnAXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90754-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.92.73.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B84693FB9
X-Rspamd-Action: no action

On 1/23/26 8:10 AM, Jie Gan wrote:
> Add the TMC ETR device to store collected trace data in DDR memory.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 75716b4a58d6..3b081ce9d202 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -2253,6 +2253,14 @@ out-ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +
> +					replicator0_out0: endpoint {
> +						remote-endpoint = <&tmc_etr_in>;
> +					};
> +				};
> +
>  				port@1 {
>  					reg = <1>;
>  
> @@ -2287,6 +2295,25 @@ tmc_etf_out: endpoint {
>  			};
>  		};
>  
> +		tmc_etr: tmc@6048000 {

This label is unused, please remove it

Otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

