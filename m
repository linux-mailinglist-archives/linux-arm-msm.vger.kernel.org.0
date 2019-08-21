Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735BC984A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 21:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbfHUTip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 15:38:45 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33004 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfHUTip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 15:38:45 -0400
Received: by mail-ot1-f66.google.com with SMTP id q20so3219096otl.0;
        Wed, 21 Aug 2019 12:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mv6dI72x/ZXvKqd/O20ZyFYm3CG8hbvNxtD2JDUEGlU=;
        b=NkvjiGC6W0h5S3osiG9W1S7tryyjol6Vovnd48QejELHP5SyuG68snh2wMHbaZeQbO
         xW8njU3d2K4SgXPYxFn5VWbyyiY961EAgA2w25UVUCziXQn1AWkgRsQSE3hSLcOjiqak
         PWX7sxMacR5OS4FRvR0KJ3L68744f5QgYN1z2dsIW2M4BMEzc2YjeoJ0dbZdmcouGTEM
         0vycNEtdMHo/6CT/WaZZA1/rOFmyZVgcfjfU9Zn52jgGz9YoMV3Da8HbuVRyoCqAL39c
         8I07dY73EoOLZCfVOliDVLTKbX/DsEjE+kWylrk7zRHVRdMxFz2VcIBJv1JlWcKB9XHr
         0PlQ==
X-Gm-Message-State: APjAAAWl8Xhm67Nl3MQNGSqg0tXNUnXiJ+d7VeHsx0jV5dj86qLlq6kY
        R0inSm1dOjgCcErP6KKn4w==
X-Google-Smtp-Source: APXvYqw2GeAaUgeC7gD0/NHi6drtkLwvg3qOGZhLgX0JMV+VBi1C+dza7sD4C8QLfAKWMJdu0DLGPA==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr28996466oti.91.1566416324214;
        Wed, 21 Aug 2019 12:38:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t21sm5474909oic.6.2019.08.21.12.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 12:38:43 -0700 (PDT)
Date:   Wed, 21 Aug 2019 14:38:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org, mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 3/7] dt-bindings: firmware: scm: Add SM8150 and SC7180
 support
Message-ID: <20190821193843.GA11984@bogus>
References: <20190807070957.30655-1-sibis@codeaurora.org>
 <20190807070957.30655-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807070957.30655-4-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  7 Aug 2019 12:39:53 +0530, Sibi Sankar wrote:
> Add compatible for SM8150 and SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
