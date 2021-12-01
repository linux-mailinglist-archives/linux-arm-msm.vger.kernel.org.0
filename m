Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3155465121
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350779AbhLAPQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350719AbhLAPQf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:16:35 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61778C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:13:14 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id bj13so49142711oib.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3RQcdpO7yLtJk3jz+7Mq1SwdKr4AoYiMVs79ZGuQ6Bg=;
        b=qVSG3k8n0SCyQdd5QswAMknJqcazkTwf0kmR1ny1pXQGQ3AtpXRRugc8frkQRQCA5D
         hIO9jTdRLhT7k2KPl+eZxwnpI7YZ4s57xnmo5FlFGmdJSrpRSCtI/2YrNu+Kxn/wo4I6
         lEPr4fWqqK56mZdEj+wFM1Ja+jmrEgjZJAt2hsPzIux9aJlitDIbxgJqOq+xj77ZQHxe
         hx8idli3WnsmcZo8+iGpN5xKLSbDtP+LWnsKWfIlXqdcpGVcoCUXFqb0g3eTTSF5fOG5
         4Ci/qdUiIeeZqwiiKKX40Dv6ygVMYkFryKdV2ZQRZVNZHsAJzRpkbESCCDYL7iaW966Z
         z4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3RQcdpO7yLtJk3jz+7Mq1SwdKr4AoYiMVs79ZGuQ6Bg=;
        b=BSHDDkBjASvIsajwjpmxlZFqOatk3Qtnr0A7m7VUvUW2MSsdEEj8McIjId+pElPk1h
         OPBcqB00F5qzNrKZTZv+DL35b6452L1vazHLKkHEant/1XXeaZ2jwswRxa21An+RzHkR
         GST4qXIlrsxiXLEdcLb7mnnG6qPEzX+jvr/Getb5JkSxsZkedE3v+X3PueBPGn4tgcxJ
         vuv+7xJYd8Nlqp7urflVAAWFHFCALuJSF7D1eXa3DUrQ+1M2FV8g4+v8tUFGyqjrQJIO
         IAnzN05ppkgS5nET2KTAbaeQZsc1K6NL48Pdoi2YgI8tu8ZoYcgoYNQosXaI4WXRZun/
         suPA==
X-Gm-Message-State: AOAM533mg0JG2D4Cy6qXSSHv3a1MdoeKKOFYVGgMNJUwNxBz329iabOa
        /3RAuAonvyZVuzLgtCzKoz2zrQ==
X-Google-Smtp-Source: ABdhPJyxSwoc8La9KIWf/IRCy9bVXAQ7sQVkZaTeSCZjtWgUYHG+bG0GJ2CAqAqCpD6HzR0NbCLUoA==
X-Received: by 2002:aca:b382:: with SMTP id c124mr6441749oif.169.1638371593782;
        Wed, 01 Dec 2021 07:13:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id be12sm33933oib.50.2021.12.01.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:13:13 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Cc:     paul.bouchara@somainline.org, linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        konrad.dybcio@somainline.org
Subject: Re: (subset) [PATCH 1/4] dt-bindings: qcom-rpmpd: Add sm6125 power domains
Date:   Wed,  1 Dec 2021 09:13:00 -0600
Message-Id: <163837153033.1905338.12474590076688450457.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211130212332.25401-1-martin.botka@somainline.org>
References: <20211130212332.25401-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Nov 2021 22:23:29 +0100, Martin Botka wrote:
> Add dt-bindings for sm6125 SoC RPM Power Domains
> 
> 

Applied, thanks!

[3/4] arm64: dt: sm6125: Add RPMPD node
      commit: d0bfc92303dde7f13fac1873c25a3bee913bfef3
[4/4] arm64: dt: sm6125: Add power domains to sdhc
      commit: 556a9f3ae17ef19deecac130fea38f258d5abeb2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
