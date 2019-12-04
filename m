Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F70112711
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 10:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfLDJWi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 04:22:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36691 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 04:22:38 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so3085403pgh.3;
        Wed, 04 Dec 2019 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IVKJwWRb799YarBjaEupV/+AZd6qpWqomZcRlxpziH4=;
        b=WcX2X+21VXpOljUqhNxCeK46zXjLUo8kTGe5mIsfYZcHKvnEUoV1Txj7kPhsH0jdRA
         OMpol0ZJqvrLXwqcorERMCCljtLzcOIVLfzwIemYM0Q/+70BkDafXtIF0uw6agGL4QxM
         P4rlJpRK8FUO1hQU+Rdd2bdh3xey+Md2GBSlbSDlauUzRaI8pDt3TnCcq3dhMHL/BL/2
         +oYR5VE6hO0OLhB/MWfGzs5AmHtPR40tQpyoq6Vp3v65CiaIicYd6Sgs2/5twTj5f4Uo
         hwzbzWf/hqJ72PwfrBQxc3SxrP1zt6G2EQ2xi4BlzdY7OCKJTBtvZi6nhb//fjrHHSxy
         uhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IVKJwWRb799YarBjaEupV/+AZd6qpWqomZcRlxpziH4=;
        b=CoLz+3G4UnIF4D3OGIyRkNO8aQlxdVpbtVxZwBgJHLeh+M+LiFaTixmBDHgwUuze2L
         nZ1FcnEiBuoyA6/XdkmOzgXDvQ4rh0dPWGwd8ssTi0NR3ZvkUWHeL5ZaJCMKy5v/sc5O
         h9KEwWBOCjBNnoPdPG7qpmbvd1fxjy8scYP6j2QgfohnnWdxlyspnmGnTnnh6CmdcLei
         THlGsXwOWP95LbXuceKeUIhfCu3XHsP/acaea/p390XMIWtlppsMEwuLe/hh0k5D2Aaa
         Pif2pFjibLyPCQnZcee7Ni7wv0n2ew/aToWeuRPjWyn0cIHJCfjLJpnau7xBNVu2Ii40
         E+dQ==
X-Gm-Message-State: APjAAAWiw9VOZFUfVPQ6pndq8zs3mqaJbJ3GbnV/hDy2QEz4guCjxXmy
        d2szDLd4cTDJ7rDkBIpyn9kugWbS
X-Google-Smtp-Source: APXvYqzDQKWtWwDwenA6XL5voD+1UVsXLDOqKYG9pY5mybFX/4Na4qCmw0oIrmCasNztO6Mk5yIDzA==
X-Received: by 2002:a62:1447:: with SMTP id 68mr2510205pfu.53.1575451357570;
        Wed, 04 Dec 2019 01:22:37 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id k21sm6482914pgt.22.2019.12.04.01.22.35
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Dec 2019 01:22:37 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Some improvements for Qualcomm hwspinlock
Date:   Wed,  4 Dec 2019 17:21:55 +0800
Message-Id: <cover.1575450802.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set did some optimization for Qualcomm hwlock controller,
including using devm_hwspin_lock_register() API to simplify code and
removing redundant pm runtime functions.

Baolin Wang (2):
  hwspinlock: qcom: Remove redundant PM runtime functions
  hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock
    controller

 drivers/hwspinlock/qcom_hwspinlock.c |   28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

-- 
1.7.9.5

