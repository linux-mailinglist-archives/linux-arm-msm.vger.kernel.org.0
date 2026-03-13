Return-Path: <linux-arm-msm+bounces-97475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKMeONYEtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:36:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 440322831CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 547AB3036608
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8834394789;
	Fri, 13 Mar 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rr3ioVQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZVk++9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC539448A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405298; cv=none; b=WJhzVrWp3crQDZ/nsybz51xH/r4VuBXRXMk3WATRiEcZlZtdFgIpNW5IQasKS/J8QtvObC3YLFK6mV3yEYKe2U2sjqiIJ09z93G0B22ckkXzjgJNDv2K7jnUwr9SKVCEbKIiquG0gGsvsy19DmCB30/3/jbEnQKNtzyPt+MhKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405298; c=relaxed/simple;
	bh=MLe6GWn1t85qkHhX+ZfWgtgT0WtWEg9ITz62wEdKZnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oP0/Iw0slaW/SPB7lt6oeKbI8ZsFZHwqpHxAsFgAylWuPR07oHEN3o4XVcH7ofqWEFBUktxKq5pU3QYKgZ0gMsbimGfc2IHIw3+lqiwJstthyuFcjeJMaYnx+jjgNxpISUMq6pdX5WUBF11ud97APJ4MD/JYJd6Ye553e+sRybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr3ioVQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZVk++9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tj0u3342938
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZ1ZWIRx4TXRJFXLh8Hpw25cxx+L/+m3PIUI2NeaN7s=; b=Rr3ioVQTr+Dtyi/K
	tZUyedUze+gvEVCimKrF+AmnhFWnGYO4tA3J81tJqKWYWdQWqd125DBEW28x4x9k
	9C1YmugYdPrh87DQ838cOPNccSiFGPKZwx8HvuNjGEFwzq9g3M5ip3qHyX/nF0Kd
	NbzDxwPDZ2TH7aBNy2JRraUxK078qhx1sFx43mB0+ZoOyh25/t/dk8ct+WtfDUZZ
	pX0JRbwizzbFMsHE9yziUzl8ZIVmMWw66p7kphgJWB+T3jPXaJ2GFbB+86UbfcEd
	sAKcLlEXidkv0KI3TPn+DOB1HgByTOWC9S/a98QDbN6KQAPbhf7J+XWIJIhAKvKA
	H1dzJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4rpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:34:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a01982dc5so16449696d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405296; x=1774010096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ1ZWIRx4TXRJFXLh8Hpw25cxx+L/+m3PIUI2NeaN7s=;
        b=IZVk++9EF7BrHIY+ai7UWOHCFgImDCfJK1ulV/xdgtbyn6XAUcJQRzFKkrUq+xkLYC
         Nht6GUYZyYHeHQvnPKbTQBB/Srs7Ff1MapXvTo/b5pqPmy60w9wW/X7NbDVOWL8L5UIx
         O4PQa6sVXcHlHbBEUl2xziLzBiPcDOaz0tidjKTzIAOL3CXCySnscIqmvUX3lVq0Lmje
         ZWqasVwpjfqEbYs7PHxqcpbTginsXlLSR2iqAQkrO/DBzXEudR58c1c2qcWa9SfQxGWp
         PJwduUVsA4VsR3FPn8RSTqS+trFRrLei4ZeQSZziDEAjUniPzKLl/ZIDf31xwQw0n0+p
         uOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405296; x=1774010096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ1ZWIRx4TXRJFXLh8Hpw25cxx+L/+m3PIUI2NeaN7s=;
        b=kMwzUAl4nITyfqEBnRPjfyFLFhbJRgQtDFUAzThSYRIkWHLfZlFswhUSKbD4X1GX+Z
         Iace8SO34FFyBWnBffzMxkdzB1YAT7N7w0c/55mlIezSZqp94VhmfKisjLPxluZ883FM
         M3VhO1N9ZukJqxm0zDuTnJUVaUr8Nkpdf0xaQjRTLMt5Ad1pA5ZAAIWE6uudNsxswL6d
         rvMNETo3lloGEGhRdWGekv0v6UrdUZ9N85khFJbsonpMWu1j6DK9FP4jd3/xx57L7xwd
         UCmEiR5c8LiRV3f81oHqjPb70UUGnz5rPWe547QMIXFlVp2v+9zpJ45oihF5U9DRxPF1
         d9pw==
X-Gm-Message-State: AOJu0YwAhVN11JMbIMnah3P4av4Nd8Oir9gsarE73z3hjN2fk33t5MVd
	ylL61AlEvcFxhIlXUFE9gOaRod2udGALo5tsoLdUWpPUv0o6uIyLfhM3xaU2vhBI0V8bDcLljKm
	ipphUPjxpjDFJJSOg5B8EsHZ/p8xUuXz0HINKtX27+Ns9NlorNYLTtfKFDM8rcrq6Mqh8
