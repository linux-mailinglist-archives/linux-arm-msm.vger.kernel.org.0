Return-Path: <linux-arm-msm+bounces-98599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP4hClpvu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:36:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B292C5960
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1FDC301E224
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D29286400;
	Thu, 19 Mar 2026 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBJ+8j4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A77175A7F;
	Thu, 19 Mar 2026 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891192; cv=none; b=XPTJiB17gUEWfevbXKHOj0OL0agBe8SeczpKYoc8Dc4sFHiUgW5sAvOinNRjHwwh7cxRHR+552rcMTAkY71ocB/WwWEUJW0Tnfj4gWM2gfkcK7asgmEiTOR5SZtei3rwNBQHNDkI/jw+b/0mWhJdC7i7ZHvApJVDH55GREKRHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891192; c=relaxed/simple;
	bh=uHQRSWsh9XSBxn6ij5HMYn6/ZU1VX+9DmSeJcS2Qq0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luBEXT2Lknl5BN5V0o9ZLPcGzQNxG5+b6ZWWd71AkecTays8mQATWJdddIa4dbODmPrkmXpCHx79vlqovTuo8jQkQMHKBLpNC3dPCgICljCjQnF+5xgHaiJXePVg3owVkswi9uw42Ssts4rth0EKDwyji0E3wqBUtW/auTzDOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBJ+8j4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB93C19425;
	Thu, 19 Mar 2026 03:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891192;
	bh=uHQRSWsh9XSBxn6ij5HMYn6/ZU1VX+9DmSeJcS2Qq0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBJ+8j4Nxg5Qvt1EP0q1LrCS1oZ6WEfe2jWNkYcTS2YFoQMpMjgZ7VaIzmSip6TOD
	 SzrUhVnv1mDx3v0xR9tJNXwz6LANvrmknq5DS6xLSUzWPo7EV1oTwtRVndqT6NXWle
	 5KvliRUccRxUIfdV8cZIArQXnrPdbfVDGJJqHeUIJlTXgnaflt2s4T5FyFF2jrHOQD
	 e0526ChOwCtTykS90RHAUSpleTHBME0MAAaviqRjbzzuHIfyxdwZ7jNVgrJac3beq/
	 zDG9+FGvegIgK8Qu8bvcRAy/WHxOqUmS8o+cJr5R+zWvvaEu4QUP/ux2F9ILMjrh67
	 mCh7gwnQG7+cg==
From: Bjorn Andersson <andersson@kernel.org>
To: robh@kernel.org,
	srini@kernel.org,
	amahesh@qti.qualcomm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mani@kernel.org
Subject: Re: (subset) [PATCH V5 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Wed, 18 Mar 2026 22:33:06 -0500
Message-ID: <177389118147.17526.2779528206757878821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98599-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0B292C5960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 17:38:09 +0530, Sibi Sankar wrote:
> Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
> that the firmware streams of the remote processors are managed in kernel
> and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
> Qualcomm SoCs now support running Linux Host at EL2 [1], this series
> documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
> fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
> hence the iommus properties are left optional.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
      commit: 217fb074eb108075c26ddf96f3456c47e279fc15
[2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
      commit: 46fcbcaa72885e814fa0e4cc306f13af41d086e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

