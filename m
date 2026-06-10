Return-Path: <linux-arm-msm+bounces-112503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DJOoH/JuKWpSWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96F66A13E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ONHsKdyr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gbhu0kpp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112503-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112503-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3685030060AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF5833859C;
	Wed, 10 Jun 2026 14:02:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003A2231A23
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100131; cv=none; b=RWpfKjXFO/eI5VDJ/dGMdRnrgtHDUaTFIqRPlnORD/Jk3LQXMDNV2YxZIWz+uiAKOFpFsflh6fZKOAEZn6doGEUwYvQ92D0c2BupnGVEPCawzl36Go+JEbFbCDKA2rSAuqR4d5XqppwqWARivqHXrKrlzAvEXLzPmLFZ4/nA/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100131; c=relaxed/simple;
	bh=4aRBrc7GMNbLZwfXxjQeKOfO0ZRIiKOr0XdQ5LIPtxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ci0sOkzAzG+ROO5AfImpAnmozMBnCpR8WnMrUdHyibziYngg50a27KuHT0BZcvIexmbkuT8rtIM7KSMNGV27xz9HJI8+QWpXyFdFoc1NXGsRlOqfM/pNiU9ZOcixqd2xwpL0bLZ8LxGuht6WhOTGCahN/IbzskNLUrXomGz3Jqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONHsKdyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbhu0kpp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgmA1138091
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=; b=ONHsKdyrD90pUARE
	/25sk2508YJoj2ibC3soquTYX0XT7jbkJdCj5QPePwRX1jm25lMOc1nuLc867ZrN
	iQWTiNxcIVMFYMyUJATKI++oRfOk0LcmKLLpwlvpzwO1gXsV3Bho2pAERZYqnLi6
	p3VK9bOqraw6ns/KhZgXzyzKF2SRTf/ELxPLPYHdNC08udz7asoPeljcVcdtxXrx
	ZUlLGnqywHDSNmLoeEHHOvs8ZsxaeGafLfrh8f4o5QKZge2cKzLRacu4VHAqtSbk
	+hraoSmKLJOCET9kqVbfRnxfrFEyaFrBDhXtaCeeY3pmTabhxvpsdKnpQkrkQlQ5
	OhyOew==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jr4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69eb90360f7so35483eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100128; x=1781704928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=;
        b=gbhu0kppqsd00HmQp5MPG5riniH4qWmY67k9W46roTAbkrq/Tng9tGyzNNQW9hsEzE
         nr66lmoPMpXeV0YlDLQdX/bJ4v0tWCZ+yy2zt9ahxt5RU5v650wK6FSwp46hTkCN5NDf
         cuDkXu0gqprV24b9LFkeJFok2axwpsOpxnidiyC5ybIwTtsI+SyvZTr+lhD+5K5V6xF+
         /aAnK/vyra13/6f96HpxjwlubHhlZYbfvAwnpjzf5ABU1Qd09l7p0qyJfu5bl01zMMwF
         M1LZfmT/fpaC2qYFGLjictaITH7Ei8xFSCIfh+LyR6a7tZuTAwMNJiW0dxjobSbv1nnC
         GczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100128; x=1781704928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=;
        b=hSt/i9Qw9Kn62KmLNtEmcYY164I1uU/RmGTa49uXDiheKxvdxaWxpOnWgmWOXRsLK4
         Lu/hvbjROMxrJChgGa6SHvRcZ3Sw8AenLikUxShGzuW5MDWUK9ypFUxvIj2Ra1iOFkQV
         8caPwLoLWOiKUKFklIpYINOOX3/qEVc1Uou5yWSmX6ikxtDWBKDKwjbKXwpN4u9AgN70
         IcYqmntMOSFFk9n3P0ikfy9u6ij7guxTUa30beXDVMc/JRoXpudHiY05GawTsexSbWac
         pJBqgo0Cb7r0Tjs2DeRKdDeBuH8DqNHO1KJ1OMRrBrydjzzqlk2LZ2QetiWuGpA40bUI
         RZmA==
