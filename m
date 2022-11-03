Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163B56187FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 19:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKCSx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 14:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbiKCSxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 14:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EA55FCB
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667501585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AqzuI69gQNwIQyN1bVrCnvnBiSoLwcFO0iBFEG4BdBo=;
        b=Pj8dSCvaFNleXA60wnUwjaSaZ5PiBvgk6lVVOqrF2h1wt0eY/z6gi9dvczg7wYGqKqQExC
        COe94iYqy2BocuGw7vATM5nWChRtL1+keeduGrjW51AZM1QqTUP9Cv+FCynlZ2R+/Za0Ir
        GX7KZzfz5ifMi88aqGCOjwpUdYmy/ug=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-hXqbKN2OOLmgylF0q6jlpw-1; Thu, 03 Nov 2022 14:53:04 -0400
X-MC-Unique: hXqbKN2OOLmgylF0q6jlpw-1
Received: by mail-qv1-f71.google.com with SMTP id g12-20020a0cfdcc000000b004ad431ceee0so1879600qvs.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 11:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqzuI69gQNwIQyN1bVrCnvnBiSoLwcFO0iBFEG4BdBo=;
        b=n4YVXdBgUPAm8TBCwfVdP832B4LgIf13J/5QsNSZ/Xn4Mr1C3uZ2bzGjckuSPFK55K
         uMiKF6otTagS2chRGiF5hLbiCIHIbxTxe5hANNZHzp/aYSREQgIL7mUAB3KxBP3u0bwY
         mUBHCRDkr7HNm3TnBd8QlZfzxPATMdvhE+7wM8gXU4LeI4sIZ10v/C8gA6vvbnEjReE0
         QWMqnOiJgFDodKlAgnV5aVjlETdiw4Otvtav6hxyFglDeBO8Gm/eFYRA2Gg4tsbh3EDl
         upX4yfJdmliun5soGKuYo1dQZ4QBErfwaOtP9JJ/OYB/fFkmeaBPDJJGJUY/zkz/2dpE
         D2pg==
X-Gm-Message-State: ACrzQf1g8K2l0jg364gbsr9llVY9SBcfPJ32+JxL3Wp5IgsHaTzOeVES
        hfw7W8UsSHpkBfeVaj7p9CCRGNcMWM+4iTP2dA9i5ebmbMuU15yI0zOqwmndFsipqMCim+N/I4z
        zcyDChzD/ow/baytDJD4ZILe24Q==
X-Received: by 2002:a05:622a:620b:b0:3a5:30c2:bf0d with SMTP id hj11-20020a05622a620b00b003a530c2bf0dmr16996682qtb.306.1667501583438;
        Thu, 03 Nov 2022 11:53:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QkyI/NSOnvv19pCgS3K/W8SwFYEZHIYC9AjRoZ7kVkM71dJl9o/BUr2Kqg80BDoHJ3Hz6RA==
X-Received: by 2002:a05:622a:620b:b0:3a5:30c2:bf0d with SMTP id hj11-20020a05622a620b00b003a530c2bf0dmr16996664qtb.306.1667501583234;
        Thu, 03 Nov 2022 11:53:03 -0700 (PDT)
Received: from halaney-x13s (068-188-102-130.biz.spectrum.com. [68.188.102.130])
        by smtp.gmail.com with ESMTPSA id ch3-20020a05622a40c300b0039d085a2571sm965235qtb.55.2022.11.03.11.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:53:02 -0700 (PDT)
Date:   Thu, 3 Nov 2022 13:53:00 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sc8280xp: Rectify UFS reset pins
Message-ID: <20221103185300.qlmp7syopca5qmgx@halaney-x13s>
References: <20221103181051.26912-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103181051.26912-1-quic_bjorande@quicinc.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 03, 2022 at 11:10:51AM -0700, Bjorn Andersson wrote:
> From: Anjana Hari <quic_ahari@quicinc.com>
> 
> UFS reset pin offsets are wrongly configured for SC8280XP,
> correcting the same for both UFS instances here.
> 
> Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # QDrive3

Functionally I saw no difference using ufs_mem_hc that I can notice.

From what I see in the downstream source the prior diff looks proper,
but I found a hardware document that says after diff is proper,
hence the R-B. I'll trust the hardware doc.

Thanks,
Andrew

> ---
>  drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
> index aa2075390f3e..e96c00686a25 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
> @@ -1873,8 +1873,8 @@ static const struct msm_pingroup sc8280xp_groups[] = {
>  	[225] = PINGROUP(225, hs3_mi2s, phase_flag, _, _, _, _, egpio),
>  	[226] = PINGROUP(226, hs3_mi2s, phase_flag, _, _, _, _, egpio),
>  	[227] = PINGROUP(227, hs3_mi2s, phase_flag, _, _, _, _, egpio),
> -	[228] = UFS_RESET(ufs_reset, 0xf1004),
> -	[229] = UFS_RESET(ufs1_reset, 0xf3004),
> +	[228] = UFS_RESET(ufs_reset, 0xf1000),
> +	[229] = UFS_RESET(ufs1_reset, 0xf3000),
>  	[230] = SDC_QDSD_PINGROUP(sdc2_clk, 0xe8000, 14, 6),
>  	[231] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xe8000, 11, 3),
>  	[232] = SDC_QDSD_PINGROUP(sdc2_data, 0xe8000, 9, 0),
> -- 
> 2.17.1
> 

