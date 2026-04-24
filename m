Return-Path: <linux-arm-msm+bounces-104445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG/bBRFT62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:25:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A645DAD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5163F301E3EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76C43AE1A0;
	Fri, 24 Apr 2026 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUJPaVKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btUL+M4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F073AE703
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029686; cv=none; b=AL6SLfWlw1qXmkjvgEPjpxLkwux7JWbgMAC+oK6S9aIxSmV8iQnqHfZu2Fv0xg4WilSNs3VlcKg6gOdeBx+kunqF6e2GMTlsZ2yoSVCOaqpjOo9SJFClK7zTN9SgJp43KK0WCWQSzkiJH1GLYui4/1dCC07NLn5vDDykJZA7mEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029686; c=relaxed/simple;
	bh=im+ChalGIaIVInsXlQT3TLTeUv86lRyOTZVE+XwuvnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1ooN3uppKkg4ygbal0mT/ZHJcfbYhGco4EynJTc/GdyApVONXUGDuy7PSKvud5WuGoHUDcoYRoRBuSBTyMOUQ/Dym2IV8w9/ujyTCpoSyB4swkSjvauQ4EehXjYVFuINGw3wkgmXVo3+FnCrYdRBin+RgzgnaK3NkxPXK6xIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUJPaVKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btUL+M4+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7VEZ41823605
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOyWIhZnTkiSHFsoDNOHhOGlTc1oeJnm+zi9QOeWcMU=; b=XUJPaVKtUKnR+iqX
	KFQiAHCD0hrZ/wlhcX5zRqEAGt/mbhARaMY/aETODhc1/DTLcm2auEJtgvYcps7X
	whrxG/qw0bCKugjhe5716Epupme2uMw8yV27sWPsiHkvHtLisBmAPV5BuXv+Eymn
	Jc5/yyCBdpOtfJZTmEYAjrvcwaS82mz80KhCKZ8ckeO1Eu7FR7uYQHqDlecm3p3g
	i0Anm8vo8+P0ILeh1Q3GtdpfbQ5If5iBZrswSfKTxOgSQ/DYS6GBUaXVAg+J/Ywh
	6tWRkNtO6iPY0aADjaI/qPyXTEBBx/6+/+e0DVgmHTzNht9ytjE7ld91OJ1tE+TO
	TY6+xw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rtm07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:21:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb4b340f4so21277086d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777029683; x=1777634483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOyWIhZnTkiSHFsoDNOHhOGlTc1oeJnm+zi9QOeWcMU=;
        b=btUL+M4+6pEYO2qwQrDTDgCBqIw/mgu9pEfZUN2dyuv3n2xOnmNa/HUpyiMK6FGqLU
         0JTG84FwkJh3by4/IfbMMrzLrXqM7spVjszkLnyP5agOe2VzrOITboGkUBHYiv+fDspg
         7aVtWYwmOUW9+H+MP0C1B1bZGkZEozgY9Rj4Cw+IrRckIY3fwxK58u09iD/wZ94NXjRw
         0K9yHjhCKy4WzP1DQmi4DeFmPluXc3GnVcuuC28wHMIIt5NfhBj+iZ1v56QjcIH178/Y
         Q8PfjzW6q6kZT26nULqkhVdaBU9cK7zR7Nf1dUiD/g6LLt/O7G+ZKz0IViEwg8MxF3uJ
         hniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029683; x=1777634483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOyWIhZnTkiSHFsoDNOHhOGlTc1oeJnm+zi9QOeWcMU=;
        b=plU13v5affBRrFZ0vis9h/8PFgpPVzentpGrE0+l2M6ftHbbdYhBiZyvFb0EfyhFbP
         +v6KrSra673rHbyMS0+LDL4NIC+XAN0u7OceszbcdIGHmwBh9b5aXofkkUpJ/MSBjho3
         cZZEy6ghP6kIRhdHAz0PcWDqsmnEXf/APDGGPUzrRRmxKWDEN0kYmQH2tRufzeJi+MhL
         tqf6DDn4ab7JhScG47mCQsZy4vehveNqXVxUWFNJ1o36rTpHXiu4g+2CkNuH4TcRpQDu
         2F/yVtu/neuVgc7svoHNkDGiGTx7rQYXU43XURfFEUSQWGenbk/Ia83mQbLdltdZUJmF
         yvsw==
