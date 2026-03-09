Return-Path: <linux-arm-msm+bounces-96281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJd/E+Permm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:53:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6323AF67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6102A3014BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3415258EDA;
	Mon,  9 Mar 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="biLaHrSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857753D5246;
	Mon,  9 Mar 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067934; cv=none; b=o/NAh77QaZYfsNM/BiNVbT2fp7oD/JoVABZoF90uvjGjinHgvh2xWy9/otLT8TzAZbcYHKnQQAHUB3vNX6CwVB94aw4KOOcHxXd00Nv7cdAGk+7wg2Lpxc56nSK7fpWpvEeSaCEjfQMkeILvhMezS3dUMANi9rD5SzJyCdDT3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067934; c=relaxed/simple;
	bh=aKVeqBvNoMnwi+KTkPV58gn8MWCuWDAX+BBtLm4NksM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDsaPfn5Np62zruU8ATUWi68I0pgg3lLGiuPoAmnU/AD4pjpIwFjCfGrajepVbDXqPUZH8pLPflhpmqScw+xNIqRP/aMM9zEz6S8gZYabvHKbgVO3qxcICz5FLUNlzFF0v42KAnBfZp/i+83K3dCTM4IpR51EwUlns65aZvjGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=biLaHrSl; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773067925; x=1773327125;
	bh=K3Nznu+/0RcPCwpyvD2MPBrVSW3dHPifrwUThhMa12o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=biLaHrSlcOp9bSjOsu/CJTRBf+wMkLdAP4MEug9n0xV1Z+wyw9AQgkMrRfvwJbfc8
	 A7BFcLsXpnENpQAioWTMlxGyZyM7fiozXTpKyy+ZmejxYi0iMwaQ0uRPaNbJ3kXeTe
	 eqJPO+MUQN5hLaTuX39w41h5tV4GtRwZIQB4M6v2BzbB/JcArTSCQDQ5a2AUddK7xf
	 j1GXWcPVwCuwtJgfb54lG6j82j82E+PLarQODre2iAyvVInGztjV6TGKFjBlwiBoOU
	 9P5G7dTUcFK5L0yoHF2lBeLg0XzGHytUw4zadswoO+3z15ffhKsPK8cSlWl1/GbxPP
	 pU7OyVVPiwl2A==
Date: Mon, 09 Mar 2026 14:52:01 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <7Ft_cDw10-3MmNTrKncMut5g08sodd9CL7r7AGXAtPPqZpXtHEgmqm05WhEpYMZzFEs4B0KWz-LU27Z0_YDnc44nXhdUrUt5X2dWK7D6pYM=@protonmail.com>
In-Reply-To: <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-1-aa2c330572c0@protonmail.com> <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: fc565aee6ed89af7a60918254dc78e3c50d606fe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AEF6323AF67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96281-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonmail.com:dkim,protonmail.com:mid]
X-Rspamd-Action: no action

On Sunday, March 8th, 2026 at 17:13, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:

> > +  vsp-supply:
> > +    description: positive voltage supply for analog circuits
>=20
> Both are odd. Datasheet says vci, vddi, vddam and optional avdd, avee.
>=20
> There is no VSN and VSP. Otherwise please point the page in datasheet or
> some schematics.
>=20
> Best regards,
> Krzysztof
>=20

I'm not sure about that. Writing panel dt-bindings has been based pretty mo=
stly on vendor devicetree - which also describes somehow the panel and make=
s that working with the final product released to the market - so I've to n=
ecessarily consider that.
Then, I could agree that vendor devicetree might be not compliant with upst=
ream rules and could possibly make mistakes with describing the hardware, s=
o I'd like to find a way to describe that in a more proper way, according t=
o upstream rules.

That said, vendor devicetree describes lists four power supplies for  DSI: =
'vdd', 'vddio', 'lab' and 'ibb' (which have the following property names, r=
espectively, in qcom,mdss_dsi_ctrl node: 'vdd-supply', 'vddio-supply', 'lab=
-supply' and 'ibb-supply'.
Two of these are related to ds/controller (apparently, 'vddio' should match=
 VDDI power supply in NT35532 datasheet.

The remaining two supplies are related to panel ('lab' and 'ibb'). These on=
es are two 'external ' regulators ('external' from NT35532 perspective), wh=
ich provide power supply to display, located in the qcom PMIC (in this case=
, that should be PMI8950). WRT to power supply names described in the bindi=
ngs ('vsp-supply' and 'vsn-supply') are the same as 'lab-supply' and 'ibb-s=
upply', just named differently in the vendor devicetrees.

Usage of 'vsp'/'vsn' naming for power supply properties is grounded on they=
 commonly being used at upstream (different panel bindings make use of thes=
e properties), on one side, and also described on schematics of devices wit=
h the same hardware configuration (LCD_VSN and LCD_VSP), on the other.

In the meantime, I've found out schematics for 'xiaomi-mido' (another MSM89=
53 device) - a variant of this device is shipped with a panel also using NT=
35532 IC (just like my device) - and LCD_VSN/LCD_VSP are clearly shown ther=
e too.

I couldn't find much more information about the display on my device and th=
e only resources available about that are those listed above, as of today. =
In light of my reply, I ask if it is still necessary to describe, in the bi=
ndings, power supply properties properties not used currently in the board =
DTS file.

Regards,

Cristian.

