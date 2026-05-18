Return-Path: <linux-arm-msm+bounces-108265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPoTCK5iC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AAB5728CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64CE1302D5C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74A93845CB;
	Mon, 18 May 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvAcSKxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13A32D7F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131020; cv=pass; b=pLj8Uaq5kJH5KeB/Zwcl76A92+BP4tp/yr0eKpzuRRqyDrmd+H/dIc8LpOOP9sL0oLtIUFAsmgk0DNijdzdRdeF/1rqNlgRpH57ExfN5rehhxM+favt8c/tQ/tr7//cu/IX2fK+DxEb7atfhLReZH2rKAV/4QWN60KU2ZK4hb2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131020; c=relaxed/simple;
	bh=6lRx6hpyqt4F3hBDzceE+x3MFdED8hV8eQAEeOPRr64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGuiVb3k4IRbl87Vic4GtTKOCWaLMOh19Z6BCRsAzdrxG4YXGrw0RwWIy4FI43qKDxyQy7iBcFRZjp40ODAR85CVDUkDHS7mJjxiOB3cXknP7mu9M+oWjyv+nZOc3e27hhL7v0T16xOeMdT13AHbKv7KKa5Xu2UmF3+HvmjER7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvAcSKxP; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de4e6c5a30so3563675a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779131018; cv=none;
        d=google.com; s=arc-20240605;
        b=KIVI1yQuxnzNpw4AATNO/RCON41WwkUAm7KVkYo4Xj+R57gQ0Nl+M6Fg5/h3Se66Sv
         HOLaj5pVilvipwBsn3nhbOt51LcoW2lG4Cmqz5b2D3UlO2pO1XzOHLBAt2NjJgSOhD3S
         doVwOA83bIxYBBq8yTukyYOrn5pvgcydcPm3/ZsC0+Giv5YjZ3j/ybosNxJcdOWxQHj1
         F2mndGWtATL/J1368hxUYOTB36J4liD0OSJexllB/+//3qBTYa0Wlt8mVZ5CXXSdUzB/
         mOO2Jr/7W3eJxoh5nHrXQyfSAjUMK9TkqZRXlZa2Z4t2utpRD9G0F00BetVmDMoDV+YL
         6pbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6FCOaAqP2h99q7NiTPMoDINqgRS6Ac8dNlQWAswj5dE=;
        fh=5b0GRkQcwar51WX/oBKrq4Vg8v31Z2lJ4e5aP/jnqKE=;
        b=faIZcvCLH2plLdUKZ8k2oMbZ5RDySLTwZxYRLREJpqPj1aeiGOfRkYhpoSevyOG6Bh
         BRmtFyAI6SvO/IKOZRWC9HXC1j0tkcdCIBs8JQ4GVQE7gerN67VFwvnMKg8YVIOe/jv+
         67jw2W5hm7KFQuobe/U/Yshnve9iiv2L3domi34B7cPm6ewmsGLDpaNzWdWfJihx+Js4
         ucmXnhyYW10/JSiZX2SoO3GYuxY7L1C8NUmz92EtgYdOu2TqIzMcd8NNQ8ovTKKH+ojd
         B3ihO2l1Z3ce2DeJ28kFuQfHbw3S6GJLM35JkCpR+7e7zsFQcVMp0ujJiYTaBrngMu4A
         +rag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131018; x=1779735818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FCOaAqP2h99q7NiTPMoDINqgRS6Ac8dNlQWAswj5dE=;
        b=AvAcSKxPVV2wx9wapkmasK3Dx9kIuldAc0avGq0v07VmunVpX15P/JkCeTBY++bEMr
         4YZ+cRvYXUab0bTOLF5kwjFOaUAnhYYJExyyQkL8mtsjnu8S/d/ZaZXtU7ZH0x5ECTnh
         AeqJRRgG2IZD3piZ1+xKvBtns8LEV3rSe0M6wo4KE3tvXjyuBk5hwWOz01hafOv+YLgp
         8z0FAFe3hLivuUtFj0YH3s5fuR59G0voeREJYSwvVOCkP/GkmFNPU4FMp5tlluTta3w9
         Gkigg+CRmDPajDVRreEF2lxVaxlq1zh7gsGZX/oyesP2cm2A2+VhzLxkahPg5SCoVwUv
         U5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131018; x=1779735818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FCOaAqP2h99q7NiTPMoDINqgRS6Ac8dNlQWAswj5dE=;
        b=fq4+t/gb/FNcr9jIcF4/hJEBPzqIEMJ9ChgEQETmquCOhhNvOBP5i7OcM7C9jdluRZ
         yRTiC4r4xaZBounDvZCxzGY8A28pI3jD5SFgooHvXlMi0Q3wKvd+oclzlFDpJsf9qXyl
         aznhd9MXouf+mo5qp1jc49PKdF6t+g6nAjJJrBV/ukcjSU71n1h93i+ReanIurRe+z5o
         Czc8jXGWQvtFTro+WOyNdLzWWMY0LfKmiYZuEROCGEk7fCI9dCz8Ls5tb6KVqFqhRCKA
         +5qYL7vUlq9/FYk9ho6ozQP25M+cPdJDbsJVBxjlIrBpBe5bTbRChDvHRVCkkhfSFZ4Q
         sa3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8mnxQyCJWKGIucT4G6y6l2/cHGkSCZgFWAQalC4Qyz+yn8CrvvsBpvCyF8ndTVWEPyuAvtHF0CW/snHu6L@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7ZvjHTD9cxE6LWXRctwZwVZjd+UBAwmgSBCxf5x6/ji+TY51
	v1S8vLAEv4t9oKbCqzfgEy+3b6sKiUtF7tYBT7yuYlHnqwhF0A4v50IsA/iF9K+Z77+tqmOkbg3
	8DF9GXJONsMO1JeDsn04g/DjQGNXpI132BJIS7n8=
