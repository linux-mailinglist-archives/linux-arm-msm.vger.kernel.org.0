Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56E479BF62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343694AbjIKVMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244573AbjIKUm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 16:42:28 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC59F101
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:42:23 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d804639f346so2470460276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694464943; x=1695069743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEIA/8aud3vgSnOzW2FtgQVjHmTcuWpn5RfnhreW1sU=;
        b=enJUlXhgFdDmpOAOg8xkfcgpnsMJB/yUyXEgIe4shAtLXouIqPMM7c+t0iitiunTfH
         vUclmE4kVpGI+JrodTGOOIX4Ebh84O4MrVUTSqqV15FIQKJZQ1yiTBwk8il/u56FgYP+
         dkUpMpQjqE7llWoiLDYYmuH9AP9UlXNDw1AEidYJe9MJ6XTwzOSLGhi3iVfo+2uhFrqR
         v0JEmBhFMzoW4Ya1CA0MuNqBBPTWbkeZwxWzK3K6GjETLYB64HdYX5oOfKURfRhW5oMw
         lEuoxTvF6986AaVxOWVgxcmJmKf23YdNuwFB8LjWVkq5thf3UL8QvMsi7awMf5Kuhvgw
         tAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694464943; x=1695069743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEIA/8aud3vgSnOzW2FtgQVjHmTcuWpn5RfnhreW1sU=;
        b=SojWiPtmTkLxpuinzlE7Mgbd9d9LjqVnGCTempmqvsDcNB8gwlglT2xgfE1YELWX2N
         VxZpIrFRTfqZXsWRebuPHqsnIfmwPrxxRVdZFdV+7X17F2mwhljpJzuSxAkAJYjJd+oL
         urJ253T7Dz9jfYXBfoCnaCM/tXwvlyQoIFFUO+TkNMg7jGuDeXOvgDVtPu0BwbrcYfjv
         LF6BkBSa21kvTbuB5HdaX7aom4ECX0IlA+4AHtizRcKqKPoz1L9nzQ6Fn2Cjz3wTwXmj
         mjsQOp/hhhk5VURv6FvcL3neOQtvoV2CB1P+Wd4BJ85vaMLryM8DPXikvwSTpqvpENuO
         Pabw==
X-Gm-Message-State: AOJu0YwcC4p2NbjpsqyyUS8a5Xip0Gag7SSRVSs7Bia6crvKgx5ehp5x
        ojBUwRs0hzmIwjmuNgm2Tyfy+cmwrCjwl/u4e7zQxg==
X-Google-Smtp-Source: AGHT+IHKTl+Tk7v4VRWc2+pmMGmLTBvoSAN0x/s8olCSqdjoFR/fodulyY5AUr959b9GdfN+mlpf7C7gQvu8KAWzGCg=
X-Received: by 2002:a25:d85:0:b0:bf2:b00c:f09 with SMTP id 127-20020a250d85000000b00bf2b00c0f09mr9895098ybn.40.1694464943168;
 Mon, 11 Sep 2023 13:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230829-topic-8550_usbphy-v3-0-34ec434194c5@linaro.org>
In-Reply-To: <20230829-topic-8550_usbphy-v3-0-34ec434194c5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Sep 2023 23:42:11 +0300
Message-ID: <CAA8EJprLTBMqTRJ9-qrYVaUf1D+YCw9Ndq55LUMiYfUTF7CuJQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] 8550 USB QMPPHY fixups
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Adrien Thierry <athierry@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Sept 2023 at 23:07, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Inspired by [1] I went over the 8550 QMPPHY init sequences and found
> some inconsistencies. This series attempts to fix them.
>
> [1] https://lore.kernel.org/linux-arm-msm/20230828152353.16529-1-athierry@redhat.com/
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v3:
> - v2 except it now compiles (missed .c change)
> - Link to v2: https://lore.kernel.org/r/20230829-topic-8550_usbphy-v2-0-a72f43311d19@linaro.org

Thanks, this looks good now!

>
> Changes in v2:
> - Pick up tags
> - "Q6" -> "V6"
> - Link to v1: https://lore.kernel.org/r/20230829-topic-8550_usbphy-v1-0-599ddbfa094a@linaro.org



-- 
With best wishes
Dmitry
