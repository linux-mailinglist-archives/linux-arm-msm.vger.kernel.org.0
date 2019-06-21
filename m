Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 366D64EFBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 21:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfFUT70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 15:59:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55153 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUT70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 15:59:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id g135so7319510wme.4;
        Fri, 21 Jun 2019 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rrgP+tN7q+KdQueUxlF4aRY0BkMcXUVAckmsuIhwpT0=;
        b=L8tes+emvST9pmj/IRzX9+hojeOq4GZDIGhXxywVATI8gFUF36BSHIDNOPx7EIFvlg
         Dqe2ZBXumHdHNB1+AaiBqOA2ciM0EzKSuqJHmqrR4CY5zxj6myfpVBLFs6HNNVHzuJ/1
         nhMcwOfXVXk1CSdtsVbkKXKgFp1yssRB/NXBEV/sbWRH0Q58Q/2V8sNWgQyyq00gNLee
         R7uLrPpIAr8oMpiNVuhE+zjJn6CY+v2PDedNHna3YUOukRp4NOqOualC7fuoGOqHVCqx
         iH80DV2EdO8Fwg7g5PpHdcs0d4hG6uqbt8HgPDt6BbL37SL9c1CIx0hSkPA+0C12TLn/
         tLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rrgP+tN7q+KdQueUxlF4aRY0BkMcXUVAckmsuIhwpT0=;
        b=YfTFUWBlurPB21AnPQS1yRWZHjlIzJcnJAG7tEtiuagqZKSPzHHkVlhtbGHaOTn4Zw
         kaQPZo3m5PwymEv4PMXx/cphMVmrhMMOuWJKaXPEjsh0FnW+JD7UXPWdTlK2b7hQlXAb
         7DIjf8xPv+4UZXR6n4IYs3elIJAomAyk03jwg5Gp2QZstTLFWe0xybTVIwHhYSXngby/
         HTlqseS20/46ph5DJVHiECFPi5pX5aZ7A9rjPCEC2zzu/H4Ve7lhVluHGeJzjwfg9THl
         4ONZ5P6vFvVjzshdwzn780I4oMjqu4fvZifjf+Cpwi9teOrnxQffW/srqj4EP2+HHWTy
         A7Qw==
X-Gm-Message-State: APjAAAWJekkrbYi/PRy02wNYGCjoFuj/RfMEwbgsTmH6/Yl7WOFKzKKB
        PqUjkvoBa8TzO5sYYUv27sA=
X-Google-Smtp-Source: APXvYqxBKJ3IjnD6wDUtMi2m6hREJvgcNdbUZ0ji3JRi+mfPQSCt2CnZ9Or3TiA5SwO0YHSVt46P6g==
X-Received: by 2002:a1c:a654:: with SMTP id p81mr4872126wme.36.1561147163961;
        Fri, 21 Jun 2019 12:59:23 -0700 (PDT)
Received: from debian64.daheim (pD9E297F7.dip0.t-ipconnect.de. [217.226.151.247])
        by smtp.gmail.com with ESMTPSA id g19sm2198006wmg.10.2019.06.21.12.59.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 12:59:23 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hePgw-0006iD-KX; Fri, 21 Jun 2019 21:59:22 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM
Date:   Fri, 21 Jun 2019 21:59:22 +0200
Message-ID: <1897697.zOhlaAKarQ@debian64>
In-Reply-To: <20190621085913.8722-2-vkoul@kernel.org>
References: <20190621085913.8722-1-vkoul@kernel.org> <20190621085913.8722-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday, June 21, 2019 10:59:09 AM CEST Vinod Koul wrote:
> +	/*
> +	 * The Firmware's Data Format is describe in
> +	 * "6.3 Data Format" R19UH0078EJ0500 Rev.5.00 page 124
> +	 */
> +
> +	/* "Each row is 8 bytes". => firmware size must be a multiple of 8. */
> +	if (length % 8 != 0)
> +		dev_warn(&dev->dev, "firmware size is not a multiple of 8.");

It doesn't look like this holds true for the newer K2026090.mem which
arguably fixes a lot of bugs over K2013080.mem. I think we should remove
this check and message.

Cheers,
Christian


