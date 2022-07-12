Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4648571BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 15:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbiGLNve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 09:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbiGLNv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 09:51:29 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAD2B6DB9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 06:51:28 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-10bec750eedso10372602fac.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDXOKs+rDKNhOk/fRlBZN127C3FnyD72OM/nCMUbmuI=;
        b=X0EtsBvh4iBszyVbE+GcYOSIqIxi7vtNSGCHkFf0YpFAXQeBPwHlJdXzstPJvFjdE0
         LgQrqxonEP3sTOCIbUXXop6jInx1WgAFwBA7/wAprPFnLqv+xJapsE6F7bcyq/jjJAT+
         +5NDYojoqtgbgjWb+d00s5B16wMVbiXmdaXPeBw7wWXcAVQZqwwGs93zwoUjfLcyiatM
         DZ7TsVM53JvqkjfwUKqqQhNA8asgu9/zDCO+AtaTkHfBcWrozm2jtbn3mmSeMKLm1oQ/
         kvds33LmSFtPjxz0IwpRjWXDSpHYELmOswhSQte/d+KIjLxrVswWygDpgBPPsjMGn5MN
         6RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDXOKs+rDKNhOk/fRlBZN127C3FnyD72OM/nCMUbmuI=;
        b=4smK0f0m4VzS82dnDWqo/UnzRYJqZcp3Z97ofU4HI7i87NpddNZu1iLDa0r4Ftxmn1
         IDjm4h4LYsepXg9J98qlENCH+ht9lbMT/HFOTBeCjNETLCOOgYPJDqQngAZwLuMUrxvl
         GFLzh3cR5FCeK+jqXAy88MMbh65nGeqTBIfzr3wArbM5RoD4dxlNp9noSKlLN/SCDFR5
         /iX9O68nm+7hWAqwz2cTAv+b7XjiVlgmYhqDB2k7kPvxjh8zTbXBKKK5m3CgQjujsHSm
         tuiUgkpMIW7JjdvaxfeF1dE331l132RB/PyNdXFGlOYaAzUEPZs6a0W01xEJoRmasdK/
         Tvcw==
X-Gm-Message-State: AJIora+aj/p3LCl/Ebd7KRcQLOO+PtXO+d0m7ZGTFMPpn5xQDAIpQ1ZD
        nlQlO6K9TZZmCr2+R428wqDXUCEOBDVamA==
X-Google-Smtp-Source: AGRyM1sP7hraMf/flqdnMvfurGaJaF7hyOmgHdDcJibfC7e4rwMFS9Ohm5cPaZdV0APMAixOgEh77w==
X-Received: by 2002:a05:6870:a786:b0:fe:3c4d:6cd7 with SMTP id x6-20020a056870a78600b000fe3c4d6cd7mr1894639oao.118.1657633887145;
        Tue, 12 Jul 2022 06:51:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q31-20020a056871081f00b0010c2d339ea6sm4508756oap.23.2022.07.12.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 06:51:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org, kernel test robot <lkp@intel.com>,
        martin.botka@somainline.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc/qcom: Make QCOM_RPMPD depend on PM
Date:   Tue, 12 Jul 2022 08:51:25 -0500
Message-Id: <165763387938.1310772.9037592874634681812.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707212158.32684-1-konrad.dybcio@somainline.org>
References: <20220707212158.32684-1-konrad.dybcio@somainline.org>
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

On Thu, 7 Jul 2022 23:21:58 +0200, Konrad Dybcio wrote:
> QCOM_RPMPD requires PM_GENERIC_DOMAINS/_OF, which in turns requires
> CONFIG_PM. I forgot about the latter in my earlier patch (it's still
> in -next as of the time of committing, hence no Fixes: tag). Fix it.
> 
> 

Applied, thanks!

[1/1] soc/qcom: Make QCOM_RPMPD depend on PM
      commit: c2d17574ae1b631a81aa88af6846c5b70df403e9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
