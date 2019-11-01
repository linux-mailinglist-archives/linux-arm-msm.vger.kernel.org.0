Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21EAEBC06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 03:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfKACnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 22:43:06 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34121 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfKACnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 22:43:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id e4so5502492pgs.1;
        Thu, 31 Oct 2019 19:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pdCTSNBzXMVNjxxGCg4sNnFLSh/Zm1ndkbOKTDQj3Xg=;
        b=TGI71aBTwvspJiLiByHBuShrC9p+h55vSKn/6uObmDz/WBaIrbtw9VoPVVd87zC67F
         i/nUq9dSm9HkOaJoc+9bADkSKian1Bhxilev7PuqKzCfuzIQJY4V7BRr9s0zeNSH8DlX
         HIlf9ek9jnLRjLtWuB58UxuP8EuwFT8ErF+udgENhim/tfgB3JyrqOsgEFdtmuXBVhrJ
         zIV2F0RY26VNkAgqPvHYtjCJoRfThxg9Sqpuj+BNcTRgHkh3VLUkra63yM9dJ04JxA9d
         Co4sBAWieB54ae5yT3z7r3UQKI97sB6hm4aOzt8I8RzcpgTy1PiRG5d1W22oBRF5oPom
         7WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pdCTSNBzXMVNjxxGCg4sNnFLSh/Zm1ndkbOKTDQj3Xg=;
        b=pdNz6j826zumZXDxgXniGROAHmdEYn008R8t51sDH/NsLi7C3Fw/jsoJS/AYy6yiRh
         9hn7Zfh1h8TU6hwEVrVHaSfQ0Vk/2a24G5YpHTsXK4okgT4jMMNzS8p4lG+PNCs4bEHB
         g1geXisqbKdtiMYah/FrfALcxnhe+DnoX2+VyuY95gnpfhfjsiqBZPCJpLOGdmx49SLw
         f+iRnGDPRw1GMGfimikWbuoFU0vwhQSludnpgIDEHwK5eBn7NMlftlEH8KZzAQDzRy2F
         4di1riK8TdhZSHGq3x3fwAPiEC71IWXrzltaT7kf0umpeGI8pCnh8fnx7af2znCSKIUe
         u85g==
X-Gm-Message-State: APjAAAUQzc2yswM4yC4OqfVBNhvot6E5UKWGR8Pc9+CmM7062ta0tqzv
        a2I9rrNVGtN0PKT8q6GK+nY=
X-Google-Smtp-Source: APXvYqxsUtr/syuVlBUTHzCpCyixPYIDnjIN1yGv0EwxyHs5csyO/t3eaaC6ET2qXt8uFIFHmoJ6SQ==
X-Received: by 2002:a17:90b:30d:: with SMTP id ay13mr12221327pjb.29.1572576185443;
        Thu, 31 Oct 2019 19:43:05 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a21sm3434162pjq.1.2019.10.31.19.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 19:43:04 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] Support for MSM8998 mss
Date:   Thu, 31 Oct 2019 19:43:01 -0700
Message-Id: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Booting mss on MSM8998 is a critical step to getting wifi functional - a
rather useful feature for the MSM8998 based laptops.

Jeffrey Hugo (2):
  dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
  remoteproc: qcom_q6v5_mss: Add support for MSM8998

 .../bindings/remoteproc/qcom,q6v5.txt         |  6 +++
 drivers/remoteproc/qcom_q6v5_mss.c            | 52 ++++++++++++++++---
 2 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.17.1

