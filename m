Return-Path: <linux-arm-msm+bounces-5784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81981BE15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 19:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE3BBB222F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0287F634EC;
	Thu, 21 Dec 2023 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LFncI2M3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881E6634F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703183129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ho/Hcsth5WNcdfU5/xCubS2uTkEJrrPZyZ0Y0+D6Mac=;
	b=LFncI2M30ih+5nhct24Iq925GUx2ayayi0ltMUJTy1szTBMETGUUywts836Qz1YY3cNnbc
	h2+PcYqDY9bLa0zUKaMbDTc3ukIHOx0kXJCP8pCw7FRQLwTjOGbVhmFSQbe/Nts6U4B90m
	wg9ALsVaeyKixr1E7fdKw4Up8CgQg/s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-tWP5KPosOISHQSqZ43AwYw-1; Thu, 21 Dec 2023 13:25:28 -0500
X-MC-Unique: tWP5KPosOISHQSqZ43AwYw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67f623d7599so11275216d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183128; x=1703787928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ho/Hcsth5WNcdfU5/xCubS2uTkEJrrPZyZ0Y0+D6Mac=;
        b=qZvapZh8uaqoPx1kQ9SEHjTFBYp17v/1eK51Fm7d5KxTE4zG0Nr3I2hQ7LvpMJ/irB
         oIeN/fH/YjfMZWkFmkPqctsFqeNyRwKxq4AvetGetU3I9jSe/WFEa4cD5YSagR0UfvGq
         MIt9vMV5aoTkRooJgUpC3hrsuIuYxroTYzxfdAS2fLNVx2hv8Uo7wovXPguXaL4PVX0Q
         JEpMolyH7eBlgr/BXpg6tGGnhuuczEBcyYu31HnmDTBhtiVQ63CUd9FMtne4+qewbcq0
         VUsmQ1X4ERPlLuauOpGPX5xshBXLI3dUtK1yKd9xGoEBAjFjQmLBbrevAmNzSmJ6SCbG
         AAeQ==
X-Gm-Message-State: AOJu0Yz92GPbbDebvR7W1p6reudMKAq9ACe6yLt3RcbavlYKNfp7S0hc
	4lc6HSO4HLdQbCLb9lji/vnc74TczrPRckTdu6o1ojs2cJh1vJbdM0SQUV85FOzLCmB+lkIBbeM
	WtDcjKGiWxDKBReq/bh+gMRPd7ux/P9bXqw==
X-Received: by 2002:a05:6214:238e:b0:67f:6eee:3214 with SMTP id fw14-20020a056214238e00b0067f6eee3214mr75385qvb.89.1703183127839;
        Thu, 21 Dec 2023 10:25:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElKhU75dRI9W3ZOnTjXDmnKOYqwcpW/uzTdiUJ9Us0xcxEU8rldcNCBiJuFaoPkew12OzOUQ==
X-Received: by 2002:a05:6214:238e:b0:67f:6eee:3214 with SMTP id fw14-20020a056214238e00b0067f6eee3214mr75367qvb.89.1703183127602;
        Thu, 21 Dec 2023 10:25:27 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id da7-20020a05621408c700b0067f2c03d4adsm779605qvb.100.2023.12.21.10.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:25:27 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH RFC v2 00/11] scsi: ufs: Remove overzealous memory barriers
Date: Thu, 21 Dec 2023 12:25:17 -0600
Message-Id: <20231221-ufs-reset-ensure-effect-before-delay-v2-0-75af2a9bae51@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2DhGUC/5WNQQrCMBQFr1L+2i9J1Jq4EgQP4Fa6iM2LDWgrS
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


