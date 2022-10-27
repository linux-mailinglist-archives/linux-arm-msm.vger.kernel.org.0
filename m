Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD98C60FC82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbiJ0P5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234804AbiJ0P52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 11:57:28 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BD31956F2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:57:27 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id 8so1266421qka.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=df8V8QzWnG/MrADstC8wPeI8AU708a4im8SF07dHL9I=;
        b=wDpe7xVPCoNut8Ty+WUvLl12Ppr+5FSDArchKi5DYeXeNccJhNIjCP26uXrL7Vp52k
         2BTn0N3etbjGHhuZe8H5TWNeazBt0lfs9tnuusDE/AcGJy7LMua5WTvyGRXdpPd2e9+b
         N6k2ALH3shp/C9DAuNfzGQ44lrv6Qy8OO00uQQL1kkpAPfrkW+CHX1HVayBXTccnoP60
         Cmr/Mg3clpn9cA1oeLifnkoX1t2VIYBkbtAZ9t+nqrzGsCDUlBiPYraEQteNYuhCsla0
         75surQNT83Y8E8VEVA2vKMAUOECp+zI0WZT8bv9Ju5a2C9P+vsRGF4g6Xg/TS6ItrF9l
         /omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=df8V8QzWnG/MrADstC8wPeI8AU708a4im8SF07dHL9I=;
        b=i511qXuDC8TpVODTDECj4unml+NOmXKDnYI5wlAon1E7wPEcmAlP5eIDuD9xZf3aq4
         5tNn/4Pa94Dt8URMKkeIM2OnYQAJZj6UmYTB6i8ZTp/BHI3VC/Xok1j75OTLr1e+84CH
         KoAPHSa0m9t3y/KcIh34ZFQesLuuzzRFZCzRMJ9W1OhEJB2QqakyXqpiuW7Yk79UXxZR
         eeRqBDKIObPVnStM5zdKk0agNgFCnEdvlFkjXgZmuQAivBt5fjvslQT7Ga1swtePDutT
         XY52JDM0Hr/oMUXcssNraiCFDqKw+wvbOQRgxxfYSgEPyAV7Ye1nFSAvvQSjNv2FO//I
         ZYjg==
X-Gm-Message-State: ACrzQf1cxKa3eumgUWJuqM8Ilv2kPN4rzuVTjn4S1m+cFxy5lK9Cop/6
        PB6nEjaHsSU9w8TFQCMRqRNsIQ==
X-Google-Smtp-Source: AMsMyM4i8RSkz2eYlr0BAh9Yzhl8dIaa0v0rxcHTTOwhX0fst4Ab+36GueZ99quat+8TFpKM02OaiA==
X-Received: by 2002:a05:620a:2627:b0:6b8:c8c3:78f9 with SMTP id z39-20020a05620a262700b006b8c8c378f9mr34726354qko.641.1666886246933;
        Thu, 27 Oct 2022 08:57:26 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id o9-20020ac86989000000b003a4fe88a9dcsm564741qtq.60.2022.10.27.08.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:57:26 -0700 (PDT)
Message-ID: <de2cd5c0-1c3d-5d47-4896-82e32f3c0d88@linaro.org>
Date:   Thu, 27 Oct 2022 11:57:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: Add RPMHCC bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026190441.4002212-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/10/2022 15:04, Melody Olvera wrote:
> Add compatible strings for RPMHCC for QDU1000 and QRU1000.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

This looks correct except:
1. redundant bindings in subject
2. not cc-ing all maintainers

so still not tag.

Best regards,
Krzysztof

