Return-Path: <linux-arm-msm+bounces-114525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BliM2cbPWp5xAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:13:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A36C5732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LtoaWreo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KNxT2uNa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70FF43010D38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A1F3DEFFB;
	Thu, 25 Jun 2026 12:11:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276833DE423
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389493; cv=none; b=M7ov/lRD9AUk0FVl3waYoUJEMrBT8t6Oqh/jbVOhMt2aJjakfRG+nVnvNkQbi7p0EQtZaGr4cqpDVZAwpncjLWa/KClp59mrJcgZaU5v4VC0MWFxJ+fWT1WC59Ulm+GnZZQG9Na2h/THVBs5JAo78BzstBHhp+5VgIAu01o2YsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389493; c=relaxed/simple;
	bh=lMD7f4VP4jQLW/JTu08gm50k0JL0LhYpkLEh26tIVN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ue0tdgHgiQ07ivGm/h2BCJpTjZ2kDIw51t5DR6ubrwIrOtjcSUwSN59W1n6wja9C6Fl9OhVEw0oPZr1vGmdoyltbH287QPJx6m75gpJvds5X3+ng4BD1eF4fqFbSv0H2KmgAzccBBdA2ASb2HYqQO4karOQ3Lxw+zsqFiJL6Pmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtoaWreo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNxT2uNa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jvO72046649
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/hme8HQOiN1a4wXz/MSlNVDpRDGc/UaRP4Z30huIVI=; b=LtoaWreoR8SH5DjJ
	p8vbxZDQQqoNJdSasYgVSw5uTIW663jkyz8hYxJW47X3xGuJLNiBfafWT4gIbJQp
	cHu/Gu0KkQK2IT7+a2z5VtKUB9EXz2G3aP8Xyv6ZdzQRr+AW5wbRKxma/QbAFGoB
	50dSXxvRPvA7ArllQMpmA+z9sAQpSuIYeyBTWDSOxVKRUVM0RcJ4kdN6ZC9PSE/x
	wDqaVk/unbLfD/DuYT9RxafEmsi2XSbtCotH9qNaHrZo+Mv1gJ9ua3ySVWN6lQpw
	4/NddumiTDgEGDea7Xc1veZyJicSzmKu6Lurht0F9qU4tF/7tfsqX2NyMXH+zNHA
	90GeBA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhym5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:11:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966d1aa6688so88079241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389490; x=1782994290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/hme8HQOiN1a4wXz/MSlNVDpRDGc/UaRP4Z30huIVI=;
        b=KNxT2uNasM/45YNpDPDswggVAH+5NhcV936i+lgwtcw6tIjQRvogYykz3n71QYFdR1
         uyzDIchHWb2Ssy6jOA944aaTZs+su0Bttmk2CTvsjti93G8zJLOZ2uoSzkr0tmZZygma
         3AUKEi2S+2VXPhLmz3eo+i1XvQ6uhKkIDyZZxzgru/b2L4qhTqikEqmrEOO6uO1DGtH1
         64iJtOAU28Y1xxA6m9/XZ6TSCtFhssx51HzdAqZaCdDpB2wsl7mSyEdw/R/gi/C3Dr2q
         Idfq2bHd9Jzfe8tEYQHLrIamA4zYJmRi+KyDOm71RUB7TY2Xkn7ZvGPqStes6h/YX0hb
         +qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389490; x=1782994290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/hme8HQOiN1a4wXz/MSlNVDpRDGc/UaRP4Z30huIVI=;
        b=hsHiCEghED93NOBXDcmJd1T4s9pwhyy9+ePzdMYAQyVouI8b6SOjxh0uwpGD9U+bhm
         wj0kLM8eVT6suw3L6ym5lVingxwDAtBR8HvALX6VyK6nRj39TH3kHTzyNLnl8p2nLaOg
         OmPUMPPanlPADCry2LArO7sg/b+ZSUGxnT6k8TdxciNCeahey4kcBgeHS7YZxUbzXeyL
         0VAGtrgIAbcNVv7D9XpnWdhYHaZ4S3mxuLKBMA1TsO9OvtHNi81M1DgrHyLOR8nTRk9D
         xwGpBQj14je0l3qoiKKIhVd9QSwwbRU9FNxm3xhxd+ogAc9iLZOYFx0/Xp8E0H14hvn/
         DQMw==
