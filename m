Return-Path: <linux-arm-msm+bounces-91275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJHuIRyMfGnvNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:46:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27503B97D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FCA3300612D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A0C36AB78;
	Fri, 30 Jan 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Es+HWqlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRY8vSr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C882E54CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770007; cv=none; b=HKwodYb6jLaB0ldY2nCQeTwRD4kQ9m9rPaKOWJZuHtiqpX9VdSPhirqPVFPhCofOuz9MzB/kNkdtjH5nj1qhoQDLQbT2VH7fjloShVSiPRoUcnLsgjTQokhzD6xGqgIRW5vQLdDsjvjyd4lzCmd/m7ogR6j9/2torujku7wbsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770007; c=relaxed/simple;
	bh=41DxCDI9BLFfSiB8T28LzqLjk8IPwF3a9dLgM4flHpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ug96vlopA5AVO2KI23PoBaMhBC350aw8yLtsMC5CT1C71F4DwEIT2imKLYR47g4WejFBaT0iPc17IeYv0JRqXsQ690WNzHgFhkhBar/xDuwy5Esp2Gu+Y5UbdnoHCY15xWkO9xCKG0U50Ahn3qhDBHCzGMLUyIwP3uyT/CYP7hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Es+HWqlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRY8vSr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7GRw42413672
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZsEGCm6nNqyjRWqQjZl0F8JQuVVl2PSAjQwQvNXoBI=; b=Es+HWqlm+VyDDgxj
	o2eD0d5F94Bev3NsX1ujj3HTp09Bp14zOFDc72zC5aP0QrvmBkVCVnWX+5Tmv7IA
	dZEUNIT8CS9C5mBUDQXy3bluifOlCf9iremn2J4eYplhVPdr4UcrslUePfphl+yM
	OLQfTD3rJV2dAtDGi1NCHXIz+M0mn/3dUzmJ7eEGgcxnUpUiypGeHTDKg/idbceD
	Z20yAqbb8J4+ZF5Dt3R/odEbmj0yC66C8oatnjJd6nGgF4D9daEUXnDSNmciPRoD
	BPhvl1V/vY0mauJI1b5SqDdj3qhwQ/FfAyFwNiYyonKEuYlHxTUWDlS/ymDWUVpO
	XF7NVQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41gmgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:46:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88fd7ddba3fso1914536d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770004; x=1770374804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZsEGCm6nNqyjRWqQjZl0F8JQuVVl2PSAjQwQvNXoBI=;
        b=SRY8vSr3KHXgOQLiEqHMBedsCDpbSsF05/m3yovDRTeT+5J0+gA/+UTCS10ugxmRCA
         QKAM9MGlA+fBVMVVgQH7GPvwo4rO3DkmUaXhk1HbAPD1xt+CBE0O6IoqXMBlVCMEKRbg
         uueU9pTg35UCnk91fyRmJuSEQV6ld/J8JwegHxUxQc4YILicBkv9b3zo953xmHXriWSS
         qK7r0WfNf9nDr08SD1Ch+J1crvjlTAvAvAFELfQk4nH3veVXJ5Q0LKUzD3ur8xr8dj5N
         pzTvHZeDHhg7r4cu+vFVDjISqIlBM9X9WLOJNB+ZTQJAdvmPo6cd2Ccl5HL7HVuSAOVW
         001w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770004; x=1770374804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZsEGCm6nNqyjRWqQjZl0F8JQuVVl2PSAjQwQvNXoBI=;
        b=UhbA4Qj7yrOdOLCTSqxZZnFIHtBVQb8ZwMoSth9XHnzt7BrVXQ0wHJ0e6m0yzMSkle
         EfhJtgmzucO30eY9LbxP8Cl0XpnhRueZttPo7Q1xrXA/bKDh+E6npwUaDeoJ9Who3QTn
         GVRhbHy2RUCysoh6Xi28cRrtn5Abv0yDtOpNNt/CmwV2UtFbnqtvqT5qPDatm0FAbdm/
         BpbVIwQZGQhoPyfA+ISUrJxWPGiPsgvrmQ8kiZA0jac+dFZqlWL/5AFBkL0ajs2tOdyC
         Wvd+bAd2UIDO3BghaFiIYgQ6WdTpbFilm2vrZeImu1R1K8eOUwrlf5f2ZfmQLYdZyFwk
         arFg==
X-Forwarded-Encrypted: i=1; AJvYcCXDDqIzNZYTc44qkMAoJo/QCbkSYiCtDTRPKa0lpYck6+qE7Fi67A3t4yFpJtaqa966Slv7jckpymeCKJOc@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGFnVrRgYnAFJ/foclAB9VbZQ5BmLpLK71zChDdmkcpyB9e8D
	DErWRjG3fScAV4Qfgz2MSLn0WzmArkG1Qh3ublieFi9oPyaLc1lprgXTzLCLkhBXLjOD0wQMcjJ
	5+DR9agoUo5IWYlusdIQs7//3KbvdaQNAaASUfOD6NSELnGd2uyYnkLVwguK7wNPcdyl1
