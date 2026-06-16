Return-Path: <linux-arm-msm+bounces-113433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g6dWEMdXMWophQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:03:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79069032E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:03:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GqHFBSfS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="e0/5u3/m";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113433-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113433-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A800302A4E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767A933439A;
	Tue, 16 Jun 2026 14:03:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A128640B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:03:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618626; cv=none; b=NEucBMDDK5BSqJ9fV2Cji03/vP0PzceBC1QXEy8GMD/id45nulslWQwDAU2twJ8AXEi2w7/+60Lbf2saz05Va/3Avqf2XTUhgB6/941gsqO7UCOVAoStpVgfF2Q2JYcbj8lm8eKqHy4AaekGjwnu3Nf+O06pjroLqIqIb0kLC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618626; c=relaxed/simple;
	bh=07lR9MD6EOL1AkEoRnSi+a4iCatPD8y0LurVYggkT9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFeMWehQiiUxtOntIrki36pjSxqMPwn2nE+S+iIzAnCrtNOw1xW6ttVl1s6WEQlCT6K1jJWa3aA4TFh2EFggEc2EJH0eWL52JmP0vwqz9otRBBTEcj4cgVs2s9UYMg/uQL28sfSXUOoz1u580BG9vZZAvjDHVF+nkOXGWw2SPP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqHFBSfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0/5u3/m; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GE0EMF3364916
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILLa29a1him3F6rIENk8jXqD7HDozP0gg2rbGt8zmMA=; b=GqHFBSfSERhNjWwq
	zqzYOC7u/tCyvVkh4r/rD+u6WU0mHxFtihCHqa4sTzb7VHtAiDkGuzVep18fBJpT
	/u+zu9kzjxaYyKw0/Tpgqdqxuxzok48ht/wVlkOzQZvXz/8Sk/cUVPi5e4uBCfPd
	QqtHkk2CO8bdZhJvGoLGEg/JTI99W5V5wgucu4cfKYWz6a5JORl0MHUF7+3P3WWH
	OwnXb14GBAoM7UwjF6Nr3em9rLpv28gP593am8+L0Cefyk6p12NLClob7mMrwSj1
	470GIhFPznzSHM9H+HJJpZTPV/ghRl3t+v5lVHDF92HcKaVM2fDHD9bZHwXyCdVm
	NqfZzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kat59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:03:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c6928d72dso40368a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618624; x=1782223424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILLa29a1him3F6rIENk8jXqD7HDozP0gg2rbGt8zmMA=;
        b=e0/5u3/msxH8IS+djVqCxpyaTixQRLCnfHp+izYfxlHd+aR9XbNWtkMgXF5a+GLE3Y
         7An3nvxikZTpNF8ab1GabzY04QLUWzOReJooPNDITlx3N3pjuP8EUyDsPQukS+OFliHn
         rNK1AOS1QdzZCSEhCtN4mgfpmPr/+H2MLjTSyIBLwVjJQXfaDr0jvvksJuHMVs6t1/hg
         Z3OGWzCsTNR1fH+hwXFau4jEJ2u0V2QSYyklZoCk5vSrIWs2coLyqDJoA77sjeYL7il7
         2nevlvsn/3IUtYucT6tpXoGKKc80O1BIPtBLQTFhphUslQKimzrc64rJtwP6/T4iDlOc
         mWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618624; x=1782223424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILLa29a1him3F6rIENk8jXqD7HDozP0gg2rbGt8zmMA=;
        b=jXyjzRUbDOH6LUqkEN0vcy+zfYVyGGCp3Slsx3Be4VkC8TbKbRphOPEgNViMUklA20
         xrTuSL1zR6JZht5XOfPbTMI9DKpqn6ZWi36RzyAa+exIY43HpC+vdgcEIP1M6oatEAJ0
         l4tKcKyY9U4NiLdb5ACt2Glm4xVIFs1nOy+Rg2awj9tffL8NEdGEdwrLQ6jC2Nk6P4yX
         LmztVVcXS+oSdoSX2ubdA2W89myzIOH7hmRf5+iuR2F8oMB6vHoF0tng5Z/A7t7igHjp
         +J0KzklHhwMmxthSDqJ1UpyOeTKG3PBqO9IxBPVGUlukBJBZQXdPEfbxE23MHCKybhqS
         ce/Q==
X-Gm-Message-State: AOJu0YxSxc//4N+y5jwW1YvY2dLG5ZgsUVQJCoNENBY7SHX9ImNbyLSA
	9QXBRtOXiCfPRYrZaGScK7aRnZg1h6TBLIYyHmCrZcDTE3V5TVf1N/mCWxWdR0szWf7oDjtQX2X
	OMJKzbrkGxJ8cLPyj2IiM9y6t3pxb5i8FejBMamDb1M1EON9CBn/V60Fzah9FRU5G5CLX
