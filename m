Return-Path: <linux-arm-msm+bounces-99230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAgNFygywWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:29:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3152F1EAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32E16300443E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C27439A079;
	Mon, 23 Mar 2026 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NS0uq6fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1MHYkAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993D37F8AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268963; cv=none; b=E+zr40oojZVzMDTWCbTXWwf2bdiXAtU0qvwe8koVFXSSfQ0QBRlLBMOPZO1UGsnyp1brs2DaDXtnZqQxtm9fL04EzI/RNyHMMgsa+RvEiALz5IvA0uBbeMLrcviXofCXqvvk+mLNEt3gVTdxp9awz2BsPOBHt1Qc4b3cEMa/CQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268963; c=relaxed/simple;
	bh=V+5nwfuchMq7THgnJ8fbiivWk1WflIC8KpzjAag1ohk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sudAVQnrej7DcukRXQIGc/qEr+FFRCxISQthshI2Rz3difXDE11XUV4OILlmrc3ZSFTSZBiZHiVxct1jcXrtTRkDI/a+EynH+bdxWGktsg1rDLC3ocaQB3yWriqXaSCdRLkvNqtJcSNlvxybCzLUyc9Pyu6PGFSQJJuClLbzVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NS0uq6fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1MHYkAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tWu11627093
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2+VRrig11+i8e90Kq8n9FlHXGOQI0e/YsOltrawFtIM=; b=NS0uq6fkT8mmbEJU
	KAeCbH8tKvFzKqTlYohKnfchVEW1JE5PBT8+hbEIzoVuMA6zOugzSFjKP86iljD3
	4hVl1/UveCEVOi8pqMUqhATmLyUtjoirWKm4cHje8jcgirZ2gunVi2M5ZRMCIsgH
	cxiXNKFow4po32jXGLkrGsql7/9ziCjzQ+6/XsBUKvzgHwbCZmRQ+fYjDjzkjc2m
	Ll50KnmGIcQZpLFwajq4wLjn7TFMrcDSNQYzVcyoZ5DHFXdkW39NZGqgfRc/R7IM
	3uKvo4viRn6E6BonVec4HbGlV+K4UxV50TSggbeGv3hEQ3WSqM7t1v593PZL4EUR
	jilwZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0xd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:29:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfd003bfe2so196168685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268960; x=1774873760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+VRrig11+i8e90Kq8n9FlHXGOQI0e/YsOltrawFtIM=;
        b=f1MHYkAL5VM2ij+10OUTeqmDlggFVLlrB6AdYnmMsFFlyjGM/RMOx1evpv7ZeeAvG/
         zgi93ZgGDrMc4IuYVm8iggef5v6X5gxjDXV3sZ6OPBJeRl8KMU80eg2qL2TG/DaFJgbC
         CK1QNsMXlz1K6xhyySQ3hrfFZHrg5ufrP1hfbJvAmiJ9Z0vh3eI94xBWP3Su20Fc73Wl
         gPM+V711+CCJjFWXXhLH0qQE5tuCIW7Ov44b6m/+WYUCuco/87qxN3lu/7lc22cjTbVf
         bEIhQfdh1Z4IY6UE9klHN4ZnSCMkzhpgJHhI5p2ALXv8rjU3brZvKPAb98Ndm38zA0Nx
         wmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268960; x=1774873760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+VRrig11+i8e90Kq8n9FlHXGOQI0e/YsOltrawFtIM=;
        b=ADrWjmkH281mXfPepJ8UqcqUZkkL81LkDJNCoU0lkJpaWuwLqQMxwt+FM5hXe224Oa
         0gZdmBgy0Ngnc4Rkf+gI9aF6IPOje4Sgl0AzaBCQoiVVVJ7HdJWWTUs1ywRzspyeGIyK
         +vyr7MfEQiDIRM4PjGNTff+0KKSPB04kHpYkgFC4BoTRVtCRE5ibxMw6nzsBkT8HW5Py
         KPM/SqBuK7dGH0RdGy+1AjrKuiaMS3Eb6S6ln28TVaZUoK133WLTdBrnikNqlNLW3eQg
         vDg1Ci+y8YasRaXUbBEJVY7e4PpE686SB+hpgLykl+lEfwcKqdNljUlihjuSaGz5QaZC
         /1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVxeNk5Yl3Af7ULSXO+AQFK4lO9pxw1G00fVgzD2FOcupJvlvQhaP+OZR8oJ61sRr3GZvL7xq8eMrduZkZo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7faU//+7zZZCJT4OtIQbLbnSG+YO9Fj+nRguLDfysMwE57/y1
	xZi6yML0fCV6UAk5HGUAKsNE+dJdvJdiKMmpy865EkjzTYF9cc0H/DMtj0Tygr4Tg9eNCYF08dy
	+KZ/HclufQ22NoGf96YG4xazNDX0nc5Hxho09u9MHj8GLcDLOgeAIamur1QbQ5GcZLeZu
