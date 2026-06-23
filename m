Return-Path: <linux-arm-msm+bounces-114093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1WylL8sqOmrD3AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:42:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7F6B49C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:42:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=HHjJt0Vw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7052C300E177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9219F3921F1;
	Tue, 23 Jun 2026 06:41:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13709331EAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:41:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196873; cv=none; b=Bp1hi9OTLCm30glSQDW1c/BhLQivYtBdsl7WzHIntjzHHMI5Lityo4RQ0hui3Yof4iRk+1R/eX0qy1yQo67D9+7STWtLci6DLX/8Ol74WMCyyzHqRNqCnHnc0u+lQFxDRb7+TTI50wRqhF6nQXu6HOfDGMnm6m4VnRg4YVrqank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196873; c=relaxed/simple;
	bh=Kl6fDb8nMLegJK1M2zOllTyeaPaukBF3EDgG5U3Qj0A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=C2XBxupuG4sL6/di0lAqjcek4vQpCHagsP9fszlFTPgwhjp/0v/pzV1bIFaCiK58R1c86fDoeI91fFb5APS7iZZJ/mg8jSy2ZicvJSTXRjJV9XxjE4FNeqM2LiyEhRvYebWXXWX61NM/KUE7DVz2U90UUEfSUDbdi2wfa/WYPMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HHjJt0Vw; arc=none smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6976b0b2c79so3406499a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782196869; x=1782801669; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zD8Tb/E+kGWpnoDfwo14I4a+o1/b1jYnhYlX9w1IRw=;
        b=HHjJt0VwHvElmLshy+LSpvb7s/OSqn7bbI/VVZ5Ybk8TWRVCfI1l/uMgUZ++ftNPsX
         dNds1TUvD+C+srvZEZTAb3cx6LDpag4n0/Fmp7X1FhPFAETTCuwtUE/UXABhNKwbU4vd
         m1h9c5CBcFvbKG1Qf/jXzwSpO3IXMdDCHVPyJvfLSFpEBN8bBwuNVMWQduDut5J8s7yR
         IoGeg8zg/HcyFiH4cKpjIGgyI36JoXiL7PHX/rSQ419FYO5dnw22XYWbFMeUhfSL0gZu
         f+Ha7LVgB0/dgirY3fedSxhJHL0l2pa3yHcQCEDgQFFb+9prtErjCEZM4k7b2UkMS7+a
         sNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782196869; x=1782801669;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zD8Tb/E+kGWpnoDfwo14I4a+o1/b1jYnhYlX9w1IRw=;
        b=n6pHbTTz56vBnx1QXmH2kPQHYuEDbfHk9DPjH/RwVvez9g8H3+t3ByCBkDM7LKzAcV
         SZ1+RXYVSFLvOfry77iCtmqV0rasgtbuvZiBy357xAohcYJdXgJF23b5JkR7wkkLjyXK
         D9B3A2IhCRh+P+F5r4QgbiF/i7MtvV2lFYrxT9cyAnPVs6+Y9Ts3mfiWenLxmfs6qDq4
         BL+scV8jFaAKq2lx1Dpv04MMf5RdJBbmKfo6pvyCFOR2FKjOLIM8fXGl7nQ2v3r6AkIF
         EqxB7PKL7CRXBsG9eUQA4RliFTidGTHKKkOdyDmyikG9SnS5ia9DVLjefQw6EsPdErEX
         m2Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+6D3aZSwdoU29uLl4di7l3sKdAnziNhqFXKKsAiDW9XB4NN/4Kl2tDSxDwgEJBwRIP2zVzowaBH6IeWto5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm67djFvsOGUtbqy6j9DSiKP/eY2EK0bRQwJ4JmoETd6YNLW4N
	91Qpfu2j4JvB5hb3Q5SGJNUhHMsbXhq4XKIg6N+y9hdByFC9ycQFI0RnmusqZzYaXIedDBEtE4Q
	MT8ZkJns=
X-Gm-Gg: AfdE7cnMcE7Sp7NuIz57yDu3tCxlkBeKYZAFl07mUK39SC0Hv5Z95fKl/wr6sQWes4M
	w42x3MzwfW5bOdYWsGOCH3qhmHyj+td3bvalCKOljO5HQEJXMv5pkJWcBlvqsHOT593K8OjxtP0
	jS8Cc5C6KG/6DZxvUsxzHO4TJyHy1Yal5n4UmpqK8jhnll5zQuBaynwOGnJy4IUedoW4pKXJ2XP
	2YJZclig5ba7e1S8PVXAEMIzcHBVyTmp8MI2BZlQb9GzE9yiayOoQRk6+gnNkxWhP+grFC0ppJO
	tsdMX62AMUX9NoJeeq1aLayyTQzITPTZ+KgNmAnj9TK/GF7sMZZOmErNcrrdvbSdwwKBJhGBxp0
	ZWgdKYbVRbnt7v7vI0BwxofS5p/KJIZpvPbzoUa8rvZo7dfrf7RgT7Q5B4LLoegLJSXUss/DHaz
	xjo9KybBvg7GC9ufasWGgqWIqics6+LA+JUrrtcwW7I1tB7ULcY1K8dbH/OTmrmybdiDNZ449Yf
	VZ/hzNECHSm+iqGUxLhDHXCJw==
X-Received: by 2002:a17:907:25cd:b0:c00:de33:a74f with SMTP id a640c23a62f3a-c107efc1f86mr63377966b.25.1782196869474;
        Mon, 22 Jun 2026 23:41:09 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac9406sm462110966b.38.2026.06.22.23.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 08:41:08 +0200
Message-Id: <DJG82APM4N9N.82THXPQ5MIE5@fairphone.com>
Cc: <mchehab@kernel.org>, <bod@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder
 binding
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>,
 <linux-media@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114093-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,qualcomm.com:email,fairphone.com:dkim,fairphone.com:mid,fairphone.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33D7F6B49C4

Hi Atanas,

On Fri Jun 12, 2026 at 9:44 PM CEST, Atanas Filipov wrote:
> Add device-tree binding for the standalone Qualcomm JPEG encoder
> hardware block (separate from CAMSS media pipelines).
>
> Document required resources briefly and scope initial support to
> currently used compatibles in this series, including SM8250,
> QCM6490, and SM8550 class platforms.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-enc=
oder.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.ya=
ml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..83f19719a869
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description: |
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +
> +  The JPEG hardware IP version 4.2.0 is shared across SM8250, QCM6490, S=
M8550
> +  and related derivatives.  Platforms based on the SM8550 register layou=
t and
> +  interrupt wiring can reuse the qcom,sm8550-jenc fallback compatible, p=
rovided
> +  the correct register base address and IOMMU stream IDs are supplied in=
 the
> +  DTS node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: qcom,sm8250-jenc
> +      - items:
> +          - enum:
> +              - qcom,qcm6490-jenc

Any reason why here and in other places you specifically reference
qcm6490 instead of sc7280 which is what essentially any other compatible
and files for Kodiak is named after? It makes it sound like this is not
applicable to SC7280/SM7325 and *specific* to QCM6490 inside the Kodiak
family.

I supposed qcom,kodiak-jenc could also work but not sure we should
change up the naming scheme halfway.

Regards
Luca

