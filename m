Return-Path: <linux-arm-msm+bounces-113906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ASXgHz/oN2r1VQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:33:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C796AAED2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:33:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FAX3WVq1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FcEYgKGc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113906-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113906-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37DF3300D84A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5340B367B6B;
	Sun, 21 Jun 2026 13:32:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB57201113
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:32:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048776; cv=none; b=a33k9Ed9WiSwGc8kmCPC+n6FH1YJFEyiod3CIuIAfD8qN+bamSLTGWTBWpLfjjOwv7s9x+TAghPEMsMTyQHY5AIj2iloM0zSGCSjJlmu8X/p3YputsrgCEHMvTqAQ+KfhmUTkKrc0xNUbzRgY40jANu8kD524z6hvvXQm/m4Z0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048776; c=relaxed/simple;
	bh=ipa76yU2Zw2tR6ryZjmIAUocwMFzX+D5OAP1yIQC2TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QT0EWhGDazBBEFpR7vR3N8Nztc1N5ER6azXasHFV/Cn0XpQGibe1HMEKsjG0FSkA7t/AkK+4kbDl+BxoDwipvjGxGMu/pDshW+oW+zCjWNj7gJe992k9k2SqTsxnqdv5I+XVACwhbxiZ51YCPdxla0+1QRxhAQRQZnwgx6P/crk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAX3WVq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcEYgKGc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9vABh1809184
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=; b=FAX3WVq1SoL6yjNv
	AQywfDqvT7JbCuHP/KBgkO+iAyKEtH5eNs+FS3a852P/F4jlVaOzn3oJvTuHjdnI
	614BgeK42S9XWXwt9Q4xxty240TzHc6VbbefLaJms7YWAIUTs2VVjBLZRPfaMlZY
	G5BJ7tQbqhhpEF5KVmwTtHwIp3a4ps6fCBG+qipT9fAeZSHydApbm5kJQvaCsq3T
	K3eGUzgdAy7oKH/R5NKfysI1O8LG6/ZbBjDn06uICtemjHR+Yx+H2K/u6W9YeIGM
	nx7A9hoZ7XQ9dZWP5RhazwwKwARkNEGxjpBvjOZs6lses1cNqUb3BTf4rxTB/cKI
	4Ot+IQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk8830x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:32:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c648d3ca8so2315638a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048773; x=1782653573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=;
        b=FcEYgKGcXvFBl5ozOfEMTcxrzTrhkLgKAae51tab0ClLKvJvZIxiW7OTLtL6BIacp+
         cQU91kVWDA/zfO/0XZ8Xq3HAsPdQQGVCgA++mh1fx8wlAIfLLuSBpJ/A1Zph65dNIcso
         Nmi5wTsNSWHYrNVIuTwAMY/j7PHjUuWxHAqDjPKHiWk9lgib4tJbvuUcFxL62ptvsrPd
         zhtJpsfmWktCF6AMAmtmVygP/6vXE6S6X9FnPD0fh0eVQdzbcJ6jEbVdNgz8B/WEvUwF
         R+RUBPDJDY4P7uKXLPUtbhQv7rwieMMbwe+jQZoqaSs1XI4zMkfmpWH0VY43kaiyA2KE
         Uprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048773; x=1782653573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=;
        b=T8FWx29LDr3GOvFh4i0siyL24r3y23BNC9/uYnaOf2dZvyrB6dmoy8nGm3hGOR8BY0
         v0AFq2RA8oB79bMsEmzXmGWbTbXnzNLDynA4f3WyvgV+wMU83n5RZQVj3F/6a50JJ2qS
         ICQJN7wD8OOcBH3EK7zH5J0Ra2IP1iyqSt0Us/WYSxjFtPhIHfcWtYmCn2XzsRZ5SmEA
         YXf7sDBwEHU4sSgYs3Jo0AJ2onrfK7GP6zMyiQ7f4+svdD8XCE1WWO3j2GjvjUVV/Hnk
         efKGTP6DDTuhjMDOJzhMlQ5xj/qIBEgcf/wNFQEV12JJ7S0SaDLrtPZ3lMIhjqGFWQFM
         WIuQ==
