Return-Path: <linux-arm-msm+bounces-115926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YOFcIz4+RmqUMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:32:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D34946F5F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="E+/rs3Mz";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D7mARuup;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D94EB3152242
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E9148BD5A;
	Thu,  2 Jul 2026 10:10:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251AF48BD49
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:10:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987001; cv=none; b=QXTv+TAyQTVRjpaK3ULBmCFOnYKn4qSz7r9NuEpXhfE8xrZOOZl3m3FsgXSlKt3vlMp99IPKN3p7RlAah9xqMhmrdty3WhdtFHBLwYoGM06BWeTUgngBLNqzX1cxoZ01StJbYaxr/hCZslH6cjHWysk7xYufT2+90iiU+jawGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987001; c=relaxed/simple;
	bh=XGpnaKbkzUa2p3KOJeURMXlv+E7yeceJMBpe/i+afX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+ei1k+KdSgHCj825aTvi+iesyW5bGXfYxVoJ+u7qWv7z4DlYxCD3lgdAUPE9pM3k68PZ8bQwCfGSPk85Pjc6MMrRDRzP6wU9AVM9gErwAO92e6010T0cApk1r5HIAJW8DW9C7VUJKAtaUPC5pnp26CxRfC5QzG7K7VxlCtQsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+/rs3Mz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7mARuup; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nQ3J4139540
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SiEZ9xl+02b9shIMVkNO87y8eMfhcAz2ipEbxm25/c=; b=E+/rs3MzCH9NHvNe
	otUuXRD39oCtLyesfeGCpu3HCPXw3Y28nSlRaHiM6rGOQudjEiLTFPL0ENG3rdH4
	XPwEmbJ0F9XSEp932E6ucZ1TSZtOT/8vcEN1h7cLsyoqyC/WcmOf5qoxtjqr3Ad0
	3v4whlrnN2yQxMoK//WwW5Adz00VXGM/A858Ol68BmB8eTjc8T2jJBU/MdlWorBR
	ZiIL11V4mWSQoJntBZuXT9UxSj8+fAWkwe3NSPJPX4YSKLq/aDTEH+fKEtRp300f
	203mi3OKpszN6KntaqFyVzrarScL68CORcl3lCHyN2wuEgsotTLSL+/NIZZ4f3/H
	LuGYpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr82p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:09:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b3141a6so26497615ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986999; x=1783591799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SiEZ9xl+02b9shIMVkNO87y8eMfhcAz2ipEbxm25/c=;
        b=D7mARuupxCNszz44QiNkKuqj5KgeADPVqGEOmRXcq7nIAq8EkZUGW7oA9FVeS7JkIj
         rs/OCEbdEn0eW6WC4mMCLDavdBk9ltoJOEXlZce84mnb+bfZfxFOJx+NVH9pdiKRE2Rt
         /eBY4I+0kynuDQ7aPN2aO6jpFUfe8Lirr4dH0lvr8spoThjbVbjpmdoE4H8T+rV7hlni
         m66cAFKr6eEOj0VcR5OJqiXwYPY9X1JgK6a2XaQwhlteeFFvYdlFU0TRbL4/M9a4j5RV
         wcjNPbe4dutTy1NZR0/1me8ljfmWP85zzZS21FYngnP+Acow7L6V4iVJuC+uTe3SCIM6
         jk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986999; x=1783591799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SiEZ9xl+02b9shIMVkNO87y8eMfhcAz2ipEbxm25/c=;
        b=StD1xux5ulVcOfCoq9H5u3M7fWHyDhDJ/ofC0FL43QXxgw4K++5LB41d/6CMvllQQX
         IhRGr7KdFgHqUsonC9LngTrMjBui0BkiLH9b+PzuvsdcXzFBzFNB0cnvA3vN5/d7mQ7a
         YDqQ7sz3/i+tcDsdJiUZWKMxkLlxudwxcDhEDcw00r/rGRtvuEihkTnYVl6OaNaKMw8W
         UCBO2awEJe3Jbr5y4DE9ol+pQ06YhtbgHpbHcsC30X92cUQB3Ps8XtxND6Ex++m0W5PO
         1xyBcnFRRX3ufqWqvC//MDF9087FrC3MBJvNSo/3zYMww3EfLIXaMH7ykv07mdzeQFQ0
         rAew==
X-Forwarded-Encrypted: i=1; AHgh+RpJCwuDDibiJWiDMwbmZNwKQSDpI+obVqtnSBreOWfHUktDHdqWTcCGaNq967jw4wYtQmq0w+TSnS7jabId@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMiZ0bpNMomsXM3PoCKEae60fOnIBFcWjBYbD0oWpv2STjzoQ
	CZBiEdpgMY2UFhdropRpdgSEd6jqs8EW307BcSQC9Gu36U2vxIRJIwAFL1vTAcSKbIXfBT9s2q8
	8jd9xMsjXDvRfBbLF2IhgmwZR2jIAKE0Nf4gCItUOxDZvlLbIjy/8TX7GO25HMmHHkf40
