Return-Path: <linux-arm-msm+bounces-117799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sKJyDf62Tmp3SwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 22:45:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29072A4B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 22:45:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=mFzwsdAj;
	dmarc=pass (policy=quarantine) header.from=proton.me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117799-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117799-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 331793010645
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 20:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BE93E4C87;
	Wed,  8 Jul 2026 20:45:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957383EB0F5;
	Wed,  8 Jul 2026 20:45:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543547; cv=none; b=ZRTJBdgj6fH2e3lIOENL8I+VU99fdrc5Cd+x99zx7/wEwm6a7kgn9226gf4oSOY+adG7U9Gs83yS0Pabd6RvB6ohfzB9ncdx986UGfAVYffwcvCX7y68bz5mKdlvg0Y1/KuCTs85vLZLlzQpkmXKLG27dU5Msb6XzVmCcNVXsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543547; c=relaxed/simple;
	bh=r03CrNAxQSGGE+UL82DE5YCVO6wyOZws+zrzP8fRGtc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSaOAgscj5gKE9B/N8KSM6mwjIfffypRLamS8VkOUGAY43TJwjs+xcFS6AnSJ8DeqznARnXid2KCsYL+ERtzHZ6ln79+vFPfDGQnwnESPOWR93WB/pGFURh+Xqz0N7xcFyDFGn4cr076mSURxJ2c/HWQrxbbHP82qKTYnv/O4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mFzwsdAj; arc=none smtp.client-ip=185.70.43.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783543539; x=1783802739;
	bh=h8QGeMby6TGc5ofTv8tQid2BJw8VG7F7i0kmV7qnzqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mFzwsdAjqT3BVwl65ih+vOf4dLr0HggkKpB6fVriRkJVtG7qK/pQEqZu2PioUZsRw
	 YgfoYnTST6oz5cRP8/CHisKzqBIxX0K4Kznsdn+rkCeRDJFr53mJuxPJc2MY02JnG4
	 uAbAXXgWV7jpEiBes0Kwi44lu6RmCw2L+lpj+ojKiVCor0Zcxq84vJFj8p2W8J/bYx
	 d4DafVNjkUxiGPxSmeRyiEtapjIstkf+bIiKgoi3DMjcSp9TH42qeRw0mYGl+uEZBz
	 M89q2kE1Gl/rQNaAKFvfKRLHIQ3Z/eSR4DDTFoTmB/Tl0M7WJeG4b1APN2PKbT0dqf
	 a00aXIUYcgzxw==
Date: Wed, 08 Jul 2026 20:45:32 +0000
To: Alex Elder <elder@riscstar.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] SM8450 IPA support
Message-ID: <3e70d77e-6bec-4e16-ae88-a4f5161f182e@proton.me>
In-Reply-To: <8309e9c7-a110-478b-8cd4-c002070d2b4c@riscstar.com>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me> <959db395-ae71-4a50-bd46-ac5add545a52@riscstar.com> <48c624c3-5408-4862-b4ec-9321ad279bf9@proton.me> <8309e9c7-a110-478b-8cd4-c002070d2b4c@riscstar.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 64bb24bdd771c804828a3d7e9d0320e06a799b4a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117799-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB29072A4B0

On 7/8/26 3:49 PM, Alex Elder wrote:
> This was interesting to see.  It's something I should probably
> document better.  Most everything maps to the downstream code,
> but it's not always completely obvious how, because the upstream
> driver has evolved substantially.

On a personal note, I'm surprised to see someone not from Qualcomm
maintaining this driver. It must be hard, so kudos.

> This means that the SRAM size (ipa_mem_data->smem_size) should
> possibly be defined in devicetree (as the IMEM address and size
> now are).
>=20
> The SMEM region is used for "IPA filter tables", and access to
> it is shared between the AP and the modem.  Unlike the other
> (host) memory regions, the size used is *not* included in the
> ipa_init_modem_driver_req message that communicates from the
> AP to the modem where the regions are, and their sizes.
>=20
> So it's possible that the size used must actually match what
> is expected by both the AP and modem.  If that is the case,
> using the smaller size might have problems on whichever
> platform (SM8450?) expects the larger one.
>=20
> So I'm not sure whether using the smaller size for both
> platforms is OK; someone from Qualcomm might be able to
> answer that question.

I actually went ahead and reviewed downstream device trees I found on
GitHub (1) which contain both SM8450 and SM8475 device trees looking for
the qcom,ipa-q6-smem-size property, which would correspond to the SRAM
size, and to my surprise, this was set to 0x9000 for both SoCs.
Most likely the commit I got the SRAM information from (2) never made it
to production devices.

With this clarified, I think it should be okay to keep things defined as
they currently are.

> I'll try to explain those things separately.
Regarding this, I have a question: where would this be published?

Thanks for taking the time to properly review my changes.
I'll address the review when I can.

(1) https://github.com/sm8450-mainline/fdt
(2) https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/com=
mit/477aab9e7479ff553c7a162ae74029170a2e8291.patch

Regards,
Esteban


