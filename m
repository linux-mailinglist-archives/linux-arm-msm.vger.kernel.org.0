Return-Path: <linux-arm-msm+bounces-63159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F302CAEF18B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E965D1BC698C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD24926A0CC;
	Tue,  1 Jul 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv3tfL4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73425C6EC;
	Tue,  1 Jul 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359429; cv=none; b=W8MOx5qSvBEDofTkppCUDIqg+BCiaNJX/s67CpnnNBXyA9f20jXX+s/boZ3YhZkkiNEFU5pULUvHt0B4drM4/A6n/+QPLcFIYL6ZJaK7ObbMS/zABGqj2Yvf1IQtRoSsA2JGY7GHrfrtw6dfaeMSA+7/9TsrGTAYSWx28GSkE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359429; c=relaxed/simple;
	bh=WKKFVHyIx5FGyF/mzkbcJtuBZwMQR088gYLS51RgvbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKh2LQPZC7ciFpxuovT1spimHuk0vN3bAtOCOeaOfgS59kZvFraoyQxExzbCTZCK4g9hEU5id7cxyzwQ5PZUn7LVfy92zkbKXjonuAsUAvNul+S5KoxhJM9RwvQEKsbwVM5iuc5mD0sHEIf/1jR0tAiWks5wS9mvZR/b0qMDZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bv3tfL4d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF88C4CEEB;
	Tue,  1 Jul 2025 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751359429;
	bh=WKKFVHyIx5FGyF/mzkbcJtuBZwMQR088gYLS51RgvbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bv3tfL4d4+FCKNqLUUUwnm2WarDGmMoqMZaFdtwFu++KDbu892XV7WXfE7Mf6cFIt
	 KJ96JQHtIUtusx6KhbOzXgWf6CxFCL2tnAa/EQDujA0JDROaXTKbao1UZUR6K19RQT
	 dOEjKif5YH37jGnKu9CsO4EVADFIdcA4cPGfXRptBLZjJBN5l1xpMeHHX1zeuVJRh/
	 fZzOs25FCrCwwBSZhOW48JkuEDQXOMS80k+LrXXprqDeojaoF8vAu4sd61KHchOTsw
	 mcTriD4URbGgSzI5XreCOHeo7AcMXt/MS+/x4HB6DU5AQUxjc9jhodlMSY2L3+bH2M
	 tjo+G/PTTQjsw==
Message-ID: <010c05cf-66dc-4288-ba3f-81f8f4634525@kernel.org>
Date: Tue, 1 Jul 2025 10:43:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
 linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
 wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 09:18, Mukesh Kumar Savaliya wrote:
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>

where do you use it?


> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

where do you use it?


> +#include <linux/of_platform.h>

where do you use it?

> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/geni-se.h>
> +#include <linux/units.h>

where do you use it?

