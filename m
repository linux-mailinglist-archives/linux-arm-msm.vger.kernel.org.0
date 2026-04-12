Return-Path: <linux-arm-msm+bounces-102856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDhiOIO922lDGAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:42:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE53E48F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE053300E15F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B645233722;
	Sun, 12 Apr 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Xo7VVe1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77287242D67
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 15:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008573; cv=none; b=R+O5zERn44eBlJ4YQPouCnTDMwcb2+tyi9ukJQKdcWHa0BoNMeuMBesF4AF1pS2fqJVJHwqjiNyTjAwAC5yEVTof68dHRQz/hWBi6cFLa2S7jNexUooEl9m1G2MIlRgDrZKHJnkLbovjyi5XWw3iZ7dq5+Y36WLcjelpo+oZdeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008573; c=relaxed/simple;
	bh=WX7rzjdyWdHMalIlp1Y8xJuS2CTkdmTQG8AZ0eVIwRI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1+JxEpBmFC1m0KuPAgKZO8AVzWsMF8yPkjuDCVJ9Djh5nU7kq4DtG7XyGf+SudYvuHKWLK3PlojhkUFmNjWD3EDYeMgiFMRmAki/xIeVXLrVGQo73ulqSfHPidlKpJmxf0ySOk6NLCjxvAw2Q+j+nNVYo5aNW+pqUNLloo5GJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Xo7VVe1g; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776008569; x=1776267769;
	bh=WX7rzjdyWdHMalIlp1Y8xJuS2CTkdmTQG8AZ0eVIwRI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Xo7VVe1gSauov0GswKPEv/sRFn7LE65DyA9ULL/gsqyXde6kjGIRgml7HlOvoAGX/
	 +rYBiZMTNC1tUXU7Z64xrw0wp9sAMB6VvwUUa/J7/jX8XI5HL8f1bkwYI9YaawVoRE
	 1juaorSkXlqo3KcFTx3oITD9/06Cpzur6BALhjhzk0YG9N1Qa//GcoGMbqkFgEoMvc
	 WL0QqMZOCpUrFniHQyQD1YkzKxqTeeF1rDmlypHvjqll24TNO0BvgPBqXqWzTBDywz
	 Oy19YaCub5IVGXIR2WfhhJhEIUrfQOoNoHAEoRVq3Sj3+WyqspUb42O35C+uGRLWgE
	 npY/oBGRiCBiw==
Date: Sun, 12 Apr 2026 15:42:44 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SM7750
Message-ID: <20260412-sm7550-id-v1-2-958a673ff791@pm.me>
In-Reply-To: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
References: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f43b675d0612e93aa1b138c08ebefbaf0d48cade
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-102856-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5BCE53E48F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recognize the SM7750 SoC which is an Eliza SoC variant.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..3f67fbbcac54 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -519,6 +519,7 @@ static const struct soc_id soc_id[] =3D {
 =09{ qcom_board_id(IPQ5424) },
 =09{ qcom_board_id(QCM6690) },
 =09{ qcom_board_id(QCS6690) },
+=09{ qcom_board_id(SM7750) },
 =09{ qcom_board_id(SM8850) },
 =09{ qcom_board_id(IPQ5404) },
 =09{ qcom_board_id(QCS9100) },

--=20
2.53.0



