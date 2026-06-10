Return-Path: <linux-arm-msm+bounces-112432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jk2tCS9TKWrbUwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7B66911B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q4ZWUh08;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jrb1dlnR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3543D316FDEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B304028C5;
	Wed, 10 Jun 2026 11:56:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092213F8EC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:56:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092614; cv=none; b=hToGWCDr98dsQPuz8OTvE1ShKp6enRJrneJL3qFf5x9UpLMRpgj5tM+f1ljmsYiauaLOn3qSWlrGoos/L4wJRorhfjsSlnH9kfUE7HC2r/ZgPzpOQGr9ZMLUlVDOUl36exhBiqO3ZMLnUF90Oi0Qb964tXWDX1ALztHHKvKBsJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092614; c=relaxed/simple;
	bh=66IqBveo+20pwhaW9xb1axpWXAYkohqaVG/7jNEU5hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1YMDVEbufY1CSv0IBY999HioHVA+1vHBN2L0pNbVcwoRnspFmtJzw5OETXaSQHo5DuQcQqvwIRVXq/jfe3DXbiQGrYBC7G7AsKc9smnQFSNprNR39lIzBtAFUjuAU6fPzT8DkL7DBQk3KYZ/WVTgVB7Nl1ioar6aB9EXfAI44s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4ZWUh08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrb1dlnR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABNSUP1032930
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=; b=Q4ZWUh082/I2tJxH
	wcsRsAAyztNt94BTZQfa0qye8GdRn8zj/iD12UJIwq/wWRsaJpk85ZHgK4Bef27A
	79XqY3MBHWIiPcZlijG5zbQX4pySNRxHBxexbrCP/WNJBpRU2mpQoxgDpvEujUMv
	igx18QQsEIQUxxzmNuPL3mrVHcHYXVdKKm74DzfLmJ1/f8+jUK0E3KVClDiBdspK
	R+wJCRttcpPNGJqtlmyOBuR/oWDUfpkr+7QyynfVKMTYa16bqFxVeVRDfXUS+GiG
	X5tPqYy/gZtBE+iQrpf3R4jeUA79Zger9qyg1JOVx5qIJjzPoq1OiZV658ONZPAu
	HPJYcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j9h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:56:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91571f0d3e3so98386285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781092610; x=1781697410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=;
        b=jrb1dlnRsFsuryTxRjq9gufADuopSSQD/a0KKjoVZ8wXLS/YOMA6+3VK+51SKamggD
         +WbipCuQPcWYN1Ju8ifIB+kv8PRBXAgw7Xlbca3/cxWrPTnOhPMblGArcziW9eYfDPHW
         WaAo9Ci96ZPxZfZ0SQAGACbtrvtdhTrT+dbrIXBUidk8h/By+4vfBEnNnWfC422MgxFF
         8oAp2Z89D4fK7GuQmODZjkyS6rVlmwRUHQm6xjU3E0nDBQjs4wJ2x07ZI/z31McV52f5
         h4faXkMxN79diXFrLs+T5SwtpUbsMQLbxOwRLSATmhl3+QUexV3tKMtycxJ13Ga1Wohy
         vnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092610; x=1781697410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZD9n6XhJmxub7zVMjUNqjPaNd96A5hGk0u4sEFo2yg8=;
        b=lHsqn7d4rfeiKXZz9Y9gS1rScLrQckHHVDwyQ+Yv+sCsnPruMl0V9Dw5wtlgIKvmAn
         QnZDGq5Yhy/t6w4XXN5UVlxY3I/YQMcsHnyNvXWsxdYMWDjDOFF6w2zYj7M4f6Tq9Vy9
         uLf36GVLdk5h1vWzjxi18ZmO9eoEoRyUt5uHxiSTucejg11erbh2cGx53qUmXoxNHe0J
         Wk+5PsS5v+h7su4CTWcDc3Z5jar+09yzQLUYbRiMkyqc1IcOueZN7lwOrkgJIiqUE2GS
         wI0wJVgkoEjW9aGRz2vPrYnIjSAN+lY0StfpbiLnfRUEbn8qWB+KFX0frDemc7H5ZRCP
         WgRA==
X-Forwarded-Encrypted: i=1; AFNElJ/qbT2zfftzYfUJl5Ii6Ic1Co5EaJ95CbHazOZZ7BgmeQFOASUGeVYTTAc3aWN2ikV7RoFeBN4eU3kfZK81@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Z/mvm2ANZLRHwnGeQqYAObI+fDjW99aXBu3IlCFzmDqlctey
	ajz6JIG42iOmWamhwRC4/KRlaWHjf3o+6ucnOPJxnuzrM2rsk29aP0UXyASxXKRZvJ6IhVr6siQ
	nwDDBsJJcHqBJS1SoinUvut6ZY/HFbnhQgIkaejcvjz0Z5JqSRkFvU9NeIP7XJlhnkA+uVDcXD+
	ml
