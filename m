Return-Path: <linux-arm-msm+bounces-41775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3A9EEEE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0681890904
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E972210EA;
	Thu, 12 Dec 2024 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhBa2UBz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4306F2FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018998; cv=none; b=uHkPzXxo5mAMYu9KYl7m/G3MZO9I/OlHmYaAX3li6MSHyemooxlpQNbcJMFfym2nTH5qn3U8owQdTu5Obkw3KC/QmOAn1V1iemL/h2emY2aGB4fF5Odv++KkYG9xhTvSZ5tHhYEw2BvYprtc6pemKMIY33Hh0bwpgbNCw9e4+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018998; c=relaxed/simple;
	bh=3C4Yt5oeNRaxZqqS6cTEgAB9qT5fjNpBMGuaoHcL2gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAkwYuCQVeH1X9FD2ZpPhU5b2hpVoAaQoRPNH97eXdjLrFlocaoSEcQIzlvWXIJ19uHowU0Br9HRTVaQ+b1nYZAr+1LXAPDepnJUwElcMJhqUS/6p3Y431E4U8SrmAqYyjzEhLagTfSDmf2+KHHFwJ0SBZx7O6osQBuTvH+WYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhBa2UBz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDEiEZ000539
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3nqq3ds2PAwM46hFlxa1nrVPoI1aem45H25wLz0YZc=; b=GhBa2UBzDWDC9qNH
	PyDoEL6SJBJmonT+danyYZyzmWIv2g9+Oo/nj1/YYmW+uI7BYqeFfTRuWP7DFLNu
	1EeUurdeptMgCP4rArd/ZC9NK1R3thQS2F7WMjA/H4bYAw2641wGvHo8cydmoozp
	nVd/x4kOVwncwO+7CMBvy01BGo41AegqEcvXR4eYTusFPCxILVOaHW1IkEVdsJOi
	lTyYV63/7AWiovZ1aKIuD5AxSIOwyYPklN24lKrjuBmx8ZG4j79g6vwbaXW1Imox
	jHv17FXzLoE+0bSt3YcyH9GiENQmlsZRsXdPWXsbXl/BSztn82I0IcZs+Nxm7h+2
	QrcEDw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes204a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:56:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6dadb08366eso1685706d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018994; x=1734623794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3nqq3ds2PAwM46hFlxa1nrVPoI1aem45H25wLz0YZc=;
        b=M07Yja1Nb/8CSTVU+UJKaJXhKvPmWTYAwNgj/LobaglMhCoKSqANXiM6pqFPAJzYMa
         rP9BY4uR7nqMQ9YOkZeogwZlZWYK3qRizP2Rm6/6FYsDiumvO+aQBY8i7h2f+fNY8v2l
         y4Ax2bIHjuCDABIcgcxzb1MllIpV0AxwvevR+4ygHb85apPi+5V+qQQzcNlWkdyOpfYj
         XyCz7yoMN7LHfm1IAjIDnar3mNVMIsj7wdx0iU8/eacOOjeXRtBd9vTR40v2uUl524jw
         UtJhRplUYYNfamqbWHjvxRFdkv+M21lP3hOol4sHd+mDav48cr7EDMtnIadp3T5qnzy0
         /gKA==
X-Forwarded-Encrypted: i=1; AJvYcCUYPlb3UFX67f8MVHN5HV8y59lPj5LT1e/q3EvGcdCwroQExoD5mDs8T6eOxXddeJmGdUTUhjhOrpHfFnOd@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQ/54iGUNX2uTMDJnTl+8jPWaJjy7g8/FVBrvCkx84z0tV5J+
	sPFlPWtrh0E3bMto/Rr8v0taXBE5YGjassjTf/mm0rsH2LIut46F9AY7pPjlGmNbAXS6F+Ox/Ys
	J4XE5crcWD5RNlG2HPytoADLBvZ6VbodW9Sl7oD+kKuQcrqkZgeucJaLKrdZbIYp5
X-Gm-Gg: ASbGnctALheLNMSm/urZ5902oOK4G0VMooNOZIcv9jw2ZDzMTc7ekz4eenmNEI8v+Ki
	mvC4KllxXFOujv/8faDtKNgno0OEZrwAfEPu/W12xofIT+N1n9mh7KXMPktfssm7nFh4k1rQ6+y
	9Se+fmldxnGwGgWwUlTlp5XCsK/QIlvpi5pVB7DZeQQY2CNNO3hs/19wCPRH/CTuJGbiYTFXtGH
	cjYrCjcTEVoruRhrHKWHNywgahpPsnfYxGzi2RgrARt+sA2t4qZ4tJxoh8eld8iAHr64FJ7kHhk
	emfdqlnKdrLU6LJA8lxc8QE4SSeiGf3/xCh8cA==
