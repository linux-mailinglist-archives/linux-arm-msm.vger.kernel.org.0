Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00613FAAAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 12:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbhH2KBV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 06:01:21 -0400
Received: from ixit.cz ([94.230.151.217]:44086 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234992AbhH2KBV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 06:01:21 -0400
Received: from [192.168.1.138] (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id A8C1624A25;
        Sun, 29 Aug 2021 12:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1630231225; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type; bh=hiVqLmiD+PF9oPmO+LTXOSyjkcfofZrCBQaNyAikZOk=;
        b=uyQNC2ALZgKo1rZCSSNjtL5N5GUXNVsdy33eKiw83Nf9dz93tLQ2ip5abD9m6rquh12M2D
        c/G4d5aOSU05ArEwm5eMdntrIf7MoxmkFx5MvQdwIFS3EIUyGnIsb95Y1hhTks+3M62wBf
        msDUeRBE4qD6aldziruzzRSPn3RABwg=
Date:   Sun, 29 Aug 2021 11:59:10 +0200
From:   David Heidelberg <david@ixit.cz>
Reply-To: 20210828070202.7033-1-shawn.guo@linaro.org
Subject: [PATCH v2] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <MEILYQ.9EFG5UCQQGNS2@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: David Heidelberg <david@ixit.cz>

On Nexus 7 2013 this patch fixes WiFi firmware loading regression.

Possible please Cc: <stable@vger.kernel.org> (at least from 5.10, where 
I tested)

Thank you
Best regards
David Heidelberg


