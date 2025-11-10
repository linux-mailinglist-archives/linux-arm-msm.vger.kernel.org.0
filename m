Return-Path: <linux-arm-msm+bounces-81099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9FC486F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3EAD3A5ED3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC482E6CCB;
	Mon, 10 Nov 2025 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SushDV2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fe2TTn7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD12E62C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762797177; cv=none; b=bIhdLHCHZXHjz2Yc+kZdedio7VIyffwm1WGmSmw/jIAmv/2Poy8W7pmjdOp6cFhdzDJOcoynOq4J2W/0HiBcX/BoOLfTNGNNtuLUCHn0tiX3uafjpmvTafY63ZU6G/VWkKisvF5ahFoaHcp5O1EWGXmS8kLNroQPP7y46SNpbP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762797177; c=relaxed/simple;
	bh=8j7tUqcQC0NOALl7nuGaoJBSLbWsnB+qj64xTFUZLIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/6xhl4Q62t9uxxgzD7r5RMUxir9WaE2CfggvdpbJKqjSsW35UYzBvh4ksvMF8+korEUqVenrULaZxqSTCBYjO/Vf7gdH3UVSHX9llMIUsYp1DYWimVG6/Tg2+UpE3yedDDDell5g2zimYlDT/mxq6Rdo+3+/8GUQ+WKfBA6Lwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SushDV2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fe2TTn7C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAD0wIB3676827
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=; b=SushDV2znLtqfXqb
	nh+ugkN5DYK2Eg8W15KefcagK5QpMf/eMu1PqttnHV1IeA6eZ2TJwsbLXrmCKc8V
	y7RxVXiSfJVwL6QiIrAXb9ytKh6ENdoXsS4eTlBh8317+Jum/KwJ3aiud2byu/ZL
	yDGyWsvbaMhtOH7zkERIumC4kIwH9D6R4gjpFjWOGsboWEMOA+tCh9iUOw9sI1hc
	FFHkJyhoCB2huBf1WGc16OXmaiSw7A3QRDDv7q+D63smMzOHxR3UmhYhq6j6Nwke
	DxUHi8jK7NgGPyNT2rmHjhFodZpMTd4bBfOXHqwwDLNAD4Q2wnwA7yrhxa2Fcfny
	p1BuXA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh8y1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:52:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343823be748so1998642a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762797173; x=1763401973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=;
        b=Fe2TTn7C1Aai7Fnp0V083mLcrzfS1HtyaeUaZQWWbgSc6IdIGVUy2Y1HFi1EionV58
         9ROk9zLDVfbIJG/ZhBhExuQKFvWImvGAQQQ2cKx+Cg3/l2N0XTmQARnZOm5M4htpRo5g
         7KeHvEG15u45Q0hTskI7Ca1Lo4CwkstRz3RtEJzshWUDGbefdS+bvciogLK1gklRztdl
         94QTV/1iRkLrEZRfNuheIvZLiLU4WFg/kbZtpJ/zgzg2BpicEpHkC45FFZa8wmGT1M38
         pDcYeG0sQuezot3/MfQ0nCrvb+3u8TW4BYwvEk6uXPyCupP0cAu6lwjMhW+OyQgnhTS8
         Px8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762797173; x=1763401973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgMBChGiCDCek3D0eI0cnkwInN+pZ/u+vK64wiBFkcU=;
        b=PEHfjJby9YlJSy2kHc122iiPlRpvDlCWXPZc8I3mrmCFI88kfY5xoHNm/PFbBQ1O4Y
         wDGUu1FlnRlpqntb0Qs//c1rKE98WlKtWlGkybTsipkV4sC7y0Qy5tt+N7sKLOjURiTP
         bUUJk65Y0xl3IWHjKWbCWV+FtSIYI28uWcAaBleVLkaKSSuyN7bNYxwxC0OanXrbIEgg
         rhfoSIEoVZpWRaTygWj2bLWXkpd9p9klhh8Xxrh8WGNij6RReA0Iua55qn6CByrGM9zw
         gmsF4HKF+TtK8lWZAE/k2/lx6gudVZ6LFozsmBxgWdUYAXv7Wh3fjpeL7uSNGiTOQvE7
         ZsDA==
X-Forwarded-Encrypted: i=1; AJvYcCWYVBN0V/AHzY2cK5zsWeKaDRkOWq7k498D5Y1yUmJG7VA2VpBbemzXBGM4w7rgtXl+6SN06BrC1oZZAXVW@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ4UZM+gC1Kk4jiWg1umJnScWdVrrLNUePSTvrhZr18vrGqZXE
	zKpC0VdyTAv6NYV6dZRuXKj2fZ2Nbt0vayGbTjDTNqdxb14hdEd3aPyTgduARHLVA3gzM8v/Egx
	cjAxkYwvk41JpibW/49yX/hqJ4JpzC22ZisjXr+UIQxx0eWOF/5fuPmoYtSsw3z2/c5DT
