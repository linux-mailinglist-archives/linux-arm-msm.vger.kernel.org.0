Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4147634B4E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 07:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhC0G5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 02:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhC0G4z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 02:56:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28DDC0613AA;
        Fri, 26 Mar 2021 23:56:54 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w18so8798476edc.0;
        Fri, 26 Mar 2021 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/nrHAis2P0dzTZHAmJMrftoMP2h0cNOfMK41ddHP2/g=;
        b=C5IEoc74WXY/u4vf0C6XQshmwLzJw4CBBfLwWWB6ovJtW/9RSA95bSPB+UE7Hgk4xn
         MoDB/Tg4B//mB5PWUofFsfly5uWRI6azEaekxsBwhJ9TU/1qwf3WsL98MqOrl6lNayT6
         ZoX0ztN08FMpQPGG/0EhmXhaIZZV5qMh5BJUxIHaHpJhD7ExaZJ5A9/bO/dpTh4PnIH1
         FHZZJVcU5PRUfayMgBK3Y9BRT0IS3LsvjPz8X8pmTyJRsujnt9BINr51UpY2LL5pKvLu
         1FSas9QPZcU1WPKCs6SM7WJSpJOWohQzs0reW+t0hDJCB1frG10T8VwS/FWncNqYqKCr
         LirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/nrHAis2P0dzTZHAmJMrftoMP2h0cNOfMK41ddHP2/g=;
        b=Jkl/HAiXfbKR3dToUjAt+TOCGOVnIaaiZ7jdyD6ZGXxiqe5ydVTtPSfQYGpjJ4+coj
         RbEeywKIWUHSq+bInYu+R7h7fBRTHMA4pFuqzHNWuwJAgSQyccRMtOTMK2qEbZ0fP3uD
         KFWBibYlItOfVZ50uZ4gfZcTI6nfDg12Hy37yiCNcxthuTpCliUe7oP4cYIC46gdPCqD
         mrSWa5L0uKlwX+Vj+Uy5lhpplW/tkYLaUxdn+u529hRMJ+TjHp01J/hj8SoSGTWQl2QD
         koaShzZsUR8p1T/UTyndTs+Tvu+5A2RCdf69NPMFXl+UdbAtM5y5SnPL6JCTP8eEYrLs
         lhRA==
X-Gm-Message-State: AOAM530/ftUx1YnhJw98JUobEuUl6o7zkeAnDe55TrT4IO61sCuRKS1B
        YaT3lhdhDo40yOTT2V/kv5k=
X-Google-Smtp-Source: ABdhPJyWImLozKgeuzDkNlFnXnyHXhJtADkkuGj20j+FlbB4dM/I91CEEbQdxt1v9O5UaC/r7bdErA==
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr19045252edb.189.1616828213567;
        Fri, 26 Mar 2021 23:56:53 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2de6:9900:7d51:74f6:ebfb:3cdc])
        by smtp.gmail.com with ESMTPSA id i11sm4774005ejc.101.2021.03.26.23.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 23:56:52 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/2] kernel-doc and MAINTAINERS clean-up
Date:   Sat, 27 Mar 2021 07:56:40 +0100
Message-Id: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Roughly 900 warnings of about 21.000 kernel-doc warnings in the kernel tree
warn with 'cannot understand function prototype:', i.e., the kernel-doc parser
cannot parse the function's signature. The majority, about 600 cases of those,
are just struct definitions following the kernel-doc description. Further,
spot-check investigations suggest that the authors of the specific kernel-doc
descriptions simply were not aware that the general format for a kernel-doc
description for a structure requires to prefix the struct name with the keyword
'struct', as in 'struct struct_name - Brief description.'. Details on
kernel-doc are at the Link below.

Without the struct keyword, kernel-doc does not check if the kernel-doc
description fits to the actual struct definition in the source code.
Fortunately, in roughly a quarter of these cases, the kernel-doc description is
actually complete wrt. its corresponding struct definition. So, the trivial
change adding the struct keyword will allow us to keep the kernel-doc
descriptions more consistent for future changes, by checking for new kernel-doc
warnings.

Also, some of the files in ./include/ are not assigned to a specific
MAINTAINERS section and hence have no dedicated maintainer. So, if needed, the
files in ./include/ are also assigned to the fitting MAINTAINERS section, as I
need to identify whom to send the clean-up patch anyway.

Here is the change from this kernel-doc janitorial work in the ./include/
directory for ARM/QUALCOMM SUPPORT.

Andy, Bjorn, please pick this clean-up patch series for your tree.

Link: https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html


Lukas Bulwahn (2):
  MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
  soc: qcom: address kernel-doc warnings

 MAINTAINERS                        | 1 +
 include/linux/soc/qcom/apr.h       | 2 +-
 include/linux/soc/qcom/irq.h       | 2 +-
 include/linux/soc/qcom/llcc-qcom.h | 6 +++---
 include/linux/soc/qcom/qmi.h       | 4 ++--
 5 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.17.1

