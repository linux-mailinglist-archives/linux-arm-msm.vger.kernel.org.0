Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA0042014C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 13:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhJCLZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 07:25:11 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:48411 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhJCLZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 07:25:11 -0400
Received: from [192.168.1.101] (83.6.167.124.neoplus.adsl.tpnet.pl [83.6.167.124])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CAC6B1F563;
        Sun,  3 Oct 2021 13:23:21 +0200 (CEST)
Message-ID: <d4b0d098-a33e-c6be-6f7a-ce44da5bd603@somainline.org>
Date:   Sun, 3 Oct 2021 13:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 06/11] arm64: dts: qcom: Add PM6350 PMIC
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211003083141.613509-1-luca@z3ntu.xyz>
 <20211003083141.613509-7-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211003083141.613509-7-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 03.10.2021 10:31, Luca Weiss wrote:
> PM6350 is used in SM6350 and provides similar functionality to other
> Qualcomm PMICs.
>
> Add the pon node with power & volume key and the gpios.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

