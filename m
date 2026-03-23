Return-Path: <linux-arm-msm+bounces-99296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAiqMkVSwWn+SAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:46:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521642F5295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FDE030ABC73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF082343D2;
	Mon, 23 Mar 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FksSSyvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9XBH3bL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCF1F91F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275579; cv=none; b=SGk80XnIULboYbabX+g2Z+e71aJWw+jvSTsCi01R+sRgsEmQrzZwPsfYblOqc6Pt2K8pc1Z4SMRlhm4QAiaEeYUOGQlyVh2o0T2KytN8uU3Apn/erPI3oz84/vlj3lB5yEj/1yH1Fc/qzxdqHALnZt0A6h2I0iYLDAaDwwTPQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275579; c=relaxed/simple;
	bh=ZZSCN4kQpGWeTrlTAJJtXzaniqkZv+8b6jSRBJAOSaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyP3/JH31KeV8ZuawfBBpSC22YUJPUIVPfifQCoDiXSeifjsVcyTCMltJ6q9dZWl8c/xa3UbKu5W6AmAQ3Hz+Vnv8jFIEMNdQD+iEe1/Y92B8M5Zllh8/tapWU2KRkhvtxmUhTxqnyIoJL6VbCg0AZDLAup3jGmsFFg34Ge80j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FksSSyvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9XBH3bL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ND7SeS2191090
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8d4KjTzuSxbeYdFstSsVJ45Ghx8yVL1UTRluH2xJZO8=; b=FksSSyvz5qWJa8Ep
	biwO1cjoi2ayopGCKpKKx6ow+bvmrYeb/1CpHNCLLc7snlcQB3FxE2p7r6mYCgqs
	VuzqzGBX9aDzx+It4ydq54K5vJ+GcZrZmqvRR2x7/nd4QVUdyAJfKor3GMGiI9zz
	x6U9JZDdLBX6RO4J8FGNcYMCRhC1UeAeyvO0M5uKpyZ6n4ADfEV6KRA/UeCvUSf6
	I8eDpTXSfgajkSmBgATHdikCM2jrExh+2sWZCYGeW/zXZv7WnAlr37Ydb6Uu3G5N
	Uvg1jgzJxeSqm5jE0Y8BR3CotkY9QVkH+CohYDKJBx14p1LdaOmBypErMjBW1qAl
	SF2eBA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jr9rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:19:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94ea747d58eso1188064241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275577; x=1774880377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8d4KjTzuSxbeYdFstSsVJ45Ghx8yVL1UTRluH2xJZO8=;
        b=Y9XBH3bLhGWu8IKGfzrt25dlgJEPCsbvyvd4kEYLFmBGoKXEvEoeIh/SoVjVtYu03q
         JOg+eUQrOo0JSOTohh7xh1aloxuUOv1FUxHEFw1SK1m1Jo4uiZgk5MXjtg8nKPafLLbR
         bvEPkUcOVGqESubrj0OrppP7x0YNEJx3yu6NBVugup9QzqnQWTY7XdUE4xxQ6ILOHu+h
         Oa11GqWfstPJJweEUXX4H6oQPwtXzQRNjm0xe0epnwKqHAtP44syfs2z77IQlrqywqe7
         O8M7PzLZURty49iKVbHArUevrfehIhs4D28RpQMsNuy7/Gh0zY0oLPk7VC0MHxiMSi4e
         aQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275577; x=1774880377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8d4KjTzuSxbeYdFstSsVJ45Ghx8yVL1UTRluH2xJZO8=;
        b=jS1EapDdqWyaDwCvjE+46c4dYatGDGjITqENKvE+wojZmndPtSFZ4+Nqn99QLV+bd+
         0oqQTBxFczmwlb5siQBNE30w+Ch+mUbkb+kjfU1t6EJGwmp10yc+uDC9Rwj3dAE7TCPX
         9Q4mxuzpf1yukD7AC8dIPEAL6fqbaRRctcNWitJmLcRCazLI6MmdyJmq0LaGavqsTkJ0
         cxs7f/m22KPj18v82wQlya+niBGIddMqVQ/GCMQub8linwhCUmUM7Gn4fhJdV7kpdw7d
         ea0wBevejWvwPw897TE0n8TSgxcfLup9kUn0Ir295f+uRwfgU/EWEaUkTNU3agJqmE9/
         rKSw==
