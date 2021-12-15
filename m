Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552954765C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhLOW2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbhLOW2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:01 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32B8C06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:00 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bf8so33743494oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vIVXiGfUpcNHajlVwayi7ZXVOYdjzHmlLf5e1SFw0vM=;
        b=ghDFVvgDJuVmeCVQaVAh45H1K8RdDeKJKREPK4B/ysZAGmKJdmRWq8tZaXfkNwdbYe
         ALWb9ezC6unB+Z9uMU3wlo8HWSNvepUvsCNh50tl2gImnBeR8msA4ondq2aiYcYu3e2L
         4OL1NPdBui+Qdd68zGLr2HYHkfuvBSipPwEyd1rEQxojTrlOGilPjSGD66eBkhb7RUvf
         doO5gN9uQGpaGyBihnAMW7EjOtyCO35WyZZm05WnVNdCV0rJpjFSuPa7Tn4ZXpT0LP7t
         iB94QX9SJ+aeA03lFThCZGB9UY9u1kDCb/vPHDF1RLwxF2WV4nk4rNFfm+Vs4jkP++j3
         YpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIVXiGfUpcNHajlVwayi7ZXVOYdjzHmlLf5e1SFw0vM=;
        b=Xv0X1lNzhbWZHXvRFdoJ/ClkQdAokvCojyYENejhY/IqQevWI0Ppi8VknYT1Etglim
         +a2Gm82mIPneacVepyQCd9j+OoUqsVNA7ZtMYLkigHqBE1xTH9sM1M6N/ubjr6BI5JEw
         AjnVw8LakkbnCv1bScaoYRQ8Ow1r39l4/ajVrHXpTGBdR8kM+aCtFlX0sYd1XGz0RyDm
         ySGSnPPXfKIda6+bDvMwo0cay95BJPlmUHyDwuKVtlF2eMVvwTFIQgKO1bxWUf104Vmn
         cHccx9iVRczcCw0z/Op5i0YgoI7ZEOrfsxHmranWuFCMgxHnhhijpTilj5Qg4XPDkG7a
         xWhw==
X-Gm-Message-State: AOAM530c1pGBu/ZoODAESoat4aKrsNyeNqLcFwZGtsSK4kOpI3V9hs/x
        Gh1HNA0ZkSchpSX3IGsukiNWJg==
X-Google-Smtp-Source: ABdhPJwyLbS2ZG5HTaex00cPe5QptBuaGUGdhn0FouyMrvpYmlKxeV39hiWGUNz4eB+RvIvOBk26kg==
X-Received: by 2002:a05:6808:1283:: with SMTP id a3mr1839688oiw.110.1639607280198;
        Wed, 15 Dec 2021 14:28:00 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:59 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com, agross@kernel.org, soc@kernel.org,
        olof@lixom.net, robh+dt@kernel.org, linus.walleij@linaro.org,
        sboyd@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add devicetree support for SDX65 Modem and MTP
Date:   Wed, 15 Dec 2021 16:27:32 -0600
Message-Id: <163960723735.3062250.7838330411965052999.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
References: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Oct 2021 17:02:02 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Hello,
> 
> Changes from v2:
>  - Added cmd-db node to the sdx65 dtsi file
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document SDX65 platform and boards
      commit: 3b338c9a6a2afd6db46d5d8e39ae4f5eef420bf8
[2/3] ARM: dts: qcom: Add SDX65 platform and MTP board support
      commit: bae2f5979c6e537334c9099013b5407019e88c44
[3/3] ARM: dts: qcom: sdx65: Add pincontrol node
      commit: ff8b573a6ccf4deba10285abef072c577099e038

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
