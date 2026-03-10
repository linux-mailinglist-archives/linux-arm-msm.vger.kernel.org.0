Return-Path: <linux-arm-msm+bounces-96598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH3GBIz2r2mldwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:46:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2A24995F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A9D33013FD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2D937268E;
	Tue, 10 Mar 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3+kH3OW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zxzo8RP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA837187B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139589; cv=none; b=CRpEB62Vefev3I4NfTAVi0uVGiEkyhEQ5yfZltTSzCGYShbg9mWACNk1c+GAPKZzji1DXctLo1urxS+75JzOfYVVR9F//JXe88Q70HELF+vIs8kAWyzViFwZoMcQHXxqCRITBQNjjytEo/2sRSEv4jnyKDyprJ3Qlgr4hMBMLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139589; c=relaxed/simple;
	bh=giejrRia4jPNnibbJiSYVAKFlFcXgwDtalJu++xZ69Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RozIz0cxCtZ/4avHwO5iBDfs6W5/giBElc7JiIetn93kZoLrbRjZgq0molYrgReUlzi+J6uJ6a5R0f8emStjdTt6h7FGj+dKAYWSaemAPJWTHBdv/AeR1P+nmjA0N/jJO6xVwMtSX+r+ZqVbK9jvxgigYdahm6m0prUymI5KVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3+kH3OW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zxzo8RP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8wuYo246776
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbD1AUBT9zmYKBHovxWsCgqbkDb+tmjWhMIAz/MeuLI=; b=Y3+kH3OWhTx8JEv6
	/0q2sWVp36Z58fQ8D/RMizqepY7RZzlWlk4nSlsc8gMVDD3x38vH9mfXgXTXKGJQ
	DjZMyKIIu424+WO3zpMuWjXbDiqIaCIq8YmSJrOkPp79O1EPC5QOCkdpH6j/n2WO
	iSb46Uq/Bi7DOD8+Usr6FTmC/Qy82ghLiFB/G+POMilXn8tZbvF8XxqVOAwB9oLQ
	Po0abtoH9bbSK/xpyU1KvqOXBb6iu2M/Nu1nsnqEs047+36IMTicCtAJPy6IG+jC
	LtFeu6WgVbuXaB88r+psdOXUMteUZ9c5gjL3u10XNdP+YwFbl0d1t8GFysqEWvIQ
	MbVmrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct880246m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:46:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8dc8b434so121644885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139586; x=1773744386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WbD1AUBT9zmYKBHovxWsCgqbkDb+tmjWhMIAz/MeuLI=;
        b=Zxzo8RP4ddcHRotQyMRXP6GPwmjc+/GBf3BXImprcAGonb7DLDLnullkZ8JSKC+SFt
         epb+tFWolJVzgBdb4zpLystahGgnPKpcTCGkOT8ZkwOa3LVALD4b+Ridvk9Naep1XrCh
         NaXmvVbzMeSxtNHgBr9a5tRM2zU+Gtx9uG1CfTQd+jVNlQy18MKZGNy0GB8UPPVgezaH
         SFdsXlU23z71ovZXH9G1YC3HuYIheYtHfGIS/rVZyubOsMK0bxYbe/U/+uoThBilE3FL
         oxddx3mh+0PoZSqXY5zw+98rY7+Ui4Wy3ZO3/F4YzqGTMqxUl0uNnRxf3gEBnqrtvWJt
         i4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139586; x=1773744386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbD1AUBT9zmYKBHovxWsCgqbkDb+tmjWhMIAz/MeuLI=;
        b=UnL7qj3ophPm038uux97ukFOQ4aZ6kQwwzdno5Jm8Dwu0/lLckZ3IXOgxTcnhlkiBp
         2unI4mxQylCPMJuTN3osdNJdaCBgkniwkuU/VaPZsmS4/HKbC7lelIrPgC9xazYfGX8L
         1Qrx900XTGqyEEcDg6/mq2MwRSntMXh/V2WcHqRhflqfuaDtlJM8C+hIJFDxT718Ano1
         5sMNOERQKTFWbTFIRXy9Af43+7XiLirM5HAVOl3Il+ySexalpiWNlcAnUlPa4AZ5WYXP
         R58w0DMkNvA2etA3jgxJ8UKGK7k/O60hFUw48JOM501FZioKx7byigPxaRpi9MQ3sJ00
         nmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDyjDJUyRR15S1UJTgMTb0cPTW8AkglmOLTlSKsEOtnS8A/LGULsyFspN7cqxziNHvndF9zZQZNpqoxUbA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrtgy+nvVNgIEQi+c/9t8G3uk6BOznva7XKNELnYOYAH6rKhSn
	v0Ymr0gE3AEUYPFTWLC0Hjsahh04mQILUELhRLk7e0DG9ol5+Yl2krh5yz++7R4zND5gggYxUmQ
	vTR+JmOiwvJSPJ6BlveonkFrcZrLiNxXLuBmAMt0AudVH4RQH6udm5OOYhYYv+N9r2Ey0