X-Gm-Gg: AfdE7ckK3NRnhFMoZrB+DzJPu8f+MqvCpdIGz/6O7cXnQCnAKlwbLQsxR3A0jDMT58l
	0pMs67QgIVtp1b71KtQcbzW88cEnlWCAsfiUILVJnvM2/g+fg5bx/EuL1NurHsc+HIHduOSnDfe
	938jfje7GdgkwYzg8V7uDK04AbJMtOkDEyHodawWIzn99TVjUPoGvVfjUs47TRz19iHIvbmy2UJ
	QutlGaUsHXJlK2aDiFRhK5Rfa9PV7mheEfw4MgF+zJImqbbVgp/OG2433FiLeNfQjooyhir6SNj
	mBAM7mWpNNl62+jnRMFxy+frdIWvZ9+txujinW3uDOvfLWvAniROdv68w/LxJSOEICCcxxX6et2
	tfpcVi688Uj4EVMOomk7Re4mD3LJuDdtEOT4lCwmQ
X-Received: by 2002:a17:902:cccf:b0:2ca:329:3da0 with SMTP id d9443c01a7336-2ca7e682ae3mr57362385ad.3.1782986998745;
        Thu, 02 Jul 2026 03:09:58 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2ca:329:3da0 with SMTP id d9443c01a7336-2ca7e682ae3mr57361885ad.3.1782986998206;
        Thu, 02 Jul 2026 03:09:58 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8fc200sm11364315ad.19.2026.07.02.03.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:09:57 -0700 (PDT)
Message-ID: <fbd3c1d6-2142-4268-b88d-898850b0e5fe@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:39:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings
 for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
 <20260530-funky-mackerel-of-current-878e2a@quoll>
 <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
 <mcn4ysrxrfqo36tr7khsxnjase3priskimkgxuacgma7jcpa46@bgla2znqhyfl>
 <9448dfe8-4d9d-4344-be2b-ace371c37975@kernel.org>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <9448dfe8-4d9d-4344-be2b-ace371c37975@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HzN0m3O8VLtaZJrL7mYiO02dLl4E31-Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX1fUSCdUX0ZIk
 geZ9I7938tXNwKkCqCam11NRho7ukd4sQyQiE9KCcnQQ6XZxRMvGd7rOnwRrVUZIuSa/knYof6T
 881JBaERfokxqf7JPx4JxUU7SO0iMtU=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4638f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=opGXe0OTB6Gl6oJtH14A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: HzN0m3O8VLtaZJrL7mYiO02dLl4E31-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX+OGWX4g9VrKr
 +kGSmWsnbUJdUGaHBK3SaHqI/WdK3WFKu/UV79Mg2aJBIHJ7Ux2rh6lQVxD3GXq43fEXXGgiciF
 V6A82PlrGJK+S5cV7UmqeJ+EDzkI2TdEsAd5YcR3hrC26QD1KKcoeNBVwB8D+NpUyxPPm5La7Td
 OtnLmyBNa2K3e+ldt7oIo+lKp1ubTvWNER7V3+acQwP7ji1w76FZwoEeWA99zdSDNv8tqkBK6zf
 SBe7je8Hw+09u2kNGA/iyyN9R6TRr7Li2nRxebkOx+K+KgPjvZByoEV7Ak5Jo1mImwHhzUWEQob
 8B1jw98CnCtj7YjeqMZ0ZZwIozX23KlHbF2Kq4LwSo+dF25EikoWFC3vb8q4OfAKIkKUamz7azf
 P+mzi8EL4OKwHTlOm859ZL8IdMymXUGZ3hMZYZsjD5up0CzWrOcGWJwz7gkiC0Hq7ADou4A4KlA
 35hvfbPnjvjBPMI+LBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D34946F5F26



On 6/1/2026 1:49 PM, Krzysztof Kozlowski wrote:
> On 01/06/2026 09:52, Dmitry Baryshkov wrote:
>> On Mon, Jun 01, 2026 at 12:50:00PM +0530, Yepuri Siddu wrote:
>>>
>>>
>>> On 5/30/2026 6:04 PM, Krzysztof Kozlowski wrote:
>>>> On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
>>>>> Document the YAML binding schema for the Qualcomm QCC2072 UART-based
>>>>> Bluetooth controller.
>>>>
>>>> Where is the rest?
>>>>
> 
> I repeat the question.
> 
> 
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - qcom,qcc2072-bt
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +
>>>>
>>>> Looks heavily incomplete. Devices do not work without power for example.
>>>
>>> The module receives power through the M.2 edge connector and manages its
>>> own power sequencing internally. Unlike bare Qualcomm Bluetooth SoCs, it
>>> requires no external voltage regulators, enable GPIOs, or clock supply
>>> from the host, so no power-related properties are needed in the binding.
>>
>> If this is a purely M.2 device, then it should not be a part of DT.
>>
> 
> Exactly. And even PCI devices need power sequencing, unless this is a
> simple (BT only) device.
> 

QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being 
upstreamed, we will reupdate our existing patches to align with M.2 
power sequencing approach.
This includes aligning the bindings, DT and also BT driver changes.

Thanks,
Siddu

> Best regards,
> Krzysztof


