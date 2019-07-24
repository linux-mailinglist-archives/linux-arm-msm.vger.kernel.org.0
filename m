Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF09373B4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 21:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405113AbfGXT6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 15:58:40 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45365 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405108AbfGXT6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 15:58:39 -0400
Received: by mail-io1-f68.google.com with SMTP id g20so92196623ioc.12;
        Wed, 24 Jul 2019 12:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PQGl4LrVkZJQR8JrdRonxvKem1COImKXVs35tCWL8j0=;
        b=ec0vJIipcZu5LUdn3MYAw1zOEZ4sweRJ8vwbTODhnDrzj7EQmKd0ibIU4uBKh6IBwM
         UyKuvvkA8fF7XI/X8cDP0L572PcN6m6td48mn60ddRgKR+ElAdFALhxdTm2vdlxBQLL4
         aL2joV+6bVNEOa2+OwCuObFMJ+4rjsQECGtq7jnWxUTlju5YYbgYnmgGd/hQddS49vFB
         qZi0AnJ1pHvX17MUDErIiFTbBHPJUootyv/UEGJqS3Ahz2kQ2lL8BTR99X1zl06NEDoF
         /XjR+N49M13WKztsCv78grt8UO2ATx6ofEFcwPcFxtq5Po72CdwMsgLMA7WXmFR37uGK
         msqA==
X-Gm-Message-State: APjAAAU/9OGdXgF2eWbsNqtmcpb4SeLp2RTyyBEF80JY+zZyycGpgKpZ
        uNtFVOe++APwjTJcuQaJAg==
X-Google-Smtp-Source: APXvYqxi9X4XWOEfCJ6JS14Ne21ncbmXUxzwspE0k996mu5PRuDKTM96/1vcibyF6K4aFfn+vigdfQ==
X-Received: by 2002:a02:b68f:: with SMTP id i15mr57425231jam.107.1563998318758;
        Wed, 24 Jul 2019 12:58:38 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id r5sm43464553iom.42.2019.07.24.12.58.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 12:58:38 -0700 (PDT)
Date:   Wed, 24 Jul 2019 13:58:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Message-ID: <20190724195837.GA19234@bogus>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
 <20190708165753.46275-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708165753.46275-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  8 Jul 2019 09:57:53 -0700, Jeffrey Hugo wrote:
> The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,ld-d5116z01b.txt      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
