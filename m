Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9E8565E47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 22:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiGDUOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 16:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiGDUOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 16:14:33 -0400
Received: from ixit.cz (ip-94-112-206-30.bb.vodafone.cz [94.112.206.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B3C6551;
        Mon,  4 Jul 2022 13:14:28 -0700 (PDT)
Received: from [10.0.0.163] (_gateway [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 010112007F;
        Mon,  4 Jul 2022 22:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1656965666; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=br9buy1jxDhCD9bYZEOYTu5MLdkaAvOs5IDAthaWcT0=;
        b=VcXq/IdzfCBoKrKUmgYreop+xN+HX5vNtEGxtzCizkPvTYGL94kmAonth6a3BH6lNi12/7
        oSkBXBgvSqfg/c40M+WwZXNJ3k4vaEMzuhRkjaTBQXQPYvxxzoV+wJlcEFvRbAdyLa0gdL
        9wfGNcF6bnAKdL+CDxUmc0DwIe3z4Uw=
Message-ID: <32dc6325-b133-176b-65f8-b9267b7aed40@ixit.cz>
Date:   Mon, 4 Jul 2022 22:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To:     dmitry.baryshkov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, quic_tdas@quicinc.com, robh+dt@kernel.org,
        swboyd@chromium.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/15] clk: qcom: use parent_hws/_data for APQ8064 clocks
Content-Language: en-US
Reply-To: 20220623120418.250589-1-dmitry.baryshkov@linaro.org
From:   David Heidelberg <david@ixit.cz>
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RDNS_DYNAMIC,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: David Heidelberg <david@ixit.cz> # tested on Nexus 7 (2013)

-- 
David Heidelberg
Consultant Software Engineer

Matrix: @okias:matrix.org

