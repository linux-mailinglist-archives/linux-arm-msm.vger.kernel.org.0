Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DAA3D9D5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 07:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbhG2F6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 01:58:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233965AbhG2F6O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 01:58:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EB3460E09;
        Thu, 29 Jul 2021 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627538292;
        bh=3zZtzVKd3Sg12neQ5izdl/WbCuA721NzpfUrqqguHeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SnubuooGCme8qAHwR+DZhaoPsx/5cbs8yuraGHGkpy408cjBcW7sgX0jXnN+LJNAE
         5hTgyBSDJNbIXNnAFBBmtr64TPqtW1wrARuUzTgNj92ba38yvfGuX3upSDqJ6E+u5m
         o0umMCHDaitKCbuBZVVzgfgL4kwXEv2xeBQMl+7s=
Date:   Thu, 29 Jul 2021 07:58:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: usb: dwc3-qcom: Add sdm660 compatible
Message-ID: <YQJDboMpZ+C7F2fz@kroah.com>
References: <20210728221921.52068-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728221921.52068-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 29, 2021 at 12:19:21AM +0200, Konrad Dybcio wrote:
> Add a new compatible for SDM660's DWC3.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Odd mailing list you sent this to, what tree do you expect this to go
through?

thanks,

greg k-h
