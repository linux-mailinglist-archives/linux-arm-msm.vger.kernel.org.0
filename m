Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8864569811
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbiGGCbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbiGGCbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:41 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153F32F3B4
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:36 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10bffc214ffso12960765fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mA1lvyszFduS/99/MChGCFetUx4AgZKBxyvoUM2pqRo=;
        b=aiIQO+9g2cLgUtjQKUAHSsgd/s59gwdgrVajR0gjDVjthJG32PXA/CTHqfty05t2eL
         pH8dtWhBJMqlSBhxf6K2WHsoseiubwogGVmZa6G1w8LidLjEvvvk/FyAEfmt27mmsQ66
         7N1EsvXaCeYXxvsE5GZGdRRtzLLWuO3l++dR7XrgOkFHrY4XeYCiITWz2JxMjKFGTtI7
         IzGco/R+xnp1QdqZ9Bqng4zRPtJ7fSRGpT5EMDjyzsWyG9Y8Vw7JdbHxQAvUuGEWz8+d
         XBBTK/RnHzY+HZurB9hq6OEesloDCDxbq+B1MUsWz25SF1UbBUWI6vxnlvxCeKjaoXR6
         /Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mA1lvyszFduS/99/MChGCFetUx4AgZKBxyvoUM2pqRo=;
        b=ioo9ka/qujkgi4N+0lqOtUUM7+X2JpwrpO3haJx2SBkoWvFRyaTZ5YfR72r7EjCw6a
         D9bdbzsU799H/W83RxP0udss0DwbJU1A+SFfclazD+0AVcXZmR7bJtgsJ3dV63nPsPty
         +pwXzg873mjzI+zokwsECiU2KIYFwxHRvTvW38G+z1d7Ex1OrbSBfjakjlYcpkfixzpX
         GBEkJyNBwsMdXDEuiM+jP4qjokwdoVhOO3fY3dQP9aUHwHXcjg667K8wkm0JnGAjd/iA
         Asw1hbiTNY2DmycPLNar2g8fOGpt78Cj9tMk2Uwp0Iv7mgmligRuNQ34Vt3aTHXfg5qt
         gZlw==
X-Gm-Message-State: AJIora/4VC88jeJ3448uJZ/JvISv/t5KVNE/O+5JKGZF3PkxDfc8rUFd
        dxXWwrco9iJdkHdVBYo0EPke3w==
X-Google-Smtp-Source: AGRyM1vkaXbgxNeCIQkTvllc+bZKt2ZAPV5Fhnj81Y0QZU0HGFQ3NlkGpBUW2P7GDcgijGtuCj0SnQ==
X-Received: by 2002:a05:6870:7a5:b0:10c:1c39:3475 with SMTP id en37-20020a05687007a500b0010c1c393475mr1256187oab.164.1657161095773;
        Wed, 06 Jul 2022 19:31:35 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm6125
Date:   Wed,  6 Jul 2022 21:31:13 -0500
Message-Id: <165716107314.864223.9871410484260306384.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508100336.127176-1-marijn.suijten@somainline.org>
References: <20220508100336.127176-1-marijn.suijten@somainline.org>
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

On Sun, 8 May 2022 12:03:33 +0200, Marijn Suijten wrote:
> Both the sdc2-on and sdc2-off pinctrl nodes are used by the
> sdhci@4784000 node in sm6125.dtsi.  Surprisingly sdc2-off is defined in
> sm6125, yet its sdc2-on counterpart is only defined in board-specific DT
> for the Sony Seine PDX201 board/device resulting in an "undefined label
> &sdc2_state_on" error if sm6125.dtsi were included elsewhere.
> This sm6125 base dtsi should not rely on externally defined labels; the
> properties referencing it should then also be written externally.
> Since the sdc2-on pin configuration is board-independent just like
> sdc2-off, move it from seine-pdx201.dts into sm6125.dtsi.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm6125
      commit: 6990640a93ba4e76dd62ca3ea1082a7354db09d7
[2/3] arm64: dts: qcom: sm6125: Append -state suffix to pinctrl nodes
      commit: cbfb5668aece448877fa7826cde81c9d06f4a4ac
[3/3] arm64: dts: qcom: sm6125: Add DLL/DDR configuration on SDHCI 1/2
      commit: e5de51e264e147d4bf882a464fb89501e9c87e14

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
