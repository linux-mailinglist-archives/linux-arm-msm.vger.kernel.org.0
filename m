Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC4E14649C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 10:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAWJaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 04:30:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:43948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAWJaI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 04:30:08 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B64BD217F4;
        Thu, 23 Jan 2020 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579771808;
        bh=bU5bEDnTWQOxSbS2VYnlANt2Wc9KyEohEB+1xPddu8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r3PVCaof0a197NRyo9BYx4kCzz8EvXFGSldAfs90Fbbdb9xa+J0tI+p4gpe6NEOl5
         fz/0UlEAgIZrV/PBOd/Cn7bp5NOXVi3ft9UnOam6iD+Ur7WHEt33eGaA1ldQYBg0KE
         nNpOK8r8Rtelq/sJiNOJL/AtAcTA0fyKWMwWKCpg=
Date:   Thu, 23 Jan 2020 10:30:06 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        mgautam@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/1] tty: serial: qcom_geni_serial: Configure
 UART_IO_MACRO_CTRL register
Message-ID: <20200123093006.GB586919@kroah.com>
References: <20200123084132.11802-1-rojay@codeaurora.org>
 <20200123084132.11802-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123084132.11802-2-rojay@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 02:11:32PM +0530, Roja Rani Yarubandi wrote:
> Configure UART_IO_MACRO_CTRL register if UART lines are swapped.
> 
> Change-Id: I8e82c2395bf4cdc51b3677c3c54f5be3f390a888
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Always run checkpatch.pl on your patches so you do not get a grumpy
maintainer asking you to run checkpatc.pl on your patches.

:)
