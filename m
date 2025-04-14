Return-Path: <linux-arm-msm+bounces-54197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE3BA87BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 972921893B10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087192641C6;
	Mon, 14 Apr 2025 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETFusTqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17047262D29
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623338; cv=none; b=mtC/TVoSFqolhI4V2d1pt1ML0KZavqzPh0EldSKnEgJ+UW1dbxKeQErVYV+Ap0RdrEzcVod/o/nZNaBKKk3kq9ovrw9ErS/gQA1HJABhBdkZadRXPI/y6sV5xZahUGQepIaLdtpoaaww/a9kl4Updplmsw61/09Cs7dvHJhzP/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623338; c=relaxed/simple;
	bh=Fnur70WNELba5zVucNVKGR3qYqggfCKkRJrnzhjNphs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLUWZ6EkpXOfa91dF8jirOQu+dV6OhFA1YBvxl7UH8qNysw09TLOgkAiyEaBZq3FxJY2EjASjJFns7ze7CJ6Q7uIrxwS0d8byy+ofooU6Gr3/ZAUBCUZAUmfJDHSM/dWn1+atr9r4/Fd+5eE3G9X7skb/tsZc0f0biVtQaOzr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETFusTqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99t2r029074
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g973tB+zRWXM9v6TYAdyBhcdQpxVzfrnZidLeCXh1FY=; b=ETFusTqNjdq4ABEC
	WAKtgLVwVAtkZgejfF2NJRNMxFe+9lI/NCRVtl8WmFl2PreOF4aNJN+WaANE7sQS
	mpIBParMdhMQl2lD33EkDhamQmF/5qUxZhsduus/IW+KIcGeyxEhjnhQw1zM66Pk
	YT2LExOgMpjKGSd6Y0zd86xUpBsYaXNOomNfVbaL4dUq9huIHUv7907/DEICpae+
	SOzrwevx5XfzbvmPxUdbNpvZkdVOOR93VAbx+KCYrumMy0tF1HZS96yvgJP1gJ4Q
	coD8QTyz2K3WZnR6uqtLxIi9uneDx4jifuzkGofeHBg7q4yKphWVmK8ZmYGwSMTV
	PInTHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs143j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 09:35:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4767b8e990fso2800981cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 02:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623335; x=1745228135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g973tB+zRWXM9v6TYAdyBhcdQpxVzfrnZidLeCXh1FY=;
        b=TGXG0ID8y8hWLE3bis/qXJr8SEAc5qKoOq+hhy+/y+NMTIRR5no2G/eBQ7OcFoT8Gx
         MOi4Y+a1bEbrul6duOchK95y6ACuAOniijJ1yRXHGbce9bHS07u3ePom/DPUI4L0E7HJ
         +btMDaqH0pR8la07FjRriG6HBtfMsoe9rSMuJ3YPWsFZC94i0dMJTkld5KLY+yz+aT3b
         DTZyIrMhe/R8mIoLetXGdXSeqmZZlvOK0FgPAWyh4ajBjwvuPYv586TiGkC8gZj9wztV
         ATUB9k+pFB70vdw7lDZlCIYy6T+ZIL3JVw2t3XurMHVBEkD/QArEY7WDRd1MMIx3+dlU
         cJdg==
X-Forwarded-Encrypted: i=1; AJvYcCU2/dP2GKbzlef8mBptxMpeHLjH1P/T5FzDi6zCS+RosYk4LI4bhMX0j5GnjvvA+ueIuh4O45McWXazqtDt@vger.kernel.org
X-Gm-Message-State: AOJu0YwdcDIbsxKLnQLviZOkEOXqBfSCaVwJUxSDQYb7n0Oftsx7YWE2
	96HWMKkOmAOLfrLgtgyNJhMUftUuvWgOmprJ1oRCGLYkBB4guQpkbkmQGjaty9Yj8jQJxKHxFCW
	plqg+rWs4y8e5fp58XrtH7BO/7SCSkCYOACq+9oJzqIJ2umLTIX+LsDVnCqK3zSyv
