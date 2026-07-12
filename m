Return-Path: <linux-arm-msm+bounces-118567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JRzILTCYU2pucAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:35:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A174744CED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:35:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lwOG6rKu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C64293002B72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B220D3AA4F7;
	Sun, 12 Jul 2026 13:35:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F24313293;
	Sun, 12 Jul 2026 13:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863337; cv=none; b=i9dRrYna7sqY/rDn/xrT7qSBQrj1MJi0lpb/+s6SPl/36Skx7lXjLx0TC3Md/e5vcOG8hbzMAoUOLdnfXprVjbUb/GZUIIFwPabV+O1VkqXneAbk1eDTdSO2TBMfK03EH7FHOdq3PHFyiS49rWuVJzwA1Bq8RxkUEfWWpzXtbZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863337; c=relaxed/simple;
	bh=JtUeMQCih4mrs2WsrmXM73SFd2Lg56RqDDm03M36dHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpq5hFwRQAGKMQw5Ch3KuKrvzt8dVn9NvBG3msKtKkssJYFZngkLqQ3ubiwr5LPMp1eYfkTZsBA6hjSMLkHaJ+TUCz9RiAHbVRgjin7KZu3lDNw0ik2KbQSRZO61MkWryMjrnAduTHLSGYJ/Bh7yA+UgIe0L6XIaTTT9IZAPtIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwOG6rKu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7181F000E9;
	Sun, 12 Jul 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783863336;
	bh=g9WW04gU1cWq0ByKKgL2f3qCoZEv0DQfjDgLf0i8Hvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lwOG6rKux2fGUSuL8Y41jY1oOMShRwMUEN8ASmplnHpeXOT/iJrQtbXhkRWM9bDRO
	 dM3oKUo0sPwEBTFSBqApmZJzGTZuGduQYyRH3mqO5boviJo2IHPMtAcveZovUq9rhE
	 n1NIJvKp2ahkHHnlK2k49ToJm1XonvgoSUDj2VxZm4eZQ66wK/+h86y8KZGFcah0zg
	 hAIqnRwMaxL0HU2EvNEfDGyhejuDjP7aIsWK/y2iYNF16uFjc/63es+TkKZCJqCwWL
	 FuyD9UQXk1mSjvyyEGpZKywPbHpIv56+PO1DyZS08FMisKbHZ2dS1sDyhwWkTXfdUS
	 VM1zDfJR1N4KQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Create platform device for BAM-DMUX
Date: Sun, 12 Jul 2026 08:35:32 -0500
Message-ID: <178386332951.266306.17526458782322664639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-qcom-q6v5-pas-bam-dmux-v1-1-1e9231143b79@oss.qualcomm.com>
References: <20260711-qcom-q6v5-pas-bam-dmux-v1-1-1e9231143b79@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118567-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:vishnu.santhosh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A174744CED


On Sat, 11 Jul 2026 09:34:18 +0530, Vishnu Santhosh wrote:
> Some Qualcomm SoCs using the generic PAS remoteproc driver (e.g.
> Shikra) implement the BAM-DMUX protocol on the modem remoteproc to
> expose network data channels. The hardware/firmware resources
> required by the BAM-DMUX driver are described in an extra device
> tree node below the modem remoteproc, with the compatible
> "qcom,bam-dmux".
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_pas: Create platform device for BAM-DMUX
      commit: fef55450dd4e8511a2c080f9b873e9128240148d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

