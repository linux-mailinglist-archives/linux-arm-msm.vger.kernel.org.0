Return-Path: <linux-arm-msm+bounces-98368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON02J2l1ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:50:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A655C2B9686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF668302C162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21743ACEEA;
	Wed, 18 Mar 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJjmYcQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBDcnoD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB63ACA7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826418; cv=none; b=azPrdtiJ/9f0VrJGdIt5Lez6XOCzZIyTsqUCcfsKKl99GnicaEc+g9FYjFR40tEO0qPWehOVuFB+tenxTx0XDikdTi0q4w1N2LENHZ77tibyEG/C4a4QLwuvs7u2Kl0Tv6uqQfgNcVHrskcKUVGPSKQPAO+QI6Ml0HtaoD782Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826418; c=relaxed/simple;
	bh=WPCI/wee1mbpN0qx3vZmfciuSoM+l9KD0jMQsntUFIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+WR+ViK7g2Cjlg6HlRFKBAnewJDHkcrfp2uF03oVsd5Nfr9mnKC4HuOk5NjvdcgQ0u2tFlNxB14yVlhQqdm378qrqKM6ZHs6Hco7Cw8LtTu7EyYtksNyuh0yLDMiSY/Dgz1qwLwHx+ntVZBEcp4fRLohcS7YhmuKKpu74csVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJjmYcQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBDcnoD8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Mv2D3358523
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e67uLUmjQcDVmQDogvW47Kfwdak2mVG2zSXx6AMwD7c=; b=kJjmYcQuDfEv47Z6
	8EbBqc3N2u3jIUFPGtGrJWCINrJvpX6RKESzM9qYgbxAfzNHz1w0xM6GbKZLH4M9
	35QciF5U2BWbPLyb0RJXo2HQf00PVmS5DiJZn1wnM6rp2RQEgJ9r8nEPHc5352Cx
	a2cwmVaQOEW04q3B8snLMa2N/NwOTwVS3kGu4CxTaevVPsO2tMrJtx/59ERhAqQm
	hYqitRzIZFUDNyg9hqQ5swXoqRXY3y0Fv6TPksP7D0Vam739OolN6S0Izz0Ktlac
	j/gXsHO1wi8lw/lf330SJiGfYbkv5GvpF0BRNKzLD462UUgGQUByuQZW17aj7dqu
	TmmSDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb018c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:33:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c4f6c45a7so18283706d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773826411; x=1774431211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e67uLUmjQcDVmQDogvW47Kfwdak2mVG2zSXx6AMwD7c=;
        b=bBDcnoD8lOx8A+PJLhB9VOtGDDdt64c+xCnmZWOJhBwNiO/s1wpgmmHE2zVHmJRgYI
         FoU4HjsPB67614pWcAllwp4lLqtEfo1MqyOSgTcg0H2ULxUMM4sdCoVBEu+hOaNv9ka7
         KIMulvi9oX91TF1yc05+Woqb0wsGXPIxUhXYsM+rYQKsljxSZuvEFYlAjxphG2t8m8gb
         0mWigCIpr1yjyNS0rCLgLjytY3iAj2n1mFjx74zwogukY2LguTi02+GZ6/KEu5Bse+0o
         ek6gaDSCvI3+P3aj6/WT/FW6wU53c8Pj85adNZGJs/C53TtKhozcO6aPk/paKl0Q9wlO
         Ezsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826411; x=1774431211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e67uLUmjQcDVmQDogvW47Kfwdak2mVG2zSXx6AMwD7c=;
        b=bxzEJaYOUvJniTxLIGx4ETbcLDHcwSVM0p7A46R48ZhTKG3NkPW/vbxzWku/4/iXeR
         NqKOYKuTfOwz0G9N9Llliwq3tX/sHGkMP0Dy3g31kRYxSHFHXAWgNwe1Mh1tujS7+68V
         o0gFcZ9LK5n7s2Ht+lpYDXJa5g3ipKt/Gcb83jXL8xqtWav21zea5KPiEl6Gizg1Oelk
         FiJ4afZz1ivsvAUC1OY1FavT5EtVp/59YVZ/vWQrKeL+0lRlcMPc7xU2pC5O1ImcZmp6
         jtiK81RBTI38AsrchjFgb9si1q91pQRiA/nP6BKN9dz+XzVTO4H3TLJCvJmFBApuQAQE
         QB6A==
X-Forwarded-Encrypted: i=1; AJvYcCUCeDvbJw2/O3PWI37t2ESUoO+V/qZsi7Cv44ortGRp/FMJjWSybcJ5SgibsKPWgURKAxBeoRnHIxH+GYnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZaPeSX6uP4yl29fuqj5AybzcTldumy+MgAft/THXvN8mMbLW9
	HOa/MhImQ6pyWkj2d1WziLa7sfRDTUYsdMlS7mEXbuxVVSuIj9oYtSoh88EbCex7PUZ195OHgVJ
	59Qz9sSmlwrxEov8VdTGjZbM1E5VDRw8wzIpWaPHyUqbZP6XdAENUWDnGe9FqJ1rrGkIz+s6xgA
	tp
