Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256AA576FBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbiGPPT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbiGPPTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:21 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1D81CB3A
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:20 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10c8e8d973eso12859087fac.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4bNtu45Rd/4YI++rhxOkuyGqhRNOVd4xFK6Iso8tDE=;
        b=ATfdRj+6jYcWrbarTIYXWUJkKwSK7sM2XiU6W2J/8YbrwSwLqni4Vmi50pH8qJOAVE
         riblqoskYx8F3QXcilQKnQ90kaJefQOnPOrkdKZHM7MwQFycmQrRnRAIk7Q++9KnQwma
         mkXFrG05It98uGT8dBoneVBITaqrrgD9lLUJwhhrRO2MMKofnyKXICtO+PQDzp6Lx5Ti
         TukYUWJoZSAHb/bwQUnepvnwy+2T9iZ+as4O2jbOyK0yfavht943D8XzBo5+CjUz4tmb
         YwBDF6JREM9qPKgMpuiIeswdZb9UGG6eK7aTdgEM9ED8y7YN8ViKac5vhRzOStod3cuT
         k2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4bNtu45Rd/4YI++rhxOkuyGqhRNOVd4xFK6Iso8tDE=;
        b=PcRXjHPz/nn7WNr48tVNwB/xUyG5RkvpB/k1IhAYGrQsSAZxPP4IUlE8Vb5MiqeY+/
         YXabIDauIcaVGYzFl28qOJ5J6+IaxVwc3v5jj9FJmovk41wOt5Ob82LeVsHC3UwQAI5l
         HMnzpdwH7QyL8HpOniygKhi57Ql9ok9eiRad29ucb2DbcLMIQsTEClCqWWAuJ2U2iPVe
         uVFgHHxDBxs3um/qWAFQbX+yNgmDmE5K18HTvHpjGfTkq2l89L/ylJP7wHkjhi32swQP
         fWL78K0RPJjXPlt+bQlfdqhgDDNcfT43/P00o2c5CxXNHIwOScE8Qv5IEhat53VjUPjr
         TEgw==
X-Gm-Message-State: AJIora8kHkqkeMNVA2nmVWrAEZLfMATC8T1/bpsxK5B2w+l+xRUjN/Zg
        yggik5JZvFSPGaOMhGzQOL26RA==
X-Google-Smtp-Source: AGRyM1uSEZaFwEvPd0FDgBN8nIrdDXBgGgxRTQFolNs/kEwmFdkLRiS1dlyizgPnGLrdwCD9Ji2L+Q==
X-Received: by 2002:a05:6870:218c:b0:10c:2898:a3ed with SMTP id l12-20020a056870218c00b0010c2898a3edmr13587904oae.168.1657984760590;
        Sat, 16 Jul 2022 08:19:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v4] soc: qcom: Fix the id of SA8540P SoC
Date:   Sat, 16 Jul 2022 10:19:03 -0500
Message-Id: <165798474064.1679948.1336326968983760142.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220711083957.12091-1-quic_ppareek@quicinc.com>
References: <20220711083957.12091-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jul 2022 14:09:57 +0530, Parikshit Pareek wrote:
> Change the id of SA8540P to its correct value, i.e., 461.
> Also, map the id 460 to its correct values, i.e. SA8295P.
> 
> 

Applied, thanks!

[1/1] soc: qcom: Fix the id of SA8540P SoC
      commit: 5bed21af0005cc7d8bb05d2c4a63afbcede23382

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
