Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 990C857922B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 06:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiGSEsR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 00:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234481AbiGSEsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 00:48:14 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DB433E20
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id z12-20020a056830128c00b0061c8168d3faso9147999otp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HCRXTbgWmGWCrtfF1/wxrO6LVa1/UB+3ITVhXItZBKQ=;
        b=WKWjDptw1ODLxsIcyhHWRYBO3IV4e2n282ExiNANC27yzmqNV6RFel7iRKQsAr7mFJ
         TCQ0N4Fw/c3ebjTKEY2/9esb9rskDABKgROj0QJ+KPNv8GCqWvutBccaw+Qp9ajwaYgb
         crHT3vtmHJ8dQ6qxMEtRtSKSgEG7HMrpJ14eUx3l/TLSya4HJF6OGWc4nygLi2RWSU7v
         0gyiDZKNQbjOArLPUguk04vNguByTU7fVS+ETX8hfEuyOGXOPfnGhIkSxcVU8TNgnhF9
         syCabeWGR9G8CwhLEW1SRsRqrPeF3GcL19TABsycAZHfjMrLX0NLmLx6tE+s3Y+OPIZD
         RPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HCRXTbgWmGWCrtfF1/wxrO6LVa1/UB+3ITVhXItZBKQ=;
        b=FjR6rJ6qOaUb6o4vIxJxL8NsnlfnKRGseTGMX+IDxDY/0SWRIme91yOrDEx2GOGozx
         Cyh0S7CgvPop76g+W5WaZcWPzd7IH8e5bxL/ja4Rjxw/CP45rFtlwxe/h2LOc/X3MMyb
         4iFFG4I79lsax/H/Vnk8RTKDfeQxqOf8XgpBM1LdXNKKushliNRnZn03bcQ8y9rFUVhU
         f4R/rCbxMuWIwDOdz+yW/O2T1LgSgn2t6ZY+qlPmiCNvFswfM1k/NPWiKdbQkac/qB2M
         OFfFodPhK5UH1xjhwMVRBAyaC+LVpRVGFjszphyJKs1u3kxzCjRZ7UYr1XGesfFLtirn
         avpA==
X-Gm-Message-State: AJIora83NQqcf+x8lXHjjOZfSjrTbO0+qZ7Pkd1Ukr2CQ7n8cLxVDc/p
        yO1F1jScgQ44sh3/lWNM3NVQmg==
X-Google-Smtp-Source: AGRyM1u9ajUSBuR3urB/e0EsuyzDadR/9DSUOquZD2pdRw7dhPrGBe46kge5VtDBlcFLg57OsLLnuQ==
X-Received: by 2002:a9d:2663:0:b0:61c:7ef9:c117 with SMTP id a90-20020a9d2663000000b0061c7ef9c117mr9493391otb.170.1658206092643;
        Mon, 18 Jul 2022 21:48:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     konrad.dybcio@somainline.org, bryan.odonoghue@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: qcom: gcc-msm8939: Align clock frequencies with downstream driver
Date:   Mon, 18 Jul 2022 23:48:00 -0500
Message-Id: <165820608071.1955453.7214407601083794736.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 13:59:16 +0100, Bryan O'Donoghue wrote:
> The gcc-msm8939 driver is a copy/paste of the gcc-msm8916 for the good
> reason that msm8936/msm8939 are an expanded version of msm8916. Reviewing
> the qcom driver though there are some obvious missing/wrong frequencies
> which a simple side-by-side comparison can show up.
> 
> This series captures that side-by-side and transmits into updated frequency
> tables.
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
      commit: 2bc308ebc453ba22f3f120f777b9ac48f973ee80
[2/6] clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
      commit: 159b2f59d65b4d34e225ef8d96ed290a13610d9c
[3/6] clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk frequency definitions
      commit: 680b86da10a23268b24d65b567830824075eb151
[4/6] clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock frequencies
      commit: 2c37d70c82e826e44163ab2c83f8b7b81e7db35a
[5/6] clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
      commit: 2573f7d8629afc1d2c5f841b8a2b2359396a5e77
[6/6] clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies
      commit: 873b98538491feb0b0548ea1a8ee054fcfe0d435

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