X-Forwarded-Encrypted: i=1; AFNElJ/N/nnb3F1+Lkeyl0HzjkxtGjyZRsXKWj6u0uChMDCziYhW90Q72UTTateIeLk21p2hajsRRFWjjIH1tH4p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0+UmeeybLlxK9G/cmBFcAQWT/CDf6a27WUhjSMhEmmRLkwng
	e+Ns7NZWkfrRNzz8hqcJ+lXQL0utpmCb/jk3i6bYSEvL1sRo0uvQByRWq7qCqbkPEpxD0xQlR7V
	+D/JN1EdaoWjVJ1gT3y6O+RDxThtIBZjVUAR0tLh1jxwT8vnely3ZE1YCdH8UDhLOULfs
X-Gm-Gg: Acq92OFHJ55do6phCAb+n7xZUH9ybiKX7TWJ7Ti29o/7tuzYoSBEK491vu/f0AdHtsp
	qfjCkOLlIFjH2B2/1i/sFtMmKKlmost8TPu8EkPk1IGfS8JaZ+4Ua90gOB01FMWaB5Y1QtA9SFO
	xBBGeVO4OvnJxitfXiJzFDJBpJa76kHHROGvBOHWrTB52ztahnW6gCxGZLkaHbPy9fcjmjItQK4
	CtLbqT6mIsCXWagpH4sbADVCyQrFUXiPA1fVZ/Rhu5w44mVgiIxnQJLzc12Tv12ekdDfnU/EOV1
	01L2DokyFpwIURuDh50q86TiNcr9mv7RnBLuIqwo8saOivD1Y1E4PnLn0Q1jQyi3TIf83rNWPJv
	EMkjl9o0wXcCTMDbmq9xj8/MZbFF+dpPY2v+15F+SXb+qRjaQD6bg32hx
X-Received: by 2002:a05:6820:a20a:b0:69d:6026:2fc5 with SMTP id 006d021491bc7-69eac971679mr1794666eaf.1.1781100128027;
        Wed, 10 Jun 2026 07:02:08 -0700 (PDT)
X-Received: by 2002:a05:6820:a20a:b0:69d:6026:2fc5 with SMTP id 006d021491bc7-69eac971679mr1794612eaf.1.1781100126676;
        Wed, 10 Jun 2026 07:02:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055309368sm1176605866b.49.2026.06.10.07.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:02:05 -0700 (PDT)
Message-ID: <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296e61 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4TAmcUqLxasSw5w_aJMA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX9bGqKGmrZrmw
 PrIIggqqx7BI+RLmTyAzun25pjKGVCp9CGDT84rRT+So6d69pXxLu9cs19swpgkvaiuTSJFcya7
 +ga1OCHSIhWVcG4f1f89SZcKm+qqN0IR8eci1ATfumn06nDahRP3aEiL8+riPl7/mJmV4FhFFJ3
 9RSDuArL6x1vNXV6xmitR5awG+/1QllnCu52+xZY2RmCxzwfPiVNBu2h/hYN1DglBbV0iZGfS98
 I7bASbw2pYOS6/sBLWdxPWA78smZD6PrvRy8tTu2fWRnQBMQziMhucbdCgiEp8z3AmqgBugcCpw
 ar8u8pZj3zXVfSc9mpvmP1rxsLxcKuhcO+KSRjejSSEip8FNN5wd8UWV8xtjcAIvSB10ByP1oM5
 KDaDYynlAwg9dw8UkScmYP8BwAmT7HuCXg43U1t5j1AZSYo46A0n/zadFVkgGNwfQSdk8I1pldq
 01gsRAxth6QiYJ2KIlg==
X-Proofpoint-ORIG-GUID: qAh5-cFDChMmGlJisSlchP3wHRxgWVkp
X-Proofpoint-GUID: qAh5-cFDChMmGlJisSlchP3wHRxgWVkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112503-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F96F66A13E

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

The Agatti MDSS doc suggests there's only a single DSI controller
and PHY. There are registers to support a secondary PHY, but
are those just leftovers?

Konrad

