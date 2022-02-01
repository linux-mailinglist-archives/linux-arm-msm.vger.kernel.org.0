Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B851C4A5639
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbiBAFUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbiBAFUT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:19 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C5BC061401
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:19 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id y23so31120657oia.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rIXVvm53fHOpT0yB5xixJ73oEZvSzcnZ2LKIMv5yMm4=;
        b=knz60UaSeO5aOQXhM2SCikzR2wgPChUU72BLBatW5J8iu3TTUvhEtB6gpLT1M/WWYk
         PAHdvHE2zypbz9RrIlYpIn2GuJPaz1ZLxUFW0HoK0LGu6ahIbx34moXHkQxYESngo+DP
         2KVAOTMz/fH2dfSZIT9HSCLLKav4TzJJ8gfD1c66T4gReBkVD0+sUmx1TIEdRFAjd1nO
         SVoI21lngR8hP+yEClVLnuP7803l292pI5Q0mnZn6nK+dCN+HR5aw+KEpZz8VlhV/yyw
         zT7CwdbjXO95z1xNEZhN0aap4lpRf+CkYmqSlSvkL9Q1PoSRaUNxv5R01LOsvC+lUdNc
         BJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rIXVvm53fHOpT0yB5xixJ73oEZvSzcnZ2LKIMv5yMm4=;
        b=LZHP+sUnRSVpP1+cNLx9Ff7WSSbAL2UqmFHpJVgpRt+3SU3P5vxdKffNFN/irPXGV+
         lhyY7mac1DCrHG4nc6PewanmjnJSNcPVc8nhPgi/N++ngQ6DPf8GTGRmK6eUapmiIbdG
         8ng9BwT9FgLbBZb+1CjdMpVdb65Z8kZHulR6yUv8RYPI2YvbfMnELVkLNPWDtsizhApa
         FE0Rdy+GOZY9Xd0ENYPxDh0XmKz1+Lj7TOknWrW4fID+hT6XnlDlJCQHrmG1uk4WYzWf
         KivslF35JWx3zS0/I6gNoSEwAU9yR5gYjjsQTxjSLoj3LbGLsGZFe73rocnF9bfL5+z3
         /ulg==
X-Gm-Message-State: AOAM5304Jv3h1qp6JavId9DOnt3hw4v+Flou3cbij31EskPQK0fYqAi8
        GDshj/cAIFQHkKg6sZ61CJpqHw==
X-Google-Smtp-Source: ABdhPJyih0LkqAE4oVbgrK89JXNMY9uuIJm3Jdon3IyGaSlNGZNKWzavAocdQ2mXF7ncRDAGGXm4Pw==
X-Received: by 2002:a05:6808:208d:: with SMTP id s13mr213263oiw.282.1643692818578;
        Mon, 31 Jan 2022 21:20:18 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:18 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8996: qcom,controlled-remotely is boolean
Date:   Mon, 31 Jan 2022 23:19:28 -0600
Message-Id: <164369277343.3095904.15077146318535222288.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220145526.49102-1-david@ixit.cz>
References: <20211220145526.49102-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Dec 2021 15:55:26 +0100, David Heidelberg wrote:
> QCOM BAM parses property `qcom,controlled-remotely` as a boolean,
> adjust dts to reflect that.
> 
> Discovered while converting text documentation into yaml format.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: qcom,controlled-remotely is boolean
      commit: 0b9ae7ecdf54c5cce4b4cb052196b2b1c1ddbb6e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
