Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB1075C636
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 13:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjGUL5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 07:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGUL5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 07:57:45 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B453172D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 04:57:43 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso1241695b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689940663; x=1690545463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gZeVRbN8i3RBrNfW3X1oiz7Rg1AaV6+VX/SLakSfZZA=;
        b=iKCl353NEddqXRkMvTc4WhEeB5hqbKgT/AUtGB7CfQ3YsTpdC12YZHueB2HFGxILa4
         2pNgMS7KN3+B/t+ZVNJ6rAciQHePdD+PGsiRPXItha92UsFbSShlGk5dC5uVq+/P85u+
         qeEpAkebRFfP395V1y6H+WCmtXlJtlMBhyzgnjXPDV7BIZu40cDh5nZcPzfX3lxoZJxn
         eMq8MPrY+6v0LcHnCapxqWDswAjp9tMbhbbeeT0Z60Cx8+hHLUvWQKwXzHn7Of/a1S6b
         yEWlmQQAfuncH9J1eYTu2cQLGjm6hMskc8C65A7yzBtJN/85tWwwZvbzERH6Fk2BbCnH
         feUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689940663; x=1690545463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZeVRbN8i3RBrNfW3X1oiz7Rg1AaV6+VX/SLakSfZZA=;
        b=c6QQJob9BGLoUe+0mDIECpLggxWK5ABwy5wmUpNMkQaMbHHMRGmP5fJV5mhr93bH39
         2vSdf/HWu3et73GS1HnR6wxnmmx3olmfseU9cBGWE7v/5IRxlBYfyK6YMd0t9xG/TrH9
         7OprFP3/eA1p8+Ax1Z5wzHXTzsx+97d1ezs8AKw8JQ95QNSgkmoLcJsIjwMUYNm8htab
         Bx8rfhs5KAK1zR5y/fFpWlXV0dl3Z299B2PoYIv8ObFc3YcXmCt8OhjnSF4cO/a0UiRH
         H79cz+5L8wihLUgkZIy3nzj9xTn86YFUfw2uyx1S7bvp1WQhBjoOhCfebjIAatsOsLys
         qAjA==
X-Gm-Message-State: ABy/qLYBgBQtZNO46n+AcNweKm6xvBmjAydUVtzz+NLrMa7cArsxqk5w
        QELIY86ev8ad87cL6M6p6vLQ
X-Google-Smtp-Source: APBJJlEvmEp/uWX9S9crTApKWRrgbE4M1ih0yNWyhpPGUZogOYzA/q6Zy/eF3S72X0sFN2yoWHinGA==
X-Received: by 2002:a05:6a00:2404:b0:681:3ed2:b493 with SMTP id z4-20020a056a00240400b006813ed2b493mr1319785pfh.26.1689940662836;
        Fri, 21 Jul 2023 04:57:42 -0700 (PDT)
Received: from thinkpad ([117.206.118.181])
        by smtp.gmail.com with ESMTPSA id ff17-20020a056a002f5100b006675c242548sm2803366pfb.182.2023.07.21.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 04:57:42 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:27:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jejb@linux.ibm.com, martin.petersen@oracle.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/15] arm64: dts: qcom: sdm845: Fix the min frequency
 of "ice_core_clk"
Message-ID: <20230721115731.GB2536@thinkpad>
References: <20230720054100.9940-1-manivannan.sadhasivam@linaro.org>
 <20230720054100.9940-5-manivannan.sadhasivam@linaro.org>
 <20230721071801.e6ngfnkwg2ujsklg@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230721071801.e6ngfnkwg2ujsklg@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 21, 2023 at 12:48:01PM +0530, Viresh Kumar wrote:
> On 20-07-23, 11:10, Manivannan Sadhasivam wrote:
> > Minimum frequency of the "ice_core_clk" should be 75MHz as specified in the
> > downstream vendor devicetree. So fix it!
> > 
> > https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.7.3.r1-09300-sdm845.0/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > 
> > Fixes: 433f9a57298f ("arm64: dts: sdm845: add Inline Crypto Engine registers and clock")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 9ed74bf72d05..89520a9fe1e3 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2614,7 +2614,7 @@ ufs_mem_hc: ufshc@1d84000 {
> >  				<0 0>,
> >  				<0 0>,
> >  				<0 0>,
> > -				<0 300000000>;
> > +				<75000000 300000000>;
> >  
> >  			status = "disabled";
> >  		};
> 
> Please keep new feature and fixes like this in separate series. This
> could be merged directly in the currently ongoing kernel rc and
> doesn't need to wait for this series.
> 
> Or at least keep the commit at the top, so another maintainer can
> simply pick it.
> 

That's what I did. This patch and previous patch are the fixes patches, so they
are posted on top of other dts patches to be merged separately if required.

- Mani

> -- 
> viresh

-- 
மணிவண்ணன் சதாசிவம்
