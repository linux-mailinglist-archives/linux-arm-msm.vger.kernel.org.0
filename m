Return-Path: <linux-arm-msm+bounces-53071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E882A79AB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 05:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B1687A3976
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 03:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0294B198A29;
	Thu,  3 Apr 2025 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBYxawZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28C3190676
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 03:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652579; cv=none; b=XWO8C5cb15KpnRbAHD9T1ghi1pSTo2vmhwfRxpA4Uea4bWrZ3BBruvbd8D9TnqSsgqFvvCtOjXD1lok/JGQiiEVacZV9IAqvLkYlVUaSDBgwc6UoUuMNGbQUc3v8DDEaLDXpzHjyhtSuzHRI5VZtubvfP1p4WMdQ1NdYgiGzdXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652579; c=relaxed/simple;
	bh=4z4lyQLPUvVuOBhIgYeuG+IclARz8yvThB+MDNUeSNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgL8iZvmuHYqs+GuhBBGUIa7TeVNTagl24hTOQ1//5KDo9SgU7nxPFicY0kHW5BVwmKKi1RKLP97GJjWEViHM6vN5G978C1kyfTmy9o48n09PwuOLaYieTQBibEE36021I2fuyuVA4VT4kDhAodcUC01K686sP7wUBvoLwAStfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBYxawZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5333n9Rb021556
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 03:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKsIZUI3Ic7pWmwmxkPi1R21I/HEE9UuTTtZIePNydc=; b=YBYxawZRT9qp/3Rp
	cj/VqBtmFq4qSbrPofnw6MFJYvANQSLyqKBT/52dtQXXKevPHsTFX4UzYdIou1+3
	qz2RGhKcaYj+Ts8YN/hWj/vsFMUqrbx5WNMQ1s4zf/2KR7I3EVoP8udB0NHiRpAJ
	T+qjPVP6tMVRyfsc/zPMEt2Wy0+dvh0oUI69fdbDke5r8RhbPi720LTLF103FLSu
	d7iRKSaEVkGdt38SvSe0MUm4rKq7hGkBZ/LQb1n7cWPCLf2sOUmCLsVflyFlnv/H
	FWkAxtMx8zfnNCS1y3tJWfGrcgg4S2luMAj59wEBs4JmtFEPAEOqzwjtpvpDQZgB
	dv9FeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a2c5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 03:56:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3032f4eacd8so431603a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 20:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743652575; x=1744257375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKsIZUI3Ic7pWmwmxkPi1R21I/HEE9UuTTtZIePNydc=;
        b=vvkwBCFGU3o6oxe0euC3pnuhq6dEpdtjw8y0YKSUanjJvcgkD6HMZqBcvOecmUxh1L
         bRJBxor1lFU9SuWiqUuh8GT6Nxv43OXCfaHWbjkW7OevKxJXJqMS+zdvTDy23o6n0kZq
         is6bzz+mwH2EQHYENbmHCLryuZJ8eGXUp9GG8P8Ma3jMnh9jkdGpld1FbtrIaZLbjyM9
         w7ufL+SjarCHsDvdjnrpC+2iZC+pL3wZ7RjDrygSm7YRLwZkT6ZCOaH85tlvKQHItPhh
         ZnzHlKiYd9PM6syH+BS7ircFrh5+eoQzpQpRUFa1KmM2o8rXVVQDjBXWObR8OGeGqnSV
         XOag==
X-Forwarded-Encrypted: i=1; AJvYcCXPpccKnbvSBRwRsNyzfuzPIhWf1cDL0po3+f7iPzyCoEkPHutJNE/183l8ewbqJu/WUuOHjBQSjlz54iun@vger.kernel.org
X-Gm-Message-State: AOJu0YxIX8peHryFfHEGa2q1AMygbWL8sfqgIE2pVS2TbcuswV9gYaNU
	EgB23tO2jkx9wbQF4sE7ZkrbrzpQQuTELrXk8gVohnT9/xwLyjwlSE9J9G7EHwXIB8uI3bnYXPD
	0z4JkbRqcbDvY1tWCdDzlnZCYbR6cklRmVtCRtiSz9F2gTH+VW/ks2RCaw1CuUV0P
