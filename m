Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4143976C7FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 10:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbjHBII5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 04:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjHBIIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 04:08:55 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD39919A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 01:08:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe463420fbso2514355e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690963733; x=1691568533;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aOKmlxAZiu+rAy0mWvKiWQUS7YSnrxxOgJ2e0G73lbg=;
        b=tMzB48/4AsljrJvI2Ejp29/MrmRT3yKPeEX/DqlKCpOvI4twz4giC1NoKfgL72NFco
         lJufmZSDxWaWNjua3rF8eculMDKzzKA1Q/t7Lc02HGHVTNW7d+JZmfDm5LMt6mbzVLIH
         IjQ4WNxPR/FamtiRyJFqoZkzBYWgT/1I8Je5EUyg8pfGTTgGmCQ6q+N05lF2sRmuoKkf
         ggNDMLDtRdZQnnzrDIEeNv2eh7vx4LT40xMdo4z2V2zRmZmTFdFNUIQPtr7jp7bX7nOM
         6bndKwLX1CDNLsstFPiF+qs9/sUh2+sPn3CzJRUUTmdZgY24j2M83+Bo70GHRH2QksZJ
         BltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963733; x=1691568533;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOKmlxAZiu+rAy0mWvKiWQUS7YSnrxxOgJ2e0G73lbg=;
        b=UcgR/hTU7zaVblO2FuIUi7U7OTjD6XPlDt5dZRQW8IotsAab0jRclnUL77nhPkt7r8
         3VZ9jbA+hLNBOdEEvU6sutezYmajK0cVl0aTw36LIR/JZHDCj/7p97g2dSt/7R4sgHjh
         RntONenKVmZk6sRdsKLMwpbK6U0ryUQAF1HXdGqaRbB3/Y0EOEkEIK8SwElCuhEEI6Dg
         ShJ5iORI7pfTWCPsVsBO1hZ0uoCsSMUXIToRzWds2NmrmsDJIqP45JUMPU4Rk2pnaQDU
         vL2nTK3gXMt2oXDYPMdfX2C0KbLsn7CTmgIbBcfRFdPuIDwdGGbLK6VAGyizz2rqeda+
         Ozqw==
X-Gm-Message-State: ABy/qLYhQl9Z4aU5LMlqUbcFO/Bgklbs2odrT9p9lJi1+9nEpO2E8yWd
        QfXMOEERGGrmOJqE3BpurWysKA==
X-Google-Smtp-Source: APBJJlFG++b4mOehT6ZE3FkFUr1jz2i+ns16PIZMvzWbhnmLx8s6v/p8aB2VxEB9+qh6r9g8T5sPww==
X-Received: by 2002:a05:6512:104e:b0:4fd:fc36:68a2 with SMTP id c14-20020a056512104e00b004fdfc3668a2mr4674646lfb.1.1690963732826;
        Wed, 02 Aug 2023 01:08:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196? ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003fbcdba1a52sm1006994wma.3.2023.08.02.01.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 01:08:52 -0700 (PDT)
Message-ID: <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Date:   Wed, 2 Aug 2023 10:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 02/08/2023 03:18, Dmitry Baryshkov wrote:
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector. This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.

Can you CC me on the whole patchset ?

Thanks,
Neil


<snip>