X-Received: by 2002:a05:622a:199a:b0:467:5462:4a18 with SMTP id d75a77b69052e-467a13dbb86mr5797561cf.0.1734018994476;
        Thu, 12 Dec 2024 07:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrTTXRfbuepculS9NtXEOABh5da5aY3tMlxBBBwXa+/U6qTkKw/SXlHeil5FX0OuqtidmsCw==
X-Received: by 2002:a05:622a:199a:b0:467:5462:4a18 with SMTP id d75a77b69052e-467a13dbb86mr5797071cf.0.1734018993424;
        Thu, 12 Dec 2024 07:56:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa683f9a8fbsm626885266b.37.2024.12.12.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:56:32 -0800 (PST)
Message-ID: <8ad1db59-9326-461a-ba8e-52891922eb3b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:56:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Viken Dadhaniya
 <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <9d5e5b8b-aeaf-4ec8-b34a-8edeaec20037@oss.qualcomm.com>
 <42b1c187-e924-4690-8338-4c694f3e16d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42b1c187-e924-4690-8338-4c694f3e16d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yVmWzr-E_serHpoWq6i74s6F2-krO-qd
X-Proofpoint-ORIG-GUID: yVmWzr-E_serHpoWq6i74s6F2-krO-qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120115

On 9.12.2024 3:45 PM, neil.armstrong@linaro.org wrote:
> On 05/12/2024 16:59, Konrad Dybcio wrote:
>> On 4.12.2024 4:03 PM, Viken Dadhaniya wrote:
>>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
>>> hardware has traditionally been managed by TrustZone (TZ). This setup
>>> handled Serial Engines(SE) assignments and access control permissions,
>>> ensuring a high level of security but limiting flexibility and
>>> accessibility.
>>>   This limitation poses a significant challenge for developers who need more
>>> flexibility to enable any protocol on any of the SEs within the QUP
>>> hardware.
>>>   To address this, we are introducing a change that opens the firmware
>>> loading mechanism to the Linux environment. This enhancement increases
>>> flexibility and allows for more streamlined and efficient management. We
>>> can now handle SE assignments and access control permissions directly
>>> within Linux, eliminating the dependency on TZ.
>>>   We propose an alternative method for firmware loading and SE
>>> ownership/transfer mode configuration based on device tree configuration.
>>> This method does not rely on other execution environments, making it
>>> accessible to all developers.
>>>   For SEs used prior to the kernel, their firmware will be loaded by the
>>> respective image drivers (e.g., Debug UART, Secure or trusted SE).
>>> Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
>>> will not be loaded by Linux driver but TZ only. At the kernel level, only
>>> the SE protocol driver should load the respective protocol firmware.
>>
>> I think this is a great opportunity to rethink the SE node in general.
>>
>> Currently, for each supported protocol, we create a new node that
>> differs in (possibly) interconnects and pinctrl states. These are really
>> defined per-SE however and we can programmatically determine which ones
>> are relevant.
>>
>> With the growing number of protocols supported, we would have to add
>> 20+ nodes in some cases for each one of them. I think a good one would
>> look like:
>>
>> geni_se10: serial-engine@abcdef {
>>     compatible = "qcom,geni-se";
>>
>>     reg
>>     clocks
>>     power-domains
>>     interconnects
>>     ...
>>
>>     status
>>
>>     geni_se10_i2c: i2c {
>>         // i2c-controller.yaml
>>     };
>>
>>     geni_se10_spi: spi {
>>         // spi-controller.yaml
>>     };
>>
>>     ...
>> }
>>
>> Or maybe even get rid of the subnodes and restrict that to a single
>> se-protocol = <SE_PROTOCOL_xyz> property, if the bindings folks agree.
>>
>> We could extend the DMA APIs to dynamically determine the protocol
>> ID and get rid of hardcoding it.
>>
>> And then we could spawn an instance of the spi, i2c, etc. driver from
>> the GENI SE driver.
> 
> How/where would you add the peripheral subnodes ? A Serial Engine can only be a
> single type on a board, but I agree we could have a "generic" serial engine node
> that would be differenciated in the board DT with the protocol, and use the bindings
> yaml checked to properly check the subnodes/properties depending on the protocol
> property.
> 
> But we would still need all the serial nodes in the SoC DT.

Correct, but NUM_PROTOCOLS times less. NUM_PROTOCOLS is 3 upstream as
of right now, but it's much higher in general (which will trickle
upstream one day or another).

> 
> This may make the software support harder, meaning we would either need to
> have the same compatible probed in sequence from the i2c/spi/uart driver until
> one matches the protocol, or have the qup driver spawn an auxiliary device.

No, just read back the protocol id from hardware (if the SE is running), or
from some DT property (if we need to load the FW ourselves).

Then, based on that, we can call

platform_device_register_data(dev, "geni_i2c", ...) 

(or similar)

> Honestly, not sure it would be much simpler...

Not sure if I'm happy to maintain NUM_QUPs * NUM_SEs * NUM_PROTOCOLS DT nodes,
per each platform separately..

Konrad

