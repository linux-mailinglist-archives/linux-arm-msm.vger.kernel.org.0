Return-Path: <linux-arm-msm+bounces-51588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C3A64697
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 10:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AA6A1893F81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 09:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37DE21E096;
	Mon, 17 Mar 2025 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAPbskh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6B1A9B58
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202478; cv=none; b=R8bnFlKJPKIjhE+Iiu3rMQRzUkyU2zDuzJ1wAAZGbvkKQ5PemaTtuBzpFUM0r4IL9lWONLTECs5hPHBMpr7OdeS2mtrMmcoMHxAItfs/T7DsLZSfHmUrrnbH16Ge7dMWCI3Ts1cdERXZIEIZa1UNbQ58wZJ/XILpMM7OaDdb3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202478; c=relaxed/simple;
	bh=+AiPVzF7b1V/vgA2zpvuQUa7wN7Ef6NyFUe8lYcs+os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFNqVB14NdEizKFyfsTZgVBylmJ2Ssi+bSUXM6oGSkLNTn5vvO2VrxiuCPnG6hfUnaYsQiqC+taeXty+Ua7T7JHc/OqouI715qF09Q0HgrljeX+LeFcSXRDeTbQ3KIEKly2U/CPzkXjai4bGWPsohzWnEai0+vkQ4dNjP0gyOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAPbskh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GMQJQ8014765
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 09:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvB5W9+kgBjKeK0p1OnHFcTClNx4sp6hZOaOwkPfr5g=; b=YAPbskh2+wkbluk3
	5cBVUNQ9k3avEdIeJktk6MZokj4tc+9OjvQUdH+lPkEo2t9Fmje3dhAEDBHfC4Gg
	r5k3Tn49obaqtFF6wrerRo40/7sxmyDU6bfnDN/i6H6ja1M9NgV4KHb/TyJuGJqo
	euyfof4BXRLF70ZjGN47P5PuiZoYRNHVEMrd0atI3O7/bZyvojmECKKqGlMHqzjv
	6+EW7hFtX2axwgy5ZffqGB+LrR4jH1ACBQJkjhp2oAg32rK44yldgj51I7H+m9KY
	nqh34nrzsLIbgrHAEylUEqxDkIDX01R9N21HBUOobTt5BmPIT1RXnf7RnqI8O5vd
	jdjI/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2ahc29w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 09:07:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2233b764fc8so72816195ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 02:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202474; x=1742807274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvB5W9+kgBjKeK0p1OnHFcTClNx4sp6hZOaOwkPfr5g=;
        b=QzCeG5PXhT4eo5sq4fo0+F3Be1PGh+PGMWCDenxWjyDPQZQWp1Nm/QFwbECK+KryP/
         Q986o2M2GpqOCinkjzzA8xFhMNGvTgiFHnB4ZcdEKpy2Wu6CNanCDitja9wE88dGXRcQ
         ZdgqTvSrO5IdxxuXSAdi2dNFS/TjM/QN0HX5tYpHhyg3OrPw5VJiGogfVUbqypa5f7c1
         7tFSzOQap/4OQcbJ5pzZnbP6N1/7MxwT8az3O+dc/ADWh+EsfLWy4UhuomVLOTM/2W/f
         Njdnvt2rEJBL2L/N1QQSjOxP6ah3KuJ2SEVjrc9emFVmnewq9XRhCrdtiDNzzaasOvXZ
         voRg==
X-Forwarded-Encrypted: i=1; AJvYcCUcAM6f16v89Jo+/wi3vxH/bZH3uNV4xKw9PdE12JUnARrE4VUuQ59e3+R86SIh0DdwTR3ApRCEeIHkFbeN@vger.kernel.org
X-Gm-Message-State: AOJu0YzNLNnfK91lEnNvcXFek32AIwzfkThMZe5TQ3V3Ep5MOxM9qjCL
	PNZ6H0WMAKWLeoAczDp9bi8kwyjzGYHtb0dBYpkbCHGMLlqU9f/h6b43I01aXl3kvAE9mP5GC7z
	+3cvT0CPj0GcN9u9Db7WsxsJ+vRzj6iXT6Ow96HDmnFua2UrQU984MfqSsc1drfrl
