Return-Path: <linux-arm-msm+bounces-54150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A9A8778F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0FE3ADCC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 05:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEC219DFA7;
	Mon, 14 Apr 2025 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U6Kudtpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACC97E9;
	Mon, 14 Apr 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744609937; cv=none; b=rWnN/ItOyuP0L+HogQJ+nvHri/ac7Uk82I2KfIuBgGuNgRRhxtn+zRQW1C5wz2Gou+cEhq28R/Yiw1HbABKD+NidunnAGQ9JLnJvQVS8nVAIJbII99M2E15WaxXraTg6nxoVUg163jyzZrQb4swP7xc2tWC1yGwVHacAthq/aXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744609937; c=relaxed/simple;
	bh=0HLw5evvLLLL09+ljNjFdTaRV2ag17pxvhr7tKQ+QJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XhqE6BUw5YsU+uLc0p2UmbUZP2AGlr2mrBlB2XlzUFOa7P0mzfFuoxU4GnUmbKQHnZ1BulWIHmhqR3oCbCwyO8Y/1TPKMN0QUQZcNpVFBpsoY0QX5QwXgeDYHj6zeV0MP1u0xR79hmYQNe4SI9qzXdpBebiuNm37AKsFkfZ8X28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U6Kudtpm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DLWZgx003451;
	Mon, 14 Apr 2025 05:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIK+KrGNsD7cR0tiZMxs+mjT9s4W1uDmtONyVvhCkZ0=; b=U6KudtpmoXG8DCCH
	3EB8YR3/E1L4ML0/SOUy5qDRGcbjuK91DPowxFWvxPZiQGiQiFT/b2rAJ/Cd4VoG
	RIwfVG9UTU338qQ95dy8ok/UpITlP07bw1QA9jFh9XkxpH0EVTG0zRjDjZDzVPDh
	FpO60GQFCbDZoJIHgMmOD5FLYCGLnA0LsOXcS6SH6D8gnGz9+CwYcxGZE175O0Xi
	ehBnGzrprMYDRtsvSOvy5r/1r3MVs/fkiOYH2o3VJdDEvxo2XUtnzLqKxUt+d1GF
	eGRxzXtyHDF9NTIQTATDAcE28KBVfukflGZYVewao1CATCbPi+4vCQesGRscg3b5
	YWR7PA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6bf9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 05:52:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E5q5mA008513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 05:52:05 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Apr
 2025 22:52:01 -0700
Message-ID: <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
Date: Mon, 14 Apr 2025 11:21:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9GocnMYW6rNp7pT5SVZvS5o63c07XWvL
X-Proofpoint-GUID: 9GocnMYW6rNp7pT5SVZvS5o63c07XWvL
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fca286 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=WHrP3EDNxcdy5OAKBrkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140040

Thanks Konrad for detailed review.