X-Gm-Gg: ATEYQzxp3FpyDQ0MpExVXPBMTEcFLPtTrAXRlAML+LxHYX95V8/xtFxHipOHJkUb7/h
	woz6eFDYWH5oKAk4Gt4TNi+cptjnqUIfiiMElanz3JrSior2e3+XRnIHn49r9sKIFxfrHELwNSc
	YSA82AMdzgDQvcJ05l1OveTwEBwAiSz0cfbPnc6T8Tml18m3lcblBLuv0P61w2ei44leU2PPHJn
	u1yvn0dI8R1zRjGtnluKpCn6SKpUFQBYGgf9xqXHQwK9AmRVGjWZmsPrt13p77KHpn2hcrV+XN6
	7WrjUBHydLugKH0YeaiEJGhJKnzfXHMJ/knOF+JIYc53x1BsGCiijgn7+vMWOUwRqdfSFvwmofg
	Yywnjn81Rz0lO8BGk7YbWngDvnHzvKTCQ9SeLKlwGw/uHBJQ4c2np/e2vbYgxxfa9aVsiEFk4B0
	6LXAs=
X-Received: by 2002:a05:6214:21e9:b0:89c:5285:200e with SMTP id 6a1803df08f44-89c6b56f7a2mr29664256d6.4.1773826411541;
        Wed, 18 Mar 2026 02:33:31 -0700 (PDT)
X-Received: by 2002:a05:6214:21e9:b0:89c:5285:200e with SMTP id 6a1803df08f44-89c6b56f7a2mr29664106d6.4.1773826411136;
        Wed, 18 Mar 2026 02:33:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e83c8sm166754366b.2.2026.03.18.02.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:33:30 -0700 (PDT)
Message-ID: <e874bfce-1cb1-4b81-8d05-557f061904f7@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:33:28 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jup7h7tyf4efv25mqj2sz4jmztpqbng3jgk4dvz33ec66wj4dr@kgmp5g5pnbon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JiVtgZJcKq8L2EmSOBqJegCzePvtMRhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfXzjogf2liyvU3
 6Vl85rCX2h/XJCp2PI3DLzwCXXPkcP5Av6B8ORN/osfPEgEqi+YopZvRO4j2fA97vNV+n61FaKw
 E6jqdVyVC6QdLg53OGdNGc6TFk50Z2SmRBKhKt7sAz1ShOWC9ltcS9GlpitkcA+sTqsIe0XPJyq
 ke4ADyulNkgLtk2EJMenOdmEg1l3hEaOgf2V7vfWvGM/PU227dCQJuwDWBbxp0WmLoRA7gbT5Ym
 yLmHz+619J67thyMMHCAkIrOr4OIflGp/KWBeZ3O3BQw3jGVKGGzjY4bqRN2pHpQ8ALwjXoefCK
 3Ao/y1Tf+e7fGREIrCxpXkSW00pDObVLDKlQEVENr9mkoNA6z/9V6kTzjY8f2WH7rQGWwNCvS9U
 HWa3z3r9mAM7i8PGpepNhxSNaPc9dF6v4xBiR8ji4xbQpvj5J+3H9adVju0fqSKdH69KGr9SF0m
 klngPXxxRCv0w6IBMQw==
X-Proofpoint-GUID: JiVtgZJcKq8L2EmSOBqJegCzePvtMRhS
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba716c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Hp9DdQFMGmLfbiB6PWoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98368-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: A655C2B9686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 3:25 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 10:39:09AM +0100, Konrad Dybcio wrote:
>> On 3/13/26 3:48 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
>>>> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
>>>>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
>>>>
>>>>> d) Add separate SCM child device (with interconnects) under SoC.
>>>>
>>>> We'd then have to probe it as an aux device or something, which would
>>>> either delay the probing of SCM, or introduce the need to ping-pong for
>>>> PAS availability between the API provider and consumer, since some calls
>>>> work perfectly fine without the ICC path, while others could really use
>>>> it
>>>
>>> qcom_scm_pas_is_available() ?
>>
>> This comes back to either having to wait for the interconnect provider
>> anyway, or allowing the ICC-enhanced calls to take place before they that
>> happens, stripping us of the benefits.
> 
> Yes. However this way only the PAS users will have to wait (i.e.
> remoteprocs, venus, IPA, etc.). All the basic providers would be able to
> probe.

Do you then envision a separate qcom_scm_pil_is_available()?

Konrad

