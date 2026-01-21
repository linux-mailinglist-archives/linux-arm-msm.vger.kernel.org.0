Return-Path: <linux-arm-msm+bounces-90009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNupJrLDcGkNZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:16:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D192569D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E65173E789D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940AA3D301A;
	Wed, 21 Jan 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCPNcQ9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4F3ECBC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997575; cv=none; b=bsPE5LKopr8SyWdv5jzsRZr2Hwimh/90Lw/SZTNZQ4sbc+EkEBqmrUTfUW9CSSOkcoh68WBUws8nO8mwUaOIBTBv8+MDkuXGMXFqCfeNLc3j1PL+TriiiyttiX4pS0DDp0PyeJ9mIpk56KCuxfdIDXSAIQcZyCgzem7ewWuF0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997575; c=relaxed/simple;
	bh=PI5bzyg2ZRdJAMj7UrwsdRqkLrIVfZz1jN0efa5Iznc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8S/EurByj/wfpLcw5O3BX67RP3Ww+8GD5rKoKkZwQExjc0RfmMWaoxivODJlaaNkTD/M3M08qA5NBwDuTv/pgGi1Hfg6+Yq1wwPn2GDiugcQ4q7kF+B4N0+BGP7RXlZasel+1mDFxZe2VdHRdYX/Nc8lCBc/Iv2r429ZlWNtrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCPNcQ9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3142DC2BC86
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768997575;
	bh=PI5bzyg2ZRdJAMj7UrwsdRqkLrIVfZz1jN0efa5Iznc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fCPNcQ9f33PUhbEq3mB4KvbFz3Xaxfvg/gU6M4RzBEQxYL1FLfhuY09PXv+TtjUfY
	 jgwvixu6IErcgQOpeRBFfYZN21meBHPMTZ0s4KmdNs85oFmFJZ2NuJ1b5vo+h4C9Mz
	 N8J6DOfrDBxg03R+kHTsq2jfpnnb6PfZZkVc2bZbrKN9vJRsSCLr1aak4lo11V2zmU
	 b4fDLtg9uJOWLWmpPn+qRs2Z64VF+fxwOUrKGmhc04rmo/RhzE7z/tF2cTg1uzQ780
	 ehjHhslBnrIIR/QJytYa2SM0Y8Vp5mdPJDE7QYlG9wdRXYGKPQL27DebsfbCSlwmuA
	 WQlIFMsKcOewA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso5235678d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFkIifCYY/bFjw/mKFww1mCL23lzEoQQKIYbTcnVWlIuMZ5dR6QF+mPi6IizhyDbB4kgpwexkE0b7TwTE3@vger.kernel.org
X-Gm-Message-State: AOJu0YyJYxaj/TvUDpZEQX45IqPOHeYpqGycbuZGZjXGj/RHz4z6/+v1
	Zm885v5ltTcmg+P2Jx6WLGq5xRKKDxuyg4taLuxPKaTauMrG99e8NnR9TOibZ0v8JQgj6l5CJW3
	aUwbN7MxUxAVxdyIRJwI3/8Obc/ny2WE=
X-Received: by 2002:a53:a64b:0:b0:649:3b9:9269 with SMTP id
 956f58d0204a3-649164da795mr11509489d50.74.1768997574452; Wed, 21 Jan 2026
 04:12:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:12:43 +0100
X-Gmail-Original-Message-ID: <CAD++jL=PxhVWUwAimUF19=jKUZMXJM=SisK35dLcUiSXS0tugw@mail.gmail.com>
X-Gm-Features: AZwV_QhhDQtzC5CdMM7SDnJeSVDM5x-Es8fYH67jzhWM1JOF-XfEUlMRbO-js-0
Message-ID: <CAD++jL=PxhVWUwAimUF19=jKUZMXJM=SisK35dLcUiSXS0tugw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add Mahua TLMM support
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-90009-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3D192569D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 6:23=E2=80=AFPM Gopikrishna Garmidi
<gopikrishna.garmidi@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
> variant of Qualcomm's Glymur compute SoC.
>
> Mahua shares the same pin configuration and GPIO layout as Glymur
> but requires different PDC (Power Domain Controller) wake IRQ
> mappings for proper wake-up functionality.
>
> Changes:
> - Add DeviceTree bindings for Mahua SoC TLMM block
> - Add Mahua-specific GPIO to PDC IRQ mappings
> - Add mahua tlmm soc data
> - Enable probe time config selection based on the compatible string
>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

This v3 is properly reviewed, so patches applied!

Thanks Gopikrishna!

Yours,
Linus Walleij

