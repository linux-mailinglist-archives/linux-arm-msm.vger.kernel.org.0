Return-Path: <linux-arm-msm+bounces-101281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMQ5IZflzGmjXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:29:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6083779F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 927CE3001D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B88392C34;
	Wed,  1 Apr 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFMHORrG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beYxqQe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA03A8753
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035577; cv=none; b=rEuvkXmoQU9AQgfSTkoPkgyJcqD1IgrXd8joNgxd7mZXCSqVxVu7bn6W3ZI5r3W5u1eTRBSLcVhOTIlhvjvzGcpRO6vaLFfWXvs1fxGLzDQOP8HJiA+HUsyGpHh1mCIy4kS6vWAk6uy5kZocnQSCoxjGSSBJOsrYtNE1D0dvdxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035577; c=relaxed/simple;
	bh=N1UOi/5tFrC/OAvc2rlvDo0JIbGDld11JWi2OuSY+JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv6TAJuaJin6x9NNo5V5Y7NI/jI5NW/L1ddqtjPFGdUI6XteJlKLse6jsdt/kyGn5UTq0IyCfl5zD46W7e3mwfAaavp2wwuAtF9eKFB6GJtxsMVLWKbTBGGXeFSeCrQyF/SH2Sppeo7h1s8QJh3CFlHl+LZ8fxULsdQ7j6DpGI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFMHORrG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beYxqQe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317F28o4107118
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUS25DIIXUeo2vJxXPnbHMjNRhI9FjvXA7aN0RaY8ug=; b=UFMHORrGOpJ0IpdZ
	6+ps6JZYUmmFJ9n5FRLGMoRQ77vwWU3IppzGHqmNZH6INn9r84wNrEOiR1rVGlSF
	JUIV9rPrxs7c8luVaIFIuOCmauIIdFXUaLu72gkHONaLoTqmrc5ffayyhxah1tpM
	+IvUTXYqD/Dx2aRB8msfJNYEsy8kcXuvBrqiyIxCxNCHOhH2sdsh3YX8JGPkOPPD
	2AKW8jgDCgQXRrZxcqcAVZ7uk4bSUybDMG30K7d04rOlFf/2CE7+KiIxHNi0CRpu
	MYoAzozxzEztk3Si9MpkHKykvfn/hajHWOa51C2uWRDuoNDO6NquQYWmdwcrWpQq
	J1Xqvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90jnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:26:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89e9d327913so18807776d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035575; x=1775640375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUS25DIIXUeo2vJxXPnbHMjNRhI9FjvXA7aN0RaY8ug=;
        b=beYxqQe3/i1F2xzcjhQK8WLamAsFnxjy9dP8AMixIhOfx22JazFrdBGw35PLsjjplt
         5NECdwtreoHe06gMdqR2TgP1qaNiKrPSttOUgmUtSueUH91rTuEd3HvkXjF3czqALMm5
         8oKqJ7xpn3r9EVeP9+uyTyALSIfKECnR2jLceZNZ3HRQDA1EQMXlfefkupYLN8pJndO2
         1OIGRmFDIpEgquFuljEgfYJgxypEPzUdxlwo8vq08BrF9klMKUV3Vjk+/EoFq/QpURyn
         ypmhhBjs5R8eoSzozvPgYiSOCvDEW42632qnh9lkRn6fi99aONNyawmR1d3P6Vr92xEe
         unjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035575; x=1775640375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUS25DIIXUeo2vJxXPnbHMjNRhI9FjvXA7aN0RaY8ug=;
        b=hbVEKJ1Pi7R5BPyMHuqIgBCRZPzeUmEKVoBh6saUmzubESZOrdtCuk3K99JKE3t5KT
         z2vDUX+BaO+blDY2/gglKx+zG5Fp1K0aoMOUGp3iNSg1BCHFrzUjr1K7RCUtLv9kwfrp
         072YE3GAsrTBzsBmBHBVas+7xaUW5MxOdB2R6YLlfJe0KNLmBzJ+UEdv7QL3bZzNyEEr
         xIIU+3Wpu+Q4oiIgc340HbLfVhGY6MkHja56va8mVP8WrJyTO5lppOFlrwOw2O93ZNl7
         3P2W46VwEOoTa3agHeQVu+6sNYpF0/AS2wU9Urbj/G3PsovX5hIkrqDEv5+i/l9RxEQb
         NT6Q==
