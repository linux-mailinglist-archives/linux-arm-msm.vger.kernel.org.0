Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E411C33BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 09:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgEDHiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 03:38:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgEDHiE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 03:38:04 -0400
Received: from localhost (unknown [171.76.84.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A31E820735;
        Mon,  4 May 2020 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588577884;
        bh=m3o2kAi1bC826OeNQykTm2MOVvj48Ej0C/gUkN8YX0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JTq9Y3Ab6uxkLa7LVwi3IRLbNs6uLPvof4MTrqBz2gf3rqzF4uNB56ipO9Cza6qa7
         +uYEi+kLgD4y6BJDObBQUUKTOiiuJpDugjVELCBiymZBP3xZ2tzrMmdCQa/5ElAbOh
         4Ct0rM3vS4RR0YKDKLzX6M77gYIaI7k9cAoNTB/A=
Date:   Mon, 4 May 2020 13:07:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Rob Herring <robh@kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v7 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding
 document
Message-ID: <20200504073755.GP1375924@vkoul-mobl>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503201823.531757-2-robert.marko@sartura.hr>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-05-20, 22:18, Robert Marko wrote:
> This patch adds the binding documentation for the HS/SS USB PHY found
> inside Qualcom Dakota SoCs.

Applied, thanks

-- 
~Vinod
