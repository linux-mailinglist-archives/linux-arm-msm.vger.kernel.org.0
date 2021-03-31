Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07271350604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhCaSKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbhCaSKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:10:04 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3CBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:10:04 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id g10so8323246plt.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CRwTprnnI8wz+/z7qaTV17ZDi+HLSj0ilkKWjBU02K8=;
        b=VPaEWj6gEDKV2/fVYPM6pBeCCmjH5CjUv8MDPhK+OFLA2zwsAWG/NkWeKzZStAo4GB
         ccHdr3pCFCCtk6TdaQnzqtjSEnGZ83/QUQk1H6coKIXXsbFng0x/EdaWPa5gzO2xAwbH
         ym9PALE98UahaphLi5qOR7TpbNea4i+jq5/Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CRwTprnnI8wz+/z7qaTV17ZDi+HLSj0ilkKWjBU02K8=;
        b=qxJoAS8Y/Dm+QQWOJnm3ejQuAINr/nCmpRn2w5yAz8XEn9WUngtisk3ys6OxnfFPEX
         rPBtLnFGIy+dpON8UmAfVIH8+gwIACZaKmlpINgeRF2is8Iw/2Wg9QPkgbNzDpbnvp3U
         Qj6DdqpRH5zV46SKcZ7Ey9laLQTLcr7vsVryz799wXYT7muuLegWuY6WTmYDdynXHj4s
         xPa/gyw3ZmRsJJdN+QGCTbyn8WwoM7WJQxflBaKWuHmQYWAe0QAMqrntCTmWZCK+P5r5
         rSyLQY/oPztENCPBWky1dK43EpvGXlmtUyh4VY3CRSWJFkZMt6dI9+1Y5sqcMHTsobcg
         r6QA==
X-Gm-Message-State: AOAM533sPNwH6MtiiuVUWtqYbDeyn0Jq8ply9Xq3DqVL6vodrLMSeW36
        mqjjK1TcfCGLW0EDcAiyDW8tKQ==
X-Google-Smtp-Source: ABdhPJwbAA32TMbB3osF08sK5TFLMQEjnc+42H9avoEUrbO+Zx4wBht1hAmZNc5xM2IMK/M2zLeYyA==
X-Received: by 2002:a17:902:c643:b029:e7:3c10:4695 with SMTP id s3-20020a170902c643b02900e73c104695mr4370404pls.41.1617214204060;
        Wed, 31 Mar 2021 11:10:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74b3:8070:8b1:c494])
        by smtp.gmail.com with UTF8SMTPSA id i22sm3214254pgj.90.2021.03.31.11.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 11:10:03 -0700 (PDT)
Date:   Wed, 31 Mar 2021 11:10:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V3 2/5] regulator: qcom-rpmh: Add PM7325/PMR735A
 regulator support
Message-ID: <YGS6+OtDJe4E+jTi@google.com>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
 <1617192339-3760-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1617192339-3760-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 05:35:36PM +0530, satya priya wrote:
> Add support for PM7325/PMR735A regulators. This ensures
> that consumers are able to modify the physical state of PMIC
> regulators.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
