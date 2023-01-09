Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8718661BA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjAIAwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjAIAwN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:52:13 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCDEE007
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:52:12 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g13so10671096lfv.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHvuNchyTf0JxyKjCf6EGob9W8kzk1hdEyEoHvPc1cE=;
        b=E272CbEcg/ch0H4vmqe05PP0b7nbdRRPBxTWoKH42ncT/RRNmNFnkEwx8NWLdpGACF
         /VcfouoskqL4c5qlHZyH/pkT8ntfZoWbu7WkJm3Urmor8hss5jNsSQudTM23HuFexxvu
         tN7pLGjWt9I8CzrgOiZfYCHkfmMe+7hmrCUcQFRTDuZgaqNgC+4dEP2LMn6+E75+1JCE
         b9/f4x4rEOo3wXp3rcpUA9mHAy3sPFVwBaeqDQZS2whMMvOtcQRwn3mibXgSBGadkt2z
         p35SaqrEpx7wX3j5+EwrFLc7ht0MA4+mj1vsrtPFY8aYhMZUutbIg03769gwd7QEApE9
         3UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHvuNchyTf0JxyKjCf6EGob9W8kzk1hdEyEoHvPc1cE=;
        b=Lhvv8lq+tKiisDwjrlcLYe85qD/D0QQFDpqek9AtcEkDO83ng/qlshB718HBQBPQmu
         hKhqdFqrSMgsj54LW5WMoZsk92jTvjWHJ5XPUTjquX9Q+wAg8Ru6QA2JF6H93TlUeVzP
         tc/w35n9INpQSjEFnh0dMQ+m8GTedYT8EOIter1D/uYoirZb7pwYM/E9owaRsxvYVc08
         voaNv88BT/7x+idpDyxuQRFCeH2sevY2jrTGWjh7CxsX8GDILUD/IXH5QlfguyzwTlGj
         RnwdJkw1ZBrdu5rFJ6zJjOYxgoe+h5mlMoT+ST6GY9kTcp4GDnTnUXH8BGgDhazwp+kL
         xq5g==
X-Gm-Message-State: AFqh2kofPok8fihhesY5jzKUZtQsQiWQD8FZDtCnsHeffAJw5uFWQBnp
        8keabd9YOr8dJ2zHJSlxVw5qNQ==
X-Google-Smtp-Source: AMrXdXvCOZArkwsvdejn7zj+K5qSadWOiNLD0c6Mrcc41T/n4BgVrVx9KFuJTbuufow7pyIdT4/tNQ==
X-Received: by 2002:a05:6512:2394:b0:4b5:987c:de3e with SMTP id c20-20020a056512239400b004b5987cde3emr25136830lfv.69.1673225530595;
        Sun, 08 Jan 2023 16:52:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b00494643db68fsm1317493lfc.81.2023.01.08.16.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:52:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] drm/msm/mdss: enable access to hw_rev from MDSS driver
Date:   Mon,  9 Jan 2023 02:52:05 +0200
Message-Id: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On newer platforms mdss can read hw_rev register. On older platforms the
mdss driver can not read hw_rev register (to determine the platform).
Add optional 'core' clock that enables access to MDSS registers before
MDP5/DPU device is bound (and enabled the core clock).

Dmitry Baryshkov (4):
  dt-bindings: display/msm: add core clock to the mdss bindings
  drm/msm/mdss: enable optional core clock for MDP5 MDSS
  drm/msm/mdss: check for core clk before accessing HW_REV
  drm/msm/mdss: move is_mdp5 condition to msm_mdss_init

 .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
 drivers/gpu/drm/msm/msm_mdss.c                | 31 ++++++++++++-----
 2 files changed, 48 insertions(+), 17 deletions(-)

-- 
2.39.0

