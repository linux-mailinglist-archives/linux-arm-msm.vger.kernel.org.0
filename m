Return-Path: <linux-arm-msm+bounces-116233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5tL6G0Z4R2r6YgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:52:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 939507004A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:52:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WZcxPhHO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116233-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116233-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39BBE30234C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28F53403EB;
	Fri,  3 Jul 2026 08:33:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2016A330B01
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:33:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067607; cv=none; b=kUTrlRAZwrwT+hnlEIliR1/oWI2+Hcsq7yNJmQodCqjQHwYPBgB+4i7F5CkwwJX0cL2tGC3QJSQqww+xJBxLBrohqFtDTAanhs7ALZhNbXSHywCVm/4lfpTf+9DTJnbBv93vN0NWqrMeottNXxmQ3GzawdUDZkwD/tikxAVRIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067607; c=relaxed/simple;
	bh=CPeHWVKQaBYEElBX0g0QRy6Vj/Qst736Zlo1/X2BtdQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jR0k9aINcP+53FX5z9/mne3y69r6LO44G0uEqQwONKABWt7hSnzM2y0QFQ8jU8gl/GRFpyKafRVpC15/DbS2FSbaXXru+PRF1TChdu13pm9eUfEhcW9DyhNrv25mf2EiTdq1fnD2+Yh6maPUEEMK6cbPpVahgwiTPt6XsjG7uh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZcxPhHO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEACD1F00A3A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783067605;
	bh=BuHOPCYtm8jRcWC4IRKKtDvQPRYY12Dv6Etighlt/fc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WZcxPhHOLCuZj4W4qqqDbVwqS4/yKChxlA3wlcPFrdKd1d2ZOLS2219syDplN66Kz
	 z+PeghNxn2HFujrWkYCV+TnlRo++lrCUTcKEM1XnhR9b6jMyM1kjY5deqPgcbNg9Tz
	 5GAseF5x644KDEjtYVvRCiiOEsRN3HVOOtd1FNNvnrJ6GTN+m7XnqX3rhNboa6xos9
	 8ckcdHazDS7Ec/NSIIQP7GjhKa5ZewX5W3Qp1//Uc0SgKuPN8mCac87MN8XfQdih7I
	 PzamV2zDikXieecRdweWO7dVBGw9TYDvsGSnIUb9SgZUEYdv2I+djd52v/9FDmESrf
	 X+VionvTbc9Tg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b1f588471so2934341fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrV7MU7Gl4vdBURiMip8OpfiTu5dOWCgUT6R10lt9GMffX4zmvgI/KeAyWJiwomIuWSKOTMYwVlzkiG16am@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2aeiexzqgo1VdEG1HAu42Tojpe4Qe419uXxNhCwMgWtYi1AL
	HXIy+MZT7Infxzzpcj9Ce20GDIiFZ6JN77CfBh+7S9WqmUf1rCohi/sJCjFxQJU+6eDDdsSTioJ
	aDIVFCHjq8oYOKCbzCPWEOxjNWPpRoi5pc5P+3f0P8w==
X-Received: by 2002:a2e:a907:0:b0:39b:100e:a582 with SMTP id
 38308e7fff4ca-39b34102a63mr18832421fa.38.1783067604615; Fri, 03 Jul 2026
 01:33:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:33:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:33:23 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-6-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com> <20260703-ipq5018-bluetooth-v3-6-62da72818ab3@outlook.com>
Date: Fri, 3 Jul 2026 03:33:23 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mej5MtZuZATjKNtzHB0YYRJR5EBpcqzZUqs5=8jQELA8w@mail.gmail.com>
X-Gm-Features: AVVi8Cfz8fxokF08uKqFvZaKM_8PpWqL9iATWbe1q-OjIVsquKGm6K1w9Q2wkBc
Message-ID: <CAMRc=Mej5MtZuZATjKNtzHB0YYRJR5EBpcqzZUqs5=8jQELA8w@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: george.moussalem@outlook.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116233-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:devnull+george.moussalem.outlook.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email,qualcomm.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,george.moussalem.outlook.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 939507004A8

On Fri, 3 Jul 2026 07:01:54 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b9d7c8276ac..60f7251d1a16 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22289,6 +22289,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>  F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>
> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
> +M:	George Moussalem <george.moussalem@outlook.com>
> +L:	linux-bluetooth@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
> +F:	drivers/bluetooth/btqcomipc.c
> +
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>  M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>  M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> --
> 2.53.0
>
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

