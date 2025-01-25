Return-Path: <linux-arm-msm+bounces-46130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A8A1C34D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 13:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90BD3169112
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 12:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D12207E03;
	Sat, 25 Jan 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ks4wyVRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D93596D
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809261; cv=none; b=CX3sosKt9IrHdU29uwzvXOE7Gd5KgACazRe+vDhF0EqlT1pqzLx2vISI0/AYbxDadp8BdL/Gi99bfPLX7F97WAME8myaaaOGwQqYWNvH3CluK/AZFegdMXqGCF8WE5x/LjuUKhYAduCGWCiUSkyO96oj7yRuOccc0D3Mu3JdwWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809261; c=relaxed/simple;
	bh=j3ChbYvYouWV7XVpY7PgSRYLKAkIA5ZPWcLzLL1TU/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4tDprqAPADY8y9WQWIu/gMWdXaTvLBOxGVsOnsJB5wUGaQY9ytFjEQWXEyjYYVNSm9taviUVA99od8NyWTYcSjKJWl7kIxdbwWPQjZEV5ERYyaEr6t6PjW/ve7x8PsrXwyF8lMFfmdpwwL39BZpYSOnCd9b0ztokrqRvjFj5lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ks4wyVRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P9nEUB010886
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 12:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPHYDzKyLDqAStG7X6WB1480nUaAfLXUbqKAnfMUwYc=; b=ks4wyVRDD/MUUAu6
	JZGc4s/AzeKbW30xUP7kykfLX7o45ckKiRrDrXsXg971wQ+1V/VlV65hmVGvr06v
	FuuzupkijrU9TzvRf12Q5uF2tRq6hESPaDmQQW7AvHIGeafHsjEs5OWMpoD0975v
	C3YlI+cyoB1VwNscCsXZcyGbRby4GyGZ8+Kx6HTU3sBCojiRf052z7KFBrxBA0Rv
	e1Hdpz6rfLghk0TR2wbp3r172suhH8kXdV9KgcMJ8aj+uGTwnTkQtpJRqdU0oyN0
	uZ2ajTV1x1VJleQM77wTG9yW5QrSTD/ycW/Sk6Hx4HZ0RK6CBTNAQUor6kKshuad
	K4qWAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cryr8ghw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 12:47:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46b3359e6deso7068921cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 04:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809252; x=1738414052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPHYDzKyLDqAStG7X6WB1480nUaAfLXUbqKAnfMUwYc=;
        b=PLV8bvJdDHVTyN0YrTIY+Pn7oKN8o2nQtdmCTe2IAkLo9HXDZSxdRnm58bJ2tmPuE4
         rnmXGYipbTcI1x2wJm4Q9cLFwOlGKblJ2nGfrWlV7IoJyLKiW9/4Ck5jiyNse57S2W/E
         qs06bO4krN7Uc9/Qei0XCVhAiy8CJYb//P/2Cv/QjM9EXA/djcYdhBWxJADYp2TnYopG
         pb+z3EZ7J1wb0xFAe6ObGw2JlIofCxItVTaafZY5E/Im8zhX0kfjGl1RMtk3fhwC2bae
         GlRrDu/vVnenRY7wUVAYWvtgDqQxNZLZOsoLliJTyhVKA4bXjyTBo5/IGnxd4y55+35J
         hwpg==
X-Gm-Message-State: AOJu0Yy+DlwnDo7gaAf/Z5dC3xY6l/CcOD8fWcEpk4SaYNYlw/vd0R32
	Otx6YbUqPvj3AKeOTdDhqskezCq0jxD77IYQFq1YWR/VtDeQXHD/CqZXctETRX02Z7++25BovBs
	YY+QO7xgmFIKCzKp4c2tVFeRmwQDpLp1VpJA97uHM4TJ/f9X0xzPjzWQzWBkkStF8