X-Forwarded-Encrypted: i=1; AHgh+RphvvnUwZO5Kc/5vV9hlfNBeqIQqOXtPEfvRDm/KG9sa+fgDckV9ejBlAM++eWu6lc87TGUlF/IX82kdyr8@vger.kernel.org
X-Gm-Message-State: AOJu0YzXpdrLlsha9aOYiVXSFnAI7ekVqx8SwzRf6XYrZaJeBoEu/LYv
	o5b2okL/Iy3uIeq5UK5oy65yhdDZnpDHpPU4WsaFDQw8qBxIxTVvzyrAESAYRpvqebo7WvGFmGw
	PweXxQH9xoZzls9h1qDIJnJvnuptHMYAIg6pw2CtBx0B6fry8bVwXNRGd4RCCZ/B9d77h
X-Gm-Gg: AfdE7clXiOySlOBGFEE9UN3nHiZRRFl8ZIqKoifGHf6Pr+LAY3TKSGRWQR0VTqJQh6o
	nWlfpQ6XwTnYCJQTr0kvQg0rQNLejdMZtZhcdMv59RYI+H43i9CRORR3zwDWkfbUxsbuzzcC67P
	9xPVzfsVk36r8wa6y0K0TjotZY9IR1yLE30HW+EPUqFERhW8xfCtSexSHCAa5ixRH1iS6j2yAGu
	sNEaiwNpuhu6xscPV3glZ8uoUe0mZ8XuvCHf8Hd8ka0n0cFnJZ2QESZJrUV5V/JbUSy++fMyosJ
	5pXsJu8F6JO5i2zoVF8XCTDqWJhZ+3cMhxp4aPvyCYdjTVSbXHU/E15yFGCoSPN3N1AvjXQasQw
	3uZsn/AcMfstyRRejgC8pC+qcIXgkrzu6a1Sw87b8
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37d160e49f9mr10095808a91.9.1782048773226;
        Sun, 21 Jun 2026 06:32:53 -0700 (PDT)
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37d160e49f9mr10095791a91.9.1782048772761;
        Sun, 21 Jun 2026 06:32:52 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm4527649a12.19.2026.06.21.06.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:52 -0700 (PDT)
Message-ID: <86441f81-05c0-4561-93df-53783e5b9674@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:02:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
 <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXx5SS3lVRPMbg
 IP1llAx4ySo301yaGC9gHCBSksXk1h+kwBfYrSAZFBOyKkpXQJavwxiEkRkGKFu2hR/2Wh9DaQ+
 7nrZv1I1GOTLX019QQa89AvJElE5kEoHYZsmpK0a3kI+Wp52COFd6ne2G6pOXhvGbhCMqnwgOtx
 XRMgW4ZYrBy0qfKG72hxFkYAta0eK53oRFDgQxPTw/jnL/aydHi0QHgNN8kKjRL/pI/99tngk7r
 Kfyw0pz1OoevZMWvXjm11z46fUic1m8F9qxDb5RzK10PATxPSHaN+k1naIJS2j5vuWH2KfDfXao
 jlNLZUYKNczbuxHGNVFxhTZjSOIsV9AaALhxyNUWsO2+ZG0mVTU3DXgmRAUQtsr2WQ23SuXWrDj
 LabRrRSpjz5VOoKCb2frC7tlWjJBbP8q5ZrC2+qZrQtun8l8l127lVjNmbi7MfeDoLs2V9XTOKz
 mLA89Z5GyBK883IB+Vw==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a37e806 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=r43F9ePfV2yG36ZfAfQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KLijtSAbY8W7E_5jiiiXLuzJuXViml0z
X-Proofpoint-ORIG-GUID: KLijtSAbY8W7E_5jiiiXLuzJuXViml0z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX73NMu1t7TzM+
 03og9Dnofo4M/hp4PaleRWWYwI6awesQAM3rsZ6PMFVRLaWjHU+7lBv9pKIwHHrY0WWsDLbAceU
 tXUFGNTxWyqRvEf16MtxXah9yQsVJ88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113906-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9C796AAED2



On 06-06-2026 05:01 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:16AM +0530, Imran Shaik wrote:
>> Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
>> values. Incorrect settings can cause the GDSC FSM to stuck, leading to
>> power on/off failures. And update the GPUCC GDSC flags to retain the
>> registers, and poll for the CFG GDSCR as applicable.
> 
> Separate commits, explanations, justification, etc. E.g. why are the
> flags being set only to the one of the GDSCs?
> 

Sure Dmitry, I will split the patches and update the commit text with 
justification details in the next series.

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
> 