X-Gm-Gg: ASbGncs1kgMrz8NGe4AZipo0XYqqhX81ggK0SJ/++TIedZbhDgbE2IWItISpqmMnkx0
	CQld1HXgf5jn/nUuAJdAgtZ95KKNACQBfOWAf2z5i0G4Hl0oE2xxSIIBO7WkTkoNXJhdZW8Vd9f
	JV3ESH5TkqWELV9HzkVmLNgW1pZGAuwv5RuQeYQaxaafz7ElbC8Ff6HoAJ38KN+Dfc5laqF2nWV
	PawQ4bs/ENklefEKxZ6wdvq7OAjY5ZS6yLovN3uJnoEVpyx4zPdbLe/1qqkfCwMoARaFv9iaLsC
	8kFb0tKAEk9vEt9J5naPx08UhlfMilC9/EP71jSFBC842w==
X-Received: by 2002:a17:90a:dfc7:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30531fa4dd6mr28721498a91.9.1743652575137;
        Wed, 02 Apr 2025 20:56:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOxEONSA1ImARRV3Up0xjOIajIqoqQUhxU7KE1J23l/alWebgwnbr+3FCAfYA6HIHptyEHJQ==
X-Received: by 2002:a17:90a:dfc7:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30531fa4dd6mr28721474a91.9.1743652574742;
        Wed, 02 Apr 2025 20:56:14 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d672sm524571a91.31.2025.04.02.20.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 20:56:14 -0700 (PDT)
Message-ID: <798f9a15-f3de-18fa-1b8f-2c9973e8be61@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 09:26:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] PCI: qcom: Implement shutdown() callback
Content-Language: en-US
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        quic_vpernami@quicinc.com
References: <20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com>
 <Z-0xJpBrO4wN9UzN@ryzen>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <Z-0xJpBrO4wN9UzN@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee06e0 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OvU543Yhaul-O2FZsO4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: h4ePyyGquQ5t17pUCWXfxm5Z9gg5Tgwn
X-Proofpoint-GUID: h4ePyyGquQ5t17pUCWXfxm5Z9gg5Tgwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=794 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030018



