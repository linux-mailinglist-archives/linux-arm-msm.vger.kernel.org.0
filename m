Return-Path: <linux-arm-msm+bounces-98381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULCTKjB3ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:58:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 232602B98A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA4FE3015A59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C653B47C1;
	Wed, 18 Mar 2026 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUhhlM18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWam8t4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE63B4EA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827722; cv=none; b=Kkw8Mq3cLk4ZaaM8qVPXHi5/9wO+5urZRYcZRUfm0R/QGE25qeci3LEGpO9mW4WVh4UVwOiryNoCfFIKU0AiJu40pLuxv7E2n6kKfrabjburUUk1lmSSPIHz9uxQqzBgU2FJa/aHPRgjZfRdf0Ga5IfYQsERBdjGRwY5JMXI5oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827722; c=relaxed/simple;
	bh=xIq0xMcTOPMyhTIaPj+JUxHMhqa9umyfkKsl8bwH1zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHvlMj0LfGRyqgj0mx4uDYicenxbbVqGh9tTVgGzTKH6a/kqpQgwVmKe2hWGAaSwe0k/QHOlvpJJIQrowpYZ0nTpQNXn8MZlzZOq9NZjXzR41No6wrR4RwHRGt4VIE0VBndEoBB2cT9SPTSFZpM+7mYL5JRZ8Gq8xPOYS8V1ePc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUhhlM18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWam8t4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I94u2m2730141
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCCg5Y1x3Oc6Q7IA8Ya+WunadascikyR7lZZKozdkAk=; b=jUhhlM18KmmmI5jI
	XsqQXmi3bU/4v6nD2wqegu7MsHrr6ihGMmBx9q0wpjYGdB/sGf2vJXegU+1lJSiw
	yYw6SfNbhlKX0ro7nuLoMORZeLANnLqqLyCKIJEx182ex/xF0LA13mHZ/NgtWuJF
	sav+tYhhzrwJskG+BzjMAEMQ9oCCYC7lNcPKn1QqzGy+/Nx7xbFxjOkYFFQYkAT7
	DrZ5+DH3FzGwe1Fd/tGMIcq5XRLlBssgiqNJa4ph/ZNHpIRKTnQYisqdFqTHveVz
	Aqf0FxFs0tVxNM8HKmP6gXC60UZokMqypTqnIMS7RenIpkOrxtgnHiFGT2yz1SPy
	QY62mA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjv8g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:55:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090114c791so49579821cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827714; x=1774432514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCCg5Y1x3Oc6Q7IA8Ya+WunadascikyR7lZZKozdkAk=;
        b=eWam8t4O0GlIav+Cxy5/KwQAur3Rm9zlXNeRNCanut+i5bkBukjISPdbi/PQEpH61H
         cqe9AZvotWatKgd2LI2rQ+G94gD3ZihAZLo5K5z4JaGr2kcwT0z25JRMPzK2LS1ZdymQ
         GxLRdz5vnill+lIvWEClY2oox3pl+H1Fil+N8L3nPQF9higvYm04Wvk5t4uvCk2CQjva
         LsksJ+8LtYXjx0MRLTOORhxOv2+M0YLavJw+Ud7IjNG7eJnjRiDnRT0zSGMrV6GTKWy7
         tHSGobRiqa79VVOzTlTJHKyNotOAQDD7KsQANEh+IgkyIFTlJyp/2wOR/Xh0uWNzU9nd
         vtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827714; x=1774432514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCCg5Y1x3Oc6Q7IA8Ya+WunadascikyR7lZZKozdkAk=;
        b=Om1X17l1ZAodBnnEbdaM5qylZRX2Ayvozwrnz0u8fdxoy8lsnUyJf4jJtejlmH7RJN
         z+wKNyKAvbADuIbMW+c4W9bgQ9k8a67XSd27wAs3rGCxxLb4fHF/L7omlsQvU3gFgS79
         viRJvV1Z7IcBi32j/vRjCk2MiF8B5axzESq5qzgOkhFE/SgiUnqoQYqwsgVsNTfMUE1c
         +h1r0wTgiwg6wi2Ac1gSnT4SBkjaPuO5XWQXhunQygHQ250heq9mgWpVobBnHMeZNSA9
         Hk/axuFxZLt/Y/2P3+N/29zJq6uIoEGWGEtXJJkNaoEGTaN6GmxnSbxqhghI7QitA9Z3
         6/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVksntj/9Bszieq1/5e2wsDbzyKHBzfLQwM8gJDIEBD8ZFcuJFnL1LgJyGKcJBl4aBvuRMxJEgOQ+nX+sB9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4fSczDybt43dWYkQhOwrtmbXz5Xk6H8Tqa8AcxOjC0eh77igA
	CzdiqKul/wKa1bSCphIYVvalDKRUcnLfwWA7Cvk65wJErVYNC9MtvuKDCmIGBGsh6NqDkCbUFMb
	J2YIir3ZJmGAELdj6iXpY+SDhJy6iHey+WS6zOsBlkQXw7jC48wWM7awa8sqBswTi0g3w
