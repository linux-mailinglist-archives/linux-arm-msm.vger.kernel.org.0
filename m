Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886954A4E0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350236AbiAaSYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350232AbiAaSYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:24:35 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B17C061751
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:34 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so13812782ota.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vcp57uTgTwBWgBLp1PSC2i4aG9uW9mVxuFyHOWPl90s=;
        b=ZUFlOw6YWoRiG9v8+idf2fUPNE6CdlNm3XWQiZ0kR4yqJI8DSz1EIedaMrh7D54co3
         nPY5lXaynwhfXQ8kH+SrVFjgsI+lMY1JRz+yz3QayA5IOxnPp+JQTGyQUX60/a0amyNE
         ERCulOGRaYG04zWdvioK6oNKLb/7+k3brJT66LaD4VQFPb+xlOnhinqMYeoL6IG7tscS
         5hQDMEAkkNOa41QVwxOenr9LguZAK8SE9UvDOGn/icDBU8843f+DohF/kdcfaOAYJfRD
         xlvpqeQDSx+a7qgK16o9i/5CfTlSmk3xq0fkVG3uXo2p+zRF/krJ03hxe7VRNGqArIlL
         3lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vcp57uTgTwBWgBLp1PSC2i4aG9uW9mVxuFyHOWPl90s=;
        b=H3EHBB0eTtIns4MZnEl8ijkQQCoGWc4ODE0G+Xb83iu84A9ymMDeZ9J/RcVjao1Sbj
         E1YEONGlvDUPPuzNATCGE43ZzIC1ukwBMzpsx32XjpXI9jBlJ3zDQhusapsyTGdjwyIe
         zMi4fHs6TCO/UTEPFXZNSmVBbfV1FETRI31MahSkmj0v1XhSxdTltVR62R+LQ+wTtDXv
         P3tnU0qzLJRJ61elsIAi3wHhDKefs4UhhLhBVrVv0+CD8EGzP+2EOUkubvRh07Uh5hfq
         QstfOwd0cLU/bN8kefNfUtLsXQaT1/5gyOg0iqYJ8yqGU3EP4N+5KjQsp9Umb030tWFR
         wQkw==
X-Gm-Message-State: AOAM530BF9UR1cN7XWoay0cVY2+l4qib2hkF3OlkMIu7Vk0+x21gLple
        98tpGpBO+reCBRX5wfqLyKg3OnQwT3WiWg==
X-Google-Smtp-Source: ABdhPJz9ABtne16Besa5QWQfsTPhvqgFJrfvLl7X4rLIwEah+wm6uQnQ9RfwFjIdtcDXnhOy9PG/AA==
X-Received: by 2002:a9d:6a42:: with SMTP id h2mr12043974otn.269.1643653473788;
        Mon, 31 Jan 2022 10:24:33 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:24:33 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-lg-lenok: add fuel gauge
Date:   Mon, 31 Jan 2022 12:24:22 -0600
Message-Id: <164365345128.3009281.2908909608307857119.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211118205834.160308-1-luca@z3ntu.xyz>
References: <20211118205834.160308-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 Nov 2021 21:58:33 +0100, Luca Weiss wrote:
> The device uses a BQ27421 as fuel gauge, so add a node describing it.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: apq8026-lg-lenok: add fuel gauge
      commit: d63642596ed1feb832f8cdfb8f166a18fdb03831

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
