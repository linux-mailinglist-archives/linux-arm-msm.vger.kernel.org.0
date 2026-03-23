Return-Path: <linux-arm-msm+bounces-99277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M6EK35CwWmqRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3232F2F3176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48F223027370
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F033A59;
	Mon, 23 Mar 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP/ADASy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="II5iq/CP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0A3AA1B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272472; cv=none; b=ELxyhP30L3mfIImSJkgT+KbAX9aEte+wumXavGu8TrmvQvkMU29ROIIIPAJV7k/l8SHxEbcf7wqOGK7dNYKq1lGVNAf+mAdboca9j0jlwjd9XwEI0Gv1dPm0ZuqUcE37XoO2TtB5S+QWWBxSIoan6slBeGGLv8oC/B4U0t8SzlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272472; c=relaxed/simple;
	bh=VixWgMOvzZAdMZParcQkGqzz2G64vxIA/OfvjCQmY8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWwnZ5lt+JZUvSZ8/qFO6zvZV+h2QdpQixv1ZaFAMwA0itAUvVkgz/3Bfe3+bzHnwMDzCuZJ6n3wdkrt1FHfz6OaZvN7I9+6uzsfxff7kz0J/D8VMGnHD7e/GXWAISwVlRr7cVz7Q9DH6iPXbqIujbfpVufCBJBrozZsWloHSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP/ADASy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=II5iq/CP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NAlOOa2173767
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2bTapgCUjPbgxkm4GqsyGa0VN9L63QkzThqqt/kEdM=; b=hP/ADASy5lo6PDNt
	PP0xIxnKLZh2+XH6dBRVYTKSzuyrKhcwnC9M17Xdl+t3sTtia1yBRsknaNYwW9GK
	Ltqqt00Mo8WycLS7JgH5eL73aJd1oRee79G3zDFKE2ggdD6k6pyFYTXcb0TRBVG+
	bN3whwnHIMxO1o38JFLrqCQ9QlEspb4Xrux8uEJQEkzx5qDE0GuaYNgIIfPWYE9t
	IKqnJRtlSJ8moQSfE9zuzS8xnYJCojwKQyWfEhEQQYzFEuPupnCnJUnMOL3sMWQi
	HJyOgCKAWTXqMdyT/h33c5EOckemHdtqlA1eV3YpvEcLHkCpPhWE+xsk3dLHK1QV
	4EPsHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8kgb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:27:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0554888cfso2327145ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272470; x=1774877270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2bTapgCUjPbgxkm4GqsyGa0VN9L63QkzThqqt/kEdM=;
        b=II5iq/CPu6bvabLnsdbnXJQVLTsf2XLSsffi2tCAt1yM4Ihn/p24fPlQQQsBHO2/3b
         IMO/ta5OR3lel6/EXCkfdyf9WHIxy9flXf04Oc0KoJ/oC1p0RsfzomE5p/QUBeFftpTs
         Z5loCDpQVOaXXx5lm2+KnUi8AKiQ0yJWPux97gPvSJYpnCnm//FQCFCfDNM2wTbw/ATE
         m23poGWS6/uPFK57SoxuNiZwnuXqTHCCcxp/mpQhqZS0VCSjtEoV5grFBaIzN8fYlwTn
         4x3HWgf6u9G1mBLwRdfQ2SL8uoedmeNNdF7XYDcdD2QwcRSZefEVnlZ9ucofwDkskssH
         99Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272470; x=1774877270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2bTapgCUjPbgxkm4GqsyGa0VN9L63QkzThqqt/kEdM=;
        b=kmr9/KIhhsMgvfKzWb9vwYKPYSL3TL8RWhCfh5HpyWtzxNFGsJQ9bkXyYvQ5Y5J80m
         VhUkoyiZKRQ7qSTrve5XTRNSIFxrjlzp4tnCaK1WWvG5p30ICjobTLihvRX6rdTz06yx
         kxBYAUPNmiCijTadnR2/hkG90Vl+Kj238DvssjX53WS2L5wj4aNWyMw1CI4+BcUwq+TY
         mSRmRIGeo7FFYPbKo//zfQztMAOoLCxJfc0tRgF1SJZQfCakP8oU66Xiw0J3/SUK9N+R
         iyeNgu3WmBi9j6tyIKh2JN3s9/qtEksEqoKFX3wBTNo018CAP7tU4OPqyD98Ad1nmmGp
         ES+A==
X-Gm-Message-State: AOJu0YxHv0k4GkPsO9q80zoMtfmKiBFseuBrej4ZzsbYF8cbkudNB5V+
	erZ3JhsgBtQD0DJiO7YM2WtaqsSRAognnx1gmcIyoq3hgdLxlFiHZTUEnmAzZkHT+yvcZ1rLhI+
	HpQdHi/eatBvU2eXGkAReDcfh/Jd1HDSMM3xktPfm7gXgIXISLC0OfnyhazqooD9yXgDz
