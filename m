Return-Path: <linux-arm-msm+bounces-82339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DCC6A09F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 793C43429D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441B35E530;
	Tue, 18 Nov 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBQe1EmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE8Ys/aR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985F363C79
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476360; cv=none; b=gjAZTINU8fL8gthYyx+fvYtrvC46hZ8jhVRFRCQWDBgpUfnV18Lu+Em01/7GPXIgPBLIUSTP5z215fBexwxaroIJLkuU3yoYdd9aSBnnCRB2/bZNsU773XZWEH5R1hY7VXXX6SiAp/ofK4910pl+CtHkVA+XzldLbsKQhb+WLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476360; c=relaxed/simple;
	bh=Z7TNCmcUKDQodXAV+vzpqE8OixNADxGlkpwNC6kO0B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaYanN6hDO9cE3JLLzLwQ8jsV/i/vPW/VSntdPgM2AO9tbHbY2eeRnEB9aFB5do/6LRYTlVd4wQkl4ifYQIOq0S0q5Vw2AlQs6QUOC5yp9hDXRF+WhIBokU9ZPbiErnl/k0GbS+yTrNcsnbbwJKoSOYU911etdJ9BwvmrHlBY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBQe1EmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE8Ys/aR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rOhN2664787
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAIyMI0KFd8UWpSda+gD2RVYkSdx4cIpdw9CMs5ONew=; b=kBQe1EmS4eZfWiOp
	vS4KnfiX/Im1sYqdVmgL2FYq/fqcAx360aEVuq5uiSoxJg8sz9b27OSwIjh/plbl
	l052yioUAPJiVKaAxE/od1QCilOis1Hz3Ei7zvPAvT+fbrtnaGVfWOj23dLFY/Xl
	D6AupSJk8NUVzoeUN/sF1hFZCjVIUD44LyvBaDIEy7EoE1RzY2Fbz4iDkufZCXBh
	G354/oPhw8m/CbMGrkZvt0AwchBU+BLg6dCClg+5/s0bc5jzbvSQ8ZhesB3WgOCQ
	phElRHsIm5wjPYEDuDCT8XirAOwtc2L63IAA0db7UAoi2AACGaOGQPQfPMSXNQDZ
	RU1AQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8qfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:32:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so21355841cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476357; x=1764081157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAIyMI0KFd8UWpSda+gD2RVYkSdx4cIpdw9CMs5ONew=;
        b=TE8Ys/aRWiVLJdcphJZA27vvH0vX+28WOFFjooHXbdN13xKC3jlrPeM5bD2UMKNldc
         qX4O16DR2Y8bbR1ACh+yxaZDc/wLJ8i6xHtLWa1e3OvIzY94Xo2mMZ0ZD0JS2JQaIc5C
         Yo152469rje40L2LKNEjdpL9k2M6U2ZrH1IlWOAoMG4ixnwgVprcbJ+/iuLqmc5beyVx
         FHpamnYlBcCjkX0KUAYwQ6eLb/lPY64k5NV3LhuXzbTUKZ8NYRHx1HLZRujxjujVKSQ9
         Nq932S4iUcO+dpeRN8Px2GeV08AGfrWEZWJlD1w1V2wT1rqzQSfk5ox3aT3RoLqFYR9D
         AjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476357; x=1764081157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAIyMI0KFd8UWpSda+gD2RVYkSdx4cIpdw9CMs5ONew=;
        b=hsrWDGcNMrlpXMdzzNVCIdAk/m1SrpXbPxz15oz6SsC0jlvcix9wzlHNnPONFgf7yv
         vps8us/+r5GG6ofGcsFa602v+qptSPM5vGXjsS3B53ukCJ81Sx5oG0mNb8WnXteIQX3O
         dAJk+0NHvqbk0vMW4LdlO96lPByg8RIUk/of4588B2P0S4DQYo+kXZ/VcSW/VGeveU6W
         JvxPiXuxiHCd6SDgSwVSaUgxbfjJZDUKSBlEIfWhUYLi0YzehjmsWYidHq5r+/pe34r4
         XlB33IybjYiJzDo5QfTDR4sd+ko59TMYu+UIDrZj6yV6vD3EZkPLAZ0tznwS8SD5butv
         KnVA==
