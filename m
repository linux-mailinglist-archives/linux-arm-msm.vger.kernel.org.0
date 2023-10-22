Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12AD7D239E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Oct 2023 17:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjJVPqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Oct 2023 11:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbjJVPqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Oct 2023 11:46:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15988A7;
        Sun, 22 Oct 2023 08:46:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C334CC433C8;
        Sun, 22 Oct 2023 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697989564;
        bh=XdIoiVQW6YAaUGZzEHBDOTv9Q4nHTlvJRhqEFGaVzfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IK9Y3FL+C2o2Px0pt70pDLP+I77VvfdA6IiXV/9JgfREQqP0YAck55+LUfRdoJ8NH
         eZEZDktf6CBh/zk0fjckTXKZ3wFC+8G8llzy5/j+uDaDwtjHs+4K7/G1PJGBo+MMaz
         pkwN+YL/iZPjeEsRYo0H3lHP69sO+yJm5y6QlMASugP/V4z9ZuhR4DM2bDCtIjBC9x
         rOd7seAyQvW0A2DIb3jLfu3VORHO7vs0lgYl8wzk1NVBJF63ZH/Zxhal60F+g/04wd
         lgTuTpWogYMvrWIOqG45n88bYJ4fuZTvN+t81h7d7NcDQ0J9GxCCt1NWoR3nRqD8Ya
         3s3ssZ8FeGaPQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
Subject: Re: [PATCH 0/2] dts: qcom: enable flash LED on OnePlus 6 and PocoPhone F1
Date:   Sun, 22 Oct 2023 08:50:12 -0700
Message-ID: <169798982306.271027.8182488892508249394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 01 Oct 2023 18:19:02 +0100, Caleb Connolly wrote:
> Like the SHIFT6mq, these devices both feature a dual-tone flash, enable
> them.
> 
> Both patches have been shipping in postmarketOS for a few months now with no
> known issues.
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-oneplus: enable flash LED
      commit: 84b160876b4d8a97dc0feccc4426fefbc396d414
[2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable flash led
      commit: 7eedf7d6faaf0dd0807fff2ee595433faf08d138

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