X-Gm-Gg: ATEYQzwbwyxQE01ng1yNc+k2KKFYcrsGJepnir2OYYmatWvmtu7OqaGZoaQjqvoSxd1
	uagyn3X/o/0n5fg7QcaOTjB+ajJTnWjPwkzGVx1DlbklQAd8GjTtQqlt+a0gL/cXUlcrIr34Xm1
	0zivCSNRljMY8tzTm4N0VDsGQRrXnnBzCzzNgiOVfCZsHygffcSIs6fZE0JMrrPzlraPeYXezNy
	cUhVXZU9Wv1+wbwXmQy9fRGkS4BcL9VSKER2SF7siXkCIrPuz/j86dGpVn27PCGaXAc7CofzTwO
	LHBAHo9apMMdGhmCSidZ6n+brEA/+WF+T1mEm97mYSlw8XlIxqSKnZmD/LlvX0J28lkRFOhG/MX
	a1IEQF/kTUGwtnJ7ECxA3+23BG5WfzVVbzqlImcYfENj/VKXPXamnjJj9KIoUlRtMd3+OD9Lxxr
	M5/mo=
X-Received: by 2002:a05:6214:5e0a:b0:89a:4f20:cb28 with SMTP id 6a1803df08f44-89a81f50961mr29598826d6.3.1773405295747;
        Fri, 13 Mar 2026 05:34:55 -0700 (PDT)
X-Received: by 2002:a05:6214:5e0a:b0:89a:4f20:cb28 with SMTP id 6a1803df08f44-89a81f50961mr29598496d6.3.1773405295289;
        Fri, 13 Mar 2026 05:34:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb6936sm42936166b.37.2026.03.13.05.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:34:54 -0700 (PDT)
Message-ID: <eefb75dd-95f9-477b-9251-dcabfae47c8b@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:34:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth
 over both USB and UART
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
 <cffdb8ab-a293-4535-860c-378a4b8a3d33@oss.qualcomm.com>
 <97a3f3f2-e9e2-44ac-a682-0e0f0c100a45@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97a3f3f2-e9e2-44ac-a682-0e0f0c100a45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KNfsymvDFJadnP5Kw-nNvy4_5-D051Gn
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b40470 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=o11hlXMYcrQWRnTjrNEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfX1E+4rCXx9/ng
 unIHCkGEXSu01p3JvqIrQaJbhllCmUf+AVkKceuwSgfwDKCVjDwaoO28WdgC5INct8LxiejOXDt
 l7zXEO7DCnWYUMLoPwjk7jpbVkR2nVTkb0UZpOb7gi6thy2R0yYUJTLtVUB4sD5ecYF99ansZ8g
 VuIP08p/WfN51kMdssVpiCUoKx/p0yZI4Q49glyvSsBQAZHtNpL4PS68Wac0/fu5zAcHewLWX/p
 Ge4IU7ns2O0GQxQwADaCLYBEJZMGqnALxdxb+CZuGSKFqgpJaINcW35nuRbov5cP5tRTO9aOLbf
 c6HoL+7Utwp83FwMVHqT2dxtiqan5fht5K8rfN1dPchN7d1/VYYf/5Rc2GooJwIKQRnV/F2J/PV
 Oj9KSpQsT6ZtV5xTkCB3O8jBuM/NVYs1+BMJcuhmPmoVZFg91TPFMrPgHzcIf+G8NECwJ2LqYbR
 3FEOnSO3UhTgJU+SYBA==
X-Proofpoint-ORIG-GUID: KNfsymvDFJadnP5Kw-nNvy4_5-D051Gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-97475-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 440322831CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 7:37 AM, Shuai Zhang wrote:
> Hi Konrad
> 
> On 3/11/2026 9:07 PM, Konrad Dybcio wrote:
>> On 3/11/26 10:09 AM, Shuai Zhang wrote:
>>> When Bluetooth supports both USB and UART, the BT UART driver is
>>> always loaded, while USB is hot-pluggable. As a result, when Bluetooth
>>> is used over USB, the UART driver still be probed and drive BT_EN low,
>>> which causes the Bluetooth device on USB to be disconnected.
>> Is bluetooth connected over UART *and* USB simultaneously?
> BT uses either UART or USB, never both at the same time.
> 
> On platforms supporting both, the UART driver is always probed, while USB is hot‑pluggable.
> 
> As a result, when BT runs over USB, the UART driver still probes and pulls BT_EN low,
> 
> unintentionally powering off the USB BT device.

Please describe in more detail how that difference can appear in practice.

Is there an M.2 slot, into which different kinds of cards (i.e. ones with
BT-over-USB vs BT-over-UART) may be plugged in?

Konrad

