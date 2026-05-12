Return-Path: <linux-arm-msm+bounces-107187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T0bMFVOOA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09C5293B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EE16308D9A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876183CE4AC;
	Tue, 12 May 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq0iG7JG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2903CDBDB;
	Tue, 12 May 2026 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617424; cv=none; b=nUliDTlgEoLK79BieDoAwrvufozdLhf4zVkRrHeGoRWAJ51bnQSJJsO2ibmRw9Ou+G94/G5d9+pW9v1TwoGzR2WKjnBaIbMHyEzyg7FV9/bHyQEDK7tPDRJ4aZJ+lBcjasxobp0LO1p1Lg/Ht2RjbS9LliUk9QqL7gth3PdHyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617424; c=relaxed/simple;
	bh=0uXaqFZqOXXjI3hTPgUJkGUOGcZ5uWWyeHUO/wri+xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hETxW0zgk36KGXLUSmCJeaii1nSc9ouLxwujSCh4JwhVKqZtkTS3uK3ikZ7cyOOWKx11XD54MEbM+aVhjYRE0nlHXj8EoPK15XXWPPtI/ccr8oAQkSPs5PSMmWYYbqASwQqR9wSkPb1U07PptIEP7K2abznl3uCLOdbuRi67mZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq0iG7JG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF58C2BCB0;
	Tue, 12 May 2026 20:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617423;
	bh=0uXaqFZqOXXjI3hTPgUJkGUOGcZ5uWWyeHUO/wri+xM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qq0iG7JG3Py2Nw5Xcd59aUvHKfkengSwMbxXfjCknyyipOxBlMP/nE0q95EqAlbRU
	 67g38oToAnJNQDFnqxiUhsw/9e0T2ZZwyhI7TxvRLMbgjRJ0uz5RpJ2a5ivmA/uJTF
	 6VDoi9uHBiLjfcQRXtk7LBvkFL2/zO+/ZqVNv7K3QE7IYpppvsqNpiZa8+9p/36JTR
	 EdkPKQoQi0NfCo83HgI4zdcoro8HMuR6fmQAM9lBYmB2cG2WLDgM7KSObw7ENkKIUM
	 YqKa8Iok3mTM32K0CmqSHrklRvEtCw6u4hDB0+Y52BTjfmAhLPkteFOt3Io20GtTTO
	 Ya2s77EROh3Qw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add PMICs that ship with Glymur
Date: Tue, 12 May 2026 15:22:54 -0500
Message-ID: <177861739387.1242344.733254593659544046.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-topic-glymur_pmics-v1-1-26bdbb577000@oss.qualcomm.com>
References: <20260410-topic-glymur_pmics-v1-1-26bdbb577000@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A09C5293B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107187-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 10 Apr 2026 12:05:13 +0200, Konrad Dybcio wrote:
> Add the missing REVID_PERPH_SUBTYPE<->name mappings for PMICs that ship
> with Glymur.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add PMICs that ship with Glymur
      commit: e225c13b15bdc91b7ebb6d8b4474e455dddfe467

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

