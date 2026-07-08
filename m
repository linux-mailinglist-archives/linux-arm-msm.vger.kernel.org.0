Return-Path: <linux-arm-msm+bounces-117595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UB4XArM2TmqKJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:38:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92483725F00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bo5/dN0Z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XDd3dOFK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC45C305A396
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B51433BD3;
	Wed,  8 Jul 2026 11:33:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11ED434E24
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:33:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510432; cv=none; b=CkXHir4W/RZN6ULYJ2CnqSXfjH6OP2916BXfA/qJ7PhUpxA3vwU/v92ChBJC33w7tU4PfkT60c/az3RFOvZx8hXUubG/Z+vWTsomGIa/1tY4ZDCqAtKiwSsalhujjrl1z5eaXIMHLzGm0nJORSbgV8qBINjUSoHG2VJ+O7yIDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510432; c=relaxed/simple;
	bh=WfTaYLxK7jfmMuB95ifFmM7sae4YPR0LI5yVLCdGTYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjzf0xKG6D2HvPxF8j2Y1Mk0/h5SpSDy+9KAOUANW9SHgDo1TbmLV4zJ2vb5+kmTUD8j8Yx1AR/M+plHw3ymHEDnAOgSTaPNirggr+rHolBIv+K+3sKX5PJh66tUNoXjeFdRqYE69ycesmO/jxWZvMnQMhME/IHbkYn9+wBJ1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo5/dN0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDd3dOFK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BT3gc2589535
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=; b=bo5/dN0ZyY/w/D7J
	OQSHL6Uyz1CRNumujBYga63rieFbHsELKU6lJi50N4kLA77WjZZml+OuaKUH5a7E
	VpAT8zS/Km0xeIfsQcKkWR1qw2TYflHlMyvLE6oOTg3mwdd/+KgIkC/Z8he7uF92
	M0zQaN74sBOZE3jZ+rmwrQMXpxlpYZ2JqBY2u7Q2rJi0ZR02e+W92wXI/LDzatSS
	RQCeimijkwl7IFwQXf8r2YlhPFaFvwzBlUpXDgxGZFKBYgM8MeRSrXJuy4kILOcO
	6IMdX7A3mvxcjcPj5ge0a8jDViq1kQXiHfMEvrHNCntgzZNpUMJXPXA2Iapicsyh
	aRPfWQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgtxk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:33:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so843534b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510428; x=1784115228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=;
        b=XDd3dOFKqCmt6hnFUiILL3cUtHHsQrFaLViKam/WZdDgn0r5CjFkQgBo4rC1Y2JrQ1
         6UKjG7r1gDQPIYJLO0UBHzWkQ43uM/Ka4pV6v/i6eD61jAxaSvX+MIRQC4Z/ts+1DFZ0
         9z2Mr+Wru8Dw30Eg2GepYpriDfXIf9NUa9W6ryBPBsrQX/m1xX8tjIim8jSmVBKUcz9+
         yd8BbDExAe/zLExg4+U1LHSelbZJ4Jz2JgXszXnkkbEC6Zl2SKP6TqEqB1v4UyXZa0fl
         yo0PcNn/AwfN3cFpNGqVyB6lMqmuw228Bu6xcTSMo5efg7JOlGka4c9gAjs0LbT3Tafg
         HeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510428; x=1784115228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qtc7rp/gCFBd3NFusQUnJ7/sjXZcIqKr4x9KvvioeHI=;
        b=Jk5vQG0Q1EbcuuldIZaIGSy0+EqtxsF4KpierzFvKsmIYUUmLkHgbnTKFqefe8yxld
         tF58eTZOO86qoVGFMdfCTZXh6Wmj6Ccao7lFKPywY6q2rbirtSAlm+PRpZtYav3Rq34n
         BBBq0FuQSbEAUzFsUta1jF44LwCrijo72xd9cmHymFaWtcC2QU0xO1YUkAPw8h1vK+P0
         rK58vTDNBXXGUODEwdFwg1fOxIEOIXb84TMJiTUThZKRbsGwmkk3C5lMC+4FxPG/eRZs
         SmL2Hsy2jBspeF9oOcLOY8XRjKb3f5vTHbSMsRV2RQDoFZeoGpa/0hJI0NSVAr9yaVq1
         WU+g==
