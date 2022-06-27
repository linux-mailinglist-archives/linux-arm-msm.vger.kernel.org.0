Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942E655D28C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbiF0UEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240911AbiF0UD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:57 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896251CB29
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:54 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-101e1a33fe3so14277462fac.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzGLzW4ZtS4jruJMltFw2XA6BLWVzwJ4EyNXbTelzgY=;
        b=W46n2N5nMZBApIj8vLlHjyY8y5pHvjdBYst/vuLJ6sE2mEm/twshFceX/GX2LJ2EO6
         ZJg1wMNlOer2r28BRpqDp/m9acUrGJdmLSd8ZG6VW1x7yUDtmYgkuKfPVYhMbPOHOhQU
         +g2wO7u7B1msL7oiQkaYoXg5k0BRYSFj55oLVLqbuP5qF8cf4ZZu/wnC+7pBMK+m0A3o
         BXViuj4bPyhgHnmlCr/L73vdsvofW/xLDGkdcOyl5PawKk62u3Q9shQVpAwbm8koApa/
         vIO/Wjxo7G5lhUzwcZvWfeA+eHWQdZUZAlKjUUuhMxU+HUcr4Uw7wQqRM5R0IE3ctIXU
         10VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzGLzW4ZtS4jruJMltFw2XA6BLWVzwJ4EyNXbTelzgY=;
        b=NBJ3kQSp19LHqeQMomgY8BXIQ9JvBWdnWqJ0IO1SXH8EfSXvgFW07yG+m0MHV5s8XH
         4hZ4Ubs5QNrJJxIzvzbkL7i3F00hvwDQjFsKu8m59uFaX64LA6zms2CwhY8ntn0disv0
         jReIq6d+JxmaAkrfdoWNobr7EOv3A0skAndSvf7IRj8UJo3femUYKrkaWBmcc0+31vCE
         lgzMcNcKojOMt1wsQ3gKPLBOW/Dt9nPYc92UsGmD6TXqXNWqYHD8tRACKJ4QRnw+NofA
         kG/q+Q89D581a96GtbB37OAkmlBpUnYPcpLYFQJ4FmEHYnBzPu/+TLCwqCg+5MzDHuKP
         1moA==
X-Gm-Message-State: AJIora9Bkcf2pErWCl1ujltWMLu83WMzMbIJaKcpdebTIHv2hEIMicHh
        vi9V8vrbugHxZqLm5WUn618Xpw==
X-Google-Smtp-Source: AGRyM1t/AoUXZf8AxsYnS9CJkUvmEW+W280zjqUJM2yNjTRfLf+/xFsMn1ZUA6a/oGOAOLqn72AcVw==
X-Received: by 2002:a05:6870:89a9:b0:101:d81d:e970 with SMTP id f41-20020a05687089a900b00101d81de970mr11368835oaq.43.1656360234143;
        Mon, 27 Jun 2022 13:03:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Alex Elder <elder@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        patches@lists.linux.dev, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
Date:   Mon, 27 Jun 2022 15:03:06 -0500
Message-Id: <165636016348.3080661.558126370799129810.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517190949.2922197-1-swboyd@chromium.org>
References: <20220517190949.2922197-1-swboyd@chromium.org>
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

On Tue, 17 May 2022 12:09:49 -0700, Stephen Boyd wrote:
> The sleep/wake state doesn't need to be set here because of specific
> RPMh behavior that carries over the active state when sleep/wake state
> hasn't been modified. Add a note to the code so we aren't tempted to set
> the sleep/wake states.
> 
> 

Applied, thanks!

[1/1] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
      commit: 29f66b625281a3026653fd33b710771a4ae394d2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
