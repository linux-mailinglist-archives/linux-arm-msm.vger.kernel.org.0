Return-Path: <linux-arm-msm+bounces-109448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABAsFNMQEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E548F5BCB25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93983055C30
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08646366559;
	Sat, 23 May 2026 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsxcVGd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C49336897;
	Sat, 23 May 2026 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502826; cv=none; b=KID1mDv2nK4iYRAxp7U42fsazc7vNZ6Ijk0BFc0SaJiEp6bQMBbjHbqMNHwQA+HvnpZ+/aJx1/bW5Updfp7zuECVaLBP1CT6UBNNKBVbW8q1V0kd6FP+XbGBR0ydFdGIbt1qxaM2FPXh524qaGDzH1CP28caS9EtpHdluMAsSfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502826; c=relaxed/simple;
	bh=wftjnZmxvLMhNjTolHZ2rWuIb8oFS7MjBS27hp6Ir2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PryTSSdn8kJ6q1d+5plvs4EzAsWAo04ydMS9afofcHG3kkO+6bcay7cm8K/9zuOghA1W7NbbpHLORsKAXGgBhOTz5jViyzPzKfwwdK+APWtq/2UbDPB/GUaVEVlRyfo+xgU4qFSRbCmmBX4Y3Jgew6fqouh52Lh3zAh7q7OqiZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsxcVGd0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF081F00A3C;
	Sat, 23 May 2026 02:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502824;
	bh=LF7XVPmboUiwtQdmrrFLloQc/eNWHxZImDIrkF4m0RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dsxcVGd0jrGecKAJrL5xHmbkx2IQr6Hd1owjuM5H17PP3xHnfHFKgF0snYqeby1mm
	 cta9nU0mkG+cdi4Ix9JAPFNylq/hFDA326Xohrw3WREaCYam1N12xNekPnXQTjF2PR
	 CWmD7PmSuguIH629ycxJdRYL9kQdN/pFKBXkI1VMeZgFn67GA7RyjNQ21b8kLKj5QI
	 fgn759cJdtXQGSdVZapaQ69gUUHuRZMwJFPSUzEiPOzageaMwZcfEAaMMhA6EFLe0U
	 6siSKCHyLjk2TsAxf7gpSHtStj3AsoMIA2atEnEFPJS8FtUgcdsXtnVHiVEN+B+DYW
	 9Orzf1O1TlNzQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] arm64: dts: qcom: glymur: add coresight nodes
Date: Fri, 22 May 2026 21:19:52 -0500
Message-ID: <177950280355.1097700.16523926522599536877.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520-add-coresight-nodes-for-glymur-v6-1-0bfdcdfce3ec@oss.qualcomm.com>
References: <20260520-add-coresight-nodes-for-glymur-v6-1-0bfdcdfce3ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109448-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E548F5BCB25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 09:42:45 +0800, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
> on Mahua device.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: add coresight nodes
      commit: 1f7d0c42a08d157294b8dce4ac162c2853f287d0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

