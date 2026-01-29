Return-Path: <linux-arm-msm+bounces-91171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIlZL2VNe2n9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:07:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47217AFE30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4B72301CFC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB24533D6C7;
	Thu, 29 Jan 2026 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP4RpCwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeBRYQ6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8B38170E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688402; cv=none; b=MG8/EwaxpVl+XInIJvgLA1VVG724+Ec3aXXZNzM9KhVqw5BA1oUDhHtIJE6iSutIG6MOOqueygJ01xBxfg3WIPoNDTzlXILMbLNhUyWH2+FiZ/tgmJCX/WowMsoTt0xrWuHlXg2mzM8cDiE1TBZfrQsAfzm3SvZzQu84R6rXVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688402; c=relaxed/simple;
	bh=8gxlJkk8EHQOdU+Z1KTD3mYTaBbYe2N4DaiyZn2CxzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkQppSosj5KC0qnjfJ7e8U0wqm+Sm24fYrxofHA9IIcIvmgi9uEx6oQPPSZRPIJMMtUI+Chx/yI6JeFWq7mPH7ZPlxPKgGGGVHQNcencqkxkyRaYKNb3EiUFy88GmzUN5L1tLZ5yyHuwNLI6qynfTtyZtwf1zeAMcbjXk6NV8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP4RpCwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeBRYQ6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9vnDf2150367
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3UfQ8q7rHeebtViek1S/wIhzBh39JpfRNMUSJ+Q2EA=; b=hP4RpCwIRyxLkpho
	4L6ZLgqlpmeiytiB4GhqZNbvGKGChZV1GtC3MAjOH5NcrdTEgnzlCxyWMnCbM8zY
	QRcpVhW7dJmXelxe9ztzFOgQjsQjaJpBjjCVK7tjJqghg/mF2t4Z0ixMvCQCVee3
	RsMi+VBVtI2f94UHNBehjcwx2N1MUmAHx9zJCibAU0bVuEa1VVUL/mMdwKp590sg
	2ywqsVSd9G8/fp947fS8PlkG2eVRNQKlaoIDX4Um68bfbSKxaG5hnAZHk/2bNQD/
	P2MCofKu4678C68XQGA+s4Lbb2Q39akpeTz6mb3OmxfIkkzMR+JeVU61rL+8mgsA
	sivAjQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3bb7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:06:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a351686c17so8150725ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769688400; x=1770293200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3UfQ8q7rHeebtViek1S/wIhzBh39JpfRNMUSJ+Q2EA=;
        b=EeBRYQ6ULNsc9Q5sC6iYv99b7ZHJ4DOTXQiRU/ej970Yeugb4ys5XQozB8n9jPk1AF
         ziM8lwVZdG6E6qdb/pgRqnfKifSaSjutE7W05eWh99uN3Mzx2jzc0D1PmoiFhyZJ5lqV
         msRUKE8ARwc635KusYmdkr1N2A2gkjJkC/3VQrvAyzjLNr9lStHCuLvwjTc3dLqA+H9d
         YJDc785WUbO4kHqpHB+mv7L6owa3vCd2GMFMZzt4grex6qftP1WrLgJYgZi6TqxrJqco
         NDE4GO8EKsZLDlE06SIKmtZLBKhGpi1ZVupTnZI9U7h3rjNh1QnC83PWoYWM42y1TdkV
         IyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688400; x=1770293200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3UfQ8q7rHeebtViek1S/wIhzBh39JpfRNMUSJ+Q2EA=;
        b=kN63WyJWtgLoYe1K9Z1M812HXHS5bQuRpJ0MtDNT5vChcYtVa02zgjmd/qtkX3VFP1
         tPhF8JeO3sX6TAyl5Te7gTOkCj9pMZDLinkAq1+s9wiJUCr9nD+ld5ZyFDRX9P5SyqOQ
         A0HSwXGy9k0UnMg+T+zuvO2KTafYP281CZ6cvLFlOTTh5xdzwY962rIl0vwNHm0cAfOS
         /b6NrQXLjn7iLrQaMpXg6ygfZAoY3qhHiiIndRSSkFKWnZtIoHQvF6/gmW2rNE+Aoeql
         GEjakMu3KlA4j1KMRwzLY4fAx1Tr1+g0IGHoGQhC6Cca3Z8Bta+xosOTs/m+VCCwByaQ
         Wm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5a7iMnQETLPoFmKOtRIRboCBWS5JOiyEfduR0K/iNq3+2LOHYB5Gui6KSijZV+ZvyOIypdh4Dh25JdhlV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1I0/GdJafgWw3dlWgvW3a1phy1gXuBh1jAYUELA7PIoiV9C/
	iCwDQalHCsfukWOMBOGwf2Jk2vH8e0QCWmS7VO1Tj+f/YJxQlwrFcXFGwUU4F6Vm+dKMfxKknZn
	4AX0zFzVgiCGcuSOCq6Rl7d8U7lSQtMCRgIfmfmtRh9DN2lZz6PuO0VkORhZtY0GT2H4k
X-Gm-Gg: AZuq6aK0EPwmVwupa+oNOl2vdpc836CurIFrWfNCminJ/a2SmWaMRTKA9wAVMtsIEs1
	MC+OR+jEOyVMdwNjizzfphTHZC/ivNa7Pe9zu2i1SPqwMGBl3/YOsM4poA/Z5VTSO3R1TGWKtrB
	fTU7lY+ifNlixvtWoh2RNmCZfB84zUDmWy0+gd8xyKxT82gQGhLlT/B3svNhC61PXh//dm5FvE2
	eQkc/GfhtfWYz+sZq4R48DXkSdvMsyjDTjnOagD8K+Bm/1giqJu8xx7CwU+aER/iCdktCXXcrtr
	csMcp3zsbQi6urUV7sV+rRR3j+wv5r+bnoYxyMvu/Rk2aNI0WAmCnfh+zxqb+ybSDqaeIQazwta
	oLw99zDCV97r7cIsea6xB4IgDCewEyQ/r3NEyFUnZ
