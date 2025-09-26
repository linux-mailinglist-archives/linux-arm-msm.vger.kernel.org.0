Return-Path: <linux-arm-msm+bounces-75332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39486BA4B25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 18:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 916377A90A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 16:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C812FF155;
	Fri, 26 Sep 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+iVNCIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79422FF147
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905017; cv=none; b=f9GPHVtWZI9MhoRrtmt+EUX+phEUN+rcV37M88HWxbmyacwIfhXa8ZdPzQ+NwyIYoUS9HqwqjYKgOobIvUIH4orJ8Xj8wlulMz0xqCrmQFhTrbF5J1yQOC1g59/gzDbsBbDhmVKkXf0Cd6WEPft0sIl6xn/NVvJ5AGFyTzRlLk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905017; c=relaxed/simple;
	bh=rIG4cWp43cAsNeKr1YLyi9hOy3sx5IQvvF4wOGxpB34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYEJgtZ+dov6edYJFpeOjF77r8S+46gAqmeBym0u9O5XozMCDQW6QoQIbaIqI0KB0ub79uIzbWyt1leAx6LBPc1Hn57ZdOj7kQCMHnHPyIppULDY5+zsLh4HKExe+gr3ZALQg8g2qa9n/PNZ792ajLgnIOwgNAn2qLovP5wajgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+iVNCIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWoot009470
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 16:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOAJKtszuFOluuG6qYkOjreur/Dr9vuVBO3HUnQ0sBI=; b=h+iVNCItG8IaNeo1
	5WKet2QPTfpcZVIJTNHUnA1IGc0tJXiF0e4OMG0eP89dQxPTjv3yUpM8TBpP7DAQ
	IhgMxGGm26m+RUmIboNHJp9FYOTEs0zvE1UKja8TxVWN01jYtZGZ2b4L7OByN55k
	nvAF8UZh13tjgob9ioN1jL40C5FnHTr/OhnbunN9yvOMYo7nCmUH9ESTkm7Vm/Cd
	Y4w6DOwI+N7tepyxyoudTuzUxhkDo5oieO0MmxITVHu+OEfXeGxu5D2ea3vWkkm4
	34Ju6XGEucVq4FkxEIvY496FdY7jXIIEjEgXTT6jFF3R9nSrsLRIh0JvYbaBfdI4
	3X+eZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwh591-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 16:43:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso2035620b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905014; x=1759509814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOAJKtszuFOluuG6qYkOjreur/Dr9vuVBO3HUnQ0sBI=;
        b=Xv/Il7CFOgxROmyK0gtapf9ZTTewzQDldAdPhAVnP+fLdf4yHtCZBl8oDfd50MS+nH
         knj+X4xP7vl13an1dBM5EeWT3xNS7Jd/DuCDFj0+y+qvuaM1eE4mOs4tf0c4E/DkfU46
         sg79jGv3LdWct0lFB+1ZD2mxqap+AFTNmaeC2XJV6KSGQPMw7cgNFtysXF8MtAh1CcXh
         ccNH+nBI1GR26Xqx7Y0jN3EmxrrF/2V34EPfLTt1fQConD8R2FJAuPLlXC3IhlDLAomX
         6qURJcQhmTB6BeXI9M/bzfYtY/mOl+KHN926TFM+ezmp771Mc0HOQddkqQC8Gfcb88ej
         kO6g==
X-Forwarded-Encrypted: i=1; AJvYcCWpE5Fa79wBlpGDHT55CfeULx3lVPnSRd6jXR3F6AGghAizUlG5fqTQY4h2cq7rGUj786ZemPAqCcX42NPk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0H6xs42VdTiQEjItmhkz3pCjmQVhzt34iHxmzfMQ8lU6T3XBN
	GvWJr5RxYfFGmFmsZdS5laHfkR+LyxTrY9RawQRf9JxWJ+b4L6BjIYqpLA+BNFf9KLu9+oSVaXn
	8PZ/cJaWq9TYmrjO9gs5onFUTokIjSe3VucaRKDJ/KNGuW7ngJjzMGFZe56QUou/nH3kg
X-Gm-Gg: ASbGncvaDcHORszwWhHaJDEkftBthMNQY4N/TTvx22u1TBpPI+Hgl3qgJPwFsfjg4mr
	wRoElB2vlsvFCZ2x1M3rkUZqAQc4KgncNj31Cw199qmwP8JRYzi+S5PQUsSlZsmXo48tyTFB7Fa
	zpwKPUMhi9rctNCoz2W9JUCdXmKpj4r46qbgMxCB1K2rXrcL315qOGDmTyShmy3vnCLCKAygjh4
	GAJrE6c5H0cPmaZ3ZQUVS7BGlQWtrGWS4j1hwV5kcVhoTUvp5d5fn6jDQ64j521y/KV7e7pv009
	x5ZjLC7X9mQDBBrj+lW3fs0nh+/lk/KhbRMjBChLF6meOpbLWBcFurUH7FaTDZmoJpPHE6ozKbI
	=
