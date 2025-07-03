Return-Path: <linux-arm-msm+bounces-63477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018FAF6910
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 06:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5AE4A54CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 04:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858128B4EC;
	Thu,  3 Jul 2025 04:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODOEFZtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8432C23237B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 04:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751516308; cv=none; b=gx+ZLdC4C/b9RHlTepWDU1TUeE8BSgKoBm4sIq0MmSYoI/J42SpXJKhw54c4666vuykEYkDFN2i8VLqI/YZx/k+Sr2CiwN9E9kowChZiViUIUDdb/sy2LgB6LYUMe09OgEs5SkF8JlHzxvL7MtklbmxjrnKMn6scfr792hx3TL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751516308; c=relaxed/simple;
	bh=yYuF9F6UXPe1+nRemOM3FS1DclLed2FkVUesNJnZsl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paijBh2Gtxygc+6X9VrvohHhFi71Z0ZGzETmyOHaiGdvyxap6jZx8AiNYAEO5CV51D5BpVK4lGHJdzgCr7gzV8SqOSVm7casUHvOO8mAs28jmwqJnYlelVRHdu50inpZhhvAphxyxXuRI3HWpkMPhpvnAXalgYQCZ11sgiT2qDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODOEFZtG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562M3PSJ032118
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 04:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NaW9HsleXJDnHysTKiBKa5wP27JduvuH7fRxzKY+H4=; b=ODOEFZtG4zyejscx
	uKOWP/fCjR/RvatpjE9PJ8m9hu75uZzUGzlmjrt7I+9ONy0ISBcnGDl6sktSwpRK
	fgpznk2h74l38h8CZ40GXIGP8FAHa/fRMyMyD8GXrfbUeilT3urXKEAhFM61Qns0
	GGHnJcpCjNjKTid91ThxBJo45j8KKLFGjlak0QF3MDsrprC+pPsR6qApWbSnwc0A
	u8UXqLfV8ST6tzvy5udKXHnqkzBAr7azkYm2RjOPyIicfUlOpoCKsGRhVpHVxRsl
	5/9HtbZo1IHMtsG45DUYRTZDvqeQmKHLFAnGHiE+YI7s6RpnoFYvTZv7JVlqrKfT
	TcOzhA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kf880-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 04:18:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b115fb801bcso9007222a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 21:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751516305; x=1752121105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NaW9HsleXJDnHysTKiBKa5wP27JduvuH7fRxzKY+H4=;
        b=q/aEQ1POxzgR6UJdeiqyREqEvDTxo95Owy+6YcIdQYssYw/taB6xJO33QeYqeTNK8p
         6y1qAyTrnZwSXLUvhOewQZC066Wh3nnCC8XG+J2TSneM0L4gfdQ6UtY1yUK4inCGWOwq
         VRyZgGaXZEk1fwleRUwl5ZzJvS6jZBl07gNzYFaNF6SZy1KABmxBJzHv1hk0FTl/rYUF
         pAiz6lmp0yOsua3yuZI2mDbYeuHo9HraUDO1s3c7eNslG82z0qUS0m0X5Yjvzb0AE8hR
         gwC8QjyUS+KJ8N6E2/+KdvawcumeP9GrriZ8ESZF2p6dy+ouNHFMo8kbmPdrcQvRJjC8
         eWtw==
X-Forwarded-Encrypted: i=1; AJvYcCV1aD8DYO4ZCUTG8MAM9yMMrZOjcaasUviGfpX5Yp8sL2siWUMSMVUwgzr7Do1sd3DIWxT4sVJahArPW2jn@vger.kernel.org
X-Gm-Message-State: AOJu0YxdG6fVp7ppiRKRV+vcNcZbogzK8jB+cb5nRq8TMFi9TzZuSP4a
	UuiWldgrfNnmXGvcufDrJTuyuVpha2bV55rzRTEoqTFe3R9lF5sF6Fm0LeDR+6MwXNYavhQ2vgS
	5gUzoDv43zJus4fx2AFGzSt6UVXhomC6xye+FP6s2pHeaAjm4RyYlKFkH/JfG5lWZJTgJmG7gRN
	TL
