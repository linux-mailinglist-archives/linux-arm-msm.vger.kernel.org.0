Return-Path: <linux-arm-msm+bounces-66261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC5B0F07F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66DA51C84BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9981A2D879A;
	Wed, 23 Jul 2025 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M+fY/Bks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E12C1590;
	Wed, 23 Jul 2025 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268243; cv=none; b=Q+fKoB/6iLw6gIIdOg3H9c6h4zLWFYJFhf7nkeLukFyNSeqXylqXpyr+o2INYhonr6RC+t0ZDnR2w7KBljvNLsxkeIzvds+SSfqgaFQ1GXcj8ayt3pa50An27A6TldMYZjEEowxRtjTSylHOSjd4bz+v1XXWeWV9eUT9I+uPpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268243; c=relaxed/simple;
	bh=KQ+DgdtYLV7P/sqdXzO6H3+DTiNTfGo4K+XVrHhUoqc=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sVeQKxDhtndKq6STYbhEt66tsuD4cC7Ei1UkTC7l9/Nbtv9BV2iMe/PhGw4Ke8tOAC9ClWr00PJBlRZPHjNEDy8YCUj5TBFbYHZ4fyH9TM8pc/OPOrh076A78ofVHcEotbhCtXPBIhwCVuSfSCreTWwHP4z0gFvgZtUgSnRuvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M+fY/Bks; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9GmO1025711;
	Wed, 23 Jul 2025 10:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GrhgyfoxaqJvAt1Z3CG+5Rwh6hQq70QawGI24g23wFg=; b=M+fY/BksMp2Kd7RX
	hgkmcelU4/CjenHeOastiFyLvQPBKoG1q2YoB1tLFNJufjwDdXRdxfSYox04Kh9f
	AUiT68AXS4KeCMCLrjMvXZh10vU4prqsM8IwEoWttQ9DkC8t5Ng7MPqleo0l619S
	2HNYGsRYn5MPQ/UTSEbEGPZpMqI6aBhq0bVEJsYs6P1eAXyCr8ieNsiU7dUVVlYS
	yAPU4g2J23MyCOgMgzRYTdOFQNJeR6f4UnVO4GFdTX3Su6E0BZWcKw2DzVmOqytS
	NeKW4X4EZB/z8nJXQxHRYbyMpU7EcPihZmmzKxpnra/l8peHVRQVfClp3uv308oR
	INBW1Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ubdvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:57:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NAvJDL007418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:57:19 GMT
Received: from [10.218.49.64] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 03:57:16 -0700
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Message-ID: <8ccc4e83-9645-4388-0941-ebeb3ac4d88e@quicinc.com>
Date: Wed, 23 Jul 2025 16:26:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880c00f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=aoTH-x754zP81mJImO0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5MiBTYWx0ZWRfX/5xBlZ+jZ1lk
 U+hRP+H5y7G7Ruxfa3zjMarfU7NyfcK07VIH5GWyjftpOe8xePsYV0qO+Cta1J60UsiyXOSnni5
 vWsGPYujaZ9MCZLZ3Zpw/UFHJkJL+em83VK5ltJp9t+qhKUmSEeE+a9UKDO9T3RK7EMCuXUs7f2
 yRnLzkm/knYXDCouoOkqSYNc5XPL1nuTL6JO1jQI+zXY0/FcIeRWPjbKwLSbo1hrPKPwTvJl48I
 MbzmgLH1y6YaLFkPGJd5smHX8RK0SBB9ylfe7R/q9BvtYsCmOqC5uZBzUwmKV9YSgfoT9qNmOA6
 w4O6RUDT/wgvMb+YloLgqeCPb6pxtxfAJ44LbusZpHY/p61pFtBkU9CA9UtEGXJNXKcRDt+QWha
 x6RggoQVGg2WoWQCaGlG84HORBHKYLHFOMloWHmCssp2L2sUDG2fyL9uU5j5X7Oaqa6xpRiP
