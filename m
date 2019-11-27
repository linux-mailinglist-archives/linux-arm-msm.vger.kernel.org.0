Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A9710B0F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 15:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfK0OQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 09:16:32 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:35081 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfK0OQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 09:16:32 -0500
Received: by mail-yw1-f67.google.com with SMTP id r131so8400899ywh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2019 06:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=w6PGv6Jf1cx74rxehqb96+ueBxnXCDdC1t93l0UKtKc=;
        b=jPO/2txu3KAjmDmWJccJ1Nzi2WbPvk59kkcnQUPnCvfhcIDVdKkQoN8tfV3H1puWQL
         fS3nkamfS25d/iUO4MK9RWi9McJEXGAVx+erFYTC5gpaJ4hGx+giIIeO+BpKjxTnajPr
         D/1zowgirFfYnDwSmbXAEWeUojRPsCvTUqbBKxM992d+h6DVIGACF5NcB9T4PybSkoFi
         M3KirYdaRgLCarjxYU5qlRT/rePkV+bw6M+Qdv1f+KV7rwRBjpDq89kSFDKiV7FVPgJ1
         a5f500b2B72qTUiHB9aFy8dd/McrMMOLF2XjrMhaQ7z+1wjeDp9Ik25VAWY2ZyXj14bo
         SyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w6PGv6Jf1cx74rxehqb96+ueBxnXCDdC1t93l0UKtKc=;
        b=octM0gDHi1cseNwaEr6a5Wg3KObqmjvwyAAMpCP2G49iVQYyfxs3Gi5tqR/RR1i2cU
         iIDKVkvYlWQXqiWuvL1HLZWaX4Nd8YMIkucfWlbwvkWAHK9HPIPNVvCoNeE+BPHsT2MR
         15KIofMNUzLX1gZ3U/xmUPAXy4lvFYGXI+Qa7NiL9YKeNeGMq4PjPNr7lSYkE2CNQ1Lx
         kBOq1cjEC696LmkPP2hRQzqQ3KMGf74oVHkyIcAr5ySMpLLnKPBvMzg/H3smrzBHbgmi
         WBS0GbsNsb6TabIODTHit4UOUJ4v2AyNn1pi1A5oh5D9I+8M4YDdp6aW1OsIdvYLqMY5
         vZnQ==
X-Gm-Message-State: APjAAAXtQybTfs9f+IWHt4X31beaaHfQToHkrSMOkAQ0WVexsO3VptDO
        YUiL3fqZEeqRRuFuB7JyS4KKEQ==
X-Google-Smtp-Source: APXvYqzWr3WjVFNlWvvG1saJi5xfchjW8dcSq+uJItC3O3wshE9qK53GCaqXqUX0gvKmv1xOiCHXjA==
X-Received: by 2002:a81:c609:: with SMTP id l9mr2926079ywi.37.1574864191414;
        Wed, 27 Nov 2019 06:16:31 -0800 (PST)
Received: from localhost.localdomain (li2093-158.members.linode.com. [172.105.159.158])
        by smtp.gmail.com with ESMTPSA id u123sm6911115ywd.105.2019.11.27.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 06:16:30 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 0/2] tty: serial: msm_serial: Fix lockup issues
Date:   Wed, 27 Nov 2019 22:15:42 +0800
Message-Id: <20191127141544.4277-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to address two msm serial driver's lockup issues.

The first lockup issue is a well known and common issue which is caused
by recursive locking between normal printing and the kernel debugging
facilities (e.g. sysrq and oops).  Patch 0001 follows up other drivers
general approach to fix this lockup issue.

The second lockup issue is related with msm serial driver's specific
implementation.  Since the serial driver invokes dma related operations
after has acquired spinlock, then the dma functions might allocat dma
descriptors and when the system has very less free memory the kernel
tries to print out warning, this leads to recursive output and causes
deadlock.  Patch 0002 is used to resolve this deadlock issue.

These two patches have been tested on DB410c with backported on 4.14.96,
they also have been verified with mainline kernel for boot testing.

Changes from v1:
* Added 'Fixes' tags for two patches (Jeffrey Hugo).
* Added cover letter for more clear context description (Jeffrey Hugo).


Leo Yan (2):
  tty: serial: msm_serial: Fix lockup for sysrq and oops
  tty: serial: msm_serial: Fix deadlock caused by recursive output

 drivers/tty/serial/msm_serial.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

-- 
2.17.1

