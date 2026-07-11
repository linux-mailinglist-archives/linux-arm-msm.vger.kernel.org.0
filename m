Return-Path: <linux-arm-msm+bounces-118524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yhw3KN+eUmpcRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04E742C06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Aj9SRxsE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118524-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118524-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B03573018D29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D8234214A;
	Sat, 11 Jul 2026 19:50:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC3340A51;
	Sat, 11 Jul 2026 19:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799414; cv=none; b=aFBQ69wUjjGzhexol5IHdQ3uFnQH5PwFXlISldkN0cZDQ3KMBzK33b8Mo0l2abjU6vPTeWjfB4kTVLTPLWyVUqda6jgTjyLumzC5jLdEBC1H0AKR4YQQUEoq0K2mUszjuDW0Yg+Nvu3WEu1Y90ZaXZXmTgVgoPQZG7qGoCnkkRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799414; c=relaxed/simple;
	bh=4TDcWVLTnFVi1l1/Jqt58as0xTJIHO4fn55i5yXx+9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Up97pY99kVKS2p5MzKMkl8e/owA4K+CQpklitRxpT8Q/VOwJAfUDkxzbd0eCYjgF5ZdrtisyEj6BoUov1fCGamM6dsRVvuA+5lchEsZkAP4vFegCLT+7OkqgHu2nxLdOHXSThLTQF/OdZ5pBjAT78PCIbUfuXFwq6H+AB3rzjl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aj9SRxsE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08B51F00ACA;
	Sat, 11 Jul 2026 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799412;
	bh=rdUahqtxJg50ApBQ7w/taQrMHkspc+FmfnbTmXgl8FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Aj9SRxsEvxyqB/wtUbojXM+g5w1gpo6aq+71wgw9mu4hsFfY/u6RevYejNwy8eKea
	 44e7/5G7C6IdArnsOmbCuHxr4+beXitevDaVUDoMoI1gqssoPi+F7SPBaCs/WhApAf
	 +mdbGLpRoWaCFfnNHHpEGNHBVPuDz+kKeukzWnhZfs/J1FvLJGmRH9n8zsvUYPulx9
	 Nis/R91quzW6IotJMm/kvXWXHdf+tnBw34ExqQE4X4WT9MESEjUzIsVeQ+3YCjmGIv
	 yW7XqMeksJcprX0YHwpLARTfjf90ppzALGtWCPN+BRuFHbNvcC9Vc1O2XbKi/CjoJR
	 UfGnMcTZubxOw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	abelvesa@kernel.org,
	faisal.hassan@oss.qualcomm.com,
	linux-phy@lists.infradead.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	val@packett.cool,
	bryan.odonoghue@linaro.org,
	laurentiu.tudor1@dell.com,
	alex.vinarskis@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] phy: qcom: qmp-combo fixes + x1-dell-thena DT maintenance
Date: Sat, 11 Jul 2026 14:49:50 -0500
Message-ID: <178379938620.163099.4648562543382010337.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118524-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:mike.scott@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:abelvesa@kernel.org,m:faisal.hassan@oss.qualcomm.com,m:linux-phy@lists.infradead.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:val@packett.cool,m:bryan.odonoghue@linaro.org,m:laurentiu.tudor1@dell.com,m:alex.vinarskis@gmail.com,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F04E742C06


On Wed, 20 May 2026 18:09:31 -0700, Michael Scott wrote:
> Four patches:
> 
>   * Two pre-existing bug fixes in phy-qcom-qmp-combo that are reachable
>     today on any board which registers a usb_role_switch on this PHY,
>     and will become reachable on more X1E boards as their Type-C
>     support matures (patches 1-2).
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
      commit: e505fc5f96661f3e3afa4267ac9415d8559cf2bd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

