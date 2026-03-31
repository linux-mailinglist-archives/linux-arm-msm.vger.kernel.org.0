Return-Path: <linux-arm-msm+bounces-101087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lf+JJrry2l6MgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:43:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC836BF01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7E67307840F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6922BDC2C;
	Tue, 31 Mar 2026 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf6BRFSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0747410D1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971150; cv=none; b=ZDD+lamsMVFxE+/oIpufz6DKgdDfw68yo1ruyurekJ289GqELV+xTiaXhV46vLf+phY/sXXQzj7vxM6a5d/614Cl1G/70GqcJteFWakxljnjZYTHbf1nM827bTVsFPQvnxeGJGez5si0fmGTpdAuGkfbR2Bz8OvRRfPDI0PWcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971150; c=relaxed/simple;
	bh=07COx8t2X+hjjjtUzBkzjAKo5dekCAlvLYFjCV4qPuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hq1x/L6hyoamHTA0VnD3shJHo/yERuW01IWqLL9cL0XL3akAgYZbXV8dhx5/alf0x976NvxhfjA7VUMTZp/VMMNOG2gkJ3f8lU7abfUCHHP97HlqY2lgPG6TxGGH3s/uR7MU5CIldZa7zoAvcKfVJtcZn+qYiCb7/Tm/f7uy+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf6BRFSk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso855206566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971134; x=1775575934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CajCLer9zDfIuUqNg+GkOvqWEkudlgIu9Wnppv2wwk=;
        b=jf6BRFSkM5JwT48IR9f3XoHqXCrT6Ii/GhkLk3LJqRZ77Jdr8oH93IPcF5kZHT03Xg
         PgVkMFEd2wZX7k2y4dmvVYnKDevMjGsrf5uQ9ouklZ8Xn8wT/GKjSPWA8aJBlZ8tYLto
         bbYI5Awu0BlFWxFf2nS15ww/8xY9X/Iwq1eqC6JHstWs7hwHn6bflwzNG6nporoXVUr6
         2y2oJprk/tLBfMIk/ElgyELiH+HyFCt28OvGEGBjwgOCI+jJnNAirRiGxgNj4cEE5v/N
         rTp+avCZYDyLmmDGxeew/IYpvQMh/l9Bygabk7N1qKWMzPGRGaeycKqgI9GV34FqDe4J
         UFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971134; x=1775575934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CajCLer9zDfIuUqNg+GkOvqWEkudlgIu9Wnppv2wwk=;
        b=ELnyfgXpFP5VfWOUoVnvWvOJTVaFDkgRlmhlYsSpN0dnqkF2Q0IC82L2wBf17D2/i7
         HxscEJmGSB+fpV4w838fTCSLJVZqbPp/dYx4avrCNC6UK4/A8Bhg/4y/m8J9flaRyQnu
         R0ZTXdjrmGl+EhyjMrWCy2spHSeHHbyfEkZ70Pef8hU/XhJ6tHaxSarEmFeXbrsaDkXA
         shHbTz5LSPVP12eKDzU+1e+0Hd3mXwwz8ctaUhCcUTz4dXIE62AqS4zEQLRV10160MU8
         bmwD4aWQVit5zDNumkHzn7LInPaWIVQxmir+lItHFMR5b9vnrcLN/pID2fvkzZbugumm
         ua6w==
X-Forwarded-Encrypted: i=1; AJvYcCVI6RmMRSQ4S3cXemyowb8nFY67wAnEgRUPeAKfIf+16mGrugTk0DIIJv73SiIUgTR0nz/AGffp1nJKa/BR@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmpX0sJuMyYo/Xn7muqb2wREuZHBKs9rD3ipbAEbSzc4bAh3p
	jnuxOsThRS+jaqcYF+oYfUSmb/IJ8crn/Cdfk2/QKs2XlhXEUSY7LeMv
X-Gm-Gg: ATEYQzxNy2N0hs1+Yf2mLLGIb52c6St+TTemYasHs6rhPasz/1YF2lXMcwWgJN1SrsB
	APlYRFT0VCn7ffHfuoAnwh1A3j6kmnuyLjR7yecbaJ6kpkejRiATJoA3v57QrP4fGclDIWh4owK
	J6Tyyfc6q0UOoBF5RY7lgRbE9v0g5kM39ThIZDuHbzaQi0/U2dpBjWWiQ7RIh5zs7a520OtLWu4
	2+aKWy7bsiIT3DAiZfLJC7lWLfD17alqVKSjgtd+qgFl+RlKNhWBdV0qEEAnBDJeTNcI1YXX0lb
	SPMUt6pd9q8AEXD0DtLb7HEJH0BNhqbuXa2GVdFAPI4cE5z2GPzIUqI7vdEOpZtvc6SJhbknmym
	8choSqfHJQDx5a/xsV3LuXDP9suZD5hyqLELbUA2B5OdHCakRXf0cNsTzuwv5tEF41ji03T/ZmL
	+Jjl0rPWcckCAG8sYKdufxSw==
X-Received: by 2002:a17:907:d0e:b0:b9b:132c:a590 with SMTP id a640c23a62f3a-b9be835c18cmr238854966b.4.1774971133547;
        Tue, 31 Mar 2026 08:32:13 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e472dsm419536966b.50.2026.03.31.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:32:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ufs: ufs-qcom: Fix spelling mistake "retore" -> "restore"
Date: Tue, 31 Mar 2026 16:30:49 +0100
Message-ID: <20260331153049.1344957-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coliniking@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DCC836BF01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 5a58ffef3d27..bc037db46624 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2810,7 +2810,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 	/* Restore Power Mode. */
 	ret = ufshcd_change_power_mode(hba, &old_pwr_info, UFSHCD_PMC_POLICY_FORCE);
 	if (ret) {
-		dev_err(hba->dev, "%s: Failed to retore power mode to HS-G%u: %d\n",
+		dev_err(hba->dev, "%s: Failed to restore power mode to HS-G%u: %d\n",
 			__func__, old_pwr_info.gear_tx, ret);
 		return ret;
 	}
-- 
2.53.0


