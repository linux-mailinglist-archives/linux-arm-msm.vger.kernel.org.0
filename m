Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B174A568E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbiBAFV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbiBAFUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:50 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40519C06179A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:48 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso15145529ott.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2PcyukK9KnFLWN3FZfFzYij+LYID+/ousuBXfKbnwaE=;
        b=bTOyXtUZFfQWwBId/wD50JeMqh94b4EcH/Z8bkRFARquaCX/ukIl0jwy7NLgTU7vef
         BiU0Dw9HEgfFFG9oQZXRymCnbSzOkXMGncb5m8rOKa4lzT0DTVOFvDORyI1oC7NC4T0Z
         d3fIEbyeKHa3nz7aIgP9p/EgwCjuT1V1LGeVmmuFfo1LeBWF0W7+uX9VBO9kJyHPSHUH
         eqXfql+3b6fUpEqfXGdEdsc7oRz8HumZHZMz+Kgy2bnNNXlWZHO5V00wcM61TrfassDN
         8MeGAxabx9xOnVuV/3zmmXtI0TPhRTBwpiodk1o2b1T8nTi2eeVLkM5QpyHP2gFUHfi7
         RRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2PcyukK9KnFLWN3FZfFzYij+LYID+/ousuBXfKbnwaE=;
        b=I9Tpv8AYqSXKDU+wxeRhZl5JWHtiI4m7urYmNN8JfJPKtNlqK2tX0iT3BVsLjYmi1u
         1pkEVRh+mIkOBc8vpWhjdB/WYcnZ20INjuk+oiwCZt+VLEZmtxTdqI4Dd42pGFxSkzTc
         smBeThFXHfccLBBwEvYh8BsfPnhJOM8kvCQ5Z9ntP2LIVD1bPAtWblcOPtQ/zf8Loo5o
         1v+ZrMO/Ac5/WDQlLKqvr+ekEDuszDpPZyN4EcRHCc4EIgtOJiYHNKBapdNhllLZxtpp
         0alK07x/zHPU88owa1yZIPJUlHtw8Hg1jdqznXDFyyfxNl3gicIGwcLSqFJo4JFazZYx
         WVlQ==
X-Gm-Message-State: AOAM532M76QRI2/5VLrfyxBvHkX7xaP0kaB49VhYXjPXfZOSg6FQqwLe
        DoAzrgSIY/wOGE3C2E0R6CUAXQ==
X-Google-Smtp-Source: ABdhPJwWfn1dx2Gvsw0pW7nMiXz3NjqfUHepM3OoxuGa01ZijiMerd8z11/p1tWPx9W5nSBUM0APag==
X-Received: by 2002:a05:6830:448c:: with SMTP id r12mr9745305otv.114.1643692847655;
        Mon, 31 Jan 2022 21:20:47 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: (subset) [PATCH v2] arm64: dts: ipq8074: add the reserved-memory node
Date:   Mon, 31 Jan 2022 23:19:57 -0600
Message-Id: <164369277344.3095904.15558175363899954053.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1641560078-860-1-git-send-email-quic_kathirav@quicinc.com>
References: <1641560078-860-1-git-send-email-quic_kathirav@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 7 Jan 2022 18:24:38 +0530, Kathiravan T wrote:
> On IPQ8074, 4MB of memory is needed for TZ. So mark that region
> as reserved.
> 
> 

Applied, thanks!

[1/1] arm64: dts: ipq8074: add the reserved-memory node
      commit: e4a4fdcf70854de2bd9bb774a0985aa9dafd2e1c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