X-Gm-Gg: ATEYQzzad9RevR8+rVqphqJEWkWmk5WN+8xPQdMKchVcHlCH+mo63tyjaUZaqm7iIVb
	423EKxNUKIFADeA+JKhM3sdorU7hmB4pod/0oPnu+t0bZMYCJ+hIHRulmL1F5SNFowG5CYrkCzg
	rzZ6LyS/sxd9fh+2rgdmFujRxEC3OPRBlQXE6p+gMOiRHT7kW79BEKqx1qN+jvuqRTFkhkFa7DG
	6CDk0BUjHpB9jUUnKaSsaHLInbkuY4icUaYpUg7drAKQbyGN0X6eSiB38FjBA72kVjdW6OYVoMb
	8NYhZvAsO/20RCx7JSKR3IkJ/63jQwA/gRxEufmQuY9rRYcD4TahFVKS6hCW+3ax66c5VHyqlCo
	M55Tfw/+RTlqwhywXKnLKOM0hbNWXsc4k296ABr938+m1o8hOJAdqLhj30ZlagZoSbU4/xVG/Sh
	vgrX0CrC/2
X-Received: by 2002:a17:903:986:b0:2b0:5548:7d80 with SMTP id d9443c01a7336-2b08278afd1mr97325435ad.27.1774272469781;
        Mon, 23 Mar 2026 06:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2b0:5548:7d80 with SMTP id d9443c01a7336-2b08278afd1mr97325135ad.27.1774272469230;
        Mon, 23 Mar 2026 06:27:49 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836b15fbsm144412615ad.81.2026.03.23.06.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:27:48 -0700 (PDT)
Message-ID: <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:27:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwNCBTYWx0ZWRfX9aeCmZVL8uIy
 VPBoLx2xydspz81fc5JLaRKlx3DqqQCdwwJBdHRm1a2Ps2uw7RfxFAVmHBWXRg1vluzjiD9Qwt0
 CbEzn+mKmLKWF9nZ39noLqA0MbJrzBsC1adVnDDEDZeeh3SCrc0EzJuVQBqsM35hoehPLnBrEOX
 E/TAUKVFSwjGP6YWBGsXCVQZyLADyF1RafH25+S+0nNh8NRrKjQTCGIzU/Dn9CagJBMF8mjrBkg
 cHbLKaSE9Eq/2vgKSJ0sSNeUHLuV8DLH+2dDUahg/gTv5Kga3fMpS7Adm+QETDHEV7iBkDeDWcf
 3nlBgV295AHhUmMQASVhdXVwMzidIUxYGm2+B3dTg86S5GDvcyfoIQN6WrCVVvdBn84Bw1OzV1h
 eVJAynNe9izK/L5jOMMzUxGR2SY4upKvm8VjgWZ5Wl2Ls+6hLUKJOqTJog85PWtNpY0+fcW+xFs
 rFo8GkxdoayrsvldWIg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c13fd6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aLVIdYt9wyNXebfZDecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: l1jVw8-F0AgXvzCVwF6xHn2gct7blxqg
X-Proofpoint-GUID: l1jVw8-F0AgXvzCVwF6xHn2gct7blxqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,11c42000:email,11c4b000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99277-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3232F2F3176
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
> On 3/23/26 1:30 PM, Jie Gan wrote:
>>
>>
>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in V2:
>>>> 1. removed two cti devices due to GFX block is down
>>>
>>> i.e. "because GPU is not yet enabled"?
>>
>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
> 
> Do they need the GPU to be online, or a clock from GPU_CC, or
> maybe something else?

We need a specific debug clock inside the GPU block. The debug clock 
only can be enabled while GPU is online. Also needs AOP to support 
enable/disable the debug clock.

> 
>>>>      - cti@11c42000
>>>>      - cti@11c4b000
>>>> 2. changes two TPDM devices to static:
>>>>      - tpdm-cdsp-cmsr
>>>>      - tpdm-cdsp-cmsr2
>>>
>>> They were TPDM instances in v1. What's the reason for the change?
>>
>> These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.
> 
> The registers are clearly physically there. Are you saying that we
> (currently?) can't enable the clock required to access them? Or is
> there a design defect that's preventing us from doing so?

It's about hardware design. Some of the TPDM devices are designed as 
static, means we dont need access the register of the device for 
configuring. The trace data of the static TPDM is enabled by default, we 
only need enable the port of the connected TPDA device for receiving the 
data.

I have tested these devices with Jtag attached, so I didnt observe issue 
about these new devices in the CDSP block. (Jtag will provide debug 
capability for all debug devices) Also cross-checked with hardware team 
for confirming these devices are working as static.

Thanks,
Jie

> 
> Konrad
> 


