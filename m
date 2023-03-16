Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EF36BDB96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 23:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjCPWYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 18:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbjCPWYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 18:24:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1A6B71B4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 15:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679005322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/Rowjv41usgCF4QQ+kI7SHFbssbiYFWw5qAQUMEZc44=;
        b=gK3WeMr43mIntNxRzMQh85HPH80FGpSm4jADr5dw6koMrdZgz4HHaa41qHp07ZyAvEaozU
        hzU5hghTHfe434DsS3nbdc4YwSB5BLim39G6lh5rCKBdV9R8xX8DPyZSAU0D50acLp51IR
        zn0kDuLgfUojikVDUBh7Q50jc47g72w=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-n5MMGJyhMPWy53akBvAvmg-1; Thu, 16 Mar 2023 18:22:01 -0400
X-MC-Unique: n5MMGJyhMPWy53akBvAvmg-1
Received: by mail-oi1-f199.google.com with SMTP id bk18-20020a0568081a1200b0037dc3a143bbso1547602oib.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 15:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679005320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Rowjv41usgCF4QQ+kI7SHFbssbiYFWw5qAQUMEZc44=;
        b=e8UMZA+csSon2hCLKcaf4maPF679zFlQzCpUICP+qkBKCQImix1v5fTlKVA/QQbfUv
         KKbWjsIVCUx8KbeH0MeJnP/t4uD2Y1XMh2wJ9yGNquBaIBGnPqzkDsrLSqPyeTLI+m3v
         ADzEbkStwRN/wXa+67rOQAxE3JUGUHS5uBeTDdpU0NBeVXZ3ZufPcFu6IYcm34mLWn8R
         r+xN+xDyEn6ntw4/XCsFw8h1xbJOy6vuw7gppHpsEla2BFEFhPh65u9MKp6Gn5t5jL4w
         HHspCr5XeyPZoJH7UbJmODKoRDZAaSmC3EPDcY6QwNMoAbEfqaxrrMAmV8/ruaveNFTf
         xlxw==
X-Gm-Message-State: AO0yUKWSSk8BWCT3J102+XwEvVlPpnUmOA0KLF0KRi5UAZwUkiGSpvsG
        iiQ3F0LK3uxmot1VH5g7hdTn9mv6QOlX0ahWKNqOtzaBWM6/bG1JOs1o+RO0cSg2Z8V/asMguBN
        pCFvl03J0Exa6+dkjAVbBO17iFA==
X-Received: by 2002:a05:6808:288e:b0:37f:ab79:a18a with SMTP id eu14-20020a056808288e00b0037fab79a18amr3573031oib.6.1679005319341;
        Thu, 16 Mar 2023 15:21:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set/j+kh5lDpmaLzdIllCWV+e60+QESfodsxPJwbhNxsMnnYpD889YVRRc7aq7J3P6t24SdXMeg==
X-Received: by 2002:a05:6808:288e:b0:37f:ab79:a18a with SMTP id eu14-20020a056808288e00b0037fab79a18amr3572986oib.6.1679005317656;
        Thu, 16 Mar 2023 15:21:57 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id r130-20020acaf388000000b00383f58e7e95sm245725oih.17.2023.03.16.15.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 15:21:56 -0700 (PDT)
Date:   Thu, 16 Mar 2023 17:21:53 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com
Subject: Re: [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
Message-ID: <20230316222153.43wzb4nv7s4d3wwz@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <3f37eede-6d62-fb92-9cff-b308de333ebd@linaro.org>
 <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 11:08:18AM -0500, Andrew Halaney wrote:
> On Tue, Mar 14, 2023 at 04:13:18PM +0100, Konrad Dybcio wrote:
> > 
> > 
> > On 13.03.2023 17:56, Andrew Halaney wrote:
> > > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > > 
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > ---
> > Was it tested to not cause issues on access on "normal" 8280xp?
> > AFAICS if there would be any, they would happen at registration
> > time, as gdsc_init already accesses its registers
> 
> No, I've only tested this series on the sa8540p-ride. I luckily also am
> working from an x13s, I will use that to confirm nothing strange happens
> with this applied before sending v2 and confirm the results.
> 

Writing from my x13s with this applied, things seem ok to me :)

Thanks,
Andrew

