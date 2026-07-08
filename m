Return-Path: <linux-arm-msm+bounces-117744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O2/xJVlqTmoLMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23069727E47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KsnO1C7T;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117744-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117744-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D00D30734CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BE0437106;
	Wed,  8 Jul 2026 14:57:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80A435EDF;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522676; cv=none; b=O6H7IngZmsPglEuauJCNEzpxUlUUVHRuc0JneozPkVRywP7FHSfeoBbhqNBnuN4xoIT5uWapFpuDJlieFFeUc1gOoAgSHWG0ILYzSaBYEcj2WGkNksXK/i2EK0lYDRuth5bkN5MD5JOhrE6eERAN+tpYaifCnPLwuI4uFL+zvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522676; c=relaxed/simple;
	bh=tp52LrfSImDGSo+JlQyXbjMZIj+DCt3H9EfnuYSW88g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdMJip3yetKaGhkBkvpCkdwvW1R7a9XiVHSufoOqFHRkuwBCPULKE8AFSoeJ3+OEbuycE4uagEu7SATt0isskjHLYRrZcCr97ouWbGI9MiNAGhKLelvT0C38UOHEdO9jjJG74ZMp26GLAKNmM7jVS/uFG2x9WeKmJmmlo6HeBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsnO1C7T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA161F00A3E;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522674;
	bh=nOSag16RGbDVov1huGGhdnX22kBaj9opib/mHTetd/o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KsnO1C7TSW0ApOpwgtPr0c1cVeHFREu6Vw3bUiXZWNFCZrDEb1s5OfHdbe6m0F3Q/
	 3k1MTCjsfO//yohbCkCuYeWINsBmiCfjZPN/Zj4oOk2I02HPEz518bvjNLeYYzqiP0
	 EGlAWmo9DGljACi2zP3Xk6NsTC9AEKRVxuXwqkADOXcF9KPQGj9lR2AQTuI0x4wkAN
	 eUUdHDD1XJO8GwfxARrOovDh8rGzW2htlFExD/OXM2eKT0UWa4euGhdIxs0t+OU0z2
	 NxgGdXqH2DOpTK8QRFwa8XXfIM9jwRTnZnjeWdwV67ygbtdxGhWQxmRS46ietTCe5+
	 ehdn0g0qDwoTA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver
Date: Wed,  8 Jul 2026 09:56:56 -0500
Message-ID: <178352261616.2235436.8120334079218318332.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
References: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-117744-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23069727E47


On Thu, 11 Jun 2026 12:10:10 +0530, Vishnu Santhosh wrote:
> Enable the BAM Data Multiplexer WWAN driver as a module to support
> modem data channels on Qualcomm Shikra SoC. The driver is also used
> by other platforms with A2 BAM hardware such as MSM8916 and MSM8939.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver
      commit: 9c1bb154d40b36434e919865cbb2b23da58a963b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

