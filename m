Return-Path: <linux-arm-msm+bounces-74102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E88FB86301
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 19:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA28C1CC145F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 17:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E16B3148CB;
	Thu, 18 Sep 2025 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQF0SKKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB725C81F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758215956; cv=none; b=m8SGKRJXKBKL6+tL9/SW93Oer8r2s4U91Er13QPfAX5I8rd+6XWXjQbD/FWOn6OvmGl1W/vQ1sk+6/P/7WjyHSmk2Eh30nl+1b6zxg4AfOR/6SoaKJ7UB8P42wuM3eYYIhyMCQwnMJgSi/sYmJfnp9iZSCxbv4w/9I+OjYW8lJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758215956; c=relaxed/simple;
	bh=1+ind6rGCdruwDgn7XLF01eUlmn+p2mmIsi+L595scY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8E2OEVNFoycoPm0QrR1ygr0HRFX3InRQLBlJpJHgZRG273T6a/sWjxuubq7Tesb+wsfrCnvwWj/xO3iJuvkmp6deVuxM4oY546VCtxna/k6fJbJFiFhRmm3EiI66jKkgtWp9ehrdbRNjvKtGl9MQm1qo380GXRhULt1g6lb/OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQF0SKKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IDIcht028087
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 17:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU7QcDD/4KUFVfZ3NXnJmqqwSKLMzRc76z+XyB4Tl4A=; b=BQF0SKKqAC1Xz0Ji
	BUADepm4SFg/relLpL2mKf7T7ik8hS2N/4cyIddnVhwEtTYEuAImAjStzUNuxXtm
	oO4w0DI2FLCrj9oYi4i2cC6Cj6oQ4Fh7aUtV0+KbxJIk9GB1Knew8C5XqDY/IUG/
	JsPfg5zE6EkinCHPDnTNxK5W70SY3nKbs6eugMM5j8Gaki7rryq20d8doQWDyoN8
	0nPUzekGr0YVElMvHAHntWcmROduGWjwr8W1sl1OHyCv88XX7Ov4Cmv0DGIxYgHW
	MIwBdLjdF3x8JtObzz5rEbtgXq8WhRL/ZK5bWq+nmUW6lxNDf/Z9ALiio1OTzUM1
	DitoAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jd9bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 17:19:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-324e41e946eso1913686a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758215951; x=1758820751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mU7QcDD/4KUFVfZ3NXnJmqqwSKLMzRc76z+XyB4Tl4A=;
        b=pMup1F7RSDgGF17C2PDR91GwuCXpBZaA/+qPJVrvNqcSt0FMZRJ0jpOKOD3zXunxyj
         K0Lj986RRMRVPZxQcO7F6ZTFVlWAXC5WBbvfdrhvcO6yDDKf9dTUZEZCJhZWWP/h+HRH
         j8j7wmxvwZt7HYoN8NphlMd+gH0W8/Js07Vh5xWcNuGLVX6SnuC7rR4nAmasaM45gMd+
         OfYaiUw+KVeDk/qOvg/I04ngIpdWNgKwlkBwiw2Hr7g5LG/kqep9QbMoX1nvEbB1+2NQ
         Mj92vha2Pl6oM7DpADQVQWBgT0ioHl6ecbyRRhzMcOv3qPNXyzD0/Y0FDbJolVVncQEU
         7nfw==
X-Forwarded-Encrypted: i=1; AJvYcCUrqxRHm1UVWjAbWKcvDAFwa39ZyFoimM0WI7BvRsoxgzWlbwnaxTWcAFHNJUPL7LQ0koo6AgZWx4U4mdMo@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTEc28M0fK11Ym3C2hpS8l8JWdtreq3EqXH1JsRAG8owmUtlc
	Cd5L/Yd4HDc37HBJ8M4mLkX3/wkjxhy2yYVPiUFFBU+5dQF9/VO4J3LprcLmAVHWlwobSlA0FL0
	MR/8DhYaUuTA06/GUsBm5NCGUh511WB0SeDpoOaNstUudnQ+veCH30IYY/mDMURP2fvYP
