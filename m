Return-Path: <linux-arm-msm+bounces-91041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK1GM1EbemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:21:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF82A2A86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3FF8304CCC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908C7261B70;
	Wed, 28 Jan 2026 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QonMFsWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB56257854
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609647; cv=none; b=Ma37uViz/pqJ92y0rGGioEv3G0qVlNGMJzEKuLliR4/hS6VtEcW0E7qJY2ZK8l/CfTfb9eX/cXHQ9uaPqhPlwl9lQuL3v4p4bWw4FoFrju8DwAbNR3d0eUrSqrhVFwJNUbSzB79WYkDG1DN1sOH9fPRMMiqIxBndTXA4WTTgWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609647; c=relaxed/simple;
	bh=VZQPtpx66Ybd4yhAHAYKULdlXDwl+sITPXYT2lvDWPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UlduW+niceoaPrCE03rM0R6VqLd8oQnLeJ8MzpcEx/SjjVl4HYsyJsJaa+jpf4Gvoo10qTbpyf7BE8X8oonviitXkCLvTirAvqXxrua9V3HR+F7/ZorCg/F8H6XXdG8boUQIKQK1jQ9LBkyEtZ44yRF6kFF6D0NZP7CWQRk+lm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QonMFsWe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B876BC211E7;
	Wed, 28 Jan 2026 14:14:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 321D66071F;
	Wed, 28 Jan 2026 14:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8013B119A8801;
	Wed, 28 Jan 2026 15:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769609643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ws3luuLYkZ0uOhioCUNbEqgIzoIgh5ljL8mxNOKgJ6I=;
	b=QonMFsWePHktG/indanJbrSHvacEEguYH9qqLfq/orHpuE+tRTtn1vVoKSRb7nPlozZVCI
	A9RVFvKDIa/qN5ghBArp2AVlZgGcHaOpzjlhhWWY94Ag9JqUp7fDFsncVlcqrhmemBb5eR
	wqq87/35VntFmdWiq25QR47ZbWJqcQOB9bJNTCMWipeLgTXST0bTXTdDE3B6gUYZQxdcyK
	lrkcXsTJPo8JyKEVNniSosJ3mfs+LP87LKx7lP/PH8lcqqHlnyq4RCV2Tojl7sa9ulFeXa
	7yaZ9fJe/xrm6XItbCR5bw2O59lgTrAzqqYS0043jcdg8B59jOA1pdvkrid2Gw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Junhao Xie <bigfoot@radxa.com>,  Bjorn Andersson <andersson@kernel.org>,
  Konrad Dybcio <konradybcio@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com> (Konrad
	Dybcio's message of "Wed, 28 Jan 2026 14:26:23 +0100")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 28 Jan 2026 15:13:59 +0100
Message-ID: <875x8ln7tk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-91041-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AF82A2A86
X-Rspamd-Action: no action

Hello,

>> Junhao Xie (2):
>>       firmware: qcom: scm: Add SCM storage interface support
>>       mtd: devices: Add Qualcomm SCM storage driver
>>=20
>>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>>  drivers/mtd/devices/Kconfig            |  17 +++
>>  drivers/mtd/devices/Makefile           |   1 +
>>  drivers/mtd/devices/qcom_scm_storage.c | 265 ++++++++++++++++++++++++++=
+++++++
>>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>>  6 files changed, 481 insertions(+)
>> ---
>> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
>
> This is 6.19-rc7, please rebase on linux-next/master (the series
> doesn't currently apply because this base is essentially a full release
> behind)

If I may, I even skipped the mail entirely because it was not about mtd
in the end. There is a single big patch labelled "firmware: qcom:". I
believe the series would better be split in smaller chunks. Typically
one for the storage support and another one for the firmware part, at
least.

Thanks,
Miqu=C3=A8l

