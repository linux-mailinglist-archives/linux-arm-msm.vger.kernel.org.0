Return-Path: <linux-arm-msm+bounces-112839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +aDBOsV0K2rF9wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 04:53:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE3F676571
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 04:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IjD2lmjN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CojK7K2i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112839-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112839-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E875E303C4FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62DD391855;
	Fri, 12 Jun 2026 02:52:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45337B00E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:52:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781232732; cv=none; b=BYNxBrDSJ5Esdjzjf96WZ7z/Rp0Mc7OVLlURINmNCpJOx12y/djR7V9/2nNY1r4LLI51iS4e03iUi3oLTOvzn226OAKTPn7D76ydCF3O8v/Ty3IZtPtgiW+iF/pGvDsrM8kYnxwawkqF6kBjyEDTvifNu9SVNqDBdM+Z/KC704Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781232732; c=relaxed/simple;
	bh=AZBmiFwEYN8MILgwH+elWqScj1FxDbcgZ4kVT/EpJ/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZevow20BdSGBHCevqoHV76p0Y0snm4JpxUXTidfQqo782qguQrD7o0qcShnrlOAd8pOU//8c0ThL3vbFcVg1a1+dT765E26zTiPEwmQ7Otz1g2Pe75TcQuwWGv/+P4EP24MHj6ycvXPnENmjalcx4WeGKIl+5+Dy13lwsRGvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjD2lmjN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CojK7K2i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVQpi1947763
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcNplGJ1Sabq2Y9bKw3Y1rXhSqvMVBj3TrS26bNA4I4=; b=IjD2lmjNZmmDXdv+
	p4QquYHJ/ZNFRBtM0g9IbixMcmiJdhV00hJe66eVTyBhFhluUynHrHy8WfUIFMID
	KTIQK3k0Rw0ZhddiNBOPmLOAl/Paf9K4VXIr5sisYVhDcj039Yq5zUzf8Dgo3RAD
	ELdEHLfNrXETVaSs3kSzRpWAehVGzY9jpFKOphRyTbh5so8EZrqOZUdt/82CEeQt
	/dfQH2EkWJw4lu4vr8Ozk70I18S3Ggdf0XsQL5R6iqgLIpgaGG+AAlu6CQqeCNh0
	lFBFNIv/z9JxT9G/AuexlRQtn/cMTXaQyS6D61N3IjsKvdCSDkPCvY3G+jcG3pLw
	vox9DA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u41bp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 02:52:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f24dcedso645770b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781232729; x=1781837529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcNplGJ1Sabq2Y9bKw3Y1rXhSqvMVBj3TrS26bNA4I4=;
        b=CojK7K2iEeSffVHfjVbwW07ryySFLGlGKPCP0/Ay1OyOm/SrQrhFq3dXtiCtGkoyRp
         MtB+HLfYVUacQ3bzt+q5aud62i2hkdIMQH22YnQlIhCEtfqVZjVjV2Z+VYDdpgJUKgm7
         gz2BeMxjhQfiC1Un8KHwXc/PCvl8ig8dRx3zqXSMSBaJCcshSXngbey7DNNrYzkRjYV/
         z7+CbvKVMkEPZzKTthV/E09g8TCWOzWrL1BMydQ1YVsfd4VoN7lbHvai9gcfyHsC5RpJ
         c7gsaQR1GDpS2bD433hR2iP8/iQl/QuCt3bxzOi+uz5/zXLXBX+nSAOaCnda41b2IOFN
         oAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781232729; x=1781837529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcNplGJ1Sabq2Y9bKw3Y1rXhSqvMVBj3TrS26bNA4I4=;
        b=OKK7vgD/zfiydBSylJzCmzodt5ZqKpf0Bk9xuuelmORHf+xInu5uE9c+fsCELFT018
         QgRJNm9gsR+6HqU1u5yuGQ4LUyLuIdiQbb1tLhla8oCmmMaoxq6U4j7DOVCUIt11mFQG
         m8iSMthuucQdk0matkDinEtEnBeLTHywqnn2FHH0u9TbFYB0yd5g2mcSwxVkco2gMMEw
         2HjNcOjXJ44v3xyx3gA9Ohuk4+wt6euIPXJ+a9FRQFMqNmK4LHyJ3rFJPibitCXOC+LB
         jQ1CMVygDMZiGKFKkFhYYrz/Dlhgq+ePHqZLX5KpXwmP84SjkpR9U6yLlZOC4gATCZNP
         pRLg==
X-Forwarded-Encrypted: i=1; AFNElJ90dUd3L783Hh7ZEx6La/4euC5G28eaxuoeyHcyU1SqjFiOg1hYLSjfgHr+WHfQDoheIjNqmmBSsSGYQYjU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73FywgFvsAEWnoNOQv2L8VXUARFQpLi6ejp7X1WMwM/DzlQNw
	TCmC62oiRb7spXZm56QzBETRQ9Dj5NcPXzrbXp5JFJ/yVEJYKMUNj7QSCEMiGwcB3+1yrSp/aWS
	3T90ZT7dvsDkRmVY83okZ2mCdUhpprAU0ATjV5nUaHiq6ALMH6kgSAXV4sZDirr3Vy3Kk
