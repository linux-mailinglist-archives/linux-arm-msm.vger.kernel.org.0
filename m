Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BEF1D321C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgENOGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726667AbgENOGn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:06:43 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4497DC061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:06:42 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s8so4258834wrt.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNkj51r2L9rZ0K9EyWV0hvRQYzmcF5SBVqNFyVyFPAo=;
        b=FFVssbIpXryFajjJXelTChxllm6xJFU04WJDqYHF38lQ/dFAnf2M7LYURSvd2MAZLH
         1aFzJ5ydJ+ryiTLpYI4YhCocurxWwXswgOTYigjFTMJstIFj/kqzctDv7RL4JFBcM55O
         +ZKs8WrMfnD+KDmRrrXs8Z/FeIbgrcGT3m7Rn28Ve7jUxrDRv4iah9/vpyOz9A7RC9kx
         ilf3YTjrAeBfYkZnxl7oVDtVX5zOe0QTre9YKfBEldQO+nq+dZRH1JJTuU7lnGhbE/UG
         yM7qAoLViyV1mRjKxwVf5+28hiHEm9lkR5c2ODp4AA2GEtpKS1GdNnrVQVkyTtf5kSgh
         78OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LNkj51r2L9rZ0K9EyWV0hvRQYzmcF5SBVqNFyVyFPAo=;
        b=PINHPpmq+DpFKCWEKpxmI6IXMNe+1wTfZVY+AV/+v+X1yzNHJ9xOUCg3MkZZDMtcl7
         YJ8QlJYWlYGPMjWAsFQ7F6obphRVlGh/rqbICtTJUEMxg8OsL9Kteb12jVRmpEYWZpdk
         cEHWT1AV3GrokcNVRdD1bAE5lcaVgQsHCisenc6ktDq/HBGd0P/dSmlgCUWR/0J1suzo
         I2VLSDFPkbRiugUecNPLeRTO6W3iUxOD+xYO8lpkBJD8X3oqmL35Azy2DphvkY6dsKqK
         pVI4IT25TiC9L2p14J/igJy7k2XNY89YhK+NMByfRdgwd6WfWBqm8artIZqBGUs9/kjN
         iSJg==
X-Gm-Message-State: AOAM532lt46g3vHZZwORkOj/856SNP7cHDeASVgpvCEI0cG19Li5LEwz
        lIG4eFLv/AYfJUWmONCmA+12Dw==
X-Google-Smtp-Source: ABdhPJwWfEo76YwG+HFwYeVUwbduEOE4F024tHFCHqVD7jVePGd1AlpWVV1SVylPxSX56t17X0n1JQ==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr5583058wrv.242.1589465200349;
        Thu, 14 May 2020 07:06:40 -0700 (PDT)
Received: from localhost.localdomain ([37.120.32.219])
        by smtp.gmail.com with ESMTPSA id t22sm10487621wmj.37.2020.05.14.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:06:39 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: c630: Add WiFi node
Date:   Thu, 14 May 2020 16:06:06 +0200
Message-Id: <20200514140606.1343766-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20191018055841.3729591-1-bjorn.andersson@linaro.org>
References: <20191018055841.3729591-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Specify regulators and enable the &wifi node. The firmware uses the 8
> bit version of the host capability message, so specify this quirk.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
