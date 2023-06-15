Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA81973191E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjFOMo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjFOMo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:44:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58522120;
        Thu, 15 Jun 2023 05:44:24 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F8PBeY006145;
        Thu, 15 Jun 2023 12:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f+or/sb53rimh3pL2Lino2UcAx4b4LyC+coYI+DWKDM=;
 b=k/zTIH16hGZI6SxI/ejTcllt6PuMBqClIrbfWeGjCgDgQO6T0t+w5CWtbKEU5A1NhElE
 5i3hIOeuy7Z9NRufKzzQfePWVwjCloze3YyM3rd6Ev+A0TjsOiTZ6Fic0/tIAYAPZYZ7
 Kr3EzEu3fNwNtg2mYGa6aTiJWUqP2f8TJxBvl+1LqyEvXYZyA2C4T9p6wgZZp6L9ayWn
 s+Bw9UIzCDJ0NRlvRXX5Kumu51qd/9xpm4XQjjJhWtQ8SH4sTw04AEZbT8jBeK0hEe+p
 mpjyqv6vs3LF1ygb1mMNR3O7wQIsA6SHkenYPw3u5d8lxVzInict8gfBJLQYzwh2nRQw LQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7auy37bq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 12:44:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35FCi1kA001750
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 12:44:01 GMT
Received: from [10.50.16.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 15 Jun
 2023 05:43:56 -0700
Message-ID: <cc9750f3-c85c-be7f-e63c-0fcf4eb160f0@quicinc.com>
Date:   Thu, 15 Jun 2023 18:13:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V23 2/3] misc: dcc: Add driver support for Data Capture
 and Compare unit(DCC)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@ieee.org>,
        Arnd Bergmann <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
        "Rajendra Nayak" <quic_rjendra@quicinc.com>
References: <cover.1683265984.git.quic_schowdhu@quicinc.com>
 <2259ab0348282349e88905ea99bcb4aa815d941f.1683265984.git.quic_schowdhu@quicinc.com>
 <2023061542-reformed-unholy-10a3@gregkh>
