Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221EC569835
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbiGGCbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbiGGCbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:35 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF7C2F3B1
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:35 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id m26-20020a4abc9a000000b00425cd321033so3243445oop.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmbEGlmgz9inbfRdXswr9utl0AqPzk/QhsgAgC2XwtI=;
        b=YyOkcEg1nXPEDqSuGVhcQUNsQITymByi5yzjSWlSBOLOKxn3jtVcDA7Mf63TCJY4M9
         GzIw1SPZvg/bVpWePYmPt2Q+m4Z1Cr/1119jMXw6Ox7x/Nc6CJjZY+moFhobFXpNwJwq
         5/07tq+5L6LQMRa0wlUU43WSJUBnHwK0dPbkAgKY5go9qxbk2ENeLW4pVpAuji62cYN8
         GYCIdi6CGEjxqWqxtEnQrlySvW57u5tTEtYBvz0VjoFea0f3Ik8+caczfrzS6NrT0rpG
         Tfbt1VVLfBTqjuSO1V1kg2B4xQT17JnpVNOejc8E0YhhKK4VPGq58MgDDU63k/XBVjIg
         xrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmbEGlmgz9inbfRdXswr9utl0AqPzk/QhsgAgC2XwtI=;
        b=mwrleb16ctdWmO9bnQq1ltEqyC26bScX4aZAsrzjS6fi9+ZYW9qeGArYEx+SWMeqgY
         /GhBdf9RNHNW+LBFo7kH6gFJdwFWz6Fh7OFBlEv+iVPMAAktyg2mis+k07/asiiB/ilJ
         pYHmhZ8hql5HXZed4ZrgHidfu/4/Q+hDGYamJ02zW8XU/n3W1k1hpHTEahGJsHor99q4
         /2SDRdX+zJfnPvCZHjfj8LGLRfturM92beHdBhcsUKNw9XFGp6DD0N4BFFg3dueOfnEp
         fp3KMZXEIf1bZdknmvCfF/GSnH+Jr17ghd88KbnrALGIBdQmi02WVYZA6/nJ/EVlT7+k
         FepA==
X-Gm-Message-State: AJIora+HpXsgkqjkdDbcalBh9jghgk9c5L2+dHIKGnxtEnSUozYO7RGF
        05DeLvVvGNO0F0JYXPXgpaKYesZ3OB/xZw==
X-Google-Smtp-Source: AGRyM1uOLxFCyR+T8i4wtTM/J6Zo80ApbrLtbf6uQPT2Q3Bx1WlzbF4CUac/xbzPFJxqb8NG09f/YQ==
X-Received: by 2002:a4a:e9a7:0:b0:428:89cf:34d3 with SMTP id t7-20020a4ae9a7000000b0042889cf34d3mr6714117ood.41.1657161094760;
        Wed, 06 Jul 2022 19:31:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: (subset) [PATCH v8 3/4] arm64: defconfig: enable Qualcomm Bandwidth Monitor
Date:   Wed,  6 Jul 2022 21:31:12 -0500
Message-Id: <165716107315.864223.9487866032857198134.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220704121730.127925-4-krzysztof.kozlowski@linaro.org>
References: <20220704121730.127925-1-krzysztof.kozlowski@linaro.org> <20220704121730.127925-4-krzysztof.kozlowski@linaro.org>
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

On Mon, 4 Jul 2022 14:17:29 +0200, Krzysztof Kozlowski wrote:
> Enable the Qualcomm Bandwidth Monitor to allow scaling interconnects
> depending on bandwidth usage between CPU and memory.  This is used
> already on Qualcomm SDM845 SoC.
> 
> 

Applied, thanks!

[3/4] arm64: defconfig: enable Qualcomm Bandwidth Monitor
      commit: 76f11e77f919397f31198354cd0e0bd8e76f8748

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
