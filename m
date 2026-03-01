Return-Path: <linux-arm-msm+bounces-94725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPPgFc4opGnYZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:53:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B20221CF74E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C04E7300D966
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05CB279355;
	Sun,  1 Mar 2026 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0h++Pmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF04430BB4;
	Sun,  1 Mar 2026 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366025; cv=none; b=C0w1F+55jOJHvPNIuwd10JI8oGjsotOSQih2vm2JEsWP8rcvqVTivMLrLXf5zCw+IQKpZhaD8EAPAft3ff7WdQMrVTO3BbSwNipbblTom8cPcxN9CeWxKo4myY3Mhk1iDyxMCHlqx1cjd0ahiFLRgiPqzrk8mv5YZF7wx8SRmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366025; c=relaxed/simple;
	bh=mOTu4OqbTqgy+/Vr+D92KQPw8HJsPBeteZFfuCSKfz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4RJa/tnYXvLenyvZ2q1O/KoiwEs1qNHWCvxnSHbLewJF+MoiDq/Eqe6e5tETJ63GhBn80mruY2aZXddppN4aoZKu/SLe94UPyzuk8+KarV5RZ+UGAosi2I4SQeyuPCgsHLqOBzjqhOZ3sBjMq7nCUJY/mDuupQZl1WQiTrJs08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0h++Pmm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DA2C116C6;
	Sun,  1 Mar 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772366025;
	bh=mOTu4OqbTqgy+/Vr+D92KQPw8HJsPBeteZFfuCSKfz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0h++PmmbLGp4Puwt3HxQflHBvdqo8i3AebZwE3wtNgaC+1hl6vixyrIk6DyvgcSj
	 W5eFdjR6Wllpz7oLmSrvfbqMRSiPlJ/2VEhMTxGcglfWiQo4kxBJjz2asoTe4ILpIn
	 hGyCL5lkQK24RPuMlCUJh/Nh41ZDQXdOUK4bHgcvYwQHXNQZklO5DGwxnSg2qtOdiS
	 Y+MzW8Kbvjrns2I9L2ijMOecswwvST0Wh+w7gdjZPkWBhQuPo2c3/guQtE6mUrNxUn
	 0DTx8HYAdIp72UsxuCbkhX6UW/PxDgo5IWB/6GnY6tazYIpEhbsKLpHN5yAfmEEFIa
	 w+/gjhM0iScqw==
Date: Sun, 1 Mar 2026 12:53:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adam Skladowski <a39.skl@gmail.com>, 
	Martin Botka <martin.botka@somainline.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define
 MDSS resets
Message-ID: <20260301-messy-famous-stork-3e6db2@quoll>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228204638.11705-3-val@packett.cool>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,somainline.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B20221CF74E
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 05:41:28PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets, which are necessary to reset
> the display subsystem in order to avoid issues caused by state left over
> from the bootloader.
> 
> While here, align comment style with other SoCs.
> 
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")

Same comment, nothing wrong was in above commit and posting bindings
without reset part is not a bug.

With fixes dropped:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


