Return-Path: <linux-arm-msm+bounces-89836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC5BOfthcGkVXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 06:19:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E18C516E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 06:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 227558C593A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 13:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5166F22759C;
	Tue, 20 Jan 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOC3m1f2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyFqQsUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FD219A79
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915111; cv=none; b=I1jGTft5/pjE/YTHqx9sK4YWy0GwMPZsKHhH6nK/4oCLUjwAoB5Oua+/qGIJ+mU9oCE8M17YEMgW/ddFpLDECciTHAdi5TA9bRDv7xiBGx1NcvAqGM1SSCue9hzDEFQN0+McdVvphoF4IR7PubadxiCl+/PFeE9oviePV2va8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915111; c=relaxed/simple;
	bh=wVx0ewCEj0eGt3gTjSXza66ZpDVawBTHYhsNkFd5hfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UP+BR7OIuVqguNonqSpO5/KpHderfkKtiOOKbd0yoEFm5LapoiR7L4q3snJzEp1Xw7M9WDk2WdGBjZoAeqsfXgxfOZEQ4rqPqw3L0L8hEFcIoUsW1+hLzmhU4zm3QDIgNhYgYs7aoVnzRcxhu4s3HrflSH3fyn4k1MdRpx2PDmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOC3m1f2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyFqQsUN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K99tnY3256451
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SldAAXYyWL4PsEQXU1+h4WL4rjsnsAilMTgilthX8fs=; b=nOC3m1f2KxH4Vegn
	Dk77+Uz+uHp2Qudke3ybOyykc8ZkbvqSBeucu+o+3/jH2vGY2AIMqJ+hJynClh5B
	YKDSfInbSDjV/2UsiAjBD4G67/WKCY7tAcIJCV+i5b5BImZqWL2AYNd/YOw9ACQX
	BGEEhaL1L6yuDIFsjaE+BaitftTbk5wiNrUWziELmyp2VlK+NPUxUi0VV/DnNjuD
	3F56DJB0H06mEwZ3bb4m6a9VnbmdU6gVCULPf5EyEpq4+J4b2mBxwh+aK7JPw49+
	g1LzaaCt7MAn8M2slakSEB2lUVyELH1MW5gMHG113/kPR1MJM/sOskrDl8dnPFD1
	CNUnpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7rp5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:18:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so118460985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768915107; x=1769519907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SldAAXYyWL4PsEQXU1+h4WL4rjsnsAilMTgilthX8fs=;
        b=AyFqQsUN/ftR1Cv6tp1VkvsLI+ykske5pI77WGQFcWyGOfFWLITre9Tt4kSzpBk5OP
         AQZWwfrksiJFJAIXdoP/5lm0CcLEjNIqyTqGanF0GWB6aQRk6csyD5potkhvjwpO1nas
         d5MEJ/1pFsTnfcA4qTEkCkPMBXpfC9rieGVFhFZsJEVeTO0rizIZablDHn6s5SrSQ9B1
         aHjzIicgKoLANmyQZ53Lu1vu69OBiZ9NYj+pDzHCCeBsYu03wlNCZ1+SLwKwA8A9KEGy
         i6MB4PZ6rCoGYCxI8Y7Lr7j4gEgLqjRtQIA/r8/oRxTsO/z6UN/nQFWtv0LqpjPvvZFh
         R2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768915107; x=1769519907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SldAAXYyWL4PsEQXU1+h4WL4rjsnsAilMTgilthX8fs=;
        b=UrZtfjq10ourcCPDibCZ/tJAdVewSSfepPU0WwBsq08ZEpsu3lPkgpn9oaRGusCIr5
         ioW0GUDsYRc4LycUYWRDBTFrzn/UGKhvFtGKbpfpvqTTd3ytUWiDV+wSBtuX6YVKRIH6
         DNffQxejTdV5pi2c0ZSY0D7wwvpUIVD2qOGI/fNQueix7epe3pc1MFZ/OsBbSbrSCJAA
         91EHehBUBkjT8xQlSX5icGSO6UoRfz5tvvN5njmkbhlyMjekyriWHD61N2xNnGnBhMZy
         OUwCuM15nLq42OuPbbC8Ahhs0t46ZQbEJNiHZbXIIpSH6uHct3wVYSOWCcP8Lnc65ar3
         JCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBVB6kBTlsrYEqqBGymCQh/RYEyAYz7A41jDuJL9X9pA0k3cn6vOtoiUHEnPuXYqDbVMqBdVd/BOdtcARE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzzp/fAzK9rP8MH67+6FdUftxgkSYTR1Naa+cmMs9f+vdmpdvM
	4vP60wKEbhg6Ny+ENCsPsLhEH9ziChnKEzrUf9gP/455bFPCHvSgKdpEDjSVoMoET4iVwq2gE3D
	vWfSeWAvgtkvGt9Dr1BPdNPlaK3TwqvpSynPVMW4lRECT7EFM6nas2nsD50y2c7QaKFl9
