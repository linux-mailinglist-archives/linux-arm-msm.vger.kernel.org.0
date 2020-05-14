Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AFB1D3284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgENOTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:19:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbgENOTM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:19:12 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84B9020671;
        Thu, 14 May 2020 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589465952;
        bh=2IIWoe+cKG4lmCifY3FqNl62beDO2N4ASw+rjdBGtgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2h5wCoUquRHfLKRNdutIKw5tK1qCBtTO+vrPdge36XmwyujdOdzOXk9PVp3dQ0W/a
         azLShMBox2lojEuxjknWvWeJrbb0qcgc1FyWMErbBcwDF9MqazrTKRE46CJ5RpRNV4
         5yf06CQP5ROHtPYZGIvXeBeNa9FoeByDn2/bLrSU=
Date:   Thu, 14 May 2020 19:49:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
Message-ID: <20200514141908.GX14092@vkoul-mobl>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513005441.1102586-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-05-20, 17:54, Bjorn Andersson wrote:
> Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
