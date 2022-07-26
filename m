Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24EA3581B33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 22:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239439AbiGZUle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 16:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236260AbiGZUld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 16:41:33 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F55371BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 13:41:32 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id g1so11915109qki.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 13:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jeFixDPfE71QMWfSEPLhQ0hQsRonHTELVwxWS7yvUS0=;
        b=S+jU8whJE0OvzGwWSxD5K+sb9CCgpxmMPNl3HkH9OF5g+tDFnVlXt5BLvj8e84b3Qe
         5S6vZn70agIERKmCx6f0GW88foe8CyXNQIRXMlFBIL3h4B6yTXI01h459azQgealo8H4
         Leh/QJZDIT/tCyFzWGInBK7PgoMYtzL5V5Xs8Af6DLJNA1sU5FlOhnl2QsS99r28yt4T
         +Rz/xGsA6poNidUpQcScZh9XrgGitcZcW1yCH/Dtct9CtYzuYD7m2A+R3P1D1v2hEGkk
         fUVZGtOByijdRka3XQGtreGsRwNg4/NVSmy5AwkRX0CGSSxt750ezLbZuCAqMfGfxo+1
         MaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jeFixDPfE71QMWfSEPLhQ0hQsRonHTELVwxWS7yvUS0=;
        b=XNrnN1TD/CCnh8CgAHCNuyVqhX4oyFkEM/FKyMLPR0x+ABNwqNjCrHk7sPBgug+Kdl
         VqDcuW5BvUQffsHCXv8N8lHaH36c4m/+pwShrDOBeuv3tCR5Scpfl8A6/uHc1LF4b7j0
         7mHwUJ7+8SARymzdNTcddurdMoplOdPNP/IAfN/vSz/dsoBjZYgCnpyfJFfhhkYFSUzR
         +HyolCnopnpwM88PjJkEpfxUuT6lXw9bSNX6uB+QEZXQ2NmR6FPRAHU7jk6ZJ0UUrQE4
         OFFIQ9nKQ9wOoj8V8wn7w/0UqEK5h4zklW3EPNxQ24qmoCgKlvdSUkkgD64ClP35XL7a
         7N7A==
X-Gm-Message-State: AJIora+vF+HwiiHtbp70bxhSe0feuksrATxnQw7FWwZt/i+Pche7bfm4
        wndoZUX2fEYWjDxYlRLxXgHiTsRI3LMZOseIr0Wd/w==
X-Google-Smtp-Source: AGRyM1ugGeT6HXgm2s+CocGaha1OabRyGGWhYG97BOhDTu1yl9LfJKCkKayV4hqWRGe4iSsuMxMlD26zXuCNKOjEhKk=
X-Received: by 2002:a05:620a:4305:b0:6a9:3829:c03 with SMTP id
 u5-20020a05620a430500b006a938290c03mr13519778qko.363.1658868091261; Tue, 26
 Jul 2022 13:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220726181133.3262695-1-iskren.chernev@gmail.com> <20220726181133.3262695-5-iskren.chernev@gmail.com>
In-Reply-To: <20220726181133.3262695-5-iskren.chernev@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 23:41:20 +0300
Message-ID: <CAA8EJprtwN8OJAuM7XwTAWWBa2y71T4AmZxb+5TUnRdvZvnQTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] regulator: qcom_spmi: Add PM6125 PMIC support
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jul 2022 at 21:11, Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> Add pm6125 regulators and their sources in the QCom SPMI driver.
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Please fix the order of sign-offs.

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