X-Gm-Gg: ATEYQzzqH67Lbaawz1dJPN1j/KYaJDp4/47UN90/f4VMF+Wtbq2uEN7fo/G6cMJNkSX
	oHlJf8P6MJVL3iv2UJvYXzk6Hz1tVpvYxZ3cYueaRiSnocixiFA0lKWOPp9aY7rTn4pVCHBXXGw
	2hUHMVBSs4mfpW+jlakVQFDkdnbkRUMrR3+MaUD2B1VrC/CxczN83tLm87suBAL3sfCXjDJo6m3
	HHEskZowOWQcftQwqADQexuvzn91/Y5kkIpoZOUY/rqHgXBbo0MrrL4sSqfKzCMyuSViD8Ey6QH
	tlNyEsUTx6kSxEdx/l50ydi5ivQSGsqtzIjNSErZ8CFEL+YFOm2TYJdcncrv0X0zq2+pqLr5BY2
	sSEhwDdBjEYMa5zjX/ws2kVxEKL9Z3ooGbunAjMPKPCtgQWSkljHL+/+7mj5KWcq6lsw3I9WvdI
	O1WQM=
X-Received: by 2002:ac8:544:0:b0:50b:5286:f761 with SMTP id d75a77b69052e-50b52870775mr46456231cf.6.1774268960260;
        Mon, 23 Mar 2026 05:29:20 -0700 (PDT)
X-Received: by 2002:ac8:544:0:b0:50b:5286:f761 with SMTP id d75a77b69052e-50b52870775mr46455971cf.6.1774268959650;
        Mon, 23 Mar 2026 05:29:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2390f7csm3607046a12.24.2026.03.23.05.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:29:18 -0700 (PDT)
Message-ID: <7e50100a-514f-4f73-a976-9858ce5cc0e1@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:29:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
 <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
 <95142608-b5b1-43a4-b8b6-38e658275f30@kernel.org>
 <abhgxF1RcAJD-cK9@mai.linaro.org>
 <3922012f-25e6-4b75-9183-f9277ef5d040@oss.qualcomm.com>
 <74f59ef0-ead7-483f-a80e-a3da2f6ebcdb@oss.qualcomm.com>
 <909009ab-53fe-4b20-ad2c-bc8eac9e8bc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <909009ab-53fe-4b20-ad2c-bc8eac9e8bc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13221 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=LsSkit4W3LD1FCZXXk8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KDQFt_rmbBg6bki-nXcHXXnwVc6s0FL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfXx3yF9t5PPxra
 ZpyxsJttCrWeESpMA9NtnbUAzpvc2OQ32Yqof3xLlbEReNfGiA+fo8y3d2Xv3LBhMqv6Tx1yeZx
 xVvRTG93qg55+qksWW0uIKAn9h7aWen4Q9kLeFtrmfhN3PnjXD/FaLJfZvQamI60sZEoFOg524n
 CgMZV7bIj0SI0mwihZUwV1PtvByZkrkRkmBgqP6KYyN2XaslrUhXko+lmOEZ8i3AZLf4zEMyocF
 3tYiwW5Dp3cBeqEbcph1Hlqzcv9BdPxRFhAz+GIf/9Hh7hKma2fmZmjcKA9+70+Y91vlXbkBorF
 ljff+G5lHvEAVujZqAjpvlpWhNpKBaxwZL1PwJAoF3JEpSoy/JiA8FpXpfbH5sfAkIqqg5C+ix9
 qFeASBBBBv8BYsKJjxcLXO0nvaaAWFcW4RnqWlfWA60bdFiVFStE4rzVYNgUioMDVgiq8QuMIjc
 Fmq78EJBJPmcdbXRvJw==
