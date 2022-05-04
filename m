Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD14851B146
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 23:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378862AbiEDVqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 17:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378859AbiEDVps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 17:45:48 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF0852E6B
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 14:42:10 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id j14so2646936plx.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 14:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+YytypHoUck4k/sP0+tgNCidzpN+9CPPoe6T3TFQ1ss=;
        b=c5GaFHza5u7zvdhOsEfhBT8PmFAesf08tJm5iWhYA+F0yZQ9vDP8vxKMLFYa6NnPzh
         U5uaW9BK/DNMrVOepxnE8CoG/xtF2ssSkDb06AcMsTY/s7v/rojWhl3cdJ4EzppKskx1
         upJLj3rUatHbTs9zo76ExUqufrCRUCKEJL48A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+YytypHoUck4k/sP0+tgNCidzpN+9CPPoe6T3TFQ1ss=;
        b=6r9RiYeWYtQSAW7ZmprPset6SwkineM8f/7vDbwx0V5b8J0uRFCA3ww2buAb8nt+b4
         +l1xyfs85hs4DiQM+U1c61MCr7X406g6WLf6MkOId6jd94T2BpvMYyB8e0VIMRIjSDGW
         B88v82W8xBnh7k0JnmGf13lDVbpTLi05HpDqdY3hUz8I9uvJeVGzyjx4IUqYyom5Bp9+
         xTHcGjPQsz/mdWlUkD8bzO5XsOPuPqV25LPyE2voJkjM+L1yJIf3+uiBO/3551/kvqdW
         UkU2Rw5x8aIsnTc7V6O7+TeVDUnLQeSg4Na6mMl2tWJMeQ3J/viggyfBfT2wBWXEZ+Wg
         HR+Q==
X-Gm-Message-State: AOAM530lPt6dwQtpRp93+m3ZPCKMnlvSDe+iucXJv8uqN5g0Dioit/SD
        gB3m+qEzmxSn+bAnNqfL5kd4+w==
X-Google-Smtp-Source: ABdhPJxmYyfqjb6wWssNObgtiUEn8/QazbGRnP+SJH4zsggo4uV6Hby443ibWAm2p7zM7LveboiQVw==
X-Received: by 2002:a17:903:11c7:b0:151:9769:3505 with SMTP id q7-20020a17090311c700b0015197693505mr23612341plh.72.1651700530415;
        Wed, 04 May 2022 14:42:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:35b6:c77b:be04:3bd5])
        by smtp.gmail.com with UTF8SMTPSA id k2-20020aa78202000000b0050dc762816esm8638181pfi.72.2022.05.04.14.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 14:42:09 -0700 (PDT)
Date:   Wed, 4 May 2022 14:42:08 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v11 11/12] arm64: dts: qcom: sc7280: Add sound node for
 CRD 1.0/2.0 and IDP boards
Message-ID: <YnLzMIt0bnzsSeq9@google.com>
References: <1651664649-25290-1-git-send-email-quic_srivasam@quicinc.com>
 <1651664649-25290-12-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651664649-25290-12-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 04, 2022 at 05:14:08PM +0530, Srinivasa Rao Mandadapu wrote:
> Add dt nodes for sound card support on revision 3, 4
> (aka CRD 1.0 and 2.0) and IDP boards, which is using WCD9385 headset
> playback, capture, I2S speaker playback and DMICs via VA macro.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Carrying over from v10:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
