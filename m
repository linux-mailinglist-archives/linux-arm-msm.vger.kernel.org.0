Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783757A1A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 11:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbjIOJNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 05:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjIOJNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 05:13:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB2C9B;
        Fri, 15 Sep 2023 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694769217; x=1726305217;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mry5V7nr5xa9zDtsfeoNxabJToApg0Wq8K46aPBD860=;
  b=V2pjMmUmlYkPNIfWaZ7P7Xgpcf1/la4MerFUNF4m67OJJd5wf/zRaq6J
   p3W0BGWKYvQyx2M/D/q85HYtMM9UZuNdxIoBH673M3UKPMSQsLj9wUTd6
   gZainNOVcnlWBAkoOjiiBUvno2OQvoVufeIpd+AsyVIUKXLcZn2q4yEl/
   0A0USDrbxJ0Sd6c/OBQ9gzmZ2R9JUK/8GQc6Qel6qhICkNyUFuLVWyzp1
   GKUmALuF2/q7avrDLEOm8Iz3tbqcbiqAzheOc/NFG3JSooP1yZiVnc51u
   9QyeqFa8GvcLZRNRgAcbAdqx1npEDkg1LRHSYeBEZ1SHANoC8PbRUpZQc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378120590"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="378120590"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 02:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918589081"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="918589081"
Received: from srdoo-mobl1.ger.corp.intel.com ([10.252.38.99])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 02:13:03 -0700
Date:   Fri, 15 Sep 2023 12:12:58 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     John Ogness <john.ogness@linutronix.de>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Tobias Klauser <tklauser@distanz.ch>,
        Thierry Reding <treding@nvidia.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Davis <afd@ti.com>,
        Matthew Howell <matthew.howell@sealevel.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Russell King <linux@armlinux.org.uk>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Hongyu Xie <xiehongyu1@kylinos.cn>,
        Jiamei Xie <jiamei.xie@arm.com>, Rob Herring <robh@kernel.org>,
        delisun <delisun@pateo.com.cn>,
        Lino Sanfilippo <l.sanfilippo@kunbus.com>,
        Yangtao Li <frank.li@vivo.com>,
        Vineet Gupta <vgupta@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Richard Genoud <richard.genoud@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Baruch Siach <baruch@tkos.co.il>,
        Sherry Sun <sherry.sun@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sergey Organov <sorganov@gmail.com>, Tom Rix <trix@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Gabriel Somlo <gsomlo@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Lucas Tanure <tanure@linux.com>,
        linux-amlogic@lists.infradead.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Xiongfeng Wang <wangxiongfeng2@huawei.com>,
        Yuan Can <yuancan@huawei.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-unisoc@lists.infradead.org,
        Kevin Cernekee <cernekee@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lech Perczak <lech.perczak@camlingroup.com>,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Isaac True <isaac.true@canonical.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nick Hu <nick.hu@sifive.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        linux-riscv@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Hammer Hsieh <hammerh0314@gmail.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Timur Tabi <timur@kernel.org>,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
Message-ID: <1446dc6-5ab0-629-45c8-3b7d8c76367d@linux.intel.com>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Sep 2023, John Ogness wrote:

> When a serial port is used for kernel console output, then all
> modifications to the UART registers which are done from other contexts,
> e.g. getty, termios, are interference points for the kernel console.
> 
> So far this has been ignored and the printk output is based on the
> principle of hope. The rework of the console infrastructure which aims to
> support threaded and atomic consoles, requires to mark sections which
> modify the UART registers as unsafe. This allows the atomic write function
> to make informed decisions and eventually to restore operational state. It
> also allows to prevent the regular UART code from modifying UART registers
> while printk output is in progress.

Hi John,

Would this also be useful to enable printing to console while under port's 
lock (by postponing the output until the lock is released)?

E.g., 8250_dw.c has had this commented out since the dawn on time:
        /*
         * FIXME: this deadlocks if port->lock is already held
         * dev_err(p->dev, "Couldn't set LCR to %d\n", value);
         */

-- 
 i.