On 4/2/2025 6:14 PM, Niklas Cassel wrote:
> Hello Krishna,
> 
> On Tue, Apr 01, 2025 at 04:51:37PM +0530, Krishna Chaitanya Chundru wrote:
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> PCIe host controller drivers are supposed to properly remove the
>> endpoint drivers and release the resources during host shutdown/reboot
>> to avoid issues like smmu errors, NOC errors, etc.
>>
>> So, stop and remove the root bus and its associated devices and release
>> its resources during system shutdown to ensure a clean shutdown/reboot.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index e4d3366ead1f9198693e6f9da4ae1dc40a3a0519..926811a0e63eb3663c1f41dc598659993546d832 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1754,6 +1754,16 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>> 	return ret;
>>   }
>>
>> +static void qcom_pcie_shutdown(struct platform_device *pdev)
>> +{
>> +	struct qcom_pcie *pcie = platform_get_drvdata(pdev);
>> +
>> +	dw_pcie_host_deinit(&pcie->pci->pp);
>> +	phy_exit(pcie->phy);
>> +	pm_runtime_put(&pdev->dev);
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>>   static int qcom_pcie_suspend_noirq(struct device *dev)
>>   {
>> 	struct qcom_pcie *pcie = dev_get_drvdata(dev);
>> @@ -1890,5 +1900,6 @@ static struct platform_driver qcom_pcie_driver = {
>> 		.pm = &qcom_pcie_pm_ops,
>> 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> 	},
>> +	.shutdown = qcom_pcie_shutdown,
>>   };
>>   builtin_platform_driver(qcom_pcie_driver);
>>
>> ---
> 
> Out of curiosity, I tried something similar to on pcie-dw-rockchip.c
> 
> Simply having a ->shutdown() callback that only calls dw_pcie_host_deinit()
> was enough for me to produce:
> 
> [   40.209887] r8169 0004:41:00.0 eth0: Link is Down
> [   40.216572] ------------[ cut here ]------------
> [   40.216986] called from state HALTED
> [   40.217317] WARNING: CPU: 7 PID: 265 at drivers/net/phy/phy.c:1630 phy_stop+0x134/0x1a0
> [   40.218024] Modules linked in: rk805_pwrkey hantro_vpu v4l2_jpeg v4l2_vp9 v4l2_h264 v4l2_mem2mem videobuf2_v4l2 videobuf2_dma_contig videobuf2_memops videobuf2_common vidf
> [   40.220267] CPU: 7 UID: 0 PID: 265 Comm: init Not tainted 6.14.0+ #134 PREEMPT
> [   40.220908] Hardware name: Radxa ROCK 5B (DT)
> [   40.221289] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   40.221899] pc : phy_stop+0x134/0x1a0
> [   40.222222] lr : phy_stop+0x134/0x1a0
> [   40.222546] sp : ffff800082213820
> [   40.222836] x29: ffff800082213820 x28: ffff45ec84b30000 x27: 0000000000000000
> [   40.223463] x26: 0000000000000000 x25: 0000000000000000 x24: ffffbe8df7fde030
> [   40.224088] x23: ffff800082213990 x22: 0000000000000001 x21: ffff45ec80e10000
> [   40.224714] x20: ffff45ec82cb40c8 x19: ffff45ec82ccc000 x18: 0000000000000006
> [   40.225340] x17: 000000040044ffff x16: 005000f2b5503510 x15: 0720072007200720
> [   40.225966] x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
> [   40.226592] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffbe8df556469c
> [   40.227217] x8 : 0000000000000268 x7 : ffffbe8df7a48648 x6 : ffffbe8df7a48648
> [   40.227842] x5 : 0000000000017fe8 x4 : 0000000000000000 x3 : 0000000000000000
> [   40.228468] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff45ec84b30000
> [   40.229093] Call trace:
> [   40.229308]  phy_stop+0x134/0x1a0 (P)
> [   40.229634]  rtl8169_down+0x34/0x280
> [   40.229952]  rtl8169_close+0x64/0x100
> [   40.230275]  __dev_close_many+0xbc/0x1f0
> [   40.230621]  dev_close_many+0x94/0x160
> [   40.230951]  unregister_netdevice_many_notify+0x14c/0x9c0
> [   40.231426]  unregister_netdevice_queue+0xe4/0x100
> [   40.231848]  unregister_netdev+0x2c/0x60
> [   40.232193]  rtl_remove_one+0xa0/0xe0
> [   40.232517]  pci_device_remove+0x4c/0xf8
> [   40.232864]  device_remove+0x54/0x90
> [   40.233182]  device_release_driver_internal+0x1d4/0x238
> [   40.233643]  device_release_driver+0x20/0x38
> [   40.234019]  pci_stop_bus_device+0x84/0xe0
> [   40.234381]  pci_stop_bus_device+0x40/0xe0
> [   40.234741]  pci_stop_root_bus+0x48/0x80
> [   40.235087]  dw_pcie_host_deinit+0x34/0xe0
> [   40.235452]  rockchip_pcie_shutdown+0x24/0x48
> [   40.235839]  platform_shutdown+0x2c/0x48
> [   40.236187]  device_shutdown+0x150/0x278
> [   40.236533]  kernel_restart+0x4c/0xb8
> [   40.236859]  __do_sys_reboot+0x178/0x280
> [   40.237206]  __arm64_sys_reboot+0x2c/0x40
> [   40.237561]  invoke_syscall+0x50/0x120
> [   40.237891]  el0_svc_common.constprop.0+0x48/0xf0
> [   40.238305]  do_el0_svc+0x24/0x38
> [   40.238597]  el0_svc+0x30/0xd0
> [   40.238868]  el0t_64_sync_handler+0x10c/0x138
> [   40.239251]  el0t_64_sync+0x198/0x1a0
> [   40.239575] ---[ end trace 0000000000000000 ]---
> 
Hi Niklas,

The issue which you are seeing with specific to the RealTek ethernet
driver and should be fixed by RealTek driver nothing to do with the host
controller.
> Did you try your change with a simple network card connected to the PCI slot?
> (And not just another qcom board running in EP mode.)
> 
we don't have ethernet card's to try we tried with qcom PCIe switch
which usb hub connected as a endpoint.

- Krishna Chaitanya.
> I don't see why you wouldn't see the same thing as me.
> 
> 
> Kind regards,
> Niklas

