Return-Path: <linux-arm-msm+bounces-99310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBEqLihSwWn+SAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:46:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220E2F5249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A37CF3029B40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012343B2FCA;
	Mon, 23 Mar 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYnVA2qf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C13B27C4;
	Mon, 23 Mar 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276720; cv=none; b=TUM1K6EQBJaFmB13vRB+x8Cf0u2dU5f72vzoqUQs2wYXahvtsPKV1ZCi3TJ4SwwXTkSqWJW7IODSE+FhpPXM4G/VYjm7HxE4JqE+AFdEwt0FGBN7yPLaJUGyZaUOvTGgiL2BgGbQTUAE90NX4noeiSuECSHZbwpjaU72+0rDIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276720; c=relaxed/simple;
	bh=wHVLPtEevd0p/neAuYji1t9tP0hHKNqikdlod/a1NSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGaf/wd5QKJDi8qWwigU/jGW6WWXTV3xxv1dxCLr64ui0soUQhm/7cJW5LjrwhGr9vF9efdhqje/mnLms/aG1/2t6b1TvsStlFeS4Matnz4IUq/9Z3rHJLYGTdCpwYE34xSCdGcR4/heX+yKJZY+gXC8zhzAoRKx5BvXi2/TrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYnVA2qf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3E7C2BCB1;
	Mon, 23 Mar 2026 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276720;
	bh=wHVLPtEevd0p/neAuYji1t9tP0hHKNqikdlod/a1NSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YYnVA2qfEY6g5NKTol21VGczHkldVbKwiM6H0fJ32YSBNBR8DGMTwBp/mo0doC3hs
	 I1bFBeRm6AABslGiUQPLW8h8TxDq92lZuWNYBo2p4SwNM2YYqTyU/XG/fBnySHOlQA
	 i1rp/vWY3rkdf/PPdH7WeMWFGKVrJj/DAOfD2nW63tVoR7wtDUABEo1oKlWfGAAIVf
	 8AtLJ8kWl+OzvEG0Y770B8d9OXn6ms+NL8C7XnAoHNz+jedbUBFbNdoA2WjybV2Hnx
	 G/EwBrDvsv4PlHY41GSHPq2PmUMme6C52wRgS890yV4Qoy2GnaCH4F9xWo4zCnrUrA
	 8eNIgPcjag/OA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur platform
Date: Mon, 23 Mar 2026 09:38:23 -0500
Message-ID: <177427670522.11515.14416821799177012900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-99310-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6220E2F5249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 28 Feb 2026 20:34:27 +0200, Dmitry Baryshkov wrote:
> Due to the way the DDR controller is organized on Glymur, hardware
> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> Follow that recommendation.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ubwc: disable bank swizzling for Glymur platform
      commit: e031e7ceac4ee04973bd77362c363734e79dd08c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

