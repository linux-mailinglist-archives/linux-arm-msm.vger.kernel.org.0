Return-Path: <linux-arm-msm+bounces-114841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v02AGksEQmrnygkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:36:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D86D6119
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:36:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Kms/lHB3";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dHIzXJnm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114841-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114841-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14CD53006226
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5BF389101;
	Mon, 29 Jun 2026 05:36:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7782DB78B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:36:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711363; cv=none; b=JAta7m/vcwqJ5wFze99AT79q63PzOLiWPVgUAEBeKskpXAobqY+wsVexO91SmbfWvDefIgtt2xqj1gxKRH4zg5eFJ7v44bBQL9MIiFqZRJ4TG0rgf3V3njRkzoGVjlM62QXDknNcDYg8gmZaI6T8ivGvO9RQ2BJaCuHYWmxrOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711363; c=relaxed/simple;
	bh=tv1mZI4KEvM2V8q6plCcGch8qL3k2C6y7tULqw8J7NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpD4Y6nEJD0zEUudLfPLDrqaR+PPRqEfOuQ71qkgUtjS+yKYymH+xMJBF0xr0QD1QcqoGIURT75/XKROhyzmVOB1sSKUcxnM4AxG46jMcP0PhB+qgN8Haw8FE1SkcJMNsjMaSJ7+lIsSa6Qf+MyDMgyOjn/YkuCZrbZhPSzfAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kms/lHB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHIzXJnm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4Nljw1767364
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yi4ev90l3hg9+EhL4WZIfvzByHsix7quj5Oa7F0Z58=; b=Kms/lHB3pUrNLcfM
	J2ms+8hjVuXdP9L6K9Srf2a2odC1kMIPxInyu99OMG7MDzvq6AWT/AJygP7xcjio
	4mToFebGXAv2ls1ea4wB2FCUgQDaQAjb+V4EfMF4KYih/MmzpNziyTqByALnW7d2
	dRaFomFa65n6U2UadSc791Gd+AL2SzaAoMe8WWIDAkCKQdtPTi027d5cOIX52bRF
	PJPZ9S9HRgJPHqyWWkB0td4U1uLZUEYPKsT+x3BjZu9ec9d9vxcR5+NfkgD8zGH7
	SQSXfUQmpvYoFGKPkbTD8CAPTAYpuHID2tUiQQ0RcSRVzSxPkz2+kYe0hsQ5aALF
	4QDoqA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4qg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:36:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30cb2bcbf7cso2410402eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711361; x=1783316161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Yi4ev90l3hg9+EhL4WZIfvzByHsix7quj5Oa7F0Z58=;
        b=dHIzXJnmgyXkOt6QUtKUV/E5ZZLsV9AvUVWNQrxYCmZ/Z0rni+vRuXgGpSBI+yn6fA
         XaIg3mu1xncognJsVoiwxMVrBJ89K4ktlz1qtlG8qG+xGU49usifaCHruMw3u1d8Okmb
         dLg1uTe0NHIcVw/j5WDRQEtiKAfzgpYkv5HOUlorKMbbjagnfFmYlrpa3JbEt1dzcmPM
         iSK04/oGgvmviL7H5eey9xc391vK2xERZ0Fw2Bg+TW68p1+HVMUOXy4ZoxEaGROgOEkw
         UBsGLlbRRXxOCNSHd4Wrclf9tD35o9oH5A3i3uH+QoiM6/GJ+2y5OZ4vRcas+6upwG9S
         T3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711361; x=1783316161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Yi4ev90l3hg9+EhL4WZIfvzByHsix7quj5Oa7F0Z58=;
        b=jRDpJA5HTk/uCBK1sbPPfRhjAa1uW31VPWTsnr2EhI2DTzT40BUJjXxvDm1dRj6xgE
         vCnqmj9qcGfEaC525IIdPndYnFABewKKvJe1x2dBwQHhJoNcMOBEXVmTkoKlTQ3hbFs7
         rKn8K/qjxezbBL55PEe3+xWzuytpwKCC3s+h3pxMn5clYFYtXOXrdMKbwsFHHkx6ry5y
         t01n7w7KuZ8Ghhi/4kzscqghjN7qR6/PMYpefIM4h2MT+ZbADcsA9CfH7tUPBIStKlol
         WOb7sAX1H3Ipp+Fz9K3wslPfsA5KxtG3Gj45lKCogJcynhTZQff/mKC7NlkowXCPD8jE
         Dzuw==
