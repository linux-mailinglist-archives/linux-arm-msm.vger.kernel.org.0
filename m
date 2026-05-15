Return-Path: <linux-arm-msm+bounces-107903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ea9pHVUXB2qQrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:53:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289354FF45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AAE3075B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23373D25C6;
	Fri, 15 May 2026 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXHSf4Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxxMA6qG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639F53A1681
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847740; cv=none; b=chelthy6jvQrvjC0cdXT+cCCw/4LXT9vXFKbeVp01gwbE0XGRm39ku3avmXs6wocgO7800PO1BoyAoni68ubtpwKdJLP9JTyd3oHt+UAGecn09NtNkSdnEJge3tSZgd9lchORhnwLal87eZV7F1f2WZL7RfB/IuKzNZcWnJtrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847740; c=relaxed/simple;
	bh=cSbgwQsIMiL4r+c9TFJSvgPFeEAMxUXwZf80tWnw+EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGwv44Uvh05ps6ObuZ0dAt858cr/+VwmIBUooSBbfblak3RmkpPP70n3paXVED3AovCUyX2+1BFtSSuVYAy0ZZE/tvDKyCw/ArAkAg5194AWs60oc6xF4NnSugac4cN665PecQgD0xqcrvf5NAQ6dTTUujMBOTAanlQV2GMA1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXHSf4Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxxMA6qG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3Ru24008241
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3CKBojgLIxLibEaJ8g467kLwm5xL6u1aVmhYP8EbH4=; b=UXHSf4Cm5cKa15Wg
	FCJv8H33r5CHEEvaoW3BEGGjYsMG0DwJ0317XBxPW1wONjByVR/znbBMc5lPardv
	fmgwpDUqUXDH7c6rm+K8i2KAeC+cevc9sJih5QYpFkeiP8sQ7L+s2Q/DiwtFo8pr
	L5RTp2sXj9CIvQrocyOdd+z8hj88snyr1Lcd3u3ZY7ILyM5Vod5H+Y0vLBwBqSS/
	A/hi/jkZLeHCI9z5Nk2yMabC4UWkE6ln524+qkggDpfH4/klDc0jeIHdVfTS3fYM
	su8TerxT/GNaBLeXsSHUEcHW04zK7zE3edC0buujR1cfK/saFgcNShbYaMUQpQ8z
	5BsDMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su7kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:22:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so16840581cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847738; x=1779452538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X3CKBojgLIxLibEaJ8g467kLwm5xL6u1aVmhYP8EbH4=;
        b=SxxMA6qGqnM79FU6xGkre8MzRl/b6huGd0/uUphAJCVrCO5+9/8oNEDFvMSBJR+HMe
         x4pGR5hLX09hmb4SwR+9pcX0YpAwJCTeStuCLUylarXAn4+2rtzMoasi8xLeLHT7GEr+
         7UKT6sSGkVE2aqb+dunr8x38YxAABwIV2EfALa+IriEDQCU03SFs9+SslffeYKCQEeTa
         qpzNAseCikQrgr/5iN+a1wuj2ycnlVUykU0umGd1ssjgNo+cQxxgT7+VyEp/y5IMiyZv
         4UqMtAeb0IMZcnW3TCbyixNpeuDuv0aXY/+GtxIUHpqd/k2Mji0dJsDrp4jAIgD9CHmX
         xL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847738; x=1779452538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3CKBojgLIxLibEaJ8g467kLwm5xL6u1aVmhYP8EbH4=;
        b=s41gplK/idq4iRr5Les3ATVjf76oiHQX9/dBmOpqv74MO3RoOdDt1wKx8+mQxBrzd8
         K2QmD37gacpyWrhuag/m9iUKepvDLwymePMlmGVvz91EmAzPT5x3DvD+kG+bMmLsdncj
         n/qR5KmqZfgCh7e1cyeDTj5imaUG9VjmMOzNK5NVXkaxqdm052MFS52tJ3hLugb+XZze
         SEleuvhrL658Aa9tRGgUc/RLOIw/J6jSIkRRpBJMYRwrWP0znUPCFmYgkp8Iqa9DdCLo
         GhkKErWvkqG5dTDwDJHSHju7xjvcR5D0/DbSIw3xOTlxEkRS8AMg25LxdMzUusd4IC8W
         m5Og==
