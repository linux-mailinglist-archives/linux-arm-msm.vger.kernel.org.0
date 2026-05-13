Return-Path: <linux-arm-msm+bounces-107459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJjjNIrMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8C539A17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 759E83025DB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BA23B6C02;
	Wed, 13 May 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxF/renb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE793B6BE3;
	Wed, 13 May 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699334; cv=none; b=HK4pWfBjMgUVNZmhhsRa7KJXQ5drUnBJnDRStjcSf0MqyhGeajtvZragXawKnXt5ZSBQq9DpeYlQAorc8x5Bwe3eUSh3yqkklP2RdulshTGRTCtoOLy5WTMBAzTAxUrZINQmrSdhxAiKmKdCOR9Y/rcfzO9oQPkwTAvccvmcMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699334; c=relaxed/simple;
	bh=ChEQK5Z4qExwardb0Vm3D+dWscY1+krchbPzq/MMG2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZrtNUQ68gOMxO0NZphLGZzqET/C0ZzE+wLNyvhMnGKtWsjq9ROFrJBfdtGLih/cmGywfRDJ9DhOcrkAXtXsS8naxNSObNfUQKT6vER4/xrf7N0iiI6Mx7taiumXQTc8XJQJ3p8N/8HHW9rtL+yXU2kJzL5nS58coliInhr8XXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxF/renb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D1BC2BCFB;
	Wed, 13 May 2026 19:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699334;
	bh=ChEQK5Z4qExwardb0Vm3D+dWscY1+krchbPzq/MMG2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HxF/renbKCKgRkvsvi+NX9d/XVM+zoZfZw2lCJ2tSX930Olw6n6YMQvBGksYvzWg1
	 K6Rm8Bm8sZhJnWnxDMraCD3HLrMsOjrhrVOh6aSDV0ajES/gKFhta7XltYH31cBnyJ
	 No/mWB6NYA1BX903MqvSJjje4s+US0YVvv5Kyhs0pGAhhbzap+/dIhJh5LhH+efXK3
	 3WugunP9ehBWiyLgRrb3QYn1b8m3SC/VaCxJectjNo22bC6R7KtNKy2jtS2ww3VPyd
	 4NWCIb0n0iHhMvDuaHxZjU5dSGJrGxwG1IMSfeY9zZb3Mu6jt5VRFzDDHKsjZMPCpZ
	 NK71udmMK2aSA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for Hawi SoC
Date: Wed, 13 May 2026 14:08:43 -0500
Message-ID: <177869930358.1496076.12685318728074032916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506110226.2256249-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506110226.2256249-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84D8C539A17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107459-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 06 May 2026 16:32:26 +0530, Mukesh Ojha wrote:
> Hawi uses the same protection domain layout as Kaanapali, so reuse the
> kaanapali_domains table. Also add the missing adsp_ois_pd entry (OIS
> protection domain, instance_id 74) to kaanapali_domains, which is
> required by both Kaanapali and Hawi.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add support for Hawi SoC
      commit: b758be0232407c760e46466625a7ed6e32c78978

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

