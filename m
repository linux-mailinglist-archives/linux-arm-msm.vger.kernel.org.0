Return-Path: <linux-arm-msm+bounces-27604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED24F9440A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 04:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD321B2D109
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DD042A96;
	Thu,  1 Aug 2024 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TlZZte+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260042E83F;
	Thu,  1 Aug 2024 00:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722473491; cv=none; b=V7QMV+bixmmQwo4h3za3HRqAwEMRqKyW6zV1y6ZsW5RV3sMdtCd5o1SHUlfqQZW1m+OrKs09zunfdr9RDTFrWjPf1LpssWTA9p9nDjLTv/6nknfs5kxI9TxObTrs3rgiaxkWcuX+aMKSjFWe5NxHiutjEmME7Z6enH8NmfusFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722473491; c=relaxed/simple;
	bh=TSjrUWYJXnpOZEh3ey+4es+yDaCbp82UbrQyxn4Q2Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tR/S+1tB+61s8D3OAz6DqF8Fnd+Gx6lYUlMRThEQtZbP3QQLRvpcz5IGk1uZO4YMsI/Zu35BVh77OgGYwhoEtWUAr+dpiugs4OBXZX75ErHoI2TBc6LtVRK0CZ3oLToTHfiQTzUWyzwdCpCI2My7zW8GY4okDvrMIVQ/xoCgHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TlZZte+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VGqI21029961;
	Thu, 1 Aug 2024 00:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etAlBOLm/c6+N+NDIQJ64v0mXMlXSuHpFgcU4hIzgOw=; b=TlZZte+xm7FhaTkl
	COW1bhS3bfByvy3W4l9xR5Tn6Hqfch94kye1bz/cITXNLXo26CzUr8dBPDufSQ1d
	+iXl0BkcOracBo32uWOXWcbCWgfs2/ezjUUa+xxbX+OO7GOzlaBV3wDFsEisMgj/
	F8ngZKHfgLk+p+hxJx/xNFWZ5tNeOAn2ucLrUekTFZz7cfFVw2r6A9M/90EKuth0
	zGFW/+x5ID3S5NbriGduwTA6A3dSsQYFezM7bn4fREdNOKyFs8Mxv5b5O1DB9OXk
	r72LrL9dXlRf7//qNqDCXnfF9mhg8tHO6zVyEvYZhjhIGMQyYGzbLVO405n6i2lz
	vw3jmQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq5276j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 00:51:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4710pINS015647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 00:51:18 GMT
Received: from [10.110.31.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 17:51:17 -0700
Message-ID: <0c769a55-0fb7-4734-86b1-9469b4cc7b8c@quicinc.com>
Date: Wed, 31 Jul 2024 17:51:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] usb: misc: eud: Handle usb role switch notifications
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-8-quic_eserrao@quicinc.com>
 <5nsextq3khhku3xfdwwj74wmx5ajyqhjyarfpnpa6i2tjx76ix@z7lpip6pi6re>
Content-Language: en-US
From: Elson Serrao <quic_eserrao@quicinc.com>
In-Reply-To: <5nsextq3khhku3xfdwwj74wmx5ajyqhjyarfpnpa6i2tjx76ix@z7lpip6pi6re>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rh5EhvjqrxgSCIv37YiiyvkgYM84m1jB
X-Proofpoint-ORIG-GUID: Rh5EhvjqrxgSCIv37YiiyvkgYM84m1jB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010002



On 7/31/2024 6:06 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 30, 2024 at 03:24:38PM GMT, Elson Roy Serrao wrote:
>> Since EUD is physically present between the USB connector and
>> the USB controller, it should relay the usb role notifications
>> from the connector. Hence register a role switch handler to
>> process and relay these roles to the USB controller. This results
>> in a common framework to send both connector related events
>> and eud attach/detach events to the USB controller.
>>
>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>> ---
>>  drivers/usb/misc/qcom_eud.c | 91 ++++++++++++++++++++++++++++---------
>>  1 file changed, 69 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index 3de7d465912c..9a49c934e8cf 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/iopoll.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/of.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/platform_device.h>
>> @@ -35,12 +36,16 @@ struct eud_chip {
>>  	struct device			*dev;
>>  	struct usb_role_switch		*role_sw;
>>  	struct phy			*usb2_phy;
>> +
>> +	/* mode lock */
>> +	struct mutex			mutex;
>>  	void __iomem			*base;
>>  	void __iomem			*mode_mgr;
>>  	unsigned int			int_status;
>>  	int				irq;
>>  	bool				enabled;
>>  	bool				usb_attached;
>> +	enum usb_role			current_role;
>>  };
>>  
>>  static int eud_phy_enable(struct eud_chip *chip)
>> @@ -64,6 +69,38 @@ static void eud_phy_disable(struct eud_chip *chip)
>>  	phy_exit(chip->usb2_phy);
>>  }
>>  
>> +static int eud_usb_role_set(struct eud_chip *chip, enum usb_role role)
>> +{
>> +	struct usb_role_switch *sw;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&chip->mutex);
>> +
>> +	/* Avoid duplicate role handling */
>> +	if (role == chip->current_role)
>> +		goto err;
>> +
>> +	sw = usb_role_switch_get(chip->dev);
> 
> Why isn't chip->role_sw good enough? Why do you need to get it each
> time?
>

