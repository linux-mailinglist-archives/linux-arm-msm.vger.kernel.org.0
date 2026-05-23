Return-Path: <linux-arm-msm+bounces-109438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF0dI+cPEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E387D5BCA27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8DD83026F15
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADC2335555;
	Sat, 23 May 2026 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl8Nje3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF422E7185;
	Sat, 23 May 2026 02:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502814; cv=none; b=BBsjrxKHQzDnVbzkaXoZs/M62jA2w3zc21aV9szrjTbIqJBel1fjaxr2Ud2Dm/Wf9Q3KdurzDzT9M0/N+h6Q2mqFFJ6TkAsVntEW9XJ5nnGD9l4ueMYNTQETyiHP8gEsG26WmBJVK7MNsUSyNEFJ9CIeoFs85DMv62cmPXtXllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502814; c=relaxed/simple;
	bh=UffqaigdEQGqy5TOooo3xVVwNdOOtiBuoZy+CVz3o7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KT5J+9TtESIezFRXjpE93JrWRiiocuUzDRhjQi9ojTS0fI5plaoFPTF5BceE12/dQAs3E/5lUGHjjRF4osSwK8Uy1Upg8ovQJl9QMtZgIDkXWGKfcfSC33KVA36Hn//VMXmUSiJupMuyQ2iuXmkZEZWJOlAIL5Zdf8LShnEMbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl8Nje3k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543921F00A3F;
	Sat, 23 May 2026 02:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502813;
	bh=8r8qKASl7QFMosBcK2dTONvStH+xJFIHBUAVo+RDqYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wl8Nje3k3Y6rMJTW8tm/QAIbRmSDa+gWVnujbTD4bZ73ErBB1lZ3158uOiIN2w8dS
	 HVnDFfwfRGYbkBetPmATQd6cAhrZW4E0/dzl0Yjkjkb+RRaHN91k1YSMrcvdCO526B
	 qf0imVMYKjhzOltFBHldsRO72I55IydtXqqOdoTDinNNLEmxZQsty+r3Um9PGS7hOH
	 ign3iHWuFS0gv0cjGKjw/bsDcnH5E8a3O1pGw+nBXVWhxiEz3o15wmCk8BGVsIh8cg
	 pKFzQR9He0Nj5NLORg1TBAl+obPLK+EoPBdMxpqHQwIlvbxxD+nUT05FPvNNu02qFP
	 XnnAk48d6Gnvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: milos: Add QFPROM efuse support
Date: Fri, 22 May 2026 21:19:42 -0500
Message-ID: <177950280356.1097700.13421044900858001659.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109438-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E387D5BCA27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 01 Apr 2026 02:24:51 +0000, Alexander Koskovich wrote:
> Add dt-bindings and dt-node for Milos QFPROM efuse. The GPU speed bin child
> node nvmem cell contains details of clk frequencies supported by the GPU,
> which can then read by the GPU driver to select the correct set of operating
> performance points (OPPs) for the device in the future once all the possible
> speedbins for Milos are known.
> 
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: milos: Add qfprom efuse node
      commit: b39a174a535841e71c59661cc92408b710e0fe6a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

