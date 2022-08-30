Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86AD5A5F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 11:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbiH3JaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 05:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbiH3J3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 05:29:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA57F28F
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:29:45 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p5so11554317lfc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RGUqkEAMYcKdlxASVSFfqtFS0Ow4eDh7fj2KOS3N7cc=;
        b=duvxjG2yG05W77RsYVgchCQxXXuysvwY/I0a7Tn/GslnycXVvQ6AQfWnIgUgZZ+K4g
         SKJ+DurBhGQtpKl7C47uXbeGI0houeGHpZTzGBNEMxd+C4S/rXJF6j/d+Dt+X+VeOFsV
         b1JWw6wOTkiq8uik9ki4DPVID9S5KN/yQg+ZFDFZtAIEQ9r0/F24+HbSlL7wf4oSZkOS
         u1xsyVXESvALtYKjXf9Knooh+Jk5++CWWFb5AisvpI489RNNA6CiS8tNvh+Y49FA3Mgm
         9PnCPfKhswxcvTLwYAO6Qr7CxJ6Rdcng0kFWBRfcJmVSSwA1pI/BXB1JYmw3Zl/n020f
         jXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RGUqkEAMYcKdlxASVSFfqtFS0Ow4eDh7fj2KOS3N7cc=;
        b=koorsmKd8CYD+2Q9cpRcevzNJI5I78/Xvjg4i7My22vf9ME0EpiJWloWCdDElI++M3
         nRI22oIBe/htUZ+Qqt4+qg+kfONHZNkk96cLTQnEsWkru/P7YXvcQ8lQxgLW7q2yK14G
         YtnQb6eu3X2o+Fzm/MRs/jzsWtZ/8+uynBwiWR8EBaKrvuLUDhH18l0FwetRf0PVVx9M
         YK2SIh56Qh7XQ9gPC3aLpO/ne2/JCDQ6PZfUc9zF8sx5XtG9Dp9VvRn2OG3pDHEDFJ6o
         UKELM78TG0R+Lpt3Bt3AmIWaBbTgwoJho7WJKWlijaHNUrKh7Frzvr6Z1YqVjPOQxp0c
         I50w==
X-Gm-Message-State: ACgBeo03sj8OEqlN7h3UAOWsL85kXrNwGNraYBZNSrGxBa8RHzPnCM29
        Eu8oKkyeg/YiucpOKrLxl2t6mg==
X-Google-Smtp-Source: AA6agR4IWI7kP1cAa/pXkx98zqiF1r1A2zAWpv5R30sR9R2HKmZsVBdBLuRtOqzeUM+4p3ajRxdqLA==
X-Received: by 2002:a05:6512:1527:b0:48b:99:f3ff with SMTP id bq39-20020a056512152700b0048b0099f3ffmr7439961lfb.81.1661851783238;
        Tue, 30 Aug 2022 02:29:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v11-20020a2ea60b000000b0025e00e0116esm1697453ljp.128.2022.08.30.02.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:29:42 -0700 (PDT)
Message-ID: <9e428ef0-509c-eb09-0d4c-13cdd74fad8f@linaro.org>
Date:   Tue, 30 Aug 2022 12:29:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 2/6] phy: qcom-qmp-pcie: split register tables into
 primary and secondary part
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn@kryo.se>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220825105044.636209-1-dmitry.baryshkov@linaro.org>
 <20220825105044.636209-3-dmitry.baryshkov@linaro.org>
 <Yw2+aVbqBfMSUcWq@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yw2+aVbqBfMSUcWq@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 10:38, Johan Hovold wrote:
