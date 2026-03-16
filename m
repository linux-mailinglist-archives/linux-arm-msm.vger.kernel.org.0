Return-Path: <linux-arm-msm+bounces-97783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGcGC5Jlt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:06:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DEC293CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00F89302443D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A963101BC;
	Mon, 16 Mar 2026 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf4dh0s4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917A30F526
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626570; cv=none; b=nj5YeyTxqlBNbgZD7tB1M/V4ZugvWA8OEW+3nqzfg5p4gt/K3NqYlYrBhVQ27pQCPWo64AYCjlRVKU4Er1Jqyn1xbQnJcbZ33zXxHgpX+47dN1iHETR9MCzGFGrzabD77z9eRoTPHLN216OkRZHimtLn6Ec6KYICeu5/gWyVa4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626570; c=relaxed/simple;
	bh=5eTuXXEXlT/dINNTg8TMvYv1RKhRsxBFsNbJUFdr6fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDICNxlx5mQbuiyvIl34Ro6Qfb00DcPa01jmKaiEDyUc/x7aCZUHPT1nrF4CGkVsny3kRNDpI4ubAV1wJtmLIgnHyNsytTigbzkoPs50QUeRzgXZugKt2NP7eaPguEdNiTXJWb9dM7ln7tgSVT+Ifh53NBUirqvbsi7gQwddKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf4dh0s4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40DCC2BCAF;
	Mon, 16 Mar 2026 02:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626570;
	bh=5eTuXXEXlT/dINNTg8TMvYv1RKhRsxBFsNbJUFdr6fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xf4dh0s4f7BBGddXUyYsQJLHOPhoqN4QcEPzqvUkJbEP9w4Bp1E3qRY+yQ5FTvCUA
	 CcmG1+xSwVpowSAZlnTJd7WG91shcnTBnKj7DDMR+yHuTiqJz5JkR9krltp/Cihi3O
	 566b2vBFuwYlkHd1Ba9aRQBLr46ToOcfjoP4z36tP49NPbNVoqyzg6hkZv5KhGCGe+
	 ViQ0Fkn9X/9SWpsCK+ZwsIPD6pmwJhHVy5LUwl6Gz6mHtKSpF+RPoJk+8iQn4MHWZf
	 r8XQ8zau/YSZvy2aDR9V4YUcnPa2jI6zMMgj/hP9+ToU4aFPogM6pZVAsvfqhe3HUR
	 P61LKpbbj9HHA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Simplify code using of_root to get root device tree node
Date: Sun, 15 Mar 2026 21:02:33 -0500
Message-ID: <177362655070.7429.3999743992742932111.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224110213.3929063-1-vladimir.zapolskiy@linaro.org>
References: <20260224110213.3929063-1-vladimir.zapolskiy@linaro.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97783-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80DEC293CA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Feb 2026 13:02:13 +0200, Vladimir Zapolskiy wrote:
> A few lines of code are removed by using the global non-NULL of_root
> pointer to access the root device tree node instead of its recalculation.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Simplify code using of_root to get root device tree node
      commit: cdf0e445ee21119187f5551e68ff4e466f8aa950

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

