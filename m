Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28E7651277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 20:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbiLSTNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 14:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbiLSTMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 14:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4ABB1004C
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671477121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=LyOOTOslnaWRlsHPF8vWnhN0NTrLj4S9IZbtD5zhwpw=;
        b=ZyjL3BMWDB6nklhO4Bpf+vo1Ykqs2XrBK5mKMz6iUj3VT7FHDoSJwowUFPSKbU2AtXta2G
        ssjWGkq7CG02Rd0umc4/dNVASRkmzhGhj9bGSjIoFQQ172I2lTAKsNnQuWUPA2pZI8FDwa
        iIIdkOLWqfUlby9hYIKfGfHthx1SDfA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-IxmgNAWSMYiB91zT5dMusw-1; Mon, 19 Dec 2022 14:12:00 -0500
X-MC-Unique: IxmgNAWSMYiB91zT5dMusw-1
Received: by mail-ua1-f71.google.com with SMTP id 31-20020a9f23a2000000b00419ac00068aso4101293uao.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyOOTOslnaWRlsHPF8vWnhN0NTrLj4S9IZbtD5zhwpw=;
        b=51Obuot/uXqn3O6DYv4Y69nz2fXIJHZ9Dfug3AIr9bQeHwkeGEWjdM5jj0ziLPJM/g
         /TaoS10kVgxyMD6prRJe1HapqqvW3OT9U6CqVgffIdzboYYJrqArT67DoGL2iKYgk96D
         6srCzSLZ0alkpI0gy1H5K7cg8e4C1lBNrlU9i2ur+AhG+iWVBCDg5mDKsK5JPf9K+c+6
         uFKB2SFOShyTsS+YVtT7dnTcwpIZ6/7ERSwMVXhQLylGAKZqCSD7hWOjaFRMclXYcK2x
         r0db87Ytx/i46lXSGVZcHdbqXQTWU7vZ/+BnzswhPAkWP/XOw9YuD7By/95nN8yu7+WN
         E3oQ==
X-Gm-Message-State: AFqh2koNXJLro33HbMg/eYkAIOvCwUgsyIqaiegg5rCb3HssaOpHrYYw
        xAssx7072zPh4G/6Ya+oc96jbTl0jKIgATOwwCiBpKeAPXJKUogBlIiRYtWnvghzS25XrVLBMh0
        O2X80oNJhvrw2v/Ol2kUu1rvsNw==
X-Received: by 2002:a05:6102:1521:b0:3b3:795:d88f with SMTP id f33-20020a056102152100b003b30795d88fmr7279458vsv.10.1671477119951;
        Mon, 19 Dec 2022 11:11:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbUkmADSZ5i62fDBCt+kHtvZfs95tMBmvOIs8FSB9qEgpO6bfdZiQh72iXqJDtv+nTghwYuQ==
X-Received: by 2002:a05:6102:1521:b0:3b3:795:d88f with SMTP id f33-20020a056102152100b003b30795d88fmr7279426vsv.10.1671477119666;
        Mon, 19 Dec 2022 11:11:59 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a288300b006f9c2be0b4bsm7217436qkp.135.2022.12.19.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:11:59 -0800 (PST)
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
Subject: [PATCH v4 0/4] arm64: dts: qcom: enable sa8540p-ride rtc
Date:   Mon, 19 Dec 2022 14:09:57 -0500
Message-Id: <20221219191000.2570545-1-echanude@redhat.com>
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

Changes since v3:
- Amend patch #1 incorrect description.

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