X-Gm-Gg: Acq92OFUffgxQl7rqOnXO78c3dAsHMHlNarryfri2mpOtRruN+87oKwK/QKDFJCkXRk
	Y5DF3CvIsJMZ/JdC3GUKiKOtBnNk1DoANfdiUlu4HmoSf4Ogq3VQL0lmrmH45chjM8VBxeGGFvS
	iw7NKwoxgPki3di33IbD3+6mvN2Kv+X2/BLdplv3xU6bOepQB8bEYZOHfQHpNWl+T/RJ+WNQTTf
	lVqHd79Lkng7oobXpTTMTT9ebcTRot9pLceVdU4VTN9euYJF+uWOBP8GEsAESyrdQdTcKlcmrEq
	OZTRjlbyCSEOv1kWUFSOMMWgndRelEsFyLgr6gEByDYO8Of92W2TcT/Y+tWJ52dHH0iLz+FOux1
	zSovUWh4NGC/i5CvLRPHWi0AtRWUvqXHvUK3+1BixOUyhSLRX8f2hxGC+wdytPxo=
X-Received: by 2002:a05:6a00:4c1b:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-8434ce4377dmr875952b3a.22.1781232728597;
        Thu, 11 Jun 2026 19:52:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1b:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-8434ce4377dmr875916b3a.22.1781232728108;
        Thu, 11 Jun 2026 19:52:08 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0226acsm511841b3a.48.2026.06.11.19.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 19:52:07 -0700 (PDT)
Message-ID: <602e893c-d346-486d-86b3-50d0f01990bf@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 08:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
 <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8M36UdGh13sUaN5L15KbHrcqpjXKu3H9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAyNCBTYWx0ZWRfX2T9vtAbHWQ90
 2uDvg3jqW1qLYgKAirB84Rhn3AKWkvM64FH5qsq3iOpWJLnGEftHMQhaYA5mhnksc/LCNL1AQVT
 znpdrIfCuGy/f1yGzP0mDvQqvnIE62Y=
X-Proofpoint-ORIG-GUID: 8M36UdGh13sUaN5L15KbHrcqpjXKu3H9
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b7459 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DXo_hcG_KxK6dTS-Z9kA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAyNCBTYWx0ZWRfX8pdbd9B0HkoE
 SK01cRIoMO7BSfuFvHMlyw2UMCfan8bcbmTk1aKBhgGePwLHYpqNHv8pFxGxKqfO/a7MZdY1Mf8
 wfrGV+PN93zqgzPTAFW0Hqplz0Kns2mti9lzGMfmG7lBy4PyMr9C0CpD1PgoxgRCEkr6HNQi/eD
 K5WxyhfOkjIH+zBFhrFJbrkQp2+SjCla/7sjAUh+kAk0loRmFP8fa6T0hYNio5AhGur8wLcd8WE
 oAAj67wYlgvid3h2e4H5cWt8PbY2dDiXhEE4A+RNfAHAeIulfOmWk0ReGt2xyCuJTLGlOKHvkZ4
 psTdVOI4CDgssxIIUP5N29sS1evk360N+POTnJLhXOaQk4maWvtYx0D7AyXykp60xblACRRHiEw
 voN2CaxCt8DK7McC8zMAMWLhevGYI7rPlvz/7+d8fYk5DGWBya8x9YGlWeayhBGbAa19pLvJfuK
 LRPMG3xGrZq2IoMuF5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112839-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CE3F676571


On 6/12/2026 1:52 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
>>>> The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
>>>> 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
>>>> supply.
>>>>
>>>> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
>>>> refgen regulator supply.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 220 insertions(+)
>>>>
>>>> @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
>>>>    	"vdda-phy", "vdda-pll",
>>>>    };
>>>> +static const char * const ipq9650_qmp_phy_vreg_l[] = {
>>>> +	"refgen",
>>>> +};
>>> Now vdda-phy / vdda-pll supplies?
>> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
>> which supplies fixed voltage to the PHYs. It is enabled upon system power on
>> and no SW intervention is required.
> What is it being powered by? MX? CX?

It is driven by CX.

>> regulator-fixed doesn't take the resource 'reg'. May be should I create
>> another regulator driver which accepts 'reg', something similar to the
>> qcom-refgen-regulator? Please advise.
> If it doesn't require control, there is no need for a separate driver or
> separate supply. For example, the refgen is being references only by
> those devices which require software votes.

Thanks. Then let me respin this series on top of phy-next so that Vinod 
can pick it up.

>
>>>> +
>>>>    static const char * const sm8550_qmp_phy_vreg_l[] = {
>>>>    	"vdda-phy", "vdda-pll", "vdda-qref",
>>>>    };

