Return-Path: <linux-arm-msm+bounces-102849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yyeJJNi122kxFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4643E4705
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C065300B62D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAC2381B18;
	Sun, 12 Apr 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNrEXUME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9CB313E24;
	Sun, 12 Apr 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776006593; cv=none; b=th+d1/8J6dQf7QVJ0bd0FT1NV52LBSgyRPiSpd/Ks6ufBbJQMkElU769zxMXkmsbUU3HDIuZCzI29K574iX9O88HEOaGrtAXnf84EuZtINPgtYqcH1wsEHArgP+jGoLS0KuSuzeuwciTsvk2YtPs6FIg6U9lsaT9tqOb3aaV4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776006593; c=relaxed/simple;
	bh=6Q9TrAexH6j3xFRDHRXi/lQBR7mf/rF1oo/tXG0V7sU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6Gs4K3RjZUS5vgtbsYJEPHJqz1D+M6ZdgAN4+sb5ZVyXa7mPOhAwvURba34reDpGjCQpW4I3hPast4Da7QPV/i8Wm1TKSKckNc2BUOXC6G5AlkZKs04cEfs7x2uyGRnzOQ24TpgRo0BQfwfVadWJ5Wo1kzS3l0t4HgI9PADfzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNrEXUME; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFD4C19424;
	Sun, 12 Apr 2026 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776006593;
	bh=6Q9TrAexH6j3xFRDHRXi/lQBR7mf/rF1oo/tXG0V7sU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RNrEXUMEwkOz/JD+fxWpOSKO7SKZ4MF2mAAXrBLylXadrhPRJCVMHbT9eDMPS+nRM
	 xwMS4XzdK4VvCPzcjo98aRfARQi5D7LEtI9m0fdNAQO+F5234Oya2kuQos1DDBXCEn
	 w34rDtPdnGQrxanRIUiWPSe2pGZfVBQCZ5Z+HOEUSsG1LGshBDaoBpb0vjU92jBIDv
	 LcDaX2kHLJT9MWtVypoRHTF+gocDKfe5fiQFYR8ZS7SVYoGuLUlEi65elMGi1ijPTZ
	 fMy2Y4pODvk0GOXlWiTLNND8A1lGczsYS2qakajtgp1eJFY7+BiqAE1eBszUh4SXH0
	 VHFNVdQ5fnTIA==
Date: Sun, 12 Apr 2026 08:09:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Vivek Pernamitta
 <vivek.pernamitta@oss.qualcomm.com>, Sivareddy Surasani
 <sivareddy.surasani@oss.qualcomm.com>, Vivek Pernamitta
 <quic_vpernami@quicinc.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] bus: mhi: host: mhi_phc: Add support for PHC
 over MHI
Message-ID: <20260412080951.723295fa@kernel.org>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-102849-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE4643E4705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 11 Apr 2026 13:42:00 +0530 Krishna Chaitanya Chundru wrote:
> - User space applications use the standard Linux PTP interface.
> - The PTP subsystem routes IOCTLs to the MHI PHC driver.
> - The MHI PHC driver communicates with the MHI core to fetch timestamps.
> - The MHI core interacts with the device to retrieve accurate time data.

Nack, stop adding functionality under the mhi "bus".
Bus is supposed to be an abstraction into which real drivers plug in.