> On Thu, Aug 25, 2022 at 01:50:40PM +0300, Dmitry Baryshkov wrote:
>> SM8250 configuration tables are split into two parts: the common one and
>> the PHY-specific tables. Make this split more formal. Rather than having
>> a blind renamed copy of all QMP table fields, add separate struct
>> qmp_phy_cfg_tables and add two instances of this structure to the struct
>> qmp_phy_cfg. Later on this will be used to support different PHY modes
>> (RC vs EP).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 141 +++++++++++++----------
>>   1 file changed, 83 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index c84846020272..60cbd2eae346 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -1346,34 +1346,33 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
>>   
>>   struct qmp_phy;
>>   
>> -/* struct qmp_phy_cfg - per-PHY initialization config */
>> -struct qmp_phy_cfg {
>> -	/* phy-type - PCIE/UFS/USB */
>> -	unsigned int type;
>> -	/* number of lanes provided by phy */
>> -	int nlanes;
>> -
>> -	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
>> +struct qmp_phy_cfg_tables {
>>   	const struct qmp_phy_init_tbl *serdes_tbl;
>>   	int serdes_tbl_num;
>> -	const struct qmp_phy_init_tbl *serdes_tbl_sec;
>> -	int serdes_tbl_num_sec;
>>   	const struct qmp_phy_init_tbl *tx_tbl;
>>   	int tx_tbl_num;
>> -	const struct qmp_phy_init_tbl *tx_tbl_sec;
>> -	int tx_tbl_num_sec;
>>   	const struct qmp_phy_init_tbl *rx_tbl;
>>   	int rx_tbl_num;
>> -	const struct qmp_phy_init_tbl *rx_tbl_sec;
>> -	int rx_tbl_num_sec;
>>   	const struct qmp_phy_init_tbl *pcs_tbl;
>>   	int pcs_tbl_num;
>> -	const struct qmp_phy_init_tbl *pcs_tbl_sec;
>> -	int pcs_tbl_num_sec;
>>   	const struct qmp_phy_init_tbl *pcs_misc_tbl;
>>   	int pcs_misc_tbl_num;
>> -	const struct qmp_phy_init_tbl *pcs_misc_tbl_sec;
>> -	int pcs_misc_tbl_num_sec;
>> +};
>> +
>> +/* struct qmp_phy_cfg - per-PHY initialization config */
>> +struct qmp_phy_cfg {
>> +	/* phy-type - PCIE/UFS/USB */
>> +	unsigned int type;
>> +	/* number of lanes provided by phy */
>> +	int nlanes;
>> +
>> +	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
>> +	struct qmp_phy_cfg_tables primary;
>> +	/*
>> +	 * Init sequence for PHY blocks, providing additional register
>> +	 * programming. Unless required it can be left omitted.
>> +	 */
>> +	struct qmp_phy_cfg_tables secondary;
> 
> I haven't really had time to look at this series yet, but it seems the
> way these structures are named and organised could be improved.
> 
> First, "primary" and "secondary" says nothing about what these
> structures are and the names are also unnecessarily long.

I started with 'pri'/'sec', but was asked to improve them. Any sensible 
suggestion is welcomed here. 'main'/'aux'?

Regarding 'saying nothing'. It's true, initially it just followed the 
existing split for the sm8250. Then I added the `secondary_ep` table.

> 
> Second, once you add a containing structure, the "_tbl" suffixes could
> be removed (e.g. in "pcs_misc_tbl").
> 
> Doing something like below should make the code cleaner:
> 
> 	struct qmp_phy_cfg_tables {
> 		const struct qmp_phy_init_tbl *serdes;
> 		const struct qmp_phy_init_tbl *tx;
> 		...
> 	};
> 
> 	struct qmp_phy_cfg {
> 		struct qmp_phy_cfg_tables tbls1;
> 		struct qmp_phy_cfg_tables tbls2;
> 		...
> 	};
> 	
> as the tables can be referred to as
> 
> 	cfg.tbls2.serdes
> 
> instead of
> 	
> 	cfg.secondary.serdes_tbl;

Nice suggestion, I'll implement it for v3 if Vinod doesn't object.

> 
> Johan

-- 
With best wishes
Dmitry