X-Gm-Gg: ASbGncsLyJE2OqKSCaoVUDldbsH0eo6s7FGXmu4GPuDoqxfT+sQdcS8kfCVC6rq6SeW
	MmPyaqNwyAvwThNjN4qYMT35B6f/KZPBXaGVmFEkHTIUjHORAZDOQRqN7fS46FOmwCqdNVRy6Oo
	icz7pHGit0J5YZuVlRWvqDadYOfDAjVT6flHjBW88tCKlguy9mXYvGjLsw+MSmM5otZb6sZyIE8
	ES1nccr77xRsX3qoqlj2eSzjUUKLXo47b3YHvmT0hQiljh+3LQ+0FmF6whiy5xZ5iaDIk+S177M
	mYjw/RT42xZTNCVT+dYN5YPJJNU4v8aI9FJUn8x+Xu/r/Q==
X-Received: by 2002:a05:6a00:2e15:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-7372236c48amr15633856b3a.3.1742202473714;
        Mon, 17 Mar 2025 02:07:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb2/5Yz0QBAf85V3J3MJIKQQYTZZtL2r4Zp4gVmTlQYnG653reK868zYsRjio4CbC3TLgJeQ==
X-Received: by 2002:a05:6a00:2e15:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-7372236c48amr15633816b3a.3.1742202473230;
        Mon, 17 Mar 2025 02:07:53 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711557ee8sm7351197b3a.52.2025.03.17.02.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:07:52 -0700 (PDT)
Message-ID: <74ff7b72-94d6-cd19-06c4-09cddc885cb0@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 14:37:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 08/10] PCI: pwrctrl: Add power control driver for
 tc956x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
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
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-8-e08633a7bdf8@oss.qualcomm.com>
 <d8ef7b67-a31f-4a49-8810-90dfebd2d8e1@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <d8ef7b67-a31f-4a49-8810-90dfebd2d8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lTFlqOFpFLeHzNKa5qkkFwnBaNRKfssh
X-Proofpoint-GUID: lTFlqOFpFLeHzNKa5qkkFwnBaNRKfssh
X-Authority-Analysis: v=2.4 cv=R7kDGcRX c=1 sm=1 tr=0 ts=67d7e66a cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LmMbr2wudRAhekVMzXwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_03,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170067



On 2/25/2025 5:39 PM, Konrad Dybcio wrote:
> On 25.02.2025 10:34 AM, Krishna Chaitanya Chundru wrote:
>> TC956x is a PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC956x by upstream port. TC956x switch
>> needs to be configured after powering on and before PCIe link was up.
>>
>> The PCIe controller driver already enables link training at the host side
>> even before this driver probe happens, due to this when driver enables
>> power to the switch it participates in the link training and PCIe link
>> may come up before configuring the switch through i2c. Once the link is
>> up the configuration done through i2c will not have any affect.To prevent
>> the host from participating in link training, disable link training on the
>> host side to ensure the link does not come up before the switch is
>> configured via I2C.
>>
>> Based up on dt property and type of the port, tc956x is configured
>> through i2c.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
> 
> 
>> +struct tc956x_pwrctrl_cfg {
>> +	u32 l0s_delay;
>> +	u32 l1_delay;
>> +	u32 tx_amp;
>> +	u8 nfts[2]; /* GEN1 & GEN2*/
> 
> GEN2 */
> 
> [...]
> 
>> +static int tc956x_pwrctrl_set_l0s_l1_entry_delay(struct tc956x_pwrctrl_ctx *ctx,
>> +						 enum tc956x_pwrctrl_ports port, bool is_l1, u32 ns)
>> +{
>> +	u32 rd_val, units;
>> +	int ret;
>> +
>> +	if (!ns)
>> +		return 0;
>> +
>> +	/* convert to units of 256ns */
>> +	units = ns / 256;
> 
> Should we round up here, so that values in 1 <= x < 256 give a delay
> value of 1 unit? Or maybe such values are never expected?
> 
I will add a check above to return if ns < 256 as 0 is not expected
value.
> [...]
> 
>> +static int tc956x_pwrctrl_set_tx_amplitude(struct tc956x_pwrctrl_ctx *ctx,
>> +					   enum tc956x_pwrctrl_ports port, u32 amp)
>> +{
>> +	int port_access;
>> +
>> +	if (amp < TC956X_TX_MARGIN_MIN_VAL)
>> +		return 0;
>> +
>> +	/*  txmargin = (Amp(uV) - 400000) / 3125 */
> 
> double space
> 
>> +	amp = (amp - TC956X_TX_MARGIN_MIN_VAL) / 3125;
> 
> similarly here, is 0 an expected value for 1 <= x < 3125?
> 
Here 0 is expected value in this case.

- Krishna Chaitanya.
> Konrad

