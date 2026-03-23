Return-Path: <linux-arm-msm+bounces-99304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBzxMY5lwWlESwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:08:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB32F79D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9C030FBEAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3393AD525;
	Mon, 23 Mar 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lb8LHQlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D33ACF03
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276202; cv=none; b=RXoR0n/oBW7YExNaCJJ8mAwRI/2phOK5VcXp1vTby1OCTXKpSfTAlvbrEFxOhP8AoOwLvPZBFjauEAjYOyZsjSgawvlLQEpEi/e8t0b8hGf4Iv99G3AX+qm+6zdbnEH9NPGa46BpszliVxKKOwxART6Yo224PDNiZaF6/llbXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276202; c=relaxed/simple;
	bh=L9ELsUTCwMNy2+pfr3ESCvpylSNoN2JspHLhkSAs054=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk/vbmXWp1kMJdpxd4zN9JA6k5hLDnrh15l+F2tCWHV1CwMClVqurGEqhAef4OdNmchHWaUUUMzWvUM9lIPPNMYdm8AvDG+gkh6rybsGdxRD6TolL3SgvbbZ4nfJAYZ4O9P98qbt9wbkcfwKb2mJM/zg1OEPFaCUihPOrJqEbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lb8LHQlb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so27209565e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276199; x=1774880999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWptjvE5w87hMNihQLfqZsM0Pn6ChnKPjJO5RmlXBPI=;
        b=Lb8LHQlbKCo8jnCkYk0SS4Sk8py8AGYKtQSSS8x/8BzBxO+yznjbRN4EE+Oqp597r/
         fPdxnn3QwpnDC+626DI0u33YaFEe3IL9ZsE81A2HnNGjXUKZ764Q+YtDMg4YRCwnchm1
         5I9e6+S0g6WHKTw8tsfPSYm94spwnD+sNmp+dCs1Do81gZmJ7rd2sNOAV8WH6/jxd6Vo
         0ALUlJxM2V0VNCYnXsdg46wcmVIQE2Dc3/GrDNjmbEMuL/qeiMkxIPHR6CiIcKfIgOiz
         VsDIVaQEGPoS80YsgNWPhRnttJY0EInETY5bbl0+CyfKOdH3MdVEbMYP4xalRS0ZPFKi
         6nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276199; x=1774880999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWptjvE5w87hMNihQLfqZsM0Pn6ChnKPjJO5RmlXBPI=;
        b=Qf1r86dTFbJOI2i7INz1+7/bZxTYD8GRMITjRlGVbyv+Z4XntxwdzuRq/9lqAsPMug
         aSYWUbXduN8cVKaiwNV/ot5RvABQvdQE8p+FUyv0rCaPkjZsp3t1I530y3+TxbJ/TfOX
         7h8zXSde/BWMMpR7EuLZISYtniWCEP745sVBSOltoRR2/4/32vlIFjCzL0BcR44M0uYG
         j+4cE26e7pE4rt80ngf8h+qaBD1fPkCBUNAD74pfQa31Vo1cHgNSt0z/FRFPRoxwKcpM
         6E7cVN8FTpLf90ezZHm6CFY6si1z5f2vt1remx9FzugmMfDdzbFz+8eNDGMHY/9Xfxms
         v6iw==
X-Forwarded-Encrypted: i=1; AJvYcCV6PuOf9i7xupaIzC6VluzRVxscJvtwoLVbebQBTxBhkcFJi2VQRuLD4XDViV4dZkchdAkU6WeJc374TIqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv7cevzXf0Rvd2yfxY2UlpDM8ssfz7xG+i0G1f9Euv+esnw/EK
	5cFj4e1GdZm3AU8uwFsS9pErL0/9jbzgS4b/Od2lPMcMGaw5HjH4w4HgQDKSm01eVWQ=
X-Gm-Gg: ATEYQzynBMlAEojZP9P7WVjcFHeNiX2elm68W2ESicJiyht9CmbLijxBNIrS1LzFzJ/
	d4X+HtOjTUrFkCI0bdo8YYQzfAzqDFHyvgEPiyboEMDAPAyZySxPBFsLOLKymJMerS+fyWKXw3r
	Yoz1ic7IjUwU/rJlZvUfO8k/Vnzo/QgQui9SZR6OMG3hDJeZ67JwwC5X2BxlefAwztmiL8yvO2b
	nLe55yhNkRpnVrsnjle3Qzg/GHzFFfBI5sresDm91vQCYk6c6IrdF/jOcYufYSx5VqLLzif0H52
	QfIMqKtdbb7pwDVHUag66nvwse0gSONWlajKEOwCe0jizo/4BCRlexkEP4lEqnqZl+eNYhsX6fB
	LyuHLseMqURb7l7v2mTPxDQ1EBK0uOgG2xFG3A/jHdkW35hgS8Ca5855pFAez4M5+j65HDxf7mL
	yjfIj92UyC9f+Jr1Ioe8QOgxGBfspJAzhSP4ZY
X-Received: by 2002:a05:600c:698e:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-486fedd80c9mr156967985e9.13.1774276198953;
        Mon, 23 Mar 2026 07:29:58 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.102.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe967c64sm280452265e9.2.2026.03.23.07.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:29:58 -0700 (PDT)
Message-ID: <8acb3888-0ef8-440a-a680-14478bba3ed1@linaro.org>
Date: Mon, 23 Mar 2026 14:29:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <3VqSGUgMUKaCja5WYOrOP8nJ_mw_eDPdItA8d1CvqUg4ASPS5IUc_aT2E-XIo0YmnYo8QltXVw8_6NDxtdqGGw==@protonmail.internalid>
 <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
 <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
 <4afceefe-8053-4c10-8595-39dab9379aab@oss.qualcomm.com>
 <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99304-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EDB32F79D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 14:22, Konrad Dybcio wrote:
>> Sure, FYI: Dmitry, Konrad.
> I'll admit I haven't yet read up on all of the background discussions that you
> guys had on LKML, but*if* we're going to put the PHY under camss, the GDSC and
> CPAS_AHB/CAMNOC_AXI_RT references should be unnecessary, given they're not
> related strictly to this PHY itself, rather it sitting in a specific corner of
> the subsystem that needs them to be active (see related:
> https://lore.kernel.org/linux-arm-msm/cb2430f2-8601-4c72- 
> af6b-10f1ff16c188@oss.qualcomm.com/
> )

That's fair comment with the PHYs inside of the CAMSS block. Obviously 
if its outside of the block we need the full gamut of clocks defined.

..

Yeah I think I'm happy enough to drop these predicated on sub-nodes.

> For the other names, I*think* we won't need to rely on them (i.e. only operate
> the resources through PHY APIs from the V4L2 driver) and can come up with new
> ones. And hence I think we can turn "csiphy" to "core" and "csiphy_timer" to
> "timer" (because we really don't need to repeat the csiphy_ prefix)

Works for me.

---
bod

