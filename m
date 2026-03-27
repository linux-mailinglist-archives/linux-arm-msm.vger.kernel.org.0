Return-Path: <linux-arm-msm+bounces-100258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJhIBsNZxmlgJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:19:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC95342634
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85B643058082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BC93AB290;
	Fri, 27 Mar 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDlUo5Go";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1I42vQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8164021CA02
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606257; cv=none; b=gSP+fXP/ms0OQfgg5nXVednsGkh6t8Ur/wCctJDPser4RJN3YrLVfo4DoInK0sI/lUPG/bIeNGrpPYJERflE680IGFyLmexhAGKnPnWe3K6fqQhP+/HZZVcbbZEBs3w8/cCO5ucaq7buLmJEAsuzN+aRrosSRWar1fW1IQSq5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606257; c=relaxed/simple;
	bh=vrHxpfVQN1sEK0Pq40uAXExUzcToMFU5jlkMehylaB8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HH0eM0W1psmGT/UOeBV2Uo1aDOwc0I9wPshOViJivMs6w7uPXrt9HmwZFkJm06TpmWFZYqyYIrRpGm94kL+o0h71L0r6cgvs5ho1RGf4yrVVXs5NWEOKZjalyu3hsAiX2clLrHyOARt3hRRhQH2h4RrBrbToiNIG1DvAj/DvmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDlUo5Go; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1I42vQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vctW1749022
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDWZMO5h2IQY+cPJNgvKm7ajLI4QyoVQ1qlMtZyf/r4=; b=EDlUo5GoPu3boS5v
	voYrpK75gECrGFw/brUsE5FkrvAmmzWXgB15Fo4rVfaqPqu5JXrQmCx1hT+/Kkq1
	K41CxsAoP6MinJZlzrRIMujOPZ+2l0UieAfgEP3H4t5C23fRz8mDHRIDhrvlitjW
	FTvCmz8ZV9t8cNiBXSRk1/BVqTk3kaLeJHvw627D6akceXAW7bQxi4lGomUKQwlx
	0MXPplm7XKOVzgggx6mxkYeeeAbHhJbMbvUM9gyDiVDTXYTv9PK/m3V2UjJbU1il
	wotIvGGYCHK9aLk7ChpqwzGisCCYoeqkWJoz+Ekxsj6efaVSqTlGE7dsZL2Hlh0w
	PcOrpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn10umy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:10:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso6360481cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606255; x=1775211055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hDWZMO5h2IQY+cPJNgvKm7ajLI4QyoVQ1qlMtZyf/r4=;
        b=d1I42vQrCcMkANQrklbvrtvU/u7zBhD+r9M91G8kMgwBy3wW/H9YcFOIDNcwgUG45M
         HFwXbaOtF4S3/UIeLyXHv5+IFBLsi+NoEnk3FOtYPUZmTHqAtxLIkfeVC+1n7T5OZSZ5
         /zlGhyfDMdTkzLAZpQvYpR1hhsJVzEt5ogyp3Zng6iR3ngOY77xgkdxpLQ775Bxwu6iF
         jzSUx0j7vs1RowTgJVM+0+HkP+dQ7PCoVmovluYOI4vFNuRr3JLx93G+l5CFZ98Vyeyz
         Q6aY+7sl/xTy9kmU5OvGMvKee2kMobUNxwax/uawadPRCK1J3YNu9FojRimvyx/ZkIJk
         EnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606255; x=1775211055;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDWZMO5h2IQY+cPJNgvKm7ajLI4QyoVQ1qlMtZyf/r4=;
        b=pWrEevhd2N8BlIUx78vh3iqe1MsJVmIl84c/G+aUIQS9k0iiCBgLStVOSm5bzKMrPa
         +l3Yx3O8ohCSjdIdMjnpgh58CzZKXCmXmG6l+jNLSAZ3LuqjxsENfGAj2UxfyWEk5BX3
         7V7lFV+S2QRtyekKROr89LZ+tatl54r6KHhcg002RF7k/zNHoqqTJiYYqgdQAko2m7P2
         qbD5+OuKOTAs0ld+dbC9eNrRgD/8MLRJ5tp4wh6K0iQfHrP00CkwXgGXhV+c4ex2DQnY
         VUJttkbdMAolWLB9Ak3X80REzgvO/3jTg6qOi9xqcjlddxEKHg0djxYYIrFJrkCTOi8+
         vFuA==