> +
> +#define SE_I3C_SCL_HIGH                 0x268
> +#define SE_I3C_TX_TRANS_LEN             0x26c
> +#define SE_I3C_RX_TRANS_LEN             0x270
> +#define SE_I3C_DELAY_COUNTER            0x274
> +#define SE_I2C_SCL_COUNTERS             0x278
> +#define SE_I3C_SCL_CYCLE                0x27c
> +#define SE_GENI_HW_IRQ_EN               0x920
> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
> +
> +/* HW I3C IBI interrupt enable */
> +#define M_IBI_IRQ_EN			BIT(0)
> +
> +/* M_IBI_IRQ_IGNORE */
> +#define M_IBI_IRQ_IGNORE		BIT(0)
> +
> +/* SE_GENI_M_CLK_CFG field shifts */
> +#define	CLK_DIV_VALUE_MASK		GENMASK(23, 4)
> +#define SER_CLK_EN			BIT(0)
> +
> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
> +#define M_IBI_IRQ_PARAM_7E		BIT(0)
> +#define M_IBI_IRQ_PARAM_STOP_STALL	BIT(1)
> +
> +/* SE_I2C_SCL_COUNTERS field shifts */
> +#define I2C_SCL_HIGH_COUNTER_MASK	GENMASK(29, 20)
> +#define I2C_SCL_LOW_COUNTER_MASK	GENMASK(19, 10)
> +#define I2C_SCL_CYCLE_COUNTER_MASK	GENMASK(9, 0)
> +
> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
> +	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
> +	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
> +
> +/* M_CMD OP codes for I2C/I3C */
> +#define I3C_READ_IBI_HW          0
> +#define I2C_WRITE                1
> +#define I2C_READ                 2
> +#define I2C_WRITE_READ           3
> +#define I2C_ADDR_ONLY            4
> +#define I3C_INBAND_RESET         5
> +#define I2C_BUS_CLEAR            6
> +#define I2C_STOP_ON_BUS          7
> +#define I3C_HDR_DDR_EXIT         8
> +#define I3C_PRIVATE_WRITE        9
> +#define I3C_PRIVATE_READ         10
> +#define I3C_HDR_DDR_WRITE        11
> +#define I3C_HDR_DDR_READ         12
> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
> +#define I3C_BCAST_CCC_ADDR_ONLY  14
> +#define I3C_READ_IBI             15
> +#define I3C_BCAST_CCC_WRITE      16
> +#define I3C_DIRECT_CCC_WRITE     17
> +#define I3C_DIRECT_CCC_READ      18
> +
> +/* M_CMD params for I3C */
> +#define PRE_CMD_DELAY		BIT(0)
> +#define TIMESTAMP_BEFORE	BIT(1)
> +#define STOP_STRETCH		BIT(2)
> +#define TIMESTAMP_AFTER		BIT(3)
> +#define POST_COMMAND_DELAY	BIT(4)
> +#define IGNORE_ADD_NACK		BIT(6)
> +#define READ_FINISHED_WITH_ACK	BIT(7)
> +#define CONTINUOUS_MODE_DAA	BIT(8)
> +
> +#define SLAVE_ADDR_MASK		GENMASK(15, 9)
> +
> +#define CCC_HDR_CMD_MSK		GENMASK(23, 16)
> +#define IBI_NACK_TBL_CTRL	BIT(24)
> +#define USE_7E			BIT(25)
> +#define BYPASS_ADDR_PHASE	BIT(26)
> +
> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
> +#define GP_IRQ0			BIT(5)
> +#define GP_IRQ1			BIT(6)
> +#define GP_IRQ2			BIT(7)
> +#define GP_IRQ3			BIT(8)
> +#define GP_IRQ4			BIT(9)
> +#define GP_IRQ5			BIT(10)
> +#define DM_I3C_CB_ERR		GENMASK(10, 5)
> +
> +#define I3C_AUTO_SUSPEND_DELAY	250
> +#define PACKING_BYTES_PER_WORD	4
> +#define XFER_TIMEOUT		250
> +#define DFS_INDEX_MAX		7
> +
> +#define I3C_ADDR_MASK		I2C_MAX_ADDR
> +
> +enum geni_i3c_err_code {
> +	RD_TERM,
> +	NACK,
> +	CRC_ERR,
> +	BUS_PROTO,
> +	NACK_7E,
> +	NACK_IBI,
> +	GENI_OVERRUN,
> +	GENI_ILLEGAL_CMD,
> +	GENI_ABORT_DONE,
> +	GENI_TIMEOUT,
> +};
> +
> +enum i3c_bus_phase {
> +	OPEN_DRAIN_MODE  = 0,
> +	PUSH_PULL_MODE   = 1
> +};
> +
> +struct geni_i3c_dev {
> +	struct geni_se se;
> +	unsigned int tx_wm;
> +	int irq;
> +	int err;
> +	struct i3c_master_controller ctrlr;
> +	struct completion done;
> +	/* Protects per device CCC command or transfer from get_mutex_lock()/unlock() wrapper */
> +	struct mutex lock;
> +	/* Per device protection between process and IRQ context */
> +	spinlock_t irq_lock;
> +	u32 clk_src_freq;
> +	u8 *cur_buf;
> +	bool cur_is_write;
> +	int cur_len;
> +	int cur_idx;
> +	DECLARE_BITMAP(newaddrslots, 64);
> +
> +	const struct geni_i3c_clk_settings *clk_cfg;
> +	const struct geni_i3c_clk_settings *clk_od_cfg;
> +};
> +
> +struct geni_i3c_i2c_dev_data {
> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */
> +};
> +
> +struct geni_i3c_xfer_params {
> +	enum geni_se_xfer_mode mode;
> +	u32 m_cmd;
> +	u32 m_param;
> +};
> +
> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
> +							*master)
> +{
> +	return container_of(master, struct geni_i3c_dev, ctrlr);
> +}
> +
> +struct geni_i3c_clk_settings {
> +	u32 clk_freq_out;
> +	u32 clk_src_freq;
> +	u8  clk_div;
> +	u8  i2c_t_high_cnt;
> +	u8  i2c_t_low_cnt;
> +	u8  i3c_t_high_cnt;
> +	u8  i3c_t_cycle_cnt;
> +	u8  i2c_t_cycle_cnt;
> +};
> +
> +/*
> + * The hardware uses the following formulas to calculate the time periods
> + * of the SCL clock cycle. The firmware adds a few extra cycles that are not
> + * included in the formulas below. It has been verified that the resulting
> + * timings remain within the I2C/I3C specification limits.
> + *
> + * I2C SCL high period:
> + *     i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
> + *
> + * I2C SCL low period:
> + *     i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
> + *
> + * I2C SCL full cycle:
> + *     i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
> + *
> + * I3C SCL high period:
> + *     i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
> + *
> + * I3C SCL full cycle:
> + *     i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
> + *
> + * Output clock frequency:
> + *     clk_freq_out = t / t_cycle
> + */
> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
> +	{
> +		.clk_freq_out = 100 * HZ_PER_KHZ,
> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
> +		.clk_div = 1,
> +		.i2c_t_high_cnt = 76,
> +		.i2c_t_low_cnt = 90,
> +		.i3c_t_high_cnt = 7,
> +		.i3c_t_cycle_cnt = 8,
> +		.i2c_t_cycle_cnt = 192,
> +	},
> +	{
> +		.clk_freq_out = 400 * HZ_PER_KHZ,
> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
> +		.clk_div = 1,
> +		.i2c_t_high_cnt = 12,
> +		.i2c_t_low_cnt = 24,
> +		.i3c_t_high_cnt = 7,
> +		.i3c_t_cycle_cnt = 8,
> +		.i2c_t_cycle_cnt = 48
> +	},
> +	{
> +		.clk_freq_out = 1000 * HZ_PER_KHZ,
> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
> +		.clk_div = 1,
> +		.i2c_t_high_cnt = 4,
> +		.i2c_t_low_cnt = 9,
> +		.i3c_t_high_cnt = 7,
> +		.i3c_t_cycle_cnt = 0,
> +		.i2c_t_cycle_cnt = 19
> +	},
> +	{
> +		.clk_freq_out = 12500 * HZ_PER_KHZ,
> +		.clk_src_freq = 100000 * HZ_PER_KHZ,
> +		.clk_div = 1,
> +		.i2c_t_high_cnt = 45,
> +		.i2c_t_low_cnt = 63,
> +		.i3c_t_high_cnt = 6,
> +		.i3c_t_cycle_cnt = 7,
> +		.i2c_t_cycle_cnt = 110
> +	}
> +};
> +
> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
> +{
> +	const struct geni_i3c_clk_settings *clk_idx = geni_i3c_clk_map;
> +	struct i3c_master_controller *m = &gi3c->ctrlr;
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_idx++) {
> +		if (clk_idx->clk_freq_out == bus->scl_rate.i3c &&
> +		    clk_idx->clk_src_freq == gi3c->clk_src_freq)
> +			gi3c->clk_cfg = clk_idx;
> +
> +		if (clk_idx->clk_freq_out == bus->scl_rate.i2c)
> +			gi3c->clk_od_cfg = clk_idx;
> +	}
> +
> +	if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static inline void set_new_addr_slot(unsigned long *addrslot, u8 addr)

