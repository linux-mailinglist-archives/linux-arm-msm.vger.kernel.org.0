Return-Path: <linux-arm-msm+bounces-112750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 63vKGMSjKmq+uAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED676719BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UjPsErVi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IftUlu+J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112750-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112750-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E20D301AA79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769CD3F4DCF;
	Thu, 11 Jun 2026 12:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A923F5BE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179222; cv=none; b=ENt5Oi91Y6C3PwyyloYI2+1yqUylqRjTyk41Mu2Dx7TtyLc0qpUIIZhkUhunstT2uPOgqvMRr0k/+ztiGcIJSbf32h5AV3zvQmk+F9lMv4XmwEzFVxg1IrfmSnA5m6r+Jz1AjXavle9ng2plfvb6mawsl5vYFZjQvMJvBtYzDW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179222; c=relaxed/simple;
	bh=mfwra88telGHmlK8pwk/qUqf4z2Dpnxn0DRxiXNQG+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHG24DR6rkq3l8iwk0MIpXMAX93ls2/8+3ez1vi/1iRGGePwYUxnSMik3VFmPnX5S2XG4eBFMw/cCe4JIhbyCUvimz8wGzdhQyUd3S2BZWBsJtbAQBGV17MwasoJudKTkontVgVjnqSiolV2TxKwbZobnprIUu0XTkduPEJyJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjPsErVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IftUlu+J; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBCH263558
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=; b=UjPsErViRphn8y8O
	JS2I0WSC4C5ooDIbTf6q/ZBSj70ciUN9zgW6fhpNcu9dMt+s2hMPoTurw1WnwaE7
	FT/VYDye+nt0Q3IC2mBVcvsFgY16Dg8oRGfFGnDTTpgl8Gdeb6v4BSWHeXOWVhTH
	Qm0pDB22qazQbSvOnFsDY0l2YehhJRlQ6G17Kin5RUIon4VgZOiqpjLRa14OvqcW
	sG+OJpg40JR6i36tFZ2zwMMzJpKWGybbXBA5bKKYi0xDLLzwyH8hEaqJwRg0Nohh
	6/tqDErtbWqHAYEkMUevV2urNcCTp7dXyZX8aBFQzW+7xN/RRqzjjAAit/dU/oI+
	gg9G0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu8cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:00:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bf22b2bso14849891cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179219; x=1781784019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=;
        b=IftUlu+JtUYW+OKgjlxs6w4CNnf/qXpHb+SzGjzxxujPcr9W20tBp2V7/4OfZQdf1r
         o5wPSEdnIyvwTr1ZVBcn+DjdYjdEp7mz5tjoVUTE5cidKzPOmDnQZ2O3iOPAhEnmDhVy
         eS/93plwL/tqbmTzSE2Dg/koBKlz04c0NNkYAj+IZkprnXYsDMwQp3Tr0gyVqOr7+1aB
         iJJn/QHMLinzlcrT+7V/og/9ZcoxMfSDswPF73cAYtkwp3ltClraE11M5FJUIq+y/TRp
         8TqoIDaiVtnm6CPBdOg0lSKShBZzrOZDELtl7bMAqH28FwelGgh7gNSE5ODGnA3jOIO6
         eqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179219; x=1781784019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=;
        b=Wnlp/jLwloDd/GsKcpBi1CVJA8Ln8049Azu8nC3nIYHz+dJcc3WmPHKtIN5WzaOGAW
         FFHO0RHIDLHWQ4afeEXE55TSpyFzF1NTEli8cm0T36yEv/YAnsA9k3RygCv9agnN6oza
         TWJldnvTBI/Xq2xcDRph4XTydLDliC8rgctCIU3CHaAeSREVqjyTypLBnd07Mt70Z5Jy
         kBf090j2/58tca+hrZ1dBIYhCq3VKhIPV5jU+eV88q4FX8ImZX2XXzr5NSUBJM9muqNr
         T/EYm7mBoQfRxy/cn2bVUE8lu7gsziAEg/bjY7bbLbfeX+0xkf6ffb6Ak7NuQu55yglh
         7Jjw==
