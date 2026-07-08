Return-Path: <linux-arm-msm+bounces-117727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mzAiD1VtTmocMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:31:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E377280FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=flCuY05K;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117727-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117727-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9A63311012B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9354F3F12FB;
	Wed,  8 Jul 2026 14:57:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F923F12C9;
	Wed,  8 Jul 2026 14:57:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522660; cv=none; b=gnki1cdfdIWjQuG6houfmNgwhOcMB11Qb+0M6rXhVVLrYhHX/6IZOanWeVNHzmOpj5JJQG62HBBUDMbsoc3CoDWf6Zm+KZbP2Xh+c1geLPMIW2hEY+wXIAw5P29cC9JbUWlTCKn8FlrEUim2oVmYotRx7qYJEdlZROtxXViyDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522660; c=relaxed/simple;
	bh=KDLziHR9v87L7YzFKWMsbIG18tfQeWYCnKagyHiAmQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVpdbF0fAZtRHR4G89gg1nK+esbc7HuFVC0bPW4g9Eqme0QLgEaoeclDv58Q3kA/mppiMZMbUTYrtux4A058nvkSiTTjGUUDi8Dfwlkeide3Xc5jUm7EL24uBjWqQGeCw0bJJl1fQbx2BrcuBQ0kWs41f7O+uhBi8KBO0EiDKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flCuY05K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618561F00A3F;
	Wed,  8 Jul 2026 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522659;
	bh=n4fEfBHro1YDeWOLVtSNhZ+zrDj8UJz3c/tuj2d+RnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=flCuY05Kv5WAvtI9dGCi4PRTR2+56Hu/5m9RHmrK3tI+tIJB5t/nXZN62KjyWsm8Z
	 fAIOweB5yrTtcG0iwD/Y0t+vCN+h5aSCgzuFrDkslUdPP9N+K0DQhReN4euhwJTaDx
	 d3EqF1x19auFy5PN0bwZMs/UZgpofgVr8YfYd71GEeC1bxiuOU4kjO86CqNzm6h+I8
	 yq3R/zRjvFlVrKqyZlN/vWPMFnzzZEwohu0LhJEzlF+mwqGzbpyzt7bSYRrTH3JU2a
	 E34X20zVGDgmG1T6tOJGosVTUb0dnAO5PTwOqvLR6CgUj4DOpgAXvufgm1O2xITqqI
	 MmeGbLvKw9H1A==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Describe display voltage regulators on SC8180X devices
Date: Wed,  8 Jul 2026 09:56:39 -0500
Message-ID: <178352261623.2235436.16285314192262978808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
References: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117727-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83E377280FA


On Tue, 16 Jun 2026 11:08:48 +0200, Konrad Dybcio wrote:
> Let Linux control these supplies to both ensure a known state and allow
> for some power savings.
> 
> This series is compile-tested only, but verified against schematics.
> 
> Resolves the following kind of DT checker warnings:
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
      commit: ae51d9396f9318189e91578878409d8ada152edb
[2/4] arm64: dts: qcom: sc8180x-primus: Describe the display power net
      commit: 80bf2eb87bfbf1b7bc7b12228cbcc710b0a26275
[3/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
      commit: 0b1c6d2a65fc41aa0d5f6617dd04043384678d61
[4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net
      commit: d5f5c089858f7accd1e4574c0c09d811e90eb51f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

