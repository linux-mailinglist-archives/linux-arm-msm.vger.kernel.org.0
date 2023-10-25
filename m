Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4F97D61A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 08:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjJYGZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 02:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjJYGZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 02:25:15 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BF312D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 23:25:12 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cacde97002so32457445ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698215111; x=1698819911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YRNx4/VhgJBUmPLhfW0nzhO+j+HC6thHIfSQat4cc5Q=;
        b=E2TrS5twCMhJnRkIHOMNNqcEgDS2AEsF0M3m9s/HaI9gY729q04tRAq/7QNZ7+cBOU
         Ba3IzzbiUn1t9ozMz5lMCVCxxV04VZsgGe7Mef8ndh2b3IbF9I90FaV3B6AIbdmEendN
         7V6BQMSzkID7eUnXBxSTDFx30/8UNfiT6V0slAQzrxjyddUaNQXMC/r1hhKmpZjRa9BL
         1RcKEPoEXeWiwUNaknv0M6FSUYhkpcaq760kb502SEUH4C9ycryn4f5cmCVnW9PKqalD
         OSx8eu6mq9eDvN3qx/UaZ2be5KHJqA1ebie6Or7IrZ3otksLjy9AanbrLfstZjfBjCUr
         xImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698215111; x=1698819911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRNx4/VhgJBUmPLhfW0nzhO+j+HC6thHIfSQat4cc5Q=;
        b=rDrVNxCzZFlP6/X0DoYYGwS2dLtXuAp4rchHrNgJQtl9XtbdiHjLv2k5trMhwK+VIB
         xD9J16VdC3G8xa3jTn4wAl29oWGc2H3f2NIVvg4TnzzRQmv9n7XU0Xzxqoq4aEVFnR6f
         kkOz140aWORqbub4LpCvuKgpHdl9YUgfqM1gidnR6C2QbPrX+n4Fezl0g3txsKIIctAT
         wYPQ26ShvlYXpVvYI5wKt+ueIResbczcnfHJE6VjRHYA9pwJd693iUqJRj3Vvug6fiUx
         WNnbXI2sew/9e6W1qYSctm2oUcxgOECCckBjJJLmDzZy2qjocWGd96LAR/sq++48VNzf
         bHhA==
X-Gm-Message-State: AOJu0Yw+HAOZOZt+Xo+tGdw82/w3QLcTRb9hx5mvcG6FxvxG/oo+Ut4s
        9Cx6iSIR57CGI0vnH2kz9a1/Lw==
X-Google-Smtp-Source: AGHT+IGohNcTFzm2Bh0bFriQkaNYjeD1yBiORs4U/Gyp7N7O3RPbMKBRyGUEMkF90cJRpigxhPHV9Q==
X-Received: by 2002:a17:903:11cd:b0:1c7:29fd:33b6 with SMTP id q13-20020a17090311cd00b001c729fd33b6mr13396486plh.40.1698215111463;
        Tue, 24 Oct 2023 23:25:11 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id u17-20020a170902e5d100b001b89a6164desm8371393plf.118.2023.10.24.23.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 23:25:10 -0700 (PDT)
Date:   Wed, 25 Oct 2023 11:55:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, ilia.lin@kernel.org, sivaprak@codeaurora.org,
        quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Enable cpufreq for IPQ5332 & IPQ9574
Message-ID: <20231025062508.vccrmkem45p3fnwe@vireshk-i7>
References: <cover.1697781921.git.quic_varada@quicinc.com>
 <20231020070947.cwigtaa2haij56hz@vireshk-i7>
 <20231020080339.GA6197@varda-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020080339.GA6197@varda-linux.qualcomm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-10-23, 13:33, Varadarajan Narayanan wrote:
> On Fri, Oct 20, 2023 at 12:39:47PM +0530, Viresh Kumar wrote:
> > On 20-10-23, 11:49, Varadarajan Narayanan wrote:
> > > Varadarajan Narayanan (9):
> > >   cpufreq: qti: Enable cpufreq for ipq53xx
> > >   cpufreq: qti: Introduce cpufreq for ipq95xx
> >
> > Can I pick just these two ?
> 
> ipq53xx patch is dependent on the previous safe source switching
> patch, hence not safe to pick that.
> 
> 	No -> cpufreq: qti: Enable cpufreq for ipq53xx
> 	Yes -> cpufreq: qti: Introduce cpufreq for ipq95xx

The patches don't apply cleanly. Please resend.

-- 
viresh
