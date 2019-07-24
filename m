Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07D5772696
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfGXE2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:28:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfGXE2i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:28:38 -0400
Received: from localhost (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D26620644;
        Wed, 24 Jul 2019 04:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563942517;
        bh=LVjAXgGRy9jmEQS3rpJx+i+UAYYnKE8DlDxcS3FljAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmGX4dSCWPbgPgQFx2QvWE6KReZAXKtKy62PBO1q2wCh3Uc4gkAAwZyHeEW1ks5xu
         YK2hKAm3/OEJpuW8ebFOkulNKtM0AS42AL8acHqzCjVwk5c4LkjD7gk0nVwtxCxbE1
         2NoYSgR+29xlCrBdXgvDZLc0pG1Q+waDaHt9oae8=
Date:   Wed, 24 Jul 2019 09:57:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vaishali Thakkar <vaishali.thakkar@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v6 4/5] soc: qcom: socinfo: Expose custom attributes
Message-ID: <20190724042725.GE12733@vkoul-mobl.Dlink>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
 <20190723223515.27839-5-vaishali.thakkar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723223515.27839-5-vaishali.thakkar@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-07-19, 04:05, Vaishali Thakkar wrote:
> The Qualcomm socinfo provides a number of additional attributes,
> add these to the socinfo driver and expose them via debugfs
> functionality.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