X-Gm-Gg: ATEYQzxozOBZGcKaUFA840QwGdIHalGsWn72dVZfOj3HzD9PDojEheoHcio/4/R5JkV
	PMpoRv/LmBH+YLzjv/Y3b11FUKKAf4RLOu8bP7yEyTEUjCeazJNbs0FovQbBuxvFX7ADCZK13Yw
	MyE/GWvjDNMCteXXfiXrRep5ITijI5ZgSpMOGnzmxXavunA0h44HePpvEplz7nGOkV4jifNXAV2
	4MVkwg0ZE8Gs9KjlmC/t8WlMHwiJosFyVssy0piKrUUeWVM/ck2oQBT6bCLXlptYtsafPPXIRym
	QUhZeLyf4iLWSBU48yX/S3e3qPOFcdriy0noNHjGNMxwhlQH7jwbeVrBdHXROGxhd4wgstS+WIi
	Wq8Yrm+g0UgvSnCU+6um1ZB9UWl46XwV8DjgC8Q8sipiveDzlVXJ7bSjogFSRcQnl3h7VML93hg
	ebt6o=
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr24009431cf.8.1773827713794;
        Wed, 18 Mar 2026 02:55:13 -0700 (PDT)
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr24009301cf.8.1773827713408;
        Wed, 18 Mar 2026 02:55:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm170047266b.25.2026.03.18.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:55:12 -0700 (PDT)
Message-ID: <01b8fec5-527d-4de8-9915-f456e7bfebfd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:55:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: milos: Add fastrpc nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NCBTYWx0ZWRfXzeruP9pFSm5P
 05/VL8kaANDz0PJJYDPGD5zu9tzn11rdNoIk3AVqhOZd4x0HjPs0SoA8gfwzOe7eVGQwZWk+Z+v
 DIXih4DbPj5tRC69stz56R/6N95KVyA/gPj8YwFBSrGVtZUrMBXZY9pEylVTS3KxOq4ptaZn6Cf
 dLlWxQdPKunqOfQOS+d06jpr3wFI9H/1UvaOh1Hrv2r+AT9cjXKf+ad7UdFhqiz0no0nYNrgdAs
 /LJ2dh0Ed99dl9ZgCE42tvlCe15mHOZHMOSYNY+nCqftDzMFvtDiaQXOjoEf5zN1/EvABqaPde8
 grCTUR/0U0qgXiKKXjxCJAwiojoVjzBLfqGQE21QRy8lwPG0HF0yoLR1ZjFgaryMznw93k7wdzn
 tP+hRNvB6TUvM2UsFzBTRUqhe+U5zWMSt98L1bOvs/tGdbYCnShZOtFPVPKyIUuvuK1APB6f3zN
 sw05CS01fczeVtyOsUA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba7682 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ZLojPbiwntXo-1p1Vb40L4_ygAJIU_kn
X-Proofpoint-GUID: ZLojPbiwntXo-1p1Vb40L4_ygAJIU_kn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98381-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 232602B98A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/6/26 3:01 PM, Luca Weiss wrote:
> Add fastrpc nodes for both ADSP and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


