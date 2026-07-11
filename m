Return-Path: <linux-arm-msm+bounces-118517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dD+jONieUmpZRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7EC742BF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZleJ7h2c;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118517-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118517-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 522043040023
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C932B12B;
	Sat, 11 Jul 2026 19:50:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A6329371;
	Sat, 11 Jul 2026 19:50:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799405; cv=none; b=PuPALAft77Ol7SUA38V8wXKw4EM8neqvPbKKXqacrjkF5XDQWH4nQEEY1uUW8lpuw4+SGKKSu8aTPdJ0jKnamyOawePUR2kB1UWSI59Zma3ApVlce2bBwXjfFNibqikONbvYVEVE246td6Rzdl1nw8eHNu6YmTyoQx25j7ciuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799405; c=relaxed/simple;
	bh=QjoyP1m0r4+nuAwDi5ci4irLloF5DNiR/e9V3viE17Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivnabk1H6IOIVpliyhk74najX+tx3YsR2j3eL4nZRx5q5NBzKGeqCOTgAfunlg6cPjgbigdHyrevN5wdZwZvejZSXY5AJtZmrTmQdE1c5xqciaT/kz6KtW1qrcv5tnTAnz8wagm1EjurG2zjN0CkfmDGz6UJc4CA7ESIkuEYasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZleJ7h2c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA31F00A3A;
	Sat, 11 Jul 2026 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799404;
	bh=C4TXKZrBRp6Vz4sMfZzR8NXZyvfSmNCJEm5ltozR7CI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZleJ7h2ce1/4ys52OET4PocZxKV6z4WYrLLPKe+9KQWdAI6R58kxMbQYuOlN7OmvS
	 kW1ZX5WzichxlVfhECELM1XUo5HwhyO4o+2CS324MaxbtPTKpgSMNrGA/kfdifKqkg
	 MGokP7j2w4acAsrNgWhFmKg2tmV+EPvLzZvtSN6GkzjEpLGcoFxHTuYAEAsu5CFPb/
	 Yc8CUJn3VrkCYRTDhA8EI5fV+VNoRxIwX8UhR0+gjorbo5s9fFh+x+fP15KdYPdb2h
	 7UNe5o5N2NDgMl2urbKFzqu88yPsTnJDhi3BJmda+a+7DyDPp1IvFHfsaRysjBl43Q
	 2xgXc83mwhbVA==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/2] Enable ETR and CTCU device for hamoa
Date: Sat, 11 Jul 2026 14:49:43 -0500
Message-ID: <178379938588.163099.2863497424373585668.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118517-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:konradybcio@kernel.org,m:mike.leach@arm.com,m:jie.gan@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E7EC742BF9


On Thu, 06 Nov 2025 09:57:24 +0800, Jie Gan wrote:
> Enable support for ETR and CTCU devices on the Hamoa platform. The
> newly added CTCU compatible will fallback to qcom,sa8775p-ctcu for device
> probing.
> 
> Dependency of the binding patch:
> https://lore.kernel.org/all/20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      commit: f77ef7a6a97eb29020be430d3125e3b0e0e713f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

