Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794AB6F335D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 18:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjEAQEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 12:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbjEAQE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 12:04:29 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E0E1988;
        Mon,  1 May 2023 09:04:17 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1aaed87d8bdso10318975ad.3;
        Mon, 01 May 2023 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682957057; x=1685549057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7uTYXafNiRUe9TPnXbYp98lygSgSfsMMJbEyqdr1Xno=;
        b=kMdA8F6uxpEuCADO5dAwyTBVRPGVlumJAkRN9PpgRH844bxq7nbTa4eD9ZTICkJ+t2
         7nkW9abnRKwwTdaGLVM0/BvgMlShu4/SB33WYnkvsFUfpmuKMOP94kgjPcuF4/0tLKPO
         oC9AgwSZhrpSpG3fY/tEi7qO2w0vidZdNx2sjUfZKrV58z3TfQSF2H69trHrxV3c39SD
         lmIamXobgGPIMiXfrPOK4xVCg5kqL0L3q6UG+aq6oMmV4HaBamGl1TcKykKIuXUcEDuC
         dQJarSKSqPKS9Qu75C15ebsji+e+wCr5etZKGYOIq/ee/1ocuWSmh2ThSf+Tf052pxjb
         4+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682957057; x=1685549057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uTYXafNiRUe9TPnXbYp98lygSgSfsMMJbEyqdr1Xno=;
        b=CYGKQEz9naQYt5objHT22JZTMDou2Gi+zSMqQ7+ecV9Lus1GmSnquYEl1XEL4kwFPy
         4Viat29UqAArlk5QSuBfN5hZIj7DxaJ/AWVx1I0m+g9Jrc6mreyLTSQKvVp15ywlZcXt
         4v8IlU4HOHeyG8Mqvw6W0XOaBDvtWXRJbL8BYvQbz3k/+qeHAye2M9AAxdNP5YlenPSC
         6G3OGnLuSJpc60Pg1PZN9SIFGnTfHPelQJ5ApsSadgVlNBckBj/eAvqz/9AMS/+kaoki
         Rn2/ucxaZsb4dc3l4sIdV4v9I1DuJqb+FwLysYu0XakxobCKqiHIeCb0zFkmUUFu05Os
         m/qQ==
X-Gm-Message-State: AC+VfDxC7EZSvq/1BihHSmdKp58LY4oU096VHtj+C+O6gnPfFv1KShaU
        nIDoZv5wgv1orRAtPLSDHxc=
X-Google-Smtp-Source: ACHHUZ603YvB4O1DQMGWoADr2/MIOfEBVW8F8tMHGt9CtWVyxGTOvcK805kppfI9DBJiX3rh8Zz78Q==
X-Received: by 2002:a17:903:1c4:b0:1a6:a7d4:7474 with SMTP id e4-20020a17090301c400b001a6a7d47474mr17574130plh.44.1682957056988;
        Mon, 01 May 2023 09:04:16 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902728d00b001a525705aa8sm14269553pll.136.2023.05.01.09.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 09:04:16 -0700 (PDT)
Date:   Tue, 2 May 2023 00:04:09 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Message-ID: <ZE_i-a33NO02xEEJ@Gentoo>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <ZE_Y5BvxiimB9mu8@Gentoo>
 <bf5b4a43-192d-f1f7-253d-c60b884fe344@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf5b4a43-192d-f1f7-253d-c60b884fe344@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 04:53:22PM +0100, Bryan O'Donoghue wrote:
> On 01/05/2023 16:21, Jianhua Lu wrote:
> > This port node should be moved out to the block of pm8150b_typec rather than
> > usb-c-connector. Otherwise,
> > 
> > [   10.998897] OF: graph: no port node found in /soc@0/spmi@c440000/pmic@2/typec@1500
> 
uh.... This is runtime error, it doesn't matter bindings.
I haven't much experience with typc-c, so I can't address code for this.
> 
> Ports/endpoints should go in the connector.
> 
> Documentation/devicetree/bindings/connector/usb-connector.yaml
> 
> grep usb-c-connector arch/arm* -r
> 
> This dtsi should be updated
> 
> arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi != 
> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> 
> ---
> bod