X-Gm-Gg: ASbGncuiZix/rYWXz+S2X6ZgsuVMsTI0BJNcOR4kFl4iPrbflv3hIqdHk+2t8eiVZ6f
	e9NMFhn9Q9f99aRU9mnn7cfDLH5sdsqpCHkbA3qFVdAl1qaxBrXI3PK6mH/R5Id0bSd5JL578ji
	o5pkMilULM90jbrcLR90Jw5O+rxO2+LcGjbyjCZtJi4Ny5rtZKNvarAyFWil2CEEpeJKh5W3RRt
	X6s0ZlnSbQA+Bpyd3kgXOeLIJYQ8+o2nupl9PhBABdtTJhpLx3XFOmBH4QQkz3YUH5NFHY6K9o0
	6ompMpg0bOCihgxiuQogb8WDP9blmRlNPSTeCEzO6Itp7xFE5wWo
X-Received: by 2002:a17:902:ea0d:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23c6e5d52ffmr79875275ad.45.1751516304605;
        Wed, 02 Jul 2025 21:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiJQOQ3rj9Z3Ib0vpUq3Vmcwr9EZOVs8di8axva0PyX0K2M8GE7BrJgKKE40SijB5rZCol7A==
X-Received: by 2002:a17:902:ea0d:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23c6e5d52ffmr79875065ad.45.1751516304213;
        Wed, 02 Jul 2025 21:18:24 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e3b40sm148262145ad.26.2025.07.02.21.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 21:18:23 -0700 (PDT)
Message-ID: <cbf32980-8608-42ba-99c7-deed56afae32@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 09:48:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] PCI: qcom: Add support for multi-root port
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250702-perst-v5-0-920b3d1f6ee1@qti.qualcomm.com>
 <20250702-perst-v5-2-920b3d1f6ee1@qti.qualcomm.com>
 <ws2kdznvbrvuvb6k4jov5cd4qzvadeaffjqgeso7u72stormlg@2ffiexejkrk6>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ws2kdznvbrvuvb6k4jov5cd4qzvadeaffjqgeso7u72stormlg@2ffiexejkrk6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68660491 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=elFezDTcsRQGgYhLSLwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAzMSBTYWx0ZWRfXz/fadUt783Wu
 uCtKMMcLIogcicCDzzmV/7yKuMiTh2XXoZ+GrIFCtzkpQ1WW7ssgZjrZcyn2k1nb2s6LwmZbf2s
 LRXA2yY2RD0S3g/dBX+xEaWHCoWlyGag4To208hSQQSif4ZxD46TuzGF1Q+cbnaZeLELIqF3KY7
 QUZoxuceK8paSbzhch40FUdoaFOZdonQH+dz9o3sFLyfL0B6KNch36VkZBOtNyQCI40XZjNYTKo
 Ow+4Fsj6jNrzjDW//Az9ZAw2HW9i3xolVy5jFZf5DEY0ql5yw19/5q+QLq08G+q/wubQ/aa5q0d
 RjkuW4HS3m30QEGRR+gXNR3AabczVk78sKAny5eR3v7p+HxvFCdgyXx/U3To2X3r71Zi+d36jrN
 nBWPKsNOTPUxWEvnidveejciHXrBcn1rd2gZJ9tYl9ilzX46pJSRGHMSosKtR2vcziIQfcON
X-Proofpoint-ORIG-GUID: pU3hSCLo3pY0xGmwUaDY-0zP2f3jbKPI
X-Proofpoint-GUID: pU3hSCLo3pY0xGmwUaDY-0zP2f3jbKPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030031



On 7/2/2025 9:03 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 02, 2025 at 04:50:42PM GMT, Krishna Chaitanya Chundru wrote:
> 
> [...]
> 
>> -	ret = phy_init(pcie->phy);
>> -	if (ret)
>> -		goto err_pm_runtime_put;
>> +	for_each_available_child_of_node(dev->of_node, of_port) {
>> +		ret = qcom_pcie_parse_port(pcie, of_port);
>> +		of_node_put(of_port);
>> +		if (ret) {
>> +			if (ret != -ENOENT) {
>> +				dev_err_probe(pci->dev, ret,
>> +					      "Failed to parse port nodes %d\n",
>> +					      ret);
>> +				goto err_port_del;
>> +			}
>> +			break;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * In the case of properties not populated in root port, fallback to the
>> +	 * legacy method of parsing the host bridge node. This is to maintain DT
>> +	 * backwards compatibility.
>> +	 */
>> +	if (ret) {
>> +		pcie->phy = devm_phy_optional_get(dev, "pciephy");
>> +		if (IS_ERR(pcie->phy)) {
>> +			ret = PTR_ERR(pcie->phy);
>> +			goto err_pm_runtime_put;
> 
> Shouldn't this and below be err_port_del?
> 
This is a legacy way of parsing property, if the execution
comes here means the port parsing has failed and ports are not created.
so err_port_del will not have any effect.

- Krishna Chaitanya.
> - Mani
> 

