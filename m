Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CF245A123
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 12:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235867AbhKWLU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 06:20:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:56006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234746AbhKWLU2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 06:20:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99B9861075;
        Tue, 23 Nov 2021 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637666240;
        bh=QxYCZAbgMwLXECF0bLGBf0vyZ1zfRIbCiIXqUHIPujA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=goXXfyqzXqVD74bQVU8SQxMDBuOolsSvUA3yro3cbI6jRoJ1E/dxlW4AmNSfVQjml
         y/p5Eq53bb3kmZ79EC7WqGmMq3MFOxsPP6YMQbbXOl8brYtAJfjX+/8EkTZ7Hwk7fO
         iowdPs7EH1OQpCbYluhkbe8DNeltE013IBqtC5JLMjtqrm+XVcdyXssUQ1GJ4KdZeh
         xW1hQoSB4ogwBnOHikD+hadly5pIpq4aK9KZAbuBVCrp88zI12pbFeyOahqIzZbi3w
         LbjFBc92eSn2RUUejusmYKJUpXO56RlAs6/EWIi9pQ9boUGO14LcChhBPqnvDi9Rhj
         YEgoV3dbAKC7w==
Date:   Tue, 23 Nov 2021 16:47:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: remove redundant version number read
Message-ID: <YZzNuyDUxE+UXAG2@matsya>
References: <20211116105017.12010-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116105017.12010-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-11-21, 10:50, Srinivas Kandagatla wrote:
> Controller version is already available in struct qcom_swrm_ctrl, Just make use
> of it instead of reading this again.

Applied, thanks

-- 
~Vinod
