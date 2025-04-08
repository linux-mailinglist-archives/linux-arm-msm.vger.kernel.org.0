Return-Path: <linux-arm-msm+bounces-53542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA6A80C4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF07A885736
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043AF26ACB;
	Tue,  8 Apr 2025 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FjYe44Ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EFB3C00;
	Tue,  8 Apr 2025 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118648; cv=none; b=PLcGKsFLMorAxpFgrQxvl1TObjfh/HkRmYOj1G9bvtwQyxa4Ji7h6y8kOF9ZDVYZG46KyTMDg5PDEqI7UVVRjhdmHIHAEjLIssWDiruYA4d0mArdZHWTrBW45zO5tF6RWdxSCJlJ7DofrYlBeNiRhavr48QfAYQ8+I5tf6bRgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118648; c=relaxed/simple;
	bh=8p2aKg14H7urnqwKsQshBzxqCiU+l+98jWWvPKhQRzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BjvJmO/ok2J+k9apMAZ9IM7mZwplR1mro/PwTOOBpJu/Ni9wdg99wgtyc0Z+TRBc/GfcLVQ1RWqpfapQhCOaVhv+JP/VQL5HwJzdOnfhZJbLo3+9WxglpjUw6X/B5kiqKmoSsD5+8mQO+FzLmZV2oxBfD90xEo9U9FyneNGbbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FjYe44Ap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AwsjI029499;
	Tue, 8 Apr 2025 13:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JI/NYPWoPLCffAY6AOrvydJJmP8DWJQmVbV9RNb0sm4=; b=FjYe44ApXAxDFtFV
	LC1T2BJrFqpsuHb6lUtThbyWk9bzHmLQQyRAzKfy/Xalb/fn7HhPwcQznm+6+XRA
	ZbmYjvQiLsPmTG3bF48/ZpOjVlW4EWcbhqb19WQLDoRkU4FeCineZ+VYOJ6S3yra
	jZgtV5Mf1bU4BiQdiI/VYk0uMPchDdL3Y1si4U5gdXVfAMXI6NmSfVzlrkLF8QNi
	BlQRyatbQMIxQbW25P8pBrU8PXwju+HPDSZSY9uJH1R/61caw5urAx+m8dmwpIw1
	GrjBqnAycGHxtW/+LgVD6UAJEdoPUZ0eV/q6j0WjWSAbMOF/VqicB/4zb97kB72p
	NiAWwA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrfvy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 13:23:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538DNpS8018597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 13:23:51 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 06:23:45 -0700
Message-ID: <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
Date: Tue, 8 Apr 2025 18:53:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250404-provocative-mayfly-of-drama-eeddc1@shite>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uw0hJEbFUMpmWwZJU4Fx53EanhICSk1k
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f52369 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=_xb3sgvVoh_tyYpsJZkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uw0hJEbFUMpmWwZJU4Fx53EanhICSk1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080094

Thanks Krzysztof  !

