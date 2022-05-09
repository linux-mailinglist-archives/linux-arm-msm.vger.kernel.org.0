Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C1520589
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 21:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240677AbiEIT7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 15:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240706AbiEIT7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 15:59:00 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFDD7223C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 12:55:05 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id s14so14866159plk.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kh+QQ/TxXS1NVKYU2dj8970PKcONRYGyMb573yL70Zs=;
        b=DB5AMq154uPVEABPd/Ht20m9xAuHdLPAIpLNbV2AUd+Xl3o5PSogp22tXDaf8adH/V
         thnCPnxPBairN5psa5Q3YUT6K4ogh3mhaBxf8XJNroaaR0CdTMSXlGfdIopfPo7ebDAN
         AEoxTBUl1A2BS1estbYeGlGjmqCX74SR2d4XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kh+QQ/TxXS1NVKYU2dj8970PKcONRYGyMb573yL70Zs=;
        b=g+RDpFIFrg2rPGZhP89orf3nZ80dUG5e0puvMYGFx0w5m38hjmjxP8t2z350k+qLWR
         28OzIcMMnlCUrS1RC7Ksn3c5R5JFpALQj9criTt9JAui4UZbGbW2LWNK3kLiefuwzM9A
         +8n8vb/viPC1wO75KWPqcN3RTv6oe8BN/puh9KR7ltzFWdKsoPBfZl/WDf2Y81HC2oDo
         JAnrQKvjOGK0vw7BAEMGiXiZv+D4OipuKjOBUxJig4H8UewSkFTRK+/Yte+on66cl8CC
         SpiV8TgVJOKKKRxlL2dIgCIsD0eYBku+PFxpdyPC/AIcVhiOnkx46OPNp4+4m0GWFpPN
         ZMwQ==
X-Gm-Message-State: AOAM530uHddBW9irzpLRLoppNMgH44fhFqPr69Rlhf1iiIWbRdgIWNCj
        OqNqMS9Wn0BglNCu5bGluMDcrg==
X-Google-Smtp-Source: ABdhPJweHWgd7qc2MqEdODa2jlyfVzb0XNyTHa8rV9JgRxEzF16wLYb7GsZAb9n2TCoNDkBKkyCnUw==
X-Received: by 2002:a17:90b:314e:b0:1dc:d143:a15d with SMTP id ip14-20020a17090b314e00b001dcd143a15dmr20698782pjb.111.1652126105085;
        Mon, 09 May 2022 12:55:05 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:753:614a:caf8:e14d])
        by smtp.gmail.com with UTF8SMTPSA id w19-20020a170903311300b0015e8d4eb2a2sm229445plc.236.2022.05.09.12.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 12:55:04 -0700 (PDT)
Date:   Mon, 9 May 2022 12:55:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org, swboyd@chromium.org,
        krzysztof.kozlowski@canonical.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
Message-ID: <Ynlxlz7brLWZFRnd@google.com>
References: <1652082798-5855-1-git-send-email-quic_sibis@quicinc.com>
 <1652082798-5855-3-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652082798-5855-3-git-send-email-quic_sibis@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 09, 2022 at 01:23:18PM +0530, Sibi Sankar wrote:
> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
