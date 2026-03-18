Return-Path: <linux-arm-msm+bounces-98497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNiJBT+xumkVawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:05:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A12BC991
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 451C13047AF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB73E7142;
	Wed, 18 Mar 2026 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzCbp+tB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A8E3E6DEF;
	Wed, 18 Mar 2026 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841877; cv=none; b=I2y5IDt9C1h9XcUo3Ux3ODGxG9VPCxfW2Lne9/Jj7g0XnxnqFTlp7n7YjC2xB0KatZcbwG+NMu5QoCHi5cOuD37/ue0qbS7m3LrIrsYud8aUZmJ8rRU6ETlnz3y6Z60fjUXIhkjjIahCufZt3A4DY9c+wANiU+/SwBgbdfINbcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841877; c=relaxed/simple;
	bh=hCzS4fjOCoDx3tbmVgWNGxDveXAJo/jypQE+2l+J97I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KoWuq8iKxn3cPVCi82V/nZ9JHTK5PEWzW/oAktmK63nZhUrsX5AZzbYy6vAtTdwMSZZcKZRis/RTsCg1VZ1eJ/QZATnTjsrZll36er8ZXHmKUzJzSDS7zAs1DdlZp30dUQsuFvw2HrKPtsKgSe4RcFTRmunSVAjav1G2uur9Kfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzCbp+tB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4939C19424;
	Wed, 18 Mar 2026 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841877;
	bh=hCzS4fjOCoDx3tbmVgWNGxDveXAJo/jypQE+2l+J97I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qzCbp+tBkMVQNYrfUluZeRcq5ufs3hs4J6XjmWCBTYMSYptXTdURxXKQuhcgldzsK
	 dWbMgB6CfcSnhDFX0UK6cMGls2hXLOzXvQ6ME3DmdkKL7I2qk6zu8hUnRGqHrxpcab
	 iI5gml58yOYzJ8fNZYn8LMa6vJ3nkRYjGlQoWC2XSwD0GgieTHLyIGLcE0+MYkM9U9
	 lc+o2P8e/AmWZDX3wU0J/f8s1+yNbWARnHUQVbtUq+3qakvj9vjMAMmdpscyCgauxK
	 IbegC5JV1tOSeguWeKwDX/iZNlVP7UYvi+7NsKTXb6bdFSieRWIcyk2wJsdjCmnpN2
	 nDK9PKTlIZwqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xilin Wu <wuxilin123@gmail.com>,
	Molly Sophia <mollysophia379@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8550: Add UART15
Date: Wed, 18 Mar 2026 08:50:28 -0500
Message-ID: <177384182900.14526.11847836011562438470.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212-sm8550-uart15-v3-1-b90405f94bec@gmail.com>
References: <20260212-sm8550-uart15-v3-1-b90405f94bec@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98497-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A4A12BC991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Feb 2026 10:41:25 -0600, Aaron Kling wrote:
> Add uart15 node for UART bus present on sm8550 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: Add UART15
      commit: 45e8c9052a5070fb83ca581dcd12b955c9dcbe89

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

