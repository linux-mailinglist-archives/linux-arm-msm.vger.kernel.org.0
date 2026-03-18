Return-Path: <linux-arm-msm+bounces-98407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ6gA9mAumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A562BA091
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD203019925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E0938CFE0;
	Wed, 18 Mar 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oed10jw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7uzPFlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF5378D98
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830358; cv=none; b=T4bX9v5WTqeocveqXU/P5ZnNbdgD0tjyDZGeIUGwKQpmgdVxt5FbA923+aUNIhY5tJK3vs98q7pU6E3GHheoJiFdklroq9aulysxHPw2bbHveBe5TrqelkKPQCaxWaER6Uubso34wFPv3KLPGlZulR4VFRIUbtEueRgHzOxS45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830358; c=relaxed/simple;
	bh=7YtcbCtK1WPnAAGDtt9ml8BO8NPQBm0crmxCVQBIpyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9miJXL3ccx4FXibO7SqIDCwFINxQNa9ckXr0xlNMmTu0T7WdoHr7x1MEaIjDTSuvCOhGBuRLeAqAIOuH7CD6gMPB3sZc8R2FyGbbrhvze24P0cm69Fnt3XlpzRRvyLj0yQUPPyY4kAIQe0yH7E0KtO4EIgcX2LgOocgwEYOPt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oed10jw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7uzPFlO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Aao91145459
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djX9hXlOZ6IfsE88ywUXjLHf1eDDYfMHYW4uViExYnw=; b=Oed10jw6WnyTzJhw
	IRrAHcWmxR2YeN68cKWcS3XkZjh+RzZ1f3Fz3PLSKeefG05t+Yt7TtEbmgvLqSD8
	1ALg9S+qoEqNURGSZaDWuUcUsVWtiR5gocXQhzQ55Q48UwkT6ieeiknmMFtHYlSr
	iMycPsH59gYYOA4YsUXsYYBQoZizqMRDDFc+bphl3sT3xzJEf5TDlYqgNCZOhkbd
	phaYPYrUbL9p4EWW8vzhfUyyCOHVrcMq4rge8QmXIHXaga6KiLAVaHWVwyhQs0Wm
	WRrnsoHm8mnmReRu1LP7gNH+R0rVxhuRc6cGvRKlqSVbtfpVK7xbOnBYYg9nQpfQ
	vkVT2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uu46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509118781dcso79003271cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830355; x=1774435155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djX9hXlOZ6IfsE88ywUXjLHf1eDDYfMHYW4uViExYnw=;
        b=M7uzPFlOE42B1bs/blfPNGv2Qns1iaEZscA8SojAw4bsXHwveCkHwha5xLM5Ncstej
         BAmYTettUKzgQB9HVQYjXogMC+Eeg8bGpLSKQk/sjMlHscRKB5VnypCQXwO767R/zlOi
         dxnxNHywl2YHAVHrKzHkD1EJcfVyuA/lxDxKhb2acga3RTC8i0mGso7Gj5JxiGTDOZXo
         AjL4T8RVc9cQawKt0b9Hd4pb9u8ixXPfkbT//XBSUVltjcJEnA+survcQL3KG1q5P9ad
         MwejJk3fVLg+H75MR0DJPd2bM0jsk6KF0BFBiQ4OMTH8tQ1VBgLT10W9oIttz2N3yyxd
         ZzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830355; x=1774435155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djX9hXlOZ6IfsE88ywUXjLHf1eDDYfMHYW4uViExYnw=;
        b=BNPzFWL6/FTb9f0bnZIHBinNQT3K57W1K5G2mw27QlcsWqyCMxQyH/jSDiOXnDhqfy
         Fgkdp/cE/e+vv6QAK/0p1SGR3C1tp5xLRQ0tigWEMEqZm5e94HqiTt3lBbUJkyVROdq+
         /BAl32+UQ3POZXPtcMCeMow1XZF2u1g2MelcHLRzrPdJD6oRTRmH/enb/TShR8c+gcQ3
         I/z4glzT3AVpbkVlAjZ5Fx7KMPVlADwx0IBGcAqcOQmrmes3zXLBNHilebd1KJe0hQy7
         GrCl3H/k4QKs2rpZG+Wt2hPmU6ZJgqmBEReePe2pDTuzZoPwQ1UIKg4J3et//ss9aqKr
         kxyA==
X-Forwarded-Encrypted: i=1; AJvYcCVykH0+TVLABKjKbxxwUPc3yThf2Wf7QS9d1VaBRXLrzUa8zunGVs6/UXwzd+ynnDw56VWhSsbbL0SrMhTN@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAzGVAqWQEicqPizArSaK1HPysVN0Rh4dFuFgmC7ey6nhPdNa
	8dNEz//HdwzWQBwXylpaW1qexe0uI4rbPgjXf4tS32hz9+q97B1e1iBIPF3WBkqx4JDdICzIqYT
	TKl3Gk4Uh5sCklJtSZm8G932xhgzX6iY/dJyzsRKwp3ASb1DVH9uU8RrnXdhcUtN4j5Hu
