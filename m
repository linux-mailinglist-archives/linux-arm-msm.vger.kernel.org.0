Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A802D110355
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 18:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfLCRWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 12:22:39 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36026 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLCRWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 12:22:38 -0500
Received: by mail-ot1-f66.google.com with SMTP id i4so3642699otr.3;
        Tue, 03 Dec 2019 09:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cMsreEXFeCso0tiE1Nbi7IoMG046yHL0rtrvdWFtaho=;
        b=UdX++vU+W5shqKM2CmjSHC4mtV4/zkER5JPF8buavtxok+Yz6+S4oIUE0tFaVG9yEY
         fP6Fqv3nNdtVjp6aqi/QTmwdAr9lS5u/zLYyz+G2ihNTc0u4t5qQmb+c4vgKrG1xCYdG
         g3va18qjIAF3HTW0H9wRiBdgoouOvlOXihQwZREkV2Phre/RJkXG1lLo9mYRRJ7YAt3J
         C/mQ/5pzroruHJ/yTOH0VUWW03nFEsceqxDA1l7GT8LsqXYjtAS73WLaYGOx7otZtIJV
         Jw25F/qGrnV4NbZe0MHb8XXl8hYLYFv51+D862ZH/QSU890hI5mG8lXS2iao4hUqExT9
         Z2CQ==
X-Gm-Message-State: APjAAAV/oPafFWVF470SGZA45MJ1su4auVsJJyNiWFC8mZ5bRWJTh2Pt
        YOKoonAyNRpi5JzRYJhtvfwHQGw=
X-Google-Smtp-Source: APXvYqzdAeQkbqgwFi1RtJ6Rg4XHcx5KcXKSdBUUJgdow8E/nrkzuK5u2+pt9+kZAbkm25CI2cr0YQ==
X-Received: by 2002:a05:6830:120c:: with SMTP id r12mr4093703otp.327.1575393757792;
        Tue, 03 Dec 2019 09:22:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b81sm1376539oia.0.2019.12.03.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:22:36 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:22:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm: Rename cache-controller to
 system-cache-controller
Message-ID: <20191203172235.GA18507@bogus>
References: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org>
 <83394ae827ce7c123228b749bcae2a2c470e88a4.1573814758.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83394ae827ce7c123228b749bcae2a2c470e88a4.1573814758.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Nov 2019 16:29:11 +0530, Sai Prakash Ranjan wrote:
> DT schema checks for the node name 'cache-controller' and enforces
> that there has to be a cache-level associated with it. But LLCC is
> a system cache and does not have a cache-level property and hence
> the dt binding check fails. So let us rename the LLCC cache-controller
> to system-cache-controller which is the proper description and also
> makes the schema happy.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
