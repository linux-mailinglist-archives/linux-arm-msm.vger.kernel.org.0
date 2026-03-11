Return-Path: <linux-arm-msm+bounces-97081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMs0EyjXsWnVFgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:57:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102B26A353
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D320302484A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5101336493F;
	Wed, 11 Mar 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqxYFjPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C561346A1E;
	Wed, 11 Mar 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773262608; cv=none; b=LUGMbM6rUIIkhKuQw5qD+45lr2fdNHVK0iz79NeauOS9dts63PDv+jFPJ6/eR/s62WK7l44057h9wvF16RO2kUJIJmxQ0DQzL8wCgyUKabcpqJgCJbATm7nPFo713qWV6nsU+iNGsItl8OtPtzsgx0DkXQJdYkP4ahNG9i6asoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773262608; c=relaxed/simple;
	bh=ZuxXZ/yjRb1eh+ySxu03OG7NoBAQXQ1cGUl3riXZ3Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bb4FgsIrjm2EBIM4CoV4nwTk1t+1HZUK2XVFTVZrhA4bqkRP/oEZvixmt9sG8jcmwrTJQgpc0Ngal2S63a8fQa4Xjjz1tVB8aj4Uyj2qjfHe6b4N4B5kSHxyLndXyDKq9B3rhcosP/8tSZ3YYvX5HnIgkPxr6aJ7TExRKG3ePSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqxYFjPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA58CC2BCC4;
	Wed, 11 Mar 2026 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773262607;
	bh=ZuxXZ/yjRb1eh+ySxu03OG7NoBAQXQ1cGUl3riXZ3Us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cqxYFjPycQhd4TAYAvKz0O+2L58D8sh9n7JdQifBjuW7+KozEi6t4qxTZBvqRGb/9
	 +O7uj1Y2IAeqXt/xomuJQfPiHvrSReqItflDcoTnxArwsurlwq56QvDaEXeBBJ/n6B
	 ljrGJ8cGUXnKizUlgT9Pm8oy5AZHiVgHE1aC/n7Ep9oH8+XxlVSSP2jiPK090KelpJ
	 5jULwR+x6edMy7ARjvde99myGUHl8jvfZLVJfcUJW46bJk8qfZdAq2wxaV41502HIw
	 v5ppW7O7VYOo47RGtneNLkmjZIW+KQ1Us0Y/F/DgLJGjDp+56A7Zq1Nrdx1DIZDFXi
	 pOh6MPMGAxkaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] SM6115/SM6125 MDSS core reset
Date: Wed, 11 Mar 2026 15:56:37 -0500
Message-ID: <177326259464.44574.2308664750619411888.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97081-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,packett.cool];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6102B26A353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 03 Mar 2026 00:41:19 -0300, Val Packett wrote:
> v3: Collect A-b, remove Fixes in dt-bindings and clk as requested
> v2: https://lore.kernel.org/all/20260228204638.11705-1-val@packett.cool/
> v1: https://lore.kernel.org/all/20260216233600.13098-2-val@packett.cool/
> 
> ~val
> 
> Val Packett (6):
>   dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
>   dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
>   clk: qcom: dispcc-sm6115: Add missing MDSS resets
>   clk: qcom: dispcc-sm6125: Add missing MDSS resets
>   arm64: dts: qcom: sm6115: Add missing MDSS core reset
>   arm64: dts: qcom: sm6125: Add missing MDSS core reset
> 
> [...]

Applied, thanks!

[5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
      commit: 1cc317d4188ba2d72c298b5271fb4a2fa1d84c29
[6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
      commit: bb4d28e377cf04fbee8a01322059fa14808cdfe9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