X-Received: by 2002:a05:6a00:2186:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-780fce1d14fmr7444703b3a.10.1758905013423;
        Fri, 26 Sep 2025 09:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5vWBMgBvL7brIlV8nI5zcGRZcgZLch/n6zvZd8dJYGcdbkBvuKaAP5Kh0UT+1HHmZItjGyg==
X-Received: by 2002:a05:6a00:2186:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-780fce1d14fmr7444655b3a.10.1758905012812;
        Fri, 26 Sep 2025 09:43:32 -0700 (PDT)
Received: from [192.168.29.113] ([49.43.224.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c8aebsm4809340b3a.28.2025.09.26.09.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 09:43:32 -0700 (PDT)
Message-ID: <7cd09815-a657-47cc-9cc2-3751996c3592@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 22:13:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] PCI: pwrctrl: Add power control driver for tc9563
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250925143924.GA2160097@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250925143924.GA2160097@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IhBrThJd5bp-tFhg8cLG4oMPQDDhSAfL
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d6c2b6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=w+9hNF1SH6wH5mqaHp+xkw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qleSEWVE8P8leAEWZfgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: IhBrThJd5bp-tFhg8cLG4oMPQDDhSAfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX9hlscYwqh9ez
 f6fZesYb/Yqgb+PNs2shZW1uqxu75wNoe8RVJjXOgBB7laG1eKHdw15cpAgS42aLsIrXZJLnNhU
 /q9e3+4ITOjfYvO9brR0Mb/WIEGxXGUHKm9xGzd9HoWz+g0cND3ugPuZe1eErRGvt8Mkq6N1JBJ
 H5gT/mjeSq7nRnuDK1BVepj3fzkGLZEVei8l9zP5jQIV2RUeUBTLQJeQqsZyJNPmfxnYlD+YIP8
 nJEOUCYve7qJjLSFV56AQ8f2Xrj+0jOnLuKG3znNIPiP8ZAi8X81nO2N6QM0F+u7KR80BGt95L5
 pOw8P5sz3baB/zfy+njM18XUpjjX9YmNmzCNQz1gsWpCYQxkoDRufJHDcRc83OephfB+N8DMoHQ
 bkOSqhKYmec77kW20WOuF78H3UXYBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089



On 9/25/2025 8:09 PM, Bjorn Helgaas wrote:
> On Thu, Aug 28, 2025 at 05:39:05PM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is a PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports integrated ethernet MAC is connected
>> as endpoint device. Other two downstream ports are supposed to connect to
>> external device. One Host can connect to TC9563 by upstream port. TC9563
>> switch needs to be configured after powering on and before the PCIe link
>> was up.
>>
>> The PCIe controller driver already enables link training at the host side
>> even before this driver probe happens, due to this when driver enables
>> power to the switch it participates in the link training and PCIe link
>> may come up before configuring the switch through i2c. Once the link is
>> up the configuration done through i2c will not have any affect.To prevent
>> the host from participating in link training, disable link training on the
>> host side to ensure the link does not come up before the switch is
>> configured via I2C.
> 
> s/any affect/any effect/
> s/.To prevent/. To prevent/
> 
>> Based up on dt property and type of the port, tc9563 is configured
>> through i2c.
> 
> s/up on/on/
> 
> Pick "i2c" or "I2C" and use it consistently.
> 
>> +config PCI_PWRCTRL_TC9563
>> +	tristate "PCI Power Control driver for TC9563 PCIe switch"
>> +	select PCI_PWRCTRL
>> +	help
>> +	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
>> +	  switch.
>> +
>> +	  This driver enables power and configures the TC9563 PCIe switch
>> +	  through i2c.TC9563 is a PCIe switch which has one upstream and three
>> +	  downstream ports. To one of the downstream ports integrated ethernet
>> +	  MAC is connected as endpoint device. Other two downstream ports are
>> +	  supposed to connect to external device.
> 
> s/i2c.TC9563/i2c. TC9563/
> 
>> +static int tc9563_pwrctrl_bring_up(struct tc9563_pwrctrl_ctx *ctx)
>> +{
>> +	struct tc9563_pwrctrl_cfg *cfg;
>> +	int ret, i;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> +	if (ret < 0)
>> +		return dev_err_probe(ctx->pwrctrl.dev, ret, "cannot enable regulators\n");
>> +
>> +	gpiod_set_value(ctx->reset_gpio, 0);
>> +
>> +	 /*
>> +	  * From TC9563 PORSYS rev 0.2, figure 1.1 POR boot sequence
>> +	  * wait for 10ms for the internal osc frequency to stabilize.
>> +	  */
>> +	usleep_range(10000, 10500);
> 
> Possible place for fsleep() unless you have a specific reason for the
> +500us interval?
> 
>> +static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>> +{
>> +	struct pci_host_bridge *bridge = to_pci_host_bridge(pdev->dev.parent);
>> +	struct pci_dev *pci_dev = to_pci_dev(pdev->dev.parent);
>> +	struct pci_bus *bus = bridge->bus;
>> +	struct device *dev = &pdev->dev;
>> +	enum tc9563_pwrctrl_ports port;
>> +	struct tc9563_pwrctrl_ctx *ctx;
>> +	struct device_node *i2c_node;
>> +	int ret, addr;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u32_index(pdev->dev.of_node, "i2c-parent", 1, &addr);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to read i2c-parent property\n");
>> +
>> +	i2c_node = of_parse_phandle(dev->of_node, "i2c-parent", 0);
>> +	ctx->adapter = of_find_i2c_adapter_by_node(i2c_node);
>> +	of_node_put(i2c_node);
>> +	if (!ctx->adapter)
>> +		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find I2C adapter\n");
>> +
>> +	ctx->client = i2c_new_dummy_device(ctx->adapter, addr);
>> +	if (IS_ERR(ctx->client)) {
>> +		dev_err(dev, "Failed to create I2C client\n");
>> +		i2c_put_adapter(ctx->adapter);
>> +		return PTR_ERR(ctx->client);
>> +	}
>> +
>> +	for (int i = 0; i < TC9563_PWRCTL_MAX_SUPPLY; i++)
>> +		ctx->supplies[i].supply = tc9563_supply_names[i];
>> +
>> +	ret = devm_regulator_bulk_get(dev, TC9563_PWRCTL_MAX_SUPPLY, ctx->supplies);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret,
>> +			      "failed to get supply regulator\n");
>> +		goto remove_i2c;
>> +	}
>> +
>> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ctx->reset_gpio)) {
>> +		ret = dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "failed to get reset GPIO\n");
>> +		goto remove_i2c;
>> +	}
>> +
>> +	pci_pwrctrl_init(&ctx->pwrctrl, dev);
>> +
>> +	port = TC9563_USP;
>> +	ret = tc9563_pwrctrl_parse_device_dt(ctx, pdev->dev.of_node, port);
>> +	if (ret) {
>> +		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
>> +		goto remove_i2c;
>> +	}
>> +
>> +	/*
>> +	 * Downstream ports are always children of the upstream port.
>> +	 * The first node represents DSP1, the second node represents DSP2, and so on.
>> +	 */
>> +	for_each_child_of_node_scoped(pdev->dev.of_node, child) {
>> +		ret = tc9563_pwrctrl_parse_device_dt(ctx, child, port++);
>> +		if (ret)
>> +			break;
>> +		/* Embedded ethernet device are under DSP3 */
>> +		if (port == TC9563_DSP3)
>> +			for_each_child_of_node_scoped(child, child1) {
>> +				ret = tc9563_pwrctrl_parse_device_dt(ctx, child1, port++);
>> +				if (ret)
>> +					break;
>> +			}
>> +	}
>> +	if (ret) {
>> +		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
>> +		goto remove_i2c;
>> +	}
>> +
>> +	if (!pcie_link_is_active(pci_dev) && bridge->ops->stop_link)
>> +		bridge->ops->stop_link(bus);
> 
> Is this pcie_link_is_active() test backwards?  Seems like you would
> want to stop the link if it *is* active.
> 
you are right pci_dev extracted seems wrong and not pointing to root
port dev, and  returning always zero. It is pointing to pci_dev in host
bridge which doesn't point root port.

Thanks for pointing this.

I will fix it in next version.
> pcie_link_is_active() is racy, and this looks like a situation where
> that could be an issue.  Would something break if you omitted the test
> and *always* stopped and started the link here?
if we stop the link if the pcie link is active then we might see AER's &
linkdown.

- Krishna Chaitanya.
> 
>> +	ret = tc9563_pwrctrl_bring_up(ctx);
>> +	if (ret)
>> +		goto remove_i2c;
>> +
>> +	if (!pcie_link_is_active(pci_dev) && bridge->ops->start_link) {
>> +		ret = bridge->ops->start_link(bus);
>> +		if (ret)
>> +			goto power_off;
>> +	}
>> +
>> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &ctx->pwrctrl);
>> +	if (ret)
>> +		goto power_off;
>> +
>> +	platform_set_drvdata(pdev, ctx);
>> +
>> +	return 0;
>> +
>> +power_off:
>> +	tc9563_pwrctrl_power_off(ctx);
>> +remove_i2c:
>> +	i2c_unregister_device(ctx->client);
>> +	i2c_put_adapter(ctx->adapter);
>> +	return ret;
>> +}

