Return-Path: <linux-arm-msm+bounces-99006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNpALZJ9vmm8QwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 12:14:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF22E4FC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 12:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A27D5300A8F2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 11:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8248236B07E;
	Sat, 21 Mar 2026 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Vq2XJNPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9136CE03
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774091448; cv=pass; b=guoKDHwkWP1FUkM3EyUcXmgJmNpYOsPWAmHCc/1O1+HoAc5Win86vBXiUzELaj2e0nGE78Ubb996hGDT7FpBoRO0YsoaiSYE54C0fduPS38/wfR/0VvLzR9t3WIQHI8Fwz6QyyZWu0nhJs9+lXUlsnF++cWkNhf2pQ1ThK+Cnv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774091448; c=relaxed/simple;
	bh=0zaCarWFAl1I5M4Ha2lpH48OPsCWNyPVRVrHK4Vc+a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLn4UcV/P9H7G9FC119G4mKXM0LGmVRwyV1cmMK9OQMM7QGnOoOHtQs+aIoJqT5tb1c+lr0LZh813uzLYjTTbJcHRGhOLVGcNIpoY9Aeh6ydsLzxAeE85chamJIUnCm6YAFT0khhXXptpe+1sNvFZ6n1zrygJwA/rHEtM3UFwZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Vq2XJNPe; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DB5923F747
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774091436;
	bh=2A9/wfVwmSsIZQua3y5VdJJ3emu+4yWYLgcT1QszORo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Vq2XJNPenaBzkVQ1VIeKHTy4HzTpxytfbufEmlyaoEGkoxMvt2dR9vA8fyhTKUNRO
	 CIb1kmOkQ+2e0ZxenPP7wkn3jNI+GVV7vjW1lWSEThhxUcFfkcQhIwZwQs0VekRavX
	 +55GWhHIIT/DkRqsPQfVjdxStIxufr62veGu3quZZ/9cMMP1+OvlwgmHwwwY24u38/
	 QQdJRbPdG+uudJ6JaUwj4zNyuPF2zZndolTvRWfSqQa1V83tpzbNEqp7FS33kHqUD4
	 bMTJbGOwhzAxQSsSYeIO4fA7VIcd0oLK/wfJCScxgp62rnwJ3odFz2PA+FDRCBjMBR
	 hu17XRHyKs8wNOVjs+wNTlF+xcwbCqyj9O+FLGdciwsZoaHCyRttfRJwCuqc/t0kl3
	 HdmO2rxYXrbr6e5PzeFuOz2btathp6vUxqcYQ8wAcnSfQ0zOdE8vt7K6RORjtAySIg
	 trEuXIKau7It3bQTp2471r15jYCwuUWVWfU5kfwroFRJEQawr7aienJA47FMjp7bj+
	 Qblb738LJfIujJPfOQ+Pex2ZGzOw/gn5BD0g0Lm2jQimIeZB+cHTmS/DsGQR+ISTeK
	 un511AkV0FlDgLjyetR7GFJfSSZLg5u7uZ6m4g3AU0AGA+5B0JtV5pHDZVhoU7cYiA
	 mSJlzt9HR+zXynBbfv/THKNo=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8f5bce308dso364658066b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 04:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774091436; cv=none;
        d=google.com; s=arc-20240605;
        b=J/Q4cKbs5a5E37Mew/n7jzlwuuPaGS/vNkdQxQjtRo58GDSEUVGdVf/fCllKCZfqzb
         ynN1XD28jE8aLUBthWqGL8fSZ+iydOPeOIu5u+u5uWlyOscUgiSmU6k6eq6qYXC5DEEM
         OgjbjySeeUyugZg6gW+0PwBby45kbEzz6WAUL4+YagUC4UKF2Tb6qHwut76d+PMwUo2T
         QG5f+p9oHwIP6jeibRxisCKcWRDzS1AAgHa4HDuha10SLkwQP80vM+qaA/hlK5oU+gb9
         xc5iN6OJIMxjAyHrcJpbr0fUfDhCf9czUupkI6Cdvx+lRE0tIvZoe9a9RlBOrpPBNoJm
         t7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=2A9/wfVwmSsIZQua3y5VdJJ3emu+4yWYLgcT1QszORo=;
        fh=hKogeWh1l01ycnQ9wCQF/JjHWGGpPVKg2UedHmaIgJU=;
        b=O3Ygbmrf/Y7E9WyhrR7PLAP0prEpnMlhIGMhz9WR5xmvNgAhZ3tShA0wGkRN0Lblm1
         kMR3YqJT6GIssiIxyBR0ekHmcpJDAyTJe47UUZrFv1rIA8oaTYTxyQ4Pt2g132WnVj1W
         nWUo1PP0G8wtvwNV/d6/rlP+NtqOHgo8VRqaZM0UTC5s4C5FFIYcGARsLFEEI3i7dnx4
         k/TaZa/zL/DeGAzdPcpdvQUoo07QVUM2ysnM5hEpn88lv2M1o8sRGsy+kpW+ryinT41h
         afbos6kJPRrFK+B1GX8H4F0mieOUmavDlDrV9G8jTdYtDCdmrS2Qi9stGgisi1gIFBOl
         2KKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774091436; x=1774696236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2A9/wfVwmSsIZQua3y5VdJJ3emu+4yWYLgcT1QszORo=;
        b=XYohEBuTvCApNvFe+M1zyon1KVFDxuwORf9qTYLo3rnmohNfctd3p+QHlxTH6LScuI
         MenCoYbdaGSfKa6b89XxLwrq3PRysOEFHUpmm7GO5ZplK27cVeE92vzLUEGzMbFI4XY6
         LlL8jaUHlK560eicmc+o+QXUrMYudmI+1DyAFgTBxOd++ljfLqhfEnqYutmUMZGjS8Av
         M/2u0Gom3D4DiBRK0Aga/7aJP+QuvTw0sANYm0Oo+RxNwmDh4bSfGlks52oeqGsSi7C+
         QyNUcIdUBiqw7fZXJqJtNDx9jPc6BwJmXyXr1xL6LWsmNLGiWnolIhs1M51aAXd0SwOv
         5c6w==
