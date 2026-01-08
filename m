Return-Path: <linux-arm-msm+bounces-88089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EED02FCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91D97301D1D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B19427A04;
	Thu,  8 Jan 2026 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJSkDKSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvIcYDWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E91C427A07
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878055; cv=none; b=nc5BLR2hVMpaQ+ZF5HEE2VlQljEKzDQGxtZlJrTPrMiCjsMvmHlsQafrwfAU0SIRFbT6/PuwUFClAvXsIbfF8IQbTO+fRuEpmz58pRZl7j+/U/MZ+R2C4WUf6xv4WsqSU8dtlx1rnK6qBEbMGMGjV8SOv2cvG2fNAT5IwQ95UK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878055; c=relaxed/simple;
	bh=bmTWha9Fgf9o41xEl8X6w4aQ+q4jIHIYXxU83NwrE0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V06j/nh5VAHqaWsj/1BOPHqnwEQDRjPuOPj6R5fsGZcMXdcjtVMN6wr0fCNCgIOQ18FC80bC2aCxnxVa+tPfahJYGKg8+opsgvneo7dQO4WEqqdZu28Nkal2dFhT+0QyeOEvSvZs2dGtvf6dFObSWlm7r/8YMmfhtVi2dNSQIbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJSkDKSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvIcYDWL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089wsk4125834
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 13:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UrKHuMuDaiJdfwGlVoYQ8pCn3fiJV3iduFFrwd1C0M=; b=CJSkDKSUzf0mVoap
	Qdvj9iJLCv0OTYUyUPvV5TiBDyVyPkfJR8a60OsU7uVwvBmbG21RJ9oaklv7E7k4
	lieLqt+y5gVoEsuvTui7Y/CxNanf6uUItp67lRZZK4yM4jBBUW2DJE8N/kxV+GnK
	58HPj/FFVWZP/BiO24ztHmgQqv57JQ8UMJyJ772roVTs3lArPwZGzHOLdzN2fMiC
	MLdeSd5/ZGwwlJyMRIBGrq6rTsGXwAEJzpilkH2ht+a7Bsjeg6F3LkeE2IZ7RyN9
	/eLuSi7PkF/2htWfb2WEG8KSbjuAtAcd2xCcOg9M9adEtb2BJAk3VC7c0yWfj1Vv
	Snkc4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d69wpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:14:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c231297839so109470785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767878050; x=1768482850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/UrKHuMuDaiJdfwGlVoYQ8pCn3fiJV3iduFFrwd1C0M=;
        b=PvIcYDWLcC7qmcCrm5HEXriqH8uTcUCwQKD/r7mQesmeW0lYT4aU0jfVq4vp812pAP
         yH/02Wxh/5vieeosLZ5Bi8UR9ifwunmE3Z9NkLN/+A9M/+MyMG8ksFw3Z3sIJluQRWal
         6wstJY97BglM9Q/vf4hszktAFYauysGAYucSvNjWTbgSQ5Qe5UpzNrYyJlW8Os3PXUsB
         yYdBSbLCh9PMNGcQJOZ3PzT7WSadh3QspWa7JuZ3e5c7mCpahZtNkBy8D4BrgfjYfC4y
         JkuTYMdkswMyLCgEwOYidhWqeB+fLwrKVZwBuv/hIpJ31YPLz7cTs0gZdp4AvmZb5GIc
         k0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878050; x=1768482850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UrKHuMuDaiJdfwGlVoYQ8pCn3fiJV3iduFFrwd1C0M=;
        b=w9jkzP62PDR+lYlU184AbTBbQ9Dm1uQVKde7ifI/7k8ZMwN/R7UO15BTR+gV9N4pwX
         f/WvlLoCLLZVEqawcWXbkAjxQyhculOuffSBLuDUo5xlBTGaTgpot1kmVDwM2KP32Ezo
         GgSnAUv8cGr7QZ4tAcZq9D/tmWPQPVHSUeV2cQKRB+A2nDJ/3s4gRRGnJDtHkBfuE1Xz
         qiayW4i5TgTy9bEiXMS9r9zVpLMR7nm6G81jvq6ylcp2Kt6vaiCsvwHlfmfIztYhZoaO
         eiTEv9UskOlQh+pykgEmGlLddxnRXoqybZ5rEBsDhBcvyjc9i3hRlP3xQplNW8sOk1aZ
         DtGA==
X-Forwarded-Encrypted: i=1; AJvYcCWN8TcSP+G764gUwEKO8u6+VW3AAAlwLg87tY7lAl4JNpL5U4r5LL75P3uoBhTiwx7qeCujAOTRxYEt92S0@vger.kernel.org
X-Gm-Message-State: AOJu0YxtOQ1LSGpw48NLF2ppfbHEzD1uGKrAbs8J66gw8sNiyTl3PcnV
	gT+ITt/F5BeilhBHDmUHoX1Z05dkskDjCrAZmuITfFpnfVYijwS7hWpdk/y0gaew2k5I5au9L3A
	3fK8qDOnzu9lLXVsz5q/m5jkynHEgqFoawggBpecTvj1bPO3ITQf69lnDk6Ce14YEv/4l
