Return-Path: <linux-arm-msm+bounces-57177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308AAAE5A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB8443A5697
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF7B28B7E4;
	Wed,  7 May 2025 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F4aWk0LH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D722035280;
	Wed,  7 May 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633334; cv=none; b=uVUe1vw/AwTCLfzIPouA8bjBBS9KouxBE6iPevzUUJennXaicx+MipvCUgTrcZllCsNbg9AtIxY8D4zZ4u7iP/PS8Dgw229W7buFJi2l8IoaoA73u/SOfz4eGGOeWz0/8SApUVh1834E+MPQfPvkXyHYHFRFEVqnjlS1kQldJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633334; c=relaxed/simple;
	bh=TGO8fIjcUwXjKvCQK1PUHJwE048zpvsHTREz1tT9jJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sbOfQM+YLjYJy8wUNVuzLVyquQrnM4vPdNxOKiH9uCPLRh2SxE3sQfHyq5KSrJRg2aeCRPvmd7D+QGM2TUk47feN1gYEzwqkP9VvNrE7XYA2vThQl8HVUFgpDtgnpTZtmC8uuAsjPD8zJ2NJARC4pyHu2y66UHddOaZUfXd516Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F4aWk0LH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AqrCv017086;
	Wed, 7 May 2025 15:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	we9mjbQGr3/yoQgIcchWmCbRSExxQz+ioBqfmKLtubs=; b=F4aWk0LH45ThYW1N
	vVRQb3/5TV8pCiL3tGYBte+8/KqucnDMfVDWxjp58xTFvDcxzMj+Elco3tYY5F8f
	ZA7kXC1lHv1+oUVaoWn5deMefnse6TyA/nikhG5XI5o7pDWgebY/LnQdbTDdFHeQ
	Yd6x4ykLs6XrkyZYHN23lAnbiG2HE5MkCjB/03dGY3s3xwpPSLm50EOiI4a9vmaT
	aLnqKQE8yJUoa7XpTxxbLWN+qw05VcwVtA21HYV8VjAfUxuRqUGWpCUR3IPTV/gD
	irRDRqEu/Rwq5oIAPfThqUIUgVD5KJxw6XL9oM7lHr2LWH3aUQCd64m0/lwVPqKV
	Kej7QA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u46d2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:55:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547FtHZI015817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 15:55:17 GMT
Received: from [10.216.28.228] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 08:55:13 -0700
Message-ID: <dbd50a7f-53ed-45d5-9973-2e2512b843e3@quicinc.com>
Date: Wed, 7 May 2025 21:25:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v5 2/3] :i3c: master: Add Qualcomm I3C
 controller driver
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
References: <20250420081530.2708238-1-quic_msavaliy@quicinc.com>
 <20250420081530.2708238-3-quic_msavaliy@quicinc.com>
 <06a94366-cc81-4127-9edc-501e696301b0@oracle.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <06a94366-cc81-4127-9edc-501e696301b0@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681b8266 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=YnEaqj5L3kPtKJmEgQUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kAKVihoOtwNx_5ckhFzgDuJ9iPK36wDX
X-Proofpoint-ORIG-GUID: kAKVihoOtwNx_5ckhFzgDuJ9iPK36wDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OSBTYWx0ZWRfX9uX5Kv4GiuOc
 aL0gF9Fh35rg9qe13UMDsLe5nrASAFElXwmCdsyQcNGBzLuL9ZDOhQ+phCCIS6jKwt92t3ZKJeb
 JYK2JJi4Z5DJ3mFZ2NIiM5dPBxMjRHahvOL96pDTe7FbDthuqHJlN7AJqBz68rASn0D5vHXYsma
 DYmg911Db09ybUHUP1xoHBlCdiSkr5hAH/yveRxC7+0huLQIB8DdrU+zfxd6ncAw+fyfgpyNdtK
 P72fTFvKvX5fahFXHd1DUxHNdEPx9/dpPTNjydUMhXCiQZZ9rYeV/1L41lqyZU3k1efTtfG95gn
 s3/Usy90A7uMs+j+vn6fg3IyszHzOwxfH1Fdpx2J7ZGVaTB7fucydBey75K4ZbraqSfxZEyPgVA
 S+ug5Jz0HHFCGW1Nwhsl/0XvbeXkxJYWu1tIvymtLvIFTScW2EL2luFSB4RHec8TILkwmv9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1011 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070149


