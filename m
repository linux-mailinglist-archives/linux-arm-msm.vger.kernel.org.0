Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826AEB4FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 16:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfIQOE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 10:04:27 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41125 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbfIQOE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 10:04:27 -0400
Received: by mail-lf1-f66.google.com with SMTP id r2so2972332lfn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=BxbTCRdsYk2Q6OvKAJsveG3klNjxz7cfrfAZhFzZlP4=;
        b=G1Hv7eunZw8Oo1C4EqX8VIZLVoR/HG/TD17omZJgKUqDzZOyVb5pa4Ia0T7C4pdtG6
         bnqhwSaqnuXRQOIeQYoLLftV3uN/cvqKA8gKyJNLICLP6fx9zGp4iDn/3iDHVxmFYOKG
         D40Ai2+JECu31jkp5BKvE2bb2aeen6iGw8OTIA4FZGm6+Sk8FUCPAAYv9KVu8ZnNX0Ib
         kL/7T43L1PdSQHO5LyreK4TcB0NalQ1wKCxqQby9ZtXA0qEi2Dfj5ocwBvQQihjUbXWg
         QtvUKGOi71AK8z8XPWbxmB/srovwHoXc9OCXcpVp/gJ+wuTpwBOeUB2akxNUFSYQx+W6
         MHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=BxbTCRdsYk2Q6OvKAJsveG3klNjxz7cfrfAZhFzZlP4=;
        b=cb06pH0NkIxZPcAuPpop3rAF1nzMPP/SxZsHQ1nwGk0FPrhX8UiUqw3zPSUi9gbLcn
         VxS6YzG6+MWeXnUBZOdYsCquOTROqV6yE/Mm6uMgMJUJfSq11yWFTP2fBlHbB0bug3Q3
         0l6rn0FvF2opd8+T7IMZAFApLyVGrgsMqUaeCBiJVmhmbO+9mMSLNtsUnyr53KkzXrDA
         JLgHqZQycohCtPcIS8ktd66GltyEGbUv1yMwKSYSC7hXutJcJ2bBKlzuTQAjJhel8xqi
         y9UBl0vEZC9K+3EcJ0GuTFXtZ12J+WjqYJ2zeRa7NqeLrd/6osncgax4M+4dg9Ne6cnR
         Avow==
X-Gm-Message-State: APjAAAXYsBwOU6B1J/q5pWJkYrT3InRTEZ9T389y2wNTNZv6XEnHXIxu
        pG/ppJgXKRSHyKaFGLLxZGDCkWifDdXYdkGy3lVzEi58
X-Google-Smtp-Source: APXvYqxRnhwQQHql7VsyyepGBO013WeOvasEtuwQA72mSoph0sNkKtDdmJXECYdJPySiq9NcL2sRgyIofapvqEERCXg=
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr2259082lfp.134.1568729065270;
 Tue, 17 Sep 2019 07:04:25 -0700 (PDT)
MIME-Version: 1.0
From:   sven falempin <sven.falempin@gmail.com>
Date:   Tue, 17 Sep 2019 10:03:59 -0400
Message-ID: <CA++fYEiEA+s0j5w6E3ph_b1A2ZbpcmSkLK=b0vqK2YkB+r=-UQ@mail.gmail.com>
Subject: Pre UBoot initiliation required to get MDIO working.
To:     openwrt-devel <openwrt-devel@lists.openwrt.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To anyone with DTS and qcom MDIO/ESS knowledge,
please help, you are my only hope.

Using an QCOM ap.dk04.1-c1 / ipq4019 device,
I ran into an initialization problem for MDIO driver.

The problem only appeared when I started booting from the device,
because executing 'dhcp' in uboot , do some initialization that fix the problem.

I m running openWRT current, 4.19 kernel with 5.3-rc4 wireless code
and a few other patches, ( openwrt r10985-4364dd244c ) , and minor
tweaks.

Also , to run IPQ4019 and ESS, which kernel offer the better driver
support right now ?
4.14 ? 4.19 ? 5.3 ? 3.x is not possible. (regarding Voltage regulator
and RTC for example )

Nevertheless I am not sure if my DTS file could also be a source or trouble;
My DTS contains :
/*          */
   mdio_pins: mdio_pinmux {
    mux_1 {
     pins = "gpio6";
     function = "mdio"; // ipq4019-pinctrl 1000000.pinctrl: invalid
function mdio0 in map table
     bias-pull-up;
    };
    mux_2 {
     pins = "gpio7";
     function = "mdc";
     bias-pull-up;
    };
   };
