Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB206F0EFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 01:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344491AbjD0Xb1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 19:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjD0XbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 19:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6542D67
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EVstEm9h+f8vy/mEV9sr+uXiJuKtGJYBIssk81uyPSQ=;
        b=OIHTp/UyyZBqmXSjR3cLk3i+hamcv44jyxX5XUFSrVVF5uyGw38Kdbz5grrgtiu1PqbKP5
        ZVgte9bBzxGu6YFIPsjehXaoFwfdb0/yPnWT1DfG+eeDsB5fzlmDsgGTulg34JyynA8sXY
        iHcy1drSB1m/y3x481ohpWgW7rmPkDY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-lUJjDUdqO1iqkhhIdU9ZqA-1; Thu, 27 Apr 2023 19:30:16 -0400
X-MC-Unique: lUJjDUdqO1iqkhhIdU9ZqA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-555d8a35c46so142986897b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 16:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638215; x=1685230215;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVstEm9h+f8vy/mEV9sr+uXiJuKtGJYBIssk81uyPSQ=;
        b=TYkmz6UBPV1bVRLJqDC8tEhM7H5zIcAZhfiaYbdB1XonqlUUtxLVpQ7PyIY1jyhxi8
         pqtKPShbhbgOugMQ7mGzfQdWeHmXXOnTlgwcHjeo3ju+LPC+4tzZeXdjDxk062L8WVy3
         Vb1LMATeCLTOm8x4+JxfA8nz7xLc+SuPrTjq8ViEQtmnI1SunViBn1dnuElFn0DK7GE3
         djc0AX+d3Dts+fGHUUXvIwOqIOblGc643iusqqmlDvr5ml4zjpZXs4q/4VNJvAw/TVEe
         EOol7ZWsZIRu0GtHq8LRbfI4ihAb+lhuCyAviE3TMraRmznbB0eDJ5ZLhXH2MortxMcj
         QzwQ==
X-Gm-Message-State: AC+VfDxGtfWYRXvRnNCqz58ibDgmqN+VLn+kWvk6vc/8PqgTixs/oluX
        PJP1Q55yWtiAeZG2WjEjBKmaLIkJpHpEM7fAdgY+n+uEuNPjhc7WeEgSHUq9ywRh6LZbyIZn9s2
        7bBQBwvyml7JR/trNcagUCdROpw==
X-Received: by 2002:a0d:d8cf:0:b0:544:5b63:b956 with SMTP id a198-20020a0dd8cf000000b005445b63b956mr2652647ywe.8.1682638215739;
        Thu, 27 Apr 2023 16:30:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AlF6UPNRzq0q97LZdRYbg5r+sonNynDI2yOTx2L/mRwUr5sNyCxdgQv79FQ8u/uf/zku5iQ==
X-Received: by 2002:a0d:d8cf:0:b0:544:5b63:b956 with SMTP id a198-20020a0dd8cf000000b005445b63b956mr2652642ywe.8.1682638215497;
        Thu, 27 Apr 2023 16:30:15 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id k187-20020a816fc4000000b00545a08184b9sm5113278ywc.73.2023.04.27.16.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:30:14 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:30:12 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: pwm-vibra - add newline to dev_err prints
Message-ID: <ZEsFhOKHs6yGLizc@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-2-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427-hammerhead-vibra-v1-2-e87eeb94da51@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 27, 2023 at 10:34:27PM +0200, Luca Weiss wrote:
> Make sure all printed messages end with a newline.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