X-Gm-Gg: ASbGnctdQwKRBMbe+TaJSQsQnr3GNc/Zi2dg0c1445wMLYNIsO+Er0ziw62wAe03SRw
	vLfOkTjVCQyR3vkrV81vgeK0P4kOmBkp8OecsiMsBB3ApWpDvjYFW52hGj7XM/blItnSKlCOAmj
	zaNzEBsf0ms58xL8T8GznuWvEuInZZJS0nXZiis90YtmOMF/rC1/1BZRvBz9fya43SlxgeiO6KX
	2KLsSKenqBelH9urSDIdwTa64NWVtwD1Pd6G2WTywfDr1Q+XRdDLD7oiMCA7GI2n1GllM5U6HQ9
	KwIq5TxibIgxRP0vlQMLVu6XeVndJ9oGZZHlRhQnpFxcjEtYYOpv90H9GiCKMuhPJAmuheqX
X-Received: by 2002:a17:90b:2fce:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-33097feff9fmr162728a91.13.1758215950443;
        Thu, 18 Sep 2025 10:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPOgKeMpHla0VYJIoWjFrtXclKqTLsIHw8mI7e9lZC/kTHucViucsRapr9e8tJfJPP/dPo0g==
X-Received: by 2002:a17:90b:2fce:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-33097feff9fmr162683a91.13.1758215949962;
        Thu, 18 Sep 2025 10:19:09 -0700 (PDT)
Received: from [10.216.2.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306064f420sm3148650a91.11.2025.09.18.10.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 10:19:09 -0700 (PDT)
Message-ID: <145281f4-9df1-4b24-3676-26823dd01c60@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 22:49:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
 <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
 <3c56cd00-770f-019a-d93b-5ebaa6b9374d@oss.qualcomm.com>
 <wsig6dm7jbnx2pzt5l3uhhgywsa4jsdyunmd5aqn43bbciqiov@4y6mnd25pbeg>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <wsig6dm7jbnx2pzt5l3uhhgywsa4jsdyunmd5aqn43bbciqiov@4y6mnd25pbeg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lEpAOcbjTw5rQTtmAGum8zNuSKjdcIND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX28E5u1WLG88U
 sGWQHae53Gh8jUNdlyS/2ooL9kYgj9Q6SQz1W2MI89xO9qJVS/gMFvBvzeDV559bdvczkAZXDrA
 f6i3PN11iQ9i/VRpiTpKvhLSrsBZy6ZGO+uo4ICqnVApCPS170lE9rUMqLs3dMo7m/MgdsR/ic8
 u6d1ee+8Lux6O915AUxjClMEg3g17LWrwuviaoNNQLO79Mp238vNVmpMovYymWDC2uI6RlWjpNX
 5MmRUD8hzEqAMsXwmSmhRxfwf/BDezhkqaCvDBGvJ2KnBr516NuaFRE/zbUlqHnVcZmYhwRetec
 cIxaPosefYZB7o086zntPslekjL+Acijeuk/uKozubtoEBTGf1gnOoKavVFkpPy+e82F0yE/gjw
 /h0/1WuO
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cc3f10 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_oUffHqFanK6T7gqflIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: lEpAOcbjTw5rQTtmAGum8zNuSKjdcIND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110



On 9/18/2025 4:02 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Sep 17, 2025 at 09:59:44PM +0530, Shivendra Pratap wrote:
>> On 9/17/2025 12:18 AM, Sebastian Reichel wrote:
>>> On Fri, Aug 15, 2025 at 08:05:07PM +0530, Shivendra Pratap wrote:
>>>> The reboot-mode driver does not have a strict requirement for
>>>> device-based registration. It primarily uses the device's of_node
>>>> to read mode-<cmd> properties and the device pointer for logging.
>>>>
>>>> Remove the dependency on struct device and introduce support for
>>>> Device Tree (DT) node-based registration. This enables drivers
>>>> that are not associated with a struct device to leverage the
>>>> reboot-mode framework.
>>>>
>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>> ---
>>>
>>> Please use fwnode instead of device_node, so that the same thing
>>> can be used with non DT setups, if that becomes necessary. Otherwise
>>> LGTM.
>>
>> To be more clear on this, have one question: the current unmodified
>> design of reboot-mode is dt based:
>>
>> struct device_node *np = reboot->dev->of_node;
>> and then parses the node using for_each_property_of_node(np, prop).
>>
>> We want to refactor reboot-mode to support non-DT setups by adding
>> support for fwnode-based approach (struct fwnode_handle *fwnode)?
>>
>> Can you please explain a bit? Some more details would be helpful to
>> make the change.
> 
> It's fine to keep using of_node internally. But the external API
> (include/linux/reboot-mode.h) should use fwnode. Just like the
> current external API is not DT specific as it just gets a struct
> device. This keeps the external API somewhat ready for non-DT users
> and avoids having to change all API users again in the future.
> 

sure. Will check and try to make this change.

thanks,
Shivendra