X-Forwarded-Encrypted: i=1; AHgh+RqXz66A/NykpkzXQx7Fouj/4AK4KPnBdDiOFlk1ih3Rx38RCSG6Y+yb7L6RxpT69PouF6EvJM5BpgwqIbGA@vger.kernel.org
X-Gm-Message-State: AOJu0YybB1wSmjYhoX3hdzhGJgTUaOHN/4WnqnbY63babhlSlWT24nRR
	pq0COrJTd8vUdidk9hStHUfu0OsMWnzqnJHHf0lE1d0TyJ6nppJxRazBSZXBf/kg+ZoV95CGb0a
	jGEQatnDMKr8wHq4cX+fd8IgrrO2sVxomTg7r3gG//fSZrjxP+TtwoEvRZRsmJZKZjP4QIHjzIn
	sJ
X-Gm-Gg: AfdE7cmyArM4agNNr3YDzSfwjdXnjZNvDqVfhlQ3ig0wc6Ut2peV6cOsoupeMM0/Axg
	59CN4nAGrr/7HsksXQ1l0tb6dURRH4G1GTiK7e9Tx7vZj8tMVL4YT0P4yPkLGPRL6Yco7cs7zMG
	r6cqZCgJWeU72LhrINVuoeI9OUqLfI2FirQABbwVv7rGWYQJOJ7gI/FKTsqElKhjoDsbKtRH/1P
	HBnIkiZ5sg7Va2SIqTR5DwAvVzXsq2mMRpdStyDjM79X6DVtgftTgd6YghZavxHZpgzmgtDRaWZ
	IcXOfOsmgKLeNsp8XgZO3VonD851kYfXVjLBLWfj4sR/yEhUd2T0WZWwSlADmMWVN3JkFle/8el
	wEyGqTN+NrYa0/4zh4mzoIwCTk9rmmENkEYE3LQ==
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id d2e1a72fcca58-84842fec8e2mr2468152b3a.39.1783510427517;
        Wed, 08 Jul 2026 04:33:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id d2e1a72fcca58-84842fec8e2mr2468117b3a.39.1783510427037;
        Wed, 08 Jul 2026 04:33:47 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm693665b3a.22.2026.07.08.04.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:33:46 -0700 (PDT)
Message-ID: <6b42c4aa-bcee-474a-990f-f1fc2e77ae6c@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:03:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
 <178343111013.2437204.2936966826993460040.robh@kernel.org>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <178343111013.2437204.2936966826993460040.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1PLE_v8i-74tsXfv-Hb57z2dnilSyQ9p
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e359c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 1PLE_v8i-74tsXfv-Hb57z2dnilSyQ9p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfX4GmQOL8H84kF
 2Ad0hVKbUrww/4ans3/i0CAhXq+l9Mvcsj52oFJW4/fbADsUIJTufKKFvpfbJn2RdrhAhwbBOo/
 Dkg0l7QbfSu8yFkchOZlpKzuR67hvos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfXztl67b2UsFlU
 +hwR2qNRWkblBE1djIpj2v3k+sFIoLJG19SEo0K+YRmwp0jVpR3s9opq5GYLkZWf0wvuDpv2tb7
 dF7Z9PFifPKzmq4hyXw5n0ChXvYCH5Xk1C9uZNYNCRTrfAhihJOqrPDg2336qxx/nTaebV8yBSF
 AEzorkVD9A0oE+C3vtf7zpZHDCX7sztXQ8VuNCtettg/qTMc5Qjkoej/czPuUqcZULjel/NkZ60
 byT7QTooR4qLxiJ3f94DlWah7jHAY0Op9pBM6ksEKaKG5C+ox0YYYxcrLrpAlxk7H95zEv7JjOn
 yYHvnvGPCJyJqq98+i6kCsUyDNW0ufoquKT1PmxqLBPw9bEaIc0cQ5sLipbB7VPiWzdaetAJLUw
 RI+koF2VDbwyK//Wbov1NDoq5f+ZiFyFnJX/Hq5OblzPWxJqRhTVXHfuuuaCNa9uLCKeYYNyocq
 bffrm8Rd+I+gBB7odCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117595-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:andersson@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92483725F00



On 7/7/2026 7:01 PM, Rob Herring (Arm) wrote:
> 
> On Fri, 03 Jul 2026 13:00:28 +0530, Ravi Hothi wrote:
>> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
>> Eliza has the same pin mux functions as Milos but uses a different
>> slew rate register layout where the slew rate field is in the same
>> GPIO config register rather than a separate dedicated register. As a
>> result, Eliza only has a single reg entry instead of two.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
>>   .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf: [{'const': 'qcom,milos-lpass-lpi-pinctrl'}, {'const': 'qcom,eliza-lpass-lpi-pinctrl'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
> 	hint: Use 'enum' rather than 'oneOf' + 'const' entries
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

ACK, Will update in next version.

Thanks,
Ravi Hothi

