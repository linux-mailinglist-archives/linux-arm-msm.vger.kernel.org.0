Return-Path: <linux-arm-msm+bounces-97714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FE2BQNXtmmdAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 07:51:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A272901BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 07:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C660130612AB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 06:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DAB247DE1;
	Sun, 15 Mar 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPfCNDsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNS4TxNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE723EAB8
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773557498; cv=none; b=cQpPvZQk8hhTL7A+jrlGBnDWcq78pXqKVmoLYK297WmMpqIZLcasd0PE2C1cTqJX+BAL/tyB39yp1gG63cJJfhNmD3qJgtWIYT/roSx3M9TNmrb29y3h3JfPdZXGfAYsxY/xFcnRRNKkqnG44rnH5ThLrcSqrCnhdjwCRVTdhrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773557498; c=relaxed/simple;
	bh=RwMy2mfgyKVA+y7v9VNuo5X/MhlRdMccn9AFTNFVZUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyo0B8MBPvyUuhuieuY0X+dJsg0R8glxqSqj8UhgH1NlnvnYDBviSV1SDMi/+lEXAo+q7sLhjM5v/W2r5MEWdYgcmiUesprxIZgP+y+Dog+POtwCRLpVfxN4EZ1/lhyB4O8yuWaVP2shpqKp5xqZMTq15TRdPPz7D+PlxAMZWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPfCNDsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNS4TxNx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6To7r1955970
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 06:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8iueFWtlY+zhXPxKaErs1ddiWgeZ5KwFAs516vxzIQ=; b=CPfCNDsMK1h6ijOG
	kNONhfNXbOYFz9KhnaJuLH2NJtB8RRItW/3P440l3DRToEIzzvgs+2U+744S+JfB
	V54JeiBt+9MUux+TW4lVt0uo2ZVVTKUW1/JMNdZ7AsmaVuziSw/8q23Z4jP6XSMt
	AAgvHkZ8FfRWHUnuPiHRY5Hj9TMRhL4JkaUm76noPkBFhaog5+8aBNI/zticF9pc
	/tOeFUq1pN+s+v9UP7sLRMC/mqQdBZDybqAZL8qTssBT8njFCalNKmPl5bVf8waR
	GTHeMTuFCwzAlXRW3IUNMbfz60q0RWg8IfwDjw5u2xBKukHEyZ5qIrhgmZe+Y7+k
	1FX1kQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043j542-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 06:51:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04911610fso8228435ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 23:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773557494; x=1774162294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8iueFWtlY+zhXPxKaErs1ddiWgeZ5KwFAs516vxzIQ=;
        b=MNS4TxNxtS71SOgU88WtNd6S4x2IEBZkHJoeEsgF5BejDjzMQaQKMvXfcesPxDMgSg
         52EodlUbijAnI5q0ZHNpPKK0t8jtzt9vVsvVPaOmRARSWTjbi4vpWg+hQsVW4pysT816
         OPvdAVGGyhtAeJh9as5PY/09FIhOhawOlBS14zIohqjr+JnFzXQkkJn3igoBSQCjL00/
         yj3xWPHQZi4jzvY8EoVnHUJiu+ex4/DjY12NSIqg82oIPD6NNb6UW5A4zwnguuSvfSxh
         NC2RhFSHPJQrDXae9u0S/DcEGHLVchHI490Qld8KCyZioSw+/1cK/yqL0C3XEVVYurA4
         TWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773557494; x=1774162294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8iueFWtlY+zhXPxKaErs1ddiWgeZ5KwFAs516vxzIQ=;
        b=IO59b3jBg34MYYBeK9XMD53FRgX/JfFwTeIhWBuVjNPxfibhIIp0r5nxvF+5W/3zS8
         21N8c883zC2XVA4xYGNBGgvdsN/ztcLhv4g2+WCam6CsyNnnXqoM6TMSNg+rVlRRjDMm
         7XcExWgxQJJD3ehrG9G4rrPPAvh9QWBEfBSl4IrriVEsFt+cnfc8YxLdWY8/PVqXGKDk
         GkdrySEaiPDnM3MIGVcrkdH6RlDFuR36e3R/lyCOi2O0Ll7K1QvR8HzEzokjz3F8HOc9
         YD/bxYcTBzhCplcwjruIR/4/mCes6TOy1DQJJJNHqleWxWv4UdclxC53UVx1eLtt8FoN
         Evgg==
X-Gm-Message-State: AOJu0Yx5qkKrx9Ej42+NIWmW83D9Abz/BkFJhCn/8w73Ix7gGG+exW14
	o+O85dOpwFXAnOLWVI8J0zfBebGtWEIQ0GOInACo6P/am04ljQIXYJpUnT5c7dXmMf0m2JyjqUa
	nC15Wx6oiFCDe7vbWDtUp7hYtSx7MeAU/Mfucjp3hHgeO+0pjiDquBgQ5ICKzmtGpVutb
