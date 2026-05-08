Return-Path: <linux-arm-msm+bounces-106573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HhJICFw/Wn6eAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:09:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3504F1D21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7883300ED82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 05:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3809B32692B;
	Fri,  8 May 2026 05:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="u63KwXzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB43B286A7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778216991; cv=none; b=Nonz5b4Ml5RRQ7Mr7Mt6RD7X2erpLZh678mbrXJCs8cpWXnN8b5zvB5sk5va3y6cd33Xr8wzL4DW72ofkRm+c+kgohl8LLuD5hJ2GV0aM1KJYwPbsRdAOCLBO8Rth7V3Pg7xc51e0zvYg4aP34dLE8r7LDh62Ym0INveRWLsda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778216991; c=relaxed/simple;
	bh=xzaurgGHc/9x328eT7gWmrd/gCKkA+EYQ5w5c/vjX6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-ID; b=RQk79PIbCMHAwhsvvC8ubBmCeXVqQh/8F9cLuZIMsvsf6GR0RXLrnGit47sBPjs/+CKRegk+ftNVVlhGhHjll9DMNKMoZq6yfhoIlPYNqfPEEXBn8DfvaWPywlNlqw5kindLyz1T0ksp04W1u48GeXNPt5b3QIdUi3YMdbNdHvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=u63KwXzM; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 2738 invoked from network); 8 May 2026 07:09:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1778216986; bh=7xOc/O2Kc1VPNGKvJfJ92ewg5Ij7KJfZiKOqyCpxFv4=;
          h=From:To:Cc:Subject;
          b=u63KwXzMf+u3jcGva7a8CsQyPIpokgODz3ryhyPwY07hSQZdnRxnOYXF0e2884cNo
           7ty58GSpziN4iU+vkIhUjbAv+EUmZR0AoYVRonSjvH1F8l9Lr1FEKhU7Za4KUkMh8v
           xnFAvnuZOhdP9MsQbevM/cRInMNaymF0nxFK55KdSDJDKr0hMJWhd8uQKMjyzN5p5s
           MR1j2joebEuM8Vc9/gupGb/AFXH613iUuu+RQMxwRHzYpn2+kzhfz/Tlf2hkuYG5wu
           VYVsSip7PqmqMIm6wpw+3KXwA0w08SvCQkBR4OsGJxuetNKxs4MFy/0UqZttjkDiBS
           b6kBq+vsJrBkw==
Received: from pub-142.188.multiplay.pl (HELO reply-val.txt) (adamszyma@wp.pl@[178.219.142.188])
          (envelope-sender <adamszyma@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <val@packett.cool>; 8 May 2026 07:09:46 +0200
From: Adam Szyma <adamszyma@wp.pl>
To: val@packett.cool
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add Dell Inspiron 14 Plus 5441
In-Reply-To: <9666c1f5-722f-4c90-8412-19257a4afae5@packett.cool>
References: <9666c1f5-722f-4c90-8412-19257a4afae5@packett.cool>
X-WP-MailID: 5568814aee720c98bb2fa04d760b195b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000101 [caLN]                               
Message-ID: <5568814aee720c98bb2fa04d760b195b@wp.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Date: Fri,  8 May 2026 05:09:51 +0000 (UTC)
X-Rspamd-Queue-Id: 1C3504F1D21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wp.pl,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[wp.pl:s=20241105];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106573-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[wp.pl:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[wp.pl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamszyma@wp.pl,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,wp.pl:mid,wp.pl:dkim]
X-Rspamd-Action: no action

Hi Val,

Thank you for the review! I have addressed all issues in v2:

- Added EL2 overlay entry to Makefile
- Added missing newline after copyright block
- Added /delete-node/ for tweeter nodes (the 5441 has 2 speakers only,
  no front tweeters confirmed)
- No touchscreen confirmed (standard non-touch display)

Best regards,
Adam Szyma


