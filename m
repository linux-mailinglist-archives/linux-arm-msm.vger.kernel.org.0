Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18A72C5801
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391301AbgKZPWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391296AbgKZPWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:18 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D178FC0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:17 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a186so2479247wme.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ay1QH2bUvbOIA2ZUFWy+JbT8fUAqvJZs5kOEe6ZTqSo=;
        b=wo0gu/9zo332X9pNE/Xl86tD89guuCPYF7oKdvaHvFQZZBjFYrg8BixU5BM4aUTtQU
         SvFiSW85w2socjSZ/LtCE5HB+bt3ScXXioH/UIBYYLMpvfToNQYjAtxXpBwz4USCn98F
         NK3oiWSbWTi+G974FE7/9R037C/cAexorqG0a++5Z0nw2ch4IFjkjKSjlsLpMCbA//Bz
         LLLuPFnZ6BkQGEoHoWeKJtLJxXRMN9ZT6D7/1CVh3ZFnPeilBgj/vXQVUymP45pLbRKi
         NiPsxI3Ak6bQGaFyxpj1urXXI0TCL0F3Q4c5tJgqzEs5Z1QlFJxHL7gG5KO3i1miCkIE
         UUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ay1QH2bUvbOIA2ZUFWy+JbT8fUAqvJZs5kOEe6ZTqSo=;
        b=IUGvJ9iO+DporuA8Q9CXY9EHQKiLseknSSJ06Rn/W+agsfidyH+zLqFKPaQLzl/el2
         1EGnhIwEfWOoUdw6wA4hA7a1JRYGhaf/tvhlGP54/MDF7KsF34mHqhmrUHLhWo1MsRek
         TWnvANrQ33+iLra/9OFW1cU5qXJQIGMHOLWWEc6cUldjsglSj4fblGANKZJqqP9BQC/T
         38uq5AgdwU5tnClJfkjzSCuOlF3h294sU0DCL0pX12C70bFW25eC6I4K8WnTjGKNueI9
         F5Bml1YxC2T/J4IQuxzJnCaJh7/9KKWBkObACggbAj68qQ/ScekpgesawZUF5hfN4cO+
         Cmcw==
X-Gm-Message-State: AOAM531RGCNAIflDCYDgAdV3iI+5LbZugFjmwZUvmBdXj2fkkErBeK6q
        1CKZKOY17IcUYbV6GyDG9EJotA==
X-Google-Smtp-Source: ABdhPJw8M7sG3U/yCMcdx6aFj6Kx4N0Kg+dkwMBImDiENVEMPJuVE1xlaOZPDh4VX8VGOY2wzcJFEQ==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr3988494wmc.144.1606404136593;
        Thu, 26 Nov 2020 07:22:16 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:16 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 2/9] mhi: pci-generic: Increase number of hardware events
Date:   Thu, 26 Nov 2020 16:29:00 +0100
Message-Id: <1606404547-10737-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the IPA (IP hardware accelerator) is starved of event ring elements,
the modem is crashing (SDX55). That can be prevented by setting a
larger number of events (i.e 2 x number of channel ring elements).

Tested with FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index f5bee76..d3896ef 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = 256,		\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
-- 
2.7.4

