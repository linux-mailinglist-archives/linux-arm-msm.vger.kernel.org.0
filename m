Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7CC1F72C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 06:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgFLERM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 00:17:12 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33336 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725763AbgFLERL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 00:17:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591935431; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kFRGwnIstVkSTHOF2cZTEG/CpZ7Zxsa9FTQ839n+sbc=; b=iC+Alxjy3+E6ppnZHRMBY8QJOyHaw2iQRryZb8YGMaphhBLLMnleZpm6+RSfKClGeWEKagDX
 EgN1hCvtAOVAkBiTlFtDt/EglExze0YkySEboM/H31WPCHwJ1TSlqzxxrgULDQqyLcI9lZYK
 XwKHWDpeNcO8UkCQEMQPpPM7bgM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ee301c7c76a4e7a2a2f8d83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 04:17:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3770DC43391; Fri, 12 Jun 2020 04:17:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.17.171] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD4BCC433C8;
        Fri, 12 Jun 2020 04:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD4BCC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>, bryan.odonoghue@linaro.org
References: <20200609205851.30113-1-wcheng@codeaurora.org>
 <20200609205851.30113-2-wcheng@codeaurora.org>
 <CAKgpwJWp9St4B1xuT5qAns1_NFPjd+2_gozv=0j-g7J42dbCPg@mail.gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <2d4f442e-74b6-f53f-0e1d-1d5dc94abc75@codeaurora.org>
Date:   Thu, 11 Jun 2020 21:17:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKgpwJWp9St4B1xuT5qAns1_NFPjd+2_gozv=0j-g7J42dbCPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/9/2020 7:27 PM, Jun Li wrote:
>> +static int qcom_pmic_typec_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct qcom_pmic_typec *qcom_usb;
>> +       struct typec_capability *cap;
>> +       const char *buf;
>> +       int ret, irq, role;
>> +
>> +       qcom_usb = kzalloc(sizeof(*qcom_usb), GFP_KERNEL);
> 
> devm_kzalloc().
> 

Hi Jun,

Thanks for the input.  I have replaced with devm_kzalloc() as you
recommended.

>> +       if (!qcom_usb)
>> +               return -ENOMEM;
>> +
>> +       qcom_usb->dev = dev;
>> +
>> +       qcom_usb->regmap = dev_get_regmap(dev->parent, NULL);
>> +       if (!qcom_usb->regmap) {
>> +               dev_err(dev, "Failed to get regmap\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       irq = platform_get_irq(pdev, 0);
>> +       if (irq < 0) {
>> +               dev_err(dev, "Failed to get CC irq\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       ret = devm_request_irq(qcom_usb->dev, irq, qcom_pmic_typec_interrupt,
>> +                              IRQF_SHARED, "qcom-pmic-typec", qcom_usb);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Could not request IRQ\n");
>> +               return ret;
>> +       }
>> +
>> +       qcom_usb->fwnode = device_get_named_child_node(dev, "connector");
>> +       if (!qcom_usb->fwnode)
>> +               return -EINVAL;
>> +
>> +       cap = kzalloc(sizeof(*cap), GFP_KERNEL);
> 
> devm_kzalloc().
> 
>> +       if (!cap) {
>> +               ret = -ENOMEM;
>> +               goto err_put_node;
>> +       }
>> +
>> +       ret = fwnode_property_read_string(qcom_usb->fwnode, "power-role", &buf);
>> +       if (!ret)
>> +               role = typec_find_port_power_role(buf);
> 
> if (role < 0)
> 


Added a check for role <0, if so, set to SNK as well
>> +       else
>> +               role = TYPEC_PORT_SNK;
>> +       cap->type = role;
>> +
>> +       ret = fwnode_property_read_string(qcom_usb->fwnode, "data-role", &buf);
>> +       if (!ret)
>> +               role = typec_find_port_data_role(buf);
> 
> if (role < 0)
> 

Added a check for role <0, if so, set to UFP as well
>> +       else
>> +               role = TYPEC_PORT_UFP;
>> +       cap->data = role;
>> +
>> +       cap->prefer_role = -1;
> 
> TYPEC_NO_PREFERRED_ROLE
> 

Done.
>> +       cap->fwnode = qcom_usb->fwnode;
>> +       qcom_usb->port = typec_register_port(dev, cap);
>> +       if (IS_ERR(qcom_usb->port)) {
>> +               dev_err(dev, "Failed to register type c port %d\n",
>> +                       IS_ERR(qcom_usb->port));
>> +               ret = PTR_ERR(qcom_usb->port);
> 
> dev_err(dev, , ret)?
> 
> Li Jun

Agreed.  Thanks!

>> +               goto err_put_node;
>> +       }
>> +
>> +       qcom_usb->cap = cap;
>> +
>> +       qcom_usb->role_sw = fwnode_usb_role_switch_get(qcom_usb->fwnode);
>> +       if (IS_ERR(qcom_usb->role_sw)) {
>> +               if (PTR_ERR(qcom_usb->role_sw) != -EPROBE_DEFER)
>> +                       dev_err(dev, "failed to get role switch\n");
>> +               ret = PTR_ERR(qcom_usb->role_sw);
>> +               goto err_typec_port;
>> +       }
>> +
>> +       INIT_WORK(&qcom_usb->bh_work, qcom_pmic_typec_bh_work);
>> +       platform_set_drvdata(pdev, qcom_usb);
>> +       qcom_pmic_typec_typec_hw_init(qcom_usb);
>> +
>> +       queue_work(system_power_efficient_wq, &qcom_usb->bh_work);
>> +
>> +       return 0;
>> +
>> +err_typec_port:
>> +       typec_unregister_port(qcom_usb->port);
>> +err_put_node:
>> +       fwnode_handle_put(qcom_usb->fwnode);
>> +
>> +       return ret;
>> +}
>> +
>> +static int qcom_pmic_typec_remove(struct platform_device *pdev)
>> +{
>> +       struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
>> +
>> +       cancel_work_sync(&qcom_usb->bh_work);
>> +       usb_role_switch_set_role(qcom_usb->role_sw, USB_ROLE_NONE);
>> +       qcom_pmic_typec_vbus_disable(qcom_usb);
>> +
>> +       typec_unregister_port(qcom_usb->port);
>> +       usb_role_switch_put(qcom_usb->role_sw);
>> +       fwnode_handle_put(qcom_usb->fwnode);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id qcom_pmic_typec_table[] = {
>> +       { .compatible = "qcom,pm8150b-usb-typec" },
>> +       { },
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
>> +
>> +static struct platform_driver qcom_pmic_typec = {
>> +       .driver = {
>> +               .name = "qcom,pmic-typec",
>> +               .of_match_table = qcom_pmic_typec_table,
>> +       },
>> +       .probe = qcom_pmic_typec_probe,
>> +       .remove = qcom_pmic_typec_remove,
>> +};
>> +
>> +module_platform_driver(qcom_pmic_typec);
>> +
>> +MODULE_DESCRIPTION("QCOM PMIC USB type C driver");
>> +MODULE_LICENSE("GPL v2");
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