X-Gm-Gg: ATEYQzxeVJY9mOYeDIFyfnq9+GeV2MbFaptt16i6uQTUOoHO6A32oH39CWzsZLADvTN
	MWEVNTsbUfCp+O/yBhbeIfJuMRPF2wbEj8A75tR19dN3isbQwsDMGmZhT6f7IkrK0fwNwczJ/U7
	FqCp6SvwDv0aj+wf1Omgy7LcwZKEkakdPvVLsi4oYKFC3ghOx8AMZ7EDHwoxCJtAX+ja73qIgAa
	hfS49RjJoheDNCkMF/c6d+CJMcB56CfJD8jCCtMagiFvq55/INAyRz2ByfWuZwgfju/3iua/7IY
	RTecKiHHlhB+q01Z0/DmL47N7+7SMvUXOSB0v1RP5DPCMy3sJRQrAicD7s7ntGkZkipZPKoxSFl
	wyC+GF7N0B6TBHLgNuQKpgW77um6FvkzusuQY0cbaaQgfczhpLoA8mIE=
X-Received: by 2002:a17:903:3c43:b0:2ae:c9be:5f30 with SMTP id d9443c01a7336-2aecaa17821mr97593005ad.23.1773557494360;
        Sat, 14 Mar 2026 23:51:34 -0700 (PDT)
X-Received: by 2002:a17:903:3c43:b0:2ae:c9be:5f30 with SMTP id d9443c01a7336-2aecaa17821mr97592775ad.23.1773557493854;
        Sat, 14 Mar 2026 23:51:33 -0700 (PDT)
Received: from [192.168.0.105] ([49.205.253.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c832sm72759705ad.34.2026.03.14.23.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 23:51:33 -0700 (PDT)
Message-ID: <45cc4191-f667-4822-ad51-70d7acb96f69@oss.qualcomm.com>
Date: Sun, 15 Mar 2026 12:21:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
 <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <e80ad550-71a0-498e-9ab8-6c0859883f7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE1MDA1MSBTYWx0ZWRfX1xbxppjaqRKb
 ZLriKDjyBWSj/PjhinLGIg4aUZGWPemgHP1l7ia6sC6CLFZoNMEosoBWqcu5ELNqWV09qRxuytd
 39eizvZeuyi5md2hqfZrqJxYZV5Lb/04CZoylsVFExJyULGyj6VwBS/w02BaSFJHYbjWNEaqVIU
 q+fAKwF7/RuUgfRDtROvroyS9SrcGXJDREu52eg4D29o854KXQS+e0Qa80L66jzczgkmNYpzfOW
 ziQXqm9zUg9ZEzN5XDaGfgEvtCu1GniOCcF5ppHiliJI4NnGAT5ZrQCaKx7wBLbSxLHeeJosFJR
 D47S9nokiu1wh774UrU1xWMoZEf6aYGH0jHacJ2yGPOmvMT1YYhR/3hp4uHWiXRkX9TiqI7mLxs
 2MlL+GsUoVpFGRQ+7RZ70i6i7ThVn4fIp2ZbgY0jdKNPajCfRlAINLfL4r7VOuTI9s3+h4b7rk+
 EPDUrt5g9ApryXzDqcw==
X-Proofpoint-GUID: QwcMoHfOW3-F6giZwnWb7e2XLLPxFKS3
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b656f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Q/HPfrgLATOYNzIt5FBWOg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=xiaT7CXxcbYZedJJ_CoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QwcMoHfOW3-F6giZwnWb7e2XLLPxFKS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-15_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603150051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97714-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:url,f000000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shazad.hussain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89A272901BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 7:11 PM, Konrad Dybcio wrote:
> On 3/5/26 5:28 AM, Deepti Jaggi wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Introduce base device tree support for sa8255p Qualcomm's automotive
>> infotainment SoC. The base dt file describes core SoC components- CPUs,
>> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
>> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
>> nodes and enable booting to shell with ramdisk.
>>
>> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
>> platform resources such as clocks, interconnects, and TLMM. Device drivers
>> request these resources through the SCMI power,reset and performance
>> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
>> doorbells to support parallel resource requests and aggregation in the
>> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
>> using the Qualcomm SMC/HVC transport driver for communication.
>>
>> Group resource operations to improve abstraction and reduce the number of
>> SCMI requests. Follow the SCMI-based resource management approach
>> demonstrated by Qualcomm at LinaroConnect 2024.[1]
>>
>> Limit initial support to basic platform resources, serial console, ufs
>> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
>>
>> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
>>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		tsens2: thermal-sensor@c251000 {
>> +			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
>> +			reg = <0x0 0x0c251000 0x0 0x1ff>,
>> +			      <0x0 0x0c224000 0x0 0x8>;
> 
> All TSENS regions are 0x1000-long
> 
> [...]
> 
>> +		tlmm: pinctrl@f000000 {
>> +			compatible = "qcom,sa8255p-tlmm", "qcom,sa8775p-tlmm";
>> +			reg = <0x0 0x0f000000 0x0 0x1000000>;
>> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 149>;
>> +			wakeup-parent = <&pdc>;
>> +		};
> 
> Praveen suggested GPIOs are not controlled by Linux:
> 
> https://lore.kernel.org/linux-arm-msm/12063990-70fe-4faf-89fa-c74c7bd97f42@oss.qualcomm.com/
> 
> Could you comment on this?
> 
> [...]
> 
>> +		aoss-0-thermal {
>> +			thermal-sensors = <&tsens0 0>;
> 
> Is Linux going to act on any of these thermal trips?

Yes Konard, it's going to act on these for thermal mitigations.

-Shazad

> 
> Konrad
> 