X-Gm-Gg: AY/fxX4eAY3549d55gWv+knI4a0uOqkhe5Z8AAs1e0d7SldiQ8gj0n7ggtgln9bx7YK
	t3zgMjzgYPBffp9MMJZjko3HTY3zHcP+GULHgO5x/AWd4QfOAN5f9+XeRTBvyAcORKtBzedUZA9
	eMxYbOW+kfr8ACzHRd8ntgg0lcscft7SyA8s5qoFXi3QNcZUfOHrkcsqSEjgyvR20tIEBTXqRTR
	2rSh9FWcQ+EmIm78zazzIz0mvVrmm6mxx6Wv0p7v2yXBcKpZLEnSbJ7Z+RBQiALOuC4P/p6aPMf
	/iDKyt/r10PStW0Ym8Y172aHKcpTc7qT+FYQLLaN4J2l1dY6USFNhpTy7gKEwqpiMGLR31WK1io
	Hn+RmKvdrsyLeOikR0FWmeEfAiysn1xspvbBVQmPNkhsqV/ch8ljNnAbxseFIYkn6Vkk=
X-Received: by 2002:a05:620a:2956:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c3893e8223mr517990485a.7.1767878049724;
        Thu, 08 Jan 2026 05:14:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9IM9gFoDCpytPpC9WZV6mIUTsotEOiU2S1ASfq77NRu62KRQZREAy7e6BE6lPBqxqO60Qag==
X-Received: by 2002:a05:620a:2956:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c3893e8223mr517986685a.7.1767878049249;
        Thu, 08 Jan 2026 05:14:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56db16sm804206866b.70.2026.01.08.05.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:14:08 -0800 (PST)
Message-ID: <9ceefc01-46fe-4c9c-b23e-d08835810d96@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:14:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: tessolveupstream@gmail.com, yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <aV4bRLY6s3s3uAXa@yuanjiey.ap.qualcomm.com>
 <0d48a1b6-6946-4882-9dbd-1a1bb50770e2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0d48a1b6-6946-4882-9dbd-1a1bb50770e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KHx8bz2alp-2wWAiMaDX8n9PVU7f_AnT
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695fada3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8
 a=JeiBKWswVjvtFiaB6FEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MyBTYWx0ZWRfX8zPjGuARAoHQ
 EMn9xuRjnN5+QyLolrVyXmSeqy2YnEYD5PoZt5w1LlmG+wWFl7Mp22q1SU7RjiwhgCHoWjrOp59
 hPQrISx+Z2Let8DiT4sL5JkdpKLc18DNeE2n4+4JtfdmolUrp5krabneoHy2Hk/RZgHVMlk/baE
 wWA/TZ2sgVktqpPT+RUy20nuZpyULKR85RslTqpAKW11sQ5nNpZrUGpph8Wm10eDKrfyi0Cc4cm
 xAk8At2TYgqDZS1FthGXF48KWVXE0DrIVk1+3zFvh1skHjJ03mqfbAu2glMIzfRwWTVK7QTCKb7
 bmu0nWRBoYMdr/ivUUDbnpwaNuqIAaKdoGF7NSol7c9U910jN6643amyt9SWr5NPct4iS4lDIj4
 eVQWgk79ddz7fDCQ9K71HB2OKXNf7fZjv5LjIy2SURJXQFiZBzOzoUtGjckvON6VkrrHfa3/Qhb
 R/EPsSfpq6VhedxwEdA==
X-Proofpoint-ORIG-GUID: KHx8bz2alp-2wWAiMaDX8n9PVU7f_AnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080093

On 1/8/26 10:29 AM, tessolveupstream@gmail.com wrote:
> 
> 
> On 07-01-2026 14:07, yuanjiey wrote:
>> On Tue, Dec 30, 2025 at 06:32:27PM +0530, Sudarshan Shetty wrote:
>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>> platform is composed of a System-on-Module following the SMARC
>>> standard, and a Carrier Board.

[...]

>> These properties can work?
>>
>> dtbinding check says:
>>
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: panel-lvds: 'power-supply' is a required property
>>         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: clock-controller@100000: 'clock-names' is a required property
>>         from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:0: 1 was expected
>>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:1: 2 was expected
>>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:2: 3 was expected
>>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:3: 4 was expected
>>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: 'ti,dsi-lanes', 'ti,lvds-bpp', 'ti,lvds-format' do not match any of the regexes: 'pinctrl-[0-9]+'
>>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>>
> 
> With regard to the power-supply property for the LVDS panel: the 
> panel does not incorporate a dedicated power regulator, and therefore
> this property cannot be defined.
> Concerning the data-lanes configuration, the LVDS display operates
> correctly only with <0,1,2,3> in my environment. Modifying this
> to <1,2,3,4> as proposed, prevents the display from initializing.

You'll need to fix the bindings checker errors one way or another.

For the power-supply, I think it may be made optional

For data-lanes, I'm not sure it's even parsed. Are you sure altering
the value under the TI bridge endpoint (*not* mdss_dsi0) causes
issues?

Konrad

