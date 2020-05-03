Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5751C2F2F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2020 22:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgECUV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 May 2020 16:21:26 -0400
Received: from nbd.name ([46.4.11.11]:38750 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729099AbgECUV0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 May 2020 16:21:26 -0400
Received: from [2a04:4540:1401:e100:2d8:61ff:feed:60f5]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1jVL74-0002lf-Nn; Sun, 03 May 2020 22:21:22 +0200
Subject: Re: [PATCH v7 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, vkoul@kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
From:   John Crispin <john@phrozen.org>
Message-ID: <7ae2aa15-d84f-8991-9ae0-e58ca471f6c8@phrozen.org>
Date:   Sun, 3 May 2020 22:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503201823.531757-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03.05.20 22:18, Robert Marko wrote:
> Add a driver to setup the USB PHY-s on Qualcom m IPQ40xx series SoCs.
> The driver sets up HS and SS phys.
> 
> Signed-off-by: John Crispin<john@phrozen.org>
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Cc: Luka Perkov<luka.perkov@sartura.hr>

Thanks for pushing these patches upstream !
