Return-Path: <linux-arm-msm+bounces-99544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPZxHfsIwmliZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:46:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E80301CF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27C1131191D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB553A3808;
	Tue, 24 Mar 2026 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+H06+WF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592273A3805;
	Tue, 24 Mar 2026 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323739; cv=none; b=N6xS/4IHVt6XQWCqNXZM5WXTzeFV8u2HfUn8fKFgh7NhbB216xH+/fBT/y5nJMnNimHHFyh6Zhoy2m5NFOm7Xpp/5fUP4yTWkxFPX6niYQll2d4fnKpwQjxbFbJ1jM4LgpL6ILrqauNEezC+HCeWQGZWSNzkcM8LmStDGgUNWmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323739; c=relaxed/simple;
	bh=ATm2k4hOYLq/sa4CeORvPIzDAbCZ5vwyHI1BOXyAfx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eu1+T3+4vgULLWganK7ney9Lb1vkF3Pd6Q8DQT+AUe5kVSFxtqRuSq+F5xn4ntJOa7FKcHq4yyHFj4O+lV/edcG2Zg2vs6y191Y0daE32VNIx2a49+ncFx3vE7dJgA9Yb8i1E8dJhDmlw/GqIRKrycDGuGnYlhBu0XT6Ps7pDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+H06+WF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB79C2BCB2;
	Tue, 24 Mar 2026 03:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323739;
	bh=ATm2k4hOYLq/sa4CeORvPIzDAbCZ5vwyHI1BOXyAfx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+H06+WFZ2zMAwh3gIrEg8HafWXhbw2yzs+HXfE4HvYCJpKf5KdEP9/m6yC8mgFjG
	 qNyG/StvIwOz+2TG6ZE1mJBJQbrFQEj0JcaSxEFmp825GXNX++ScvLSKND37l4cdUY
	 hk681w1jZhMPzkuy1GMuUIGamt8HcPcV/CIlgvvE4Cw7Fbip+APZFNW7928mzplzHu
	 6MbNAetPl9YouZ9nKpabKPYaa2uqBlzDnfnaWjy6f5ead+EmwCF/30MCtHBrzWZqkK
	 Q1cvWu4iJ10lriXAXVXTP47f2tWdNMhEaPVn/uZlF+Ibh618BIn+sQbgZdAE5o07p8
	 JTDPPDOr9jAzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/7] Grab IPA IMEM slice through DT, part 2
Date: Mon, 23 Mar 2026 22:42:04 -0500
Message-ID: <177432372693.35532.14369850092795249548.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
References: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99544-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49E80301CF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 05 Mar 2026 11:55:39 +0100, Konrad Dybcio wrote:
> The IPA IMEM slice addresses/sizes are hardcoded in the driver. That's
> mucho no bueno, especially since the same versions of IPA are used
> across a number of vastly different platforms, which invalidates that
> approach completely.
> 
> This series wires up the IMEM slices in DT on almost all platforms
> (need some more time for SDX55/65) and fills in the necessary bindings
> holes.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
      commit: 4f579c2854c94bcb4410a56e2beaa97987bd1f64
[2/7] arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
      commit: bb947d3b7f47f31b8c100dfc8a6f6aee97297553
[3/7] arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
      commit: 5c50a4d592862b736cb3e1ce2a9ad4a6e767f774
[4/7] arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
      commit: b1c74e5dffb893d35c4a286a64d3f1364018a3cf
[5/7] arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
      commit: 4239fae7b87987e91ddb1de8fa21db9ed96c7de0
[6/7] arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
      commit: 9ccd27d6d60d82f782ebd05fa15b6dd89e13662f
[7/7] arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice
      commit: 7a398b9dc47a9f09a9933ca579a6c10b13dea09c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

