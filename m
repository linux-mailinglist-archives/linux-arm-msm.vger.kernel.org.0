Return-Path: <linux-arm-msm+bounces-66719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A22DB11FE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 16:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17CE93AEB54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34381E833D;
	Fri, 25 Jul 2025 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aewIODkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A741E5B70
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452982; cv=none; b=PrrQsRjunRTyPTQq+HwFqKQaB9xfLojBp2cKV42cY+dxeuqMep+4dlobZKtB9uY/EAZ+IOFwrZ+XHg+sPzVc6X0pNkDE8yoMVefFgvelVYqai2ycwejrhm15bfi2KHOOk6RAJDHOV9AiuyuFUp5/MVX1NwBnEmiAdUkQy8ezDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452982; c=relaxed/simple;
	bh=Xip8jE5pNwtMgx7ORp3HsgqbQwAw/yGfdOPBmn7/ojQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgRoBM7+6vo7twQotKrmvQuKPtM94+mL005WOi3kQvdlIT6t06LUMWZpY7w+08pJcnTBfSCBoZ+eZWupR+L3oSG6zd1MlMxbK+t4nekB534tXCIOXxsG6BCQJXPB3DxJtEK/07sFzo3/rVWNqsLaeW4F2k72oowhV46sPW5KiD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aewIODkE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so472805466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753452979; x=1754057779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zam/LW3oj60VYDi/BrVgQJFij9S3YsCyteAYO8PX1E=;
        b=aewIODkEg9trFFgX/WyEvppxJW94tmdLOKvtTmykSw38iiLfu9oiNjJE6xHe1hrCh3
         iHoUfrcynhhRA1UfQFVzNmfj/M1aHhH0yo2UBrcmGgsDgtKQd2c1vVb+ua6Bt++hrIVY
         rDR4c+/PDEw50UjDQ+MLl4Up1EAPE4gwSXnDFpz6EMlVGNdQlgICbBJWLaF/tKDTC45b
         Y7gdjGZKOJL+yh+HY1fjNGjFkNwFRDNYfxDoCtfk17uLPQmTf/1lVnMR9oInYC+QbhgL
         x6vAdmccChLxrLfWtvEhrME5HlyZxSIEN5EpY0cmJ96rjhtEPGped9VPtIPHBIelUdW2
         JCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452979; x=1754057779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zam/LW3oj60VYDi/BrVgQJFij9S3YsCyteAYO8PX1E=;
        b=j6dDvmI3znijyPUDZ++Mkju1trFiLS4kYr/LnJ+jQZHardoISJXM/xTPPh4L19fRX1
         c/CKVxkNNmj+bWBFCY+oTfCtBKoB3KbxKbhev8FxL346lC7pISNpSKwY5niceU8IbRQ0
         ztz2scaji3Q49+C3fett5cno4lL1P4t4YAOtQRXJEu/sksWLI0oYb7HG4i5146kPLVh1
         aIVj6GL+km2EH8uabCGe/KEBF14Mk4osHyK68+5+KvXsCZTcjLFxTfsfQx450Bn5MOZq
         H3RQvVgT0pwlcES0FoimVoHBTb/xjxC+bBmMYuvEkqtPpCruSYcGL8Ns57cTgFpkDuw3
         1H9A==
X-Forwarded-Encrypted: i=1; AJvYcCXm/0cdnyp0fdzMG92wHm+AHZIv5RVzxnG+U1vKaWZROHBLVhhJvi+qHXShcrI7w8J724lfirqThGNeBL+1@vger.kernel.org
X-Gm-Message-State: AOJu0YyU2UiloFk7PyGQMWr9ucLojEKRr/5m+Ejcf01wXgBgSXFNJjVV
	x+YZ9nx0jF7ru0ATemNZVMQKiK85+fnyW1yc6PlL3Y5V5bR4XZ1zhlydO6Mw+wVtPw4=
