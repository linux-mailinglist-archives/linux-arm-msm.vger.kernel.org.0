Return-Path: <linux-arm-msm+bounces-105880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCi1KCa6+WlICwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:36:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D584C9E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9D930209F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 09:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159AB320393;
	Tue,  5 May 2026 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpNMpWwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E507231F98E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973406; cv=none; b=Kvi7LpCb+QlEduaQRGLCNbzeMkHMoVp05DhMg1G/SZNi9v86y3qkp5GzagobAvEYOX8X3g0iZVmPuCeaIiG5i5Ti9ktFS8T+GcS+oojKKTrQVcBq8kffSPIRsfCzhOZakBdH8yFWNEPH3ozz3V8INj1vjRtIRxTDTNDcg4QjU3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973406; c=relaxed/simple;
	bh=iBvZb5NBOYvypj8flltjDiowahrIrfjpdsW4qgP9dns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H00pbr1nsiEIcoYXIfomp3Sdcwzn4u0IbuQvyrXYl67MabNJL86HkXjWreXImvlXdc5wFTq6MNbufQ7QPa0nfJHTuoRYBpyeRR721lFxqi76qEoGwO91dxPpD0lKVpVGw3aKRw0gJURamrfa2AYtWLcl4Q27E6CP75PuHEvbncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpNMpWwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64B5C2BCF7
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973405;
	bh=iBvZb5NBOYvypj8flltjDiowahrIrfjpdsW4qgP9dns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VpNMpWwXyB/ezHR4NBP4ODBIXNLYMQ188/6XGY/0EIo3EnM2rpBOlT+dWY/MQ4OV0
	 hX9FvscikjnJyJuztgB9czrpF4a1gSh4vaSZu8fuSLC1wGqWIxEZTq2mCvAmtcR8H2
	 dia8NbIlmGyqrI3hsC9PV/HBemGh5dawiT+dUa+Aiuep9YiEBxbMd0vG9tKElXh0jq
	 S1KkoF0bPk3vE5Un8AuCZ72bRLDA5lVomSxeSO/Bs7gsNMDEhhv+yvXCL+peIwi4Ov
	 buL1jhufBK1CPk2I55VagxtSa1ppzX5jPP/sL6p/t0yfHspdylLelzGBOQEssLXgmN
	 s+3ZBa6ivUmUg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so4763833e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 02:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+U1DZAgsOlWKgE61EAEg/EmN4kMcVOrCVnu6ouQNKsYWQG6zQjSIUT5JPHTeaSXKZ/edvBVfBjyPgbkrgG@vger.kernel.org
X-Gm-Message-State: AOJu0YxzEvDCetVRQtYTOl9GEqcSY91gTp4ynYnYZXjF+M/ASaUbigqK
	vNLWkhMNFFiabrKZXVDYJv61eGVGbhJmODS70A7C0OMAdOmBETYKnLAj/K5fOereaQVjH9AFSiB
	6jBLpca7RkRargrUkD2pOoygv4Sv0hMw=
X-Received: by 2002:a05:6512:3b0a:b0:5a8:6b96:9d10 with SMTP id
 2adb3069b0e04-5a86b969d62mr3038495e87.40.1777973404397; Tue, 05 May 2026
 02:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
In-Reply-To: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:29:52 +0200
X-Gmail-Original-Message-ID: <CAD++jL=QK+Qzm2Y80HpKArVs7Kqbz9nV5wjj_1XzSQW8zGhgZQ@mail.gmail.com>
X-Gm-Features: AVHnY4KVwZcEXHjIrqpN3eCjaCziqA6pzTQtchqPQylelmHffx2YGJEKMHDFEvE
Message-ID: <CAD++jL=QK+Qzm2Y80HpKArVs7Kqbz9nV5wjj_1XzSQW8zGhgZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 11D584C9E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105880-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Mon, May 4, 2026 at 12:07=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This adds DT bindings describing the TLMM controller on Qualcomm Nord
> platforms and implements the pinctrl driver.
>
> More info on the platform here:
>     https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss=
.qualcomm.com/
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

v4 patchset applied because why not!
Surely any remaining snags can be fixed in-tree.

Yours,
Linus Walleij