On 4/12/2025 4:45 AM, Konrad Dybcio wrote:
> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>> Add support for the Qualcomm I3C controller driver, which implements
>> I3C master functionality as defined in the MIPI Alliance Specification
>> for I3C, Version 1.0.
>>
>> This driver supports master role in SDR mode.
>>
>> Unlike some other I3C master controllers, this implementation
>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
> 
> [...]
> 
>> +#define SE_I3C_SCL_HIGH                 0x268
>> +#define SE_I3C_TX_TRANS_LEN             0x26C
>> +#define SE_I3C_RX_TRANS_LEN             0x270
>> +#define SE_I3C_DELAY_COUNTER            0x274
>> +#define SE_I2C_SCL_COUNTERS             0x278
>> +#define SE_I3C_SCL_CYCLE                0x27C
> 
> lowercase hex, please
sure, done.
> 
>> +#define SE_GENI_HW_IRQ_EN               0x920
>> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
>> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
>> +
>> +/* HW I3C IBI interrupt enable */
>> +#define M_IBI_IRQ_EN BIT(0)
>> +
>> +/* M_IBI_IRQ_IGNORE */
>> +#define M_IBI_IRQ_IGNORE BIT(0)
>> +
>> +/* SE_GENI_M_CLK_CFG field shifts */
>> +#define	CLK_DIV_VALUE_MASK	GENMASK(23, 4)
> 
> ' ' after "define", '\t' after
> 
Done. Also added equal tabs for all other macros too.
>> +#define SER_CLK_EN		BIT(0)
>> +
>> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
>> +#define M_IBI_IRQ_PARAM_7E BIT(0)
>> +#define M_IBI_IRQ_PARAM_STOP_STALL BIT(1)
>> +/* SE_I2C_SCL_COUNTERS field shifts */
>> +#define I2C_SCL_HIGH_COUNTER_MASK	GENMASK(29, 20)
>> +#define I2C_SCL_LOW_COUNTER_MASK	GENMASK(19, 10)
>> +#define I2C_SCL_CYCLE_COUNTER_MASK	GENMASK(9, 0)
>> +
>> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
>> +	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
>> +	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
>> +
>> +/* M_CMD OP codes for I2C/I3C */
>> +#define I3C_READ_IBI_HW          0
>> +#define I2C_WRITE                1
>> +#define I2C_READ                 2
>> +#define I2C_WRITE_READ           3
>> +#define I2C_ADDR_ONLY            4
>> +#define I3C_INBAND_RESET         5
>> +#define I2C_BUS_CLEAR            6
>> +#define I2C_STOP_ON_BUS          7
>> +#define I3C_HDR_DDR_EXIT         8
>> +#define I3C_PRIVATE_WRITE        9
>> +#define I3C_PRIVATE_READ         10
>> +#define I3C_HDR_DDR_WRITE        11
>> +#define I3C_HDR_DDR_READ         12
>> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
>> +#define I3C_BCAST_CCC_ADDR_ONLY  14
>> +#define I3C_READ_IBI             15
>> +#define I3C_BCAST_CCC_WRITE      16
>> +#define I3C_DIRECT_CCC_WRITE     17
>> +#define I3C_DIRECT_CCC_READ      18
>> +
>> +/* M_CMD params for I3C */
>> +#define PRE_CMD_DELAY          BIT(0)
>> +#define TIMESTAMP_BEFORE       BIT(1)
>> +#define STOP_STRETCH           BIT(2)
>> +#define TIMESTAMP_AFTER        BIT(3)
>> +#define POST_COMMAND_DELAY     BIT(4)
>> +#define IGNORE_ADD_NACK        BIT(6)
>> +#define READ_FINISHED_WITH_ACK BIT(7)
>> +#define CONTINUOUS_MODE_DAA    BIT(8)
>> +
>> +#define SLAVE_ADDR_MASK           GENMASK(15, 9)
>> +#define SLV_ADDR_SHFT          9
> 
> The shift is now unused
> 
Yes, Removed.
>> +
>> +#define CCC_HDR_CMD_MSK        GENMASK(23, 16)
>> +#define CCC_HDR_CMD_SHFT       16
> 
> And this one *should* be unused, fill in the value with FIELD_PREP instead
Yes, Done.
> 
>> +#define IBI_NACK_TBL_CTRL      BIT(24)
>> +#define USE_7E                 BIT(25)
>> +#define BYPASS_ADDR_PHASE      BIT(26)
>> +
>> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
>> +#define GP_IRQ0	BIT(5)
>> +#define GP_IRQ1	BIT(6)
>> +#define GP_IRQ2	BIT(7)
>> +#define GP_IRQ3	BIT(8)
>> +#define GP_IRQ4	BIT(9)
>> +#define GP_IRQ5	BIT(10)
>> +#define DM_I3C_CB_ERR   GENMASK(10, 5)
>> +
>> +#define I3C_AUTO_SUSPEND_DELAY  250
>> +#define KHZ(freq)               (1000 * (freq))
> 
> You can store the values in kHz and do (x * HZ_PER_KHZ) where they're
> used instead
> 
Sure, Done.

