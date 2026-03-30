Return-Path: <linux-arm-msm+bounces-100834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF48JIyhymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:15:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82E35E924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE37B30193BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AC53793CD;
	Mon, 30 Mar 2026 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emiPxOD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB033793C6;
	Mon, 30 Mar 2026 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886515; cv=none; b=KSgQvElrnZtMQIyT+//ST6/J2YzLh9wPCn1jV21vtzf2OKTx1q5ybqVBjYxCGfO+UR3B03RcSUyRyOGd2DYklwcXWg7f/VaMJUhGF2VvjEIGYQiMTxRr92b9TesW75rd+zAoa81oBecgNIETTOgUaaNu70mfJBUFbLkB9HltDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886515; c=relaxed/simple;
	bh=X2liFWrGsprDKgmdtHSltmlPcXtNz3u7TULheLn6zvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C86LW2z1j4uszQ0aJbALCug4hFwmVnZVJ4uQslAVWeBvXHcZtkQHWDUZ1xBmXDdU3QrgEPlJaMIS4HjSFDGyu/5aj5gkAHxXQwW4e+TUiusk6wtrtR2lUh/zRb3uzsqrLFaR4HDl1smcxDD3vu1Vab6jZiDbIRVvVxpibU8Qr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emiPxOD/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D49C4CEF7;
	Mon, 30 Mar 2026 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886515;
	bh=X2liFWrGsprDKgmdtHSltmlPcXtNz3u7TULheLn6zvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=emiPxOD/5+All6iSGFcBDcoawSNb7CB7XH/q+YD37LoCzNk3i1u1dXaxF1kaXelr7
	 igDIM/UhkJVwbV+hKhhh2UhXhRLww2xcW64q4VC+VasmWSsNmAs+C+ArxGYDZKZcN1
	 8hQS75M/WN1AWMOjeQxHKwSoZgzJ7+H1otBEvgGKnW7qbSCJOf/zfBKrDmzUzpeTrS
	 AtY2/engTiU3x+ubYMI2tlMCLnB5m2yiMoX8qqCYft9caeOpZ7KkPYGg5WcONPv/3E
	 /8jxVzLNYSSeW8nKBqpf91BgvHzjVsgZPeayiZ8OLcjQraA2Uv7qrSbq4Yz08FMs9N
	 bejKZYDeRS1mQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: fix indentation in sdhc2 node
Date: Mon, 30 Mar 2026 11:01:15 -0500
Message-ID: <177488647760.633011.10185256476419852019.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
References: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-100834-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0D82E35E924
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 29 Mar 2026 14:12:26 +0100, Christopher Obbard wrote:
> Drop stray leading whitespace from sdhc2 node.
> 
> No functional change.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: fix indentation in sdhc2 node
      commit: 25e7cc37cff444030250abea1ba875c26ff59e9a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

