Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25B4513F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 01:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353378AbiD1XpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 19:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353323AbiD1XpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 19:45:08 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4A668F8B
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 16:41:51 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k4so5688436plk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=utW7m7C/33mdooj3nk3P7IpydCK9PCFHBlvHF/K68Sw=;
        b=K4RvP8gbmocGfzJ63WxyKVw0EKF7Rhmbl4JT9hpFEM3phOZseynCcE5iox5SaWfgYh
         IZfDIMvXsuv12b/0eM5lrPnik2Z7mDD1HffXgxVTKp1JYpGmzf9bWX2DmYErAIocMQix
         vVt9MB22w2dkB/EldMzxKMZT5aimSUUVCCV/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=utW7m7C/33mdooj3nk3P7IpydCK9PCFHBlvHF/K68Sw=;
        b=yCSVUN9GRiSdO7mi2GAso9ubH+lOI4wsc4ic+rkGJPK0qFBXl63P+uS9vd++sd/uEG
         x07paksgfwowTayjjG4QY42/qflRY2IWcZ0upkO2HN+xW3b54M1t7IMi82Rk7zMOC5mJ
         rV5KxbkGA0Rb+L8FBRHtZDfz2Who8zVgUg6LzP/TTY1b4pcxS1ndqmyS81mzHK+ovhcl
         REUnEmWfN+ej23iJ4+WR58uugzQZ4OkV8EQVbJpR0jXM7Va6X3/OaaKa5OgPzypvRiB+
         U2PkQqZ3p9vICjzjWMiUPMGdQcUbW6nGp2Jbye8UKGX/Vz58Y9r8pV1/zYROoeaLBQ5W
         2IHQ==
X-Gm-Message-State: AOAM5312ct5ERCkngsJZOhGVCe/JSGkPkAhQAAWBJ30rbrjUE/O7mHWA
        gRvWytTfGzb+M8IR3MN1cuCYCA==
X-Google-Smtp-Source: ABdhPJziqHrLHRX+Ug6ENVOfILnYECTS9GvXBsstHePR5V/yseCcF99Z434b0Xb+pffh9RDL/GzJAg==
X-Received: by 2002:a17:90b:1192:b0:1cb:59d0:d06f with SMTP id gk18-20020a17090b119200b001cb59d0d06fmr785553pjb.127.1651189310586;
        Thu, 28 Apr 2022 16:41:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7d14:5f45:9377:9b6a])
        by smtp.gmail.com with UTF8SMTPSA id b10-20020a056a00114a00b004f784ba5e6asm949570pfm.17.2022.04.28.16.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 16:41:50 -0700 (PDT)
Date:   Thu, 28 Apr 2022 16:41:48 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v12 2/4] arm64: dts: qcom: sc7280: Add secondary MI2S
 pinmux specifications for CRD 3.0/3.1
Message-ID: <YmsmPNTgx9Gi0qVl@google.com>
References: <1651079383-7665-1-git-send-email-quic_srivasam@quicinc.com>
 <1651079383-7665-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651079383-7665-3-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 27, 2022 at 10:39:41PM +0530, Srinivasa Rao Mandadapu wrote:
> Add drive strength property for secondary MI2S on
> sc7280 based platforms of rev5+ (aka CRD 3.0/3.1) boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
