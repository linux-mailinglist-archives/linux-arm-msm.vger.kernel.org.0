Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034C97AC4B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 21:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjIWTOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 15:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIWTOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 15:14:44 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B25FB
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:14:38 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59c215f2f4aso49881607b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496478; x=1696101278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6VhOCWF+ynd7copH4f2yVtc2i5yJp0tKjP7DBJWHccA=;
        b=XxDmdafF5SqkVHtM6DYnVQfXJilGRFyMvcBgZrPmAnkYzBqZuyNew+I5oPaaN/rWfL
         i/Mm/+B9nSXR//u0GhkATeJdDVG4zZzLf+YKOsfBZHnoEK0Hfb82dIMdOvaCFab0XPbU
         DNlHxH5XHoYejfO+bBjWqGJgk5YqE5HZ/tGW1gHD4lynwwT8EOM9tKxw24ZVo6Q6n183
         tGm90SJRDJdDYTPxwpjLVDF7d8q2yMVFc+spf9/ZmqRRuy0Dom1NtWWJJB3sH0tuwiOn
         lE3bHNBYgaAC/UuTCywvurL5ye4VNMQDqrXQBLkkOPRqDIWzDzDnBtw2BzpY3koVttDV
         x/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496478; x=1696101278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VhOCWF+ynd7copH4f2yVtc2i5yJp0tKjP7DBJWHccA=;
        b=EVezdYdgQoEFGVUOoPa857Pd7hm5V6sa7HIAZjJL4fdCi1y+S1S3Ev9kVmHeTU+YUT
         ZyNIbnYBqHNEZamTcA7JmzNaL9JQQToNyYHqFslN1O8AqUmGyKHqYp3h8BPgm+sSY25p
         FGegxIzlv/5inlDwGLAmkjlK1+2wmlPehGSDr8khTQ/Ecgna+S9cUDOyQe79s63Fvita
         C/RqW4/XRzpggzdKLH7vZOlcQWDaDkN86iNm3+ZJV33CKAKgEdZE/PHtu1HLYzPlryNU
         8U0VBOZWSyjLelzb2J9/ETowuQeYwn1b5iXuoveAO2c1/K259sbf5bj7/1EBup3QT0wp
         HfCw==
X-Gm-Message-State: AOJu0YygAuRO184nTWd5o+UCe6hKHiKsUL/tx5uade6+4T9POXICq1+g
        0TQqqiCSsnxVDcqNZxIbJiP5uCQTkmcxFKJURdEcIw==
X-Google-Smtp-Source: AGHT+IEXrA6dbcuQVgJj6jiFnJaGVpMmWaaRY9SNum7koxm9FFIHsiBiEqOprk+GF7Q5FQ/v6O7buksQm9OGfKYzgUY=
X-Received: by 2002:a05:690c:2b0a:b0:59f:535b:52a8 with SMTP id
 em10-20020a05690c2b0a00b0059f535b52a8mr1489573ywb.23.1695496477936; Sat, 23
 Sep 2023 12:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230922084303.4164046-1-quic_gokulsri@quicinc.com> <20230922084303.4164046-4-quic_gokulsri@quicinc.com>
In-Reply-To: <20230922084303.4164046-4-quic_gokulsri@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:14:27 +0300
Message-ID: <CAA8EJppX==xq8Z9MCS4ZwveV0-WKbvEC3Wv1NzGvXXV=2q5DzQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: qcom: ipq5018: enable the CPUFreq support
To:     Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Sept 2023 at 11:44, Gokul Sriram Palanisamy
<quic_gokulsri@quicinc.com> wrote:
>
> Add the APCS, A53 PLL, cpu-opp-table nodes to set
> the CPU frequency at 800MHz (idle) or 1.008GHz.
>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
