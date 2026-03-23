Return-Path: <linux-arm-msm+bounces-99214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIx8I+MewWmqQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:07:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B82F0D74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 856A53006173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3638E39098C;
	Mon, 23 Mar 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PcZXGE7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZLFG6G0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3C382297
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264033; cv=none; b=LaD6WqP5KULSGRt92XO0Yt+E4oCWPqp65VxakB15x6gk1YIfkjKRHUxLqTt7Hui2wAWXGntlFoNEQJjD/ukkjoZg5pTqceK5yCKO61YoXSi3LINtawsZxDbITLsoy7k6mtOJXNoD3Iod3ASec2ZbUiC05kZtIdFwdm2q0mRakh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264033; c=relaxed/simple;
	bh=gmEepcvq95Buspvo3DUzm8spQrp8Ymg2Nu1Vwb2fZ8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfSEEwMLQCppkOAArlSgn2ndrzDevALHXSdQPDBIG0v8aYqleC63RIJ4EsuDzLVKwD2W7ycDUtb8CLzLPt1e7fjIvI51wjnbVyFzQEFhuVooyOVqJq3vqrZJbtlZr5FWj3cLeVpdT6jcS1zLNofQKJh71dlbnLvvJtd6kAkaUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcZXGE7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZLFG6G0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUXC1627059
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ctwOt+QZycgFFNZjrFy7Ot4jSnJOxLLpWj0SQLSQNA=; b=PcZXGE7LXX8KrrRP
	zouydU3arVDTPgrs6nlHWHznv1KX6T0OnD4YHRwVVW3CAbx7mHUAzT1Mb8x7Qx52
	8t9z/raBCAUpobpV9gw+r4QCGJlf6lKCZKZHdK7BiMoE7mLWv4WT5fimmmuDyT+s
	4mGv9ceRd2dUWJvIEVqMGy2R83XGCqjCmOMEfSzNNbAQ+paNBXAcNnx6dsZXzfN3
	yO71HvG6y7cj3nnuethuEZ3H6maSuMipVlxFITbgxpX89gfnIg62p7Vj9pgsA+P6
	B9SDRTxYOm2qdiB+WexAoLsfmj0SLhwHi9gk7ixy4LBx3Vvu44YAetXeflieiM+2
	EedE2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0p57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:07:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b33a19837so40094181cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774264030; x=1774868830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ctwOt+QZycgFFNZjrFy7Ot4jSnJOxLLpWj0SQLSQNA=;
        b=SZLFG6G0fxORWMp/3UmOFPpLE9pCF3uZjSCxVFD6vxpdAHC2xkCEgWxv4zxdm4mjIN
         btLt17R9mwjxSNP6GVYi121gkX/dFvzlKxtHMnjRazBB4cxTlBXzkaPSQdp4W5yoWIrz
         nTWFp1eryEC2YcdR1eg35d2P9N7MzNdSbKN0iScVwPZKyMa7wKmuNrK8ADoSQzvDGkH/
         2UYcFi6U7H2RT77VuCcXSe39IDucpH0VD6QrWte7NCGfL0Pu/9GkvKbQf0Bcv+csZ+Kt
         iVKqQgyZVcADXWsgc4i+lkxLPOwOeLPiL1Y7zbY3xGB0Pn3OnnboVs1ipGSEhdXwSq9z
         4ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264030; x=1774868830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ctwOt+QZycgFFNZjrFy7Ot4jSnJOxLLpWj0SQLSQNA=;
        b=JtNqBA4gJOnwFCKWItCRO5dSnR5MJUwKOC6L5of4SAj9VKqiSDi+srFhJ0Cjcrntcc
         FuA28Xga4TLDe/UYZqy9NGFinxJH3AtrVbxZkp+TD8L1OxKGAxal0K9ApFITlO8eSnm3
         YFpaXWglplOiUh8cmjzVtee3HGd8wD7xKA0aKKZqwhh6D+XQqxk96r/HcC3PuAyRUb6K
         zt2OcpDrW3N4kabIc9ME+yUePoXT3ECz9T4pdj3D4KceOwqqfnz1kuaELnMiCMMY0tYv
         pzeNaIZ+Gr3gfiIEdc67E9bnmFhu3Vd2ruOtg93SXFL7R12chKCXnaXJvpC6IP7uxyfE
         70xg==
X-Gm-Message-State: AOJu0YzfDB2w0ufL8Vu3eAbYG3pHuIgnMn+yQLeIb5z8B1L4XyZ+Rsn6
	g7dZt4t9uaH+gjGnNZ/z+/R4LnI1P1RlplJ+kLs+i6T0539H5H/P4VvYuVMijlF85+Z64Vkx7op
	wdJGZ5n55j4xr9SFuUw8Yx0Cp8Fg0Py6TnirAbzaS73Tix0EwFaRuR4OZVMlffrd/3+30
