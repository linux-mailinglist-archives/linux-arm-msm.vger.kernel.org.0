Return-Path: <linux-arm-msm+bounces-113620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rVZvDe2DMmpV1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:24:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C62699085
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:24:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lrdRtrR1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CqzagMxn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39CA30C922A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0249730BF66;
	Wed, 17 Jun 2026 11:20:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5B53BFE5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:19:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695199; cv=none; b=oPSe7lo+iI4DRTnh3NsjClfLGJtc0T82iw5VDM/2NRNKxvTnkm7Z1u7TkUZ5+UbMWhqdzB+Vbs0nMThvzBfRuNwA1WM5adNsMKkABNXfcSG0k3ZPgONMt2TIAVqZlmtFoVWs6wNdCAqW+VE0K/GrTqkNZXL+VMHkHIOQ/+OXugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695199; c=relaxed/simple;
	bh=N7hQ0ve3hQ0taNvLoev6ThCQ+wIGyMmvtRFa9+rvnPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOWqNBGbOkZHVBKPQzjRXXCjPLXoBIAePYfLJ/SQtoEt4KQo5m8l68/5ZzsR9s6ICjDFGJuKauv/o0ptLJQta7dEDXr/om4vACbGYxOTnVeJgYawouzRIQJRTiPSue1xplx8GOlMk5JoLsGjZ1RGU4ZapYGSVn9QZFZyn4hoSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrdRtrR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqzagMxn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V78c2291377
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4kk4bGDUgiuSTAQ9QfRGI+PUxx2rIh17EttmS0Tp60=; b=lrdRtrR1V9NN2StA
	7MjqMLTMNbkWUcn+RLbOkFdmJNAFeUYdBTqgzCt4STG5p+4dZVsdSLlWuu1yfIrN
	GKnS6b5sDOmduH6o7/2nHnzw5ZeuwQ2mpQrKzkPr+Ac+J7APPVFWEVDbZ9b/75yk
	9fcWwihVahJcxWV1RyjcZjUNhUxUMXMdAGIqOan9t0gqqUfT5eEP05yd4PvIp8gD
	5ZiH2eZrAXSgiIoH/gf9V7GLtGHJamcQQOfYf7w6qs7GTACIlFdIn1b/4aY/Ywe4
	7pWxfZED2z6X8mw8Km8c+rrAv+N6lQqzvPkCfbuVEOoe1Ef9COuoioMuPx6DFkvl
	HtrRyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjwbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:19:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so119652285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781695194; x=1782299994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4kk4bGDUgiuSTAQ9QfRGI+PUxx2rIh17EttmS0Tp60=;
        b=CqzagMxnnlSTwTV2s8OTetIzkBoiYbVAsEApaP7UkfA3i1ilS0IgRSWndVFpDZ/7Co
         hWqjCCMKc834HGnD9jplaLPdOURsHmGxaVuR9Vv905IlyDRVt0N9UCCz0NucKn1RVIqS
         Frm4DGm/Re4uppLDVcqWcdew89yin1ADnT99ZkG0kldAGm0cQM7dm5swP3g1BUSnQROA
         PZEhRWuMqvQ1qMb2r4aqeqkXFjlAAF7c+DpUhuDnqSabOOo/0dUsGMQ09LKyRZv0qKuq
         lyj4YubPjuicmGrtQMtEjqLa+qaYJWwGuINWeGoceWxFe77pO7heRJeWn/8qiskVcsG7
         2DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695194; x=1782299994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4kk4bGDUgiuSTAQ9QfRGI+PUxx2rIh17EttmS0Tp60=;
        b=sTZmLxR0tvWdNEV/kgbCjKBgW2PTBieXt/tvxz5cgDZzZcYedBFe71OtWt0ZpEmAZs
         pePwWXZQTpBLD4TVf6ZvIawrIKBLBgEPsSUU8De/NveELaSjQYrz0PPoLmb0TxTLjf8W
         PX/RZpWZfZzmPNgP5uWiaXRGE8SvoYrp+mitCgmydWgDS9a5XmTVjPY00/WJgy72v8VU
         5IGBczNg09KIXxqmgRVx0KvcG5TsB0M1BGNdkHIL4OhJ+wqUrkYSo4dD57fVNpJt5dg6
         BdQfrSbzsdDwC+oVkZhv2NGDnXRF9sZ8xjCurhMti577jNoYgXlxCvS4i2PyzpW54zEu
         dBrQ==