Thanks Alok ! Since there are no other major comments except the 
cosmetic changes, will address your comments and make all the changes 
suggested in final Patch V6.

On 4/21/2025 1:07 AM, ALOK TIWARI wrote:
> Hi Mukesh,
> 
> On 20-04-2025 13:45, Mukesh Kumar Savaliya wrote:
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
> [clip]
>> +};
>> +
>> +/*
>> + * Hardware uses the underlying formula to calculate time periods of
>> + * SCL clock cycle. Firmware uses some additional cycles excluded 
>> from the
>> + * below formula and it is confirmed that the time periods are within
>> + * specification limits.
>> + *
>> + * time of high period of I2C SCL:
>> + *         i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
>> + * time of low period of I2C SCL:
>> + *         i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
>> + * time of full period of I2C SCL:
>> + *         i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
>> + * time of high period of I3C SCL:
>> + *         i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
>> + * time of full period of I3C SCL:
>> + *         i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
>> + * clk_freq_out = t / t_cycle
>> + */
> 
> Here is a polished version, if you'd like. Otherwise, feel free to 
> ignore it
> /*
>   * The hardware uses the following formulas to calculate the time periods
>   * of the SCL clock cycle. The firmware adds a few extra cycles that 
> are not
>   * included in the formulas below. It has been verified that the resulting
>   * timings remain within the I2C/I3C specification limits.
>   *
>   * I2C SCL high period:
>   *     i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
>   *
>   * I2C SCL low period:
>   *     i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
>   *
>   * I2C SCL full cycle:
>   *     i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
>   *
>   * I3C SCL high period:
>   *     i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
>   *
>   * I3C SCL full cycle:
>   *     i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
>   *
>   * Output clock frequency:
>   *     clk_freq_out = t / t_cycle
>   */
> 
Sure, will make the changes.
>> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
>> +    {
>> +        .clk_freq_out = 100 * HZ_PER_KHZ,
>> +        .clk_src_freq = 19200 * HZ_PER_KHZ,
>> +        .clk_div = 1,
>> +        .i2c_t_high_cnt = 76,
>> +        .i2c_t_low_cnt = 90,
>> +        .i3c_t_high_cnt = 7,
>> +        .i3c_t_cycle_cnt = 8,
>> +        .i2c_t_cycle_cnt = 192,
>> +    },
> [clip]
>> +
>> +static int i3c_geni_execute_read_command(struct geni_i3c_dev *gi3c,
>> +                     struct geni_i3c_xfer_params *xfer, u8 *buf, u32 
>> len)
>> +{
>> +    gi3c->cur_is_write = false;
>> +    gi3c->cur_buf = buf;
>> +    gi3c->cur_len = len;
> 
> a '\n' before return
> 
Done
>> +    return _i3c_geni_execute_command(gi3c, xfer);
>> +}
>> +
>> +static int i3c_geni_execute_write_command(struct geni_i3c_dev *gi3c,
>> +                      struct geni_i3c_xfer_params *xfer, u8 *buf, u32 
>> len)
>> +{
>> +    gi3c->cur_is_write = true;
>> +    gi3c->cur_buf = buf;
>> +    gi3c->cur_len = len;
> 
> a '\n' before return
> 
done
>> +    return _i3c_geni_execute_command(gi3c, xfer);
>> +}
>> +
>> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
>> +{
>> +    u8 last_dyn_addr = 0;
>> +    int ret;
>> +
>> +    while (1) {
>> +        u8 rx_buf[8], tx_buf[8];
>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>> +        struct i3c_device_info info = { 0 };
>> +        struct i3c_dev_desc *i3cdev;
>> +        bool new_device = true;
>> +        u64 pid;
>> +        u8 bcr, dcr, addr;
>> +
>> +        xfer.m_cmd = I2C_READ;
>> +        xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
>> +        ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
>> +        if (ret)
>> +            break;
>> +
>> +        dcr = FIELD_PREP(GENMASK(7, 0), rx_buf[7]);
>> +        bcr = FIELD_PREP(GENMASK(7, 0), rx_buf[6]);
>> +        pid = FIELD_PREP(GENMASK(47, 40), (u64)rx_buf[0]) |
>> +            FIELD_PREP(GENMASK(39, 32), (u64)rx_buf[1]) |
>> +            FIELD_PREP(GENMASK(31, 24), (u64)rx_buf[2]) |
>> +            FIELD_PREP(GENMASK(23, 16), (u64)rx_buf[3]) |
>> +            FIELD_PREP(GENMASK(15, 8), (u64)rx_buf[4]) |
>> +            FIELD_PREP(GENMASK(7, 0), (u64)rx_buf[5]);
>> +
>> +        i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
>> +            i3c_device_get_info(i3cdev->dev, &info);
>> +            if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
>> +                new_device = false;
>> +                addr = info.dyn_addr ? : info.static_addr;
>> +                break;
>> +            }
>> +        }
>> +
>> +        if (new_device) {
>> +            ret = i3c_master_get_free_addr(&gi3c->ctrlr, 
>> last_dyn_addr + 1);
>> +            if (ret < 0)
>> +                break;
>> +            addr = (u8)ret;
>> +            last_dyn_addr = addr;
>> +            set_new_addr_slot(gi3c->newaddrslots, addr);
>> +        }
>> +
>> +        /* Set Parity bit at BIT(7) */
>> +        tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
>> +        tx_buf[0] |= parity8(addr & I3C_ADDR_MASK);
>> +
>> +        xfer.m_cmd = I2C_WRITE;
>> +        xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
>> +
>> +        ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
>> +        if (ret)
>> +            break;
>> +    }
>> +}
>> +
>> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>> +                    struct i3c_ccc_cmd *cmd)
>> +{
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    int i, ret;
>> +
>> +    if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
>> +        return -EINVAL;
>> +
>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>> +    for (i = 0; i < cmd->ndests; i++) {
>> +        int stall = (i < (cmd->ndests - 1)) ||
>> +            (cmd->id == I3C_CCC_ENTDAA);
>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>> +
>> +        xfer.m_param  = (stall ? STOP_STRETCH : 0);
> 
> remove extra ' ' before =
sure
> 
>> +        xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
>> +        xfer.m_param |= IBI_NACK_TBL_CTRL;
>> +        if (cmd->id & I3C_CCC_DIRECT) {
>> +            xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, cmd- 
>> >dests[i].addr);
>> +            if (cmd->rnw) {
>> +                if (i == 0)
>> +                    xfer.m_cmd = I3C_DIRECT_CCC_READ;
>> +                else
>> +                    xfer.m_cmd = I3C_PRIVATE_READ;
>> +            } else {
>> +                if (i == 0)
>> +                    xfer.m_cmd =
>> +                       (cmd->dests[i].payload.len > 0) ?
>> +                        I3C_DIRECT_CCC_WRITE :
>> +                        I3C_DIRECT_CCC_ADDR_ONLY;
>> +                else
>> +                    xfer.m_cmd = I3C_PRIVATE_WRITE;
>> +            }
>> +        } else {
>> +            if (cmd->dests[i].payload.len > 0)
>> +                xfer.m_cmd = I3C_BCAST_CCC_WRITE;
>> +            else
>> +                xfer.m_cmd = I3C_BCAST_CCC_ADDR_ONLY;
>> +        }
>> +
>> +        if (i == 0)
>> +            xfer.m_param |= USE_7E;
>> +
>> +        if (cmd->rnw)
>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer,
>> +                                cmd->dests[i].payload.data,
>> +                                cmd->dests[i].payload.len);
>> +        else
>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer,
>> +                                 cmd->dests[i].payload.data,
>> +                                 cmd->dests[i].payload.len);
>> +        if (ret)
>> +            break;
>> +
>> +        if (cmd->id == I3C_CCC_ENTDAA)
>> +            geni_i3c_perform_daa(gi3c);
>> +    }
>> +
>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
> 
> a '\n' before return
> 
Done
>> +    return ret;
>> +}
>> +
>> +static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, 
>> struct i3c_priv_xfer *xfers,
>> +                      int nxfers)
>> +{
>> +    struct i3c_master_controller *m = i3c_dev_get_master(dev);
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    bool use_7e = false;
>> +    int i, ret;
>> +
>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
>> +
>> +    for (i = 0; i < nxfers; i++) {
>> +        bool stall = (i < (nxfers - 1));
>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>> +
>> +        xfer.m_param  = (stall ? STOP_STRETCH : 0);
> 
> remove extra ' ' before =
> 
Done
>> +        xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
>> +        xfer.m_param |= (use_7e) ? USE_7E : 0;
>> +
>> +        /* use_7e = true only for last transfer */
>> +        use_7e = (i == nxfers - 1);
>> +
>> +        if (xfers[i].rnw) {
>> +            xfer.m_cmd = I3C_PRIVATE_READ;
>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer, (u8 
>> *)xfers[i].data.in,
>> +                                xfers[i].len);
>> +        } else {
>> +            xfer.m_cmd = I3C_PRIVATE_WRITE;
>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer, (u8 
>> *)xfers[i].data.out,
>> +                                 xfers[i].len);
>> +        }
>> +
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    dev_dbg(gi3c->se.dev, "i3c priv: txn ret:%d\n", ret);
>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
> 
> a '\n' before return
> 
Done
>> +    return ret;
>> +}
>> +
>> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct 
>> i2c_msg *msgs, int num)
>> +{
>> +    struct i3c_master_controller *m = i2c_dev_get_master(dev);
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    int i, ret;
>> +
>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
>> +
>> +    for (i = 0; i < num; i++) {
>> +        struct geni_i3c_xfer_params xfer;
>> +
>> +        xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : 
>> I2C_WRITE;
>> +        xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
>> +        xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
>> +        xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
> 
> remove extra ' ' before =
> 
>> +        if (msgs[i].flags & I2C_M_RD)
>> +            ret = i3c_geni_execute_read_command(gi3c, &xfer, 
>> msgs[i].buf, msgs[i].len);
>> +        else
>> +            ret = i3c_geni_execute_write_command(gi3c, &xfer, 
>> msgs[i].buf, msgs[i].len);
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
> 
> a '\n' before return
> 
Done
>> +    return ret;
>> +}
>> +
>> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
>> +{
>> +    struct geni_i3c_i2c_dev_data *data;
>> +
>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    i2c_dev_set_master_data(dev, data);
> 
> a '\n' before return
> 
Done
>> +    return 0;
>> +}
>> +
>> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>> +{
>> +    struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
>> +
>> +    i2c_dev_set_master_data(dev, NULL);
>> +    kfree(data);
>> +}
>> +
>> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>> +{
>> +    struct geni_i3c_i2c_dev_data *data;
>> +
>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    i3c_dev_set_master_data(dev, data);
> 
> a '\n' before return
> 
Done
>> +    return 0;
>> +}
>> +
>> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>> +{
>> +    struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>> +
>> +    i3c_dev_set_master_data(dev, NULL);
>> +    kfree(data);
>> +}
>> +
>> +static int geni_i3c_master_do_daa(struct i3c_master_controller *m)
>> +{
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    u8 addr;
>> +    int ret;
>> +
>> +    ret = i3c_master_entdaa_locked(m);
>> +    if (ret && ret != I3C_ERROR_M2)
>> +        return ret;
>> +
>> +    for (addr = 0; addr <= I3C_ADDR_MASK; addr++) {
>> +        if (is_new_addr_slot_set(gi3c->newaddrslots, addr)) {
>> +            clear_new_addr_slot(gi3c->newaddrslots, addr);
>> +            i3c_master_add_i3c_dev_locked(m, addr);
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
>> +{
>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>> +    struct i3c_bus *bus = i3c_master_get_bus(m);
>> +    struct i3c_device_info info = { };
>> +    int ret;
>> +
>> +    /* Get an address for the master. */
>> +    ret = i3c_master_get_free_addr(m, 0);
>> +    if (ret < 0)
>> +        dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", 
>> __func__, ret);
>> +
>> +    info.dyn_addr = ret;
>> +    info.dcr = I3C_DCR_GENERIC_DEVICE;
>> +    info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
>> +    info.pid = 0;
>> +
>> +    ret = geni_i3c_clk_map_idx(gi3c);
>> +    if (ret) {
>> +        dev_err(gi3c->se.dev,
>> +            "Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
>> +            gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
>> +        return ret; //This was missed in upstream : TBD
>> +    }
>> +
>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>> +
>> +    ret = i3c_master_set_info(&gi3c->ctrlr, &info);
>> +    i3c_geni_runtime_put_mutex_unlock(gi3c);
> 
> a '\n' before return
> 
Done
>> +    return ret;
>> +}
>> +
>> +static bool geni_i3c_master_supports_ccc_cmd(struct 
>> i3c_master_controller *m,
>> +                         const struct i3c_ccc_cmd *cmd)
>> +{
>> +    switch (cmd->id) {
>> +    case I3C_CCC_ENEC(true):
>> +        fallthrough;
>> +    case I3C_CCC_ENEC(false):
>> +        fallthrough;
>> +    case I3C_CCC_DISEC(true):
>> +        fallthrough;
>> +    case I3C_CCC_DISEC(false):
>> +        fallthrough;
>> +    case I3C_CCC_ENTAS(0, true):
>> +        fallthrough;
>> +    case I3C_CCC_ENTAS(0, false):
>> +        fallthrough;
>> +    case I3C_CCC_RSTDAA(true):
>> +        fallthrough;
>> +    case I3C_CCC_RSTDAA(false):
>> +        fallthrough;
>> +    case I3C_CCC_ENTDAA:
>> +        fallthrough;
>> +    case I3C_CCC_SETMWL(true):
>> +        fallthrough;
>> +    case I3C_CCC_SETMWL(false):
>> +        fallthrough;
>> +    case I3C_CCC_SETMRL(true):
>> +        fallthrough;
>> +    case I3C_CCC_SETMRL(false):
>> +        fallthrough;
>> +    case I3C_CCC_DEFSLVS:
>> +        fallthrough;
>> +    case I3C_CCC_SETDASA:
>> +        fallthrough;
>> +    case I3C_CCC_SETNEWDA:
>> +        fallthrough;
>> +    case I3C_CCC_GETMWL:
>> +        fallthrough;
>> +    case I3C_CCC_GETMRL:
>> +        fallthrough;
>> +    case I3C_CCC_GETPID:
>> +        fallthrough;
>> +    case I3C_CCC_GETBCR:
>> +        fallthrough;
>> +    case I3C_CCC_GETDCR:
>> +        fallthrough;
>> +    case I3C_CCC_GETSTATUS:
>> +        fallthrough;
>> +    case I3C_CCC_GETACCMST:
>> +        fallthrough;
>> +    case I3C_CCC_GETMXDS:
>> +        fallthrough;
>> +    case I3C_CCC_GETHDRCAP:
>> +        return true;
>> +
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
> [clip]
>> +
>> +static int geni_i3c_runtime_suspend(struct device *dev)
>> +{
>> +    struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
>> +
>> +    disable_irq(gi3c->irq);
>> +    geni_se_resources_off(&gi3c->se);
> 
> a '\n' before return
> 
Done
>> +    return 0;
>> +}
>> +
>> +static int geni_i3c_runtime_resume(struct device *dev)
>> +{
>> +    int ret;
>> +    struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
>> +
>> +    ret = geni_se_resources_on(&gi3c->se);
>> +    if (ret)
>> +        return ret;
>> +    enable_irq(gi3c->irq);
> 
> a '\n' before return
> 
Done
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops geni_i3c_pm_ops = {
>> +    SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, 
>> geni_i3c_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id geni_i3c_dt_match[] = {
>> +    { .compatible = "qcom,geni-i3c" },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, geni_i3c_dt_match);
>> +
>> +static struct platform_driver geni_i3c_master = {
>> +    .probe  = geni_i3c_probe,
> 
> remove extra ' ' before =
> 
Done
>> +    .remove = geni_i3c_remove,
>> +    .driver = {
>> +        .name = "geni_i3c",
>> +        .pm = &geni_i3c_pm_ops,
>> +        .of_match_table = geni_i3c_dt_match,
>> +    },
>> +};
>> +
>> +module_platform_driver(geni_i3c_master);
>> +
>> +MODULE_AUTHOR("Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>");
>> +MODULE_DESCRIPTION("Qualcomm I3C Controller Driver for GENI based QUP 
>> cores");
>> +MODULE_LICENSE("GPL");
> 
> 
> Thanks,
> Alok


