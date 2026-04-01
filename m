Return-Path: <linux-arm-msm+bounces-101277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAxRB0PmzGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF07377B30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA4E5305C6C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18291395D8B;
	Wed,  1 Apr 2026 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j031HHt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8BaDYuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D909266581
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035152; cv=none; b=fbeEPEo9gi7UzajsAePAREiNop2RdJfXMHC+5NQQqErg8Eq6nBK/llrHfCG82eaUfkmYT4DQa/M9Ec6PiJgJ5bxqz6b7uGmEwzmTKHvuAUUIzpqgEgUqojW3a5qB82dMIiGPkxNZ+x9KQt6BhIGsl+TW8w5dc1+8W+rlz56Qsuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035152; c=relaxed/simple;
	bh=mxFI3JYDZcuOP5+ZuhPs0a6U6SGrGkPOvDAyzxjAwHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEBdO2LHd8lYM4G4pbUSsosx9FNNpPISYzjL5MrKZGYtzEAfAg91N3HNnNhwgqHDwzSiiBtrvk2odLpdey1J75hc90Fwy4Kkxkyz4eVsVQ2QnVYzemdwTEa3FrCOwOkC0FiAAyqhTIZqI7nqPaQUTPBxl5Z6sgcao/UtjWKQGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j031HHt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8BaDYuk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317v1Lx1006368
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=; b=j031HHt3tB8/jo9k
	xb99RzalIlu1EbFKvZjtF5Vs7/nqpgiYLekrEB3/ziU37A+DAG36B2aGRXA/sxci
	nTmGLISHInH+DfxJ0BdSNZiJ17E6aAp6FgMrcIu1VV252ld0+aN6lNxw3SfrnRsu
	zsshCW7IGHwddIcawFtAmDIxh4XXZqTzxad1MAkTZPrZbud5Hgvhz4g8V1RIMIls
	jtLFzXHgPFaAmwCQ8TaP1Tsnu+IobBXTa1Joefj70LE55BKS1MYsBkMXaRA6l9MU
	9MB/jOPZMbsVXp8VNZdTU5LGwZZedDYqT1GBwkRGoSvPzHQGyjWO8NxxHwmF4ci7
	cuCvBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhhmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:19:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso15727376d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035148; x=1775639948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=;
        b=R8BaDYukvptyd9zNbTGJHx/CqsRHbzgmTPAKFFyUUSV/Zy+mT0s247IfWIDIlKoS9M
         DcyakoNAWbM/sRkAt55Zskxu8DWar2Id/l5tvg6+yG1tYBSTY/tFJ/KdgHquCdnbXtl+
         iOxYZXiKs/z42fnHTKBMEXuXkQCPKiqOGJgBpjHjcwybWqs/p7pobq+xjZw8xme2Geo0
         yBfyKFkY74/31jf2kHUZfp7lnsKXMFg2kYgF+6CTWAra1K+vkNoED/acTlPpVoLheFWi
         34ITVNujJ5q5KmPUlvuTza6kY6XPgvLD6bcKgOxB2zf1q1gsOh21/sboRjMPp9NNTYwg
         is9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035148; x=1775639948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=;
        b=s5acNZD03oGKViKx2evCpgcXQN++2fjN5xxjOrcpR/kCuTwFjhF47gs8TtJm7PtbtR
         ADHc4YRF8FRcVKsFeBrkC9TQ25JG18sz1CVY2IkDjVuWdi9KEWhR3+93HRctmykz+rvo
         jkrfC1wLhegzVTuqCfKHWgmkTNp7+H4gTDc31FclbAJZCT4AURJEIyt6dPcVIbryeajJ
         6wjTrC/Hm8Y5ruVY1kda7BbcI1qKS+s0TotHDxqSCidxk6oln8YV2haJbXc71Vx7NBvi
         JTVH/Cuk1dZ0uH7emtWdk3EDUSn7cgd5Fx4yzCoLrsQO+d0CggqAkBLLNINQHTsu5bWq
         mGJw==
