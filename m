Return-Path: <linux-arm-msm+bounces-117008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OBfKKUsITGpYfAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:55:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91C7152CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=W8U2QCUH;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AFBE3577AA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49D03BED7D;
	Mon,  6 Jul 2026 18:36:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708D3BED78
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:36:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362993; cv=pass; b=TRTAy4fLSJ5KSNbB19XBplfOvq3x08wyZ/1kK1zFqyjSwCOHwIRNuhYUhYQbVCfzrMoKAOuFtzN5pyUeA5roMQAKPOaejxZzo+JQmxJ0Lerd3gZhH5iXxSwnlGqp6UmpAlgPwLiZ5RyszG87pszbpPlKk8UIyX7sIbt63KNgO6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362993; c=relaxed/simple;
	bh=PQ/1xy6a3puINBaYqT2e7b7BbcSZZGAO5m3b6c5J4R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgCEFR0WMwTUO2UhcTBnMPbjUnjYvPpGryz8Ek5moYoH6XQpb2dde0Rm0UotycpffYuD9HhBwUXqg7EWNNwEfMo/zFeeZ8YmzO+jGpWEP2v9MnFlYyrSo/P4J9IrQSonNWvFMbZRCSioDkdeXrqspIZe+wNfiwGWxmVvvqQZc8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8U2QCUH; arc=pass smtp.client-ip=74.125.224.48
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664d22d7337so176278d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783362991; cv=none;
        d=google.com; s=arc-20260327;
        b=F9m3e45C7yC+EQiDoni0H3oVTXanq97aq0GzWKaSkp/GPqQ8A1M5rPK+Ecf4AzkD03
         wWl4hzFgeKudzn7mRbVHWQmBWbxOb1cLVFdzagzNdR7YCbIxNYr54vKr6lpche82KHmc
         JEE/o/o671ZaYtxXkfWAyDlVOP3xLbArpCAGRz+R5rHo5HM0aWOOTjs9Mo7kROSsf75w
         bTB7QmW5NDQDAZ8E8wCTRInyUabNz9Zaj41xlIWN24TP4pOmYj1RSCuxpA1TR7wNiCtT
         yiSs9fkr18PW7KG9cNiWDFnjVyBeQtMq36ApBjsSfNroXpwuQgThUaRqa7or/L6FP91g
         ZWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZqkJjaKpXhp4TDNIgLLDiBbOKbRzti84NpGMNpZWKU=;
        fh=rfIRhJpHg6d75bDyoKrSVDHncABwb26e1xjCjQD8g5A=;
        b=h+j1WS4jlOZ4b2zPTt4Yiy3zttk75LQaKZfPGWXoiHDjPB8XZ72okj95AnoHAlnE9S
         YsLt4uvgS72t91fDx0gX+s8VgxNFzQ9RqZnz2cqk3OwKkkGzM1UAkavMpHrg9b+K7aEN
         RLMv7dQ7SvqvlPubbEBeS9hMdSSUA611/JPoSx8s0e7hZ2oZAWEQ/eGui8/Bwxf3Pk8y
         jLl+9Wd6O1eC8bRPUDVsH+JnJMpfvAbUknb/KvfT9wJQK3567tu07J4KF0Sbux6UsJdf
         n+1M/eULqfYmiKPgfOLSa+SRPw6ahy5sFC8hJXbmEyHYpRLtoNyWidKKloGyY10vUSJN
         JY5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783362991; x=1783967791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZqkJjaKpXhp4TDNIgLLDiBbOKbRzti84NpGMNpZWKU=;
        b=W8U2QCUHxDpz1sPQZ7XOrkaH/Tu3fq65L5KpzU5sPh1YdO8OUZ+zQk3quIMY5Pi6Yu
         SlIg56KE9SbP9ufLGoV1XOlZXtLi1HPJmNUncReb2kRQ2x/4TjmysQW+WrUUoWqMU5Wq
         ydsNQBGF8y5p9XUQzqhyySyFn/3tOp271B2uX0R3Gi1dYXc9jOA+pUamLc1m8i+Fci9H
         Ff2sQkEQrSE2CcJ2Mm2wX6/4qD0TPk8Qxd3LCPYwV17WNRpVOc5m6GAHtRTmahYi723l
         NTjfTbiWE2Dc/QkRTIQsLI+IC52eEigtUdTOb3NxGTTkNigoCvdcTixJluUtoDfY1U8j
         X8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362991; x=1783967791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fZqkJjaKpXhp4TDNIgLLDiBbOKbRzti84NpGMNpZWKU=;
        b=cAHLu00F7XNROL0itH4Mfn+v3S+1m1gNp7mNagewvsYpEJw1B/HpRHpFbStfnUmAMQ
         Vj+sArpZl2SSvFm0wWdmiIiT/CvU/1UWMJHw4582IR1uJgoojGXTyqGjC2jeU+808bOB
         yoz0OacCoAJq0o2iioJDLP3a/e9Lv+Gzgv9ur8MmoZ+5j8xq3oT4Ca4Sg5dtE60P6U5Q
         9ZoyXFtt9v2b+oFoYXEwFqwhtzj6d5D+9FO3Agui87uY4fZv6mpKx62Vfwf0mLkva3Lu
         KbEyX31rqANE/lzGnS6b7yuTRsbd1Xa71KQslaz4GhytCyygKnWI52Ic4XY1YRHA/dUc
         6SFg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8zhNySwJAXpqRof2DkTI1U1/luNgJ2iN8XtR2RfY41v/bIzj2It4oikMUfsbn3Wtpy8pTfQYo3SVI7Hrs@vger.kernel.org