X-Forwarded-Encrypted: i=1; AHgh+RoohJxChqf17mqjB4JrjY0/f3M3u16jYJFuYcnFqV4VeuYOLfkaHvGcAWJrtoXByWLc10WTqpwNaMXRzWUd@vger.kernel.org
X-Gm-Message-State: AOJu0YzptjSM6Z/Cr+mg26OUfJYGH5275yxlzcvr5Ntj/KI3NucmRbN8
	H7UHzjgyTrB5WPZG4AwLcVOLMGuazKS5vGAdHXCNWyO70wo0oQocL2RCfnb64Srfo/UCnqk0WdO
	TJhyZtNkUj2Z5mh+zuKBetsvwg8lUUqOCA23UqEAQgYrLv9ZLcCeTRSgowxoYHpz6l4iG
X-Gm-Gg: AfdE7clA7O2QBD+1dGU9AQMLjxlxXOetqpEEpoW90INBJzE5buDwkTP/HHfEIa6PrwN
	SwlGf+qFKlghUF9NzgjIcShXTWejEWCmfpH3VYcNU8Pv3rGw99/7SuPVpfp3Oq/6A0c39i8xdr7
	muN2YSXV/cpd2mo1IJYMJSffcAl2Q2YyeVKMJvRTHMYowaksvG+O0X67idVFNDOeFzcylHqeHf2
	aOtU9mBgVuTihoEXFZhaOTsHe/aNJ48v9ra1aFICk4fH5jwYEgL/RWbQayc7wJSbojiuX9eLM4Z
	MTXFhQWH8YdyxVsvawSKNYBk+UcZUXjKuMY7Z/uYB7/huNeSFr+10z+ey7L6sAw/fqtXI9USmot
	Hn6WK4SHb1V+WkyQFjaENwoMwZYGx7DMoJyw=
X-Received: by 2002:a05:6102:2910:b0:71f:856f:536f with SMTP id ada2fe7eead31-73431288931mr258312137.0.1782389490451;
        Thu, 25 Jun 2026 05:11:30 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:71f:856f:536f with SMTP id ada2fe7eead31-73431288931mr258306137.0.1782389490037;
        Thu, 25 Jun 2026 05:11:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec482csm168053166b.59.2026.06.25.05.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:11:29 -0700 (PDT)
Message-ID: <357ea0a8-7a88-41a1-a75c-1ffece98806f@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W-VcEdjepDXb2XQiROIAwJ7UD_rjDLi6
X-Proofpoint-ORIG-GUID: W-VcEdjepDXb2XQiROIAwJ7UD_rjDLi6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX3UtLSSPJW/Ps
 wp6nkX4dvc+JbDRH860Tzr3zxjOU2vwO4wPXtVHQpvPy7ewKH3fqGhMbZ4dSafO7e93A0iTVudY
 JIdFVes2JH/V9g9pUi9lxfTeNyICErI=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d1af3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NLju79vw_jn_z0NdLzsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX6EwwHqdi+9xn
 TfsM7bAvzOVXU3rVQKERDf4yv8cuRd0+ywQUfpoujaQjk/qG6YMYavp7hAZ0LaM0elAsYLx5KqS
 wsXHs30SGn3imK1weUpMo0W3UaivPSQSOsUvOzrPlPQbjUvo+qKf5PjKkJOH0uGD+jxCjwZa671
 rGcMFSP13Tzo3L+QB5JRdSTTAnoa5kl9+Vm6FyEDoTtIkjih5Wobao0JK79zJrWSpNLhir+5lqk
 Lys4Jb+DK50UDETgrmwFaBFVesxJy+6FEHmxOCHVjsIkF14pkg6bTy09fFcyhapKR5xxBecP/hh
 Mrxh6iGEEYPtAm+FRGSB5UmcoQ53Sn8ppMCVlqueSR5+It90kxbygpcUfOQfiX5q/kqdQkQIyZC
 gKrMT9Vhf31oygP7aX4dWgVM+5psK460+1/BuxZelcLE67OAvq5m6iC6O5a04/uSogMS+wcreJh
 Ae8zY9KsvC9nF99SjBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114525-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA9A36C5732

On 6/23/26 1:56 PM, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs, which causes clock reparenting issues during probe (init) and
> warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> Fixes: 0e66f10942b5 ("clk: qcom: dispcc-eliza: Add Eliza display clock controller support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

