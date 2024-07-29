Return-Path: <linux-arm-msm+bounces-27159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DF593EAF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480741F21DB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 02:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B682BD04;
	Mon, 29 Jul 2024 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5Ournst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8756F2A1D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722219070; cv=none; b=nVMnR2T3G7AlafEd1jaObo3LNhajw0HHiU6ViuVPuGRqCNa72n2MXz3GUqYwy9YZnb63eYK/hIoOCwb1c/AGn7aNyMwwiU1r4CMnr36+BmCnEtamYIEKikNC1/1m13l/E76c2neJKzwMr4aKdoT6QfqCIrgBQCSpolLXWbUCbCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722219070; c=relaxed/simple;
	bh=rzSC/+7MmXGe8fFYbuiaxXZ2dppzDayVi1vNINMcxUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcjXpjR4aQ0nCYXQmysMJ7DHvGifLoJd3A9m7DQJ2oFapguLYFlhX4Ti9Bf1GeXXN6COUZV7pTchi1xpkBSmsFNAGVN07cRLnOe4SOb6h8nYixRDR2UOH0CQ4hOpQ2h6VEtlcQ47fGEhv1L5QW9UAscX0LzPT4LkhI6AMB5d+Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5Ournst; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2ed592f6so33832181fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 19:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722219067; x=1722823867; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iU1x8aVaLzA4F2JnVLfCjUZyWRs33d+LxRoec+AWvSg=;
        b=L5OurnstwAwvvEFn97csILk/bbmQhqohRY7XttVldnBg7Hq8JrbwPfkP7g/UN5s0dz
         zZ6+1Zjboxe2IB8Nqju/4NGgYCRsHuDxaweQ6egyWbAav4KrulPQdLTrcKnd7tNVbn39
         JyfwL7QwgjR0VpVaXjcDOAQOaMZMhIGMosehbRSvGtK2Z2pGX/dHITsVmYoxJc/hzX+1
         jr9oeLzzDjONL2XIC6v93Z1kl5eAvmntTPoYixD5e18LcNfcBdtwkky2ki6qy5pjWenu
         aQOd3c6FnaRixnO4tgmnRKLbf6mlqbgMgVeil6+pOKijqLTLxtFxyaAxR5+Rm4bTtWab
         ZprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722219067; x=1722823867;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iU1x8aVaLzA4F2JnVLfCjUZyWRs33d+LxRoec+AWvSg=;
        b=SBo30+SbmrlRZu3VtxsyBgfrTpy9S1AAFqhGWCrS6+f8OvAd3pRqW1XifOZsYavRdC
         /+zNf5Krb/blpywohb7O7vkJdQShbYo4iV6V6BxUbUzcwpyw4Zw2tQRsdVRjF/kuUtAW
         SyzuIczbDdJS1h//c86ORU4HWJFjS3fbRuuzH8NaNuwu5ablNKknOS7hR5nPmDaMh1sR
         Jah1Dj5lDlXQTkP1Gh/nz7GA4scDTcbge77gt2KS2Pno/Y0/1terBj1xxo2kO7PK/dl9
         aZFI1R/dBiBNw6sGpE1pg1QWk7l79hhQAzKXXUtITJJQD9NtDbxz+Li4ZcRlP4FkC7EL
         r3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCURv31sepUG2UBTmgmTBLuvSOF3Z5VHuYoiwbajsBPVkHDoUfSUkG+6yKT4hEBSbCB2r8KKbb9v8LaNLRoBVB23nktB7ZctmNzOCIHZzQ==
X-Gm-Message-State: AOJu0YyabvJJi1k9Lyh3J8mQWMIRQ8brZtOVb9oKflFri2Ka1xVafQ+I
	wEDbTUKLzp4J93/D6Ka1QL9x2my6R8nCTaQgTLm7yNLHP6YEpELjeRo8Vnt7EXc=
X-Google-Smtp-Source: AGHT+IE/XvWTqnCXyVDdPbcSgR6WZ0jDW/AiwgDef44mOyk02SJU/5+hLBTeP5SZfCg0gb0efKnTSw==
X-Received: by 2002:a2e:878f:0:b0:2ee:974c:596f with SMTP id 38308e7fff4ca-2f12ee279dcmr41340591fa.28.1722219066390;
        Sun, 28 Jul 2024 19:11:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d07583csm11648401fa.113.2024.07.28.19.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 19:11:05 -0700 (PDT)
Date: Mon, 29 Jul 2024 05:11:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: btqca: crash with linux-next on bt power down
Message-ID: <su3wp6s44hrxf4ijvsdfzbvv4unu4ycb7kkvwbx6ltdafkldir@4g7ydqm2ap5j>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Qualcomm Dragonboard 820c (APQ8096, QCA6174) soon after the boot I
observe the following crash:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010da63000
[0000000000000018] pgd=080000010da62003, p4d=080000010da62003, pud=080000010da61003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in: hci_uart btqca
CPU: 2 UID: 0 PID: 66 Comm: kworker/u19:0 Not tainted 6.10.0-next-20240726-13923-gd3ce7ebd61f9-dirty #2722
Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
Workqueue: hci0 hci_power_off
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : qca_power_shutdown+0x8c/0x210 [hci_uart]
lr : qca_power_shutdown+0x7c/0x210 [hci_uart]
sp : ffff8000836f3c50
x29: ffff8000836f3c50 x28: ffff00008337b900 x27: ffff000084085000
x26: 0000000000000000 x25: 0000000000000000 x24: ffff00009276f800
x23: ffff00009276f918 x22: ffff000081e1fc80 x21: 0000000000000001
x20: ffff000081e1fc80 x19: ffff00009276f800 x18: ffff0000de422170
x17: 0000000000061d88 x16: 0000000000000000 x15: 0000000000000001
x14: ffff0000813b3580 x13: 0000000000000000 x12: 00000000000001a0
x11: 0000000000000001 x10: 00000000000013f0 x9 : 0000000000000000
x8 : ffff8000836f3b40 x7 : 0000000000000000 x6 : ffff800080d52e88
x5 : 0000000000000000 x4 : ffff8000836f0000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : ffff00008f56d000 x0 : 0000000000000000
Call trace:
 qca_power_shutdown+0x8c/0x210 [hci_uart]
 qca_power_off+0x70/0xfb8 [hci_uart]
 hci_dev_close_sync+0x4b0/0x6d8
 hci_power_off+0x2c/0x44
 process_one_work+0x20c/0x62c
 worker_thread+0x1bc/0x36c
 kthread+0x120/0x124
 ret_from_fork+0x10/0x20
Code: f9400681 b4000441 f9403c36 f94102c0 (f9400c00)
---[ end trace 0000000000000000 ]---


-- 
With best wishes
Dmitry

