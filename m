Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1732B16EDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 04:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfEHCTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 22:19:42 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:46205 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfEHCTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 22:19:42 -0400
Received: by mail-yw1-f67.google.com with SMTP id a130so9375128ywe.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 19:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=53Jboj1jRgFvMb4WzHp98oy3I5nfTVXEAchn1y2EzOc=;
        b=RBlup3KPFNcyrB9ylm1qkvs0cblxy6flpxA0OYqN53KJ8PIAYu8bo8D+/x/2pvQsmM
         dl4wfuL8b02ODRM/SfXQfikr08d923wAv0kjMs9VhtlTv4EQiORgx3Rxhbwu9XcyWbHE
         mj0pse0+S5xQSdjyolPLlxWnNr4H+2+Jnopz28QnJz9ijG2nGcc4nXu1G7Nv9QoiIeo3
         L8i+OFgfTReIrAy3/4ipDRegLIPRsI3twnwK1LFJ5480U8fjuXKeZnCUwamHV9ZcDWbn
         OOw6DkQabvzVU9g9iQdPeluo3AWax/6Oxwan60wUvw95otfaUHekxnGsvNrLXPgH0/6P
         diaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=53Jboj1jRgFvMb4WzHp98oy3I5nfTVXEAchn1y2EzOc=;
        b=ld2cedBXZgtPviwvii09fmPKNRcQbc0hakB23lMAKj8+VlmOXM2rnBRGLNWiYRIrua
         Bix+0Cg3nhtvFXWU/cOl524EJkMXvtSwylhIJARBZVjanFHfmqT3vWnA+gC1dc8D5D0I
         hLKGoV3I07xZqvFP0qGMwD5hoQNEYjiSMoQzg5tq9SYKolw5EGNCsoc/pVitiucNRWbc
         Sq/9YAYCGHK1+GKITSNmOmCvo5TyMy5S2iOWnQKJZ5MF2AEeEyPWIc34hvFlbMLYO0PR
         0HljJXEraqwTaL7m9RP1ft20PUC1D8ih9UyzAaAIWy/ayiEyNoGy1pAopkKs+w0dghy/
         GUGw==
X-Gm-Message-State: APjAAAWLE9CrqXZkPeK3sBfNOuaHaI8zb8UNhw6uwKwcj2BLC7TpvsrP
        bkfoKz7CLpwUyG1yHHFeG5whbg==
X-Google-Smtp-Source: APXvYqxIefpB6QOxsv5208c4eOzk2H+HjQbDo2jovyEHJ5xfkrhRDkweBqtP1NwPjRT6lpkVusJgxw==
X-Received: by 2002:a25:542:: with SMTP id 63mr23605669ybf.331.1557281980950;
        Tue, 07 May 2019 19:19:40 -0700 (PDT)
Received: from localhost.localdomain (li931-65.members.linode.com. [45.56.113.65])
        by smtp.gmail.com with ESMTPSA id s4sm1168116yws.48.2019.05.07.19.19.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 19:19:39 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>, Guodong Xu <guodong.xu@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH v2 00/11] dts: Update DT bindings for CoreSight replicator and funnel
Date:   Wed,  8 May 2019 10:18:51 +0800
Message-Id: <20190508021902.10358-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the DT bindings consolidatoins for CoreSight replicator and funnel
is ready for kernel v5.2 merge window [1], this patch set is to update
the related CoreSight DT bindings for platforms; IIUC, this patch set
will be safe for merging into kernel v5.2 because the dependency
patches in [1] will be landed into mainline kernel v5.2 cycle.

In this patch set, it tries to update below two compatible strings to
the latest strings:

  s/"arm,coresight-replicator"/"arm,coresight-static-replicator"
  s/"arm,coresight-funnel"/"arm,coresight-dynamic-funnel"

Please note, some platforms have two continuous patches, one is for
updating static replicator compatible string and another is for dynamic
funnel change; and other platforms have only one patch since it only
needs to change for dynamic funnel.

Avoid to introduce merging confliction, I rebased this patch set on
linux-next branch with last commit fcdb095ad001 ("Add linux-next
specific files for 20190506").

This patch set has been tested on Arm Juno and Hikey620 boards, other
platforms are only compilation passing.

P.s. when use scirpt/checkpatch.pl, it reports the warnings as below. I
think we can ignore this warnings for this patch set, please review if
this makes sense for you.

WARNING: line over 80 characters
#29: FILE: arch/arm/boot/dts/imx7s.dtsi:178:
+                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";

[1] https://archive.armlinux.org.uk/lurker/message/20190412.102734.2afbb29a.en.html

== Changes for v2 ==
* Add explanation for the change in the commit logs. (Fabio)
* Merge the separate patches for funnel and replicator per DTS into
  a single patch. (Suzuki)


Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>


Leo Yan (11):
  ARM: dts: hip04: Update coresight DT bindings
  ARM: dts: imx7s: Update coresight DT bindings
  ARM: dts: qcom-apq8064: Update coresight DT bindings
  ARM: dts: ste: Update coresight DT bindings
  ARM: dts: vexpress-v2p-ca15_a7: Update coresight DT bindings
  ARM: dts: qcom-msm8974: Update coresight DT bindings
  arm64: dts: hi6220: Update coresight DT bindings
  arm64: dts: juno: Update coresight DT bindings
  arm64: dts: qcom-msm8916: Update coresight DT bindings
  arm64: dts: sc9836: Update coresight DT bindings
  arm64: dts: sc9860: Update coresight DT bindings

 arch/arm/boot/dts/hip04.dtsi                   | 18 +++++++++---------
 arch/arm/boot/dts/imx7s.dtsi                   |  6 +++---
 arch/arm/boot/dts/qcom-apq8064.dtsi            |  4 ++--
 arch/arm/boot/dts/qcom-msm8974.dtsi            |  6 +++---
 arch/arm/boot/dts/ste-dbx5x0.dtsi              |  4 ++--
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts     |  4 ++--
 arch/arm64/boot/dts/arm/juno-base.dtsi         |  6 +++---
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi      |  4 ++--
 .../boot/dts/hisilicon/hi6220-coresight.dtsi   |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi          |  4 ++--
 arch/arm64/boot/dts/sprd/sc9836.dtsi           |  2 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi           |  8 ++++----
 12 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.17.1