X-Gm-Gg: ASbGncvIAA5q+PXSqx6/za8NQNtun5Eat5yb5lUhJqrzoQ3fhPMFGJVBcaES9mIoVke
	Sg86ESg5+1fcVfdZUUEQa5ALE8CjDYVfYR+Dpb37kz+wmvnEmMK4zO/u0PDb0ycBiCYDaBh8Jvh
	g4NDjnSbyR77U1yzWqMWvt0z84pLlKYKZZg/PgK+XNXLy8aPxbRlwBPYEeWBniNZUw6TVgxXZmW
	CzLBQIg38REwJuVjebBPiYiCqduvr6zcuQgD6n62pWH9xkUcIFpMLS0XrP0kDC7o1pNz78gn5Ve
	2KDo37Gf+OsO27DQWLKaQQj/ZMJvuzs0V4v4XAWk9xvgyP4b0VTHJJBa/iBLuX9x/w==
X-Received: by 2002:ac8:598c:0:b0:475:6af:9fc4 with SMTP id d75a77b69052e-47978fdeac0mr58693061cf.12.1744623334638;
        Mon, 14 Apr 2025 02:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR7OOhzKBYdqfK0VGxmo2VmGX5JzFnkfE/jbhggTTeP0zQwuMsoYljOwnrtUWZc3+eFjP26Q==
X-Received: by 2002:ac8:598c:0:b0:475:6af:9fc4 with SMTP id d75a77b69052e-47978fdeac0mr58692871cf.12.1744623334094;
        Mon, 14 Apr 2025 02:35:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06a2c3sm4643959a12.40.2025.04.14.02.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:35:33 -0700 (PDT)
Message-ID: <91babf0d-d461-4a28-bc1e-54711a2094d1@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcd6e7 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=p_wr6ghfAju7psezmTgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tSGDNhfw7t2y3NxLW2Yy8dKZw8rMGigy
X-Proofpoint-ORIG-GUID: tSGDNhfw7t2y3NxLW2Yy8dKZw8rMGigy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=880 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140068

On 4/14/25 7:51 AM, Mukesh Kumar Savaliya wrote:
> Thanks Konrad for detailed review.
> 
> 
> On 4/12/2025 4:45 AM, Konrad Dybcio wrote:
>> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---

[...]

>>> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
>>> +                            *master)
>>> +{
>>> +    return container_of(master, struct geni_i3c_dev, ctrlr);
>>> +}
>>
>> #define instead
>>
> i see all i3c vendors are using same definitions, so for now can we keep it similar way if it's minor ?

potayto/potahto, let's keep it as is