X-Gm-Message-State: AOJu0YwCLKpUQOFpCvIgINMok6l0XY3+8uGjMEhIBaM6wKwkYPLPtVGV
	xqsGcpexAUn2Q031Ek7jx8bXIUIIXpUne3NbBNhNyClBqPF57CRtlQeMN6tzFhjer5vgqnvcREz
	UVAxede1aWNeHVU7VoFWIWCZ3beSj4IBw610YHwLf9Op/D0jWID9aXur0HT7cfeorw+MJq+6vSN
	oj
X-Gm-Gg: Acq92OFpPAl8kzLXvxEnr7mz6YjjxibKs2tgTnFvyWijCWfT/rR+rgXVhvSInO5Iiyd
	IDYOofdf+hFA3XPmRcNMAZUPCjLBWBMFcB5aviN40MhfjzEFVqo7WytBxVC7XEGugCHhk1MAGkm
	SAFoav99k9QAvMY1DrShs4az2sZYcnto/hWWK/4Uivs1HfVy70Qs5ZGEkCi4q9uKfvsTsxabwFF
	RWZH7XQOd3iKAgR5M4xmO7mFIQNehDMH4WXCA8/+TBSAEKAiuS5jst7Ow/7JADqEif1db5+o6IS
	4M9huoBitfdFcmNbvLsUQ2FMo4dbCYTeZbo455zB1WoLRKWupyLpTZjJeB54KYC43uyOiFicI07
	tMnkEbZE8lWDoU6D/inrOnOE36pkhJplKpv6dlrTVO6RbZTcgCoZ3EsFEdAS26UYyt8PBOJrc80
	K9dWM=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr32714931cf.8.1778847737584;
        Fri, 15 May 2026 05:22:17 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr32714571cf.8.1778847737129;
        Fri, 15 May 2026 05:22:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6834ba6af5dsm1677738a12.14.2026.05.15.05.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:22:15 -0700 (PDT)
Message-ID: <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:22:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
 <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jX7HQuzw6XZx2H-oDiw3AmCelLZPRDIO
X-Proofpoint-GUID: jX7HQuzw6XZx2H-oDiw3AmCelLZPRDIO
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070ffa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DHS6kQ4Rh5SRIDjE-IkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX4H1dzujr0vXE
 r8U6wkAcNamk2IxJSgI5MkiWwJVPyNvrcxfAzbq7F9ErHQuBfhwpmcpOkofPTR8/z2HrwwwQvKf
 nwuAfW3/d5pzI0EgpjAAU6D6ikJ/c0wTGBTeBfgGXT6SfoniIGZtwQtbSOHxhBzAeuzUONHO41Y
 mZiaKEofZo73RB5ydxPe18bqXmCsgR7obkIC2B8qqI1MuTqYmciBfLnHL9TsqD+mmKeSrIzMM9o
 xyoS5riJNIrSHxZZy0tqgFhMCkqsM0eWMNKlZOLTgXG81NV7jubL9/66B/vXXnq1FiWR9klupJO
 wlYQfszvFBEIwBz13ga/0mdpdpj2iT6hiGA5CvuznCnAadycHGLe9e7ARlNxRibFIs4F8f3VVQY
 Ok8icpnFu7BSFQqCU8cAAS3SzvS/WUu8gabJZUi5n77kAFjSkKY4wVA8Nv+KVN+UhKJKd4KsKKP
 EnYRON5iLGLv2CQ2Q8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124
X-Rspamd-Queue-Id: 1289354FF45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 2:08 PM, Qian Zhang wrote:
> 
> 
> On 5/15/2026 6:51 PM, Konrad Dybcio wrote:
>> On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
>>> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
>>>
>>> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be
>>
>> But isn't that just the wlan-en pin that the power sequencing driver
>> takes?
>>
>> ref: drivers/power/sequencing/pwrseq-qcom-wcn.c
>>
>> Konrad
> Thanks for the review.
> It's not the same pin functionally, though they share the same name. There are two key differences:
> 
> 
> Different power topology: The pwrseq-qcom-wcn.c driver targets WLAN
> hips powered by an on-board PMU via the power sequencing framework. In our case (VENTUNO Q), the WLAN module has its own internal PMU, and wlan_en controls the power-on/off of that internal PMU — it is not part of the board-level power sequencing.

I don't believe what you said about the pwrseq driver is true.

> PCIe probe ordering: The WLAN module connects to the PCIe root complex through a PCIe bridge that does not currently support hotplug. If we were to use a similar node configuration as in pwrseq-qcom-wcn.c, there is no guarantee that the WLAN module would be powered on before the PCIe root complex probes, which would cause enumeration failure.

What do you mean by "*currently* does not support hotplug"? Does that
depend on some more code changes?

Konrad