X-Gm-Message-State: AOJu0Yz9y40uoYHu9vTpoU3Dn+N53c0R7szltwzlQPzHCUGfE/jy/Io8
	4+z3qznbQJSW9iro5TXswaTLM3sxUjH8pq0jfOv87VeLs/ZVK6fgPCUBgBuC7ACEFRmun6Xvlnq
	3Un01hQJGhvq1H4Wo1AAOfN4O86i1WAKV+O9u+zijoYfSaNasVsIrEk+BiphW0wu0fq0H
X-Gm-Gg: ATEYQzzgz/ZYNkqT8hKDKjGmxRAom1pILTJTwIDB/FLj/5QBtZ/mi/3stfexsoSCVKY
	NmGK//rT6EwBeYVXpODPldwPj9k6bWzis9RZe56zdRO7zwoOPZikwsFNZI1sNpoSQEQv36vFQ4r
	hHeDM3ejEHqDZmuKBM9fnAmzwZ5oGh3dR8UtHLkC7Vi2MrtgHHJ+E4e1RKbEolk4K1dsgLmn1YN
	B/CtxLtI7ElD+dB8pCN0OMTiYLLMfyNKzIzjQYyVg5LktgbUsosSImTd+7PSUWCaj2wy0CnSpqf
	wF2wGi0YTBRN8Qb8vnjUIU2Ua6TlO0uNpCsYJqZZ4Au/44MzYJ+ayBc7Jgz8W6e1IGr6OY86PfJ
	EfYDD0AnES0xSThYCJkNG9T4kG1d9v2OV8D+sDIxYIE1bTxEV43JK2d6fBK0sNAJw2QhC+iHZXx
	S1ic8=
X-Received: by 2002:ad4:5ae9:0:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a43a84f421mr30800806d6.6.1775035574629;
        Wed, 01 Apr 2026 02:26:14 -0700 (PDT)
X-Received: by 2002:ad4:5ae9:0:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a43a84f421mr30800586d6.6.1775035574130;
        Wed, 01 Apr 2026 02:26:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e472dsm500780566b.50.2026.04.01.02.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:26:13 -0700 (PDT)
Message-ID: <796991b9-6f97-486e-8c38-3a9696c04032@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:26:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-2-947922834df1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-2-947922834df1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K9UG1u4iVz6JWl6TIAaZnGYCDWc37eFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX66hlUSC2J/qs
 0rlqAbop7Cw7r0cZPZCc1y75Q2sp+uZLLlxSdFkWelEvev07LRRWSU9KSZlh5RYIto8YoOyzA+N
 uD5D8IHtk1rhuVEF/cJmx2bhfIpfSJqzaH75xbLISe88FSp6vz671xTMQ7tIJhdB+328oGnj91G
 3k8qucVnCkK9dLMRvaKSFvu2FnrpHq7mGb609hBKbe8JRM1lCBu5mGFshnznVkYu2hDY5oDy4Mb
 ULYvlqXgAY3nrEfRXPl14UcoGlUZQG3o7IC3gN0DZ0OaOkantI/P0gXYAWID5x7Z118gvNPwpTp
 rqHs2m5w6fkyChzfbNgMviv1K9JtK0xoadpIf7XnzxhQgG8IJ0x3RyZYuwDLGlG7RsQswc32+Tm
 wAYun0humvmULjN0Q4vzPeie8rKsyEM305mK7xa0JOY5ppkT/iOo5B7zx/mTsB+KUdB6uO09ZHt
 Kg1BgXfg0ebDFUdJImg==
X-Proofpoint-ORIG-GUID: K9UG1u4iVz6JWl6TIAaZnGYCDWc37eFN
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cce4b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Apu4DP7LmR_xVQy10KIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101281-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E6083779F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 10:28 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the I2C controller node for GSBI5 (gpio24/gpio25) alongside
> its pinctrl default and sleep states.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index fd28401cebb5..2088baef6c30 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -185,6 +185,24 @@ i2c3-pins {
>  				};
>  			};
>  
> +			i2c5_default_state: i2c5-default-state {
> +				i2c5-pins {

You can drop this inner layer (i2c5-pins {}) and store the properties
directly under the -state {} node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

