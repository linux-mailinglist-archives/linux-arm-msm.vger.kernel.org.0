Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12504A56A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbiBAFXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234606AbiBAFV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:21:26 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20DBC0617BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:54 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id y23so31122837oia.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uKKF0DixGLSuYZdT57I8IBRj5pAlwoHq/5NqWmRpYik=;
        b=gtmlnXbKrvagQAcPBq82OYsHoMGGp7EMJeJ5eSlTpCk0qfRHUH8pZbriP6kZGCgkET
         MZtMi+piJ0Gf5W8Qz2OEkhiRPSp6rofSIR0UKYAUcaPlWzGCXjFHquA0D+cj7owlvpkL
         as8zF5NHOeevVS6168uyDgpkoMKpMWZ8rSL9ovGxKqa8lX+x+39cqHzhsHmxlOwgXvXr
         oznG1WdCjTs/Q4Rrorv2ZxflaSCxPqzj1ETLy0GETB7PBIEqhb1Vclf6ihUXrNjsTZ6d
         ZhxvWECfhwMCCEcrAIM+yuHQVhChc/kTu1nZeXbGwNB861oA3DzESF9btEwNWfoPPDhS
         e2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uKKF0DixGLSuYZdT57I8IBRj5pAlwoHq/5NqWmRpYik=;
        b=onCrp98yoxKarWHE5kEyXVFdjfiNESX5mnuYTlbdEcE5bYYN/tFp9MVi6lxk4Yb33s
         sPPE0JNYbrWUWgGRY4PDDTgL5+6Cj8Pk3RIc12q51YHe2BS3125v3AS0pT/7sQXymDZc
         pb5pHRVJqvDNUmY8Fqm1sKKG5N+HUwqaSoThX3/AsUpH+srAVpYr7OGfdatLSGx6Lnd0
         4h69XAc+PtM5ezrGTWeTHrnCSvBwvqmjkXR6drh1KSRq6dUIdxqRbWiPEl3N8Qwy8caT
         n++32cYw3ZDSQsN78tD9WVlvWDFqo1Y1vsmjtKKrssXp7PWY/4h9ftFcxKIlsEQsCoE0
         i0SA==
X-Gm-Message-State: AOAM532bpz23NZdR6kbWaaBczRcfw+4Jg9kxUedY0QDFJ1XkcjXT3hUl
        rqnCnzeZ9LQL/Gt1sj332/7K5Q==
X-Google-Smtp-Source: ABdhPJzghGLwJlOB3aMCybmfc7OWRpNb+uNacVFAMvqROswzPZpqVWZNsCXNZLh2+d3dbXjo7AbeNQ==
X-Received: by 2002:aca:5a06:: with SMTP id o6mr205846oib.315.1643692854349;
        Mon, 31 Jan 2022 21:20:54 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org, agross@kernel.org,
        rui.zhang@intel.com, Thara Gopinath <thara.gopinath@linaro.org>,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [Patch v3 2/3] arm64: dts: qcom: sm8150: Add support for LMh node
Date:   Mon, 31 Jan 2022 23:20:04 -0600
Message-Id: <164369277344.3095904.6974097611997730306.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220106173138.411097-3-thara.gopinath@linaro.org>
References: <20220106173138.411097-1-thara.gopinath@linaro.org> <20220106173138.411097-3-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 6 Jan 2022 12:31:37 -0500, Thara Gopinath wrote:
> Add LMh nodes for cpu cluster0 and cpu cluster1 for sm8150 SoC.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sm8150: Add support for LMh node
      commit: 2ffcfe791d05e19feb105419efc030fc8ae1e527

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
