Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6CC55EF59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiF1UXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiF1UVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:54 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132CFE0F7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:45 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id s124so18825998oia.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L7X1tSt2iJ6DktLCRmPmCKw+/uL8cAeokrUaFc2RJPI=;
        b=actnBH/LAbmAGmzjAjA8870t8pTv0++Ozgzd1b8av4QHdzi0Sdb2uSzk7UPp4Ps9W0
         QpDYq+X8y9S53gjHtePp+LZQAN/MnSlmKdLkOy7gx3dj8SgiSl1rTSdznrxBPFt2/wRk
         JvrPD4y6S4dGNjQdq9wkciNMfUdYb/iGsvbCGp+hqzJYKjqklN1w/WhDkJ7AoAjDf/9X
         xnFWoBDTCSJ0nq/EQrtmMqAyS4UXDCaP18Jgq25spIEBe23YW/JhnplHURLHc6uLDBdV
         KpkhTJi3KPWcDCNFSDsM7sGWHAqY/HIlM6X7tBVCBZbhziD9xUSFzkItAuHB9FINhbr3
         Tzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L7X1tSt2iJ6DktLCRmPmCKw+/uL8cAeokrUaFc2RJPI=;
        b=dNNKpCk2qwbE54LlEO17QfrLEwCnvouyaNHB+O/WPzJD9IvovVxJt6PWKQ7aA7tZBv
         eLo17nfZHeyLaVvHZvu43UQMBVMGWSnOYlJs/oa2ebiBuB4w3N9fUxCxNinll05aLAd+
         g48e1berMS6R+j9aC+03Dt5azYEHh8hR/krmKYZ2WHAOEeHwv8THjSGCVlsw6tSjZD/j
         DQyT4q121Ey/gNXvSzJqMbr+YJVnaTDXB2SF/P6bxyRiUkR+/CnCKeSOFN4ibWzrV6jp
         PpQARUaImtEiVrUH7+BLPfT7E2OgpquzO/YoRAQtLwBgtCJUqRv9t8bGmaId3Gnnhv1F
         h44Q==
X-Gm-Message-State: AJIora/06uY3W/LnjihtWc+NMixNkUHE5Y4oLnCMum6l0d0oV/ZBTkRG
        28uwf0XRWacARPdjFaOgJUGrhypz9E0hWA==
X-Google-Smtp-Source: AGRyM1udZl9cYOZCTVRx2dP4aQ65DPh7kIknOz2yVcCQK0jjiEHNvsMvE3gxfKUp/+0eGVjssG4YBg==
X-Received: by 2002:aca:abc9:0:b0:335:796f:abba with SMTP id u192-20020acaabc9000000b00335796fabbamr920913oie.35.1656447584789;
        Tue, 28 Jun 2022 13:19:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     will@kernel.org, Rohit Agarwal <quic_rohiagar@quicinc.com>,
        robh+dt@kernel.org, adrian.hunter@intel.com,
        bhupesh.sharma@linaro.org, joro@8bytes.org, ulf.hansson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, robin.murphy@arm.com,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: (subset) [PATCH 4/4] ARM: dts: qcom: sdx65: Add Shared memory manager support
Date:   Tue, 28 Jun 2022 15:19:11 -0500
Message-Id: <165644753307.10525.4712451269370492524.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1651480665-14978-5-git-send-email-quic_rohiagar@quicinc.com>
References: <1651480665-14978-1-git-send-email-quic_rohiagar@quicinc.com> <1651480665-14978-5-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 14:07:45 +0530, Rohit Agarwal wrote:
> Add smem node to support shared memory manager on SDX65 platform.
> 
> 

Applied, thanks!

[4/4] ARM: dts: qcom: sdx65: Add Shared memory manager support
      commit: e378b965330d99e8622eb369021d0dac01591046

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