X-Gm-Message-State: AOJu0YybMvVJ6kfRcYyXYJWma/sfoqDxNdA0+B/ev/cG6mcyxfTV0jiT
	kqev9nXDavKQhn29Q8+NgPz4QERYeW4j2mklJ5Qtkiu2Rbnz+WnCSwtJn767EV271cskwfc9Mao
	BH8qUctwtftg5FRKu20kM494WlcK/V3OobI/3dexFlcIE+ZamZwkffvJF8yW4xtm2tUjr
X-Gm-Gg: Acq92OH6rW3vkSy8CNFmf7EUGF/dYhjzScxaFp6WzFfkQPo10401v4Zn9SlrtMXw0QP
	Gr8ScRFWIF/FJ0DvjhwPJBjXtYcmqCPUdEeFjrSv0c3D5o52K0eb/s8lGNu3C6FwQrvjooRJ+XO
	m7G/gQJDZT/8YmqGTZeMTW40J8cTsUL7Smvx0HBx3v+cPgLV0ePqVB8YchBrq1ga6w69HE9lRpx
	pVBHLicUOdXxRnJlagAIcVNZIJWhsgmdNQGtYvhE50wCwLMkH04e8zbWEEARluimUinrzJIkEII
	DTukr+Bb8yjlO35KwFTLt6ZK4vh7u4If8popY6QnRONKe9TlpS05T7zg1MtAp2BuOm5BRQLxail
	aZno54AOBw4IyRZIVoVvTbHNbSMfAfMVC1qw=
X-Received: by 2002:a05:620a:bce:b0:8cf:d953:b4ec with SMTP id af79cd13be357-91d8acdc2e3mr370449185a.3.1781695194309;
        Wed, 17 Jun 2026 04:19:54 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:8cf:d953:b4ec with SMTP id af79cd13be357-91d8acdc2e3mr370445385a.3.1781695193816;
        Wed, 17 Jun 2026 04:19:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b54asm6350689a12.3.2026.06.17.04.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:19:53 -0700 (PDT)
Message-ID: <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:19:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNyBTYWx0ZWRfX9yRBk1dNJazb
 FRaBYPc7pOt/GS1WdWwY9MKs0X9H25YNuiwV6WnRM3HLGgLGyC9ATUw1QdBGqX0lfvKkUTOBiWy
 X5yEGKHhogo3iIokTFt8B59GBzepHCHfidTZdEiFp1K3YgUBUkTXPlFwAAwTEslYmjOSqGisqmi
 XhZituXnDVRaVIIyb4opFisUy4KzLSuFVOWdkFdwNxz43sgIbgnKQkHMpND3iYETrOs8w5oL0A2
 V7AqdnlM/r7kQXJvqsxyY5j4SALnNDjhBJ/S1Jdhf4ZE6gKGB34P5WCnidpklREPsOKWMXg8Enb
 NRzNXzWgwQlybgp5UupSX6OmCmOC7kDCFfCqNx3+z+D5S9vVrRtL2C0rNNi33+ElGJBuJ0SEf7O
 oPCtjlR9vVaNsJEeuc1AqGegdJ8lJnhqJNoD8z0JOKQRawkxdbgcimeYs5wbbmIgMI6WcjM3hdE
 Hrg8CWzDeJShikh4ExQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a3282db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yy-yr3CCGAyhAjPN4EIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MvsEKiMW95tC3Fq7bvLj61yIOVWhUda4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNyBTYWx0ZWRfXycA1b14/7Ms7
 mE5xRsyUVvehRewdXgfDJhXM6aUqUW8aYbujDWJVSLAyO3pIMxXUgkyZ4vUFljqLHI3Lnfy3oFz
 nYIGOSH4ussx4FL2r/UgFIKTtBgS5AI=
X-Proofpoint-ORIG-GUID: MvsEKiMW95tC3Fq7bvLj61yIOVWhUda4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113620-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1C62699085

On 5/19/26 7:47 AM, Qiang Yu wrote:
> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
> PCIe3b as consumers of that shared PHY provider instead of separate PHY
> nodes.
> 
> Update the DTS wiring to:
> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
>   &pcie3_phy using two-cell PHY arguments
> - configure the shared PHY node with link-mode and dual pipe outputs
> 
> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +		pcie3a: pci@1c10000 {
> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf20>,
> +			      <0x0 0x70000f40 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x4000>,
> +			      <0x0 0x70100000 0x0 0x100000>,
> +			      <0x0 0x01c13000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> +
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;
> +
> +			linux,pci-domain = <3>;
> +			num-lanes = <8>;

Is it fine to keep num-lanes 8 here even for configurations with
bifurcated PHY?

I would assume so, given essentially this is a x8 host, whose 4
lanes may simply be effectively NC 

Konrad