Why do you mark functions inline? Drop, it's not recommended style.

> +{
> +	if (addr > I3C_ADDR_MASK)
> +		return;

This seems redundant. Why are you checking it every time here, but not
once in the loop where this is executed?

This is confusing - you got incorrect address in the place where this is
called ("if (new_device) {") but you do not handle incorrect address,
don't fail, don't unwind, don't handle the error. Instead this part
silently skips the issue but rest of code will work with that incorrect
address.



> +
> +	set_bit(addr, addrslot);> +}
> +
> +static inline void clear_new_addr_slot(unsigned long *addrslot, u8 addr)
> +{
> +	if (addr > I3C_ADDR_MASK)
> +		return;

And is_new_addr_slot_set() does not have the test? And how is this even
possible, aren't you looping till I3C_ADDR_MASK?

I understand why you wanted some abstractions, but this caused hiding
actual issues because you do not see big picture.
> +
> +	clear_bit(addr, addrslot);
> +}



...


> +
> +static const struct i3c_master_controller_ops geni_i3c_master_ops = {
> +	.bus_init = geni_i3c_master_bus_init,
> +	.bus_cleanup = NULL,
> +	.do_daa = geni_i3c_master_do_daa,
> +	.attach_i3c_dev = geni_i3c_master_attach_i3c_dev,
> +	.reattach_i3c_dev = NULL,
> +	.detach_i3c_dev = geni_i3c_master_detach_i3c_dev,
> +	.attach_i2c_dev = geni_i3c_master_attach_i2c_dev,
> +	.detach_i2c_dev = geni_i3c_master_detach_i2c_dev,
> +	.supports_ccc_cmd = geni_i3c_master_supports_ccc_cmd,
> +	.send_ccc_cmd = geni_i3c_master_send_ccc_cmd,
> +	.priv_xfers = geni_i3c_master_priv_xfers,
> +	.i2c_xfers = geni_i3c_master_i2c_xfers,
> +	.enable_ibi = NULL,
> +	.disable_ibi = NULL,
> +	.request_ibi = NULL,
> +	.free_ibi = NULL,
> +	.recycle_ibi_slot = NULL,
> +};
> +
> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(gi3c->se.base))
> +		return PTR_ERR(gi3c->se.base);
> +
> +	gi3c->se.clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(gi3c->se.clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
> +							"Unable to get serial engine core clock: %pe\n",

Messed alignment.

> +							gi3c->se.clk);
> +	ret = geni_icc_get(&gi3c->se, NULL);
> +	if (ret)
> +		return ret;
> +
Best regards,
Krzysztof