On 4/4/2025 4:02 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 07:16:43PM GMT, Mukesh Kumar Savaliya wrote:
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
>>   drivers/i3c/master/Kconfig         |   13 +
>>   drivers/i3c/master/Makefile        |    1 +
>>   drivers/i3c/master/i3c-qcom-geni.c | 1099 ++++++++++++++++++++++++++++
>>   3 files changed, 1113 insertions(+)
>>   create mode 100644 drivers/i3c/master/i3c-qcom-geni.c
>>
>> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
>> index 77da199c7413..30b768df94c9 100644
>> --- a/drivers/i3c/master/Kconfig
>> +++ b/drivers/i3c/master/Kconfig
>> @@ -44,6 +44,19 @@ config SVC_I3C_MASTER
>>   	help
>>   	  Support for Silvaco I3C Dual-Role Master Controller.
>>   
>> +config I3C_QCOM_GENI
>> +	tristate "Qualcomm Technologies Inc.'s I3C controller driver"
>> +	depends on I3C
>> +	depends on QCOM_GENI_SE
>> +	help
>> +	  This driver supports QUPV3 GENI based I3C controller in master
>> +	  mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
>> +	  this option, support will be included for the built-in I3C interface
>> +	  on the Qualcomm Technologies Inc.s SoCs.
>> +
>> +	  This driver can also be built as a module.  If so, the module
>> +	  will be called i3c-qcom-geni.
>> +
>>   config MIPI_I3C_HCI
>>   	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>>   	depends on I3C
>> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
>> index 3e97960160bc..bc11eecd4692 100644
>> --- a/drivers/i3c/master/Makefile
>> +++ b/drivers/i3c/master/Makefile
>> @@ -4,3 +4,4 @@ obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>>   obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>>   obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>>   obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
>> +obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o
> 
> Did you just add entry to the end of file? No, don't break ordering.
> That's a standard rule for most subsystems.
> 
Yes, i just kept at the end. Sure, Let me reorder in alphabetical order.
> ...
> 
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
>> +		dm_rx_st & RX_RESET_DONE) {
>> +		complete(&gi3c->done);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>> +{
> 
> You miss sparse/lockdep annotations.
> 
This is called in pair only, but to avoid repeated code in caller 
functions, we have designed this wrapper.
i3c_geni_runtime_get_mutex_lock()
i3c_geni_runtime_put_mutex_unlock().

caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().

Does a comment help here ? Then i can write up to add.

>> +	int ret;
>> +
>> +	mutex_lock(&gi3c->lock);
>> +	reinit_completion(&gi3c->done);
>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>> +	if (ret < 0) {
>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>> +		pm_runtime_put_noidle(gi3c->se.dev);
>> +		/* Set device in suspended since resume failed */
>> +		pm_runtime_set_suspended(gi3c->se.dev);
>> +		mutex_unlock(&gi3c->lock);
> 
> Either you lock or don't lock, don't mix these up.
> 
Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock() 
if this failed.
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>> +{
> 
> Missing annotations.
> 
Shall i add a comment here ?
>> +	pm_runtime_mark_last_busy(gi3c->se.dev);
>> +	pm_runtime_put_autosuspend(gi3c->se.dev);
>> +	mutex_unlock(&gi3c->lock);
>> +}
>> +
>> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
>> +{
>> +	unsigned long time_remaining;
>> +	unsigned long flags;
>> +
>> +	reinit_completion(&gi3c->done);
>> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
>> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>> +	geni_se_abort_m_cmd(&gi3c->se);
>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>> +	if (!time_remaining)
>> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
>> +}
> 
> ...
> 
>> +
>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>> +{
>> +	int ret;
>> +
>> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(gi3c->se.base))
>> +		return PTR_ERR(gi3c->se.base);
>> +
>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se");
>> +	if (IS_ERR(gi3c->se.clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>> +							"Unable to get serial engine core clock: %pe\n",
>> +							gi3c->se.clk);
> 
> Totally messed indentation.
> 
yes, corrected.
>> +	ret = geni_icc_get(&gi3c->se, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set the bus quota to a reasonable value for register access */
>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>> +	ret = geni_icc_set_bw(&gi3c->se);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Default source clock (se-clock-frequency) freq is 100Mhz */
>> +	gi3c->clk_src_freq = KHZ(100000);
> 
> And why can't you use clk_get_rate()?
> 
During probe(), we need one time initialization of source clock 
frequencey. HW has no clock set before this.
>> +
>> +	return 0;
>> +}
>> +
>> +static int geni_i3c_probe(struct platform_device *pdev)
>> +{
>> +	u32 proto, tx_depth, fifo_disable;
>> +	struct geni_i3c_dev *gi3c;
> 
> Just store pdev->dev in local dev variable, to simplify everything here.
yes, thats right. But i see other drivers are using same pdev->dev. Is 
it fine ? if really required, will change it.
> 
>> +	int ret;
>> +
>> +	gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
>> +	if (!gi3c)
>> +		return -ENOMEM;
>> +
>> +	gi3c->se.dev = &pdev->dev;
>> +	gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>> +
>> +	init_completion(&gi3c->done);
>> +	mutex_init(&gi3c->lock);
>> +	spin_lock_init(&gi3c->irq_lock);
>> +	platform_set_drvdata(pdev, gi3c);
>> +
>> +	ret = i3c_geni_resources_init(gi3c, pdev);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "Error Initializing GENI Resources\n");
>> +
>> +	gi3c->irq = platform_get_irq(pdev, 0);
>> +	if (gi3c->irq < 0)
>> +		return dev_err_probe(&pdev->dev, gi3c->irq, "Error getting IRQ number for I3C\n");
>> +
>> +	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
>> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "Error registering core IRQ\n");
>> +
>> +	ret = geni_se_resources_on(&gi3c->se);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
>> +
>> +	proto = geni_se_read_proto(&gi3c->se);
>> +	if (proto != GENI_SE_I3C) {
>> +		geni_se_resources_off(&gi3c->se);
>> +		return dev_err_probe(&pdev->dev, -ENXIO, "Invalid proto %d\n", proto);
>> +	}
>> +
>> +	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
>> +	if (fifo_disable) {
>> +		geni_se_resources_off(&gi3c->se);
>> +		return dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
>> +	}
>> +
>> +	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
>> +	gi3c->tx_wm = tx_depth - 1;
>> +	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
>> +	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PW, true, true, true);
>> +	geni_se_resources_off(&gi3c->se);
>> +	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> +
>> +	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
>> +	pm_runtime_use_autosuspend(gi3c->se.dev);
>> +	pm_runtime_set_active(gi3c->se.dev);
>> +	pm_runtime_enable(gi3c->se.dev);
>> +
>> +	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
>> +	if (ret) {
>> +		pm_runtime_disable(gi3c->se.dev);
>> +		pm_runtime_set_suspended(gi3c->se.dev);
>> +		pm_runtime_dont_use_autosuspend(gi3c->se.dev);
>> +		return ret;
>> +	}
>> +
>> +	return ret;
> 
> return 0;
> 
Sure, Done.
>> +}
> 
> Best regards,
> Krzysztof
> 


