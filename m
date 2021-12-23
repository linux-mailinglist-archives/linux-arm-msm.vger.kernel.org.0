Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049C247E75C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 19:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349614AbhLWSBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 13:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240132AbhLWSBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 13:01:41 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3465EC061401
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 10:01:41 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id s21-20020a05683004d500b0058f585672efso3089945otd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dfUzlOAn94ad16aOxRm80CzpKeAMYFpuYv2vYBOrxD0=;
        b=wRZycaNpkP/MAWgXqpVP8rTmHZd5Ji6GA6B0AQAtnZKPr0L07pGBFY1r/MuK/LUWtO
         IGWJoIvyvjtb5Z4DCBh6xKB71pMp9rCPrSx+5nAFOln9ObI7shc+b9W+eBQ8EYLBjubn
         DgAadQ2xH85EAHVp9aisfULspwT5jLfnC8FvzRVbxOqN5dEVJpweSqgtGB+SCfHFJ+CW
         TwQqAzcIW5k0KWoAyrILA207dmuTa1sfdUx5Db+92e4lPzYi75qXm+6OtcgrgXYGOqO8
         HTPX4V8hN2iPNWoborWKkYGTTs0leuMI4ZOTh6/kpgJJ6Lyw9SGkcmGb+9N8wloP9ukF
         3bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfUzlOAn94ad16aOxRm80CzpKeAMYFpuYv2vYBOrxD0=;
        b=SGF2Odomb0tnA8R4raVbNX34+SITTcYVjcRtLxlIYk9Co5X545ORojxx/17T2x11Gp
         11dp8HE6rAZOktJyHjG2lt7gFQ+hs4JpDmNsrn4xMxUThITHUn+5/oAw8Zxb9wDKRrSS
         fFFxBXQ5Yap1OcSn4LIkpn2zxjr3YZ97U7hu4t78slxQaDWsARMJDSmtwg7WDubUlcc4
         NJAhi50U0ayCdEXaChllf0qeYRei0Ta7kMWXJkaPYqdnPZRuMH4cURBwT/FFw+UPIu7R
         s1OS/s79qakB5JCNG+o/Pb3CzMGOSmHoBqpX4NO4SDoy2SAIIg02jbvsdxl4XPI8Oe0o
         sHNg==
X-Gm-Message-State: AOAM531POnaGcGxX+4ydSY4SNlWh86H3T4uGleO4MFrXjzdGr2Lb2xBq
        9+2ngqP6AdgR9ArqF7/fqcU4Ug==
X-Google-Smtp-Source: ABdhPJz9+drNpXFMlEsgLFs1STnT0bgyub2hZqb6hfaPnVTkAWC0pq7p42Q8iMpw3GXpp56eea9Lqw==
X-Received: by 2002:a9d:2cd:: with SMTP id 71mr2106805otl.107.1640282500577;
        Thu, 23 Dec 2021 10:01:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b24sm616515oic.16.2021.12.23.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 10:01:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards"
Date:   Thu, 23 Dec 2021 12:01:38 -0600
Message-Id: <164028248954.3843593.5026213913703078453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211223173339.GA3925@standask-GA-A55M-S2HP>
References: <20211223173339.GA3925@standask-GA-A55M-S2HP>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Dec 2021 18:33:39 +0100, Stanislav Jakubek wrote:
> This reverts commit 3b338c9a6a2afd6db46d5d8e39ae4f5eef420bf8.
> 
> This was a duplicate of 61339f368d59d25e22401731f89de44e3215508b,
> causing the sdx65 compatible and its board to be documented twice.
> 
> 

Applied, thanks!

[1/1] Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards"
      commit: fc5a40694ba684fb3b7009819965ec38e829118f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