X-Gm-Gg: ASbGncvgzvnF4daOoHEK19FZ5jAZROlWHj9snIFUVspRlj+emA3AUj/aoHTTKU1HyL5
	wJqL2z1cJKxKbcb5h9pMWMwGZFaQwAZCQDoT71an3gg8XM8PP6+x13e75ulNqkRoW9SFieosmDJ
	dmyog2o4Xx87L7aoRuQ8zel/rAh/NPidXkt0L/FuTT0Q3s2xEJr2RutcTGyRfHCAw0g1PiDC3SI
	9kC16iuh6vMMGzTNw20HVzutrVGlmzWcfBBvSzGaR4c5WC6VwblixP+dCX9IAMyKkUZZqSpCNst
	792KUHP0v1Ukfy1o5CnmqK2oJvQ6Kz/hGWF0kz++707r9htuyuneYD2pHWYmj4oMvB/fIH8Xx+9
	OVtnzm8r0X9RnXPIzY61n6QDaUKpKnbsS
X-Received: by 2002:a17:90b:258c:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-3436cbab15dmr11895405a91.16.1762797173212;
        Mon, 10 Nov 2025 09:52:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlFXFApx/SwnXYMQzXSDvrGq7RtHQa9Gt7XZ4Sn1voA+Wj3sOexjL3YZxb2Nlont05g8Gx2w==
X-Received: by 2002:a17:90b:258c:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-3436cbab15dmr11895365a91.16.1762797172673;
        Mon, 10 Nov 2025 09:52:52 -0800 (PST)
Received: from [10.216.49.81] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm11985909a91.8.2025.11.10.09.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:52:52 -0800 (PST)
Message-ID: <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 23:22:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
 <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1MSBTYWx0ZWRfXxh0k/u25MrZ8
 tino+mSP8UrT5DoA2sjsQrHVoGQkKeaZkQoyH2SJZoCc5MUNtfN5pkK9DoBYgXYWpFDg6B0ELcZ
 uq7HhbrsK7Ue5ezeKjcX4arE3zR+pEw+8lZWSB4tQd+fW1iqcdBCzNaIf25YnlNFSsyADkkJBZs
 ATIcoY/NPUEj/2P/BeDMqiRaRvVZQQUaUfl68gzNWjTxORQC/23fOVgmFp22yazt/wm9EgY0/hZ
 R5hH+yKWvJj9LJ/ruMf0waCwSjggWK9B4hGpRrO8nwdRoG4d7Wf7+gAXM1C0Wb5Y+aGJCkKdLqZ
 NyFJr3HdCSmX4gGZvz7x3ogr9e+DXtDn4czT3Hn+1VSl+MZmTDbsQgten7HpkykEAH1DlB7pd0Z
 RF2GoziJuXXbjFb9HeUPDx4a/og1xg==
X-Proofpoint-GUID: Z0DXKgmWKxuS43JMQ3vNxkmqTezjpuEY
X-Proofpoint-ORIG-GUID: Z0DXKgmWKxuS43JMQ3vNxkmqTezjpuEY
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=69122676 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LD8w3KR18lMhmnX9WsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100151



On 11/10/2025 10:00 PM, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
>> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
>>> Current reboot-mode supports a single 32-bit argument for any
>>> supported mode. Some reboot-mode based drivers may require
>>> passing two independent 32-bit arguments during a reboot
>>> sequence, for uses-cases, where a mode requires an additional
>>> argument. Such drivers may not be able to use the reboot-mode
>>> driver. For example, ARM PSCI vendor-specific resets, need two
>>> arguments for its operation – reset_type and cookie, to complete
>>> the reset operation. If a driver wants to implement this
>>> firmware-based reset, it cannot use reboot-mode framework.
>>>
>>> Introduce 64-bit magic values in reboot-mode driver to
>>> accommodate dual 32-bit arguments when specified via device tree.
>>> In cases, where no second argument is passed from device tree,
>>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>>> compatibility.
>>>
>>> Update the current drivers using reboot-mode for a 64-bit magic
>>> value.

[SNIP..]

>>> +	if (magic > U32_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	magic_32 = magic;
>>> +
>>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>>>  
>>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>>> -				 syscon_rbm->mask, magic);
>>> +				 syscon_rbm->mask, magic_32);
> 
> As above, if we're no longer silently discarding bits, I think we should
> compare the magic against syscon_rbm->mask.
> 
> No need for a local variable, just type cast after checking the validity.

Trying to summarize below why we added these check-

the patch in v11 used typecasting and did not have any of these checks(link below):
https://lore.kernel.org/all/20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com/

As per below upstream review, type cast was removed and bound checks were added all-over patchset:
"As a general rule of thumb, code with casts is poor quality code. Try
to write the code without casts." - 
https://lore.kernel.org/all/8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch/

We can revert to the typecast way. Please suggest.

thanks,
Shivendra