X-Proofpoint-ORIG-GUID: 0rcmqnENa7bSepy5BlpYE6OCd_43fkqk
X-Proofpoint-GUID: 0rcmqnENa7bSepy5BlpYE6OCd_43fkqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230092



On 7/22/2025 5:01 PM, Komal Bajaj wrote:
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for operating system running at EL1, enforcing access
> restrictions that prohibit direct memory-mapped writes via writel().
>
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
>
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
>
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
Reviewed-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> Changes in v7:
> - Updated the commit message as per Greg's comment
> - Link to v6: https://lore.kernel.org/r/20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com
>
> Changes in v6:
> - Propagating the error code from disable_eud(), per Dmitry's suggestion
> - Link to v5: https://lore.kernel.org/r/20250715-eud_mode_manager_secure_access-v5-1-e769be308d4a@oss.qualcomm.com
>
> usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
>
> Changes in v5:
> * Changed select QCOM_SCM to depends on QCOM_SCM in Kconfig per Greg's review
> * Link to v4: https://lore.kernel.org/all/20250709065533.25724-1-komal.bajaj@oss.qualcomm.com/
>
> Changes in v4:
> * Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
> * Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/
>
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud()
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/
>
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/
> ---
>   drivers/usb/misc/Kconfig    |  1 +
>   drivers/usb/misc/qcom_eud.c | 33 ++++++++++++++++++++++++---------
>   2 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
>   config USB_QCOM_EUD
>   	tristate "QCOM Embedded USB Debugger(EUD) Driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SCM
>   	select USB_ROLE_SWITCH
>   	help
>   	  This module enables support for Qualcomm Technologies, Inc.
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f281b2136d0d1eb39418c7f94ff8c..05c8bdc943a88dab6159a05c2d770484c084f7b7 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -15,6 +15,7 @@
>   #include <linux/slab.h>
>   #include <linux/sysfs.h>
>   #include <linux/usb/role.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>   
>   #define EUD_REG_INT1_EN_MASK	0x0024
>   #define EUD_REG_INT_STATUS_1	0x0044
> @@ -34,7 +35,7 @@ struct eud_chip {
>   	struct device			*dev;
>   	struct usb_role_switch		*role_sw;
>   	void __iomem			*base;
> -	void __iomem			*mode_mgr;
> +	phys_addr_t			mode_mgr;
>   	unsigned int			int_status;
>   	int				irq;
>   	bool				enabled;
> @@ -43,18 +44,29 @@ struct eud_chip {
>   
>   static int enable_eud(struct eud_chip *priv)
>   {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +	if (ret)
> +		return ret;
> +
>   	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>   	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>   			priv->base + EUD_REG_INT1_EN_MASK);
> -	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>   
>   	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>   }
>   
> -static void disable_eud(struct eud_chip *priv)
> +static int disable_eud(struct eud_chip *priv)
>   {
> +	int ret;
> +
> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +	if (ret)
> +		return ret;
> +
>   	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
> +	return 0;
>   }
>   
>   static ssize_t enable_show(struct device *dev,
> @@ -82,11 +94,12 @@ static ssize_t enable_store(struct device *dev,
>   			chip->enabled = enable;
>   		else
>   			disable_eud(chip);
> +
>   	} else {
> -		disable_eud(chip);
> +		ret = disable_eud(chip);
>   	}
>   
> -	return count;
> +	return ret < 0 ? ret : count;
>   }
>   
>   static DEVICE_ATTR_RW(enable);
> @@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
>   static int eud_probe(struct platform_device *pdev)
>   {
>   	struct eud_chip *chip;
> +	struct resource *res;
>   	int ret;
>   
>   	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> @@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
>   	if (IS_ERR(chip->base))
>   		return PTR_ERR(chip->base);
>   
> -	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(chip->mode_mgr))
> -		return PTR_ERR(chip->mode_mgr);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -ENODEV;
> +	chip->mode_mgr = res->start;
>   
>   	chip->irq = platform_get_irq(pdev, 0);
>   	if (chip->irq < 0)
>
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-eud_mode_manager_secure_access-6e57e3c71ec2
>
> Best regards,


