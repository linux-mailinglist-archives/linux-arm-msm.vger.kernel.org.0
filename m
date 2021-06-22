Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33863B0CE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 20:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhFVSbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 14:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbhFVSbx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 14:31:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF29C061574;
        Tue, 22 Jun 2021 11:29:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a11so24468965lfg.11;
        Tue, 22 Jun 2021 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XZGZlZ6KGqASvVxpzUDTpMytysWT2/lYk8Yby81Wb20=;
        b=jEtiIHw3LSJaQYEHaRFWOWEWWy4hTfspjh0ZQA0oVcOF1s6+N6q1a4At6R7C3ikhXv
         NDQ2SB3DrSdagZYZUUauv/26bG2W4aOjXWoEeZLHjTn5DGTuoBvO8DqjAYnMLrfLr72t
         UJ7MIsAePtN5frqCs7zv29RQTIVagOvTjnHmifNEnL1B8ECYUGlJvK5vLsnZrPKdZjUd
         i9lqBxtCEg/qQ5svdJomcTj+gsycHLtyK2628Oy/kAveIAEYLf/43gs03tszh0ZNf6RB
         T31Fw2J3uQ7SgJKZu5auUhl5bMNm3YHTsIQ8J9wefE+rRDR8qrc2XTUB/j2+4DlAx2Nx
         n0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XZGZlZ6KGqASvVxpzUDTpMytysWT2/lYk8Yby81Wb20=;
        b=dS6MoBtqb2i7XE4PVRuaADBJ1rUKglDi3nZsxvVVJKRBnszdo47MUVoJSZ56BJgpI+
         jU5/f7QmGGVw1bEPI75O0iGPBmSTzpoUXCadYovzfwTdXqxWFKaDcCvFOaDMcowz3e+2
         c7hKd9TcpvCqt2pMC/8CT49EtIpgeal81SZqra1UOi4uar12b20NVgHynNM6zzeCJUTt
         aAKce7ecEf+/H9Bpho5JcDoh/OTcdhXXGEL6Ib7sn5nrJSZMAB1j0JJ5Dl8vK5Pxg+jN
         OsRPLcQiktfR5L4zdgaGaCe9fEHe4MVbdN1XcsvrKGrkiC2NiKuZLmff6zeyApPw+pKm
         81zQ==
X-Gm-Message-State: AOAM533w2W8dWe6tnPEhr7ocKw7/plwlv2Wk3Q+mci/SOHELhvdc8364
        gZ1jZi9ttWE+SzyQcBO1nKObf+avKvg=
X-Google-Smtp-Source: ABdhPJzQFgUJ0cb2q45Hj57a3OvRCU2RvHl72IhAfi0zdEFskG6YYrFeHONVrA5JcKtlgjwzFOiCdw==
X-Received: by 2002:a05:6512:388f:: with SMTP id n15mr4209845lft.280.1624386574292;
        Tue, 22 Jun 2021 11:29:34 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl. [83.6.168.10])
        by smtp.gmail.com with ESMTPSA id b16sm2505763lff.210.2021.06.22.11.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 11:29:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: msm8994-angler: Fix
 cont_splash_mem
To:     Petr Vorel <petr.vorel@gmail.com>, linux-arm-msm@vger.kernel.org
Cc:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20210622181056.27632-1-petr.vorel@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Message-ID: <de10e844-b4c1-b3d4-cdd7-1491335285d9@gmail.com>
Date:   Tue, 22 Jun 2021 20:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622181056.27632-1-petr.vorel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ah yes, I think I know the issue..


Angler's firmware (probably Huawei's job, but unsure) seems to make IOMMUs (another guesstimate)
not report where the memory is allocated. If it's an issue only on these boards, I reckon
it would be better to just add


"/delete-node/ &cont_splash_mem;"


in angler/bullhead DTSI, as other 8992/4 devices seem to not have this issue. But as I've said, bullhead could

probably work anyway, but if it doesn't, it's probably Google's job after all..


P.S
I did not suggest redefining the node, as the memory@0 is reserved for SoC registers
and your firmware is just playing tricks on you. Your RAM starts @ 0x80000000.


Konrad
