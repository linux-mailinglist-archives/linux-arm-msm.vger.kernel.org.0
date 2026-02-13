Return-Path: <linux-arm-msm+bounces-92793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO2CLE0xj2mhLwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:12:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9539136FB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA4F430028FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1993612E0;
	Fri, 13 Feb 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cn7gYATX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C5735FF61
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991736; cv=none; b=qaQ7HtLhJ9CH7LQSoD8u1RDvoCYMsb39vR+Guihe6Cie/iVI4+Mb4weCnnTK5XG3vxJ/z4tZVgbhU2wQuR5xY3RzW4HhBdTMJ/FG0bOykO9FWFhpJ/ygJLlIZ8Tux0KTyngw6WnbTyezOWVRCioCA6zg6so6T7cjhj3o6c7gO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991736; c=relaxed/simple;
	bh=kSxpGwm9UDimkXPadlMLx9J4LPHuy90pfvo/9O4YcSg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=O3b0h7XpLLfUpttmbpDKCKZmLo9yTIZRsmzIzGfvnHbR09hrwRV8xSTeOZGqpACqfyEKg6wgxaPC4qw2kD+WmtjynPGil8CkpEeZ2JLNycymNkSw4Rimr+Lbbuf8u7Kcgytyq9BmZ36JWIwRN0rAeemqSds+ArNdJItwWUMUPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cn7gYATX; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so74842366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770991734; x=1771596534; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDWCaCmjcMdTeU70IpQ6l5t9XJKDcXByz0w6wvm7lMw=;
        b=cn7gYATXW2pTKK268nnPC96kyjE6vk5jUTQgnqIFRP5kqqObCjRljl4R95gTd96L6M
         DPnWW4erxOVa2X7ux+83MCOsBwa9Cj9NnNVtUhwZQ7DwTV31Cd/5+/N3NIN7i9zduFrp
         Qf+aU2Nql3i9pxJVZtggqel1lfwaTkPMcTA1LUiiQ+X83z8V7BIVnB8ZYbCA1OmZAQPt
         HWDslNDDUC8StTtd2ISTAIHcqNokBLZ+F7yqQE+wk062LMISnYQT+jTokXXdQfnWTmgS
         sV5womhihB1B0+Zk7Ydflgt+9DeFMPXE/E1vIOoOnKNnaZzFS55Utd6Zvf58SfeUbk6O
         PffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991734; x=1771596534;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDWCaCmjcMdTeU70IpQ6l5t9XJKDcXByz0w6wvm7lMw=;
        b=EX5Bx2J04Y1rtp34gmHu0M3blvdLZ/VJznOJBUBStTROSuOezQp0pfvtcesOZRTVsd
         +Vz0qMrO/b4G//0/FGln2hCqTTJetfFNwfKGmIIdrswdM9qcMIa2nRgNwLQox+EVI83y
         ewgmSw2YS7Aek9/uaFi3PZ7IN/8tzb5P9iF0HSLcG3cYuuBGX22VYw+wHR53b6d6LEy3
         U03df+/ayh521vCkDbTSLktlIb4/Q1NMXHTwL+5ZTBxwYRc10Ddsp04QTCRgVg7xjTDD
         5lUwxCvsTOvuwQLsbMNKQPAtbWFbg0xAhnH4usb7D4jD+zN5/Q1qm/sh0UNqI43CvnZg
         FuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpLPWZR7TIPhs6rPlrTkvoSwMejvvBXkZ3zm9002pUdBvwTnu7HZ0MERMr7nnj8cc+GRWo7+w2qQIjRnpF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nTFfyF0RbRd62a1gbXPo8LaAg9PML3r5TCarbz28cLgtznTh
	vDGy034KPedxKo+iu+g/T8CQ9hzCasJyJYr8wlqQTlasU/AEsv7zRzEAoida/B8BftU=
X-Gm-Gg: AZuq6aLxDpPaKgWjmAJ0+zCk8bS55Uc2xVkKd6z0eIYVErPYalW99hqWDz3gCk5rlcX
	5C8eLa6QkhF1KChllhk0oHitEkIzoULsy4tVWbWTudZpz+Cj6f/ZDCuQO4HT92t+C99ZCN1DTtY
	xyYhiW6/9p5wcu3iP+NmCtgTg3hPd2mYNLCnxmDivfp+vUBFW14tGSMuXdHaaRh+CyC/og1Z+cU
	+szbnPFNkZLsjFI6F96djnXquZgUW4OFPeoub1guOba92TgZIqx1UBT90yAeLIFZPKs0OJ2hHL6
	xqDYXLrxgSBlE5z0Fw38E6WlBKm3R93d9fMhLKFLQe93AQM+h5yizNywpZCIrHIWpKD5mZG3H0A
	nCsN6HxE4/GwmRRt+8s1oKdCu9N3myWN7Hc2w/B7KiR4XgZ5s7DMFtlZzQPoCbvsJZ91RNPxVrC
	oIFCD2r+foIrL3Dvz1SjyLZRCjKTu8lACFwTN1LYB4pj5exdAyKWcwuQB4/jiLkFUJXt4Z
X-Received: by 2002:a17:907:961a:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b8fb46764admr98204666b.61.1770991733815;
        Fri, 13 Feb 2026 06:08:53 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9cd6d4sm263856066b.23.2026.02.13.06.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:08:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:08:51 +0100
Message-Id: <DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <linux-phy@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings:
 Document the Milos UFS Controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Avri Altman" <avri.altman@wdc.com>,
 "Bart Van Assche" <bvanassche@acm.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
In-Reply-To: <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92793-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: D9539136FB7
X-Rspamd-Action: no action

Hi Martin,

On Mon Jan 12, 2026 at 2:53 PM CET, Luca Weiss wrote:
> Document the UFS Controller on the Milos SoC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

I've added you to this email now since you seem to pick up most patches
for these files. Could you take this one please to unblock Milos UFS
dts?

And maybe you could add yourself to MAINTAINERS so b4 picks up your
email for patches to these files?

Regards
Luca

> ---
>  Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml=
 b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> index d94ef4e6b85a..c85f126e52a0 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> @@ -15,6 +15,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - qcom,milos-ufshc
>            - qcom,msm8998-ufshc
>            - qcom,qcs8300-ufshc
>            - qcom,sa8775p-ufshc
> @@ -33,6 +34,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,milos-ufshc
>            - qcom,msm8998-ufshc
>            - qcom,qcs8300-ufshc
>            - qcom,sa8775p-ufshc


