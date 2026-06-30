Return-Path: <linux-arm-msm+bounces-115444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pjiDKv/GQ2o9hgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:39:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD36E4F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:39:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HmQxxYiS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C57313170F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE693033D6;
	Tue, 30 Jun 2026 13:32:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734672FDC28
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:32:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826335; cv=none; b=Up+fNgz1agCAu5s/f7tUCWyNOR/rFzWlwpqxgKY2po7R8r2L4ycRBXtd6XChARchuj7WfymOyeCoklIXWj7M2u9xQ+XSjQP31CpIMvA4jgEQGHgy03QV9wkbffL8Zh72oDETscdlwRHHYp5Tb+JPAy/cZRYn5EcpHG+0PaT0Vg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826335; c=relaxed/simple;
	bh=xpPMmV2m6fv5jfNde38a5Ol4Pz7X2NWCQ/YN94erzc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQDbRTZl8oJ0NwBBd87gnxGkpjIraH3DdhN9HRqFvHYLsDygcGv32Bna++H4cCjz+Y7vqZYUBiT2dKQdbWES5imOgKXvM84e11JI80E50udu+FDkV32oElgB+F+O41NvisJaqzWjh5VwUTtC8sjKfWFTZtXlYSSS4YR65NXP81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmQxxYiS; arc=none smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so203706e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782826332; x=1783431132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3k0gXgFqIFH85+EiNZcDCFD94DA0SXlTQoMWB+Asgdc=;
        b=HmQxxYiSA9I3I84UF5tJvaZ9OzFJm6BEfoirCpUNuEjqlaLZlM1EAhsysznRY/m4mf
         PzqVTHZN+fr1oRqSWmDSEh5pQdW4qDQ82nLCyRnaix7onaiQ4J4OWXs+KxEtp5X/9xyj
         556m5Ptmthq5QQDsTPXQjqdvSD5n0EMF7UUsXxA78kqiKR+s926E+adgmi65GBIrjkrH
         yGheD0Hrkp0Fi7RznYdSQi1l+GK/WYvjcjxMHm53jM5GtuFmtnnGWB5saWSxbjni+JCz
         OXax9syPSHhl+TpNV6ZsAPNwhTUY3rIl4OpbHkPLoGNrbvTH/8LZcHDs4eZWFvyBnIlJ
         FCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826332; x=1783431132;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k0gXgFqIFH85+EiNZcDCFD94DA0SXlTQoMWB+Asgdc=;
        b=eYAQtrbc9Pdkr5O84QZ+fksjRzCzATTjRuFZq3XiegGPuus/bgSz5Q67OwIxzrSgXi
         c80nNCTRodxyRPP7BPPu30/SQ4lqNVW/eLuyUkY1+TJMYkfkSGwxuPZwZmMzbu3W4NTc
         xS11oNJFA7FE47AZW1TyYFRjKtxEEUgUDaOW/l0nZ9w9hPwFS/fs/TpUIU2Flo6/f29i
         nZYzIvdckv082XDqgifvy8H6ylltOJeQXF7tdj+W8C52IeeNP3QGuUunGmflPUpBK8c3
         qbkNEKxBw2sw6QyrKUNjTekPcRX9W+W6ELEKJlkoTL9VXjT0HhAbilG3XASUv2RIOk9p
         MAeA==
X-Forwarded-Encrypted: i=1; AHgh+RqxGrXQWJSycelhDWnlzvf6sKf+zoP3ypQBfZBq6UuIM2OenAbctKvKH6SO0pzg/p7Xq2ipRa4M/OzkPKj8@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNjwZgBNI0LuLofIt1RMwwJyK4wcbkEq1sRAQWkGPKy7Y7696
	gMmYwsL0d0MVaAoYB4znBSX8lgIkNiqHQfAxt6VRn8wfEcGf8nAie8GE2bFkJ28AmKg=
X-Gm-Gg: AfdE7cmS5pNYJ8Yjswg4WzTJAeBEiMVcI3HveFXgJSLkEuCHbsy1MUQG8HmVZnmoYLH
	DUrxtTTp7HC+LJLa0yMMsaxZM3FXb9ML+okG1AVRdPFg/sJnQ7qf4/0paOhJ9Ze+orxTdAkRZW/
	ZrJC91fE8Rr+sc6v+4lUnYQXPgo7GhN/TndpbO5TNV+GA06vuGjcVypovaWqbdXb3MWAo+aKrA+
	e42r+LjT34+KZgPPPOxiA/ysjSRYgJ65laHrxF4iYZNd7U2tO8M9jZUfLkFqMnUW4rDosMX3ECY
	oJHoGLOSfBA7svif//wFtaITKTWTy4cWW0V9lWt6TQV/MsqnjpXAf++H8QkEceZTgTGRQF3xKR0
	LVqNmXx7apy/y0zErQqY9hC+GbDQB9FMqyJsHs1bAs6ir1TUtrDMWIZLVPxyYygaRmnmFUqjj5p
	eUNePx3qqnO/zQxeho2ryZS/XJlgslCkkPwy4oVfvE9rXZLdqt7T50qFdDhjd2etQg80COn5bt5
	WuBXw==
X-Received: by 2002:a05:6512:8396:b0:5ae:b9fd:a0b4 with SMTP id 2adb3069b0e04-5aebdbd8724mr438715e87.7.1782826331545;
        Tue, 30 Jun 2026 06:32:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe33ce5asm564051e87.21.2026.06.30.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:32:10 -0700 (PDT)
Message-ID: <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
Date: Tue, 30 Jun 2026 16:32:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
 <_zZ7OLAmvphzTdIURTW71m_LKDwA-DEQ-a40gIiLYSqgDrdOOEf1bElz53zTbmSaDoqc8PDFyQXa7bycFaSTXw==@protonmail.internalid>
 <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
 <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115444-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FAD36E4F02

On 6/30/26 16:19, Bryan O'Donoghue wrote:
> On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>>> +                interconnects =
>>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>>> +                interconnect-names = "cpu-cfg",
>>> +                                     "hf-mnoc",
>>> +                                     "sf-mnoc",
>>> +                                     "icp-mnoc";
>> Since the proper option for describing this hardware is to have it as
>> a child device tree node of CAMSS device tree node, which should serve
>> or be percepted as a bus, it makes no sense to repeat and moreover rename
>> bus/parent's resources, here is the list:
>>
>> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
>> * Titan GDSC power domain and all four interconnects.
>>
>> Only "jpeg" clock and iommus are left specific to the hardware description
>> of this IP under CAMSS, right? Thus, it should be reflected like this in
>> the dt description as well, and the complexity of shared resource management
>> has to be done in the driver, which might be tedious unfortunately, but
>> certainly doable.
> 
> JPEG should be able to vote for its individual NoC / CamNoC dependencies
> / requirements.

There is no individual interconnects, JPEG interconnects are equal to
bus/parent CAMSS ones.

> 
> Both GDSCs and interconnects should be described in the sub-node.

Why to do it in each child, if GDSCs and interconnects are CAMSS bus/domain
specific? There is no acceptable explanation so far.

> There's no functional linkage between CAMSS/IFE and JPEG - they are
> peers within the CAMSS power-island. Over time we will migrate to

I do not refer to any "functional linkage".

> individual nodes for IFE CSID and these too will appear inside of the
> CAMSS "bus" -> JPEG etc should describe their nocs and power-domains
> individually.
> 
> camss@X{
> 	camnoc@{}
> 	csid@{
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> 	jpeg@ {
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> 	ife@ {
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> };

It makes sense only if the lists of interconnects are different, this
is not the case.

-- 
Best wishes,
Vladimir