X-Gm-Message-State: AOJu0YxYGC1j8iXK/NzoJireKVck4F9nncSAVy8ropJ/a8hDjQXpchIv
	ZwGa+BGXmlGfO3BizxSnwHb/IFvr+VWGvTf5hwRcGBd8t7qMEz9YfWyZ1DAD1PfkHv/yf7LJtOT
	SZG4kNUgVdc1cKajBY2OIzi6CtOZtm/GoYhin2j5vtxngBgdCJ3+/psh5m8DVAfyshndq
X-Gm-Gg: AeBDiesTdHSKtrhYKzo+OvQ8YKDWug71peZLNvLUVa1JH5wRhTJXQSWUT+XQU2mXtzL
	nZt8sR/ekWfHhYFU1b1U5Sgy8NOZVD2usejKfEj0fTXPs9Q58HWQzvlhhi4Io/3gpy5SpoxgoJC
	JZkMUPqtdWjvOVJzU15VHbF2eqK/S/EtOZ2crN3oS2k1uiN/p6OnqZk0nws0Y4HTysF3WrgQ18f
	JlNfHxIFGtjZLXvWV8H7bRJsVtqmbt8LGxQW303BE2TYE8ZpdtDlJQNI5JSR/wKIcksIwt4og87
	cErBT6egBujOmCtsavUQN94o8UB9mVgDoNDPPi/3v6g/bcPf/zX34C7/mNy81qvUG84ggiBLlox
	ogROBathJEvlUDrTgQ6grVAS7RtpXAUuKezjrWr/tyQirgojX2clG6YtN1C+KF+GXjpFgjOlyzB
	GX49V5V9wvM1VyKg==
X-Received: by 2002:a05:6214:501d:b0:8ae:65b7:1b0a with SMTP id 6a1803df08f44-8b02806738dmr324767596d6.2.1777029682739;
        Fri, 24 Apr 2026 04:21:22 -0700 (PDT)
X-Received: by 2002:a05:6214:501d:b0:8ae:65b7:1b0a with SMTP id 6a1803df08f44-8b02806738dmr324767396d6.2.1777029682325;
        Fri, 24 Apr 2026 04:21:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba538429115sm720116366b.15.2026.04.24.04.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:21:21 -0700 (PDT)
Message-ID: <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb5233 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_KEJFKjczNoHN30lDmMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: zIk_E0HY5shxIgR5pZztZ9qs0Dc8Spl6
X-Proofpoint-GUID: zIk_E0HY5shxIgR5pZztZ9qs0Dc8Spl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwOCBTYWx0ZWRfX8YKfZo6jFa66
 reJzYWUGAS6jzkozxXmanmOv9O3vnG7k33vBpzssDSEFXX9fauYwCy+JO3ZRuEwHa5oWPB3qpWw
 8uKq4r4rKwOI4aSReRzXKd0bZPv/PPPF9ANfBJLTErZ4BcA1v828hUw5K+jjy0NYm7PxHOfWy5c
 wp6XFXB94b/4fW95b/+nYsFT2in9tzUOVMqYF2a13sSxriLT32JZgeENzj8XEHlI1yLHTPCW/OU
 40Dk6ZFzxAD3V4ooTxzXSs03Bo0YiaeVqqcWX+1sPkuDetUoeegOQ64GtTkS7U1G0p9ibMysr+d
 J6854MN0USU+6AuerfwBhgKUVNrBNQJP+6aYf8mbUTB5IkZ3TV2o9VzqnO5WXg0RTIB/S5Dtt9z
 4H/957xZAgMlw2/oWx89cmGmlD9I23VLBDRuRaUs11crSGkTHqUBPiqIs7PusLZCNb6nqoE7iej
 mfJ4zUD7EvN2sJ/aXxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240108
X-Rspamd-Queue-Id: B56A645DAD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1a98000:email,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_FROM(0.00)[bounces-104445-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.914];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ9650 SoC and
> rdp488 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Overall looks good, just a couple comments

[...]

> +		CPU0: cpu@0 {

Labels should be lowercase

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;

You likely want to add #cooling-cells = <2> 

[...]

> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

You'll need to do something like:

9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

[...]

> +			uart1: serial@1a98000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a98000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";

nit: please keep a \n above status

Konrad