X-Received: by 2002:a17:903:2411:b0:2a7:cb46:7075 with SMTP id d9443c01a7336-2a870e30bfemr89072065ad.53.1769688399754;
        Thu, 29 Jan 2026 04:06:39 -0800 (PST)
X-Received: by 2002:a17:903:2411:b0:2a7:cb46:7075 with SMTP id d9443c01a7336-2a870e30bfemr89071685ad.53.1769688399192;
        Thu, 29 Jan 2026 04:06:39 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd74e9bbsm23193775ad.95.2026.01.29.04.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:06:38 -0800 (PST)
Message-ID: <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 17:36:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260128-whispering-caracal-of-respect-a26638@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b4d50 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=gmo51-8M2HEWv_ieLR8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: AqhfhyVk_sjhoeG_TkKKOobdWbFiot8J
X-Proofpoint-GUID: AqhfhyVk_sjhoeG_TkKKOobdWbFiot8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MSBTYWx0ZWRfX4SHalseFXsIi
 dmCDMeoTyi+t52F0f1IfJGjsEjKPV5kSDmq/jbL+XY1SV8RYS7R4XVptqoEbsO9BsV8961pq7AX
 Kg51X0qP6QkMTIHCad9CHwf10cPjSQpqm0v5Qbv55uyaVVOHuMy7SzPB11/46njOMHZMC/derHq
 z4EhqLVbUouyPQRqV8tag64XmC51c4XLAqz4tyPj96UPpIHjoBnkywWHd5EnEfrT+pFVOXfAfv8
 GRKuJ94lv//8YptU9ROg0EnghtsoVqxDApI35Gv6PtVbZ/dpbXe0xcyEVX5SW176JxIRSA6el6H
 lfJio7lAnaqEZmWKd/MXIp/jm0JQxygYakkaQ/KpxV3qCvNVJftJBd1n9sDcq0IIP3+DZCmtPwn
 OXATBJnbxLFmVcL9TJylc3llSXKFeyeWO1K40PNZVNnyKwNDPBeCLsGlc1ppv4HhWm8VfStrSwa
 TKTTT1IDT3ReKVLOodA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91171-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47217AFE30
X-Rspamd-Action: no action


On 1/28/2026 4:57 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 27, 2026 at 09:27:16PM +0530, Gaurav Kohli wrote:
>> The cooling subnode of a remoteproc represents a client of the Thermal
>> Mitigation Device QMI service running on it. Each subnode of the cooling
>> node represents a single control exposed by the service.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
>>   .../bindings/thermal/qcom,qmi-cooling.yaml    | 72 +++++++++++++++++++
>>   2 files changed, 78 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 68c17bf18987..6a736161d5ae 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -80,6 +80,12 @@ properties:
>>         and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  cooling:
>> +    $ref: /schemas/thermal/qcom,qmi-cooling.yaml#
>> +    description:
>> +      Cooling subnode which represents the cooling devices exposed by the Modem.
> I do not see the reason why you need 3 (!!!) children here. Everything
> should be folded here.


Thanks Krzysztof for review.

Each subsystem may support multiple thermal mitigation devices through 
remote TMD service.

Because of this multiplicity, introduced separate binding file.

>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - clocks
>>     - clock-names
>> diff --git a/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml b/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
>> new file mode 100644
>> index 000000000000..0dd3bd84c176
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/thermal/qcom,qmi-cooling.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QMI based thermal mitigation (TMD) cooling devices
>> +
>> +maintainers:
>> +  - Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm QMI-based TMD cooling devices are used to mitigate thermal conditions
>> +  across multiple remote subsystems. These devices operate based on junction
>> +  temperature sensors (TSENS) associated with thermal zones for each subsystem.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qmi-cooling-cdsp
>> +      - qcom,qmi-cooling-cdsp1
> What are the differences between them?


Some SOcs support multiple CDSP/NSP instances. Each instance requires 
it's own

compatible string to distinguish.


> Why these are not SoC specific?


They are not soc specific because the qmi thermal mitigation interface 
exposed by CDSP is architecturally

identical across multiple SOCS.


>> +
>> +patternProperties:
>> +  "cdsp-tmd[0-9]*$":
>> +    type: object
> No, you do not need childnode. See writing bindings (covers exactly this
> case).


Each subsystem may support multiple thermal mitigation devices through 
remote TMD service. So

need childnode to distinguish for different mitigations.

>
>> +
>> +    description:
>> +      Each subnode which represents qmi communication to CDSP.
>> +
>> +    properties:
>> +      label:
>> +        maxItems: 1
>> +
>> +      "#cooling-cells":
>> +        $ref: /schemas/thermal/thermal-cooling-devices.yaml#/properties/#cooling-cells
>> +
>> +    required:
>> +      - label
>> +      - "#cooling-cells"
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    remoteproc-cdsp {
>> +        cooling {
>> +            compatible = "qcom,qmi-cooling-cdsp";
>> +
>> +            cdsp_tmd0: cdsp-tmd0 {
>> +              label = "cdsp_sw";
>> +              #cooling-cells = <2>;
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    remoteproc-cdsp1 {
> No, don't create unnecessary examples. Please read some slides from
> earlier talks so you won't need 10 iterations.


Sure, will update this.


> Best regards,
> Krzysztof
>