Content-Language: en-US
From:   Souradeep Chowdhury <quic_schowdhu@quicinc.com>
In-Reply-To: <2023061542-reformed-unholy-10a3@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ca8iXFTWcdVcb9Nbbq3KemGvqTZjEFwL
X-Proofpoint-GUID: Ca8iXFTWcdVcb9Nbbq3KemGvqTZjEFwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_08,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150111
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/15/2023 4:03 PM, Greg Kroah-Hartman wrote:
> On Thu, May 04, 2023 at 11:36:22PM -0700, Souradeep Chowdhury wrote:
>> +/**
>> + * struct dcc_config_entry - configuration information related to each dcc instruction
>> + * @base:                    Base address of the register to be configured in dcc
> 
> Why is this a u32 and not a bigger size?

Currently only 32 bit register addresses are supported for DCC 
configuration.

> 
>> + * @offset:                  Offset to the base address to be configured in dcc
>> + * @len:                     Length of the address in words to be configured in dcc
> 
> What is a "word" here, 16 bits?

Each word is 4 bytes(32 bits)

> 
>> + * @loop_cnt:                The number of times to loop on the register address in case
>> +				of loop instructions
>> + * @write_val:               The value to be written on the register address in case of
>> +				write instructions
>> + * @mask:                    Mask corresponding to the value to be written in case of
>> +				write instructions
>> + * @apb_bus:                 Type of bus to be used for the instruction, can be either
>> +				'apb' or 'ahb'
> 
> How can a bool be either "apb" or "ahb"?

1 stands for apb and 0 for ahb. Will update the same here.

> 
>> + * @desc_type:               Stores the type of dcc instruction
>> + * @list:                    This is used to append this instruction to the list of
>> +				instructions
>> + */
>> +struct dcc_config_entry {
>> +	u32				base;
>> +	u32				offset;
>> +	u32				len;
>> +	u32				loop_cnt;
>> +	u32				write_val;
>> +	u32				mask;
>> +	bool				apb_bus;
>> +	enum dcc_descriptor_type	desc_type;
>> +	struct list_head		list;
>> +};
>> +
>> +/**
>> + * struct dcc_drvdata - configuration information related to a dcc device
>> + * @base:		Base Address of the dcc device
>> + * @dev:		The device attached to the driver data
>> + * @mutex:		Lock to protect access and manipulation of dcc_drvdata
>> + * @ram_base:		Base address for the SRAM dedicated for the dcc device
>> + * @ram_size:		Total size of the SRAM dedicated for the dcc device
>> + * @ram_offset:		Offset to the SRAM dedicated for dcc device
>> + * @mem_map_ver:	Memory map version of DCC hardware
>> + * @ram_cfg:		Used for address limit calculation for dcc
>> + * @ram_start:		Starting address of DCC SRAM
>> + * @sram_dev:		Miscellaneous device equivalent of dcc SRAM
>> + * @cfg_head:		Points to the head of the linked list of addresses
>> + * @dbg_dir:		The dcc debugfs directory under which all the debugfs files are placed
>> + * @nr_link_list:	Total number of linkedlists supported by the DCC configuration
>> + * @loop_shift:		Loop offset bits range for the addresses
>> + * @enable_bitmap:	Bitmap to capture the enabled status of each linked list of addresses
> 
> You use a pointer for a bitmap?

Yes because the generic kernel functions on bitmaps test_bit,set_bit 
takes pointer as the argument.

> 
>> + */
>> +struct dcc_drvdata {
>> +	void __iomem		*base;
>> +	void __iomem            *ram_base;
>> +	struct device		*dev;
>> +	struct mutex		mutex;
>> +	size_t			ram_size;
>> +	size_t			ram_offset;
>> +	int			mem_map_ver;
> 
> u64?

Ack

> 
>> +	unsigned int		ram_cfg;
>> +	unsigned int		ram_start;
>> +	struct miscdevice	sram_dev;
>> +	struct list_head	*cfg_head;
>> +	struct dentry		*dbg_dir;
>> +	size_t			nr_link_list;
> 
> "nr"?

Will change this to max_link_list.

> 
>> +	u8			loop_shift;
>> +	unsigned long		*enable_bitmap;
>> +};
>> +
>> +struct dcc_cfg_attr {
>> +	u32	addr;
>> +	u32	prev_addr;
>> +	u32	prev_off;
>> +	u32	link;
>> +	u32	sram_offset;
>> +};
>> +
>> +struct dcc_cfg_loop_attr {
>> +	u32	loop_cnt;
>> +	u32	loop_len;
>> +	u32	loop_off;
>> +	bool    loop_start;
>> +};
>> +
>> +static inline u32 dcc_status(int version)
>> +{
>> +	return version == 1 ? 0x0c : 0x1c;
>> +}
>> +
>> +static inline u32 dcc_list_offset(int version)
>> +{
>> +	if (version == 1)
>> +		return 0x1c;
>> +	else if (version == 2)
>> +		return 0x2c;
>> +	else
>> +		return 0x34;
>> +}
>> +
>> +static inline void dcc_list_writel(struct dcc_drvdata *drvdata,
>> +				   u32 ll, u32 val, u32 off)
>> +{
>> +	u32 offset = dcc_list_offset(drvdata->mem_map_ver) + off;
>> +
>> +	writel(val, drvdata->base + ll * DCC_LL_OFFSET + offset);
>> +}
>> +
>> +static inline u32 dcc_list_readl(struct dcc_drvdata *drvdata, u32 ll, u32 off)
>> +{
>> +	u32 offset = dcc_list_offset(drvdata->mem_map_ver) + off;
>> +
>> +	return readl(drvdata->base + ll * DCC_LL_OFFSET + offset);
>> +}
>> +
>> +static void dcc_sram_write_auto(struct dcc_drvdata *drvdata,
>> +				u32 val, u32 *off)
>> +{
>> +	/* If the overflow condition is met increment the offset
>> +	 * and return to indicate that overflow has occurred
>> +	 */
>> +	if (unlikely(*off > drvdata->ram_size - 4)) {
> 
> If you can not measure the difference in userspace when using
> likely/unlikely, then never use it as the compiler and CPU will do it
> better for you.

Ack

> 
>> +		*off += 4;
>> +		return;
>> +	}
>> +
>> +	writel(val, drvdata->ram_base + *off);
>> +
>> +	*off += 4;
>> +}
>> +
>> +static int dcc_sw_trigger(struct dcc_drvdata *drvdata)
>> +{
>> +	void __iomem *addr;
>> +	int i;
>> +	u32 status;
>> +	u32 ll_cfg;
>> +	u32 tmp_ll_cfg;
>> +	u32 val;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	for (i = 0; i < drvdata->nr_link_list; i++) {
>> +		if (!test_bit(i, drvdata->enable_bitmap))
>> +			continue;
>> +		ll_cfg = dcc_list_readl(drvdata, i, DCC_LL_CFG);
>> +		tmp_ll_cfg = ll_cfg & ~DCC_TRIGGER_MASK;
>> +		dcc_list_writel(drvdata, tmp_ll_cfg, i, DCC_LL_CFG);
>> +		dcc_list_writel(drvdata, 1, i, DCC_LL_SW_TRIGGER);
>> +		dcc_list_writel(drvdata, ll_cfg, i, DCC_LL_CFG);
>> +	}
>> +
>> +	addr = drvdata->base + dcc_status(drvdata->mem_map_ver);
>> +	if (readl_poll_timeout(addr, val, !FIELD_GET(DCC_STATUS_MASK, val),
>> +			       1, STATUS_READY_TIMEOUT)) {
>> +		dev_err(drvdata->dev, "DCC is busy after receiving sw trigger\n");
>> +		ret = -EBUSY;
>> +		goto out_unlock;
>> +	}
>> +
>> +	for (i = 0; i < drvdata->nr_link_list; i++) {
>> +		if (!test_bit(i, drvdata->enable_bitmap))
>> +			continue;
>> +
>> +		status = dcc_list_readl(drvdata, i, DCC_LL_BUS_ACCESS_STATUS);
>> +		if (!status)
>> +			continue;
>> +
>> +		dev_err(drvdata->dev, "Read access error for list %d err: 0x%x\n",
>> +			i, status);
>> +		ll_cfg = dcc_list_readl(drvdata, i, DCC_LL_CFG);
>> +		tmp_ll_cfg = ll_cfg & ~DCC_TRIGGER_MASK;
>> +		dcc_list_writel(drvdata, tmp_ll_cfg, i, DCC_LL_CFG);
>> +		dcc_list_writel(drvdata, DCC_STATUS_MASK, i, DCC_LL_BUS_ACCESS_STATUS);
>> +		dcc_list_writel(drvdata, ll_cfg, i, DCC_LL_CFG);
>> +		ret = -ENODATA;
>> +		break;
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&drvdata->mutex);
>> +	return ret;
>> +}
>> +
>> +static void dcc_ll_cfg_reset_link(struct dcc_cfg_attr *cfg)
>> +{
>> +	cfg->addr = 0x00;
>> +	cfg->link = 0;
>> +	cfg->prev_off = 0;
>> +	cfg->prev_addr = cfg->addr;
>> +}
>> +
>> +static void dcc_emit_read_write(struct dcc_drvdata *drvdata,
>> +				struct dcc_config_entry *entry,
>> +				struct dcc_cfg_attr *cfg)
>> +{
>> +	if (cfg->link) {
>> +		/*
>> +		 * write new offset = 1 to continue
>> +		 * processing the list
>> +		 */
>> +
>> +		dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
>> +
>> +		/* Reset link and prev_off */
>> +		dcc_ll_cfg_reset_link(cfg);
>> +	}
>> +
>> +	cfg->addr = DCC_RD_MOD_WR_DESCRIPTOR;
>> +	dcc_sram_write_auto(drvdata, cfg->addr, &cfg->sram_offset);
>> +
>> +	dcc_sram_write_auto(drvdata, entry->mask, &cfg->sram_offset);
>> +
>> +	dcc_sram_write_auto(drvdata, entry->write_val, &cfg->sram_offset);
>> +
>> +	cfg->addr = 0;
>> +}
>> +
>> +static void dcc_emit_loop(struct dcc_drvdata *drvdata, struct dcc_config_entry *entry,
>> +			  struct dcc_cfg_attr *cfg,
>> +			  struct dcc_cfg_loop_attr *cfg_loop,
>> +			  u32 *total_len)
>> +{
>> +	int loop;
>> +
>> +	/* Check if we need to write link of prev entry */
>> +	if (cfg->link)
>> +		dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
>> +
>> +	if (cfg_loop->loop_start) {
>> +		loop = (cfg->sram_offset - cfg_loop->loop_off) / 4;
>> +		loop |= (cfg_loop->loop_cnt << drvdata->loop_shift) &
>> +				   GENMASK(DCC_ADDR_LIMIT, drvdata->loop_shift);
>> +		loop |= DCC_LOOP_DESCRIPTOR;
>> +		*total_len += (*total_len - cfg_loop->loop_len) * cfg_loop->loop_cnt;
>> +
>> +		dcc_sram_write_auto(drvdata, loop, &cfg->sram_offset);
>> +
>> +		cfg_loop->loop_start = false;
>> +		cfg_loop->loop_len = 0;
>> +		cfg_loop->loop_off = 0;
>> +	} else {
>> +		cfg_loop->loop_start = true;
>> +		cfg_loop->loop_cnt = entry->loop_cnt - 1;
>> +		cfg_loop->loop_len = *total_len;
>> +		cfg_loop->loop_off = cfg->sram_offset;
>> +	}
>> +
>> +	/* Reset link and prev_off */
>> +	dcc_ll_cfg_reset_link(cfg);
>> +}
>> +
>> +static void dcc_emit_write(struct dcc_drvdata *drvdata,
>> +			   struct dcc_config_entry *entry,
>> +			   struct dcc_cfg_attr *cfg)
>> +{
>> +	u32 off;
>> +
>> +	if (cfg->link) {
>> +		/*
>> +		 * write new offset = 1 to continue
>> +		 * processing the list
>> +		 */
>> +		dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
>> +
>> +		/* Reset link and prev_off */
>> +		cfg->addr = 0x00;
>> +		cfg->prev_off = 0;
>> +		cfg->prev_addr = cfg->addr;
>> +	}
>> +
>> +	off = entry->offset / 4;
>> +	/* write new offset-length pair to correct position */
>> +	cfg->link |= ((off & DCC_WRITE_OFF_MASK) | DCC_WRITE_MASK |
>> +		      FIELD_PREP(DCC_WRITE_LEN_MASK, entry->len));
>> +	cfg->link |= DCC_LINK_DESCRIPTOR;
>> +
>> +	/* Address type */
>> +	cfg->addr = (entry->base >> 4) & GENMASK(DCC_ADDR_LIMIT, 0);
>> +	if (entry->apb_bus)
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_APB_IND;
>> +	else
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_AHB_IND;
>> +	dcc_sram_write_auto(drvdata, cfg->addr, &cfg->sram_offset);
>> +
>> +	dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
>> +
>> +	dcc_sram_write_auto(drvdata, entry->write_val, &cfg->sram_offset);
>> +
>> +	cfg->addr = 0x00;
>> +	cfg->link = 0;
>> +}
>> +
>> +static int dcc_emit_read(struct dcc_drvdata *drvdata,
>> +			 struct dcc_config_entry *entry,
>> +			 struct dcc_cfg_attr *cfg,
>> +			 u32 *pos, u32 *total_len)
>> +{
>> +	u32 off;
>> +	u32 temp_off;
>> +
>> +	cfg->addr = (entry->base >> 4) & GENMASK(27, 0);
>> +
>> +	if (entry->apb_bus)
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_APB_IND;
>> +	else
>> +		cfg->addr |= DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_AHB_IND;
>> +
>> +	off = entry->offset / 4;
>> +
>> +	*total_len += entry->len * 4;
>> +
>> +	if (!cfg->prev_addr || cfg->prev_addr != cfg->addr || cfg->prev_off > off) {
>> +		/* Check if we need to write prev link entry */
>> +		if (cfg->link)
>> +			dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
>> +		dev_dbg(drvdata->dev, "DCC: sram address 0x%x\n", cfg->sram_offset);
>> +
>> +		/* Write address */
>> +		dcc_sram_write_auto(drvdata, cfg->addr, &cfg->sram_offset);
>> +
>> +		/* Reset link and prev_off */
>> +		cfg->link = 0;
>> +		cfg->prev_off = 0;
>> +	}
>> +
>> +	if ((off - cfg->prev_off) > 0xff || entry->len > MAX_DCC_LEN) {
>> +		dev_err(drvdata->dev, "DCC: Programming error Base: 0x%x, offset 0x%x\n",
>> +			entry->base, entry->offset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (cfg->link) {
>> +		/*
>> +		 * link already has one offset-length so new
>> +		 * offset-length needs to be placed at
>> +		 * bits [29:15]
>> +		 */
>> +		*pos = 15;
>> +
>> +		/* Clear bits [31:16] */
>> +		cfg->link &= GENMASK(14, 0);
>> +	} else {
>> +		/*
>> +		 * link is empty, so new offset-length needs
>> +		 * to be placed at bits [15:0]
>> +		 */
>> +		*pos = 0;
>> +		cfg->link = 1 << 15;
>> +	}
>> +
>> +	/* write new offset-length pair to correct position */
>> +	temp_off = (off - cfg->prev_off) & GENMASK(7, 0);
>> +	cfg->link |= temp_off | ((entry->len << 8) & GENMASK(14, 8)) << *pos;
>> +
>> +	cfg->link |= DCC_LINK_DESCRIPTOR;
>> +
>> +	if (*pos) {
>> +		dcc_sram_write_auto(drvdata, cfg->link, &cfg->sram_offset);
>> +		cfg->link = 0;
>> +	}
>> +
>> +	cfg->prev_off  = off + entry->len - 1;
>> +	cfg->prev_addr = cfg->addr;
>> +	return 0;
>> +}
>> +
>> +static int dcc_emit_config(struct dcc_drvdata *drvdata, unsigned int curr_list)
>> +{
>> +	int ret;
>> +	u32 total_len, pos;
>> +	struct dcc_config_entry *entry;
>> +	struct dcc_cfg_attr cfg = {0};
>> +	struct dcc_cfg_loop_attr cfg_loop = {0};
>> +
>> +	cfg.sram_offset = drvdata->ram_cfg * 4;
>> +	total_len = 0;
>> +
>> +	list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
>> +		switch (entry->desc_type) {
>> +		case DCC_READ_WRITE_TYPE:
>> +			dcc_emit_read_write(drvdata, entry, &cfg);
>> +			break;
>> +
>> +		case DCC_LOOP_TYPE:
>> +			dcc_emit_loop(drvdata, entry, &cfg, &cfg_loop, &total_len);
>> +			break;
>> +
>> +		case DCC_WRITE_TYPE:
>> +			dcc_emit_write(drvdata, entry, &cfg);
>> +			break;
>> +
>> +		case DCC_READ_TYPE:
>> +			ret = dcc_emit_read(drvdata, entry, &cfg, &pos, &total_len);
>> +			if (ret)
>> +				goto err;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (cfg.link)
>> +		dcc_sram_write_auto(drvdata, cfg.link, &cfg.sram_offset);
>> +
>> +	if (cfg_loop.loop_start) {
>> +		dev_err(drvdata->dev, "DCC: Programming error: Loop unterminated\n");
>> +		ret = -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	/* Handling special case of list ending with a rd_mod_wr */
>> +	if (cfg.addr == DCC_RD_MOD_WR_DESCRIPTOR) {
>> +		cfg.addr = (DCC_RD_MOD_WR_ADDR) & GENMASK(27, 0);
>> +		cfg.addr |= DCC_ADDR_DESCRIPTOR;
>> +		dcc_sram_write_auto(drvdata, cfg.addr, &cfg.sram_offset);
>> +	}
>> +
>> +	/* Setting zero to indicate end of the list */
>> +	cfg.link = DCC_LINK_DESCRIPTOR;
>> +	dcc_sram_write_auto(drvdata, cfg.link, &cfg.sram_offset);
>> +
>> +	/* Check if sram offset exceeds the ram size */
>> +	if (cfg.sram_offset > drvdata->ram_size)
>> +		goto overstep;
>> +
>> +	/* Update ram_cfg and check if the data will overstep */
>> +	drvdata->ram_cfg = (cfg.sram_offset + total_len) / 4;
>> +
>> +	if (cfg.sram_offset + total_len > drvdata->ram_size) {
>> +		cfg.sram_offset += total_len;
>> +		goto overstep;
>> +	}
>> +
>> +	drvdata->ram_start = cfg.sram_offset / 4;
>> +	return 0;
>> +overstep:
>> +	ret = -EINVAL;
>> +	memset_io(drvdata->ram_base, 0, drvdata->ram_size);
>> +
>> +err:
>> +	return ret;
>> +}
>> +
>> +static bool dcc_valid_list(struct dcc_drvdata *drvdata, unsigned int curr_list)
>> +{
>> +	u32 lock_reg;
>> +
>> +	if (list_empty(&drvdata->cfg_head[curr_list]))
>> +		return false;
>> +
>> +	if (test_bit(curr_list, drvdata->enable_bitmap)) {
>> +		dev_err(drvdata->dev, "List %d is already enabled\n", curr_list);
>> +		return false;
>> +	}
>> +
>> +	lock_reg = dcc_list_readl(drvdata, curr_list, DCC_LL_LOCK);
>> +	if (lock_reg & DCC_LOCK_MASK) {
>> +		dev_err(drvdata->dev, "List %d is already locked\n", curr_list);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static bool is_dcc_enabled(struct dcc_drvdata *drvdata)
>> +{
>> +	int list;
>> +
>> +	for (list = 0; list < drvdata->nr_link_list; list++)
>> +		if (test_bit(list, drvdata->enable_bitmap))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +static int dcc_enable(struct dcc_drvdata *drvdata, unsigned int curr_list)
>> +{
>> +	int ret;
>> +	u32 ram_cfg_base;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	if (!dcc_valid_list(drvdata, curr_list)) {
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	/* Fill dcc sram with the poison value.
>> +	 * This helps in understanding bus
>> +	 * hang from registers returning a zero
>> +	 */
>> +	if (!is_dcc_enabled(drvdata))
>> +		memset_io(drvdata->ram_base, 0xde, drvdata->ram_size);
>> +
>> +	/* 1. Take ownership of the list */
>> +	dcc_list_writel(drvdata, DCC_LOCK_MASK, curr_list, DCC_LL_LOCK);
>> +
>> +	/* 2. Program linked-list in the SRAM */
>> +	ram_cfg_base = drvdata->ram_cfg;
>> +	ret = dcc_emit_config(drvdata, curr_list);
>> +	if (ret) {
>> +		dcc_list_writel(drvdata, 0, curr_list, DCC_LL_LOCK);
>> +		goto out_unlock;
>> +	}
>> +
>> +	/* 3. Program DCC_RAM_CFG reg */
>> +	dcc_list_writel(drvdata, ram_cfg_base +
>> +			drvdata->ram_offset / 4, curr_list, DCC_LL_BASE);
>> +	dcc_list_writel(drvdata, drvdata->ram_start +
>> +			drvdata->ram_offset / 4, curr_list, DCC_FD_BASE);
>> +	dcc_list_writel(drvdata, 0xFFF, curr_list, DCC_LL_TIMEOUT);
>> +
>> +	/* 4. Clears interrupt status register */
>> +	dcc_list_writel(drvdata, 0, curr_list, DCC_LL_INT_ENABLE);
>> +	dcc_list_writel(drvdata, (BIT(0) | BIT(1) | BIT(2)),
>> +			curr_list, DCC_LL_INT_STATUS);
>> +
>> +	set_bit(curr_list, drvdata->enable_bitmap);
>> +
>> +	/* 5. Configure trigger */
>> +	dcc_list_writel(drvdata, DCC_TRIGGER_MASK,
>> +			curr_list, DCC_LL_CFG);
>> +
>> +out_unlock:
>> +	mutex_unlock(&drvdata->mutex);
>> +	return ret;
>> +}
>> +
>> +static void dcc_disable(struct dcc_drvdata *drvdata, int curr_list)
>> +{
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	if (!test_bit(curr_list, drvdata->enable_bitmap))
>> +		goto out_unlock;
>> +	dcc_list_writel(drvdata, 0, curr_list, DCC_LL_CFG);
>> +	dcc_list_writel(drvdata, 0, curr_list, DCC_LL_BASE);
>> +	dcc_list_writel(drvdata, 0, curr_list, DCC_FD_BASE);
>> +	dcc_list_writel(drvdata, 0, curr_list, DCC_LL_LOCK);
>> +	clear_bit(curr_list, drvdata->enable_bitmap);
>> +out_unlock:
>> +	mutex_unlock(&drvdata->mutex);
>> +}
>> +
>> +static u32 dcc_filp_curr_list(const struct file *filp)
>> +{
>> +	struct dentry *dentry = file_dentry(filp);
>> +	int curr_list, ret;
>> +
>> +	ret = kstrtoint(dentry->d_parent->d_name.name, 0, &curr_list);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return curr_list;
>> +}
>> +
>> +static ssize_t enable_read(struct file *filp, char __user *userbuf,
>> +			   size_t count, loff_t *ppos)
>> +{
>> +	char *buf;
>> +	struct dcc_drvdata *drvdata = filp->private_data;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	if (is_dcc_enabled(drvdata))
>> +		buf = "Y\n";
>> +	else
>> +		buf = "N\n";
>> +
>> +	mutex_unlock(&drvdata->mutex);
>> +
>> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
>> +}
>> +
>> +static ssize_t enable_write(struct file *filp, const char __user *userbuf,
>> +			    size_t count, loff_t *ppos)
>> +{
>> +	int ret = 0, curr_list;
>> +	bool val;
>> +	struct dcc_drvdata *drvdata = filp->private_data;
>> +
>> +	curr_list = dcc_filp_curr_list(filp);
>> +	if (curr_list < 0)
>> +		return curr_list;
>> +
>> +	ret = kstrtobool_from_user(userbuf, count, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (val) {
>> +		ret = dcc_enable(drvdata, curr_list);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		dcc_disable(drvdata, curr_list);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations enable_fops = {
>> +	.read = enable_read,
>> +	.write = enable_write,
>> +	.open = simple_open,
>> +	.llseek = generic_file_llseek,
>> +};
>> +
>> +static ssize_t trigger_write(struct file *filp,
>> +			     const char __user *user_buf, size_t count,
>> +			     loff_t *ppos)
>> +{
>> +	int ret;
>> +	unsigned int val;
>> +	struct dcc_drvdata *drvdata = filp->private_data;
>> +
>> +	ret = kstrtouint_from_user(user_buf, count, 0, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (val != 1)
>> +		return -EINVAL;
>> +
>> +	ret = dcc_sw_trigger(drvdata);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations trigger_fops = {
>> +	.write = trigger_write,
>> +	.open = simple_open,
>> +	.llseek = generic_file_llseek,
>> +};
>> +
>> +static int dcc_config_add(struct dcc_drvdata *drvdata, unsigned int addr,
>> +			  unsigned int len, bool apb_bus, int curr_list)
>> +{
>> +	int ret = 0;
>> +	struct dcc_config_entry *entry, *pentry;
>> +	unsigned int base, offset;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	if (!len || len > drvdata->ram_size / DCC_WORD_SIZE) {
>> +		dev_err(drvdata->dev, "DCC: Invalid length\n");
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	base = addr & DCC_ADDR_RANGE_MASK;
>> +
>> +	if (!list_empty(&drvdata->cfg_head[curr_list])) {
>> +		pentry = list_last_entry(&drvdata->cfg_head[curr_list],
>> +					 struct dcc_config_entry, list);
>> +
>> +		if (pentry->desc_type == DCC_READ_TYPE &&
>> +		    addr >= (pentry->base + pentry->offset) &&
>> +		    addr <= (pentry->base + pentry->offset + MAX_DCC_OFFSET)) {
>> +			/* Re-use base address from last entry */
>> +			base = pentry->base;
>> +
>> +			if ((pentry->len * 4 + pentry->base + pentry->offset)
>> +					== addr) {
>> +				len += pentry->len;
>> +
>> +				if (len > MAX_DCC_LEN)
>> +					pentry->len = MAX_DCC_LEN;
>> +				else
>> +					pentry->len = len;
>> +
>> +				addr = pentry->base + pentry->offset +
>> +					pentry->len * 4;
>> +				len -= pentry->len;
>> +			}
>> +		}
>> +	}
>> +
>> +	offset = addr - base;
>> +
>> +	while (len) {
>> +		entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +		if (!entry) {
>> +			ret = -ENOMEM;
>> +			goto out_unlock;
>> +		}
>> +
>> +		entry->base = base;
>> +		entry->offset = offset;
>> +		entry->len = min_t(u32, len, MAX_DCC_LEN);
>> +		entry->desc_type = DCC_READ_TYPE;
>> +		entry->apb_bus = apb_bus;
>> +		INIT_LIST_HEAD(&entry->list);
>> +		list_add_tail(&entry->list,
>> +			      &drvdata->cfg_head[curr_list]);
>> +
>> +		len -= entry->len;
>> +		offset += MAX_DCC_LEN * 4;
>> +	}
>> +
>> +out_unlock:
>> +	mutex_unlock(&drvdata->mutex);
>> +	return ret;
>> +}
>> +
>> +static ssize_t dcc_config_add_read(struct dcc_drvdata *drvdata, char *buf, int curr_list)
>> +{
>> +	bool bus;
>> +	int len, nval;
>> +	unsigned int base;
>> +	char apb_bus[4];
>> +
>> +	nval = sscanf(buf, "%x %i %3s", &base, &len, apb_bus);
>> +	if (nval <= 0 || nval > 3)
>> +		return -EINVAL;
>> +
>> +	if (nval == 1) {
>> +		len = 1;
>> +		bus = false;
>> +	} else if (nval == 2) {
>> +		bus = false;
>> +	} else if (!strcmp("apb", apb_bus)) {
>> +		bus = true;
>> +	} else if (!strcmp("ahb", apb_bus)) {
>> +		bus = false;
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	return dcc_config_add(drvdata, base, len, bus, curr_list);
>> +}
>> +
>> +static void dcc_config_reset(struct dcc_drvdata *drvdata)
>> +{
>> +	struct dcc_config_entry *entry, *temp;
>> +	int curr_list;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	for (curr_list = 0; curr_list < drvdata->nr_link_list; curr_list++) {
>> +		list_for_each_entry_safe(entry, temp,
>> +					 &drvdata->cfg_head[curr_list], list) {
>> +			list_del(&entry->list);
>> +			kfree(entry);
>> +		}
>> +	}
>> +	drvdata->ram_start = 0;
>> +	drvdata->ram_cfg = 0;
>> +	mutex_unlock(&drvdata->mutex);
>> +}
>> +
>> +static ssize_t config_reset_write(struct file *filp,
>> +				  const char __user *user_buf, size_t count,
>> +				  loff_t *ppos)
>> +{
>> +	unsigned int val, ret;
>> +	struct dcc_drvdata *drvdata = filp->private_data;
>> +
>> +	ret = kstrtouint_from_user(user_buf, count, 0, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (val)
>> +		dcc_config_reset(drvdata);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations config_reset_fops = {
>> +	.write = config_reset_write,
>> +	.open = simple_open,
>> +	.llseek = generic_file_llseek,
>> +};
>> +
>> +static ssize_t ready_read(struct file *filp, char __user *userbuf,
>> +			  size_t count, loff_t *ppos)
>> +{
>> +	int ret = 0;
>> +	char *buf;
>> +	struct dcc_drvdata *drvdata = filp->private_data;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	if (!is_dcc_enabled(drvdata)) {
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (!FIELD_GET(BIT(1), readl(drvdata->base + dcc_status(drvdata->mem_map_ver))))
>> +		buf = "Y\n";
>> +	else
>> +		buf = "N\n";
>> +out_unlock:
>> +	mutex_unlock(&drvdata->mutex);
>> +
>> +	if (ret < 0)
>> +		return -EINVAL;
>> +	else
> 
> You do the "lock, get a value, unlock, do something with the value"
> thing a bunch, but what prevents the value from changing after the lock
> happens?  So why is the lock needed at all?

The lock is used to prevent concurrent accesses of the drv_data when
scripts are being run from userspace.

> 
> thanks,
> 
> greg k-h
> 
>> +		return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf) + 1);
>> +}
>> +
>> +static const struct file_operations ready_fops = {
>> +	.read = ready_read,
>> +	.open = simple_open,
>> +	.llseek = generic_file_llseek,
>> +};
>> +
>> +static int dcc_add_loop(struct dcc_drvdata *drvdata, unsigned long loop_cnt, int curr_list)
>> +{
>> +	struct dcc_config_entry *entry;
>> +
>> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +	if (!entry)
>> +		return -ENOMEM;
>> +
>> +	entry->loop_cnt = min_t(u32, loop_cnt, MAX_LOOP_CNT);
>> +	entry->desc_type = DCC_LOOP_TYPE;
>> +	INIT_LIST_HEAD(&entry->list);
>> +	list_add_tail(&entry->list, &drvdata->cfg_head[curr_list]);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t dcc_config_add_loop(struct dcc_drvdata *drvdata, char *buf, int curr_list)
>> +{
>> +	int ret, i = 0;
>> +	char *token, *input;
>> +	char delim[2] = " ";
>> +	unsigned int val[MAX_LOOP_ADDR];
>> +
>> +	input = buf;
>> +
>> +	while ((token = strsep(&input, delim)) && i < MAX_LOOP_ADDR) {
>> +		ret = kstrtoint(token, 0, &val[i++]);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (token) {
>> +		dev_err(drvdata->dev, "Max limit %u of loop address exceeded",
>> +			MAX_LOOP_ADDR);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (val[1] < 1 || val[1] > 8)
>> +		return -EINVAL;
>> +
>> +	ret = dcc_add_loop(drvdata, val[0], curr_list);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < val[1]; i++)
>> +		dcc_config_add(drvdata, val[i + 2], 1, false, curr_list);
>> +
>> +	return dcc_add_loop(drvdata, 1, curr_list);
>> +}
>> +
>> +static int dcc_rd_mod_wr_add(struct dcc_drvdata *drvdata, unsigned int mask,
>> +			     unsigned int val, int curr_list)
>> +{
>> +	int ret = 0;
>> +	struct dcc_config_entry *entry;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	if (list_empty(&drvdata->cfg_head[curr_list])) {
>> +		dev_err(drvdata->dev, "DCC: No read address programmed\n");
>> +		ret = -EPERM;
>> +		goto out_unlock;
>> +	}
>> +
>> +	entry = devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
>> +	if (!entry) {
>> +		ret = -ENOMEM;
>> +		goto out_unlock;
>> +	}
>> +
>> +	entry->desc_type = DCC_READ_WRITE_TYPE;
>> +	entry->mask = mask;
>> +	entry->write_val = val;
>> +	list_add_tail(&entry->list, &drvdata->cfg_head[curr_list]);
>> +out_unlock:
>> +	mutex_unlock(&drvdata->mutex);
>> +	return ret;
>> +}
>> +
>> +static ssize_t dcc_config_add_read_write(struct dcc_drvdata *drvdata, char *buf, int curr_list)
>> +{
>> +	int ret;
>> +	int nval;
>> +	unsigned int addr, mask, val;
>> +
>> +	nval = sscanf(buf, "%x %x %x", &addr, &mask, &val);
>> +
>> +	if (nval <= 1 || nval > 3)
>> +		return -EINVAL;
>> +
>> +	ret = dcc_config_add(drvdata, addr, 1, false, curr_list);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return dcc_rd_mod_wr_add(drvdata, mask, val, curr_list);
>> +}
>> +
>> +static int dcc_add_write(struct dcc_drvdata *drvdata, unsigned int addr,
>> +			 unsigned int write_val, int apb_bus, int curr_list)
>> +{
>> +	struct dcc_config_entry *entry;
>> +
>> +	entry = devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
>> +	if (!entry)
>> +		return -ENOMEM;
>> +
>> +	entry->desc_type = DCC_WRITE_TYPE;
>> +	entry->base = addr & GENMASK(31, 4);
>> +	entry->offset = addr - entry->base;
>> +	entry->write_val = write_val;
>> +	entry->len = 1;
>> +	entry->apb_bus = apb_bus;
>> +	list_add_tail(&entry->list, &drvdata->cfg_head[curr_list]);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t dcc_config_add_write(struct dcc_drvdata *drvdata, char *buf, int curr_list)
>> +{
>> +	bool bus;
>> +	int nval;
>> +	unsigned int addr, write_val;
>> +	char apb_bus[4];
>> +
>> +	nval = sscanf(buf, "%x %x %3s", &addr, &write_val, apb_bus);
>> +
>> +	if (nval <= 1 || nval > 3)
>> +		return -EINVAL;
>> +
>> +	if (nval == 2)
>> +		bus = true;
>> +
>> +	if (nval == 3) {
>> +		if (!strcmp("apb", apb_bus))
>> +			bus = true;
>> +		else if (!strcmp("ahb", apb_bus))
>> +			bus = false;
>> +		else
>> +			return -EINVAL;
>> +	}
>> +
>> +	return dcc_add_write(drvdata, addr, write_val, bus, curr_list);
>> +}
>> +
>> +static int config_show(struct seq_file *m, void *data)
>> +{
>> +	struct dcc_drvdata *drvdata = m->private;
>> +	struct dcc_config_entry *entry;
>> +	int index = 0, curr_list;
>> +
>> +	curr_list = dcc_filp_curr_list(m->file);
>> +	if (curr_list < 0)
>> +		return curr_list;
>> +
>> +	mutex_lock(&drvdata->mutex);
>> +
>> +	list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
>> +		index++;
>> +		switch (entry->desc_type) {
>> +		case DCC_READ_WRITE_TYPE:
>> +			seq_printf(m, "RW mask: 0x%x, val: 0x%x\n index: 0x%x\n",
>> +				   entry->mask, entry->write_val, index);
>> +			break;
>> +		case DCC_LOOP_TYPE:
>> +			seq_printf(m, "L index: 0x%x Loop: %d\n", index, entry->loop_cnt);
>> +			break;
>> +		case DCC_WRITE_TYPE:
>> +			seq_printf(m, "W Base:0x%x, Offset: 0x%x, val: 0x%x, APB: %d\n, Index: 0x%x\n",
>> +				   entry->base, entry->offset, entry->write_val, entry->apb_bus,
>> +				   index);
>> +			break;
>> +		case DCC_READ_TYPE:
>> +			seq_printf(m, "R Base:0x%x, Offset: 0x%x, len: 0x%x, APB: %d\n, Index: 0x%x\n",
>> +				   entry->base, entry->offset, entry->len, entry->apb_bus, index);
>> +		}
>> +	}
>> +	mutex_unlock(&drvdata->mutex);
>> +	return 0;
>> +}
>> +
>> +static int config_open(struct inode *inode, struct file *file)
>> +{
>> +	struct dcc_drvdata *drvdata = inode->i_private;
>> +
>> +	return single_open(file, config_show, drvdata);
>> +}
>> +
>> +static ssize_t config_write(struct file *filp,
>> +			    const char __user *user_buf, size_t count,
>> +			    loff_t *ppos)
>> +{
>> +	int ret, curr_list;
>> +	char *token, buf[50];
>> +	char *bufp = buf;
>> +	char *delim = " ";
>> +	struct dcc_drvdata *drvdata = filp->private_data;
>> +
>> +	if (count > sizeof(buf) || count == 0)
>> +		return -EINVAL;
>> +
>> +	ret = copy_from_user(buf, user_buf, count);
>> +	if (ret)
>> +		return -EFAULT;
>> +
>> +	curr_list = dcc_filp_curr_list(filp);
>> +	if (curr_list < 0)
>> +		return curr_list;
>> +
>> +	if (buf[count - 1] == '\n')
>> +		buf[count - 1] = '\0';
>> +	else
>> +		return -EINVAL;
>> +
>> +	token = strsep(&bufp, delim);
>> +
>> +	if (!strcmp("R", token)) {
>> +		ret = dcc_config_add_read(drvdata, bufp, curr_list);
>> +	} else if (!strcmp("W", token)) {
>> +		ret = dcc_config_add_write(drvdata, bufp, curr_list);
>> +	} else if (!strcmp("RW", token)) {
>> +		ret = dcc_config_add_read_write(drvdata, bufp, curr_list);
>> +	} else if (!strcmp("L", token)) {
>> +		ret = dcc_config_add_loop(drvdata, bufp, curr_list);
>> +	} else {
>> +		dev_err(drvdata->dev, "%s is not a correct input\n", token);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations config_fops = {
>> +	.open = config_open,
>> +	.read = seq_read,
>> +	.write = config_write,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +static void dcc_delete_debug_dir(struct dcc_drvdata *drvdata)
>> +{
>> +	 debugfs_remove_recursive(drvdata->dbg_dir);
>> +};
>> +
>> +static void dcc_create_debug_dir(struct dcc_drvdata *drvdata)
>> +{
>> +	int i;
>> +	char list_num[10];
>> +	struct dentry *dcc_dev, *list;
>> +	struct device *dev = drvdata->dev;
>> +
>> +	drvdata->dbg_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
>> +	dcc_dev = debugfs_create_dir(dev_name(dev), drvdata->dbg_dir);
>> +
>> +	for (i = 0; i <= drvdata->nr_link_list; i++) {
>> +		sprintf(list_num, "%d", i);
>> +		list = debugfs_create_dir(list_num, dcc_dev);
>> +		debugfs_create_file("enable", 0600, list, drvdata, &enable_fops);
>> +		debugfs_create_file("config", 0600, list, drvdata, &config_fops);
>> +	}
>> +
>> +	debugfs_create_file("trigger", 0200, drvdata->dbg_dir, drvdata, &trigger_fops);
>> +	debugfs_create_file("ready", 0400, drvdata->dbg_dir, drvdata, &ready_fops);
>> +	debugfs_create_file("config_reset", 0200, drvdata->dbg_dir,
>> +			    drvdata, &config_reset_fops);
>> +}
>> +
>> +static ssize_t dcc_sram_read(struct file *file, char __user *data,
>> +			     size_t len, loff_t *ppos)
>> +{
>> +	unsigned char *buf;
>> +	struct dcc_drvdata *drvdata;
>> +
>> +	drvdata = container_of(file->private_data, struct dcc_drvdata,
>> +			       sram_dev);
>> +
>> +	/* EOF check */
>> +	if (*ppos >= drvdata->ram_size)
>> +		return 0;
>> +
>> +	if ((*ppos + len) > drvdata->ram_size)
>> +		len = (drvdata->ram_size - *ppos);
>> +
>> +	buf = kzalloc(len, GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	memcpy_fromio(buf, drvdata->ram_base + *ppos, len);
>> +
>> +	if (copy_to_user(data, buf, len)) {
>> +		kfree(buf);
>> +		return -EFAULT;
>> +	}
>> +
>> +	*ppos += len;
>> +
>> +	kfree(buf);
>> +
>> +	return len;
>> +}
>> +
>> +static const struct file_operations dcc_sram_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.read		= dcc_sram_read,
>> +	.llseek		= no_llseek,
>> +};
>> +
>> +static int dcc_sram_dev_init(struct dcc_drvdata *drvdata)
>> +{
>> +	drvdata->sram_dev.minor = MISC_DYNAMIC_MINOR;
>> +	drvdata->sram_dev.name = "dcc_sram";
>> +	drvdata->sram_dev.fops = &dcc_sram_fops;
>> +
>> +	return misc_register(&drvdata->sram_dev);
>> +}
>> +
>> +static void dcc_sram_dev_exit(struct dcc_drvdata *drvdata)
>> +{
>> +	misc_deregister(&drvdata->sram_dev);
>> +}
>> +
>> +static int dcc_probe(struct platform_device *pdev)
>> +{
>> +	u32 val;
>> +	int ret = 0, i;
>> +	struct device *dev = &pdev->dev;
>> +	struct dcc_drvdata *drvdata;
>> +	struct resource *res;
>> +
>> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +	if (!drvdata)
>> +		return -ENOMEM;
>> +
>> +	drvdata->dev = &pdev->dev;
>> +	platform_set_drvdata(pdev, drvdata);
>> +
>> +	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(drvdata->base))
>> +		return PTR_ERR(drvdata->base);
>> +
>> +	drvdata->ram_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
>> +	if (IS_ERR(drvdata->ram_base))
>> +		return PTR_ERR(drvdata->ram_base);
>> +
>> +	drvdata->ram_size = resource_size(res);
>> +
>> +	drvdata->ram_offset = (size_t)of_device_get_match_data(&pdev->dev);
>> +
>> +	val = readl(drvdata->base + DCC_HW_INFO);
>> +
>> +	if (FIELD_GET(DCC_VER_INFO_MASK, val)) {
>> +		drvdata->mem_map_ver = 3;
>> +		drvdata->nr_link_list = readl(drvdata->base + DCC_LL_NUM_INFO);
>> +		if (!drvdata->nr_link_list)
>> +			return	-EINVAL;
>> +	} else if ((val & DCC_VER_MASK2) == DCC_VER_MASK2) {
>> +		drvdata->mem_map_ver = 2;
>> +		drvdata->nr_link_list = readl(drvdata->base + DCC_LL_NUM_INFO);
>> +		if (!drvdata->nr_link_list)
>> +			return	-EINVAL;
>> +	} else {
>> +		drvdata->mem_map_ver = 1;
>> +		drvdata->nr_link_list = DCC_MAX_LINK_LIST;
>> +	}
>> +
>> +	/* Either set the fixed loop offset or calculate
>> +	 * it from the total number of words in dcc_sram.
>> +	 * Max consecutive addresses dcc can loop is
>> +	 * equivalent to the words in dcc_sram.
>> +	 */
>> +	if (val & DCC_LOOP_OFFSET_MASK)
>> +		drvdata->loop_shift = DCC_FIX_LOOP_OFFSET;
>> +	else
>> +		drvdata->loop_shift = get_bitmask_order((drvdata->ram_offset +
>> +					drvdata->ram_size) / DCC_SRAM_WORD_LENGTH - 1);
>> +
>> +	mutex_init(&drvdata->mutex);
>> +
>> +	drvdata->enable_bitmap = devm_kcalloc(dev, BITS_TO_LONGS(drvdata->nr_link_list),
>> +					      sizeof(*drvdata->enable_bitmap), GFP_KERNEL);
>> +	if (!drvdata->enable_bitmap)
>> +		return -ENOMEM;
>> +
>> +	drvdata->cfg_head = devm_kcalloc(dev, drvdata->nr_link_list,
>> +					 sizeof(*drvdata->cfg_head), GFP_KERNEL);
>> +	if (!drvdata->cfg_head)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < drvdata->nr_link_list; i++)
>> +		INIT_LIST_HEAD(&drvdata->cfg_head[i]);
>> +
>> +	ret = dcc_sram_dev_init(drvdata);
>> +	if (ret) {
>> +		dev_err(drvdata->dev, "DCC: sram node not registered.\n");
>> +		return ret;
>> +	}
>> +
>> +	dcc_create_debug_dir(drvdata);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dcc_remove(struct platform_device *pdev)
>> +{
>> +	struct dcc_drvdata *drvdata = platform_get_drvdata(pdev);
>> +
>> +	dcc_delete_debug_dir(drvdata);
>> +	dcc_sram_dev_exit(drvdata);
>> +	dcc_config_reset(drvdata);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id dcc_match_table[] = {
>> +	{ .compatible = "qcom,sc7180-dcc", .data = (void *)0x6000 },
>> +	{ .compatible = "qcom,sc7280-dcc", .data = (void *)0x12000 },
>> +	{ .compatible = "qcom,sdm845-dcc", .data = (void *)0x6000 },
>> +	{ .compatible = "qcom,sm8150-dcc", .data = (void *)0x5000 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, dcc_match_table);
>> +
>> +static struct platform_driver dcc_driver = {
>> +	.probe = dcc_probe,
>> +	.remove	= dcc_remove,
>> +	.driver	= {
>> +		.name = "qcom-dcc",
>> +		.of_match_table	= dcc_match_table,
>> +	},
>> +};
>> +
>> +module_platform_driver(dcc_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm Technologies Inc. DCC driver");
>> +
>> -- 
>> 2.17.1
>>
