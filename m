Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFFA3D9F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 10:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbhG2IQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 04:16:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234713AbhG2IQl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 04:16:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F09C760F00;
        Thu, 29 Jul 2021 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627546599;
        bh=QLpJ27PpjgHdqk/SlCGrFqNXAoLhxUMJjnxd/c2gf+8=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=KWNS7dkG9sDogu9P5keLwLeV50fVVBVsj/YBW9QQsN15NfT2bVOLAq2srlje8LD+n
         LFiYdIbscJY48siDXM6qSn38jpiSZI5bKfkVuoWHp2R8UHmIQxsy0gxO+yWjevqvxd
         RssObJ9uDmLNwq1pcAgwzRiZ+gGyWSuea1nxhpo+Su+xLL4sBwrlCZ+rjT+C9MryI2
         rSo//xgW1RXoVD6sskTJGnBOg+fD+m92eS3DIhggFniG/6pN4kxMWQ7rjvcvgkq1N7
         9JzdEFbQcsf80oz3uCV1EhE74eE+T1bh6fH6l8wrzRR7T+UH6ISGmomruhrrCRhrJd
         M8Y1RA4ta28LA==
References: <20210728221921.52068-1-konrad.dybcio@somainline.org>
User-agent: mu4e 1.6.0; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: usb: dwc3-qcom: Add sdm660 compatible
Date:   Thu, 29 Jul 2021 11:16:19 +0300
In-reply-to: <20210728221921.52068-1-konrad.dybcio@somainline.org>
Message-ID: <87wnp9v8ke.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Konrad Dybcio <konrad.dybcio@somainline.org> writes:

> Add a new compatible for SDM660's DWC3.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
