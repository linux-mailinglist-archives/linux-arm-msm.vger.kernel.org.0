Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE795EE2FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiI1RYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbiI1RYG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:24:06 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799D585F9F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:23:59 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id g20so15085614ljg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=MwZOOjSe5EvqawjxEnJ7FpDAPkEwDQh4cjtEeodqDpo=;
        b=ZzZ7DIVntT7aI1nDfftM+iWVT5R1Jw4M0n+AsVEFM9LxzmG638WQlH8T1wqhfT2Anl
         Wn3Rv6N743EPx4DAQY3XundnbjSvraW2HAe47+2XHDTp3DwxozCJIsZumiRpDVVBycJa
         hOA/V/EffgoKN/UbKrDG1kNuaqjuS0DSVNXxx4libAgLqP7bO/w4OvOq9lx13gZGJFYZ
         pvCUROJipwFBcyVCPuF6+mnTycLw9HN1Tf2kjdGXmlbQD7/mCD739R7NyunzYuuZWj00
         IUw3tnP7DJ6hQ3bOZY48aoOV1QbYNlC+mfA/WpIo93gay5ui0tvziG84RzG7tEPwhRTe
         vHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=MwZOOjSe5EvqawjxEnJ7FpDAPkEwDQh4cjtEeodqDpo=;
        b=TJdEHNFuWsMEgl7qKheul9XNSE0uPlnB5+iVMEbCJ5vaGYvpQ9upi2RWtIDOHRNrAo
         uiScqiXO5cdd5cQWiUGMUGBQrzWL4ryR1w9TBHdkVAuUofcfeYpf/agk3xbcQYgFAUkR
         d4W5piZddLF3tAJuHIoI18682NtknaIoM02LN/EegjiepUEUS0tw+trWHsFOLGym44U/
         pfsTwyphYSrvaW50soa5IL1Pz5sCc1VXViXiF2DxOSAptcKfXD78LURgElIBbuOCwt8N
         my5tiy8xIGy6xm6NtzVRb+l0K58fljG1F18r3RuxrMoowAEeZHOZgrH6HcXvsB8xO8b4
         iJPw==
X-Gm-Message-State: ACrzQf1/k42WmE37UI1IWfgHZiHdWS+u6h/OD0uUQy2rKEudKLj21BdK
        UyjmS5nQKnnVJtY0o48eszAZ3A==
X-Google-Smtp-Source: AMsMyM6VLlCeQHckt8SN5QNWyY/DXEQ6oobDBfMuKTAPAsCeQGpo2az/688Am9GDyV02N5Umat1Y6w==
X-Received: by 2002:a2e:22c6:0:b0:26d:94f3:1142 with SMTP id i189-20020a2e22c6000000b0026d94f31142mr6637214lji.101.1664385837246;
        Wed, 28 Sep 2022 10:23:57 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.4])
        by smtp.gmail.com with ESMTPSA id a17-20020a05651c031100b0026c5b16b87dsm495445ljp.5.2022.09.28.10.23.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:23:56 -0700 (PDT)
Date:   Wed, 28 Sep 2022 20:23:53 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/13=5D_phy=3A_qcom-qmp-pcie?= =?US-ASCII?Q?=3A_drop_unused_common-block_registers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220928152822.30687-4-johan+linaro@kernel.org>
References: <20220928152822.30687-1-johan+linaro@kernel.org> <20220928152822.30687-4-johan+linaro@kernel.org>
Message-ID: <DF75CC1B-4455-470D-8A30-8CDE55F36537@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28 September 2022 18:28:12 GMT+03:00, Johan Hovold <johan+linaro@kernel=
=2Eorg> wrote:
>Drop the common-block register defines that are unused since the QMP
>driver split=2E

I'd mention that they were only used for msm8996 pcie phy=2E Nevertheless:

Reviewed-by: Dmitry Baryshkov<dmitry=2Ebaryshkov@linaro=2Eorg>

>
>Signed-off-by: Johan Hovold <johan+linaro@kernel=2Eorg>
>---
> drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec | 9 ---------
> 1 file changed, 9 deletions(-)
>


--=20
With best wishes
Dmitry