>> +#define PACKING_BYTES_PW        4
> 
> PW -> "PER_WORD", if that's what it means, please
Yes, changed to PACKING_BYTES_PER_WORD.
> 
>> +#define XFER_TIMEOUT            250
>> +#define DFS_INDEX_MAX           7
>> +
>> +#define I3C_ADDR_MASK 0x7f
> 
> This could go to some i3c common header, IIUC it's part of the spec
> 
Yes, let me use I2C_ADDR_MASK from i3c/master.h and Used same macro name 
to maintain I3C context here.
> [...]
> 
>> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
>> +							*master)
>> +{
>> +	return container_of(master, struct geni_i3c_dev, ctrlr);
>> +}
> 
> #define instead
> 
i see all i3c vendors are using same definitions, so for now can we keep 
it similar way if it's minor ?
>> +
>> +struct geni_i3c_clk_settings {
>> +	u32 clk_freq_out;
>> +	u32 clk_src_freq;
>> +	u8  clk_div;
>> +	u8  i2c_t_high_cnt;
>> +	u8  i2c_t_low_cnt;
>> +	u8  i3c_t_high_cnt;
>> +	u8  i3c_t_cycle_cnt;
>> +	u8  i2c_t_cycle_cnt;
>> +};
>> +
>> +/*
>> + * Hardware uses the underlying formula to calculate time periods of
>> + * SCL clock cycle. Firmware uses some additional cycles excluded from the
>> + * below formula and it is confirmed that the time periods are within
>> + * specification limits.
>> + *
>> + * time of high period of I2C SCL:
>> + *         i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
>> + * time of low period of I2C SCL:
>> + *         i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
>> + * time of full period of I2C SCL:
>> + *         i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
>> + * time of high period of I3C SCL:
>> + *         i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
>> + * time of full period of I3C SCL:
>> + *         i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
>> + * clk_freq_out = t / t_cycle
>> + */
>> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
>> +/* op-freq,  src-freq,  div,  i2c_high,  i2c_low, i3c_high, i3c_cyc i2c_cyc */
>> +	{ KHZ(100),    KHZ(19200), 1, 76, 90, 7, 8, 192},
>> +	{ KHZ(400),    KHZ(19200), 1, 12, 24, 7, 8, 48},
>> +	{ KHZ(1000),   KHZ(19200), 1,  4,  9, 7, 0, 19},
>> +	{ KHZ(12500), KHZ(100000), 1, 45, 63, 6, 7, 110},
> 
> It's gonna take up considerably more space, but you may want to write
> this using C99 designated initializers:
> 
> {
> 	.op_freq = ...,
> 	.src_freq = ...,
> }, {
> 	...
> }
> 
> etc.
Sure, changed accordingly.
> 
>> +};
>> +
>> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
>> +{
>> +	const struct geni_i3c_clk_settings *clk_idx = geni_i3c_clk_map;
>> +	struct i3c_master_controller *m = &gi3c->ctrlr;
>> +	struct i3c_bus *bus = i3c_master_get_bus(m);
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_idx++) {
>> +		if ((!bus || clk_idx->clk_freq_out == bus->scl_rate.i3c) &&
> 
> Move this nullcheck out of the loop, please.
> Or get rid of it, the master registration ensures that there's a bus bound
> to it, IIUC.
> 
Sure, makes sense! Removed it.

>> +		    clk_idx->clk_src_freq == gi3c->clk_src_freq) {
>> +			gi3c->clk_cfg = clk_idx;
>> +		}
>> +
>> +		if (clk_idx->clk_freq_out == bus->scl_rate.i2c)
>> +			gi3c->clk_od_cfg = clk_idx;
>> +	}
>> +
>> +	if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
>> +		return -EINVAL;
> 
> IIUC this makes the 100 kHz configuration invalid (index 0)
> 
Yes, for i3c, 100KHz is not possible. i2c can work but i3c can't.
>> +
>> +	return 0;
>> +}
>> +
>> +static void set_new_addr_slot(unsigned long *addrslot, u8 addr)
>> +{
>> +	if (addr > I3C_ADDR_MASK)
>> +		return;
>> +
>> +	set_bit(addr, addrslot);
>> +}
> 
> Inline this single-use function, please
> 
Done
>> +
>> +static void clear_new_addr_slot(unsigned long *addrslot, u8 addr)
>> +{
>> +	if (addr > I3C_ADDR_MASK)
>> +		return;
>> +
>> +	clear_bit(addr, addrslot);
>> +}
> 
> And this one
> 
Done
>> +
>> +static bool is_new_addr_slot_set(unsigned long *addrslot, u8 addr)
>> +{
>> +	if (addr > I3C_ADDR_MASK)
>> +		return false;
> 
> This condition is impossible given the user
Removed it.
> 
>> +
>> +	return test_bit(addr, addrslot);
> 
> Inline this check
> 
To have the function name meaning in the action by caller, i am keeping 
it. But i have inlined this function also. Hope its fine.
> [...]
> 
>> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum i3c_bus_phase bus_phase)
>> +{
>> +	const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
>> +	unsigned long freq;
>> +	u32 val, dfs_idx;
>> +	int ret;
>> +
>> +	if (bus_phase == OPEN_DRAIN_MODE)
>> +		clk_idx = gi3c->clk_od_cfg;
>> +
>> +	ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
>> +				     &dfs_idx, &freq, false);
>> +	if (ret)
>> +		dfs_idx = 0;
> 
> Shouldn't we throw some sort of error here instead?
> 
No, dfs_idx = 0 should be fine too. As default source frequency 19.2MHz 
can work at index 0.
> [...]
> 
>> +static void geni_i3c_handle_err(struct geni_i3c_dev *gi3c, u32 status)
>> +{
>> +	dev_dbg(gi3c->se.dev, "len:%d, %s\n",
>> +		gi3c->cur_len, gi3c->cur_is_write ? "write" : "read");
>> +
>> +	if (status & M_GP_IRQ_0_EN) {
>> +		gi3c->err = -EINVAL;
>> +		dev_dbg(gi3c->se.dev, "%s\n", "I3C slave early read termination");
> 
> Whenever there's just a string literal, please just print it directly.
> 
Sure, Done for all the places.
>> +	}
> 
> Please separate these with a newline
> 
Sure, Done for all the conditions.
>> +	if (status & M_GP_IRQ_1_EN) {
>> +		gi3c->err = -ENOTCONN;
>> +		dev_dbg(gi3c->se.dev, "%s\n", "NACK: slave unresponsive, check power/reset");
>> +	}
> 
> [...]
> 
>> +static irqreturn_t geni_i3c_irq(int irq, void *dev)
>> +{
>> +	u32 m_stat_mask, dm_tx_st, dm_rx_st, m_stat, rx_st, dma;
>> +	struct geni_i3c_dev *gi3c = dev;
>> +	unsigned long flags;
>> +	int j;
>> +
>> +	m_stat = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_STATUS);
>> +	m_stat_mask = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_EN);
>> +	rx_st = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFO_STATUS);
>> +	dm_tx_st = readl_relaxed(gi3c->se.base + SE_DMA_TX_IRQ_STAT);
>> +	dm_rx_st = readl_relaxed(gi3c->se.base + SE_DMA_RX_IRQ_STAT);
>> +	dma = readl_relaxed(gi3c->se.base + SE_GENI_DMA_MODE_EN);
>> +
>> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
>> +
>> +	if (m_stat & SE_I3C_ERR || dm_rx_st & DM_I3C_CB_ERR) {
>> +		geni_i3c_handle_err(gi3c, m_stat);
>> +		/* Disable the TX Watermark interrupt to stop TX */
>> +		if (!dma)
>> +			writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>> +		goto irqret;
>> +	}
>> +
>> +	if (dma) {
>> +		dev_dbg(gi3c->se.dev, "i3c dma tx:0x%x, dma rx:0x%x\n", dm_tx_st, dm_rx_st);
>> +		goto irqret;
>> +	}
>> +
>> +	if ((m_stat &
>> +		(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
>> +		!gi3c->cur_is_write && gi3c->cur_buf) {
> 
> The indentation here is confusing, please align the `(M_RX..` with `m_stat &`
> 
Sure, Done.
>> +		u32 rxcnt = rx_st & RX_FIFO_WC_MSK;
>> +
>> +		for (j = 0; j < rxcnt; j++) {
>> +			u32 val;
>> +			int p = 0;
>> +
>> +			val = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFOn);
>> +			while (gi3c->cur_idx < gi3c->cur_len && p < sizeof(val)) {
> 
> sizeof(val) is 4, please unroll this loop into something more readable
> 
Replaced directly with 4.
>> +				gi3c->cur_buf[gi3c->cur_idx++] = val & 0xff;
>> +				val >>= 8;
>> +				p++;
>> +			}
>> +			if (gi3c->cur_idx == gi3c->cur_len)
>> +				break;
>> +		}
>> +	} else if (m_stat & M_TX_FIFO_WATERMARK_EN &&
>> +		gi3c->cur_is_write && gi3c->cur_buf) {
>> +		for (j = 0; j < gi3c->tx_wm; j++) {
>> +			u32 temp;
>> +			u32 val = 0;
>> +			int p = 0;
>> +
>> +			while (gi3c->cur_idx < gi3c->cur_len && p < sizeof(val)) {
> 
> ditto
Done
> 
>> +				temp = gi3c->cur_buf[gi3c->cur_idx++];
>> +				val |= temp << (p * 8);
>> +				p++;
>> +			}
>> +
>> +			writel_relaxed(val, gi3c->se.base + SE_GENI_TX_FIFOn);
>> +			if (gi3c->cur_idx == gi3c->cur_len) {
>> +				writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +irqret:
>> +	if (m_stat)
>> +		writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
>> +
>> +	if (dma) {
>> +		if (dm_tx_st)
>> +			writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
>> +		if (dm_rx_st)
>> +			writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
>> +	}
>> +
>> +	/* if this is err with done-bit not set, handle that through timeout. */
>> +	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN) {
>> +		writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>> +		complete(&gi3c->done);
>> +	} else if (dm_tx_st & TX_DMA_DONE || dm_rx_st & RX_DMA_DONE	||
> 
> odd '\t'
> 
yes, Aligned.
>> +		dm_rx_st & RX_RESET_DONE) {
>> +		complete(&gi3c->done);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>> +	return IRQ_HANDLED;
> 
> a '\n' before return is customary
> 
Done
> [...]
> 
>> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct geni_i3c_xfer_params *xfer)
>> +{
>> +	bool is_write = gi3c->cur_is_write;
>> +	dma_addr_t tx_dma = 0, rx_dma = 0;
>> +	unsigned long time_remaining;
>> +	u32 len = gi3c->cur_len;
>> +	int ret;
>> +
>> +	geni_se_select_mode(&gi3c->se, xfer->mode);
>> +
>> +	gi3c->err = 0;
>> +	gi3c->cur_idx = 0;
>> +
>> +	if (!is_write) {
> 
> Nit: if (is_write) {} .. else {} is more natural> +		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
Sure, Reversed with natural and positive check.
I didn't get about debug log suggestion. Do you want to optimize it to 
one for both if/else condition ?
>> +			xfer->m_cmd, xfer->m_param, len);
>> +		writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
>> +		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>> +		if (xfer->mode == GENI_SE_DMA) {
>> +			ret = geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &rx_dma);
>> +			if (ret) {
> Why would it fail? And why should we fall back silently to FIFO mode then?
> 
DMA mapping can fail OR input validation can also fail. So we want to 
continue with FIFO mode.
>> +				xfer->mode = GENI_SE_FIFO;
>> +				geni_se_select_mode(&gi3c->se, xfer->mode);
>> +			}
>> +		}
>> +	} else {
>> +		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
>> +			xfer->m_cmd, xfer->m_param, len);
>> +
>> +		writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
>> +		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>> +
>> +		if (xfer->mode == GENI_SE_DMA) {
>> +			ret = geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &tx_dma);
>> +			if (ret) {
>> +				xfer->mode = GENI_SE_FIFO;
>> +				geni_se_select_mode(&gi3c->se, xfer->mode);
>> +			}
>> +		}
>> +
>> +		if (xfer->mode == GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
>> +			writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>> +	}
>> +
>> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>> +	if (!time_remaining) {
>> +		unsigned long flags;
>> +
>> +		dev_dbg(gi3c->se.dev, "Timeout completing FIFO transfer\n");
> 
> Can it not be DMA mode here too?
> 
Good find, it's common timeout error. Removed FIFO word.
> [...]
> 
>> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
>> +{
>> +	u8 last_dyn_addr = 0;
>> +	int ret;
>> +
>> +	while (1) {
>> +		u8 rx_buf[8], tx_buf[8];
>> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>> +		struct i3c_device_info info = { 0 };
>> +		struct i3c_dev_desc *i3cdev;
>> +		bool new_device = true;
>> +		u64 pid;
>> +		u8 bcr, dcr, addr;
>> +
>> +		xfer.m_cmd = I2C_READ;
>> +		xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
>> +		ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
>> +		if (ret)
>> +			break;
>> +
>> +		dcr = rx_buf[7];
>> +		bcr = rx_buf[6];
>> +		pid = ((u64)rx_buf[0] << 40) |
>> +			((u64)rx_buf[1] << 32) |
>> +			((u64)rx_buf[2] << 24) |
>> +			((u64)rx_buf[3] << 16) |
>> +			((u64)rx_buf[4] <<  8) |
>> +			((u64)rx_buf[5]);
> 
> FIELD_PREP + GENMASK, please
> 
Sure, Done.
>> +
>> +		i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
>> +			i3c_device_get_info(i3cdev->dev, &info);
>> +			if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
>> +				new_device = false;
>> +				addr = (info.dyn_addr) ? info.dyn_addr :
> 
> addr = info.dyn_addr ?: info.static_addr;
> 
Yes, Done.
>> +					info.static_addr;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (new_device) {
>> +			ret = i3c_master_get_free_addr(&gi3c->ctrlr, last_dyn_addr + 1);
>> +			if (ret < 0)
>> +				break;
>> +			addr = (u8)ret;
>> +			last_dyn_addr = (u8)ret;
> 
> nit: while logically the same, last_dyn_addr = addr would make sense here
> 
Sure, Done.
>> +			set_new_addr_slot(gi3c->newaddrslots, addr);
>> +		}
>> +
> 
> suppose addr=0x38
> 
>> +		tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
> 
> tx_buf[0] = (0x38 & 0x7f) << 1 = 0x38<<1 = 0x70 = 0b1110000
> 
>> +		tx_buf[0] |= ~(hweight8(addr & I3C_ADDR_MASK) & 1);
> 
> 0x70 | ~(hweight8(0x70 & 0x7f) & 1) = 0x70 | ~(3 & 1) = 0x70 | ~BIT(0) = 0xfe
> 
> is that the intended result?
> 
Yes, thats right.
It can have either 0xfe OR 0xff.

Mainly for error detection purpose. This parity bit in tx_buf[0] is set 
correctly based on nos set bits in the Masked addr is odd or even.
I have simplified it using parity8().
>> +
>> +		xfer.m_cmd = I2C_WRITE;
>> +		xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
>> +
>> +		ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
>> +		if (ret)
>> +			break;
>> +	}
>> +}
>> +
>> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>> +					struct i3c_ccc_cmd *cmd)
>> +{
>> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +	int i, ret;
>> +
>> +	if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
>> +		return -EINVAL;
>> +
>> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>> +	for (i = 0; i < cmd->ndests; i++) {
>> +		int stall = (i < (cmd->ndests - 1)) ||
>> +			(cmd->id == I3C_CCC_ENTDAA);
> 
> bool
> 
Sorry, Didn't get it where to keep bool ?
> Konrad


