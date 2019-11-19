Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE5A5102210
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 11:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfKSKZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 05:25:42 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:45794
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726000AbfKSKZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 05:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574159141;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=9YsqeSDO02fgzsVWBF0WOrYBWmUnZE+aKHDib8MTuCU=;
        b=oGT7QvMJEDaeEwQsN8dnEbdHeAtGwYHMkI/rG/QSExlTQyy0ec2yTsdTzcv+isNU
        5D9OvPsMZE7QfHSy0gzibMTh6oVSi55wwq89FdUT6FYe+9oCRaGsvTDFps9ORUkD3xr
        52L2spRTGSYn5S2qOpfHiaDaSoUXDFQjaaP9zPWw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574159141;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=9YsqeSDO02fgzsVWBF0WOrYBWmUnZE+aKHDib8MTuCU=;
        b=YCT9Vit3cRAX6HTOn/WeksC+LY+PImbaQ8YkO+zfvzCLEsNpXreuXtDzoZ1w4Lyk
        sJruq9zXqo+mw2cPeC2LQTFBpOREHKi3vWZ5AQGlT8Vf554jAOOGg1oMxqWzOTIbkyq
        Nm7Bp+zewsjprTIwcKh290cbfunD0ax91UhJ3L8Q=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Nov 2019 10:25:41 +0000
From:   sibis@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: apr: Add avs/audio tracking functionality
In-Reply-To: <20191119065325.GF18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9d8b5-9759d0ba-4acf-4fc4-a863-fac9c738397f-000000@us-west-2.amazonses.com>
 <20191119065325.GF18024@yoga>
Message-ID: <0101016e83324a05-f96f3ec6-445f-413e-b67e-20a226b54673-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.19-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-19 12:23, Bjorn Andersson wrote:
> On Mon 18 Nov 06:28 PST 2019, Sibi Sankar wrote:
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> [..]
>> +static void of_register_apr_devices(struct device *dev, const char 
>> *svc_path)
>>  {
>>  	struct apr *apr = dev_get_drvdata(dev);
>>  	struct device_node *node;
>> +	const char *service_path;
>> +	int ret;
>> 
>>  	for_each_child_of_node(dev->of_node, node) {
>>  		struct apr_device_id id = { {0} };
>> 
>> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
>> +						    1, &service_path);
>> +		if (svc_path) {
>> +			/* skip APR services that are PD independent */
>> +			if (ret)
>> +				continue;
>> +
>> +			/* skip APR services whose PD paths don't match */
>> +			if (strcmp(service_path, svc_path))
>> +				continue;
>> +		} else {
>> +			/* skip APR services whose PD lookups are registered*/
> 
> Missing space before */

Thanks will add it

> 
>> +			if (ret == 0)
>> +				continue;
>> +		}
>> +
>>  		if (of_property_read_u32(node, "reg", &id.svc_id))
>>  			continue;
>> 
>> @@ -318,6 +365,37 @@ static void of_register_apr_devices(struct device 
>> *dev)
>>  	}
>>  }
>> 
>> +static int apr_remove_device(struct device *dev, void *svc_path)
>> +{
>> +	struct apr_device *adev = to_apr_device(dev);
>> +
>> +	if (svc_path) {
>> +		if (!strcmp(adev->service_path, (char *)svc_path))
>> +			device_unregister(&adev->dev);
>> +	} else {
>> +		device_unregister(&adev->dev);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int apr_pd_status(struct pdr_handle *pdr, struct pdr_service 
>> *pds)
> 
> Why is the pdr status function returning an int?

yes since I am not using the
return value in pdr_helpers
will make it void.

> 
>> +{
>> +	struct apr *apr = container_of(pdr, struct apr, pdr);
>> +
>> +	switch (pds->state) {
>> +	case SERVREG_SERVICE_STATE_UP:
>> +		of_register_apr_devices(apr->dev, pds->service_path);
>> +		break;
>> +	case SERVREG_SERVICE_STATE_DOWN:
>> +		device_for_each_child(apr->dev, pds->service_path,
>> +				      apr_remove_device);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
> [..]
>> @@ -343,20 +421,19 @@ static int apr_probe(struct rpmsg_device *rpdev)
>>  		return -ENOMEM;
>>  	}
>>  	INIT_WORK(&apr->rx_work, apr_rxwq);
>> +
>> +	ret = pdr_handle_init(&apr->pdr, apr_pd_status);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to init PDR handle\n");
> 
> You need to destroy apr->rxwq here as well.

sry missed this

> 
>> +		return ret;
>> +	}
>> +
>>  	INIT_LIST_HEAD(&apr->rx_list);
>>  	spin_lock_init(&apr->rx_lock);
>>  	spin_lock_init(&apr->svcs_lock);
>>  	idr_init(&apr->svcs_idr);
>> -	of_register_apr_devices(dev);
>> -
>> -	return 0;
>> -}
> 
> Regards,
> Bjorn
