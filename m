Return-Path: <linux-arm-msm+bounces-116829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2v79OruoS2pdYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:08:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8D7110AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bsr7BpIN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LYiy+r78;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0778330B52B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A745420864;
	Mon,  6 Jul 2026 13:00:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BCF3043DB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:00:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342823; cv=none; b=cOgb67KdO0AXa4gzIhM6qxr8B0W3UWVdedt6oZ+K0FLjDtyJiViTRBkU+PorHQHEx/ixWC4ICdUnPAxwyTMHTAHwbtPW9EteRv/tJmay+OmhT7PwcUNDci11yxoJSMmeGNsJOKltZVm1kzHtOQy5hxlvjeKJQnafXAvyFxRvvbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342823; c=relaxed/simple;
	bh=PFL5j3TOs/5RUWWKBQWglpjHpi8U23pfidgWiscwBvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0YHKPYFJaE1SG5crP4OGfHj/sSA7bYaTtj7vshMJx9LIzF1inYbzc1avIaAtMqEihL9uMEBEgB5xtfG5AZiAZTejMJWQeY5OPvOODVpxc7zC9XbOfO5A8zlBSQpCxnIzlDDLhK89q0X6g6zro5hqtQ5lH3QdyHNy/mcfz7EC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsr7BpIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYiy+r78; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOaL238924
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=; b=bsr7BpINFB7732a5
	TZiyT6s6kG1k2MRD81WFcM50J11VxwmbIeqIOaXjyfPvvTMlPq01NRQajK/YXoiB
	vewBJKo3GT/2HqqwTEfheyqoK4zkDVWtStJxFgaw++ollWqeK+PDTVLROLYUTG2F
	ZV1A3t68Pek70CZDoQ7mbKXQsaEFWUsPNpmMOrKgxgYAYUzqXvmeU2P5qmJ5BiXA
	sFkUvBEx8scn6dcq3it8ILlwnMXGi7glvEddnGGz702xv/U4cQ8wYzxTlsHfmFcS
	2PE/o1INBqGSlS7otzVPrOeF/fU2q3AgQymJlAv8o3kYM9mHoPuxUbL8QdmrjRjm
	mIG9gQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t891ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:00:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so3523691cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342821; x=1783947621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=;
        b=LYiy+r78zB9upFYZy2gR8Pizcf1i2xZuURCL6lWRX8OAcw0QK5f2gZ6FruMTXpjTaO
         qgiVsf777KrS/mJ2z7CRvFeChC+sKuobAIDyHZtJVg03dSlTEZsoHBLC9muFjTjZM7yw
         2rBkdeUFbGB8qRCKYvDf05kKImA/Aci4MfluO2azjB99hHIcg3zSZnRsSCEQJbYtxQdm
         S46P+mJYKzhK9O7OvHlKrwIrbbBFquHFZJxSZKM3Be5LIGL1vCk+tai14NkEWONU0tWy
         rVsVjyu+EayxPaA6VDeadBWOiklhCBb7+2gRz+lenh0/hI8DsAmhDERNVFnmVl0tfCU2
         vTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342821; x=1783947621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=;
        b=AcAO5Xh0mys/o48iPzWGMw3soud7zFdzr/JfXDG2z9g6WxdpU933fYUAna4Jbu0J6V
         vgYLTZLT1GslyQMN9nShlK1gEUmH3fxvVFb9G4ro1u/FYMkVKME5wM81khVrg2DMMrHf
         JLZu715QB8PIWZaM/qSxOICE1/U/hIjcZroyc0stEp2UJb1SMpmukZvfCOAGr+JBm0TE
         e+V2sycVdLqWgISovLxeO3DwKFmJNyTbRHx30XA8QS5+7uAm8+Lit+bj8/q8Gz3MK0Wb
         v6MKxDhqFkOXOzpBiOscZzfqjITTwDecO0zBKDM6eQ8GsB42uwJanc8fubJ6aDw3bm7K
         xo1g==
