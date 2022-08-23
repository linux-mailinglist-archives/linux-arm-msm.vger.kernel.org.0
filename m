Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DBD59ECED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 21:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiHWT4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 15:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbiHWT4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 15:56:38 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E4B883F8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 12:05:34 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 202so13058011pgc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Kdb8TxBwkoe3B83ftbWvI5bDuEon4/Ru3EI6rNbmWGQ=;
        b=Z43eXf7sSp1pEmvfjoOW73lKT1LlllQnMFnv9B3dxhgO56wTdDsGRHhL+uMhTwxJxe
         6hNMX3LPN8+gR924uesklbfSY7g4v3CrRBOEhPQPmQprz2riJgnmlZV6S1ItTsUk6p0f
         Yai/xfjAr7wSQXab8eWRJEHot/0yLlRO3HyYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Kdb8TxBwkoe3B83ftbWvI5bDuEon4/Ru3EI6rNbmWGQ=;
        b=B3wlVM6qDTYjTlPxHkfIh/JWT9hM0k+ro+aPgBZVGBAn72Yijs9gkG8ao9SpLFPp8n
         dIqb0KyEFIF8RkVNoc02jE1zHA9QnPHntITtU93NjXYoKiXk3IO0zU2hOM2Zy1bW+sil
         WGW+lxDwh3ME4dBSzBDy33/95Z/2i9upQP3z2BVvQMBiemh7Q0wT0hJ3xLGs8uw5EQm0
         dP0XFMVW0Bvc0wsFpzBlsARbGvqAApNBvtKnvN2hJl+FiFVy9DJpBwdCq9G50QREc5Ja
         m8zD4jheiAs525DjqItDEChlu2BXWD42Gv5w6Qsshcmz1qY5cjS7s/b1xyTlt1PhGF1Z
         thJw==
X-Gm-Message-State: ACgBeo2b/4APDgacdbfGAb8clk4oSfC3jvlxDomAY5kK0P+LHSudDUNY
        04TIIpYc+15Icd6CXGRaA68Q9Q==
X-Google-Smtp-Source: AA6agR6IieQ04uStZ7vlgwdj4aRqXinsIAlMP+KbxaXdW2rId0+ARMMoqZr7isvwnxHsH3I//9epxw==
X-Received: by 2002:a63:5418:0:b0:42a:d773:cbd6 with SMTP id i24-20020a635418000000b0042ad773cbd6mr5543100pgb.106.1661281533664;
        Tue, 23 Aug 2022 12:05:33 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:fee6:a961:5d1d:553])
        by smtp.gmail.com with UTF8SMTPSA id e3-20020a170902784300b00172de80fec4sm5824250pln.69.2022.08.23.12.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 12:05:33 -0700 (PDT)
Date:   Tue, 23 Aug 2022 12:05:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sc7180: Keep USB GDSC power domain on
 when USB wakeup is enabled
Message-ID: <YwUk+ymRUdwzBTnX@google.com>
References: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
 <20220822235207.A4D8EC433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220822235207.A4D8EC433D6@smtp.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Mon, Aug 22, 2022 at 04:52:05PM -0700, Stephen Boyd wrote:
> Quoting Matthias Kaehlcke (2022-08-22 11:53:10)
> > Set GENPD_FLAG_ACTIVE_WAKEUP for the USB GDSC power domain of SC7180.
> 
> Why? Does it fix something? Please add details to the commit text so we
> know how urgent of a patch it is and why it is important.

Without it USB is broken after resume when the PHYs remain enabled
during suspend.

Johan just sent a patch [1] that always disables the PHYs (again)
during system suspend, with that this series shouldn't be needed.
It is possible that in the future we add a mechanism to keep the
PHYs on depending on some config option (quick, kconfig, ...). If
that happens we'll have to revisit this series, for now it
shouldn't be needed assuming Johan's patch gets landed.

[1] https://patchwork.kernel.org/project/linux-usb/patch/20220823124047.14634-1-johan+linaro@kernel.org/