/*          */
  tcsr: tcsr@194b000 {
   status = "ok";
  };
  ess-switch@c000000 {
   status = "okay";
  };
/* */

  mdio@90000 {
   status = "ok";
   pinctrl-0 = <&mdio_pins>;
   pinctrl-names = "default";
   phy-reset-gpio = <&tlmm 47 0>;
   status = "ok";
   bias-disable;
  };

/ * */

In the uboot vendor, the DHCP  'init' the ess, and enable the kernel
to detect the ethernet phy:
( only two are wired , and i only tested eth1 because it s the only
one that matters for now )

        u32 data;
        ipq40xx_ess_sw_wr(S17_GLOFW_CTRL1_REG, 0x3e3e3e);
        /*
         * configure Speed, Duplex.
         */
        ipq40xx_ess_sw_wr(S17_P0STATUS_REG, S17_PORT_SPEED(2) |
                                        S17_PORT_FULL_DUP |
                                        S17_TX_FLOW_EN |
                                        S17_RX_FLOW_EN);

        ipq40xx_ess_sw_wr(S17_P0LOOKUP_CTRL_REG, 0x140000);
        ipq40xx_ess_sw_wr(S17_P1LOOKUP_CTRL_REG, 0x140000);
        ipq40xx_ess_sw_wr(S17_P2LOOKUP_CTRL_REG, 0x140000);
        ipq40xx_ess_sw_wr(S17_P3LOOKUP_CTRL_REG, 0x140000);
        ipq40xx_ess_sw_wr(S17_P4LOOKUP_CTRL_REG, 0x140000);
        ipq40xx_ess_sw_wr(S17_P5LOOKUP_CTRL_REG, 0x140000);
        /*
        * HOL setting for Port0
        */
        ipq40xx_ess_sw_wr(S17_PORT0_HOL_CTRL0, 0x1e444444);
        ipq40xx_ess_sw_wr(S17_PORT0_HOL_CTRL1, 0x1c6);
        /*
        * HOL setting for Port1
        */
        ipq40xx_ess_sw_wr(S17_PORT1_HOL_CTRL0, 0x1e004444);
        ipq40xx_ess_sw_wr(S17_PORT1_HOL_CTRL1, 0x1c6);
        /*
        * HOL setting for Port2
        */
        ipq40xx_ess_sw_wr(S17_PORT2_HOL_CTRL0, 0x1e004444);
        ipq40xx_ess_sw_wr(S17_PORT2_HOL_CTRL1, 0x1c6);
        /*
        * HOL setting for Port3
        */
        ipq40xx_ess_sw_wr(S17_PORT3_HOL_CTRL0, 0x1e004444);
        ipq40xx_ess_sw_wr(S17_PORT3_HOL_CTRL1, 0x1c6);
        /*
        * HOL setting for Port4
        */
        ipq40xx_ess_sw_wr(S17_PORT4_HOL_CTRL0, 0x1e004444);
        ipq40xx_ess_sw_wr(S17_PORT4_HOL_CTRL1, 0x1c6);
        /*
        * HOL setting for Port5
        */
        ipq40xx_ess_sw_wr(S17_PORT5_HOL_CTRL0, 0x1e444444);
        ipq40xx_ess_sw_wr(S17_PORT5_HOL_CTRL1, 0x1c6);
        break;

        mdelay(1);
        /*
         * Enable Rx and Tx mac. // this one ?
         */
        ipq40xx_ess_sw_rd(S17_P0STATUS_REG, &data);
        ipq40xx_ess_sw_wr(S17_P0STATUS_REG, data |
                                S17_PORT_TX_MAC_EN |
                                S17_PORT_RX_MAC_EN);
        ipq40xx_ess_sw_rd(ESS_MIB_OFFSET, &data);
        ipq40xx_ess_sw_wr(ESS_MIB_OFFSET, data |
                                        ESS_MIB_EN);
        ipq40xx_ess_sw_wr(S17_GLOFW_CTRL1_REG, 0x7f7f7f);


Is there missing pieces in the MDIO / ESS driver , or can it be the DTS file ?


Best.


-- 
--
---------------------------------------------------------------------------------------------------------------------
Knowing is not enough; we must apply. Willing is not enough; we must do
