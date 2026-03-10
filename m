Return-Path: <linux-arm-msm+bounces-96620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NLdFTsFsGlAegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:49:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58524B963
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4F5330759B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F357F41C30A;
	Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW3Nm771"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108F38A702
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142146; cv=none; b=JvhTIw60qzIHPDtKjsnPnTbq4mJspi9MKvPy+y2AcAtBjXrbnPKm8QhFfCkUSzXQqL/e7DBOhD6NUdkXQCMQxYd+HnyA6W3P/+FYBmvMTFaB8mxEH2kOcQS60YtGB9w/6w3WiCGILhGAwMr8bfiB5wZ/VquiYx4NGMIgxekNjeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142146; c=relaxed/simple;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4NrHrKoQ5EjzBpHbVZbhcOVikXXQbZ/YeBiYgs1GIZdkhwcnWF53kxeNNovCoJ9o9bQA6HDfH/fmtqCT/DEZdoKzxAFf4MZiyXAhGu4npbEkvT7qHrMb7Zl0hPKMI2N7/II1Lw97XqYTSu3Oqcy3mu1X4eHT4CTa2Kj+KXmyyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW3Nm771; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B23C19423
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142146;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZW3Nm771/UCnueFf/eUBV1D3yHpkta92iH3jndTPOZAEAylW7z6etVRefddlIJz/C
	 VN7Z5QU5bv8dokHzUrrxNM4iwj7pXSZbooum6uV3auNhuW5F9DRuy0YVn4bNWbE5YO
	 QsX6IRG0lZpstJB7azuGAZTFoi7xYgJgIe4WLGCrVKoyTDWWG71AWbtymfL/ncjU+d
	 0j0WI9r97EeYPeCxIuHrmvN9INmGgiQqXO/8ZYR1cUCVSJX3XwxPwedRGrtIu4wudr
	 AeU3ByoGbp7tJGhv5hABrG8IX5WOH/IN6FkDGne34+QJped0igeqrpmmPNHJzqG4Ci
	 d2yHn7Va1E3Jw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79907171da2so14943817b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/w2SBA3D95pS7b7LpXsOrFyuawBDJ+QKaMATG0ucWQuG1+rowxkKohlfGleW/qljQajx88GMs5nHGUReP@vger.kernel.org
X-Gm-Message-State: AOJu0YwZTyg055w1ToqMsEaUiS+OUmz2Wd0kqbp5W/Ur1UEsihCUNPUV
	GRuVAPfP+umGkb1XSJW2/ADlREp07COFVjnVUgFaWtU+CkkqTwZqtVg74MnWalPMlLtwn+niSKK
	TkeDVKZTnva5KJZr+Xmeb83fgKW6eZQ0=
X-Received: by 2002:a05:690c:c4f9:b0:796:4b03:73bd with SMTP id
 00721157ae682-798dd771382mr133874007b3.31.1773142146174; Tue, 10 Mar 2026
 04:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:28:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
X-Gm-Features: AaiRm53kS4zQliTIX4Fn5ceGqrudwVM7-RS-_bNOw_f_i9rtyZ-GaueU-4PyAHw
Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7E58524B963
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96620-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,fairphone.com:email]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add a driver for the pin controller in the Low Power Audio SubSystem
> (LPASS) on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patch applied to the pinctrl tree.

The patch is minimal and simple, any remaining issues
can be fixed in-tree.

(If Bj=C3=B6rn yells I will back it out...)

Yours,
Linus Walleij