X-Forwarded-Encrypted: i=1; AHgh+RrN2lXfb/1PcGPO1qhhiFyMP6nGZ6xfBSc2RRvd9gdqaAjl0Zku3/3wyGEB4P1f2MDQtbS+weiaFmC6tm7b@vger.kernel.org
X-Gm-Message-State: AOJu0YxOImFhqMVjFGYGsWKfzmeu8uku4tBmTiAHcDrAMCHCPaRZguKv
	CVByz60r/sVgvYVBMt26Ige67Jv6Pq7ihRKRqCmQ/Rznj3ftC+6OA/4zcv6dLCt+eFvuNUVljuC
	JRdoNs9+r5u1Cg+2lbWxgpZXp0Li+XRfKG2IkomKvc6Nms1lJsNcXerQQEPU5RuV4JNs1
X-Gm-Gg: AfdE7cnl+3uK3Xrob+pHseFCSOluVrpFtTJWZFpgPCHCC7BX6wxa8MoRqiK5ceI4SFf
	hGU+per8YMaZ2MWbCk6wBEDh1eujAHGw1xhX8xeEUostfETM5ktNFzfJxLvRc5h8EpULSaf6N/+
	Jxi4PQzoUc0pXdHmA/CHz1w5FZkt24iGG387akZcisllimotfPPFXvVmVPNxlKYs3w5KkvmSH7n
	vVuAafTAx5WAQUuIOum3QHm/iNN7ifrVUQxwItDls9t0AxKW1gz/4teOf1XxS6X9JtYIgizD4i0
	C4uSHU4+/51P8p7MfUeJlo3f9mjx91TsibnN/ZlMHcAyPK7+pG/YDH1IO0NbvJk98PmflDcfAT4
	xt5Cf4WwNu3pmAjcoQUEnp93JQZ9Y/BuPhSPe5dfsSEEJ
X-Received: by 2002:a05:693c:3b05:b0:30c:ab4d:da49 with SMTP id 5a478bee46e88-30cab4ddc47mr8830431eec.45.1782711361360;
        Sun, 28 Jun 2026 22:36:01 -0700 (PDT)
X-Received: by 2002:a05:693c:3b05:b0:30c:ab4d:da49 with SMTP id 5a478bee46e88-30cab4ddc47mr8830401eec.45.1782711360877;
        Sun, 28 Jun 2026 22:36:00 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f15024sm32011581eec.17.2026.06.28.22.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:36:00 -0700 (PDT)
Message-ID: <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:05:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX9znUmfgwlT91
 MitGFX3M+Po+yF31xapCKh8dKlMCcRcd/+Wz6GmheLgjIkTdbreGMIvqlH+/K4Eszv9xWYsjk7K
 vLNh6aNAAEcUaQzyMlFzFd8VMNX831tiAt4gVz29Hrt4BPp2GOtYChnikVsP9l+bxGcyKCk5nyk
 xiHE5xU6T16EdTa66nN9We8woDK8F5l7daGItMtLvSYezlRThf93Ucl7Um1VMjvKUGLeV0vk8wT
 0zn2x204jjKgpQEx2qPXKVZYA6AvWPmBY9pgxsF/RnNkvHaAKPvbdva/LWGiDx0C54ZnN5b9rR4
 nTrWoJRlCF6ro6lXbJlxEKwQMU/25Rno+fbrwuFkPn1vXsPC8sxujckcN2SSuQULmQg8hYfdvgC
 YIeFrSQc3rZbmXViBzZoNMzUULtwQ+OqBNcmJpKv0FN0vDMEsMfPBBcqubAjNZ00mKTemIlPE1W
 4NrVK/RrgrScHCBgqqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfXzMFizguLnvTY
 buYGZeFn3lcVK9D3xmbwnXa5BeTj8mhOUvw5h5oGNmPivfPoS2FpLQzq+UPX8nL75I08py8CqN6
 DAkXoJT7dsthzL77I1d+pYuYfsM1Pcw=
X-Proofpoint-GUID: xKFHCWfLdGIkFZJjK4PFlmsidingowAk
X-Proofpoint-ORIG-GUID: xKFHCWfLdGIkFZJjK4PFlmsidingowAk
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a420442 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=thXrHHpa5qkMojcJ7kgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114841-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 682D86D6119

Hi Pengyu,

On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>> driver to fallback to FIFO mode by default. However, these platforms
>> also support GSI mode, which is highly preferred for certain
>> peripherals like SPI touchscreens to improve performance.
>>
>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>> the controller into GSI mode during initialization.
Why to force ? You can directly configure in GSI mode. Note there are 
some configuration done prior to Linux bootup too.
> 
> Ideally, this should be decided by the SPI controller based on the
> requirements. Another option would be to prefer GSI for all transfers if
> it is available, ignoring the FIFO even if it is not disabled.
> 
Yes, it should be decided in advance and configured accordingly for GSI 
vs non GSI mode. Because there would be limited set of GSI pipes, which 
will actually make must have GSI mode device run with FIFO mode.

Why don't you decide prior and configure for GSI mode ? We don't need to 
change the current logic of deciding FIFO vs GSI.
>>
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>> ---
>>   drivers/spi/spi-geni-qcom.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
> 


