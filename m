Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EC8564428
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbiGCEAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jul 2022 00:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbiGCD7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:23 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F0DB7DF
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:52 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f2a4c51c45so8816160fac.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q5OtR04fybFsxUx/Xm2C99XlL3i9hLz9bhXed4/LTMo=;
        b=xCLNkykKiEhocfqtWfQcA7DuEzWvmeEe3LNvFh7tW81cRwsvSmwnlvFFDXVSKe35+H
         86phum6Fa/QtWBXHSBkdyO02ShMehQAc3VBv1sVFjkr+G6zNCjQTJSPsOE3VqbwX19GS
         s52nJZ9Nqsb35azupJ+TspbAjH4HLk1n2KDfnPWCHEWl663wd6IBonZKOghgy3TPIv9b
         hv0qPma51kL0FP4SzFn/m2K252Ml73iheCZ0S3c9y5QzmU0qxor5WAhVOtrtuSzAWI2J
         P7DS2EZ07bjKKuLf2mwI6kLZWaeOyn6RUXoeInZKT/lqVf5wKwRiYXZ2fJR8tIQveWOw
         vUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q5OtR04fybFsxUx/Xm2C99XlL3i9hLz9bhXed4/LTMo=;
        b=S8l5pBpvb/JzZDjZbzoTItT8rBP1G2emeSGM06Xl8yy8IZa5CSx/Go7XpSuAYHO1sL
         OpRL20nXaMwSVmV3IxsgSUUeEmkNxXTYD1VBedoFyq8H8f2hpxnFZ0zu3xcCHcIqy879
         qolM6ZIhbJH5pA2GuOn7l5Q56CxaRFYsfUADxYn3J0Mh4pp/x3VyGSg4eC9ZVPTBlAke
         fpeaaDdyjDawrRH0Btl6zJhDcQX7IOHI4jC3C2QG84HPRvkyX3BJ9YS7Oq0qtHmU1ZNF
         KAHUedVl4UHDdESUUgEe15j9ivn5XPW6rIcgeTI2SfJeYshq/yWTwr/TGa7C8pCXunbY
         yeog==
X-Gm-Message-State: AJIora+7lPq6bzndvGwWkEaMFfeYO0ulky1g587Qp/3wiQ0c6vzia1sr
        FLr/QxhzVHeyMqn5sIVqlZNdrQ==
X-Google-Smtp-Source: AGRyM1sNdHjEWKFSpwuH3Osm+G11C0k92wmUOGkZcc1uo7lEIPXJ/wejiVsnRkute1h4R8sz6ACM2Q==
X-Received: by 2002:a05:6870:2f15:b0:108:c28d:3304 with SMTP id qj21-20020a0568702f1500b00108c28d3304mr13754613oab.92.1656820672233;
        Sat, 02 Jul 2022 20:57:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     quic_psodagud@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        eberman@codeaurora.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, robh+dt@kernel.org
Subject: Re: (subset) [RFC 0/3] Add interconnect support to the SCM interface
Date:   Sat,  2 Jul 2022 22:56:45 -0500
Message-Id: <165682055967.445910.14406038202679892253.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1653289258-17699-1-git-send-email-quic_sibis@quicinc.com>
References: <1653289258-17699-1-git-send-email-quic_sibis@quicinc.com>
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

On Mon, 23 May 2022 12:30:55 +0530, Sibi Sankar wrote:
> Some of the SMC calls required by remoteproc PAS driver on SM8450 SoCs
> get a performance benefit from having a max vote to the crypto->ddr path.
> Add support for bandwidth (bw) voting for those SMC calls when the
> interconnects property is specified. Marking this as an RFC since the path
> could either be specified in the individual remoteprocs or directly in the
> scm interface.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm8450: Add interconnect requirements for SCM
      commit: 4c9fb8e89849db0f12fbfd4ad6a6ce036251a200

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