X-Gm-Gg: Acq92OGwNaoYwa1trKEttL/rGHUJrXH7bZ6JMpkSZ5PyLEHfEDQIXwcYMWZwj+35hh8
	Dqht6TBK+kokPXbWIzhuoAUrmxcKFeql6RNEkusZrSxBXvnngDQLrNDVf3UJvaBCwEiiljtHK5+
	hY6gXcNLDRrMciJOHeDS0tSCGVX8URLMZRekjHSur+7pF5icocsKrX8Dc7xtRbNSKXgh+wfxZ+t
	OK+JneoJKWpWxgWTlP49tuk2sl+obvnfh8rnmx8Hl5dMtwFmCznev1GOcp9p3EDo4J0LdQMmW8K
	q+sZ6gYDN5BceHAqjHtKs6OSgRhkB0Y1a89NMN6r9bJZiHGfXTufEUb+NQ4a6MYA8sNFMM39APs
	4elLHbH9L/HxNHVJSN8DDh7FkDLVl/k1hEXXmynOhG0pYDw==
X-Received: by 2002:a17:90b:3807:b0:368:e6dc:eee2 with SMTP id 98e67ed59e1d1-37a036e9f9bmr10217631a91.3.1781618623401;
        Tue, 16 Jun 2026 07:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:368:e6dc:eee2 with SMTP id 98e67ed59e1d1-37a036e9f9bmr10217602a91.3.1781618622921;
        Tue, 16 Jun 2026 07:03:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4d1b856sm650766766b.20.2026.06.16.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:03:41 -0700 (PDT)
Message-ID: <5dffdbe0-cbb9-429e-ba15-0afdf6f20fba@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Add glymur-qmp-gen5x8-pcie-phy compatible
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
 <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MiBTYWx0ZWRfX88eC6rfouJEu
 Zi6t43LVlmco/GlRhWxe0anZh/mgR0sTA63y8uBNMgHv8hFsK26pLWMnHKhxAbeD4/O4cPNqdJS
 pzJS+xZhUkzjWVBq5ZFwAzzAuuEj3e49E3eL02h7uJ2b8wY88lq7bLOwucn4TOcEv4u9zdBjZ99
 llXXhpkQiJ5uAmZfOJIC0CtEPRZexb6HJZ+eEkzRRSjf3/nmeBQxxiaZ4JlNh82HFLFEnn6yI/7
 U3YgglayHU7ljmA1916xb2RFlKAWegnEE4tma9azqwQl/wCpAFOnQ0jfEweXhwRa+YEB51AWzAk
 jdO5ADvcHHbp0T5dAaWKJvKxrstT3nwmIw7bMgZ8dbnNg2W53bEjYrJlSqDzwGWKEjkmFc/U0q9
 0htxmLFUaZTHbMwqhHLOrcaBMf5VuEVqOTrIX5tNoa9/JJ1ce/1M9PUfxIzakUVoqRmFBJ5FnvQ
 Zb5O/bofwz1ZHDa2Iug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MiBTYWx0ZWRfX20i7jzm8YacI
 KvODc7Ai6o1WgrzJviGkU7yS6rHoOXWAQoWsGmExERlgShsZnICTwJ6HYGGF/JjJ7DHKG6xsJkj
 EThP0qLMbu4//41fYFVyD9C6VRZ5i9w=
X-Proofpoint-ORIG-GUID: cPyxUggc4dUlMqv5n_IhZwJEmDNbfhDd
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a3157c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pC5mqZ74STFJzzCMHh8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: cPyxUggc4dUlMqv5n_IhZwJEmDNbfhDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160142
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
	TAGGED_FROM(0.00)[bounces-113433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 1E79069032E

On 5/19/26 7:47 AM, Qiang Yu wrote:
> The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> PCIe3a/PCIe3b controllers. This block supports two link modes:
> 
> 1. x4+x4: two 4-lane PHY instances are exposed
> 2. x8: one 8-lane PHY instance is exposed
> 
> Add qcom,glymur-qmp-gen5x8-pcie-phy as a multi-mode PHY compatible and
> document the new link-mode property, which selects the active link mode
> via a TCSR syscon register.
> 
> Document the required clocks, resets, and power-domains for both PHY
> instances active in x8 mode. Use #phy-cells = <1> for this compatible,
> where the cell value is the PHY index within the active link mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> @@ -68,20 +69,29 @@ properties:
>        - const: ref
>        - enum: [rchng, refgen]
>        - const: pipe
> -      - const: pipediv2
> +      - enum: [pipediv2, phy_b_aux]

I'm surprised to learn 3A doesnm'doesn't have a PIPE_DIV2 clk.. it does have
a non-div2 one though.

Seems like it's specifically not the case on Hamoa and Makena, so perhaps
it's better for maintainability if the Glymur list was separate

Konrad