X-Gm-Gg: AY/fxX5oLCLSDJ7YzqFu/szrf/RYONNDkwpMnO4onRPCY2tGY0/qjZmkC7R9UfHK1oB
	u6zu7UVvgVNYdlBZtc2VGZGRhaZyKxQIW824eRhtPI/ZRE1ZQ3SOzdwve7DKXk84EejGu+qjNz3
	6Kcvq9JTZOHNxCCFk4H81YVLffzQrur/LFxJ/QJjjwowptGCz2MJS3ZGqrfeVI6SO8jeS+PIvKR
	81X2Ze4eH+vfnsys+aT6d/Ov0dO512cyt0Ty131ZibeEVu8eh0ZahvNZgR2tIKJVFYtEZRONvK/
	wMjMzQqEfL5vExK0vKCq40AYTxku+b4f1WpKx7dXxPcSDV8M4WOtHpQQxEjQPrqjugMy3/8J1SF
	7biVhbtQEPGDkVtFlpGh0hcPuEls9jsd6GAXHXB4MwamXvYoO0QBS3y4msVTKM+YUCTs=
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr1491842685a.9.1768915107350;
        Tue, 20 Jan 2026 05:18:27 -0800 (PST)
X-Received: by 2002:a05:620a:298f:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c6a67b1298mr1491837585a.9.1768915106861;
        Tue, 20 Jan 2026 05:18:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9763sm1330649066b.35.2026.01.20.05.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 05:18:25 -0800 (PST)
Message-ID: <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 14:18:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=696f80a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=ezRqCCqFh2AFBysmAOIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExMCBTYWx0ZWRfXxklhk9kRkUnr
 O1DIrAfl5AcCtSVd9OHf8XTBjA0HjEDmwvVbZBzhhmSTauw2NKIF44WT1X0Y/4pu5Q6tAKLxlz3
 7VxMZ8mR3L07ptaGm93CdDk6Lcnz5/DMXf7w4hb9mkrw9hkA/VyS3+/r86zeDPCRBgDuSv4gWQV
 G6jrkm/oD3V41hhN46K/3jlA3OE74WBxwukdN5B/vmy7kd7xQx+359u1oIxNy0GLv/AQto5j39W
 Z1Yk+2nM1bMwhGQVFzVp0zemnnWByADy2nF7HV1+vUrxOLr7RAXBFK3XdfYcAlOnpqf6Gc7CPno
 fKQWgdmIMHgzEUB/8p5ibnZxmN0sC8pHfLYgdetr/wvW+JgD8wiAJU9LYjPrLsq673a+xV+BJla
 Oe6u4GBZzxyHigKvH7VPln8/S/+lI2Cphn6DMZYT6qs+9Wo6ivB4DozOrOByPzo1JWyoE9TdfhY
 NmpEiQ8BO75L3yAh4AQ==
X-Proofpoint-ORIG-GUID: dfEDDPnP8uSWW7n8ji4y1T2Wf8ZRHT6g
X-Proofpoint-GUID: dfEDDPnP8uSWW7n8ji4y1T2Wf8ZRHT6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200110
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89836-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fairphone.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E18C516E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
>> Add Milos compatible for the CAMSS CCI interfaces.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aec..c57d81258fba 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -27,6 +27,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,kaanapali-cci
>> +              - qcom,milos-cci
>>                - qcom,qcm2290-cci
>>                - qcom,sa8775p-cci
>>                - qcom,sc7280-cci
>> @@ -263,6 +264,23 @@ allOf:
>>              - const: cpas_ahb
>>              - const: cci
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,milos-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: soc_ahb
>> +            - const: cpas_ahb
>> +            - const: cci
> 
> Same comments as other discussion these days - I guess that soc_ahb
> serves the same purpose as camnoc_axi, so this is just last entri in the
> if:then: blocks.
> 
> I really find this binding terrible - around six names for AHB - so I do
> not want another combination...

I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK clock ("cci"
here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).

The CAMSS TOP doc (for Milos specifically, but I would assume there's a
pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_AHB_CLK
and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains most of
the programmable IPs on there (notably not the CSIPHYs, at least not on this
platform)

It further mentions that GCC_SOC_AHB_CLK is required for *any* register
access within CAMSS. Perhaps it sits right in front of the xNoC-to-CAMNoC
interface.

This only enforces my imagination of CAMSS being a fully contained "bus"
(perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus)..

+Dmitry, myself and a number of our colleagues were deliberating how to
best represent the hardware going forward and I think we at some point waved
the idea of putting every camera subdevice under a "camss: bus@ {}"-type node,
which would hold the reference to the TITAN_TOP_GDSC. This seems fitting for
housing the SOC_AHB clock as well and therefore concluding this discussion.

Konrad