X-Gm-Gg: ASbGncv/jTmcTfm1vJLuUtFbcWlIr+UVKtYI+KNvIvH/ikpFdkRncfr2xZsdPB0Tnlo
	wrgOvuLj4T6Z2Y3zp0tZFPcrY1vbP6cHO/k4vRlTRgk5omCKj99GE/17lYu81ubcWAZVUPPpJo6
	NCII7T8cJvRrYzPZrqBUdXzZCV1vr/5I9i+sTBIbCH54hKsNFWdRVgsc7RuiEExAzTwxacrIvif
	fd7yUg7g7gjBbwSuWPW0WwysD71cNwqIJkdOFFIWP0YvYhZ6A+cwWL5Rt55SkvlrhrN/TrVWtbb
	I6E28FRxb5vzPbfvyReLEwlqctPdE/unULzA6gArnc5pap1wgvHYeNazmkw=
X-Received: by 2002:a05:620a:3947:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7be6320bd0cmr1982391385a.8.1737809251714;
        Sat, 25 Jan 2025 04:47:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+tpPHmY40FelAxI+bcpsjIWf+i8whl2Z89kTM+JXBxL0YetqZNT3ifGIkOBx7/dSycvzLDg==
X-Received: by 2002:a05:620a:3947:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7be6320bd0cmr1982387885a.8.1737809251258;
        Sat, 25 Jan 2025 04:47:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbb9fsm283557166b.142.2025.01.25.04.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 04:47:29 -0800 (PST)
Message-ID: <79281aca-c275-4055-8d2c-d2407b0f9811@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 13:47:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com>
 <20250124-preset_v2-v4-2-0b512cad08e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250124-preset_v2-v4-2-0b512cad08e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ey3JaXe2P7Dv1vw5t5xR9b-YFVJLNjLO
X-Proofpoint-ORIG-GUID: Ey3JaXe2P7Dv1vw5t5xR9b-YFVJLNjLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_05,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501250092

On 24.01.2025 12:22 PM, Krishna Chaitanya Chundru wrote:
> PCIe equalization presets are predefined settings used to optimize
> signal integrity by compensating for signal loss and distortion in
> high-speed data transmission.
> 
> As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
> of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
> configure lane equalization presets for each lane to enhance the PCIe
> link reliability. Each preset value represents a different combination
> of pre-shoot and de-emphasis values. For each data rate, different
> registers are defined: for 8.0 GT/s, registers are defined in section
> 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
> an extra receiver preset hint, requiring 16 bits per lane, while the
> remaining data rates use 8 bits per lane.
> 
> Based on the number of lanes and the supported data rate, this function
> reads the device tree property and stores in the presets structure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/of.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h | 24 +++++++++++++++++++++++-
>  2 files changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index dacea3fc5128..7aa17c0042c5 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -826,3 +826,50 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>  	return slot_power_limit_mw;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +
> +/**
> + * of_pci_get_equalization_presets - Parses the "eq-presets-ngts" property.
> + *
> + * @dev: Device containing the properties.
> + * @presets: Pointer to store the parsed data.
> + * @num_lanes: Maximum number of lanes supported.
> + *
> + * If the property is present read and store the data in the preset structure
> + * assign default value 0xff to indicate property is not present.
> + *
> + * If the property is not found or is invalid, returns 0.
> + */
> +int of_pci_get_equalization_presets(struct device *dev,
> +				    struct pci_eq_presets *presets,
> +				    int num_lanes)
> +{
> +	char name[20];
> +	int ret;
> +
> +	presets->eq_presets_8gts[0] = 0xff;
> +	if (of_property_present(dev->of_node, "eq-presets-8gts")) {
> +		ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
> +						 presets->eq_presets_8gts, num_lanes);
> +		if (ret) {
> +			dev_err(dev, "Error reading eq-presets-8gts %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	for (int i = 0; i < EQ_PRESET_TYPE_MAX; i++) {
> +		presets->eq_presets_Ngts[i][0] = 0xff;
> +		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
> +		if (of_property_present(dev->of_node, name)) {

of_property_count_u8_elems returns -EINVAL if the property does not exist

you can then drop a level of indentation:

ret = of_property_read_u8_array...;
if (ret == -EINVAL) {
	continue;
} else {
	...
}


similarly above for 8gts

Konrad

