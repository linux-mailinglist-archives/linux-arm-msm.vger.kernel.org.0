Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1C87A89D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 18:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbjITQ63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 12:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234681AbjITQ63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 12:58:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF089F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 09:58:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F7BC433C9;
        Wed, 20 Sep 2023 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695229103;
        bh=mCdx0HtKO/a2+LttGTL2gWKh2MDhowkMJB4n3Lhlzr4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JSsAiJegKT3UskDsbqSHNPFjrAQeKe2ggPPbNLJBlRHS9boMus7NPMtSk0KJ634XN
         E5TIe0/XIH1MOtsNiwDJ8RpM4qybC0EDVNKoKeRQDpzWbRoQ2GJLt/eL2FjcgrKR3M
         k9Ln461OWyAVkamlAlB1p84R7+u6QdEBAx/KYXVi+ajHbEZM0akiFmDZXU0TN9afAv
         4xdqWcznk2vQgYmh1MTkz9AVcmd0KiYxl6OkdT/LHtQ7K/FN6Q5vYsZ05ezqJNlVP6
         7PYmvRDZrJg+GYfnxtHt4TGNcoy5OLn8NViXCCiT+f+RFY02I+Ze9wlfZe4liPqj3h
         Tq5IDLCsFQj+g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     marijn.suijten@somainline.org
Subject: Re: [PATCH v3 0/4] SM6375 remoteprocs
Date:   Wed, 20 Sep 2023 10:02:27 -0700
Message-ID: <169522934562.2501390.17632732909455117299.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230109135647.339224-1-konrad.dybcio@linaro.org>
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 9 Jan 2023 14:56:43 +0100, Konrad Dybcio wrote:
> This revision merges two [1] [2] previously separate series,
> adding SM6375's ADSP, CDSP, MPSS and related bindings.
> 
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230107120623.1903056-1-konrad.dybcio@linaro.org/T/#m89d629bd788593dfd27e4dbf0cf0bf94ffd0a7ce
> [2] https://lore.kernel.org/linux-arm-msm/622afd8b-a469-4c95-d2b8-030e47b0cac2@linaro.org/T/#m17aee8f3a51cfbd3f92fe2b4dd48b3722a6a0a7e
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: remoteproc: qcom,sm6375-pas: Document remoteprocs
      commit: 6d3211e015b0f236986b16c042f71cce8d36d727
[2/4] remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
      commit: a6df21cf0c93cab57059e2592c7c99b424965374
[3/4] remoteproc: qcom: pas: Add SM6375 MPSS
      commit: 93f875645c9da9c788224964499e68fa9664e80f
[4/4] arm64: dts: qcom: sm6375: Add missing power-domain-named to CDSP
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
