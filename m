Return-Path: <linux-arm-msm+bounces-109476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBk/FrFtEWpLlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:04:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BED5BE19A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37C173018C02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 09:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D609346A10;
	Sat, 23 May 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYoxpaNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733B32AAC5
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527086; cv=none; b=q17iggiTAGz8kzMe19Ppw1UsLL6JLuej+k19aKmKQKj2mQ3d9690rs1TEsb3/5LG/niKJGrQUAIha7K5MnE9uV/RUwSPFadUkEG2IIaOa4WVwKdI1hiuppkAEeYMjhD7spPicieCi1jfPQpSkEzA2jUqW0pccfweIpm7eq5CcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527086; c=relaxed/simple;
	bh=cy0Qqsts/z6KKJgbbplxavh5+ONRgEEzPO+e49FACkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRx4OWgL0RFXOVJqwEbbn6f3kcGa742RhAsSrw6wAZris7IhXhoJF/wOE37POT/sJbIUNWBzCMQuTDS3WjdrN/KdhHHHVqbVD38+eBWYbWc7PgudbPkxKR1LGi05OtLGMdgzZ9ywz6qdcjdhoEvujmaM6NDx0gFQPUkq8fH+CWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYoxpaNv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6FB1F00ADF
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527084;
	bh=cy0Qqsts/z6KKJgbbplxavh5+ONRgEEzPO+e49FACkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GYoxpaNvwMDa8sff0inysdFoF9Ysc13qPWz/kCvRbRbYMzf9e9yDMRK+y294ktdTN
	 uJ4NFp1B3W1wiZ9qElXlcMzxjQTxtK97GFrDUx8QnYGVJKMwxfGPNGL06ilh4NIJL2
	 gjKVqDXwg01HmB2sbpHq+miphqTvxjvzGlk26B8nx94rWt1ucFlM8Fa28pUiuBBZMt
	 6d5yYCzCxKjndYJPY1yfd9lbdapdqL3yz8YjpgodUAkxZ39s6u0kheLMenJIWyCEZr
	 7MlLy0EfFOC/sxNeqcGJWQVAApIftpOcDRR6aINu2HfIl5ZW9F+dx3Nlqhsaexu0uz
	 B8Q8auE9NAPCA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d07e8938so68311791fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 02:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ZU99kmRuC3sT2om1hkWg0GMyMQE8EuZomwxqiRNPm3Epa25abRmw2rCseBRIRcbvIh0A9OZSPV6UsfDQK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9DIY/cc87WlfF8UcPQ+7bwV0spcCXnt825NhxXoAUd0ulF+Z
	e274o43RiIQ2ufzyiXrbk72hYTXjRLWxnE1oH8GU3+RxwXwPO11Gfe/Dybfj8tKqQv0ddlKH+TT
	PGO5fn/pq1JX4n0xZAO+pVr2JMnEYBDM=
X-Received: by 2002:a05:6512:66c6:20b0:5a8:fbe0:bc59 with SMTP id
 2adb3069b0e04-5aa323713femr1559985e87.26.1779527083463; Sat, 23 May 2026
 02:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:04:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMoAU6QvJejH75f+7vnUvZaN5hR2K0dUB8dLcYo4OgcQ@mail.gmail.com>
X-Gm-Features: AVHnY4L7xJup0EqyRn_zlpLf4c3VU0pvo0TSTYTXDJ6CgMCVy-xxqee0QsXHQUA
Message-ID: <CAD++jLmMoAU6QvJejH75f+7vnUvZaN5hR2K0dUB8dLcYo4OgcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lane functions
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109476-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C1BED5BE19A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 1:22=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:

> QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs.
> Splitting into function per lane works, but it forces the devicetree to
> describe a state per pin while these are usually configured in pairs.
>
> Follow the pair-wise scheme used on Qualcomm Hawi platform and expose
> the two selectable pairs as qup1_se4_01 and qup1_se4_23 in both the
> binding and the driver.
>
> This has been proposed here:
> https://lore.kernel.org/all/agIZOAa6nYSb5PWX@baldur/
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Patches applied!

Yours,
Linus Walleij

