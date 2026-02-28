Return-Path: <linux-arm-msm+bounces-94606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPp1E1X0omlD8QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:57:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DF1C362B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FDA330427DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC942EA754;
	Sat, 28 Feb 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etDPzfgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1D36F40A
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287058; cv=pass; b=lGx4y1kIwf8A1tQNOy8ZsapUc/XNVYxb9HIjmxpTWB8MFOjcJHWZ/rWllgjx2BjDh1w6Mhi0IRd5QPDLsCs83l6m2PSYDPhCKWa4pGcx6BCDXI6DEyGNt9F0C49MWLTE8rY55FnkZJDEkcj7q1bTqVj/thsQkiZp1lX2WddO+N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287058; c=relaxed/simple;
	bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djOvL3IB1ioToYWZh71dBwIACNhwKqX7wpt7kL4tBT+fD6C4D2yGyMql+yrhZSAJrZ0QNWKs0p0k9GpJIZoOm3yytP9NwJ/uKiMezb325M0tnwarpAP6L1k1rFKkOOVTOYRLKpCYs64+udYq1KtuMtapBlV1vUH0q/6/zYpII7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etDPzfgJ; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso1851054241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772287057; cv=none;
        d=google.com; s=arc-20240605;
        b=S2XBCrxIjdbPVkhifXCF8HraidzYWjGGnZuaNzAfbB4yenIqc1jk9ffIrqHl4MmRlA
         l42JcScnnYNfU6gd+73PVkeFnmyLcUwlsiH9obWwdubVkEXbg6KghWSXZWmIRKidaytX
         6PgrAosAkdBr5ZC4EzmRGakypmKegAhBg2JzO2Jtxcmo8LW9qubUR+7hvw3m+LPPAlFh
         RydrbiTr8Bjs10N0Yhin+jpvaDffw6or984Wtoo7CdGVZ0wKo1ueNl6pkwpumRpLHxbg
         +UWo/xW9ZMc1LNVpvgQLMX5rc6F3/Gh0dWNGZNTs743gJ0jlnaQAuR/a2S2uSe4KlYuZ
         GA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
        fh=Dq99Ra8xc4q2Ub7SvypxfPYgvwhohY+YlxZ0j6+BBQ8=;
        b=QlxdnhurKMsZrGzhIDOnXCV9G1s7s1j1y1AeBX7vzyHURVZ2cgo/9olW5LMZ3VDLyR
         RwRysFHiapKx+QaLHu4/ZUrTLFQ8FNCcDSEr5nWQtFKLMnzPXEM0ZW8osV2gpWCpbY/5
         8mNgtYEJU05eMg0jPGljn1j+O0ZPMC9wX5tJL4sz8dwkTPO3IDnn5D69YbA8cJaoAW94
         4hcf1aMTTFeQOFuK2Tzw5/tqkzNGTBHbyrgz2G5fVQ7nOUm2pCZIkiY7fDVXqys++Y5T
         TEK94U5Xx1c3mu1bGezRG87xvn+NfmZNfA7xonDcFrGWG7ZUO7PyMh92v9QtUrFD7xul
         mj2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772287056; x=1772891856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
        b=etDPzfgJu6P+93bTGq6hjSFt8hloX8nrxEUIRikiGbQljG9j0FizsRc1ZAoNunA9B9
         2rWa02hgdhtdQhHwwkWhVf8SxU4gncSL/JYclpnlBCvGWjizyVQrLr15Y8514xfh6e1T
         yHesW55YNSw4oXa6QLHFB9WBkHXsr7alWPLM3YrCcMYjsUSMna9TDOqR8h5Ox2q04sCC
         Cy9JLsQUP4V+hTuShwHMp1DSCVLEXq3juE/9uYXvYEp827OX5jW8gU3sYgqPCfewwgFL
         Jd+t7X9K7o/Ab+z8qVtCp2sugDA1nXSrb1vH9Ri9PfN5mwK71gjz3GragDf5HxRloV7h
         aKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287057; x=1772891857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
        b=tNNem5td4OFRrgUKRAlRhM3MtRzYWOUh1ceAedhThGRWVwXmVLSJkPanEwU4U6/chT
         TIhrZkt+kt7bDSeF/NK566hlWDdBTdgFlrYf/r3wCms+4DTAXqmwnFYppsKdrIwichuc
         jE2cTAeBqev1Twtpr9JmiLDgSFDwIfiJy4Nd/mS+bUtHRI36i/vKFyWQCCvu3+om7C77
         Bt0bOe+J7XUpeiUM5WiZAI40aY/VUMnp6K9nejTy2LtF/h+ID7dqjEB6g1uTUK4t4U9v
         pXQJTLrCLc1uIoefvtVKtpvx1YgqlcqZQFiJa/Na9KgagabCfk9usI3uBm45Gon6v7Lh
         /OjA==
X-Forwarded-Encrypted: i=1; AJvYcCWkhDsRZ2HjkSSJrp9ZgLjtN9oGo1D3BczvoBmDruqHCfGtFx2a6n5cZCrmyt5Xj95ePXWrpR1u6NNFdxcl@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhlDK6RBP5gFtgVzw2hcq8hlt1DBXK6eO0+hT7JZFhm8rDtTH
	wX4fIsf21SZC5rVx1a3AEbdjYN8otBmmBRmk5i6FvsjJXHPDn5pT6GimMpu2w5VLeQ/LSNc8olz
	EgLFsJgSmML/TH2QKY+3FKOL4eO5NpTY=
X-Gm-Gg: ATEYQzxv650qk8YNOi5BuUPOOoUHZWo9ZiJbyrw9+4Xv+eNU9zoeP8g3TS9yduKE5Iq
	E2y5kl9Rvkex6eU36hi/QJ2SmFobsSDUOM6pp0z1pZvt8bWW9i0vxtP7pN6ejquSBB1bJaBkHZm
	vFmPADWL/Rvmvxo+3WCkqfJui5AYGh1XFRCMdpWx4dwBXIg2d2BqBxoRi09p75tbBqiR78TLqiO
	EfNNXQEFjJxsKj/RX3bjQHgDVzm7Exixy4/nArKhVEkyMgFRtHkcwl+BzmFIBRm2L59kTrc72Jq
	ZORC1TmjJ9znsroJHg==
X-Received: by 2002:a05:6102:41ab:b0:5f1:606f:2a14 with SMTP id
 ada2fe7eead31-5ff3248d7f9mr3793793137.23.1772287056552; Sat, 28 Feb 2026
 05:57:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228101907.18043-1-mitltlatltl@gmail.com> <20260228101907.18043-5-mitltlatltl@gmail.com>
 <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
In-Reply-To: <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Feb 2026 21:57:19 +0800
X-Gm-Features: AaiRm528taAECdfaNz7MHnvxwd2NLIV6e5nb43M70lsJMEjqfm41ug7OY7NJn1E
Message-ID: <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94606-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AA4DF1C362B
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 9:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> > The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> > utilizing the same register layouts and clock structures.
> >
> > However, DSI won't work properly for now until we submit dispcc fixes.
> > And some DSC enabled panels require DPU timing calculation fixes too.
> > (hdisplay / width timing round errors cause the fifo error)
>
> - Please squash refgen patch into this one.

Ack

> - Please post at least the dispcc fixes.
>

Yes, it will come later with the panel driver. Lewis provided the
patch but it was generated by Claude AI. The patch itself is not
complicated, it only removes CLK_SET_RATE_PARENT from
byte_div_clk_src dividers. But I need to find some time to analyze the
dsi phy clock diagram and reword the commit log.

Best wishes,
Pengyu