X-Gm-Gg: Acq92OEWym4kwMwBbP7JUDrNStbfnVWmSi92hayzrQTRP/ej063dyxX6sjTaTiy18/J
	WP21zMrFsA+IIAkGtBiAkTSUyzBXciUH/Or8fPLmUEnSzUoaiRUDAudbEryPK0No3KjbhSLb2kU
	93veavi2HJuE0REF7d75iAF1eMRmepLeNwVpqnfqfVZGSRuVKpSPrxK5jKTioZv9CXJ2mIBm2bM
	efwmFjdKVzQ/qRw9HNhSoeaMd2Dm3djPaW4KoU96nrEknbgiY4K9FdsSRBcU5bEEFUnMn5kpUqi
	WVjxoheL
X-Received: by 2002:a05:6830:d0e:b0:7dc:67:8c9b with SMTP id
 46e09a7af769-7e4ea020074mr11547580a34.4.1779131018560; Mon, 18 May 2026
 12:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427070113.18317-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260427070113.18317-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:03:25 -0500
X-Gm-Features: AVHnY4K1TxOP09cIrcbq5kcsEkEXME3dfDNJVWsm7p4Gn_UROxKk383aqLaBXZA
Message-ID: <CABb+yY2d7e66KWkepvPoai0Lor=Cz95rRj6KeTWwmcQEv6-FPg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom: Unify user-visible "Qualcomm" name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, "=Bjorn Andersson" <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108265-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 74AAB5728CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 27, 2026 at 2:01=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> And "Qualcomm Technologies" has even variations over the tree:
> Qualcomm Technologies
> Qualcomm Technologies Inc.
> Qualcomm Technologies, Inc.
>
> I am doing this tree wide:
> https://lore.kernel.org/all/?q=3Df%3Akrzysztof+s%3A%22Unify+user-visible%=
22+s%3AQualcomm
> ---
>  drivers/mailbox/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 5bf4155b090a..3062ee352f78 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -341,7 +341,7 @@ config SPRD_MBOX
>           you want to build the Spreatrum mailbox controller driver.
>
>  config QCOM_CPUCP_MBOX
> -       tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
> +       tristate "Qualcomm CPUCP mailbox driver"
>         depends on (ARCH_QCOM || COMPILE_TEST) && 64BIT
>         help
>           Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mai=
lbox
> @@ -349,7 +349,7 @@ config QCOM_CPUCP_MBOX
>           Y here if you want to build this driver.
>
>  config QCOM_IPCC
> -       tristate "Qualcomm Technologies, Inc. IPCC driver"
> +       tristate "Qualcomm IPCC driver"
>         depends on ARCH_QCOM || COMPILE_TEST
>         help
>           Qualcomm Technologies, Inc. Inter-Processor Communication Contr=
oller
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