X-Forwarded-Encrypted: i=1; AJvYcCVEd5r/r78sFEUST3A/949SRedLS5f78dV3TBEx+jAnX2jtTH/hyXLLpjUGLONXgZM2HgDSRd1MSb+AFBrj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqA6IHFOpkTs8gR8fLiu3FVax62F82xQO0VwgeYrN/3QvJQTHL
	kAbLeaYphXv8ZFXYNnrnlYmtTEq1/72LappRalQwh5gfBxdcW7/cYoQBcNhze+3pfX473qtP8To
	/mv2uS1LeeuMdvYClQYCwuGoi4pvpzf5a2CyaSmXJswP1pwLbAPqP7lkIXUJ0gPGA+DODq9Li49
	W1
X-Gm-Gg: ATEYQzxLLTJgjylLYYPaCFt3CqV2KK8Ukgprt0Y/IakmIFTOBaRD7LqCMas2vTRLAAA
	e47dVS7BAYHGokModQzlN4XGgVxRoGymt8uLnwiq9t9o/LrriUOxf0alwXiKpq/P/E7Df9xcoHq
	6ZZl2b8psjEk+b35/rEWJ69bDdWUBBDMNmRXeaH+g1gQKqpK34fMDr3ESdTJOPqaABWHjDmoRRi
	So3q2gSeBTw8K08Js9FoUn9d1rJcmEyRK5bEUSEA2G+EdkUALWy9/PmDROLZ/+DjBmHsst7nflH
	IWQoLCzo0KlYTDevziqb/fkL/BhLUxNuBr2CHX5tDJdmc4uu/yn8E+2sWCc3GgC2xl7sHRCho5R
	IvYrKc14kEoYAvw/wfsjIPPiW/obAfkUqUuMquaqL+E6gi8x/0bdMD2nbw5VshGCT5yu7qwSlzM
	iV7Os=
X-Received: by 2002:a05:622a:82:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50ba393605emr19878271cf.6.1774606254832;
        Fri, 27 Mar 2026 03:10:54 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50ba393605emr19878101cf.6.1774606254407;
        Fri, 27 Mar 2026 03:10:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203eec9fsm219026466b.42.2026.03.27.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:10:53 -0700 (PDT)
Message-ID: <c73b1887-6304-49a4-b6e8-a162d1bd55c9@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:10:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX7mICtWv7M1S+
 y3DemjMo8pcp5yqbXaq/Z7qKs0g0tBT0CuF/MboNADTSPRwXxk/SaRwbRioWfQAkOZLGlFmS5b9
 sWHT4Ja0TZ49+OUhs/5IHkktNmbFzaAKDa+LhEzuYVCSDWowZWsFPWDrf2Lr/QmkL4R8sx98O+n
 +3pIj3KJGdzlXkK+dPASHWUXPbPCwIag1er5g3m/IDLC0HLBU3I2s90inMrekOll+KvERPOEAiO
 z+6iuHTUk8vNGA/C5jlgGDwEq0r1LtSLrgB4c2e8PlKiEja+ClcFmn+oakgho6+eyXGLxrNWiC0
 4ZpTsLWp+LVQ5IV5qkWWenxN3Sh8tW23CzPqjuC4rasJOaElh8p75Wf6MwDv8dVI69ItA6wFuRw
 PTg/41T6piDm/2LSLO3dE2jUVOZ8kZebQS8RBGFzQgU/MY6qlz9/jutv6JNFcPBPVcKgl6gC6na
 caqc9l4Bwy7jLUXqWFQ==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c657af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-gb4YIgPANaGSZa7PYgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: onWfPG8xrdPir8A_9Y6apImqATGzRFuC
X-Proofpoint-GUID: onWfPG8xrdPir8A_9Y6apImqATGzRFuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100258-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CC95342634
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 11:07 AM, Konrad Dybcio wrote:
> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> 
> Does the _PHY_ DT node need to be aware about this upfront?
> 
> If we have some sideband signal (e.g. the sensor driver specifically
> requesting C-PHY mode), we can simply throw all this complexity into
> phy_mode + phy_configure_opts, all at runtime

Actually perhaps just phy_configure_opts, because phy_mode could be left
as "MIPI_CSI" to reduce complexity (while still carrying info about D/C
mode in the latter)

Konrad

