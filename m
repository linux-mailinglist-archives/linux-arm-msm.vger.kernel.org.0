Return-Path: <linux-arm-msm+bounces-89847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NyMAiVTcGlvXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 05:16:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A329E50E86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 05:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3565C768466
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 14:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C91449ED5;
	Tue, 20 Jan 2026 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+gByRYE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3C43D50D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919219; cv=none; b=sAIvxq3IXI1QJ4Fyu8jCzXcSt8EW2jIxZTLDPAnKVPsYpe8PpUP4/Tt+3sBNw4j3rlrRASF7U9OVsymXEUcjamhc35OzEtc8X0QjBZq1FlTExdRvF7R4j+sde8ckhkuk+pHprMKE1C2hLAhKHOEU70Xkup9DZfrbuxF+jNLJzoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919219; c=relaxed/simple;
	bh=3SREWp5AQuhpQ8ZTpxLinHFSGdQevh/GQ+DofGlz+zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IQAum8D1b0T3TAStpFVqc3nTdEzvWlfEcYi+PVQipHo27crM9gf2GbCQ7EUTolQLjPpLQUBk+dgUkf2Idxet8+f3c0jzozjsUvomj5FtjG/NzfMhPlyww6HkVR83MX6t69p8MmM0kmzzAbGSbE8CjXOK1BuBaRfYiOORJ7WxKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+gByRYE; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f478e5283so4770237b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768919217; x=1769524017; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMi0tfylR0DnWdm3ctlilGvDCJlYZg/nIaJrJ1jQ1/I=;
        b=e+gByRYE7dSAmW2EWBH9N3ryb2W6J/CbYaCpt1NhwsvVEdILb9EXcmRojJdGZRY0vx
         lFBEipe4o5b+hrzGNd7fl+sRdkb+AltnTP5Th4FZp27FU2tvWiniNuBXtX2UQg5XsdQy
         Pmj8g2YH0gtOBbFcEWL2IKe7cUuLDLtAQMOPKaLG1nnFxx54qeJi5PIMthtHMtq3bFmg
         /k9YR+xl/KcWS25rIYHJ0HspRuQlnx39OywGEgJXW8X9SOIQGuQCv3+5/HDglS6ja5sT
         vWqylmfLLDAYDE+1Un/d8zslgI6cLgmmIKOlV8iD9KxI18+GChfd54u0ovQ7bPQFAYa1
         S0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919217; x=1769524017;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMi0tfylR0DnWdm3ctlilGvDCJlYZg/nIaJrJ1jQ1/I=;
        b=utMbD+XGsKA/mBJuq2skt5Yz86raB8+Y0ADHG7gfFW5f2o987hF/+OYjJ1Kxb1TnFe
         DiWgmd9WfodzJ0lQKJZsp4rsUsDXoTZamMRiwCwGezZnQHNEKjyegClDvm4cmbeCa5br
         Fl029lFMq0sHeKN3cik2sQQMswOBvB2kUe63TLvRw4HW+s6KAqhRuRimeFn6teZOogmz
         TEX9AORT0UAFNObGvgZmvpqiiW6Lz3AyQoNlxJLNfjgP/nQibvG8qt6zE5WNRXAvIzmc
         EWlA7ptvBwMP53G6bos7OTdJp9z4OBmH2WWaTKSFJ2nKo1z5ROZaSMlGMxE+fRlWmv9q
         bxww==
X-Gm-Message-State: AOJu0YzbL24mRiijDkVCwhc6X0vX9sQujhWLAW3mnmTTiYgRC7qkwovs
	JwkNZvoMO2swyw7WAEEh+XEy4JPiImANx0eOn1TyYA1U/nTyivez/t+6v2osG2asciYn2Q==
X-Gm-Gg: AY/fxX5UV7TcGRw4AeAbgjn9Nz6GfohGoxkNh5Pyd8D+/ulShf18+4FKq8kho4bFxPT
	4dQjex/V8waLDsgWlUW4vBH2AiKSmW6QwHUq8YXpmw3ynfQ0BTwnf2jLO1EPLGl5lLOJ+vw9hKW
	hkLQdB1vy6joofOgYMjXcWminDv3wy4TZJ22Vl8kj+1T3JJSCORPGOjbD88XFr+S+s/GyNt8a60
	SkGZIFduTqA69oj6XPnRxAXVD16367IBn4sdlyJYWjJYLn2BeDh9O5+nDOhIB6lFzi1xUU4qlMT
	uq72R7dGj1fm47Y3THVEfWKVPz1CT91tzf9dW4S0z7c55V7ijZBufg94KO+leNiPmiUqml9MMOi
	/Jqk87AopTCy8u64QPISeq/Iarg15E6MX4PNxC5Lx4lrAas19iv1u/I8RVfmM5HWcYvOXQB5sDY
	WL5tX7Sm3YZ4uSFI6/xzFn
X-Received: by 2002:a05:6a20:1583:b0:38d:f623:f876 with SMTP id adf61e73a8af0-38dfe9455d7mr14972273637.79.1768919216784;
        Tue, 20 Jan 2026 06:26:56 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf24dd20sm12323728a12.14.2026.01.20.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:26:56 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
X-Google-Original-From: Felix Gu <gu_0233@qq.com>
Date: Tue, 20 Jan 2026 22:26:46 +0800
Subject: [PATCH] mmc: mmci: Fix device_node reference leak in
 of_get_dml_pipe_index()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-mmci_qcom_dml-v1-1-9b334479968e@qq.com>
X-B4-Tracking: v=1; b=H4sIAKWQb2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nz3dzc5Mz4wuT83PiU3BzdVEMzSxMD85RE86Q0JaCegqLUtMwKsHn
 RsbW1ABqG8tpfAAAA
X-Change-ID: 20260117-mmci_qcom_dml-e169407da7bf
To: Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768919211; l=990;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=3SREWp5AQuhpQ8ZTpxLinHFSGdQevh/GQ+DofGlz+zg=;
 b=S2OhsVbilryU5HA4aYBMAty427/dcxFAd1FO2w1g88jwQwxwxY1YRiwpsuQkBKEY9xejdHBGm
 N5aSOKLz6yaA7hkuLew7GuRKxzzvrcrrXyf5JWdEdM4MPoMhnZRtdpb
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-89847-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qq.com:email,qq.com:mid,dma_spec.np:url]
X-Rspamd-Queue-Id: A329E50E86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In of_get_dml_pipe_index(), it does not release the reference.

Fixes: 9cb15142d0e3 ("mmc: mmci: Add qcom dml support to the driver.")
Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/mmc/host/mmci_qcom_dml.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci_qcom_dml.c b/drivers/mmc/host/mmci_qcom_dml.c
index 3da6112fbe39..67371389cc33 100644
--- a/drivers/mmc/host/mmci_qcom_dml.c
+++ b/drivers/mmc/host/mmci_qcom_dml.c
@@ -109,6 +109,7 @@ static int of_get_dml_pipe_index(struct device_node *np, const char *name)
 				       &dma_spec))
 		return -ENODEV;
 
+	of_node_put(dma_spec.np);
 	if (dma_spec.args_count)
 		return dma_spec.args[0];
 

---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260117-mmci_qcom_dml-e169407da7bf

Best regards,
-- 
Felix Gu <gu_0233@qq.com>


