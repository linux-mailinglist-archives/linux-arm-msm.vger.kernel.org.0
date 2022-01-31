Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF394A4E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350534AbiAaSYi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350281AbiAaSYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:24:38 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7866C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:37 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so13826875oth.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ASaMitgkrmjvWUALYvAmhPqFdUVqEq221GRVmLCMeTE=;
        b=rqsuJkGoTMqn8mFbQYyZwrLCcvhJUqSnNfCp4U3fwGRFtz9JLNTLwsE1uydNzvyUSM
         isdT9xZQYAtg4or5rWFfGYqxH3n6p103IT0NkgD26NordbifY0CYtyFcr17pTq+jAKkm
         3F+tphZsX2ObGSnuXwjv870IQj0jpVBjfZQMEO+Eo/OrXqTmuoAYy1j6bJFKc3x1ksQz
         sqPUqZOSJIbWMhNvzIW+EBtX7h/LVLVSW25oJvvWUdRO00niabFHoCsV9GkONfeAKr7x
         Si6KxBjod6x7neUpuc3vi2Eo7WtnSoXOn0HiCrYM0JssDdzGY6MGE80iNlzi7T9XKbKd
         ILhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ASaMitgkrmjvWUALYvAmhPqFdUVqEq221GRVmLCMeTE=;
        b=Q2OumcjDMA06tNx+jbbneTI1BrF+19jYpqMKAxtSYibD8cG0YmA/gl/sodklP5OOB3
         XDh3oFJQjA6lWylRrx2nUpqV3ttR2T0XW2ZnmjF6w/zwH5+y16YSilNMXpMyAYhFuTFB
         VoLEM7BZYbBsrGvUx6S8Pw37ubrV4TBnR7UxHWRW2e1e0Tv5zXn/eAAde1bZP5cMzeK0
         1eSNhZ/lvvi3WrmagT+hcK44SCfIAcXpROnbeVBpKS6Z/m++mvTGypCeWCz8NOY2EUjG
         ywdGdbF+b5FB+gTrNXcqC1b+PsSRbrRPdZbT4nbDWMWg8L1WJV7Lc2wvNVNihMU8pv4i
         e9UA==
X-Gm-Message-State: AOAM531peyX6BsfS2zqNBxPCbqW12c76VxEIrQ6CYnfFdDkMXqDMto/B
        prU+W7YSpVK+VBvNOYDOo6ucyZO4acZb1g==
X-Google-Smtp-Source: ABdhPJxgjyy80Q85q0aqiH2ROnY9l3ptaA8QRaWNJ6IMhnV4OxQaFvhJtYAM0/1o4A6hsHWQw7QnDg==
X-Received: by 2002:a9d:3661:: with SMTP id w88mr12285764otb.245.1643653477318;
        Mon, 31 Jan 2022 10:24:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:24:36 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        robh+dt@kernel.org
Cc:     robdclark@gmail.com, quic_khsieh@quicinc.com,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        swboyd@chromium.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
        seanpaul@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sc7280: add display dt nodes
Date:   Mon, 31 Jan 2022 12:24:25 -0600
Message-Id: <164365345128.3009281.4776568093879192722.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Nov 2021 16:56:06 +0530, Sankeerth Billakanti wrote:
> From: Krishna Manikandan <quic_mkrishn@quicinc.com>
> 
> Add mdss and mdp DT nodes for sc7280.
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: add display dt nodes
      commit: fcb68dfda5cbd816d27ac50c287833848874f61c
[2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
      commit: 43137272f0bc5e05e4c4c6f7bfce017bfb9e16b5
[3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
      commit: 25940788d170251373d8975d359706350818fa0f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
