Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BF7376920
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 18:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbhEGQ51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 12:57:27 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:49057 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236604AbhEGQ51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 12:57:27 -0400
Received: from [192.168.1.101] (83.6.168.154.neoplus.adsl.tpnet.pl [83.6.168.154])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7851C1F680;
        Fri,  7 May 2021 18:56:23 +0200 (CEST)
Subject: Re: [PATCH 1/3] remoteproc: qcom: pas: Use the same init resources
 for MSM8996 and MSM8998
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <zbAB2sceYHmsYeraZUi4YUKL7lgFMu13w3vHQQYUQ4@cp3-web-020.plabs.ch>
 <20210507164045.GA3622@thinkpad>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <22accfef-a629-b483-f93f-820030ff5189@somainline.org>
Date:   Fri, 7 May 2021 18:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210507164045.GA3622@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> NACK.
>
> I see that the "slpi_resource_init" and "msm8998_{slpi/adsp}_resource" are
> completely different, even the firmware name. How can you get it to work?

one of us must be looking at some knock-off source code, as they are identical say for the presence or absence of proxy_pd_names, which are required for 8996 and weren't really an exposed thing on old SoCs like 8974.


Konrad

