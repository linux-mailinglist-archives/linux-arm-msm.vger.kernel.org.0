Return-Path: <linux-arm-msm+bounces-95021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBN6EcDOpWm1GwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 18:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C444E1DE1E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 18:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DC20307750A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 17:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5CC30BBB8;
	Mon,  2 Mar 2026 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KV5hO+k2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63C311973
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473972; cv=none; b=Kou6+Spjn1fLHCZnNxFCIEeIUmqUZQXwTeT6dyB+u42zseEi6XpCFDKN1nj6v9d8G6sJPT0gOblugUR52/Agxlm+7HhxU2NzMjap+kergyqySjXgYWPKm77dD6vK7nG52gi4TUPaJZT9rpUSUwIoR/1tSoCcLMMshSZpOa+2kTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473972; c=relaxed/simple;
	bh=E/QQbNzG2Z7vP0qfodZsMsAupQEPUrj3tMHPofxi8+o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iso7Wbk4RIEfhWjaJFfF6IUD68Nw4J0TRxiL1qiZQDFAl6kgiExz1xF2TfUxWgJKW/r8QTxSisXi2F/WZkbD5mwewbyNbVbfGgbNk5nnnQu7iyOCgahji0dfiD4Lhd+oIVGWUOv+1I8o6z2ojiDQpI5U1AzhAmM3LQASksXC0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KV5hO+k2; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1772473959; x=1772733159;
	bh=E/QQbNzG2Z7vP0qfodZsMsAupQEPUrj3tMHPofxi8+o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KV5hO+k21muFhmmVbZabvlsv9oxrv8qJKYsA0SImnfWHaVMkLzJ/Os5mk1Ubpay3B
	 /AsPOK6+bzvlbfhZXlpd2HG84mEeROB48DzQ8arAgleDoyadRC3WFYQ+NkyXbFsJmf
	 dFE5wbWS598AUTwEofXGEo6NZBVVtQ9n2ryazeuq654s+SLeYrq7GpFDDeYhJzlD8H
	 dcueEMYXd2sRzsDDphspBr6tvz3RtT2ijoktMP/+0Cpqr/r+NVqHwDdWXHETHXeedg
	 gTSDevIiktxVXOsFGcW9u/uGIw6Ow6x8p7MoUhgBQDLw6KF7bBBBjEVeo2ofHqCzqk
	 gqL7DF9/aOz4A==
Date: Mon, 02 Mar 2026 17:52:33 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
Message-ID: <11bdc3aa-fd9a-44fc-b416-b3d6157aae37@proton.me>
In-Reply-To: <cdb322ed-cb1b-4c7a-900e-31bf5b13cfa9@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me> <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com> <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me> <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com> <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me> <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com> <3e67a37a-3a51-40e6-9608-2641101b6ee5@proton.me> <cdb322ed-cb1b-4c7a-900e-31bf5b13cfa9@oss.qualcomm.com>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 3f1839d3602749052c007af91fdd697ace92a747
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C444E1DE1E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95021-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,proton.me:dkim,proton.me:mid]
X-Rspamd-Action: no action

I've shared all my results, configs, logs, screenshots/photos - and will=20
add further research notes - on Debian Salsa at:

https://salsa.debian.org/Iam_Tj/galaxybook2w737



