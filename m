Return-Path: <linux-arm-msm+bounces-54780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45BA94161
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 05:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE91F189F8CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 03:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F0E7DA9C;
	Sat, 19 Apr 2025 03:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLqCOI0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749DD6BFC0
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033081; cv=none; b=aCa+yllarLTsaCPGbA2mE7RuD+CxgXGZSEl7TQn9ehjr6C0H5Jtg9pnR3BGSSBzA0Y/Cg/8NgM83eSTVMnN9voZhfMPscigwAfKxGul/cl6FAHS66j/f1MW2939ljZsMX56xC0KyP9r4GtfnD6IiHluoWNyv0syh1zjxgGh1Ug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033081; c=relaxed/simple;
	bh=OjoyexC/a8B3NPw4OLfb63A5mQlxHOsn31wFhSrjImc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8BR3L7pKEieA0gHJnQexBZiQoIfLIF/23ZgliocymCZ19rSV5Gs7IKzY8lkb3XMxz0fryLo2qpsDQoVt3riZEDUztndEjJqJroJwLD695taIXfSJMzGGPLIB47RIlce6qZ+2QMPJI1/5MaDhDXr13PGSjURM7mNhtevoz3TgLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLqCOI0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J2sxjo016488
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 03:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	suKD7mWbPV8Dc98D+W+coKtB4Sr9t1aOwqOO9XwuSNk=; b=BLqCOI0v7+3gQ4Xo
	zNpVmRWZpXNf7urLEOWpnkAA6wZKqJgWbzP+4DAUT93aNRlhS1hrWS+ctm7+uBjn
	/3xzbL7A3l37JdZKAtKMouipMMkkDFCZYZgXxMejh1fer0gYhJgjAZoZv6+Jgh4p
	/zP9hNda6NtuerHmvTgMERG+bt2IaORaPuDePHg6IBbA56w+CsBgXHWTJeLmpH4g
	BpbbnHxslEyE10lYF8X/yqZZ8r+ZnTDuLzo3BCyGPQFYKHLE8PGeZm6T4Iw44zw8
	/77BV35ssHHH8WfLhOEbEOsq80mAIU5hazrifK2hUO8jxe19lRJ107Ob+Mek/XmP
	YBsgJw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhg55j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 03:24:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73720b253fcso1935382b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 20:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745033077; x=1745637877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suKD7mWbPV8Dc98D+W+coKtB4Sr9t1aOwqOO9XwuSNk=;
        b=LR/ozUPPDYNxrky9ttxXGicPskYtiYSe0lVEKHZLKfet0AWB3y6FtAxcwQtetIUYTW
         57ceJuiBG9aFNXANgiKqSTEEP3pFRSjLJJwusLw7vTn57Hr5oXv0jpnzSkDtXmfPC0/z
         xME8tDCKKU9PKy5Xa+rDyvsYaywWQngNNuATnDJsMv138X4kQi0lLCCt7k0IkNMkbw1v
         ps4RmSYFl5grmmf2RBZwZy2Qq6nVm+mZwhmG3SZ9nFhXfxsrlhTwOacGIH31XYj0hzTO
         KY80rx8fZ/rdF9kYTPdlkwP+7YwF6mzKhC3+584m3i+kw1HTRu1zC+GY55fP4zcdNE61
         G1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXIC62SwKSIknLX7g43GmDVRUwhUKlw4q8tcr6pOB3Z5aYPTxz8nNbaQTOmTwvtwpMBNEgOQtswKmOKptUp@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4JgV95CikS6WEGoqHZvxEF2unjiNvbdlpISH4lrcHfhFD9Fs
	d0Vig2QBIyBTRHUsqdehQqm/rxbIWWuy/IPmB0k2182WwnLxDW0tabS+AGKZBkI2rjk8nBWgH0d
	JzZ4e9KGTPVWGCXZABKPYy+NbOVQMeZYpEfZeMq8NLiI/7xIh5FlfeYZgUwKcvJYD
