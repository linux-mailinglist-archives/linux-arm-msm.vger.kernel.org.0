Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8925C16335E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 21:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgBRUqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 15:46:45 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35158 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgBRUqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 15:46:44 -0500
Received: by mail-oi1-f196.google.com with SMTP id b18so21557130oie.2;
        Tue, 18 Feb 2020 12:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FdwqDUwoMmYtSAEuLCPUeBFayG1iXRKqm9tBHfT2PC8=;
        b=me6yjH7EPvz5heRVnBwHGiP8YAvtSh6G6A3s5rcsKZLUOM5KZmTOqr1ikJrmaqodGQ
         pknXeFFokBGVto0KvtuG4FLZdblgUAiQHK47T9eXATO1Jd14wm2DAQ5Hf5ypEMh/i1mv
         CPeQ/VFGF+dgnPvUZ5nRn2//t1ko5MbR1uB5jIPmIwJbc8AkJ4VjdWWDXKGlqIWbRTfy
         KkiOz4i4Bv0Q3OgRyUrztb8NvghM1LRrTTP3RChrmjQQg6zYt3eZS5pBjV5cZKMqq6CE
         rhBGoF59kRM033gF7jXhDWxg3zdCsm/aH9xWClsryoI9emNm9nIJZEwpMQ3jHqeCtze3
         KNtw==
X-Gm-Message-State: APjAAAVxRJ0BvZ+NH+pGro4mPJuM5coFrilFsvQn26fkrG8VNXcBDYwC
        3bnO5OtNDJGu8apdusPAyQ==
X-Google-Smtp-Source: APXvYqznbe8xplYY/4+OhUA9lRm8BnQc3PLmlody7tZmE1B9QJMCd+Clmhs9KI5idHhweVRRpg+e/w==
X-Received: by 2002:aca:4789:: with SMTP id u131mr2355446oia.43.1582058803756;
        Tue, 18 Feb 2020 12:46:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm1706747oti.44.2020.02.18.12.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:46:43 -0800 (PST)
Received: (nullmailer pid 8677 invoked by uid 1000);
        Tue, 18 Feb 2020 20:46:42 -0000
Date:   Tue, 18 Feb 2020 14:46:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 07/18] dt-bindings: usb: dwc3: Add a
 gpio-usb-connector example
Message-ID: <20200218204642.GA8639@bogus>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
 <20200210120723.91794-8-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210120723.91794-8-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 Feb 2020 12:07:12 +0000, Bryan O'Donoghue wrote:
> A USB connector should be a child node of the USB controller
> connector/usb-connector.txt. This patch adds an example of how to do this
> to the dwc3 binding descriptions.
> 
> It is necessary to declare a connector as a child-node of a USB controller
> for role-switching to work, so this example should be helpful to others
> implementing that.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
