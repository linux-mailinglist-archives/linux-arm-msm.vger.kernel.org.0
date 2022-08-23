Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4979259CF30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 05:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239958AbiHWDJE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 23:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239994AbiHWDIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 23:08:24 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1E02638
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 20:06:27 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-11d7a859b3aso4078787fac.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 20:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=ntnuN1Cbf4zs1wTSTN7LzLd8igQL/4ijLCx6okIoVxk=;
        b=Lh9cBLkVXyylxnaHrcvdYQsWQairdmSDoTPgCznyRmSjDMDiILp++/TGvKExXeo6O1
         85c08Zk9eT8u1vBA1/vCqt20YoTrWBS1gi1I+Zjb0EriSCQzU61mIi/SCMOiKJ0wzppI
         SCu9NGHHlhnXWqF2T/5TztWPz+ls/9dpdeHNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ntnuN1Cbf4zs1wTSTN7LzLd8igQL/4ijLCx6okIoVxk=;
        b=dT1K+aZuIhcTNSeXflXBDkzQ+XbMyYEHv2LPx4GLWwP6GfzjwBQok/BqOpTRovS6m5
         fpx5NMA1UjVdtoLebatgEngIlt1yse5UrILQU5jvEnailXZD0GpDyAia1Z8ILWBb6ZIM
         7LJ/WsyxNHOOdorPfGTylaZrxijxBbZhluJdRR/T0tPC93MdcLRE3grMZB72MMIBwUX1
         oa+mEgtvw8o0u/22XW9evHavBl6lfDYsJF9W2LHiSGTsSZEb3OKdvnGRdP/36l2g088k
         n9cW14SUsLQhz4pyAd+WMHvmKu4iuXUXLOAGqNof7lPjed7CWTlRyp75wPSWopFhiQHq
         3+vQ==
X-Gm-Message-State: ACgBeo1LmhE/0dqLzVKWaLpH4erS6Fy7xzFKlpkd9vkp362DtqqR6neA
        PAV7kg9CwfXPTdYxsobK080+zsKziFOPvlIwFgCPXg==
X-Google-Smtp-Source: AA6agR5fL+F4upoZF82AsrgsRSYaDfJ86q9IfWZPbsEXsxBIolOFrRiht9F3qacrKx0bRyZhfJUdcElQgFukBVJ6feo=
X-Received: by 2002:a05:6870:e408:b0:11c:37ad:773a with SMTP id
 n8-20020a056870e40800b0011c37ad773amr564465oag.44.1661223987166; Mon, 22 Aug
 2022 20:06:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:06:26 -0500
MIME-Version: 1.0
In-Reply-To: <1661156523-22611-5-git-send-email-quic_srivasam@quicinc.com>
References: <1661156523-22611-1-git-send-email-quic_srivasam@quicinc.com> <1661156523-22611-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 22:06:26 -0500
Message-ID: <CAE-0n52thpGPOZHtSx=P_ki1HApEKhK+2aerOKk5opY=Q9MSxw@mail.gmail.com>
Subject: Re: [RESEND v5 4/7] remoteproc: qcom: Replace hard coded values with macros
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-08-22 01:22:00)
> Replace hard coded values of QDSP6 boot control reg params
> with appropriate macro names.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
