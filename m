Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49133218A3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 16:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgGHOhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 10:37:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19731 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729468AbgGHOhN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 10:37:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594219032; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Pw6tUhexBfSFv2rYAm2nU7F5ac3PX7NhxNfb4wo8wpY=; b=mf8bJbEBuIjt8dVO4tJel99hAGO97HFxPYvOtuBZOL24x8o9UWtP6p528+CyltNQ2bXb7mrl
 6SJ6HDSBNs10zgrG5PtMPg+2jbllLfF/9egTB5zVrXtYjQif76hu1gJ852DyzdtEC9i+zyOb
 nl06uwxqi/HuIwhMU3t2PHPQm1o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f05da0d6e56afc68d614fd1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 14:37:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C92BBC433C6; Wed,  8 Jul 2020 14:37:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.8] (unknown [106.213.144.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: msavaliy)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75452C433C8;
        Wed,  8 Jul 2020 14:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75452C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=msavaliy@codeaurora.org
Subject: Re: [PATCH V6] serial: msm_geni_serial_console : Add Earlycon support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, saravanak@google.com,
        sspatil@google.com, tkjos@google.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1592820512-1225-1-git-send-email-akashast@codeaurora.org>
 <20200623194936.GE128451@builder.lan>
From:   "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Message-ID: <c2752c91-b203-4224-9ddf-1e5a03b6488b@codeaurora.org>
Date:   Wed, 8 Jul 2020 20:06:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200623194936.GE128451@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/24/2020 1:19 AM, Bjorn Andersson wrote:
> On Mon 22 Jun 03:08 PDT 2020, Akash Asthana wrote:
>
>> From: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
>>
>> This change enables earlyconsole support as static driver for geni
>> based UART. Kernel space UART console driver will be generic for
>> console and other usecases of UART.
>>
> Is this hardware different from the qcom,geni-debug-uart which we
> already have EARLYCON support for?
>
> Why is this a separate driver?

The Hardware is same, but for the Generic kernel image we are using 
downstream driver which can't be a static compiled driver.

The same driver file has  1.earlyconsole, 2.kernel console and 3.HSUART 
driver parts.

To make Generic image, 2 and 3 are internal downstream driver and 1st 
one i am trying to get upstreamed, so that can be pulled into the ACK.

The one with the qcom,genu-debug-uart is not being used for our products.

Please let us know if you have further queries OR any other suggestion.

>
> Regards,
> Bjorn
>
>> Signed-off-by: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes In V2:
>>   - Fixed Makefile Typo issue.
>>
>> Changes In V3:
>>   - Removed mb() calls as *_relaxed() should take care.
>>
>> Changes In V4:
>>   - Minor change: space between offset and base addition.
>>
>> Changes In V5:
>>   - Removed unlikely() macro.
>>   - root_freq() array taken as static.
>>   - Removed extra readback of the register having no meaning.
>>
>> Changes in V6:
>>   - Drop SERIAL_MSM_GENI_HALF_SAMPLING config and support only
>>     QUP HW ver > 2.5. As of now no device with QUP ver < 2.5 is using this
>>     code for earlycon so it won't break them. I will post separate patch to
>>     resolve this limitation.
>>
>> Sending patch on behalf of Mukesh Savaliya.
>>
>>   drivers/tty/serial/Kconfig                   |   7 +
>>   drivers/tty/serial/Makefile                  |   1 +
>>   drivers/tty/serial/msm_geni_serial_console.c | 480 +++++++++++++++++++++++++++
>>   3 files changed, 488 insertions(+)
>>   create mode 100644 drivers/tty/serial/msm_geni_serial_console.c
>>
>> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
>> index 780908d..47caaa6 100644
>> --- a/drivers/tty/serial/Kconfig
>> +++ b/drivers/tty/serial/Kconfig
>> @@ -956,6 +956,13 @@ config SERIAL_MSM_CONSOLE
>>   	select SERIAL_CORE_CONSOLE
>>   	select SERIAL_EARLYCON
>>   
>> +config SERIAL_MSM_GENI_EARLY_CONSOLE
>> +	bool "MSM on-chip GENI HW based early console support"
>> +	select SERIAL_MSM_GENI_HALF_SAMPLING
>> +	help
>> +	  Serial early console driver for Qualcomm Technologies Inc's GENI
>> +	  based QUP hardware.
>> +
>>   config SERIAL_QCOM_GENI
>>   	tristate "QCOM on-chip GENI based serial port support"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
>> index d056ee6..7b6422e 100644
>> --- a/drivers/tty/serial/Makefile
>> +++ b/drivers/tty/serial/Makefile
>> @@ -55,6 +55,7 @@ obj-$(CONFIG_SERIAL_VR41XX) += vr41xx_siu.o
>>   obj-$(CONFIG_SERIAL_ATMEL) += atmel_serial.o
>>   obj-$(CONFIG_SERIAL_UARTLITE) += uartlite.o
>>   obj-$(CONFIG_SERIAL_MSM) += msm_serial.o
>> +obj-$(CONFIG_SERIAL_MSM_GENI_EARLY_CONSOLE) += msm_geni_serial_console.o
>>   obj-$(CONFIG_SERIAL_QCOM_GENI) += qcom_geni_serial.o
>>   obj-$(CONFIG_SERIAL_OMAP) += omap-serial.o
>>   obj-$(CONFIG_SERIAL_ALTERA_UART) += altera_uart.o
>> diff --git a/drivers/tty/serial/msm_geni_serial_console.c b/drivers/tty/serial/msm_geni_serial_console.c
>> new file mode 100644
>> index 0000000..80a7231
>> --- /dev/null
>> +++ b/drivers/tty/serial/msm_geni_serial_console.c
>> @@ -0,0 +1,480 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
>> +#include <linux/console.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/serial_core.h>
>> +
>> +#define SE_UART_TX_TRANS_CFG		(0x25C)
>> +#define SE_UART_TX_WORD_LEN		(0x268)
>> +#define SE_UART_TX_STOP_BIT_LEN		(0x26C)
>> +#define SE_UART_TX_TRANS_LEN		(0x270)
>> +#define SE_UART_TX_PARITY_CFG		(0x2A4)
>> +/* SE_UART_TRANS_CFG */
>> +#define UART_CTS_MASK		(BIT(1))
>> +/* UART M_CMD OP codes */
>> +#define UART_START_TX		(0x1)
>> +
>> +#define UART_OVERSAMPLING	(32)
>> +#define DEF_FIFO_DEPTH_WORDS	(16)
>> +#define DEF_TX_WM		(2)
>> +#define DEF_FIFO_WIDTH_BITS	(32)
>> +
>> +#define GENI_FORCE_DEFAULT_REG		(0x20)
>> +#define GENI_OUTPUT_CTRL		(0x24)
>> +#define GENI_CGC_CTRL			(0x28)
>> +#define GENI_SER_M_CLK_CFG		(0x48)
>> +#define GENI_FW_REVISION_RO		(0x68)
>> +
>> +#define SE_GENI_TX_PACKING_CFG0		(0x260)
>> +#define SE_GENI_TX_PACKING_CFG1		(0x264)
>> +#define SE_GENI_M_CMD0			(0x600)
>> +#define SE_GENI_M_CMD_CTRL_REG		(0x604)
>> +#define SE_GENI_M_IRQ_STATUS		(0x610)
>> +#define SE_GENI_M_IRQ_EN		(0x614)
>> +#define SE_GENI_M_IRQ_CLEAR		(0x618)
>> +#define SE_GENI_TX_FIFOn		(0x700)
>> +#define SE_GENI_TX_WATERMARK_REG	(0x80C)
>> +
>> +#define SE_IRQ_EN			(0xE1C)
>> +#define SE_HW_PARAM_0			(0xE24)
>> +#define SE_HW_PARAM_1			(0xE28)
>> +
>> +/* GENI_OUTPUT_CTRL fields */
>> +#define DEFAULT_IO_OUTPUT_CTRL_MSK	(GENMASK(6, 0))
>> +
>> +/* GENI_FORCE_DEFAULT_REG fields */
>> +#define FORCE_DEFAULT	(BIT(0))
>> +
>> +/* GENI_CGC_CTRL fields */
>> +#define CFG_AHB_CLK_CGC_ON		(BIT(0))
>> +#define CFG_AHB_WR_ACLK_CGC_ON		(BIT(1))
>> +#define DATA_AHB_CLK_CGC_ON		(BIT(2))
>> +#define SCLK_CGC_ON			(BIT(3))
>> +#define TX_CLK_CGC_ON			(BIT(4))
>> +#define RX_CLK_CGC_ON			(BIT(5))
>> +#define EXT_CLK_CGC_ON			(BIT(6))
>> +#define PROG_RAM_HCLK_OFF		(BIT(8))
>> +#define PROG_RAM_SCLK_OFF		(BIT(9))
>> +#define DEFAULT_CGC_EN			(GENMASK(6, 0))
>> +
>> +/* GENI_STATUS fields */
>> +#define M_GENI_CMD_ACTIVE		(BIT(0))
>> +
>> +/* GENI_SER_M_CLK_CFG/GENI_SER_S_CLK_CFG */
>> +#define SER_CLK_EN			(BIT(0))
>> +#define CLK_DIV_MSK			(GENMASK(15, 4))
>> +#define CLK_DIV_SHFT			(4)
>> +
>> +/* CLK_CTRL_RO fields */
>> +
>> +/* FIFO_IF_DISABLE_RO fields */
>> +#define FIFO_IF_DISABLE			(BIT(0))
>> +
>> +/* FW_REVISION_RO fields */
>> +#define FW_REV_PROTOCOL_MSK	(GENMASK(15, 8))
>> +#define FW_REV_PROTOCOL_SHFT	(8)
>> +#define FW_REV_VERSION_MSK	(GENMASK(7, 0))
>> +
>> +/* GENI_CLK_SEL fields */
>> +#define CLK_SEL_MSK		(GENMASK(2, 0))
>> +
>> +/* SE_GENI_DMA_MODE_EN */
>> +#define GENI_DMA_MODE_EN	(BIT(0))
>> +
>> +/* GENI_M_CMD0 fields */
>> +#define M_OPCODE_MSK		(GENMASK(31, 27))
>> +#define M_OPCODE_SHFT		(27)
>> +#define M_PARAMS_MSK		(GENMASK(26, 0))
>> +
>> +/* GENI_M_CMD_CTRL_REG */
>> +#define M_GENI_CMD_CANCEL	BIT(2)
>> +#define M_GENI_CMD_ABORT	BIT(1)
>> +#define M_GENI_DISABLE		BIT(0)
>> +
>> +/* GENI_M_IRQ_EN fields */
>> +#define M_CMD_DONE_EN		(BIT(0))
>> +#define M_CMD_OVERRUN_EN	(BIT(1))
>> +#define M_ILLEGAL_CMD_EN	(BIT(2))
>> +#define M_CMD_FAILURE_EN	(BIT(3))
>> +#define M_CMD_CANCEL_EN		(BIT(4))
>> +#define M_CMD_ABORT_EN		(BIT(5))
>> +#define M_TIMESTAMP_EN		(BIT(6))
>> +#define M_GP_SYNC_IRQ_0_EN	(BIT(8))
>> +#define M_IO_DATA_DEASSERT_EN	(BIT(22))
>> +#define M_IO_DATA_ASSERT_EN	(BIT(23))
>> +#define M_TX_FIFO_RD_ERR_EN	(BIT(28))
>> +#define M_TX_FIFO_WR_ERR_EN	(BIT(29))
>> +#define M_TX_FIFO_WATERMARK_EN	(BIT(30))
>> +#define M_SEC_IRQ_EN		(BIT(31))
>> +#define M_COMMON_GENI_M_IRQ_EN	(GENMASK(6, 1) | \
>> +				M_IO_DATA_DEASSERT_EN | \
>> +				M_IO_DATA_ASSERT_EN | M_TX_FIFO_RD_ERR_EN | \
>> +				M_TX_FIFO_WR_ERR_EN)
>> +
>> +
>> +/* GENI_TX_FIFO_STATUS fields */
>> +#define TX_FIFO_WC		(GENMASK(27, 0))
>> +
>> +/* SE_IRQ_EN fields */
>> +#define GENI_M_IRQ_EN		(BIT(2))
>> +
>> +#define UART_PROTOCOL	2
>> +#define GET_DEV_PORT(uport) \
>> +		container_of(uport, struct msm_geni_serial_earlycon_port, uport)
>> +
>> +
>> +static int get_se_proto_earlycon(void __iomem *base)
>> +{
>> +	int proto;
>> +
>> +	proto = ((readl_relaxed(base + GENI_FW_REVISION_RO)
>> +			& FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT);
>> +	return proto;
>> +}
>> +
>> +static void se_get_packing_config_earlycon(int bpw, int pack_words,
>> +	bool msb_to_lsb, unsigned long *cfg0, unsigned long *cfg1)
>> +{
>> +	u32 cfg[4] = {0};
>> +	int len, i;
>> +	int temp_bpw = bpw;
>> +	int idx_start = (msb_to_lsb ? (bpw - 1) : 0);
>> +	int idx_delta = (msb_to_lsb ? -BITS_PER_BYTE : BITS_PER_BYTE);
>> +	int ceil_bpw = ((bpw & (BITS_PER_BYTE - 1)) ?
>> +			((bpw & ~(BITS_PER_BYTE - 1)) + BITS_PER_BYTE) : bpw);
>> +	int iter = (ceil_bpw * pack_words) >> 3;
>> +	int idx = idx_start;
>> +
>> +	if (iter <= 0 || iter > 4) {
>> +		*cfg0 = 0;
>> +		*cfg1 = 0;
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < iter; i++) {
>> +		len = (temp_bpw < BITS_PER_BYTE) ?
>> +				(temp_bpw - 1) : BITS_PER_BYTE - 1;
>> +		cfg[i] = ((idx << 5) | (msb_to_lsb << 4) | (len << 1));
>> +		idx = ((temp_bpw - BITS_PER_BYTE) <= 0) ?
>> +				((i + 1) * BITS_PER_BYTE) + idx_start :
>> +				idx + idx_delta;
>> +		temp_bpw = ((temp_bpw - BITS_PER_BYTE) <= 0) ?
>> +				bpw : (temp_bpw - BITS_PER_BYTE);
>> +	}
>> +	cfg[iter - 1] |= 1;
>> +	*cfg0 = cfg[0] | (cfg[1] << 10);
>> +	*cfg1 = cfg[2] | (cfg[3] << 10);
>> +}
>> +
>> +static void se_geni_irq_en_earlycon(void __iomem *base)
>> +{
>> +	unsigned int common_geni_m_irq_en;
>> +
>> +	common_geni_m_irq_en = readl_relaxed(base + SE_GENI_M_IRQ_EN);
>> +	common_geni_m_irq_en |= M_COMMON_GENI_M_IRQ_EN;
>> +	writel_relaxed(common_geni_m_irq_en, base + SE_GENI_M_IRQ_EN);
>> +}
>> +
>> +static void se_io_set_mode_earlycon(void __iomem *base)
>> +{
>> +	unsigned int io_mode;
>> +
>> +	io_mode = readl_relaxed(base + SE_IRQ_EN);
>> +	io_mode |= (GENI_M_IRQ_EN);
>> +	writel_relaxed(io_mode, base + SE_IRQ_EN);
>> +}
>> +
>> +static void se_io_init_earlycon(void __iomem *base)
>> +{
>> +	unsigned int io_op_ctrl;
>> +	unsigned int geni_cgc_ctrl;
>> +
>> +	geni_cgc_ctrl = readl_relaxed(base + GENI_CGC_CTRL);
>> +	geni_cgc_ctrl |= DEFAULT_CGC_EN;
>> +	io_op_ctrl = DEFAULT_IO_OUTPUT_CTRL_MSK;
>> +	writel_relaxed(geni_cgc_ctrl, base + GENI_CGC_CTRL);
>> +
>> +	writel_relaxed(io_op_ctrl, base + GENI_OUTPUT_CTRL);
>> +	writel_relaxed(FORCE_DEFAULT, base + GENI_FORCE_DEFAULT_REG);
>> +}
>> +
>> +static void geni_se_select_fifo_mode_earlycon(void __iomem *base)
>> +{
>> +	unsigned int common_geni_m_irq_en;
>> +
>> +	writel_relaxed(0xFFFFFFFF, base + SE_GENI_M_IRQ_CLEAR);
>> +	writel_relaxed(0xFFFFFFFF, base + SE_IRQ_EN);
>> +
>> +	common_geni_m_irq_en = readl_relaxed(base + SE_GENI_M_IRQ_EN);
>> +	writel_relaxed(common_geni_m_irq_en, base + SE_GENI_M_IRQ_EN);
>> +}
>> +
>> +struct msm_geni_serial_earlycon_port {
>> +	struct uart_port uport;
>> +	unsigned int tx_fifo_depth;
>> +	unsigned int tx_fifo_width;
>> +	unsigned int tx_wm;
>> +	unsigned int xmit_size;
>> +	unsigned int cur_baud;
>> +};
>> +
>> +static int get_clk_cfg(unsigned long clk_freq, unsigned long *ser_clk)
>> +{
>> +	static unsigned long root_freq[] = {7372800, 14745600, 19200000,
>> +		29491200, 32000000, 48000000, 64000000, 80000000, 96000000,
>> +		 100000000, 102400000, 112000000, 120000000, 128000000};
>> +	int i;
>> +	int match = -1;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(root_freq); i++) {
>> +		if (clk_freq > root_freq[i])
>> +			continue;
>> +
>> +		if (!(root_freq[i] % clk_freq)) {
>> +			match = i;
>> +			break;
>> +		}
>> +	}
>> +	if (match != -1)
>> +		*ser_clk = root_freq[match];
>> +
>> +	return match;
>> +}
>> +
>> +
>> +static int get_clk_div_rate(unsigned int baud, unsigned long *desired_clk_rate)
>> +{
>> +	unsigned long ser_clk;
>> +	int dfs_index;
>> +	int clk_div = 0;
>> +
>> +	*desired_clk_rate = baud * UART_OVERSAMPLING;
>> +	dfs_index = get_clk_cfg(*desired_clk_rate, &ser_clk);
>> +	if (dfs_index < 0) {
>> +		clk_div = -EINVAL;
>> +		goto exit_get_clk_div_rate;
>> +	}
>> +
>> +	clk_div = ser_clk / *desired_clk_rate;
>> +	*desired_clk_rate = ser_clk;
>> +exit_get_clk_div_rate:
>> +	return clk_div;
>> +}
>> +
>> +
>> +static void msm_geni_serial_wr_char(struct uart_port *uport, int ch)
>> +{
>> +	writel_relaxed(ch, uport->membase + SE_GENI_TX_FIFOn);
>> +}
>> +
>> +static int msm_geni_serial_poll_bit(struct uart_port *uport,
>> +					int offset, int bit_field, bool set)
>> +{
>> +	int iter = 0;
>> +	bool met = false, cond = false;
>> +	unsigned int reg, baud = 115200, total_iter = 1000;
>> +	unsigned int fifo_bits = DEF_FIFO_DEPTH_WORDS * DEF_FIFO_WIDTH_BITS;
>> +	struct msm_geni_serial_earlycon_port *port = NULL;
>> +
>> +	if (uport->private_data && !uart_console(uport)) {
>> +		port = GET_DEV_PORT(uport);
>> +		baud = (port->cur_baud ? port->cur_baud : 115200);
>> +		fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
>> +		/*
>> +		 * Total polling iterations based on FIFO worth of bytes to be
>> +		 * sent at current baud. Add a little fluff to the wait.
>> +		 */
>> +		total_iter = ((fifo_bits * USEC_PER_SEC) / baud) / 10;
>> +		total_iter += 50;
>> +	}
>> +
>> +	while (iter < total_iter) {
>> +		reg = readl_relaxed(uport->membase + offset);
>> +		cond = reg & bit_field;
>> +		if (cond == set) {
>> +			met = true;
>> +			break;
>> +		}
>> +		udelay(10);
>> +		iter++;
>> +	}
>> +	return met;
>> +}
>> +
>> +static void msm_geni_serial_poll_cancel_tx(struct uart_port *uport)
>> +{
>> +	int done = 0;
>> +	unsigned int irq_clear = M_CMD_DONE_EN;
>> +
>> +	done = msm_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +						M_CMD_DONE_EN, true);
>> +	if (!done) {
>> +		writel_relaxed(M_GENI_CMD_ABORT,
>> +				uport->membase + SE_GENI_M_CMD_CTRL_REG);
>> +		irq_clear |= M_CMD_ABORT_EN;
>> +		msm_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +							M_CMD_ABORT_EN, true);
>> +	}
>> +	writel_relaxed(irq_clear, uport->membase + SE_GENI_M_IRQ_CLEAR);
>> +}
>> +
>> +static void msm_geni_serial_setup_tx(struct uart_port *uport,
>> +				unsigned int xmit_size)
>> +{
>> +	u32 m_cmd = 0;
>> +
>> +	writel_relaxed(xmit_size, uport->membase + SE_UART_TX_TRANS_LEN);
>> +	m_cmd |= (UART_START_TX << M_OPCODE_SHFT);
>> +	writel_relaxed(m_cmd, uport->membase + SE_GENI_M_CMD0);
>> +}
>> +
>> +
>> +static void
>> +__msm_geni_serial_console_write(struct uart_port *uport, const char *s,
>> +				unsigned int count)
>> +{
>> +	int new_line = 0;
>> +	int i;
>> +	int bytes_to_send = count;
>> +	int fifo_depth = DEF_FIFO_DEPTH_WORDS;
>> +	int tx_wm = DEF_TX_WM;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		if (s[i] == '\n')
>> +			new_line++;
>> +	}
>> +
>> +	bytes_to_send += new_line;
>> +	writel_relaxed(tx_wm, uport->membase + SE_GENI_TX_WATERMARK_REG);
>> +	msm_geni_serial_setup_tx(uport, bytes_to_send);
>> +	i = 0;
>> +	while (i < count) {
>> +		u32 chars_to_write = 0;
>> +		u32 avail_fifo_bytes = (fifo_depth - tx_wm);
>> +		/*
>> +		 * If the WM bit never set, then the Tx state machine is not
>> +		 * in a valid state, so break, cancel/abort any existing
>> +		 * command. Unfortunately the current data being written is
>> +		 * lost.
>> +		 */
>> +		while (!msm_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +						M_TX_FIFO_WATERMARK_EN, true))
>> +			break;
>> +		chars_to_write = min((unsigned int)(count - i),
>> +							avail_fifo_bytes);
>> +		if ((chars_to_write << 1) > avail_fifo_bytes)
>> +			chars_to_write = (avail_fifo_bytes >> 1);
>> +		uart_console_write(uport, (s + i), chars_to_write,
>> +					msm_geni_serial_wr_char);
>> +		writel_relaxed(M_TX_FIFO_WATERMARK_EN,
>> +			uport->membase + SE_GENI_M_IRQ_CLEAR);
>> +		i += chars_to_write;
>> +	}
>> +	msm_geni_serial_poll_cancel_tx(uport);
>> +}
>> +
>> +
>> +static void
>> +msm_geni_serial_early_console_write(struct console *con, const char *s,
>> +			unsigned int n)
>> +{
>> +	struct earlycon_device *dev = con->data;
>> +
>> +	__msm_geni_serial_console_write(&dev->port, s, n);
>> +}
>> +
>> +static int __init
>> +msm_geni_serial_earlycon_setup(struct earlycon_device *dev,
>> +		const char *opt)
>> +{
>> +	struct uart_port *uport = &dev->port;
>> +	int ret = 0;
>> +	u32 tx_trans_cfg = 0;
>> +	u32 tx_parity_cfg = 0;
>> +	u32 rx_trans_cfg = 0;
>> +	u32 rx_parity_cfg = 0;
>> +	u32 stop_bit = 0;
>> +	u32 rx_stale = 0;
>> +	u32 bits_per_char = 0;
>> +	u32 s_clk_cfg = 0;
>> +	u32 baud = 115200;
>> +	int clk_div;
>> +	unsigned long clk_rate;
>> +	unsigned long cfg0, cfg1;
>> +
>> +	if (!uport->membase) {
>> +		ret = -ENOMEM;
>> +		goto exit_geni_serial_earlyconsetup;
>> +	}
>> +
>> +	if (get_se_proto_earlycon(uport->membase) != UART_PROTOCOL) {
>> +		ret = -ENXIO;
>> +		goto exit_geni_serial_earlyconsetup;
>> +	}
>> +
>> +	/*
>> +	 * Ignore Flow control.
>> +	 * Disable Tx Parity.
>> +	 * Don't check Parity during Rx.
>> +	 * Disable Rx Parity.
>> +	 * n = 8.
>> +	 * Stop bit = 0.
>> +	 * Stale timeout in bit-time (3 chars worth).
>> +	 */
>> +	tx_trans_cfg |= UART_CTS_MASK;
>> +	tx_parity_cfg = 0;
>> +	rx_trans_cfg = 0;
>> +	rx_parity_cfg = 0;
>> +	bits_per_char = 0x8;
>> +	stop_bit = 0;
>> +	rx_stale = 0x18;
>> +	clk_div = get_clk_div_rate(baud, &clk_rate);
>> +	if (clk_div <= 0) {
>> +		ret = -EINVAL;
>> +		goto exit_geni_serial_earlyconsetup;
>> +	}
>> +	/* QUP HW ver > 2.5 needs 16 clock pulses to sample
>> +	 * 1 bit of data, instead of 32 clock pulses in older
>> +	 * QUP HW.
>> +	 * For now, support only QUP HW ver > 2.5. So reduce the
>> +	 * clk frequency to half by doubling the divider value.
>> +	 */
>> +	clk_div *= 2;
>> +
>> +	s_clk_cfg |= SER_CLK_EN;
>> +	s_clk_cfg |= (clk_div << CLK_DIV_SHFT);
>> +
>> +	/*
>> +	 * Make an unconditional cancel on the main sequencer to reset
>> +	 * it else we could end up in data loss scenarios.
>> +	 */
>> +	writel_relaxed(0x21, uport->membase + GENI_SER_M_CLK_CFG);
>> +	readl_relaxed(uport->membase + GENI_SER_M_CLK_CFG);
>> +
>> +	msm_geni_serial_poll_cancel_tx(uport);
>> +
>> +	se_get_packing_config_earlycon(8, 1, false, &cfg0, &cfg1);
>> +
>> +	se_io_init_earlycon(uport->membase);
>> +	se_io_set_mode_earlycon(uport->membase);
>> +	se_geni_irq_en_earlycon(uport->membase);
>> +
>> +	geni_se_select_fifo_mode_earlycon(uport->membase);
>> +	writel_relaxed(cfg0, uport->membase + SE_GENI_TX_PACKING_CFG0);
>> +	writel_relaxed(cfg1, uport->membase + SE_GENI_TX_PACKING_CFG1);
>> +	writel_relaxed(tx_trans_cfg, uport->membase + SE_UART_TX_TRANS_CFG);
>> +	writel_relaxed(tx_parity_cfg, uport->membase + SE_UART_TX_PARITY_CFG);
>> +	writel_relaxed(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
>> +	writel_relaxed(stop_bit, uport->membase + SE_UART_TX_STOP_BIT_LEN);
>> +	writel_relaxed(s_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
>> +
>> +	dev->con->write = msm_geni_serial_early_console_write;
>> +	dev->con->setup = NULL;
>> +exit_geni_serial_earlyconsetup:
>> +	return ret;
>> +}
>> +OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",
>> +		msm_geni_serial_earlycon_setup);
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
>>
