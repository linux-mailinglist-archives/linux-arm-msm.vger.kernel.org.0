Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046544DA29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 21:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfFTT2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 15:28:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34496 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfFTT2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 15:28:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so2101580pgn.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ypvh2MV/Eu/4dYUGmD2ZAtXJ0jn0iCgo7imI77eCqGQ=;
        b=MhcBG8YFBAdgBYanUc3yzCKGO9XxdS5UZoDIKjjB8hfzJQAWY2VupcGnVldZkgVPwu
         XtO3hzYRSYwQKi9yn4vgqAItkg4387EMyi7GQFLDCyy7HfZlwCSda67xopnWKMGeac81
         gZ6oCGChVWZ1PsewxZb6sl724UcEKPEyoPjOkhGSZW8wty/AzO6hchXGPvyOX04aRhed
         duTZAJkHqVZPLkV1EI8McXNomftMq9GHCmPMlugVpw4TNYi/BkjRDKUiQV3FLsTTxjiC
         GfL5e0e6RlL3o8JGwkDd6mo+1WlZQGbQ/+Q9zxqGPnSTDSPiZ+cdPFvQLC2tyIwVlEI6
         z2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ypvh2MV/Eu/4dYUGmD2ZAtXJ0jn0iCgo7imI77eCqGQ=;
        b=OMLGRYbtRHTHyErRX0I+1yrlrVCp+kx4pdBuqdNUiVwJNVWH4NYmiX7r8Zgc2Ddyh7
         Lt4mdHkOk8SMragfwB2XysohC4RW7ZXP01kTcJbl4/jjECkC/xTI/sk6S4tHhokH+08F
         HpG/QmrczY7xX7/LuMnAqA614GrP7KM46odzWD96WQJt5pYqLMbNgauZnjY8tIMCUXPE
         qNMhlOsDnuFRZKNL9H2CFC1tKjLXa3mo4cJ7nSwM+tuHOIg30hLYs/DbcnREJyAWYRWu
         vmcQtmuSOF1GFnZgKVYqYGaKYm0Y7Fg1EGv5B9sKkaz8OwOEQguntYhb23DP7kRPLPi5
         tInA==
X-Gm-Message-State: APjAAAVovSqlgxOjDYIrMP6y2fMGaaI/yA9KwcpRuSQggs+ZI7VGMksT
        3af7guOsX79HawQN2L0OxcISoHB8iX4=
X-Google-Smtp-Source: APXvYqwt/ymzsZoGnT6WyylRRg/oYA9la7SBB7uQP71QG/xAkInFw/R1WXJu2heEOFXbeO2dCBaoOw==
X-Received: by 2002:a17:90b:8d2:: with SMTP id ds18mr1344344pjb.132.1561058931396;
        Thu, 20 Jun 2019 12:28:51 -0700 (PDT)
Received: from ahmlpt0706 ([2405:204:848a:2221:8df3:86b:64f5:962f])
        by smtp.gmail.com with ESMTPSA id t29sm255371pfq.156.2019.06.20.12.28.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 12:28:50 -0700 (PDT)
Date:   Fri, 21 Jun 2019 00:58:38 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] Fix coding style issues
Message-ID: <20190620192838.GA16582@ahmlpt0706>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series fixes checkpatch.pl warnings in
drivers/firmware/qcom_scm-64.c file and improves
readability of the code.

Saiyam Doshi (2):
  drivers: firmware: qcom: fix line over 80 characters
  drivers: firmware: qcom: fix block comment style issue

 drivers/firmware/qcom_scm-64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--
2.20.1