Hi Dmitry

chip->role_sw is the eud role switch handler to receive role switch notifications from the
USB connector. The 'sw' I am getting above is the role switch handler of the USB controller.
As per this design, EUD receives role switch notification from the connector 
(via chip->role_sw) and then relays it to the 'sw' switch handler of the USB controller.


Thanks
Elson
 
>> +	if (IS_ERR_OR_NULL(sw)) {
>> +		dev_err(chip->dev, "failed to get usb switch\n");
>> +		ret = -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	ret = usb_role_switch_set_role(sw, role);
>> +	usb_role_switch_put(sw);
>> +
>> +	if (ret) {
>> +		dev_err(chip->dev, "failed to set role\n");
>> +		goto err;
>> +	}
>> +	chip->current_role = role;
>> +err:
>> +	mutex_unlock(&chip->mutex);
>> +
>> +	return ret;
>> +}
>> +
>>  static int enable_eud(struct eud_chip *priv)
>>  {
>>  	int ret;
>> @@ -77,7 +114,7 @@ static int enable_eud(struct eud_chip *priv)
>>  			priv->base + EUD_REG_INT1_EN_MASK);
>>  	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>>  
>> -	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>> +	return ret;
>>  }
>>  
>>  static void disable_eud(struct eud_chip *priv)
>> @@ -106,15 +143,20 @@ static ssize_t enable_store(struct device *dev,
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	/* EUD enable is applicable only in DEVICE mode */
>> +	if (enable && chip->current_role != USB_ROLE_DEVICE)
>> +		return -EINVAL;
>> +
>>  	if (enable) {
>>  		ret = enable_eud(chip);
>> -		if (!ret)
>> -			chip->enabled = enable;
>> -		else
>> -			disable_eud(chip);
>> +		if (ret) {
>> +			dev_err(chip->dev, "failed to enable eud\n");
>> +			return count;
>> +		}
>>  	} else {
>>  		disable_eud(chip);
>>  	}
>> +	chip->enabled = enable;
>>  
>>  	return count;
>>  }
>> @@ -185,11 +227,9 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>>  	int ret;
>>  
>>  	if (chip->usb_attached)
>> -		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
>> +		ret = eud_usb_role_set(chip, USB_ROLE_DEVICE);
>>  	else
>> -		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
>> -	if (ret)
>> -		dev_err(chip->dev, "failed to set role switch\n");
>> +		ret = eud_usb_role_set(chip, USB_ROLE_HOST);
>>  
>>  	/* set and clear vbus_int_clr[0] to clear interrupt */
>>  	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
>> @@ -198,16 +238,18 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>>  	return IRQ_HANDLED;
>>  }
>>  
>> -static void eud_role_switch_release(void *data)
>> +static int eud_usb_role_switch_set(struct usb_role_switch *sw,
>> +				   enum usb_role role)
>>  {
>> -	struct eud_chip *chip = data;
>> +	struct eud_chip *chip = usb_role_switch_get_drvdata(sw);
>>  
>> -	usb_role_switch_put(chip->role_sw);
>> +	return eud_usb_role_set(chip, role);
>>  }
>>  
>>  static int eud_probe(struct platform_device *pdev)
>>  {
>>  	struct eud_chip *chip;
>> +	struct usb_role_switch_desc eud_role_switch = {NULL};
>>  	int ret;
>>  
>>  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>> @@ -221,16 +263,6 @@ static int eud_probe(struct platform_device *pdev)
>>  		return dev_err_probe(chip->dev, PTR_ERR(chip->usb2_phy),
>>  				     "no usb2 phy configured\n");
>>  
>> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
>> -	if (IS_ERR(chip->role_sw))
>> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
>> -					"failed to get role switch\n");
>> -
>> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
>> -	if (ret)
>> -		return dev_err_probe(chip->dev, ret,
>> -				"failed to add role switch release action\n");
>> -
>>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(chip->base))
>>  		return PTR_ERR(chip->base);
>> @@ -248,6 +280,18 @@ static int eud_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return dev_err_probe(chip->dev, ret, "failed to allocate irq\n");
>>  
>> +	eud_role_switch.fwnode = dev_fwnode(chip->dev);
>> +	eud_role_switch.set = eud_usb_role_switch_set;
>> +	eud_role_switch.get = NULL;
>> +	eud_role_switch.driver_data = chip;
>> +	chip->role_sw = usb_role_switch_register(chip->dev, &eud_role_switch);
>> +
>> +	if (IS_ERR(chip->role_sw))
>> +		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
>> +				"failed to register role switch\n");
>> +
>> +	mutex_init(&chip->mutex);
> 
> please move mutex_init earlier.
> 

Ack
>> +
>>  	enable_irq_wake(chip->irq);
>>  
>>  	platform_set_drvdata(pdev, chip);
>> @@ -262,6 +306,9 @@ static void eud_remove(struct platform_device *pdev)
>>  	if (chip->enabled)
>>  		disable_eud(chip);
>>  
>> +	if (chip->role_sw)
>> +		usb_role_switch_unregister(chip->role_sw);
>> +
>>  	device_init_wakeup(&pdev->dev, false);
>>  	disable_irq_wake(chip->irq);
>>  }
>> -- 
>> 2.17.1
>>
> 

