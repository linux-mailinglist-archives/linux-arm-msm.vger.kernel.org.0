Return-Path: <linux-arm-msm+bounces-5782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3B81BDFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668B3282B93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED184634FC;
	Thu, 21 Dec 2023 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6YG/nl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711376D6CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703182672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ho/Hcsth5WNcdfU5/xCubS2uTkEJrrPZyZ0Y0+D6Mac=;
	b=F6YG/nl6USxmx2l1Bh6YSEAkim4sBVUUJYvKVxcKU0QSoOy1p/qDRtB5WzqRMpMXfJWyED
	+KOR2Uu378fuJ1tngbpPBeex8seIA68fSwjxE1ubCbcqj4A9emtT1N8BF6APMvI5Kt72Fl
	+n0Wi4o74Gt8VfwLmYNmrCVogcaTpU4=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-KWprcEF3PJGBw9YPDA3zMw-1; Thu, 21 Dec 2023 13:17:50 -0500
X-MC-Unique: KWprcEF3PJGBw9YPDA3zMw-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-591202b7fa3so1079287eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182670; x=1703787470;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ho/Hcsth5WNcdfU5/xCubS2uTkEJrrPZyZ0Y0+D6Mac=;
        b=rgBZ4yHwVjt7KHpbIzKShwFvoIhCjeca/ol8q3jo29hF0O6HfGfERca5+wi09HphwV
         kqgaMkUM2QNqaOBX7xXUhMAtry0uhAP3HNA2Wl+iVlW2CQC6DZZMKuGSjoJNYJUT54n3
         Xl/XoB87Vt3AzBtJnVvwoY6kU/JgfzvOM2kquumQCUBdcdTNq5AEA/ABJHHyzZnqjDqB
         ItLB+EoVT8Z0ljuGBAbzU+jar2PD6TpiNbtVqQi46Txamfg1wep28zLE9mxhOH9MLfQZ
         sHCLHCuGYfs6Tk8cmbagPGUSRrXkT11Tzkl7W64T7neht7QZ9LzFhxdwOo3iNYMHGabS
         27pA==
X-Gm-Message-State: AOJu0YzNsSIQHHdOTh5SY6+cxXfxkMNoezQ9INLZzaPwgP5Yo49KmEFD
	cD5tsxY4iyhEJOJ0BwL0hLtfakU1QQ0G7zRz2DlGJmI6gi55dfrWOFAWFZbhUwxaqmYHfgbJ0q1
	DZT+QmkWG8NquPcGpWt5eL1WOVIp9m7yaFw==
X-Received: by 2002:a05:6358:1203:b0:172:bbf4:94fd with SMTP id h3-20020a056358120300b00172bbf494fdmr140146rwi.64.1703182670003;
        Thu, 21 Dec 2023 10:17:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhAvZXrDG0kdNmV5YECNXE1vJEgbSHuQ+Bd//qXX+gQOskJE3awaH+jOEdcjwzdQfcCon5Fg==
X-Received: by 2002:a05:6358:1203:b0:172:bbf4:94fd with SMTP id h3-20020a056358120300b00172bbf494fdmr140111rwi.64.1703182669562;
        Thu, 21 Dec 2023 10:17:49 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b00425e8c7d65fsm1025758qtb.23.2023.12.21.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:17:49 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH RFC v2 00/11] scsi: ufs: Remove overzealous memory barriers
Date: Thu, 21 Dec 2023 12:16:46 -0600
Message-Id: <20231221-ufs-reset-ensure-effect-before-delay-v2-0-6dc6a48f2f19@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6BhGUC/5WNQQrCMBQFr1L+2i9J1Jq4EgQP4Fa6iM2LDWgrS
 VsspXc39AYu5z2YmSkhBiQ6FTNFjCGFrs2gNgXVjW2f4OAykxJqJ5XQPPjEEQk9o01DBMN71D0
 /4LtMDi87cQlRamPcYS8NZdUnwofvmrnT7XqhKo9NSH0XpzU9yvX6rzJKlqyt8Fq5oxUG5wjX2
 H5bd2+qlmX5AbOnynjeAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Yaniv Gardi <ygardi@codeaurora.org>, Dov Levenglick <dovl@codeaurora.org>, 
 Hannes Reinecke <hare@suse.de>, Subhash Jadavani <subhashj@codeaurora.org>, 
 Gilad Broner <gbroner@codeaurora.org>, 
 Venkat Gopalakrishnan <venkatg@codeaurora.org>, 
 Janek Kotas <jank@cadence.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Anjana Hari <quic_ahari@quicinc.com>, Dolev Raviv <draviv@codeaurora.org>, 
 Can Guo <quic_cang@quicinc.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.3

This is an RFC because I'm not all the confident in this topic. UFS has
a lot of mb() variants used, most with comments saying "ensure this
takes effect before continuing". mb()'s aren't really the way to
guarantee that, a read back is the best method.

Some of these though I think could go a step further and remove the mb()
variant without a read back. As far as I can tell there's no real reason
to ensure it takes effect in most cases (there's no delay() or anything
afterwards, and eventually another readl()/writel() happens which is by
definition ordered).

In this current series I don't do that as I wasn't totally convinced,
but it should be considered when reviewing.

Hopefully this series gets enough interest where we can confidently
merge the final result after review helps improve it.

I'll be travelling a good bit the next 2ish weeks, so expect little
response until my return.

Thanks in advance for the help,
Andrew

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
Changes in v2:
- Added review tags for original patch
- Added new patches to address all other memory barriers used

- Link to v1: https://lore.kernel.org/r/20231208-ufs-reset-ensure-effect-before-delay-v1-1-8a0f82d7a09e@redhat.com

---
Andrew Halaney (11):
      scsi: ufs: qcom: Perform read back after writing reset bit
      scsi: ufs: qcom: Perform read back after writing REG_UFS_SYS1CLK_1US
      scsi: ufs: qcom: Perform read back after writing testbus config
      scsi: ufs: qcom: Perform read back after writing unipro mode
      scsi: ufs: qcom: Perform read back after writing CGC enable
      scsi: ufs: cdns-pltfrm: Perform read back after writing HCLKDIV
      scsi: ufs: core: Perform read back after writing UTP_TASK_REQ_LIST_BASE_H
      scsi: ufs: core: Perform read back after disabling interrupts
      scsi: ufs: core: Perform read back after disabling UIC_COMMAND_COMPL
      scsi: ufs: core: Perform read back to commit doorbell
      scsi: ufs: core: Perform read back before writing run/stop regs

 drivers/ufs/core/ufshcd.c      | 10 +++++-----
 drivers/ufs/host/cdns-pltfrm.c |  2 +-
 drivers/ufs/host/ufs-qcom.c    | 14 ++++++--------
 drivers/ufs/host/ufs-qcom.h    | 12 ++++++------
 4 files changed, 18 insertions(+), 20 deletions(-)
---
base-commit: 20d857259d7d10cd0d5e8b60608455986167cfad
change-id: 20231208-ufs-reset-ensure-effect-before-delay-6e06899d5419

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>