X-Gm-Gg: ASbGncusvjWIf/3JZvvhHFBKLCuE0oUK2V8zX6ZbhTCk8it9v/A2TPr2lxUe8WBVGFl
	rBk/nYrkktmUMAMHQkBxPaKJO1EvjOQTSJKemfisk47wz16n0XB/6M/TrkqU+d0ywk94lGpZOzF
	R133bRDkqNg5KGR2koMQTt5S1D+MV3+i8G6anZCtg23miwMUm0Pko1orrguCu0gJZ8AYJJ/W+cl
	7291hD7ZK3kaFWbh4tiSMg32wW6EzsOsUD95bX7UZYHYOxaXTdztP9Uby+a3lIynCX9R8nZ6n2N
	ez3hroWCuoN3TA3ZEernwLoLKL05xs7NV1wFnCJ9iU4gNdefYEnjDbIx33VR2tyFD1w5dDivCbH
	6O3xlBzRaxZd1VX7zMYj5pT0k8D7/heQvECmIrVw1Ggp1JIv1rNLlAkDC85v7NPMPIFqTLfj/Wv
	H/ICadAw==
X-Google-Smtp-Source: AGHT+IFX5GnNzDHfFClTllxEfxM5knR3JPoKqdSRHH8rDBPQpxv4Ttm+JHD8dxakGBd8eBWGd9ILPw==
X-Received: by 2002:a17:907:9623:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-af61df52d26mr252419366b.19.1753452978372;
        Fri, 25 Jul 2025 07:16:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f85e60bsm278398966b.96.2025.07.25.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:16:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 25 Jul 2025 15:16:15 +0100
Subject: [PATCH v2 1/2] scsi: ufs: core: complete polled requests also from
 interrupt context
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250725-ufshcd-hardirq-v2-1-884c11e0b0df@linaro.org>
References: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
In-Reply-To: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com, 
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

When commit ee8c88cab4af ("scsi: ufs: core: Fix the polling
implementation") was added, the block layer did not support completing
polled requests from interrupt context.

This has changed since (presumably with commit b99182c501c3 ("bio: add
pcpu caching for non-polling bio_put")) and it is possible to complete
polled requests also from interrupt context.

Therefore, this commit here changes the code to also complete polled
requests from interrupt context, mostly reverting above referenced
commit as it is not necessary anymore. We do keep the fix to make
ufshcd_poll() return a positive number.

The change has been verified using:
    fio --name=randread --rw=randread --ioengine=pvsync2 --hipri=1 \
        --direct=1 --bs=4k --numjobs=8 --size=32m --runtime=30 \
        --time_based --end_fsync=1 --group_reporting --filename=/foo

which appears to have completed with no errors with this commit.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 13f7e0469141619cfc5e180aa730171ff01b8fb1..d8e2eabacd3efbf07458e81cc4d15ba7f05d3913 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5613,26 +5613,6 @@ static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
 		ufshcd_compl_one_cqe(hba, tag, NULL);
 }
 
-/* Any value that is not an existing queue number is fine for this constant. */
-enum {
-	UFSHCD_POLL_FROM_INTERRUPT_CONTEXT = -1
-};
-
-static void ufshcd_clear_polled(struct ufs_hba *hba,
-				unsigned long *completed_reqs)
-{
-	int tag;
-
-	for_each_set_bit(tag, completed_reqs, hba->nutrs) {
-		struct scsi_cmnd *cmd = hba->lrb[tag].cmd;
-
-		if (!cmd)
-			continue;
-		if (scsi_cmd_to_rq(cmd)->cmd_flags & REQ_POLLED)
-			__clear_bit(tag, completed_reqs);
-	}
-}
-
 /*
  * Return: > 0 if one or more commands have been completed or 0 if no
  * requests have been completed.
@@ -5656,10 +5636,6 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
 		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
 		  hba->outstanding_reqs);
-	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
-		/* Do not complete polled requests from interrupt context. */
-		ufshcd_clear_polled(hba, &completed_reqs);
-	}
 	hba->outstanding_reqs &= ~completed_reqs;
 	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
 
@@ -5747,7 +5723,7 @@ static irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
 	 * Ignore the ufshcd_poll() return value and return IRQ_HANDLED since we
 	 * do not want polling to trigger spurious interrupt complaints.
 	 */
-	ufshcd_poll(hba->host, UFSHCD_POLL_FROM_INTERRUPT_CONTEXT);
+	ufshcd_poll(hba->host, 0);
 
 	return IRQ_HANDLED;
 }

-- 
2.50.1.487.gc89ff58d15-goog