X-Gm-Gg: ATEYQzzgsdRmDAtRJv5NlMwsRSEKzABFXxfC5ZjDeYPh5f+Mt3atfLYhv8s4STFmpyK
	eJWFPtc0XnI2qO4IJ3XKaOkQpQpqiaXXbU9habqUgS0LLB9uc74/aHZlN9bDNXbPi8rvHWXEIwc
	aSz5McFDs886IebRF2MBnUfg5IXEAr+pNIv0hVCqHUcVG2Fbekd9r8sXIr8V0OBgK6ipuZwAD2Z
	LLq8q2M93gUy5IaH8E0mBNryFvVDsxadEqKfAIWVgrD9skto9vTk1fu/j6UXEIfjMgv4k1aCthy
	J+Ajx3KmJpJ8HqS2gl/IieK52iROJUXve9Ab8x1gKzHyjBgy44bz8nE2JH+Dj8WYNF4qFB8VdHm
	W+YrmPxon+46VaYzYdY9v+VHGBFxs25iWVGawJFEb66kePmSHAoL6Rb+CfLHr4mMzJqiTj28MZ9
	Nxvus=
X-Received: by 2002:a05:622a:1350:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50b373d2a84mr140336071cf.3.1774264029951;
        Mon, 23 Mar 2026 04:07:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50b373d2a84mr140335631cf.3.1774264029433;
        Mon, 23 Mar 2026 04:07:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfa1sm471236266b.32.2026.03.23.04.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:07:08 -0700 (PDT)
Message-ID: <82b1c902-3695-4b19-8995-69a2b31b913b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:07:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
 <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
 <a7866b7b-9cc3-49bb-80f2-37fdbce039d5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a7866b7b-9cc3-49bb-80f2-37fdbce039d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c11edf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=-3HSSwHb9ON-QZMGylwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R8r4iZML8EO_NSQNZSrRIwCvWWacnWTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NiBTYWx0ZWRfX15ldWEq//h4m
 SWEs26/hIxNRJmy4atdQIk08PvfS5+pLFSiDAkqEi6Z7fGFcnkblWnnSJqA2BB1yxehmiNhGoht
 P/1XaEBHt8pqPv3e5n5JmNf7Nfk9jkjfZqFkwEmhikgL3/OEZ7305iUzm/VtGS/yqO8iGoJDM5j
 hZK3JLLH85oqBekO4cqVUDGu1PISGtNhEr2EMYaVi7oOmOv/WjTYPcdlY1dtZkBqDJ29+6i1QtX
 on09Q87ro0dgG6Q0NJrHTm7OGkK/0xd0dE/lVXEyCs1p+pLtr8PYXqKBNC06Gen0X3Dl4Z3d+yB
 WSsUg8GFPI6z8vJhmEjXSq4i49YrCrhyTS3G4Rk86NkQdogpU9s88+SCqts9V5P4OSMaiqAdSvc
 WWVtGU213RbmisShantNczUlwO4CjerpDZrTknr5IpkCFDeHrHfnmqB9LZjRLIv2rSMjPCYsI0Z
 4tkatcTw7ED50RK7yZQ==
X-Proofpoint-ORIG-GUID: R8r4iZML8EO_NSQNZSrRIwCvWWacnWTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99214-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,c251000:email,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 276B82F0D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 12:58 AM, Deepti Jaggi wrote:
> 
> On 3/11/2026 6:41 AM, Konrad Dybcio wrote:
>> On 3/5/26 5:28 AM, Deepti Jaggi wrote:
>>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>>
>>> Introduce base device tree support for sa8255p Qualcomm's automotive
>>> infotainment SoC. The base dt file describes core SoC components- CPUs,
>>> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
>>> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
>>> nodes and enable booting to shell with ramdisk.
>>>
>>> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
>>> platform resources such as clocks, interconnects, and TLMM. Device drivers
>>> request these resources through the SCMI power,reset and performance
>>> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
>>> doorbells to support parallel resource requests and aggregation in the
>>> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
>>> using the Qualcomm SMC/HVC transport driver for communication.
>>>
>>> Group resource operations to improve abstraction and reduce the number of
>>> SCMI requests. Follow the SCMI-based resource management approach
>>> demonstrated by Qualcomm at LinaroConnect 2024.[1]
>>>
>>> Limit initial support to basic platform resources, serial console, ufs
>>> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
>>>
>>> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
>>>
>>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>> ---
>> [...]
> 
> Thanks for reviewing the series .
> 
>>> +		tsens2: thermal-sensor@c251000 {
>>> +			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
>>> +			reg = <0x0 0x0c251000 0x0 0x1ff>,
>>> +			      <0x0 0x0c224000 0x0 0x8>;
>> All TSENS regions are 0x1000-long
>>
>> [...]
> 
> Ack
> 
>>
>>> +		tlmm: pinctrl@f000000 {
>>> +			compatible = "qcom,sa8255p-tlmm", "qcom,sa8775p-tlmm";
>>> +			reg = <0x0 0x0f000000 0x0 0x1000000>;
>>> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			interrupt-controller;
>>> +			#interrupt-cells = <2>;
>>> +			gpio-ranges = <&tlmm 0 0 149>;
>>> +			wakeup-parent = <&pdc>;
>>> +		};
>> Praveen suggested GPIOs are not controlled by Linux:
>>
>> https://lore.kernel.org/linux-arm-msm/12063990-70fe-4faf-89fa-c74c7bd97f42@oss.qualcomm.com/
>>
>> Could you comment on this?
>>
>> [...]
> 
> For buses,FW is handling, but for PCIe and ethernet , pin configuration is controlled by Linux.

Okay, does the firmware synchronize/access-control access based on the
pin index, so that e.g. the gpioset utility won't be able to mess with
the desired state? Or do we need something like gpio-reserved-ranges for
the FW-managed ones?

Konrad