X-Forwarded-Encrypted: i=1; AJvYcCWorwcefuzBmQ3zN+YtFH0+slAt1GuNASstjelmerdJTLm+jx6yp3FS5rdgBYxf3e5ss4SNqMlrJEIaTqGW@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBmy6p7pA2Xo7rBUpy9ZGEU3/bWO4gZeHxUFj5Iv/PTj0oMry
	l/kIVaYETrBU5DnDt0MSOaBkTbbcYxJ2fqQPnjBtCaMLOVhuexUslTXM66N4wB0C0KqL9QDgZIi
	+yc9KoIclFlnzG5lE8eX4AJvuz77qheApaYIe1K6ym+dU2ESRWTrZUv21GmB9RlC5Zzno
X-Gm-Gg: ATEYQzx8iTp59I716FtqvULyqQemoylQ2IoNruZYOGH0PgAdGsevNQmhDObbDBXEi5a
	QsvPFJ+8kgBYeURadNR5+7BHfufSU4SDSlL1NU+XLTFOmFsh4sgPWePFw7weOyWkha5Vg3Hy+Z1
	TbnOjRLRy+TGAEq9sTiMZQt9cacr0CbPiw2qD3A8gT+EYPnDNYRPDiQYNLmpYwB35jRs/Rt1UDn
	Yn4jPfWw8+QFD97HLWvaJj+z9uv1MK+emZCzwV7GrIC6wB70s8M0PkMZYaVevK4DM4ihqN5+IOK
	9nB8C1/XoV+wE/yxOwBxFcQX/65w/JMFU/LJuVPxGtDqKcgXU37Pu7ME19na0P7thhsSxrkQ0bf
	FVrNjikDGmJxO3lSUMsntFDoPj4BgoUn1yn9X6onYR4rgTowTTv0sJuaRujUgAJn+tVQ8qf2PF/
	dox3zm85FB
X-Received: by 2002:a05:6102:9d4:b0:602:9a1b:ce47 with SMTP id ada2fe7eead31-602aeac9142mr5294367137.5.1774275577150;
        Mon, 23 Mar 2026 07:19:37 -0700 (PDT)
X-Received: by 2002:a05:6102:9d4:b0:602:9a1b:ce47 with SMTP id ada2fe7eead31-602aeac9142mr5294337137.5.1774275576603;
        Mon, 23 Mar 2026 07:19:36 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm30222101f8f.37.2026.03.23.07.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:19:35 -0700 (PDT)
Message-ID: <2d1d6fd3-b34b-4eea-a4b7-0085a6a7342e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:19:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <7e50100a-514f-4f73-a976-9858ce5cc0e1@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7e50100a-514f-4f73-a976-9858ce5cc0e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gq0gPiJT3pGM7100oX9xE41MxlSKO0vO
X-Proofpoint-ORIG-GUID: gq0gPiJT3pGM7100oX9xE41MxlSKO0vO
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c14bfa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=DL43HRGuj61veDmeUBAA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX/ii5Tg9/1Nvk
 bUF9vHV9DG2x5S4rig76Kko/qlPF7E32p31wDZGFCkHZGB+lSJUr3BR10NM5dvO8XjcJezphz9l
 7Lm6UrrUi7aZeOh+yi+Jr2VZkSd7XOaqLu7g3S1UBUI6lV5+WJhS9G0wTwfoww+4Gv137RfOaNk
 83VtdXMzfecW2QkwKhIi8KDOYIghlQ3XvEbrMJ+PIVeqjeaFQis2jJZsWP0TzwpMEFhK/lJEKji
 6+l2tXasMsN+cMYe3+jAsCSd0gTW6qIW/c8F0o6M+szvQVVl4HQ4tlcDYH7rMm3t4i3GvML5yqp
 33nGaH6sZn/5IYwu0e/4rJtw+buxxfU+QA+t6qxhkaGASGFOXg7LbnrgbNRx2lWfpL0nzy8M5ib
 IhhyEZiykUqBQysCphFH7046RA6TT1pMRhwqAfonyjMHACgTTP2LiO+8p1+Y8sb0TeopPhnifTq
 MQbishP/GQqhPLVnOsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99296-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 521642F5295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 13:29, Konrad Dybcio wrote:
> On 3/21/26 10:00 AM, Daniel Lezcano wrote:
>> 
>> Hi Konrad,

[ ... ]

> My specific suggestion is to _not_ spawn an additional node, since
> all of this logic relates to the behavior of the (e.g.) CDSP, which
> already has its own node

Got it thanks !

+1

