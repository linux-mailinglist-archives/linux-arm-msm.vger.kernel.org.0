Return-Path: <linux-arm-msm+bounces-97156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPIcEtlssmkpMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:35:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D58226E615
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F94305ED13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1C1A680D;
	Thu, 12 Mar 2026 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SKKLHEjC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6629A2;
	Thu, 12 Mar 2026 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300950; cv=none; b=rPGEleC6hrASi/ROXqGkrjekAS49DKbIudnIZZCzHGys+1zj/TiLrAul2xIoYGeEwVxAvD7ULO22MMbPzHA9SbSk+PfeU+EWPELnPkKmZ4LSLzVTqvBjRHyjCo0iT+GYhP3o4wBTTHCKXZX6dJKZTyNBMH0v5kZTLX1NH37X10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300950; c=relaxed/simple;
	bh=n22ZdnCiNz1FqB7pAYtwypL6C/yoAP2gROmFXtvKlKk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFOt/pm3HWPgh43P+uyNFZyh0SuAbEB8cnYewUSAvgTVG+7whTITSktJUwUQkikvy80WDVkGM3yuAz7N5HJeK16XKmuq+wQQ9eSIMq2E0TG/4+3Pg2UtVMMzEJ8DJZTBCvmd6qWWZMIYpySdh9G7nEtJKu54xcjjVOzy3r6zlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SKKLHEjC; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773300939; x=1773560139;
	bh=W4fSxbreWSN8hJqz6ykGJtj382cjYeRiSHXDVM35kNY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SKKLHEjCwvhBxSV0RlMIqdcQ+OyzgiHq85MbOuoYElqLaDQLdSoCHNrMO/5Etsxx4
	 jdUDwRq6/cSGir3QzIV+bPMDnZIE1+L34GiPBLoioQL5TdvBv4qICNaMwKVasWGabe
	 NTC3ocNEGl2pM/WBeo8Q9KvOVaVKD9ywJigwJUtR2OuHE9sx/6TkqD1Lk8cZV8baQ7
	 EKt9Gx7TrQFKT6xiYVvVMVXUUX3KYXLY6AeCXv7O4Xbkths4zv4+MU4aEVONaJ4Oty
	 DmkDiqYUt6a8uBP5KfZmPQE5Aibn/zjOf+SGtuCUJFTt2HGoCnfa0PAkWAijRMgwxN
	 wEvz1LUxTNBUQ==
Date: Thu, 12 Mar 2026 07:35:32 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
Message-ID: <OlPwFMhd0APrPSzuNA5HLquFco9civ4jOCF8caWC3eRMSAZq1AcFdFBhrT5o2-kyjAzeUEqT_ZSvtYRdaeoyrzt-0EgjKJ6eRsumlPTU2s0=@protonmail.com>
In-Reply-To: <1ca4cdaf-d8f7-43c5-9087-b0394036c461@oss.qualcomm.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com> <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com> <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com> <1ca4cdaf-d8f7-43c5-9087-b0394036c461@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 3b1689991cc4bee5e0359733a34ed752bfaa4c1c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97156-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,protonmail.com:dkim,protonmail.com:mid]
X-Rspamd-Queue-Id: 9D58226E615
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 11th, 2026 at 14:03, Konrad Dybcio <konrad.dybcio@oss.q=
ualcomm.com> wrote:
> >
> >> does /proc/interrupts differ?
> >
> > When interrupts-extended is defined:
> >
> > ...
> >  50:        318          0          0          0          0          0 =
         0          0  msmgpio  65 Edge      gt5688
> > ...
> >  54:       3141          0          0          0          0          0 =
         0          0 GIC-0  65 Level     gpu-irq
> > ...
> >
> > Instead, when interrupts-extended is removed/commented out, I see just:
> >
> > ...
> >  53:       2404          0          0          0          0          0 =
         0          0 GIC-0  65 Level     gpu-irq
> > ...
>=20
> Hm, that's odd - I don't see the irq handler being registered anywhere,
> or anything requesting that name. Do you have out-of-tree changes to that
> driver?

Tested on linux-next without changes to goodix.c.

> Konrad
> 