X-Gm-Gg: ASbGncuHWxwAC3YOMGawHyu5I+cbIWY9vKozO26YwfIP3SSYLu9xXWdwX/wtejz4ddp
	1qKyBCgNO2LU7ed7e7MVXz7KA7vQfpY4mJXLxFFaXXyEStc0HdWRcMKm+yWJqR+P2Kl4Rhxiwyr
	8IgQkFauniCpBxJu2TQV0IAD4GCNH4mFqpiWWi6Ahj/v3IPHvE90/8AaQu/OSbEerQOHMH9ueBi
	DxRQkSWb6SOvqTmsWAsk3mAWl35CZjHreQKWyJ2EsKONcc6ppzZOtbH1qnuZGywkmBs62BV5F0k
	z8EPU7YP3QJ81OJA0ZCE4ZS4KCm3Z2zQSkdhG+Qv9io=
X-Received: by 2002:a05:6a00:3d02:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73dc1480119mr5697357b3a.10.1745033077232;
        Fri, 18 Apr 2025 20:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaTLsO8K9DHo37Za0IPN5HYN8SJIK2QtZbWVmGymla/Zh5qrFN4liImOueE+bM2dukZ9s+aQ==
X-Received: by 2002:a05:6a00:3d02:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73dc1480119mr5697337b3a.10.1745033076682;
        Fri, 18 Apr 2025 20:24:36 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.228.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0857sm2463609b3a.16.2025.04.18.20.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 20:24:36 -0700 (PDT)
Message-ID: <115bcef9-c35c-6a80-e0a6-c862e6b6f011@oss.qualcomm.com>
Date: Sat, 19 Apr 2025 08:54:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 8/9] PCI: pwrctrl: Add power control driver for tc9563
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250418201631.GA82526@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250418201631.GA82526@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=68031776 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=M6NtEvFuFW5htA+UmNA0rQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gmMK7q8T0ENcM4QI6agA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ygj1UMBiJo7puyiIKu9PErdilUuToreK
X-Proofpoint-ORIG-GUID: ygj1UMBiJo7puyiIKu9PErdilUuToreK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190025



On 4/19/2025 1:46 AM, Bjorn Helgaas wrote:
> On Sat, Apr 12, 2025 at 07:19:57AM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is a PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC9563 by upstream port. TC9563 switch
>> needs to be configured after powering on and before PCIe link was up.
> 
> This is described as a generic driver for TC9563, but the ethernet MAC
> stuff built into doesn't sound generic.  Maybe this could be clarified
> here and in the Kconfig help text.
> 
The switch has a DSP to which embedded ethernet was connected, I will
update the text in next patch.
>> +#define TC9563_GPIO_CONFIG		0x801208
>> +#define TC9563_RESET_GPIO		0x801210
> 
> I guess these are i2c register addresses?
> 
yes
>> +#define TC9563_BUS_CONTROL		0x801014
> 
> Unused.
> 
I will remove
>> +#define TC9563_PORT_L0S_DELAY		0x82496c
>> +#define TC9563_PORT_L1_DELAY		0x824970
> 
> I guess these correspond to "L0s Exit Latency" and "L1 Exit Latency"
> in the PCIe spec?  Can we name them to suggest that?  Where do the
> values come from?
> 
ack
>> +#define TC9563_EMBEDDED_ETH_DELAY	0x8200d8
>> +#define TC9563_ETH_L1_DELAY_MASK	GENMASK(27, 18)
>> +#define TC9563_ETH_L1_DELAY_VALUE(x)	FIELD_PREP(TC9563_ETH_L1_DELAY_MASK, x)
>> +#define TC9563_ETH_L0S_DELAY_MASK	GENMASK(17, 13)
>> +#define TC9563_ETH_L0S_DELAY_VALUE(x)	FIELD_PREP(TC9563_ETH_L0S_DELAY_MASK, x)
> 
>> +#define TC9563_PWRCTL_MAX_SUPPLY	6
>> +
>> +struct tc9563_pwrctrl_ctx {
>> +	struct regulator_bulk_data supplies[TC9563_PWRCTL_MAX_SUPPLY];
>> +	struct tc9563_pwrctrl_cfg cfg[TC9563_MAX];
>> +	struct gpio_desc *reset_gpio;
>> +	struct i2c_adapter *adapter;
>> +	struct i2c_client *client;
>> +	struct pci_pwrctrl pwrctrl;
>> +};
> 
>> +static int tc9563_pwrctrl_i2c_write(struct i2c_client *client,
>> +				    u32 reg_addr, u32 reg_val)
>> +{
>> +	struct i2c_msg msg;
>> +	u8 msg_buf[7];
>> +	int ret;
>> +
>> +	msg.addr = client->addr;
>> +	msg.len = 7;
>> +	msg.flags = 0;
>> +
>> +	/* Big Endian for reg addr */
>> +	put_unaligned_be24(reg_addr, &msg_buf[0]);
> 
> Of the 1000+ calls to i2c_transfer(), I only see about 25 uses of
> put_unaligned_be*() beforehand.  Are most of the other 975 calls
> broken?  Or maybe they are only used on platforms of known endianness
> so they don't need it?  Just a question; I have no idea how i2c works.
> 
The I2C in the switch expects big endian format for address and this
requirement is specific to i2c on this switch only. Not every i2c
devices may have this requirement.
>> +	/* Little Endian for reg val */
>> +	put_unaligned_le32(reg_val, &msg_buf[3]);
>> +
>> +	msg.buf = msg_buf;
>> +	ret = i2c_transfer(client->adapter, &msg, 1);
>> +	return ret == 1 ? 0 : ret;
>> +}
> 
>> +	ret = of_property_read_u8_array(node, "nfts", cfg->nfts, 2);
>> +	if (ret && ret != -EINVAL)
>> +		return ret;
> 
> Asked elsewhere whether "nfts" is supposed to match the DT "n-fts"
> property.
> 
ack it is a miss from my side, I will fix in next patch.
Thanks for catching this.
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
>> +	 /* wait for the internal osc frequency to stablise */
> 
> s/stablise/stabilize/ (or "stabilise" if you prefer)
> 
>> +	usleep_range(10000, 10500);
> 
> Where do these values come from?  Can we add a spec citation?
>
This is from The tc9653 databook. I will add spec citation in next
patch.