X-Gm-Message-State: AOJu0YygfJQEDWCLRf0CdFYWi05VSaJxEOW8PSAgvmivqPQOu8BpUgEb
	KJyu8q782CptWbhA/0o+rDEbynr5EYQVmz4evIV3lZscDNXQEz3JaHyHG+L7m7YQwberZpeNlh5
	7qMST/LIXT3yvfYQKAxRGLgM9G7hCbJc=
X-Gm-Gg: AfdE7ckDoeNAVzzd7bgvoxIx0YoUBBlSRFjnNYdF36Eb+902N5Ry6CAy9weGyKSJyrg
	V/3FRlbR0CkbpTkisqsTbFpYI3WGvMZoHvrXgbV1SSodk+mbHr6AKLlvp7uB2LSoV4aIf/bF7EK
	AF8kGRSUGHF7GBhumUUqQaIq0kIeEiKVFNQHVG24YNKSoH4kwQW+aC/bScEX3e97GaKBeZmy5yL
	yf3R5O7X4u1/47WP7IFbKOTxhrNSKdGlKvKGpamedT/8HigS1RZGD8SHKf51g6phJD33qe8BHnR
	hSVfxiab65YHwHntXNCy0JBFIbpgyTgEVWQa+jPAEhUFmApQkDUI8QxZ
X-Received: by 2002:a05:690e:11c1:b0:664:c5f8:e342 with SMTP id
 956f58d0204a3-66780d9d9bcmr1088563d50.3.1783362991520; Mon, 06 Jul 2026
 11:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com> <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 6 Jul 2026 14:36:19 -0400
X-Gm-Features: AVVi8CcGJO8Ch3pCjXKhOWgi95XsZ_kdRoHC9Z0sM3JRFuLLpn2tg0JlAJ13czI
Message-ID: <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: george.moussalem@outlook.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117008-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C91C7152CC

Hi George,

On Mon, Jul 6, 2026 at 1:27=E2=80=AFPM George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> wrote:
>
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b9d7c8276ac..60f7251d1a16 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22289,6 +22289,13 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulat=
or.yaml
>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
>
> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
> +M:     George Moussalem <george.moussalem@outlook.com>

Do you work for Qualcomm or have access to their specs?

> +L:     linux-bluetooth@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.y=
aml
> +F:     drivers/bluetooth/btqcomipc.c
> +
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>  M:     Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>  M:     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> --
> 2.53.0
>
>


--=20
Luiz Augusto von Dentz