X-Gm-Gg: ATEYQzzZnjBIoicohbK4Z5/PnMxUDjvfvjiSBKkclL8kRt2p8Z0TPB3ZMinyYvpVmVp
	Dnh+qrjlu5Beb2L1nvoOSvytGtag/QXlqMzQrOybGjlz5syoibWU+cbdWYbYnZ+KMITL+pjeW+k
	i49z9TRi+QlW/oIWnA/RaNOceJnpK3YIpbNnxKxaAAi9BztMBdy61cFLW0uCpP0E5ph1MsN8SnT
	IfuvT/56ztKiTkkb1yHMhYQJ6arCr3zAIw5VDQ27/g2HAGn4OB7iowot5UvrcKl7ApV52fJnTMK
	T9l0zDTd1t45AfgnP9oyCM+wWBGiA0EOu+gv6lN/ta+GMIAzX0ZpY1mu6jufTvzO9Dj8kvPN/OJ
	EV13bJLbVeOVHlXwuA8PlWr9uyPIhEXGMs6oftadr02y1t9rj30P91V2r9epykMEmGKKmkd/iL5
	Db1T0=
X-Received: by 2002:a05:620a:a28f:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cd86d4668cmr553530685a.4.1773139585933;
        Tue, 10 Mar 2026 03:46:25 -0700 (PDT)
X-Received: by 2002:a05:620a:a28f:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cd86d4668cmr553527685a.4.1773139585553;
        Tue, 10 Mar 2026 03:46:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18bb33sm476643366b.65.2026.03.10.03.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:46:24 -0700 (PDT)
Message-ID: <50392864-dbe4-43b6-a4cb-e6b6b5b49a57@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: monaco: add dt entry for lpass lpi
 pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309152420.1404349-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MiBTYWx0ZWRfX9sQ8pcyEvRQM
 2OeSBPXjT/9yMhtpor1+EGw0K2gJCtoxF98BQDAmMBYvmilHFC8RWCbETIOJpB8QCJX6aDEDElq
 Ld6B3XvepoZtTyY0Sge6Tz9DTTT4dsCge6mU83m3D8oPhs2LV4YVguehpm9rk/WiMf4Qq6HMhZV
 KnESJVGzsvlrrduCujzChHuSfLGR85z0Q0J+VdAD9lI4kJKfhbYEZsWnOfqSO50nKBsBCU+gGag
 qS4oekitXJDtX5kt/UFzb/t5cUOLQj766F+zCiwt04GmxLjDyM9eCtut+6rra7WAAmjtI8IKrr+
 HwVDZd/eu6koDBAtg7weByiU7qUq8giXcaXFHQ1iLN+6OV14C16evzy5HOvPUb7stoprtuO+fUg
 mrKdOrVtYjOTBavGow6Iq5whHj5690zuCix2X8BOc36clJb2i+Ax8LG4muNNhz3o05hA/+/wgui
 YFPCmzmG1ekcvpUL/RQ==
X-Proofpoint-GUID: BbkAm4OBYHbxTngj50WuMZynI_kzeb0m
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69aff682 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PSYRucXItuZ608vo30QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: BbkAm4OBYHbxTngj50WuMZynI_kzeb0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100092
X-Rspamd-Queue-Id: 4AE2A24995F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96598-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.52.125.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 4:24 PM, Srinivas Kandagatla wrote:
> Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
> configs.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index ce1565c7cc3b..0727dbd44a75 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -21,6 +21,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -2872,6 +2873,20 @@ q6prmcc: clock-controller {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@3440000 {
> +			compatible = "qcom,qcs8300-lpass-lpi-pinctrl", "qcom,sm8450-lpass-lpi-pinctrl";
> +			reg = <0x0 0x03440000 0x0 0x20000>,
> +			      <0x0 0x034D0000 0x0 0x10000>;

lowercase hex, please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