>> +		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(ctx, i, false, cfg->l0s_delay);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting L0s entry delay failed\n");
> 
> Since these are *entry* delays, maybe they're not related to the "Exit
> Latencies" from the PCIe spec.  But if they *are* related, can we use
> the same terms here?
>
These are entry delays, not the exit latencies from the Spec.

>> +		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(ctx, i, true, cfg->l1_delay);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting L1 entry delay failed\n");
> 
>> +		ret = tc9563_pwrctrl_set_tx_amplitude(ctx, i, cfg->tx_amp);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting Tx amplitube failed\n");
> 
> s/amplitube/amplitude/
> 
>> +			goto power_off;
>> +		}
>> +
>> +		ret = tc9563_pwrctrl_set_nfts(ctx, i, cfg->nfts);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting nfts failed\n");
> 
> s/nfts/N_FTS/ to match spec usage.
> 
>> +static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>> +{
> 
>> ...
>> +	ctx->supplies[0].supply = "vddc";
>> +	ctx->supplies[1].supply = "vdd18";
>> +	ctx->supplies[2].supply = "vdd09";
>> +	ctx->supplies[3].supply = "vddio1";
>> +	ctx->supplies[4].supply = "vddio2";
>> +	ctx->supplies[5].supply = "vddio18";
> 
> Seems like this could be made into a const static array, maybe next to
> TC9563_PWRCTL_MAX_SUPPLY?
> 
ack
>> +	for_each_child_of_node_scoped(pdev->dev.of_node, child) {
>> +		ret = tc9563_pwrctrl_parse_device_dt(ctx, child, port++);
>> +		if (ret)
>> +			break;
>> +		/* Embedded ethernet device are under DSP3 */
>> +		if (port == TC9563_DSP3)
> 
> Is this ethernet thing integrated into the TC9563?  Seems like the
> sort of topology thing that would normally be described via DT.
> 
The switch has inbuilt integrated ethernet and we described in the DT
for the same.

- Krishna Chaitanya.
>> +			for_each_child_of_node_scoped(child, child1) {
>> +				ret = tc9563_pwrctrl_parse_device_dt(ctx, child1, port++);
>> +				if (ret)
>> +					break;
>> +			}
>> +	}
> 
> Bjorn

