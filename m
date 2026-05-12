Return-Path: <linux-arm-msm+bounces-107197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP8/BLmOA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09C529468
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D286A30924D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778C83D4121;
	Tue, 12 May 2026 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I19zlcg2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD63D411B;
	Tue, 12 May 2026 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617432; cv=none; b=Lta3kE6tZCtHpSI3GnlwcxIncxnv33XOyz+BzVJt8sRk1mkStPcatePYun3or2bChssUNCuNZVU6jSt6k+1SGDG3oBUW/3nE2Aaz46jNK+kvXdCxH2qvBYH4vjqTf+34Ch2G5Q+B+cKgkgBg8/EcPW4juFR0rQNSI0Po6a/akhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617432; c=relaxed/simple;
	bh=mL7nDBI4qvElG7gWutZWuWOxiT7JyQRxod8K1+91djU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hc13EWSKbrhm/+7AyUdo5E8sZFeCYokn27GVqqJfmWMsdfDOai0rbdEMzlPgN3OAm1cPRwiurglP16IZo+Tzv9ncsV2qrqKHMO19C0gq23Bpgc2kAaEPJYzDwGwijc8rpkAYdCSeLfrbvMHXZs8+cICN6BBZEUH1PMdacbxkOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I19zlcg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD456C2BCB0;
	Tue, 12 May 2026 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617432;
	bh=mL7nDBI4qvElG7gWutZWuWOxiT7JyQRxod8K1+91djU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I19zlcg2jr+68s4RbJUmgBkcaEYvYLFLdY02Xg6j9ZLCZbeQ2CsULAFshKmEjcdjS
	 I3KXs+IrnqC4ZmIfwfEYTwHXaDIIBD+X/OWUZW3RUIHKRNAgEA6XrHw+g/8syt+jAs
	 yyNN0ccWbhCyY+/kMLKZUlwjVwvqGCXgjj5DwYJrw6YaNyINPO8dX+aiNM+KeLofhI
	 KMhfPDukdBjmVugUIJJaJgtxxXKC0zhp2SjjQujR5DKTMeHC2NY1bPKZbF2Zr90OYS
	 UgvH2J3UwM72KLs59FV9Nc9yCTZeIagzhywMxtkcBQ9Xkp7vk3MV+qTEX1oQAN2Owj
	 JNdn4/K1YF0QQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengchao.guo@oss.qualcomm.com,
	Tony Truong <tony.truong@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: smem: Switch partitions to xarray
Date: Tue, 12 May 2026 15:23:04 -0500
Message-ID: <177861739367.1242344.8281205408356544828.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423-smem-v3-1-582befff289a@oss.qualcomm.com>
References: <20260423-smem-v3-1-582befff289a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A09C529468
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 23 Apr 2026 16:25:41 +0530, Pranav Mahesh Phansalkar wrote:
> The partitions array is currently statically sized and uses the remote
> host ID as an index.
> 
> Future protocol improvements to allow for more than two hosts in a
> partition will require hostIDs to be bitwise significant integers.
> This will result in large, sparse host IDs that generally exceed the
> current static limit.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: Switch partitions to xarray
      commit: 79602b750b96c49e776f1fea7e7e1161831768e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

