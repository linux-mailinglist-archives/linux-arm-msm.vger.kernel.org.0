Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE7255D29E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240876AbiF0UDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240868AbiF0UDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:32 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4281ADBC
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:28 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id s124so14413946oia.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vcnPdobWEB9An7eC5xogpnXETEN4Z5FX7s2MRgnhb74=;
        b=VKrBaZMmrQRs46LtJ8lflotcxOKvI1/otrMggyp2VlVoNE1SDFfOKc30quxTcR3PAa
         SWFgtpofmq5nQeEuEGziHWqwJrZskq0eOZPI4QOJrwgje/Kq8Ucsc9DPubieF3b64o2t
         J+dHWNVThFGdpSgegKM1YA7TzJ5+uhmAbgy8Xr1XyBEY/wjVxc2PIK5FZohb19tRvHlr
         U7JBW/zRELvKZQVJrKqfGA+hzNKGQYnj1X/E34I17y6lRqCcRRYsw3Ip3nkJEk/i/NZw
         rNJi9CfHFJC2vui0DzM6lk8OAcdM+E4C3mln86kXVNhj0lLlVoiBLOx9Dp8+L8hgUxNo
         6R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vcnPdobWEB9An7eC5xogpnXETEN4Z5FX7s2MRgnhb74=;
        b=Pim5N4SpSp4u86DRmdbY3H4Pt25UzcKUWSLTXblb8sKIHGOyA3Nu47AePtVJUxbsfQ
         L41vAxSeYvPXFtdRIui1bqOvYi//o6XSpIg+gxgY8Tga5z1mhHJobBN2B1ik/xx19ZLY
         dMhREvW9Am8pTCaLU+ryBoRDb4Nuyl4Ul9gWB9l6r9SWux6nvtBUxwA7Wy0xGhwb7r55
         NMTNyqX5ByFQqYNgA+hI50P4SiTmr5YKpjKok4GiYzFuSAXBk+G14i/BI/X4bQgVUGFD
         2LAHwYRluJa97YmH8s0FeihXsEv/+o8gR5tg+e395QIpCbYxLLUr4fyFxRqw+Xk8ecK0
         fvPw==
X-Gm-Message-State: AJIora9kbJC1UQ18mKRRf6o61dtiF7kXAJKlob3pYSYvl7eZjHc4lT6T
        ZnW50vGM6DM8L8jCUHhqctCRpHKq2sdfqA==
X-Google-Smtp-Source: AGRyM1ttTnkqN5E5GoDgDsXanvxh8kfBh/D+BrkpRGHkf94ZxuUGQmeZv+fBfloaIHp6qFcsYYDL3Q==
X-Received: by 2002:a05:6808:13d4:b0:335:6af4:b7b6 with SMTP id d20-20020a05680813d400b003356af4b7b6mr4675975oiw.210.1656360208110;
        Mon, 27 Jun 2022 13:03:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH v2] arm64: dts: qcom: sm8450 add ITS device tree node
Date:   Mon, 27 Jun 2022 15:02:47 -0500
Message-Id: <165636016348.3080661.6692159226406542457.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220502192604.272686-1-dmitry.baryshkov@linaro.org>
References: <20220502192604.272686-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 22:26:04 +0300, Dmitry Baryshkov wrote:
> Add device tree node corresponding to the ITS part of GICv3.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450 add ITS device tree node
      commit: fc8b0b9b630df6de7415f527fe27c0c441b5dc70

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
