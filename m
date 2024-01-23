Return-Path: <linux-arm-msm+bounces-8034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD6839998
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 20:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93FE31C261F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A29823DC;
	Tue, 23 Jan 2024 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZLCqypvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5B81215
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706038512; cv=none; b=bNmpVtT3TMubCB/Egi0MIwYrSTmWu6RGaTSuiWAOZF+ETxmhIrxnIRsag0Q1sKYk5bDZC/H+fCv0RzqOk1n2ax/pba8CsmhfmPy7llAKtXjfbuKY3kTVD7ijfA1guWBi4ZfBWV/pF00dkTaCtKlOyZJswQnD1P9rrEkPQ0n7+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706038512; c=relaxed/simple;
	bh=1ufWa9+DhMazuCg6k/kGAKu9JKJdvlAyAGQCtBYJHHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=hCPfze6w6mvKr6JszMk0hMdUQBkEWYSdIdt5nEX3v75pa1Yiaqg3eC4PjrgoLvBaDXMF1BledMGJY7k5fvn5s/hD2v+B0qLCF5kG94JX0M+g7Ac1khNx20uPLL9+gYx7wRTkRXWLYB87NCvu8q9gALUduy9LLSG1jSzO9xqfpes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZLCqypvj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706038509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H24shksCDeTPX45yEa+ObHdQIbM519gVV0wB9Kkfn3A=;
	b=ZLCqypvj0xtLzQSiC9WCuNc44KWcs27Z+rDRYV4zhDuLUEzHxEw2RAHgsDGDZ3D/2E8Yoi
	NJXGWdzVxoN73m3QMY01f+wstM/gTOO4hYM31WxA8wFnUrtqHkEIiVpwx+UTxQGpeqoRBc
	2GtfeXt/tMwkT6jQ8xcizG+LM4SS+ao=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-trSCWWQoMNuSMD6t-S0suQ-1; Tue, 23 Jan 2024 14:35:07 -0500
X-MC-Unique: trSCWWQoMNuSMD6t-S0suQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ddee727096so5608548a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 11:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706038506; x=1706643306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H24shksCDeTPX45yEa+ObHdQIbM519gVV0wB9Kkfn3A=;
        b=djIxdpoMUk9Y8d2baMXPdwr1W51pKGOGOwBBLbgBt9V9Uv26vv6VPq2KOEznx9Lswv
         /BLwbBEQo4fUibTRe5f5TepIdfdBagKO2R9dgWLQkpNLTcOTpIiXXiCXOqrVtuhiiAVA
         bFwU4DlKlknajny+hbPGNxdr3eKXJUOOvq7Mr2DInkdZxVj2yRFg+sUpEHCg3pXDYEi8
         O2FrmCJlWtfq5fN0xwLq8pwXXReUP5TFfh1mDAPvPo2S8JmbAFADMA8e6mPp48HHh4bI
         zprAy1gYig+8/Pt6/ntRaOVP/MKZFxw8A6nyhN5M9XNA++5r/DwnuZCrhGfOchqbQNLD
         oe7w==
X-Gm-Message-State: AOJu0YznAoEWGubxvK8VTlxxHdSJqfyPuIAqqH6iLx+zXPy0kN+6D19T
	lH1fY01gBrofFzIZrmgiOZy2hhP0lJqV509nLzRr9Oifo5RZqvsOw0LJnkZJQilMkF6zPrg98bU
	9JJGgn/Fo0NfIoYhtX1W1tHciDdHd1V255sm7aJbfCGdmcnPoa7gU7tnPOMgx3A+m2nm54lY=
X-Received: by 2002:a05:6358:27a8:b0:175:49f7:952f with SMTP id l40-20020a05635827a800b0017549f7952fmr4343847rwb.63.1706038506671;
        Tue, 23 Jan 2024 11:35:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG55nVARfi6rbNbtYFtYEGGYgAOCYX6yFXx3Hm30MskjrUGrGE8LCEbfcX1uBv7zLrzCl5LcQ==
X-Received: by 2002:a05:6358:27a8:b0:175:49f7:952f with SMTP id l40-20020a05635827a800b0017549f7952fmr4343833rwb.63.1706038506364;
        Tue, 23 Jan 2024 11:35:06 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id or9-20020a056214468900b00686a4f9312bsm656719qvb.50.2024.01.23.11.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 11:35:05 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2] scsi: ufs: qcom: avoid re-init quirk when gears match
Date: Tue, 23 Jan 2024 14:28:57 -0500
Message-ID: <20240123192854.1724905-4-echanude@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

On sa8775p-ride, probing the hba will go through the
UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH path although the power info
are same during the second init.

The REINIT quirk only applies starting with controller v4. For these,
ufs_qcom_get_hs_gear() reads the highest supported gear when setting the
host_params. After the negotiation, if the host and device are on the
same gear, it is the highest gear supported between the two. Skip REINIT
to save some time.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---

v1 -> v2:
* drop test against host->hw_ver.major >= 4 and amend description as a
  result (Andrew/Mani)
* add comment, test device gear against host->phy_gear and reset
  host->phy_gear only if necessary (Mani)
* Link to v1: https://lore.kernel.org/linux-arm-msm/20240119185537.3091366-11-echanude@redhat.com/

trace_event=ufs:ufshcd_init reports the time spent in ufshcd_probe_hba
where the re-init quirk is performed:
Currently:
0.355879: ufshcd_init: 1d84000.ufs: took 103377 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
With this patch:
0.297676: ufshcd_init: 1d84000.ufs: took 43553 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0

 drivers/ufs/host/ufs-qcom.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 39eef470f8fa..f7dba7236c6e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -738,8 +738,17 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		 * the second init can program the optimal PHY settings. This allows one to start
 		 * the first init with either the minimum or the maximum support gear.
 		 */
-		if (hba->ufshcd_state == UFSHCD_STATE_RESET)
-			host->phy_gear = dev_req_params->gear_tx;
+		if (hba->ufshcd_state == UFSHCD_STATE_RESET) {
+			/*
+			 * Skip REINIT if the negotiated gear matches with the
+			 * initial phy_gear. Otherwise, update the phy_gear to
+			 * program the optimal gear setting during REINIT.
+			 */
+			if (host->phy_gear == dev_req_params->gear_tx)
+				hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
+			else
+				host->phy_gear = dev_req_params->gear_tx;
+		}
 
 		/* enable the device ref clock before changing to HS mode */
 		if (!ufshcd_is_hs_mode(&hba->pwr_info) &&
-- 
2.43.0


