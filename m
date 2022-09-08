Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0945B2630
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 20:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbiIHSuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 14:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbiIHSuc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 14:50:32 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B570DF0289;
        Thu,  8 Sep 2022 11:50:31 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s206so17603162pgs.3;
        Thu, 08 Sep 2022 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=DWwmiE4MxDYsmkhb8vrahMn0Ubk6zUNoZZiDIRi3Qk8=;
        b=qXf9xK+U9QI5zgHmZwjMTpqpPStaiQDoy33UnRKvC+JSu4goY2Ec2Pdyc5nO820Y23
         NWQfZEUg7YYsqiGwm0vG2oa6rlPzO+Gy9EnTaKbVC+iQtVrnV9J+/CwROsOtJ4MnGzKb
         caCJBHK231v/r40itnFgWtQj9EPzW4/1chV/wlWoAcgXVpRiv0nImeFjLRE1wJ4ey6RS
         yvNXEe4xa0gZgfy72HwrXgcphO3oHbywmQ/u9MWNHfuhNktkEOgeOHQKhzxactd0AYNM
         RfFGzAWGbM3tWy6Qq/G/V/ZA1KFhlAvLbSrzPh5MUOA+u96w6/ediRZssqcz3BbY+0/m
         wK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=DWwmiE4MxDYsmkhb8vrahMn0Ubk6zUNoZZiDIRi3Qk8=;
        b=M0xXQrcSTspf0F8zjYaQFQ6tehxiXjM93h7iCPQivyc4LdPWAFUnfHqLLg2dyFGNGL
         rQ//QLyzO7r/5wFWR7yFzvarwnNR54U90WpLkp43bqxr7jGgV3ulExRE2w29Rw2+MO3r
         +K03skt7GdHn3NqqByuCxp/pu3kiYP84cemGunSRCtdy5mTKRi5g1941j8kI+8Nh0rHt
         qm4gPKxZzYDV6UhTGe6CQpcPAmpD95AheLN/M1I/vqKzJ1ptAhPYP2x2prLfUrGv4hZe
         Fl9KRlOCYtZ6BJdzkZ2sbPA4/IbQoqPiJt3FjLqaKNTYQxDk8hrLBokvNWsjxC0DWXk+
         khwg==
X-Gm-Message-State: ACgBeo0SlGBJHxaCaIMFfIxkcetmOnJKacZuHjOjvN/bMOqCpBaxFjci
        zM4eUp+rcECi1r6OtPhen2Yk2OinfJC74xMe
X-Google-Smtp-Source: AA6agR5/UxlB/Fcx/BoRuEf5fuUeMnknLjdY1Bm1R7+M0dlS2J1/hI09wrZq9b3oXPPJB/JZWtSl5g==
X-Received: by 2002:aa7:910b:0:b0:537:cd65:e7d with SMTP id 11-20020aa7910b000000b00537cd650e7dmr10412075pfh.63.1662663030640;
        Thu, 08 Sep 2022 11:50:30 -0700 (PDT)
Received: from skynet-linux.local ([2406:7400:61:ce83:3779:42da:b5f7:bc9e])
        by smtp.googlemail.com with ESMTPSA id 21-20020a170902c11500b001714c36a6e7sm8746030pli.284.2022.09.08.11.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 11:50:29 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     bjorn.andersson@linaro.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v2 0/4] remoteproc: qcom: Add support for pronto-v3
Date:   Fri,  9 Sep 2022 00:19:21 +0530
Message-Id: <20220908184925.2714098-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the pronto-v3 remoteproc found on the
MSM8953 platform. It also converts the documentation for wcnss to YAML.

Changes since v1:
* Removed redundant descriptions
* Style fixes
* Split YAML conversion into two patches, one for the actual conversion
    and one for the inclusion of the undocumented compatible string.
* Made sure all properties documented in the original are present in the
    YAML conversion

This patch series is a subset of a previous patch series [1]

[1]: https://lkml.org/lkml/2022/5/11/983

Sireesh Kodali (3):
  dt-bindings: remoteproc: qcom: Convert wcnss documentation to YAML
  dt-bindings: remoteproc: qcom: wcnss: Add qcom,pronto compatible
  dt-bindings: remoteproc: qcom: wcnss: Add compatible for pronto v3

Vladimir Lypak (1):
  remoteproc: qcom: qcom_wcnss: Add support for pronto-v3

 .../bindings/remoteproc/qcom,wcnss-pil.yaml   | 288 ++++++++++++++++++
 drivers/remoteproc/qcom_wcnss.c               |  13 +
 2 files changed, 301 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml

-- 
2.37.2