>>> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct geni_i3c_xfer_params *xfer)
>>> +{
>>> +    bool is_write = gi3c->cur_is_write;
>>> +    dma_addr_t tx_dma = 0, rx_dma = 0;
>>> +    unsigned long time_remaining;
>>> +    u32 len = gi3c->cur_len;
>>> +    int ret;
>>> +
>>> +    geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +
>>> +    gi3c->err = 0;
>>> +    gi3c->cur_idx = 0;
>>> +
>>> +    if (!is_write) {
>>
>> Nit: if (is_write) {} .. else {} is more natural> +        dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
> Sure, Reversed with natural and positive check.
> I didn't get about debug log suggestion. Do you want to optimize it to one for both if/else condition ?

Oh no that's me fighting with a bug in thunderbird adding random newlines
to my message.. I only meant the if-condition

>>> +            xfer->m_cmd, xfer->m_param, len);
>>> +        writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
>>> +        geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>>> +        if (xfer->mode == GENI_SE_DMA) {
>>> +            ret = geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &rx_dma);
>>> +            if (ret) {
>> Why would it fail? And why should we fall back silently to FIFO mode then?
>>
> DMA mapping can fail OR input validation can also fail. So we want to continue with FIFO mode.


>>> +                xfer->mode = GENI_SE_FIFO;
>>> +                geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +            }
>>> +        }
>>> +    } else {
>>> +        dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
>>> +            xfer->m_cmd, xfer->m_param, len);
>>> +
>>> +        writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
>>> +        geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>>> +
>>> +        if (xfer->mode == GENI_SE_DMA) {
>>> +            ret = geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &tx_dma);
>>> +            if (ret) {
>>> +                xfer->mode = GENI_SE_FIFO;
>>> +                geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +            }
>>> +        }
>>> +
>>> +        if (xfer->mode == GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
>>> +            writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>>> +    }
>>> +
>>> +    time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>>> +    if (!time_remaining) {
>>> +        unsigned long flags;
>>> +
>>> +        dev_dbg(gi3c->se.dev, "Timeout completing FIFO transfer\n");
>>
>> Can it not be DMA mode here too?
>>
> Good find, it's common timeout error. Removed FIFO word.
>> [...]
>>
>>> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
>>> +{
>>> +    u8 last_dyn_addr = 0;
>>> +    int ret;
>>> +
>>> +    while (1) {
>>> +        u8 rx_buf[8], tx_buf[8];
>>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>>> +        struct i3c_device_info info = { 0 };
>>> +        struct i3c_dev_desc *i3cdev;
>>> +        bool new_device = true;
>>> +        u64 pid;
>>> +        u8 bcr, dcr, addr;
>>> +
>>> +        xfer.m_cmd = I2C_READ;
>>> +        xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
>>> +        ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
>>> +        if (ret)
>>> +            break;
>>> +
>>> +        dcr = rx_buf[7];
>>> +        bcr = rx_buf[6];
>>> +        pid = ((u64)rx_buf[0] << 40) |
>>> +            ((u64)rx_buf[1] << 32) |
>>> +            ((u64)rx_buf[2] << 24) |
>>> +            ((u64)rx_buf[3] << 16) |
>>> +            ((u64)rx_buf[4] <<  8) |
>>> +            ((u64)rx_buf[5]);
>>
>> FIELD_PREP + GENMASK, please
>>
> Sure, Done.
>>> +
>>> +        i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
>>> +            i3c_device_get_info(i3cdev->dev, &info);
>>> +            if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
>>> +                new_device = false;
>>> +                addr = (info.dyn_addr) ? info.dyn_addr :
>>
>> addr = info.dyn_addr ?: info.static_addr;
>>
> Yes, Done.
>>> +                    info.static_addr;
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        if (new_device) {
>>> +            ret = i3c_master_get_free_addr(&gi3c->ctrlr, last_dyn_addr + 1);
>>> +            if (ret < 0)
>>> +                break;
>>> +            addr = (u8)ret;
>>> +            last_dyn_addr = (u8)ret;
>>
>> nit: while logically the same, last_dyn_addr = addr would make sense here
>>
> Sure, Done.
>>> +            set_new_addr_slot(gi3c->newaddrslots, addr);
>>> +        }
>>> +
>>
>> suppose addr=0x38
>>
>>> +        tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
>>
>> tx_buf[0] = (0x38 & 0x7f) << 1 = 0x38<<1 = 0x70 = 0b1110000
>>
>>> +        tx_buf[0] |= ~(hweight8(addr & I3C_ADDR_MASK) & 1);
>>
>> 0x70 | ~(hweight8(0x70 & 0x7f) & 1) = 0x70 | ~(3 & 1) = 0x70 | ~BIT(0) = 0xfe
>>
>> is that the intended result?
>>
> Yes, thats right.
> It can have either 0xfe OR 0xff.
> 
> Mainly for error detection purpose. This parity bit in tx_buf[0] is set correctly based on nos set bits in the Masked addr is odd or even.
> I have simplified it using parity8().

OK, nice

>>> +
>>> +        xfer.m_cmd = I2C_WRITE;
>>> +        xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
>>> +
>>> +        ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +}
>>> +
>>> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>>> +                    struct i3c_ccc_cmd *cmd)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    int i, ret;
>>> +
>>> +    if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
>>> +        return -EINVAL;
>>> +
>>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>>> +    for (i = 0; i < cmd->ndests; i++) {
>>> +        int stall = (i < (cmd->ndests - 1)) ||
>>> +            (cmd->id == I3C_CCC_ENTDAA);
>>
>> bool
>>
> Sorry, Didn't get it where to keep bool ?

I blame thunderbird again, I can't find what I meant, it's probably
not super important

Konrad