X-Gm-Gg: Acq92OEtZDuOQgdU1s2ryKoDmfV9Y+MxpA9QgZZZdIMZLjVmYtblR4wzQxyisgBGJJo
	M6gUI3kjuQOfbi28iiauVQvbGSrr1Vj7xWfSmDsmkpfQ8OemJkMOXCruPLiR1Gvm3tNCQwTH0Sm
	Go8Xd9XMelUhW6igC+fI+yflczi7CQCRgRHrF8YcnxFfKt0nF1T9qYjCZ3rqr3umqtz0fmK3lYZ
	qudL2ahk61XIFIgS4PulMWkmfweFVoPNRZ//4SJhBsst9VV66rJKezq7gLF2yPCxw0K86bS2DES
	5DmItjtZwRzKJukROEejMocDsMuz9XyOB9zDKUcePDeLQH2DsTbU3hU5CY8pOpedwopoSJLXAbv
	GkdQEyaEDEZKAWhhzuF+kZpQ0nlrhAhvpzE0Rp4SPryy8GkXahvgUAQbw
X-Received: by 2002:a05:620a:3182:b0:90f:7ce2:3019 with SMTP id af79cd13be357-915e6dc038dmr698584885a.7.1781092610261;
        Wed, 10 Jun 2026 04:56:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3182:b0:90f:7ce2:3019 with SMTP id af79cd13be357-915e6dc038dmr698580985a.7.1781092609704;
        Wed, 10 Jun 2026 04:56:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e7dsm9878414a12.20.2026.06.10.04.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 04:56:48 -0700 (PDT)
Message-ID: <affc72d8-1906-41e7-b889-c5b09d1bdd5c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608151835.GA2707238-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608151835.GA2707238-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a295103 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=PJdgiX8PLVy5AUVXCKIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNCBTYWx0ZWRfXz7KR3B2aqHRL
 b66DHgCx+UZAUuEaM7ImYAHcX/o5q9v97+lduXoehczx/NPrrmh5Dh9yvRxnxx8oYz4C3pIL5NZ
 XUsmz7THh5st+1ZTepOYvWJwYsxcNVADJOyeJ5bWz5II/mPHGSqdwrZ7oMOmVSkoKgFjkolB64Z
 u7ymBXEBa5Ae+OUMfkw2O97c2EWiUqtkxDi/uBhpw621Cp1opjiLplcm/3dZlY44GBmFCALBiOs
 1DWEnfxz036DWWOP1eaKqoe5iD8q2PjQ2QaFMz+wXRdOPRHhHAT1b1vilTdEW/pQe1Kunl79373
 6qiUA0PXA3l2Q/KpuXQJ5LlRHKAQJHTzlGekrnHvXMesiwvwd+ZcS9cjtOscC5wDBMYJzrRDZaz
 qH5X0B36vZ+40qVYcmHumKzZV9QUO0soCbX/b0jS1zHJnNID8+5Z4EEc338qfbr0loMyAyYR3d/
 zeRnSITGUYutu4jgzSg==
X-Proofpoint-ORIG-GUID: zmzAp9FFYPVn_rpfHzYJX2S5O-okUjQx
X-Proofpoint-GUID: zmzAp9FFYPVn_rpfHzYJX2S5O-okUjQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-112432-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:qiang.yu@oss.qualcomm.com,m:jjohnson@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:devicetree@vger.kernel.org,m:brgl@bgdev.pl,m:linux-bluetooth@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com,vger.kernel.org,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94F7B66911B

On 6/8/26 5:18 PM, Rob Herring wrote:
> On Mon, Jun 08, 2026 at 09:59:18AM +0300, Dmitry Baryshkov wrote:
>> The SM8350 HDK has an onboard WCN6851 WiFi/BT chip, which for a long
>> time was not supported. Bring up different pieces required to enable
>> this SoC.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Bumped num_vdevs to 4 to follow other similar devices (Jeff)
>> - Link to v1: https://patch.msgid.link/20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com
>>
>> ---
>> Dmitry Baryshkov (7):
>>       PCI: qcom: fix parsing of PERST# in the legacy case
>>       wifi: ath11k: enable support for WCN6851
>>       regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
>>       dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
>>       arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
>>       arm64: dts: qcom: sm8350: modernize PCIe entries
>>       arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
> 
> Before adding new devices, can you (Qcom) fix the all the existing DT 
> warnings related to QCom WiFi/BT:
> 
>       6 (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
>       6 (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
>       2 (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
>       2 (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
>       2 (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
>       2 (qcom,wcn6855-bt): 'vddaon-supply' is a required property
>       2 (pci17cb,1103): 'vddwlmx-supply' is a required property
>       2 (pci17cb,1103): 'vddwlcx-supply' is a required property
>       2 (pci17cb,1103): 'vddrfacmn-supply' is a required property
>       2 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
>       2 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
>       2 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
>       2 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
>       2 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
>       2 (pci17cb,1103): 'vddaon-supply' is a required property

Most of them will be gone with 

https://lore.kernel.org/linux-arm-msm/20260522-surface-sp9-5g-for-next-v2-8-dd9d477407f5@gmail.com/

a single dt generates 2 DTBs (one overlayed) that throw almost all of
these errors.. we should be able to tackle the rest that remain shortly

Konrad