X-Gm-Gg: AZuq6aKZ1EFgMYp/KoXsf58uph5Mw11uIXRNi0NQBJQGIiemdSDgvgy6KZvZk8tJrt2
	HvgTTyORE23nHHxXLbqnOLhAi4oylq0wMZ2zY8TJA2zSn4WtMZ6Nmfokqmv0YTUh6MaxKq+d09D
	QpiKUMaVZWNLZmvqP/ZtlkQlae/QzRlYWQr4SIeaFhlEID5uJYOurjEJJZID5RB6MnIoVnBNAG2
	0yUjZTn245mrno8O6LHM3jLJsAhvcfF7aY7aOQXJ1PYadI7wtJi5Qi3iA90G+JGBwPZ7qkwEi1f
	ADMb9X05+VXxKzgic0/pJ4ifsT2gCsDGBcqkF+gbaj3OyXDmY+Rcslnyi179MRmRXTm2nrMR79l
	318YdRmKTJT+ZK9n3CO8ki4BD1pftGrhJpOts86G1BV3qdLW1TJDQSmr7GMXxx/mIhuQ=
X-Received: by 2002:a05:620a:31a4:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c9eb257d0amr251629185a.3.1769770004472;
        Fri, 30 Jan 2026 02:46:44 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c9eb257d0amr251627685a.3.1769770004057;
        Fri, 30 Jan 2026 02:46:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc6685sm396249166b.17.2026.01.30.02.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:46:43 -0800 (PST)
Message-ID: <646bee0a-8b10-4fa8-9d17-030876179c02@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:46:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <7da1727a-c1cd-466d-88fc-e140b2e7fe5d@kernel.org>
 <54bf72b6-6397-4655-9c30-680b1374400b@kernel.org>
 <82a6ba61-94a4-48bc-a012-d09152b32781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82a6ba61-94a4-48bc-a012-d09152b32781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eD92jBfdX8q0ddTQ17O_fiq5RbbP6ivS
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697c8c15 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CfqEwSn5MTdR7akHWEwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: eD92jBfdX8q0ddTQ17O_fiq5RbbP6ivS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX5n47P5VDA2G2
 iMw6HIFDJh7THlWQAEoSUIFf56pnY14J9TtgaYUSEDTL6xcLZBbAp1ABkdraz0AgtLID6tvgQTo
 EynweAAVFo8/rjh3OC0Gb9SW6oLI/wWKEI/X2MhITE5/x+8psBrkAUGhoPEa0EHp79NswCG1jQN
 64xof4Btj4E4SiZBeckvjM47boHJltVoqykyYJJgupZweXN6CxNF99c74Wqur4T7VXrvee/7Fyk
 mzymkkU33dNhVVEdyPrGJT0J+1GiWmceieW89p2wkgju1eyUzrYRR2if84KHAPOrfIpLqkaMzW9
 VGD0OOabF+yxi06AP9G+FLUqn6dhJ7dg9e3yjRnKzqkGGXUEF++DdI61VJgpElMW0vg91nbHRh3
 A/0NDlzGb5Y6KP1reEqEdHDwPSMbeVwRJWmrJ3H1fFCBfeQrnSOhnvgHLBeqx3wH/8K5nr5CFcF
 ABePKw1nlVzTxBL3FaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91275-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27503B97D3
X-Rspamd-Action: no action

On 1/23/26 12:12 PM, Harshal Dev wrote:
> Hi Krzysztof,
> 
> On 1/23/2026 4:27 PM, Krzysztof Kozlowski wrote:
>> On 23/01/2026 09:58, Krzysztof Kozlowski wrote:
>>>>  
>>>>  	return 0;
>>>> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>>  	if (IS_ERR(engine->core_clk))
>>>>  		return ERR_CAST(engine->core_clk);
>>>>  
>>>> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
>>>> +	if (IS_ERR(engine->iface_clk))
>>>> +		return ERR_CAST(engine->iface_clk);
>>>
>>> And here actual breakage of ALL in-tree and out-of-tree DTS.
>>>
>>> NAK.
>>>
>>> Please read internal guideline.
>>
>> Internal docs are pretty scattered and messy so I failed to find this
>> there, which is surprising because this was frequent feedback. Therefore
>> please update Kernel Upstreaming internal page with following:
>>
>> With few exceptions, it is not allowed to break the ABI, by making
>> bindings or driver changes, where the existing or out of tree DTS would
>> fail to boot. Updating in-tree DTS does not matter here, because DTS
>> goes via different branch, thus driver branch would be always broken.
>> This is explicitly documented in DT rules and explained also in
>> maintainer-soc profile.
>>
>> You need to either provide strong justification for ABI break or make
>> the changes backwards compatible.

If the ICE can not be powered on alone without this change (i.e. no UFS,
just ICE), then please spell it out explicitly, Harshal. That makes for a
valid reason to break the ABI.

Plus the fact that without an OPP table, the voltage requirements cannot
be guaranteed to be met

> 
> Ack and understood. Let me write this in a way that makes it backward
> compatible by using devm_clk_get_optional_enabled(). Like I explained, for
> Linux distros where CONFIG_SCSI_UFS_QCOM is override set to 'y'. This
> clock vote isn't really needed during probe.

This is really a side-effect that we shouldn't be depending on, or
even considering as a backup, since the UFS driver may change
independently and stop behaving this way one day

> In qcom_ice_suspend/resume(). I'll only prepare/un-prepare this clock
> if it was found during probe.

Clock APIs generally happily eat nullptrs

Konrad

