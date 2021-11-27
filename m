Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1C245FF70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Nov 2021 15:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhK0Otz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Nov 2021 09:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhK0Oru (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Nov 2021 09:47:50 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BB0C061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Nov 2021 06:40:21 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b40so31578188lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Nov 2021 06:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=HnJAdt0OLJVCvHB8xx+NdIE3pOX9mwfhfEohYBdeZKg=;
        b=cfQjePs9fFWbZu6rFf7v6wK39og9xDSSqEOLbPC7JHcCILB4VpIHm39sc1dqRacTTw
         8+wmsdxqrPn5DQVHkaGWfOY4dLtfHk5OP9gc5WQ1vRe322DEYnHMWtMGuLfged/yjhmw
         cP+5lbQIItQXAVhoxgLECfJr0t/n0+KIPRsQRo2KWHiMPsw9/25DojQasVB5fcrVIv9I
         7cK61duXU8vFt6YPpwD8eQTx2OEK+xGUcKtCIdE6iG3Br4IOCMmY1gXZ0mG77aTGXsdX
         5RrFaIyJpfWsLyKTYhzs+or2qKFIJd1IZcB64CZE4BptntA9wInHiYtyBSQB7oihx00G
         IEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=HnJAdt0OLJVCvHB8xx+NdIE3pOX9mwfhfEohYBdeZKg=;
        b=uzvuk9p2kTFLOBr+gpzU98MSlPYqDaquBHXapJXb7BQclis7lRP7ZZxXWaUhStgiSQ
         BXHpQNWMJ0fVX06SR+kWFsKU553QwT0xqK3SxiY2q1ibReTOxGnxUDRHRUsGQ+jhUp1j
         8eFdX00us/HD1pOuzMO4bnku6niytf284YbrTGfIocSekE1DlINtkK8ZZpOYEq/UC8OU
         L6dKIR5Md84iPfxKLwnxJCuiQ7B9fCRYaYwwh1ck+zPcQmxd0Y/ZVPMuyGiXJ4R2AK3x
         dfyzxvKsavpEeBH9XxGTF9BVZkK3OmeLMpG1BHEME+b53UAGuUwBh/pQM/yQ2wBFbeSp
         Zr2A==
X-Gm-Message-State: AOAM530G40ON9qTx788NmWLC+tQzhuZN3zbct3X9B4jAB1Ok0vC/6BBO
        d6upA8mI+dEva4GIbshNzvJHQp3lI0Q=
X-Google-Smtp-Source: ABdhPJwJ718Yg7E+bnwOFXJUqt9CwvHCguD0x+ldrwJDdDhtAXhTY1QwUbXh55ycTDKfuNLqZoHE1g==
X-Received: by 2002:ac2:4d97:: with SMTP id g23mr29063857lfe.200.1638024019518;
        Sat, 27 Nov 2021 06:40:19 -0800 (PST)
Received: from [192.168.1.103] ([176.59.17.61])
        by smtp.gmail.com with ESMTPSA id e14sm807983ljn.78.2021.11.27.06.40.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Nov 2021 06:40:19 -0800 (PST)
Sender: Alberto Mardegan <mardy.tardi@gmail.com>
To:     linux-arm-msm@vger.kernel.org
From:   Alberto Mardegan <mardy@users.sourceforge.net>
Subject: FM radio in newer Snapdragon boards
Message-ID: <cae3d9b1-3cf5-e0a5-fd23-eaeee5feb1fd@users.sourceforge.net>
Date:   Sat, 27 Nov 2021 17:41:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: it
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all!
  I know that on older Snapdragon boards FM radio functionality is
provided via V4L by the radio-iris driver. However it is not clear to me
how FM radio works on newer boards such as the SM6150 and the SM7125.

I suspect that the wcn3990 chip which handles bluetooth is also handling
FM radio, but I cannot understand how this functionality is exposed to
userspace (there's no /dev/radio device, and I cannot see anything
related to V4L in the driver code).

Anyone can give me some hints?

Ciao,
  Alberto
