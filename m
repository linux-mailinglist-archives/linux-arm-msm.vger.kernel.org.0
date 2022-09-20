Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D475BEA2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiITP1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiITP1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:27:13 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE12B6610E
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:27:11 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h3so3477210lja.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=B9zlBSDLGz45J4rVCp92QGE3K/PsSyKbBmZmy97aTBI=;
        b=ppjQoYCIqEDoyUQC1g2tJEF9x+OH4j14EIYEA62fIwfNdWb9ZqB1iloakaviH3ZcRa
         fonKsm+S8/CSernRRlxpY7e/eewkOvD+QYWU/471vhz40GxOUfs585ZV3HOviGc1KREb
         wAKyV24WXIDZeWDIbL0Vxp4GmMzbA4gENISMMIWGVDpE81XTSVJmp6efXxb3YozARVWT
         g6TmlBvjdKBjq2lTq26WO0dKUdEPPr9JjbI/9HH7l5jQgZPsmp2Sy1155ToRLPehtmEy
         xoEUMxxzRWUctxN5K3wzpy0Wd3yLvyTk8SO9DdZ+FizC8UaBeR05tgHWSMG8dxD2GKPk
         Ma6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=B9zlBSDLGz45J4rVCp92QGE3K/PsSyKbBmZmy97aTBI=;
        b=jCH5XQoXnxmRM+k6YdRQMT8voOYPdTQF31sc4jdb6N04JgHmyYyzYQKlbagjFtycbN
         pLGwS1KjGjerzhT9PT9FWHkIkIGLBrrU+MY9hRfRKu4C5rTVI809hk05YRNJF/wNJnJ/
         v1YXl2qkYUDBbOcX5PSNEGNdIJsrvuE+laN9yMgPbO1Fyw1MvavuuuZRY3HXa1ftSUxt
         ZakkMCZcfpgxHcbT+5zxsoCeFeD8hcr4a6FRXkJNqUXT8W5DGsFVnPuAh3ZgciOhq/Zz
         MD+q0bFpBPFuAFNpSzY1W2ohy33xhaZSuujpxX8A3vvnp2VHNtX3sjanyfqKpdT+Les7
         cByg==
X-Gm-Message-State: ACrzQf1nElGm9FxUJxUTqH1rbKZDN//vaWyfH6yPk1sNVyNUi2DeRDcD
        arAd5gNuqswmPSp110PfzYfZpg==
X-Google-Smtp-Source: AMsMyM5zFH+v5M6zKOBxmCc1ayLTaRdsTIZtdXX6bZsrIPRwr+sIo7L7DUAZzTEsxi92gWtC3zBLXQ==
X-Received: by 2002:a2e:9b89:0:b0:26a:a203:3b54 with SMTP id z9-20020a2e9b89000000b0026aa2033b54mr7622030lji.478.1663687630221;
        Tue, 20 Sep 2022 08:27:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p9-20020a2ea4c9000000b00261b4df9ec4sm29516ljm.138.2022.09.20.08.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:27:09 -0700 (PDT)
Message-ID: <9f64a14d-8bcf-b015-4f19-1a6eb7501960@linaro.org>
Date:   Tue, 20 Sep 2022 17:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sa8295p: move common nodes to
 dtsi
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20220920120802.14321-1-quic_ppareek@quicinc.com>
 <20220920120802.14321-3-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920120802.14321-3-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 14:08, Parikshit Pareek wrote:
> There are many ADP boards with lot of common features. Move common
> nodes to sa8540p-adp.dtsi file. This will be base for many ADP boards
> to be introduced in near future.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