X-Gm-Gg: ATEYQzxIDkC+GWlbc4nvm3WNb2f1u0EB4nEqMqskKTDPT/5DO0iDqAQsI7U5B9/rkDv
	MivuVoIR4tZvqtntMzs0dE8qehB0thP4/9Pa4reFVJJuZstE/J7/gFntVfYYPhYdpHJTY9zSrTM
	xKzR71TD7Ta8SR5OPvzOIJ0jeOCsGX7Q1iYdMalTkMcNt11y3mmiq0sA+SW1t6dTm+ECmuqRmU4
	kxntCn40vDfjwnhM8vBCDw1VRpPQZlfmJpQB0tlqIW00l1qtiR0eSDQbIPqWgGJvOscKMI3yFTK
	7kB+zqsIhJL3XkgPK33MolsucuT4UMfo7YO57ag27Ug+T6lnNrdc3R9pwhET03dC/c/5wqFXqUH
	8Ri0+rxwqrgMTPAoAf4qzZH4eKzHSmZ8on6vt/zdZO8lN/R+ErPyMlharrmzKm5ktjKTncCciSW
	F6gpg=
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr24698321cf.8.1773830355405;
        Wed, 18 Mar 2026 03:39:15 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr24698031cf.8.1773830355002;
        Wed, 18 Mar 2026 03:39:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9805690698sm59748266b.1.2026.03.18.03.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:39:14 -0700 (PDT)
Message-ID: <60a70a6d-7683-475a-89dd-acecac1a0e36@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:39:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
 <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
 <822cc610-7984-4684-99d3-8abd679eb06d@oss.qualcomm.com>
 <jup7h7tyf4efv25mqj2sz4jmztpqbng3jgk4dvz33ec66wj4dr@kgmp5g5pnbon>
 <e874bfce-1cb1-4b81-8d05-557f061904f7@oss.qualcomm.com>
 <6kywpew2ttav7enc6euwbmn4jjx7mx2vpm5v3fjvey4tti5bbs@xhspy47zyto4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6kywpew2ttav7enc6euwbmn4jjx7mx2vpm5v3fjvey4tti5bbs@xhspy47zyto4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba80d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3oHnRM2YjcEhQKEPrrQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: onLJlDQ8ht4L0TmqEn45-3MZ8OaBJqCg
X-Proofpoint-ORIG-GUID: onLJlDQ8ht4L0TmqEn45-3MZ8OaBJqCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX/iFn9cgoEsjf
 cEVw3ha7cE3yJeedrcH1d9u+MUQSN5iFwKh/OHlmYnNYnMTdN9X4wqay31+TGjJtEv24qaay10G
 aHq9iNDu7iXGczNsju5IYTQpXd4lHRERGPt6chZsWfqtL0IMTbgO2VILRsWoZ+/xU0BSeGtusqi
 dIFogDC2KGouD+1yBEMdAXb68GI0jvmyYOyWkX8HyogTFFYVHnfepLqeqAjsBq8r0IaOK/riFNB
 DTJtH/alDZrAzcTRkg5+xbdae8MDZmTbJMJWSPdfl73jOcR3daCUl+vwNsAFqypt0C3i3L/zyde
 PFTAPIm8AK2hqfed4nx+wyXWAZeMt4NT9YBDnmfXWvaEqnU/GrihvJq0tIVOReb5aSXK1wrJQqX
 VFd0ertiwXaUdUvaH4qZBE0v0Elaon+k/JsV5+hWsVVhQkvheRU8obMOxDCJyYZuJUKKPTzlFow
 e0MAHHKQ8C3HwUili/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180089
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
	TAGGED_FROM(0.00)[bounces-98407-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 58A562BA091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 11:38 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 10:33:28AM +0100, Konrad Dybcio wrote:
>> On 3/16/26 3:25 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 16, 2026 at 10:39:09AM +0100, Konrad Dybcio wrote:
>>>> On 3/13/26 3:48 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
>>>>>> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
>>>>>>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>>>>>
>>>>>>> d) Add separate SCM child device (with interconnects) under SoC.
>>>>>>
>>>>>> We'd then have to probe it as an aux device or something, which would
>>>>>> either delay the probing of SCM, or introduce the need to ping-pong for
>>>>>> PAS availability between the API provider and consumer, since some calls
>>>>>> work perfectly fine without the ICC path, while others could really use
>>>>>> it
>>>>>
>>>>> qcom_scm_pas_is_available() ?
>>>>
>>>> This comes back to either having to wait for the interconnect provider
>>>> anyway, or allowing the ICC-enhanced calls to take place before they that
>>>> happens, stripping us of the benefits.
>>>
>>> Yes. However this way only the PAS users will have to wait (i.e.
>>> remoteprocs, venus, IPA, etc.). All the basic providers would be able to
>>> probe.
>>
>> Do you then envision a separate qcom_scm_pil_is_available()?
> 
> Which calls would it guard?

pil/pas/whatever.. auth_and_reset(), probably

Konrad

