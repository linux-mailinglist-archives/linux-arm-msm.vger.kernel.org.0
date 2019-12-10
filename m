Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8F6119043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 20:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbfLJTCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 14:02:16 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37057 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbfLJTCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 14:02:16 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep17so7758599pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OQfRjsctq07bGONJSMNK5xeyNODUsGkcRHUxYCc8g7g=;
        b=SILCAyeqYZkfiGWeLnU1e9E7rnZFBNzmUHTtrq34RIAFHV4jn8eOcNrZ159HiZEY38
         kmjLvMsFvXSnvloHvWchwJk3qkmVWGGCVhj2Ncy0NFnLrGlvvnb44UuBliZW1BvzGBR+
         p9jwz1CkvGO3WNZqJBtkq8ej6k6noCI9p0h6CvDSUCnjymNVLLBVRRgPlGoWCKWXXEiT
         HhuQgONTPCJMBV7yZQZ47dHIp4EzevNQF4q6xmZojk7HRhsWApsVz8TTKYtAKwftvWbv
         EBWqgpIZ9vD+2pmdWmqe2SUQM6K3mhpAggMC/2bIcXxtnxLnzAuvIdjiIKMRy1WtOv/B
         Ry5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OQfRjsctq07bGONJSMNK5xeyNODUsGkcRHUxYCc8g7g=;
        b=OlbRncG/dq7Q4FdOwzQFDjndru9ropRrJHMAIvxSiZ+K25xW3EZLmBSJ+RYGLnaizr
         qT1IyFHE5+I++V7Dq+esjxOA9zNLNiCu7O/VMbbuLY0FuveWhJ3QHN0kkoh1afbCKSBM
         S6ffrkwJJ8Z4K1Wnbk9014rDhye7s4TbThzo4dG3xvdPchJPEMmV2IxIjZ38JGLKfmEU
         bqCov6VIjvQXsyWeBn8SyKtqlKHpuNy5SOimtM0YAXug4E+NR738wTUz0oEViXeLh7n8
         U8JZgXsZVe3FFkPqh9qVRVhmqBuKMlJzwIlQUC8N+i2HEgZ+zZOuYgs1J6ZyUlwQTnNX
         u0iQ==
X-Gm-Message-State: APjAAAXNt8APqibalnlk8nse+4Hdg5XJ0xkAPxen4r//sYdkMvlfL5mP
        J+3nl/gY/Sct1k273FCLcBjROw==
X-Google-Smtp-Source: APXvYqykCBwtoFRp8nwsDGDv9eRderBwI2uMWFfJQXOofMmm5xq302SkaOu5OG3WLV9lW+/EArTGZQ==
X-Received: by 2002:a17:90a:8a0c:: with SMTP id w12mr7084397pjn.61.1576004535850;
        Tue, 10 Dec 2019 11:02:15 -0800 (PST)
Received: from yoga ([2607:fb90:8497:e902:4ce0:3dff:fe1c:88ba])
        by smtp.gmail.com with ESMTPSA id j18sm4132196pfn.112.2019.12.10.11.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 11:02:14 -0800 (PST)
Date:   Tue, 10 Dec 2019 11:02:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Can Guo <cang@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] phy: ufs-qcom: Invert PCS ready logic for SDM845 UFS
Message-ID: <20191210190211.GE314059@yoga>
References: <20191209135934.1.Iaaf3ad8a27b00f2f2bc333486a1ecc9985bb5170@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209135934.1.Iaaf3ad8a27b00f2f2bc333486a1ecc9985bb5170@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Dec 14:00 PST 2019, Evan Green wrote:

> The SDM845 UFS phy seems to want to do a low transition to become
> ready, rather than a high transition. Without this, I am unable to
> enumerate UFS on SDM845 when booted from USB.
> 
> Fixes: 14ced7e3a1a ('phy: qcom-qmp: Correct ready status, again')
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>

As concluded offline, the current logic is correct, but for some reason
we need a longer timeout on this particular device.

Regards,
Bjorn

> ---
> 
> Bjorn,
> At this point I'm super confused on what the correct behavior
> should be. Lack of documentation doesn't help. I'm worried that this
> change breaks UFS on some other platforms, so I'm hoping you or some
> PHY folks might have some advice on what the right thing to do is.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 091e20303a14d..c4f4294360b6e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1657,7 +1657,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  	if (cfg->type == PHY_TYPE_UFS) {
>  		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
>  		mask = PCS_READY;
> -		ready = PCS_READY;
> +		ready = 0;
>  	} else {
>  		status = pcs + cfg->regs[QPHY_PCS_STATUS];
>  		mask = PHYSTATUS;
> -- 
> 2.21.0
> 
