Return-Path: <linux-arm-msm+bounces-117707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4sHWKLBoTmqKMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19065727CD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fPjkldQS;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117707-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117707-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E84E309FC4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82594CA270;
	Wed,  8 Jul 2026 14:57:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBC4C8FEA;
	Wed,  8 Jul 2026 14:57:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522639; cv=none; b=aB8z5C2mez48MAQrLP0G4JIhnRHHiqkLy7fpKFCWJrYd9QOsfcLmgy4ZvQ9NDl42MnpYSdlGcvxFbTDzwfxffxAJhPzlmO9bTT6klHVoeVZR7JWB8hflM1eirr6mdMP/JPBNxgPQ2Mzo3obN/v1Nu6egDETIID98YzKoKmTa6EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522639; c=relaxed/simple;
	bh=5kQi5NTnSGX/j5auue0b/PIKjVbuV9kP9Mi68KtrQOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYlh+88HjZP98QCL1t3mSvF0VMMyV/c6Z7wSyFgl3wPKtxOuiXvliMm5xoEAQt9mrf8O79Qcu7a63++MJ8LljkFoMZgkIcMNCmqU0eU8uBwL+SIDjJ8gImeLiptAJNvCIUwyfZ6l0C3Uc43WE0j62EhLaQmqexpDjOmOCnkbr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPjkldQS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3EB1F00A3D;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522638;
	bh=GFised6SOyOQAidEm8yAUitbjqRQiuOOtYkwkhPGTDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fPjkldQSwvN/mSSKl6lS40/mRLhi4VrWgESr1/ZMZEuLJH9omg5xUahd75mFWfNZt
	 pYXFnKcvN0QseyjTP5DPrFpvkYv/RPpmftT6NvKmrN0Mg3XccjSnAdAYD/j4dVMGid
	 QyVNgHMMyIQS4nPMJU2Y6dmfaYkXiTH+t2pO/8q2eFCg1e7/dFD4dft/ZCEX+ihuhn
	 CYEo4cNiZqCxTEDahKKhtuo9sdiKO2REQ4E3UC1qVOeP2MvhW1kaP0F9RLKRMY1970
	 Rxq1Ef06z61He1IlXMI4enQ4pdR8vjtPoPfn3gsgr1xj9JzQQO3L4GycYULOONkmzo
	 HUEgT3YIH78ZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey
Date: Wed,  8 Jul 2026 09:56:19 -0500
Message-ID: <178352261589.2235436.9498498267915599094.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
References: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guptarud@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19065727CD4


On Wed, 27 May 2026 19:13:41 -0700, Rudraksha Gupta wrote:
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey
      commit: 346e9112f3dab91a5cf3100a99ec256ff0b7f0fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

