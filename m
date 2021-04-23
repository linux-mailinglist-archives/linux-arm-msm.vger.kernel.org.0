Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF62368C96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 07:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240523AbhDWFXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 01:23:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:57186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240893AbhDWFWr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 01:22:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27D2F613F2;
        Fri, 23 Apr 2021 05:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619155331;
        bh=S3JpOgn6FIm3exd4PQwKuZYVoyMN28l3xivITClBiZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wchw0zc/khLqUDC7eGf3Y6Ozsy/2BLvhOZG6/pXHDoNJjGvlhXSqJ+aMck8o86TYL
         PNO6ALH364vXaCbAQXtwP+bn+ZR5VWF8DF0pLyDLhBZBkoAXlwKEiAFOcuoX8MHaF+
         yzB0hVENsbubuAT2PsJex++wb9awsWXn32MCxkio=
Date:   Fri, 23 Apr 2021 07:22:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom-geni-se: remove redundant initialization to
 variable line
Message-ID: <YIJZfcU1Qm9dsCjJ@kroah.com>
References: <20210422125810.248166-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422125810.248166-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 22, 2021 at 01:58:10PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable line being initialized with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Your subject line is odd, this is not a "SOC" driver :(

