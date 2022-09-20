Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F5F5BDA24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiITCaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiITCaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:30:16 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13F341D14;
        Mon, 19 Sep 2022 19:30:14 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id k12so754660qkj.8;
        Mon, 19 Sep 2022 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7aXtOzbOqs5lwt+0WZ1O86+AkSl+ghw5GZV5GxaUis0=;
        b=dKjI+sNMiy58R9w7PfSzCUsWBjX/e44ESNxWlpdEcK4Nuae28edF9SO1mJQLRv55wG
         7+QGXoL3pScuBTUudxDo56BAjJRsX7EPXzXlIbAgcRKgsH6nq0KFn+Vv9gO+C+GrDcKj
         Yd/4wzBbINAla12YnC/P7+LuiSN3kD2iS6vZKrlfGfcuiVxOjA7Wsk/N42GNI27YXoAY
         kXEHC77QLVZVKZSGUebjtg79lVlE+n6Ueo8QpOJjaFohV4Yfs8gNVUZ4CuVP82DNIjNF
         1qg8oEuEFOHYJVK98+N0u74gxEOcYuKQVywciAOl8F4l5XHDrheBiyK7UNxanIJmA0r+
         vRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7aXtOzbOqs5lwt+0WZ1O86+AkSl+ghw5GZV5GxaUis0=;
        b=BZVRYbeFjqbDQPHHTPTICpYXyNZCUeSVKORxxR/dV+fJ5yYtVOX+113r1wpJUyxdId
         cUUx5lTv0VQ5CmK9ctasRc5mHyf9+BlZgacCHDGTuC5TBzIoKmyf4wpaXZ7x06epdQ8t
         oxmgTfrAiOvWPJguGwPHMirLeGDOR1IgVkKpKli9MIiX2uIc9ewNEonAZYwG6RrSnSey
         zVnXM2GxwPHBcWEU2iuh1+67aApeZSW3qrPOegQLpF/OhsvgsVAhHpGMs/hNHP1CgdKk
         15sh+EUE3fGyDvXk5NCL85ecC4HXgGgta5PStvn1/oQd3m9wBz3dRhO9lcXJckgPvg8f
         UT+g==
X-Gm-Message-State: ACrzQf0E/NUPkOA2MF3PQMgP5DKmAnczo6WwimquW4/m9kqv1XwMU/Jy
        mAtZ8TPpi8Ey5RVamnVcju50Uy7FmUs=
X-Google-Smtp-Source: AMsMyM6iC5cQyVDI44okRVwdYkCRepIRXCdUlYDLepEM3LvfTLVmJ4gI4dnHVjwQER4M29haQ72w7w==
X-Received: by 2002:a05:620a:11ba:b0:6ce:1a71:9887 with SMTP id c26-20020a05620a11ba00b006ce1a719887mr14726445qkk.550.1663641014282;
        Mon, 19 Sep 2022 19:30:14 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id m9-20020a05620a290900b006ce60f5d8e4sm94709qkp.130.2022.09.19.19.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:30:13 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] SDM670 RPMh Clocks
Date:   Mon, 19 Sep 2022 22:30:12 -0400
Message-Id: <20220920023012.4433-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920022251.3073-1-mailingradian@gmail.com>
References: <20220920022251.3073-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> This patch series adds clocks controlled by RPMh for Snapdragon 670.

Oops, sorry. I added the wrong description. This was what I meant to send:

Subject: [PATCH 0/2] RPMh Support for PM660 and PM660L

This patch series introduces support for the PM660 and PM660L on the RPMh
mailbox. My initial Pixel 3a dts is not very minimal but I think that this
series is trivial enough that it can be activated in a single commit.
