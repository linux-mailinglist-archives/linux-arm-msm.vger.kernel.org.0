Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC4627BD0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 08:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgI2GWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 02:22:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgI2GWT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 02:22:19 -0400
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0A9721D92;
        Tue, 29 Sep 2020 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601360539;
        bh=hdLpwzIEn1wy3uDTAREaWYdJP/gbt2DJXn471lVrSfs=;
        h=From:To:Cc:Subject:Date:From;
        b=0oQe70aZ+tQ44ctmB7SsKb2taw0Hrc9ni9NjAcjb71kGB7ks0VFNh2bW61vW3hCzg
         g7ss9Axw3JET9nWGKySn1rdeB+SWGJsjsft3WcsRcMUoSbcyuRkwrXdzWcDXyFf1y8
         wiHPPfA+MtOQ4H9s9wCPAoi3wIbtKzcMBhwz5zeE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kN91j-000cE1-Jc; Tue, 29 Sep 2020 08:22:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Some small cleanup/fixes for SPMI driver
Date:   Tue, 29 Sep 2020 08:22:11 +0200
Message-Id: <cover.1601360391.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

While double-checking against yesterday's linux-next, I noticed
that those two patches weren't merge yet. 

As you replied to both with your Reviewed-by:, are you expecting
them to be merged via someone's tree, or are you intending
to merge them via your tree?

Thanks!
Mauro


Mauro Carvalho Chehab (2):
  spmi: get rid of a warning when built with W=1
  spmi: fix some coding style issues at the spmi core

 drivers/spmi/spmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.26.2


