Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FB64A89D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352685AbiBCRWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237876AbiBCRWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:22:10 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5B7C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:22:10 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id l13so2696918plg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LtlBUMv0CPKdCeI0pe7fbcz2gG9lHor4afW1JFe9U1w=;
        b=aXjzcKxbBqnD+78aS6PayfL7S71+4AwGIy38eEkV5uFCjECMB+HiKa/EVf84XNsgVE
         j4SQj0J07YItloUzVhckSNw5cKagoOg3C8hQ5/ro6gmJL5tMqeynO/d6UDFPgv/r2OGf
         eCGF7y+Aw0HqR1JUNrFG+jmjbvWm9U4j3B/sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LtlBUMv0CPKdCeI0pe7fbcz2gG9lHor4afW1JFe9U1w=;
        b=ThO8Q8kJIkm4a/UiYeVbeXtOwDUOiiSO1XC7mzJVlg4OI9sj+tfF3zGL2eutctKn7S
         QEMga9BOgNdeqXR0zIKG6RQARtYkqDOowO0AE+HjZu5KncwsWtX6umRXUT8j+P0iELhC
         pjYhej8SZffw7vHYeAT6ccreFfLrAqvxbNTKUiOOIGLmxIhdLxyBCqZQqBTGv7KvH9UZ
         lBoYJQo7QmkMAmw7FMzH7RA+iuw+Bg5ggynuRXq0CHvmbTZ56RdussE/R98IPpAnI3Ek
         izfnJcJgD4zDVQH/Rdp10wcmAxmKGyrxn0bDDdwtdqVRkAb7J7vm7p3LINWd/Gla0K3+
         dTew==
X-Gm-Message-State: AOAM532pfS6BIZQ0F4DRBJU55raEhnmVcZBM7iF0fuQFxmfPH4Ok5UKA
        yqkMH10uLORM09C0I12b4CUyNg==
X-Google-Smtp-Source: ABdhPJyIo07frE3OhbxA2nH+n/rIIuqX3s5VuPRNYWhKC2DGG6WboOZGCRrMSLfSoFqI6Kzg3Y7Utg==
X-Received: by 2002:a17:90a:2fc5:: with SMTP id n5mr14831024pjm.69.1643908929710;
        Thu, 03 Feb 2022 09:22:09 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c0cb:3065:aa0:d6c9])
        by smtp.gmail.com with UTF8SMTPSA id n42sm29220330pfv.29.2022.02.03.09.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 09:22:09 -0800 (PST)
Date:   Thu, 3 Feb 2022 09:22:07 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        pmaliset@codeaurora.org, quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/14] arm64: dts: qcom: sc7280: Move dp_hot_plug_det
 pull from SoC dtsi file
Message-ID: <YfwPP/u2kWwWEHzC@google.com>
References: <20220202212348.1391534-1-dianders@chromium.org>
 <20220202132301.v3.10.Id346b23642f91e16d68d75f44bcdb5b9fbd155ea@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220202132301.v3.10.Id346b23642f91e16d68d75f44bcdb5b9fbd155ea@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 02, 2022 at 01:23:44PM -0800, Douglas Anderson wrote:
> Pulls should be in the board files, not in the SoC dtsi
> file. Remove. Even though the sc7280 boards don't currently refer to
> dp_hot_plug_det, let's re-add the pulls there just to keep this as a
> no-op change. If boards don't need this / don't want it later then we
> can remove it from them.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