X-Forwarded-Encrypted: i=1; AFNElJ8AqqtHU4oLD5R8txMHpZ2m/Cx2dCSVNRbE1vmcWYTtKsLFHv4d3fvJ29Y07vSSRiJpC2ETQ5ZWsd3QWWwW@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3T1Sqdl0K4OaRJ1XB6rVhXNQEc2ykezURAJYAKxA9MUINgHE
	5Op1Uz0T65hvjjyHUSg4RK8EnLz9aRXnsc3xMiBUuoABIknbsm9ttC9goIqNup6PEChr3L+qNV8
	GFtDRiOaHGTzTCUBU6xiEv4/1LZhXzG3ArAJCmysi8O2cKcGfn/KE/L3GBeqkJ0LVgfqD
X-Gm-Gg: Acq92OHK0pOlUBimlggzmhjcF2UXpxfGFGD7xL5nHfClr3TrJC8Wyb3Wosr6eB2JUNN
	QvL1KZN/h7OAblonxH/fgS/mRnTPaUFcK2uhAvaGowj+uBpNZ9TCVbf7zFVVnLSxgJr+afHiN1K
	Ndp+fEiW73+N1pJFo/WbOaGOMJAFj3/HGIwjcZ/FghbpYbp9wPjX6ys1VqOb+8xkm9ICWvhE5wD
	reF6BriGQOwoHllbc++vCQq21Y0Wf0+B8ffL4JqB3VVlJP4tuoQ0YFZNk0zb9zbVv3OwAijTpTx
	tt8OXkejYtMixWtSA2TPy98cQvfYnuf0wdGPUa+q9L1o7d0KWsmrPd8BG87MPrjMx42sk/0I/+Z
	l58sNbIt9LzFhepm4wEp9lZUS2QafWYo8xK9f9ozJ6A9UMo70Nqt8N/Q+
X-Received: by 2002:a05:622a:4287:b0:50e:6311:7380 with SMTP id d75a77b69052e-517ee3c76f6mr22740211cf.6.1781179219280;
        Thu, 11 Jun 2026 05:00:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4287:b0:50e:6311:7380 with SMTP id d75a77b69052e-517ee3c76f6mr22739371cf.6.1781179218495;
        Thu, 11 Jun 2026 05:00:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm55083266b.2.2026.06.11.05.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:00:17 -0700 (PDT)
Message-ID: <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add EVA clock controller driver for Glymur
 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2aa354 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KhKKGY6azsjSgFTL2HwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfXy7GClSUJmZj4
 xsn+Udp+/WklL6WlUmmRBTKfhHahw3G++HoLJ6cqkDiEp8P3RUxA7VVXm+BoOmBP9wiKNSUSirH
 mu93mVxN9bln+owcClolN8PzFxnFAsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX+jkHHNlX7kik
 3jZxamDRQ1Humupi/MN6nEapmQZLn6DsCv9tWdz8r6f/3MK4Qsm0BtNuN5TEl/jZR/mk3PXho6S
 fnQ0xwbs0YRMxLBg8R+iAnOVKe47F67U0ZPyIbuW6WMbAhMJbu7ehYVEZb/Xey7VEjWJ+eB2rV6
 DG8u/Kq2HD5wUy2yDz8zOCDQodHkwETgicCx/lI/8+f0EwLISbiQ/b9DAxljdBEo5WJLCRnkgXm
 Q89Nsou+H11Qqkruvt712y7jEgJQjMLY6pT7W3XpAGEnbFXyGwXyAzasWNHdXSQFUTkSAzwAmAH
 Qs51xiK05FiG1jRboll3O9A1ottmB+EqETB+JT/0OHKxw3BlSD8wvhgVBi3zb1RdgDFfEp7M2xr
 dR6oIItDy48DOFC9HZBqfBBOECOErYgVx4OFUazsWvyPoKCJEL0qhgskPDXmoWzF8c0LxRMlkbN
 6XK8FUyir+hTdXOUfGg==
X-Proofpoint-GUID: zS1PPCysF24IHG_hc_B7f7LlSgvQcCiN
X-Proofpoint-ORIG-GUID: zS1PPCysF24IHG_hc_B7f7LlSgvQcCiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112750-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 8ED676719BF

On 5/26/26 7:29 AM, Taniya Das wrote:
> Add the Enhanced Video Analytics (EVA) clock controller driver for
> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
> and resets for the EVA subsystem which handles vision processing
> workloads.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +enum {
> +	DT_AHB_CLK,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

DT_BI_TCXO_AO is unused, will it ever be?

[...]

> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/* Update CTRL_IN register */

Is there any better comment we could share here?

> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

otherwise lgtm

Konrad

