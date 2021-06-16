Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15603A9A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 14:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhFPMVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:21:00 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:49027 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbhFPMVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:21:00 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6D6763EAD9;
        Wed, 16 Jun 2021 14:18:52 +0200 (CEST)
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250-edo: Enable ADSP/CDSP/SLPI
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210616005843.79579-1-konrad.dybcio@somainline.org>
 <20210616005843.79579-4-konrad.dybcio@somainline.org>
 <YMllkBcLzrM3vdvM@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <68f4ea6e-5bf0-fb1d-6981-02f6151abd2a@somainline.org>
Date:   Wed, 16 Jun 2021 14:18:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMllkBcLzrM3vdvM@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> Are you okay with the default firmware paths? Or perhaps would it be
> better to shove them into qcom/sm8250/sony/<some-identifier>/* to avoid
> moving them later?

Since we have to either symlink or copy the binaries from the device Linux

is running on to stay clear wrt proprietary blobs licensing, the default

path is fine, as there won't be any other firmware there. If it turns out we

have a better way of managing this, one can always send a patch changing

it.


Konrad