X-Gm-Message-State: AOJu0YzHlxcpmrx5S0IOlxKDWAbjYY+O6e6EDL263d9TtPU3WAd8Fevo
	EH2NJCEwHjvW9qf8paRUU5RfzgtBj9gwtPRwarx3C15VNBytLfolDjO8Jals3LFZDHdJy42gk9d
	BsjqS8Xlx3RFkZds5Q/qcPXE4O1Ax5zJYPdedOtlaH4RWFiFX+m4p6J+I3Ta4Ao0IfBjr
X-Gm-Gg: ATEYQzyo4fjYIxMmEZAcYt3Ho4XEgVCtWhZUi7Rf66bRUILBX1kH4+bWHfb5EHCJcmh
	Mb7DfJB2Os4hIby5APnDaNGWCuN5d0QIvDOfzsMdPHRCMOAs0lS/X5keFCdPVZJu9U+hnvuLie2
	5OOr4hegDHK9HUMQZZRyhPb5N7avuD+5KD70XqeEgnR+3USyFwHxJ3EG2L0+IkkfitmVTzdxDZQ
	6dtwmYRWPLzZYlN308COKUZswWgU/0GWtlU8L1cVIdxYthoa7liQKgeKJN2lUrOutRKprXloQYp
	mBeU1gjhQhdullL4Ue4d/zom+oQxPghJgCg7BgOWmlcraQROBna4onRh89wTQEL49UQciuXqiBk
	6zy1NOlcE9rVlUjdV+v9Ja0WhKNYAsxyQ+9QHAwQmKCKE41+KrCT8n0/CPWul8YvS73SPWRjlEE
	dy6wI=
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr29305496d6.1.1775035148296;
        Wed, 01 Apr 2026 02:19:08 -0700 (PDT)
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr29305226d6.1.1775035147829;
        Wed, 01 Apr 2026 02:19:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f31sm30513071fa.3.2026.04.01.02.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:19:06 -0700 (PDT)
Message-ID: <69db89ba-c917-42f7-81c9-180cb40a738e@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:19:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DlGyVF25nThmX6Bok00YYXHJu33Qiqyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX1RUegku9ZZWX
 8S0aHyG7OwhYFV6bwSxDYnKet0WjWmW6SY+tVB9a4yQiwmUfyQo06VZPJ7W4KBCJkfuRR21g+nR
 1MSQd25fQ9VBOSf7VeFMN/VXyxmqG6oHA+p9G1PCfTVGq6mLE/GdOdE5G9MP2y6MmG9/kzbCru+
 zyHa8PhsN19/0VFEv8ga5e9dSOFR5RQF+HptbJGNO12yXrXfvtb1/GsC8V9EmuB//7IUHdOLp5U
 EPKVrM07nbgIhItzeheLI7KpIByzqWHR11CoNACVjAlfDGLjWpDuxy7zbTPURW0h7VmzkfmFI5T
 4O2c6MOcXNNmxf8K1LibcmjvI1vZ/OuJalLT+1xO+yTVCbrSiWNKmK4hLT4QvSL6hvT/EGv8n1H
 KsR2hU8TEtHbWv2A/p+B9qtSittBbUQTY7/DnyaHID6YA3RuSE5xLIl1A5aaFkFQP+MCW4oESLb
 1KyhGaUlsz1AXj1haHg==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce30d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=I76Qk8w-AAAA:8 a=QS8LOOcwU1t-5uVszdkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: DlGyVF25nThmX6Bok00YYXHJu33Qiqyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101277-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.35.40:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DF07377B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> index 6a31a0adf8be472badea502a916cdbc9477e9f2b..58c0dd3ccca70bce3424f83bfd5a52b1fef35c2e 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> @@ -218,6 +218,17 @@ pon_resin: resin {
>  			};
>  		};
>  
> +		pmk8550_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x9000>, <0x9100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;
> +			#thermal-sensor-cells = <1>;

You can probably add the DIE_TEMP/XO_THERM channels here directly

Konrad

