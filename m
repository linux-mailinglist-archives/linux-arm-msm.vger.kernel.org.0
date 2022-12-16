Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D37364F509
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 00:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiLPX30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 18:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiLPX3R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 18:29:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E610726543
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671233312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=oOzuvF1JcJhHhAVx50brEATiwwsFfA/JQNQZSVDvP8U=;
        b=XblDWVX1KPv8MBeuNp00myitXpFyQ6vydr60d/l4x9rEX95+wcnziICmqvCKc23helXq7s
        M9znH+sJvHLAbmIIkREjnbkY5CPwqCOtZOsm5D7+BoLaM73QeJ+4dH+VIUFQUeQx5JfhXk
        8nmBdE0p00RP3/v2WsUF8fIIvMaCmQA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-DgNuds0HN9mXHN5r3PsWGQ-1; Fri, 16 Dec 2022 18:28:31 -0500
X-MC-Unique: DgNuds0HN9mXHN5r3PsWGQ-1
Received: by mail-qk1-f198.google.com with SMTP id m3-20020a05620a24c300b006fee2294e97so2943342qkn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOzuvF1JcJhHhAVx50brEATiwwsFfA/JQNQZSVDvP8U=;
        b=xML4JUbbRpX1Wi/hcHzLKq/1cC1LUchABwGkp8VKu++8Q5ULtCPMRY/eylkRrA43gy
         Jc127Rei2FLJOvYGP/Em6eI9ZPn64ktxbqN/rEZ2Q7yrAMk8XdRdpPQZL0fPsVjY6zMc
         NsOA9F758l3LxfHRRh4Gn2YhMqUInfundEF8t5HAozQ9j6c8Wl/JuWk7mkHk3xFKHpma
         bZxXkLPfnati7EQGfu+lJ6HhRx0gWYz6mlTbZZ/H6WotZeHv31fM8dootQnEc/D6pEMt
         BdpBj4UjT/2dqge8qvErJz3gHXB5PtUbn2vaEmwBQOJ2MiTr+xqz++mGHSKlCWA5wUCa
         4N5Q==
X-Gm-Message-State: ANoB5pmMHpU7oDjAZVxmow8VUymanIVJ55hrgv7eY78tVIy3xvjXMopE
        fWQVVtbWTfGvvu3A8BmMezZRPin4X7mEqEwao6yGCXbCecYl83ZgqR+jk9mWbzk5me7WvCTXBLx
        WyYxUWoz3s6H9lMZhmjPcT0eX/w==
X-Received: by 2002:ac8:7547:0:b0:3a6:18ff:c6e2 with SMTP id b7-20020ac87547000000b003a618ffc6e2mr43270458qtr.28.1671233311113;
        Fri, 16 Dec 2022 15:28:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf65ipvRxOI0wPxhp1/suNkdbXHX84i0WSZZczzJb/1BWyw3GOFbPSxcXH2idaxxlQ6iUsbnjw==
X-Received: by 2002:ac8:7547:0:b0:3a6:18ff:c6e2 with SMTP id b7-20020ac87547000000b003a618ffc6e2mr43270434qtr.28.1671233310883;
        Fri, 16 Dec 2022 15:28:30 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id a16-20020ac81090000000b003a82ca4e81csm2042872qtj.80.2022.12.16.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 15:28:30 -0800 (PST)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: enable sa8540p-ride rtc
Date:   Fri, 16 Dec 2022 18:26:02 -0500
Message-Id: <20221216232606.2123341-1-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable sa8540p-ride rtc on pmic@0.

sa8540p base boards share the same pmics description, currently in
pm8450a.dtsi. Rename the file to make this explicit and use it in both
sa8540p-ride.dts and sa8295p-adp.dts.
Add the missing offset where appropriate for the alarm register bank in
other qcom,pm8941-rtc description.

Changes since v2:
- rename pm8450a.dtsi to sa8540p-pmics.dtsi.

Changes since v1:
- Add "alarm" register bank offset at 0x6100 in qcom,pm8941-rtc
  descriptions.

Eric Chanudet (4):
  arm64: dts: qcom: rename pm8450a dtsi to sa8540p-pmics
  arm64: dts: qcom: sa8450p-pmics: add rtc node
  arm64: dts: qcom: sa8295p-adp: use sa8540p-pmics
  arm64: dts: qcom: pm8941-rtc add alarm register

 arch/arm64/boot/dts/qcom/pm8150.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |  3 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/pmp8074.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts      | 79 +------------------
 .../qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} |  8 ++
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts     |  2 +-
 9 files changed, 17 insertions(+), 85 deletions(-)
 rename arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} (90%)

-- 
2.38.1