X-Forwarded-Encrypted: i=1; AJvYcCUoZ9D9AXdF/SFbTmo8FyJWrh3ZtWuvpml3fODA5DPEvOonrsZLfVvvJpdVKEH8FROzaQYFE9qGbpOYZXvj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mlpUlJvgDmOK8FZRA8WUyNAt9AAmDu4YxgEd9ot2APSMUnr/
	IGCFrP22wKh7VIGEMHAMnI8BCuk/s9lFnD03djD/dkFEwZVywrYdZQb/uDrUne7bOODB0gyUR3M
	KnBUBXbp70Qx9dysrPq0cA6F7MhT5YYlQfN/r4qCEdCzfmeewzOwG6cexYFmtRu7YO3hRnuYeVy
	4pL46mclzNI+QR5FFUP7eY1MPGcpdux/WfuolnNW0NIKdcib7n45iNAkPOHw==
X-Gm-Gg: ATEYQzwvFOKcTldEtNYTXKPUnXaYD3HaZXm4KSkFl85k/E0+JoSyA1sk8vlUBYg8vFo
	B9njK4Z5iQQpeFZhOn61jahT1nfdTDES0bDek2sfpNTFQhfpN2zTIWEktDOQpKRsGR+r2IX1sKk
	knXgBAq214w6XS+wW/Rn4V7dWFG7JmAaezj8Bbtwqd71DUvFRZLrys+eyNpynoozZqtJC+18Exn
	vYQu/6ujwwWOAcnzl/gguiY5kAu3KM8/Dk4iA==
X-Received: by 2002:a17:907:96aa:b0:b98:528b:8462 with SMTP id a640c23a62f3a-b98528b96c7mr73398066b.55.1774091436341;
        Sat, 21 Mar 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:a17:907:96aa:b0:b98:528b:8462 with SMTP id
 a640c23a62f3a-b98528b96c7mr73395966b.55.1774091435897; Sat, 21 Mar 2026
 04:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org> <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
From: Tobias Heider <tobias.heider@canonical.com>
Date: Sat, 21 Mar 2026 12:10:24 +0100
X-Gm-Features: AaiRm52499M8HYTgFplXiLLRqQ-Avz-L10LhPTnrV7OoeTxB3gRN_PnUea12HP4
Message-ID: <CAARv3RSQbAQwDFsfBrcrkXem_jtVy0Xttqi1UZfuNT86twxmJw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	TAGGED_FROM(0.00)[bounces-99006-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 1CDF22E4FC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 2:15=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
> tables for this part shows we need l7b_2p8 for the avdd supply.
>
> Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f10dff1da7f8e..1611bf7302ddf 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
>                         regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
>                 };
>
> +               vreg_l7b_2p8: ldo7 {
> +                       regulator-name =3D "vreg_l7b_2p8";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;

I included this in my Ubuntu test kernel builds and got reports about
reboot loops
on the Lenovo Yoga Slim 7x.

Your change seems to be based on
https://github.com/alexVinarskis/linux/commit/a94d1f4e1d025398060d7e0dc2270=
b8e375f6f60
which I had previously tested too and didn't see any issues with.
The only difference is that your version uses different
regulator-min-microvolt and
regulator-max-microvolt values (3072000 vs 2800000).

Setting them to 2800000 like in Aleksandrs patch seems to fix the boot issu=
e.

> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
>                 vreg_l8b_3p0: ldo8 {
>                         regulator-name =3D "vreg_l8b_3p0";
>                         regulator-min-microvolt =3D <3072000>;
>
> --
> 2.52.0
>
>

