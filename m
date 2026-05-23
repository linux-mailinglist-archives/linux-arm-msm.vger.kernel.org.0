Return-Path: <linux-arm-msm+bounces-109459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFBMEc0PEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50B5BCA0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07E6330398BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CC537D100;
	Sat, 23 May 2026 02:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiRLceqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342A340A7D;
	Sat, 23 May 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502839; cv=none; b=HpfbJRZp+EmcxWaQudixWXhP+HHj3Afsq2dcc+B4ZE9axUlsirrqssLOmzAEXFHiPWQjiqwOlO/7DqTKq6rJ7orYvIjt9U3x8b5H9bTF+RH2NLg41tgGi99g8hHwij2ffIYP5oRValAv0COM48gNoCMPhl9cvlf3RD5Rv3p+SKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502839; c=relaxed/simple;
	bh=6d6GiA+VGxcQSUwf9nyugQ3wIWutxzWE9RNGYhVUjok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGtQDdLkbZb7RV5uAimpJWqmNOljQKah0nb0GQXDKxgYiEMnSQiJkHD7YRyGw2j2FcnHZM7RrHjXVJaQJ6AgflanC8SsHSDtkNAkxYcQcZEBmWfUokbE0sXLGDIYWpoOzZO6Regoo6it08JmzwDfdwl0a0p1U5UT7Ld0yK95y2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiRLceqn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0541F1F000E9;
	Sat, 23 May 2026 02:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502838;
	bh=aqL6LXLjuZLB0KgR5UVw0TJsQhnrfEpU5qNi9r+3Bdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WiRLceqnAsxJNI/HAziq4sBwKhhbcQVqcbeN18xvJfAeBNry+o9E1kqO1YDcEGmRr
	 2A+dLjr8/cmqm5BGBXoPO0/ZWRGxUP+KmxvPnc0HDLMwlo51NTURgcghNXSFjAl3G4
	 xAWB+PCGH2K2gbRf9MHbffqM7yUQkvH9Z67VNpAjjCbz1emLwuLJe1pFcwcYJkU2t9
	 UXJnLpgrVhCewq+GXQF9HBsREd0zw98bMi+zi+jlPO88Lu8u6TfABoJ8wfNYrTB+1s
	 +cx0/2vElR0fgCAnQ4VQseAl4iGcZ4uyO+f1QNoQlAQ40espCmS8unH7tzO7NytiyO
	 TUI7ndHTChj/g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	mchehab+huawei@kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	Saurabh.Anand.saurabh.anand@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_riteshk@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_mkuntuma@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY
Date: Fri, 22 May 2026 21:20:03 -0500
Message-ID: <177950280366.1097700.1217163170875987304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
References: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109459-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16]
X-Rspamd-Queue-Id: DE50B5BCA0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 15 May 2026 12:44:48 +0530, Saurabh.Anand.saurabh.anand@oss.qualcomm.com wrote:
> Allow mode-switch events to reach the QMP Combo PHY to support
> setting the QMP Combo PHY in DP 4Lanes Altmode.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY
      commit: 1daf54d8100e0e92c826ac8a2b888008b2571cc0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