X-Gm-Message-State: AOJu0Yyls1ZCbchz0g1pyI6/MzrtEBW6m1R8AV7lPtpnZ+405LVd/a5o
	a6aeXPg7vdAtEWXZwe7iRqk8tNi3e8OhJDxsdpWL4ZZONxtkSEpdJVK6T0vx9HHtwIOy1jK8Jk4
	tHN9JFngQgEoNyq6GU+FHmmT6Qw2JBfrOt86/+WhBfzO5XNYuo+E1zLAxqYrWJPx2eZ05
X-Gm-Gg: ASbGncvs4ACrkDcQPO/KHoXL9zm1RNNlooZoTd9IBr7gr0SU9+8/Gq5KoWUlU5VL/KI
	+O8HWi0od7u7JrUoTXMi2oUTDoQyjf5yjbRGvDeKc94Oj5UHmfU18pbeMQSsCuuIoYWgG5+fRNV
	Pz0E7MEwlykLwUtCXZjDmss48vzazPs8MMw65RqHkzGmReNN/ceEmpNUgRltuuCS/ufrKHZp595
	pxmJ0wiL+YqDddsCGfiYPMEriZFQeage0t5hAnPG1QIoCADAKvKv3epdiWCQ9EQJQu8vACLqKjy
	fkk5sW3uo6LQjENjXKAL81PbY8h+9Inh0piNC9lR9ydrgyonXS+cgLxoxInqADv8yN5xrUiT16O
	ZoSCFDafo+FGqtrlG0pgMn5ZZzCj5Zc+r6cOW4yq6cR2Hs/Xc8eHFDRyJFM2jl3irNiE=
X-Received: by 2002:a05:622a:1a11:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee312afc09mr26779131cf.0.1763476357092;
        Tue, 18 Nov 2025 06:32:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf4+eZtdqVkQt0VpyMvkBuqm4gm7ZauIau1ePIY6CR7MP6U6OvIeyjRN/1kukNb6rjk9yfmQ==
X-Received: by 2002:a05:622a:1a11:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee312afc09mr26778191cf.0.1763476355775;
        Tue, 18 Nov 2025 06:32:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a497f27sm12810665a12.17.2025.11.18.06.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:32:35 -0800 (PST)
Message-ID: <47933d5d-65b7-42e9-bef8-c6e28c80b90d@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:32:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator
 as boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-3-79fb2f0f253b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-3-79fb2f0f253b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1_zLUh8P0SITaD_SYB1HGBctAcTp81iP
X-Proofpoint-GUID: 1_zLUh8P0SITaD_SYB1HGBctAcTp81iP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfX7aiftPUDzwkP
 Eb4hHVs35RBDBDKCxAmVOOribjwwQjORLgXP6qElkuILljw5YcfomFICfwRhqMa1AbAVa6Y134P
 3LowryrS3z6cbbooTPyDWPKJ1l36Pa2wjrbrj7YiEJhJI4v9SsJaMhWUackjPx3jwar505adD/t
 xPW3XESXf5VhtQpzQX1828gXoRmahr1MPdVDU498wEuigrWZCMYOSw4fxcM+OSfl8D7hPL0YV4m
 5z7II6V3VhqNqhIWN1gMY+YsVwk4V//BqWL0v7osKLE6i7EXn7ThItUUMSvCjh+xV8c/ceFPSTj
 +kXjhE546Tub1IBaPSzUzQ3Hb5dLSxXnr0IDM23+YeWNmpD4O7Evj7/Z7KmXsBMEfbXu+A/k7yi
 4ULJjoZGqyk6UwT4/P2zBcKauTShBg==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c8385 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=_po-8MkxtPHzYxMzuoMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180117

On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> This regulator is used only for the display, which is enabled by the
> bootloader and left on for continuous splash. Mark it as such.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad

