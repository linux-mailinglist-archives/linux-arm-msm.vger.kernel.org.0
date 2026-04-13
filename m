Return-Path: <linux-arm-msm+bounces-102925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OcCMZS53GkvVwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:38:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECBD3E9EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 043D9301AD37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9A02DA765;
	Mon, 13 Apr 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KUpbDffl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312A36404A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073037; cv=none; b=ZolnmbNfuq2LDekpHYEaaWczRGhIzdh0VZYGMb8CIiaYEivTRtO6GIWAMaCNtOz3Xm+PfINuvgu27fRZ0p451DO2SiO9Sh5oAs0gDI5zbRWwovmvyDEWJ0SsfxH/zh2N59bLpGq5MSKec36QxpDwJ/unRDBxjXAXjUCTszUIs4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073037; c=relaxed/simple;
	bh=8cf1vnyW/FNmLWZKxzY/vP24M8biXQIdsfDbPkvACMQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lwAAq82GPP3JVmu5auvX3oMveNBabZG4ufjudYTLbgR0Nj7MAQgyzK4E0v624raTxsciPc+ItJwzgvW9Uu2Z9pAjOUlVpE6nrSI1oMEK3PL9ffL+NeQt1UGQ6pZWvYPolLnjBbVnxZTAhzar94pb1n1MLzxa/9Xm0CLX5H1OCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KUpbDffl; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776073033; x=1776332233;
	bh=8cf1vnyW/FNmLWZKxzY/vP24M8biXQIdsfDbPkvACMQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KUpbDffltdoo8yalC4C2womeLetCiXwmTfOjHctXdNRXfAOpBEOB4W7PEDSKEC//D
	 +o5ExDLcF0sB9EgP03TB+NxR9I0eTPPwsBeeYLpjY72pE8sYiEMeR0v7qt2ZHFy1zW
	 pgzyMkgDniZ6jXv+C4ATzQk7HSA4zxsMA1bvdDu8lz7Y/GmR+Laddz3j+Tpkc3vI2H
	 PwF+seP3GzDkPp+/xcCeMECilHrROzJ0CT0EQ9xi97hg7kwZltNCAxR4zlzx7Y8x53
	 Q2jUTlK1l7NVLx9ZMpjsCQF6X9F5o/0REdSkzvwPfBivjfS2OYoH0Qm5MalDrCuJuH
	 V76degNHRe/kw==
Date: Mon, 13 Apr 2026 09:37:09 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] soc: qcom: socinfo: Add PMIV0102 & PMIV0104 PMICs
Message-ID: <20260413-add-pmic-ids-v1-1-1f40b8773ef8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b1d5201cada4e111eb92ca3c0cb9e7fa433cf6a2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102925-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 1ECBD3E9EDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the PMIV0102 and PMIV0104 to the pmic_models array.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535..3173a9d8275d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -187,6 +187,8 @@ static const char *const pmic_models[] =3D {
 =09[80] =3D "PM7550",
 =09[82] =3D "PMC8380",
 =09[83] =3D "SMB2360",
+=09[89] =3D "PMIV0104",
+=09[90] =3D "PMIV0102",
 =09[91] =3D "PMIV0108",
 };
=20

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260413-add-pmic-ids-7f8364ba62cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



