Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B081B1146BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 19:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbfLESSO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 13:18:14 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34616 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLESSN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 13:18:13 -0500
Received: by mail-ot1-f68.google.com with SMTP id a15so3478341otf.1;
        Thu, 05 Dec 2019 10:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ctt78cWwZCaPfsbkOwoWRKaRaaHO7Q0cJcGkZb/xygE=;
        b=PP0xWugIq0GoEYCNfpnzOcmD+zugany1CzZU2uNXlm5AGKhkYb5pdxIJ9WB9HLxolI
         l9JQMvCFOsA1NOZJvTNfZByu0P3sHnGq2rmSMGyXPyCpQo6gu3z3xC7LCbG1Vqx28XJu
         +OEvUwfbQ+bszhAnhId8ufjPMYf+jVOyv7xTHR/dJQc3xT2LPXhIyUy/jRAzvMRKNK+q
         mFVdD4rb9frydus/PlG27zTlmOc+fP86McmDfOsMCGPY+UclV7oQwK9StFD3GXDwg54S
         aphRCzUfvPk8IoGot8Gw1n8mfN6FTYkUBEdsXgPPz+PaJ/a4aZVrCFYBBdjYggEQwIVW
         95bQ==
X-Gm-Message-State: APjAAAWk29KH/r2vfk4ihaKRvGxVk/mu1YEzgUI5GNS9s34zerbSSGtL
        sVgvtqfuBfPNC8M8Ly+ZAA==
X-Google-Smtp-Source: APXvYqyfs8OhUj0eeDczAIKIgi1gk0+FRTxh0W2z3IWAj0xjcIUjt8xn3BxVAR2EWbyK3UtPCpCimw==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr8059510oti.338.1575569892874;
        Thu, 05 Dec 2019 10:18:12 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n16sm3596887otk.25.2019.12.05.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 10:18:12 -0800 (PST)
Date:   Thu, 5 Dec 2019 12:18:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [PATCH 1/4] dt-bindings: msm:disp: add sc7180 DPU variant
Message-ID: <20191205181811.GA5706@bogus>
References: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
 <1574683169-19342-2-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574683169-19342-2-git-send-email-kalyan_t@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Nov 2019 17:29:26 +0530, Kalyan Thota wrote:
> Add a compatible string to support sc7180 dpu version.
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