X-Forwarded-Encrypted: i=1; AHgh+RojnS+bX+TdAPgN+43+6LTaZpvtYTwd90oW7QokypYHu/edBPTCRaaAg1Tj8NkywBDPAF/Sv7M971R9A4H2@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFGh8637eYDc2UmGoJOIi4MjZRi05IKAEg5jyG5KyhxcIWmtK
	Wr4HQsvUAVm8w1NZu2kJ94C/4FijqOHme75e8kca9q7olnhBYHg4fWuv+4MUn1JlCWUyqSQ0Tig
	FX5bjNgxJajYDR2+hQ2K6JwxSB8xsVoVbjfYd8ymPrJXomWBrm+pIBBQXq5jK5fgrIND2
X-Gm-Gg: AfdE7clGe2Rv7CsKsAsNsPsCDwdd4Jt39qGPzQsubjmkXNxEFXvPmd9D27Ci2zRFGnb
	fkdaNnSxZK1cAKfFcMW46lG1ETE5zRGux8zHxc/W0NzogcPMoLTdlhTeTILKtKa25U8lO76ySzE
	WKKF9AmFcNS/G2mrhttLS9sHlDl50OVHQUM+pLtKvHDBnFMz+Bt2I3UZrFI2cqFjMp4d0TFIMZ1
	65QRJ25K/oMFrsaPdrKcFPQHIOHxeys/1tP89O/nB7Gjk8zm27i1eEeSQ/SWMuCoX0TFOs10rOM
	X5UwfSjD45hejtjHbdMiChy2ksJEMdhTc8rIdFDb0S6HM7Vdo4kX/c+gOEqkZwUXo7qExBnN40z
	Z/4GYG/hTY4C8P65Zwuhk0oUwO76STFmA3Do=
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr90901251cf.5.1783342820340;
        Mon, 06 Jul 2026 06:00:20 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr90900371cf.5.1783342819707;
        Mon, 06 Jul 2026 06:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm772908166b.16.2026.07.06.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:00:18 -0700 (PDT)
Message-ID: <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX6Yqo01fqjEvr
 7/jsEtYLz79MC14o7Bqm+2CII4SgQbHbTvXiESbRCNW99MzdLzyfcAm0YgIVeYSTe7j5FsaJYgB
 R/7fCnsme+AYn2dPVCwuS95DzA5ktJk=
X-Proofpoint-GUID: X07HiAPp4w7MO1DUxTlsbvZe9HaOUval
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba6e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3UrmxHwGBoanhqk-odsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: X07HiAPp4w7MO1DUxTlsbvZe9HaOUval
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX9R+sMpyegeUN
 vTmaFlpu9oT2XSV4cBpgFdmEuhys/vf4co5t/jAqfy93oyR5ueI7agw0pDqlVj4orMglbXyKySu
 QtWGxxiAe91tm59vTJewDL3JmRkO0BcvoTfEO969FDW6xstGKWUC2W0HhD9ndazH2JhabrYEuDw
 nq+xgCbr7b+wdiPwhZ71XFeGQsVj0Ry0JwUqd3nExt4YuqG3ZdgeqIjyghPT7lRzcMIjfEDBvlc
 8B+eaX5rXx4VlD6npglBuYO4rmLAjwb8gj2S24gUzLfQRdWC4lMbelAnNQ6OWDDEDu7qmenrAB8
 Ki8lfEgIrH8R5TiVvh6D8PgEj/w5KYWI5N7b0HVYJOgloqAa2oBH5Iaarbo9alHu/P1At/MSerX
 c8j3RhX8/2iqPttDELCkpFJXpDh+LFcatyXkrQAo3WSRHySwPGBjV7GefeWWbg5BX4H3spPjvA4
 WEtNPbaFJ9WlIyhPPig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116829-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 89B8D7110AD

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
> +			reg = <0x0 0x05f00000 0x0 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&sleep_clk>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "gcc_disp_gpll0_clk_src",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",

FYI neither Shikra nor Agatti has a functional DSI1_PHY, so
unless you're worried about some incorrect bootloader version
toggling them and want Linux to clean them up, adding them is
no less than unnecessary

Konrad