X-Proofpoint-ORIG-GUID: KDQFt_rmbBg6bki-nXcHXXnwVc6s0FL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99230-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E3152F1EAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 10:00 AM, Daniel Lezcano wrote:
> 
> Hi Konrad,
> 
> On 3/19/26 10:51, Konrad Dybcio wrote:
>> On 3/18/26 11:17 AM, Gaurav Kohli wrote:
>>>
>>>
>>> On 3/17/2026 1:27 AM, Daniel Lezcano wrote:
>>>> On Tue, Feb 24, 2026 at 01:17:22PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 24/02/2026 13:09, Gaurav Kohli wrote:
>>>>
>>>> [ ... ]
>>>>
>>>>>>>> As a result, each core requires its own cooling device, which must be
>>>>>>>> linked to its TSENS thermal zone. Because of this, we introduced
>>>>>>>> multiple child nodes—one for each cooling device.
>>>>>>>
>>>>>>> So you have one device with cooling cells=1+2, no?
>>>>>>>
>>>>>>
>>>>>> This will be a bigger framework change which is not supported, i can see
>>>>>
>>>>> I don't think that changing open source frameworks is "not supported". I
>>>>> am pretty sure that changing is not only supported, but actually desired.
>>>>
>>>> Yes, IMO it could make sense. There are the thermal zones with phandle
>>>> to a sensor and a sensor id. We can have the same with a phandle to a
>>>> cooling device and a cooling device id.
>>>>
>>>> (... or several ids because the thermal sensor can also have multiple
>>>> ids ?)
>>>>
>>>> May be an array of names corresponding to the TMD names at the 'id'
>>>> position ?
>>>>
>>>
>>> I am using dt node like below to use with cooling-cells = <3> approach, will post new patches with that.
>>>
>>> cdsp_tmd: cdsp-tmd {
>>>      compatible = "qcom,qmi-cooling-cdsp";
>>>      tmd-names = "cdsp_sw", "cdsp_hw";
>>>      #cooling-cells = <3>;
>>> };
>>>
>>> please let me know, if you are expecting something like this only.
>>
>> My question about the need of a separate node still remains, i.e.
>> why can't this be:
>>
>> remoteproc_cdsp: remoteproc@cafebabe {
>>     compatible = "qcom,foo-cdsp"
>>
>>     ...
>>
>>     tmd-names = "abc", "xyz";
>>     #cooling-cells = <3>;
>> };
>>
>>
>>
>> foo-thermal {
>>     cooling-maps {
>>         map0 {
>>             cooling-device = <&remoteproc_cdsp CDSP_COOLING_XYZ
>>                       THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>         };
>>     };
>> };
>>
>> where you'd presumably call something like qmi_cooling_register(...) from
>> the remoteproc driver, making your added code essentially a library, not a
>> separate platform device
> 
> I'm not sure to get your question. My understanding of the 3 cooling-cells is exactly what you described. The second argument of the cooling-device map is an index corresponding to the id of the TMD. BTW I prefer also the compatible name like 'qcom,foo-cdsp'

My specific suggestion is to _not_ spawn an additional node, since all
of this logic relates to the behavior of the (e.g.) CDSP, which already
has its own node

Konrad

