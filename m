Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD135F3455
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 19:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiJCRSx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 13:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJCRSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 13:18:52 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACCAB78;
        Mon,  3 Oct 2022 10:18:51 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso6450211fac.6;
        Mon, 03 Oct 2022 10:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=IUANyagVkWI/KVRnn7CGB2nz36goP/7bMWd4pYEwNkQ=;
        b=quFUWecLogB9hOPu5spJAlVpDnXStAnAot0t2mQ2Ti7r3HjzKzUe61CgFytoRexgSp
         g4UCdoTKqPwSTZiFozuf07Adh+GLRzJQ1OAoTC8tNWrBvSpuzV7Vb6wx70wXY16CDWU7
         QsI3oEW8Lx/zYwUHjp3YAR5aXcuZ8WRztJnaAFZ22kHLscoXDMyvM5N2uuImafOypntn
         nzF1WpVDapIK0oC7HNTRB5zVqldKQgwoxeWkgrinlmbBcfFJgTRJ2lldvlFGNQiGv+lH
         VwAI7q6HZRTjphUcdmAsxbgWzttnJAediJU6AFuA9ndDbQ3jHWBdY5DfpupeHQaNZdgW
         SIEw==
X-Gm-Message-State: ACrzQf2qatkFCV40GMN+bKF+9Pf9fodw946765x0LQzxwMNahK+5sp4D
        TXwy2eo0nrKY6AjYSsZAQw==
X-Google-Smtp-Source: AMsMyM5eYSuSISAx3ZwBg9efptxFP3DDSHmomyG1R35znQb7JYPqKWLib2jRJVa+eBn9lv5k/+9k2g==
X-Received: by 2002:a05:6870:828d:b0:132:c30:a8ca with SMTP id q13-20020a056870828d00b001320c30a8camr5740724oae.293.1664817530518;
        Mon, 03 Oct 2022 10:18:50 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q83-20020acad956000000b0033b15465357sm2569409oig.5.2022.10.03.10.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:18:49 -0700 (PDT)
Received: (nullmailer pid 2468557 invoked by uid 1000);
        Mon, 03 Oct 2022 17:18:49 -0000
Date:   Mon, 3 Oct 2022 12:18:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Message-ID: <20221003171849.GB2462016-robh@kernel.org>
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 01, 2022 at 12:20:51AM +0300, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with SoC
> bindings (soc/qcom/).

YAML-ify? Can we say 'convert to DT schema' instead like everywhere 
else. YAML is a file format. It doesn't describe the vocabulary.

Rob
