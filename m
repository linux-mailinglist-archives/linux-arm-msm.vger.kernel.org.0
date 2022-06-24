Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6FD559F46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 19:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbiFXRUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 13:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiFXRUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 13:20:10 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AB277FD2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:19:34 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z7so4352250edm.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KS34vGYRSEeom0zBAYcIutCueN9pUJGrVfFONWYZS6I=;
        b=MQpUNRQdH2CMCUcbwB0qvConkQ0Y41WRRGOC1mrEUw9Dc+Sjbe5enP+cumPAVrTUta
         B+L0hqHj5RQsjBSMgV4CGhybdo47EDlRYS4obEZpRzwd3HfVDa3Y7Vba+ZF0qcqQfug5
         o2NeMp7YD0JEJ5/GBVm5lYHwBjXzgpkYuIc6zqMEpWiFBtolOa4APvfnYMwba9JcrQqq
         6sx4bIK6zd/7hxghZEqNNQajIxkpCGl7oE6bbMHN1BtW/cttI4DDeII8LOy6mU2EMYIX
         X4MCTblnDY8ac2pnui+utOl8zKefVGlEhgZZl8Q3ijRsWCeXPKrqnQSz7XsKz8bb6Fq4
         XyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KS34vGYRSEeom0zBAYcIutCueN9pUJGrVfFONWYZS6I=;
        b=CbtH783TazNhmn/pRVSr075MjGfr42gjC4l/w3IF5KpHPoyR4R697jNu02Ak6+g2rm
         FuB3+3cRb+eSVOHIP9fNguA5f+2lk9vh5ve0s44K0Vg4ss/O1e1a5VK+FgP9e2ILCvom
         kadND9mj7RKwCbKgpL3KQQHe+ymmAuEqlfSIhZzHZtjU/7SL35/dE69x6AdtU8oYRRws
         mcMiCGCe7NYGsfRDxWm9ZOLqiHtEVuPqx1VCUtdTSvYv4DI88C9hNYd8fByn4ddzS3tK
         XDNU5VMQtDdRawzwHKbsemsUIGbyHxj0G9ca1P9eVraoOyO3H8vgPSJYva0rZ3TyOyuA
         IARg==
X-Gm-Message-State: AJIora823Fxd04i12xPeDiaqo0QIwnqkgsr3qrpiJvAC/6CpD5k7IzPp
        1JVFBvz0J+V0Q9AQ5UMj0rNDeg==
X-Google-Smtp-Source: AGRyM1sy0G4UxBbA4d5YsqvS5law/GMKQEGgXv43hk/UUfo4dMXlTbf3wk4hUoOrGV/kkymXUz9C8Q==
X-Received: by 2002:aa7:c6d9:0:b0:435:706a:4578 with SMTP id b25-20020aa7c6d9000000b00435706a4578mr196157eds.24.1656091173189;
        Fri, 24 Jun 2022 10:19:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906251800b007262a1c8d20sm1445456ejb.19.2022.06.24.10.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:19:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     gregkh@linuxfoundation.org, mpe@ellerman.id.au,
        abrodkin@synopsys.com, agross@kernel.org, robh@kernel.org,
        vz@mleia.com, Sergey.Semin@baikalelectronics.ru,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        balbi@kernel.org, vgupta@synopsys.com, krzk@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        patrice.chotard@st.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, paulus@samba.org,
        linux-arm-kernel@lists.infradead.org, fancer.lancer@gmail.com,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org,
        khuong@os.amperecomputing.com
Subject: Re: (subset) [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
Date:   Fri, 24 Jun 2022 19:19:30 +0200
Message-Id: <165609116546.68884.16917167353605359946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru> <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
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

On Fri, 24 Jun 2022 17:16:18 +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> 
> [...]

Applied, thanks!

[2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
      https://git.kernel.org/krzk/linux/c/986fd5fe55cb369c34a1dc65b1469aac536a6d50

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