> All modifications of UART registers are guarded by the UART port lock,
> which provides an obvious synchronization point with the console
> infrastructure.
> 
> Provide and use wrapper functions for spin_[un]lock*(port->lock)
> invocations so that the console mechanics can be applied later on at a
> single place and does not require to copy the same logic all over the
> drivers.
> 
> Patch 1 adds the wrapper functions.
> 
> Patches 2-74 switch all uart port locking call sites to use the new
> wrappers. These patches were automatically generated using coccinelle.
> The 2 used coccinelle scripts are included below and executed as
> follows:
> 
> $ spatch --sp-file uartlock-1.cocci $FILE
> $ spatch --sp-file uartlock-2.cocci --recursive-includes $FILE
> 
> This series brings no functional change.
> 
> Patches 2-74 contain identical commit message bodies. Feel free to
> fold them into a single commit if that seems more reasonable.
> 
> Thomas Gleixner (74):
>   serial: core: Provide port lock wrappers
>   serial: core: Use lock wrappers
>   serial: 21285: Use port lock wrappers
>   serial: 8250_aspeed_vuart: Use port lock wrappers
>   serial: 8250_bcm7271: Use port lock wrappers
>   serial: 8250: Use port lock wrappers
>   serial: 8250_dma: Use port lock wrappers
>   serial: 8250_dw: Use port lock wrappers
>   serial: 8250_exar: Use port lock wrappers
>   serial: 8250_fsl: Use port lock wrappers
>   serial: 8250_mtk: Use port lock wrappers
>   serial: 8250_omap: Use port lock wrappers
>   serial: 8250_pci1xxxx: Use port lock wrappers
>   serial: altera_jtaguart: Use port lock wrappers
>   serial: altera_uart: Use port lock wrappers
>   serial: amba-pl010: Use port lock wrappers
>   serial: amba-pl011: Use port lock wrappers
>   serial: apb: Use port lock wrappers
>   serial: ar933x: Use port lock wrappers
>   serial: arc_uart: Use port lock wrappers
>   serial: atmel: Use port lock wrappers
>   serial: bcm63xx-uart: Use port lock wrappers
>   serial: cpm_uart: Use port lock wrappers
>   serial: digicolor: Use port lock wrappers
>   serial: dz: Use port lock wrappers
>   serial: linflexuart: Use port lock wrappers
>   serial: fsl_lpuart: Use port lock wrappers
>   serial: icom: Use port lock wrappers
>   serial: imx: Use port lock wrappers
>   serial: ip22zilog: Use port lock wrappers
>   serial: jsm: Use port lock wrappers
>   serial: liteuart: Use port lock wrappers
>   serial: lpc32xx_hs: Use port lock wrappers
>   serial: ma35d1: Use port lock wrappers
>   serial: mcf: Use port lock wrappers
>   serial: men_z135_uart: Use port lock wrappers
>   serial: meson: Use port lock wrappers
>   serial: milbeaut_usio: Use port lock wrappers
>   serial: mpc52xx: Use port lock wrappers
>   serial: mps2-uart: Use port lock wrappers
>   serial: msm: Use port lock wrappers
>   serial: mvebu-uart: Use port lock wrappers
>   serial: omap: Use port lock wrappers
>   serial: owl: Use port lock wrappers
>   serial: pch: Use port lock wrappers
>   serial: pic32: Use port lock wrappers
>   serial: pmac_zilog: Use port lock wrappers
>   serial: pxa: Use port lock wrappers
>   serial: qcom-geni: Use port lock wrappers
>   serial: rda: Use port lock wrappers
>   serial: rp2: Use port lock wrappers
>   serial: sa1100: Use port lock wrappers
>   serial: samsung_tty: Use port lock wrappers
>   serial: sb1250-duart: Use port lock wrappers
>   serial: sc16is7xx: Use port lock wrappers
>   serial: tegra: Use port lock wrappers
>   serial: core: Use port lock wrappers
>   serial: mctrl_gpio: Use port lock wrappers
>   serial: txx9: Use port lock wrappers
>   serial: sh-sci: Use port lock wrappers
>   serial: sifive: Use port lock wrappers
>   serial: sprd: Use port lock wrappers
>   serial: st-asc: Use port lock wrappers
>   serial: stm32: Use port lock wrappers
>   serial: sunhv: Use port lock wrappers
>   serial: sunplus-uart: Use port lock wrappers
>   serial: sunsab: Use port lock wrappers
>   serial: sunsu: Use port lock wrappers
>   serial: sunzilog: Use port lock wrappers
>   serial: timbuart: Use port lock wrappers
>   serial: uartlite: Use port lock wrappers
>   serial: ucc_uart: Use port lock wrappers
>   serial: vt8500: Use port lock wrappers
>   serial: xilinx_uartps: Use port lock wrappers
> 
>  drivers/tty/serial/21285.c                  |   8 +-
>  drivers/tty/serial/8250/8250_aspeed_vuart.c |   6 +-
>  drivers/tty/serial/8250/8250_bcm7271.c      |  28 +++---
>  drivers/tty/serial/8250/8250_core.c         |  12 +--
>  drivers/tty/serial/8250/8250_dma.c          |   8 +-
>  drivers/tty/serial/8250/8250_dw.c           |   8 +-
>  drivers/tty/serial/8250/8250_exar.c         |   4 +-
>  drivers/tty/serial/8250/8250_fsl.c          |   6 +-
>  drivers/tty/serial/8250/8250_mtk.c          |   8 +-
>  drivers/tty/serial/8250/8250_omap.c         |  52 +++++-----
>  drivers/tty/serial/8250/8250_pci1xxxx.c     |   8 +-
>  drivers/tty/serial/8250/8250_port.c         | 100 ++++++++++----------
>  drivers/tty/serial/altera_jtaguart.c        |  28 +++---
>  drivers/tty/serial/altera_uart.c            |  20 ++--
>  drivers/tty/serial/amba-pl010.c             |  20 ++--
>  drivers/tty/serial/amba-pl011.c             |  72 +++++++-------
>  drivers/tty/serial/apbuart.c                |   8 +-
>  drivers/tty/serial/ar933x_uart.c            |  26 ++---
>  drivers/tty/serial/arc_uart.c               |  16 ++--
>  drivers/tty/serial/atmel_serial.c           |  24 ++---
>  drivers/tty/serial/bcm63xx_uart.c           |  22 ++---
>  drivers/tty/serial/cpm_uart.c               |   8 +-
>  drivers/tty/serial/digicolor-usart.c        |  18 ++--
>  drivers/tty/serial/dz.c                     |  32 +++----
>  drivers/tty/serial/fsl_linflexuart.c        |  26 ++---
>  drivers/tty/serial/fsl_lpuart.c             |  88 ++++++++---------
>  drivers/tty/serial/icom.c                   |  26 ++---
>  drivers/tty/serial/imx.c                    |  84 ++++++++--------
>  drivers/tty/serial/ip22zilog.c              |  36 +++----
>  drivers/tty/serial/jsm/jsm_neo.c            |   4 +-
>  drivers/tty/serial/jsm/jsm_tty.c            |  16 ++--
>  drivers/tty/serial/liteuart.c               |  20 ++--
>  drivers/tty/serial/lpc32xx_hs.c             |  26 ++---
>  drivers/tty/serial/ma35d1_serial.c          |  22 ++---
>  drivers/tty/serial/mcf.c                    |  20 ++--
>  drivers/tty/serial/men_z135_uart.c          |   8 +-
>  drivers/tty/serial/meson_uart.c             |  30 +++---
>  drivers/tty/serial/milbeaut_usio.c          |  16 ++--
>  drivers/tty/serial/mpc52xx_uart.c           |  12 +--
>  drivers/tty/serial/mps2-uart.c              |  16 ++--
>  drivers/tty/serial/msm_serial.c             |  38 ++++----
>  drivers/tty/serial/mvebu-uart.c             |  18 ++--
>  drivers/tty/serial/omap-serial.c            |  38 ++++----
>  drivers/tty/serial/owl-uart.c               |  26 ++---
>  drivers/tty/serial/pch_uart.c               |  10 +-
>  drivers/tty/serial/pic32_uart.c             |  20 ++--
>  drivers/tty/serial/pmac_zilog.c             |  52 +++++-----
>  drivers/tty/serial/pxa.c                    |  30 +++---
>  drivers/tty/serial/qcom_geni_serial.c       |   8 +-
>  drivers/tty/serial/rda-uart.c               |  34 +++----
>  drivers/tty/serial/rp2.c                    |  20 ++--
>  drivers/tty/serial/sa1100.c                 |  20 ++--
>  drivers/tty/serial/samsung_tty.c            |  50 +++++-----
>  drivers/tty/serial/sb1250-duart.c           |  12 +--
>  drivers/tty/serial/sc16is7xx.c              |  40 ++++----
>  drivers/tty/serial/serial-tegra.c           |  32 +++----
>  drivers/tty/serial/serial_core.c            |  88 ++++++++---------
>  drivers/tty/serial/serial_mctrl_gpio.c      |   4 +-
>  drivers/tty/serial/serial_port.c            |   4 +-
>  drivers/tty/serial/serial_txx9.c            |  26 ++---
>  drivers/tty/serial/sh-sci.c                 |  68 ++++++-------
>  drivers/tty/serial/sifive.c                 |  16 ++--
>  drivers/tty/serial/sprd_serial.c            |  30 +++---
>  drivers/tty/serial/st-asc.c                 |  18 ++--
>  drivers/tty/serial/stm32-usart.c            |  38 ++++----
>  drivers/tty/serial/sunhv.c                  |  28 +++---
>  drivers/tty/serial/sunplus-uart.c           |  26 ++---
>  drivers/tty/serial/sunsab.c                 |  34 +++----
>  drivers/tty/serial/sunsu.c                  |  46 ++++-----
>  drivers/tty/serial/sunzilog.c               |  42 ++++----
>  drivers/tty/serial/timbuart.c               |   8 +-
>  drivers/tty/serial/uartlite.c               |  18 ++--
>  drivers/tty/serial/ucc_uart.c               |   4 +-
>  drivers/tty/serial/vt8500_serial.c          |   8 +-
>  drivers/tty/serial/xilinx_uartps.c          |  56 +++++------
>  include/linux/serial_core.h                 |  91 ++++++++++++++++--
>  76 files changed, 1086 insertions(+), 1007 deletions(-)
> 
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> 
