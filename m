Return-Path: <linux-arm-msm+bounces-105653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N1JHINR+GmQsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:57:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 090184B9BD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BC9E30566EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5412EDD58;
	Mon,  4 May 2026 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLxRlFcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adAcISAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5230F52B
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881200; cv=none; b=n63ruOEEZJFA/AVjGEZeQtjJgw4Iuzxwg7q0fhdqGDwk++tGqJ2xBu7PGns0nX7ZFwAYPD+RamQR90ViHyMLYLNph/pgjLVWtvhMh7Hyjc+6XWgEwPLMiVf1x1jS6k9z+FIrWazR7k8D2eKJ/bx4ozMvVJNg4tuW3gVnD+vjkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881200; c=relaxed/simple;
	bh=4OoXRR4QkYthl/WwmdE3YXaeSFOh01gjRlYtQBvbWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u5V5mAnmsigdIDaYGkOgkxlEmfFO15bXbCo6QyCsR7wc20xcINMV5RgilhNkMua/4Ku71kEQ9ZxJPd0QPS7iPQ0o+lakG0EzXK3rkw55JHtrHpNbmFoqVqGGx8jLhK0wBob68rJRXcnsnk722IsYLODCk4lqVOQdIkgaEjibAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLxRlFcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adAcISAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446Dnsv3471615
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUDAx8+5gD5l8P+ilecAiP22roMtio2UtbDIJRNo0XE=; b=WLxRlFcQ5f/yTcUX
	tcIpdQjIhd2UUgmGfsVjMSfuCdzKUguy4IwTyBjwVJ5wIM1qIY4pCqK6dRTwVc7s
	r/IlfxUUoFRFUpcPrMeEJU1GWDcpEIE6xO1PEIkcfW5UhiaM2SU7QwIKgl3CwgUQ
	FpaKYl6CyDyq2i+InQ/mUi61DiCRYVLfeEwVYplNxCBk947WbZibKzh+WJRM0b+b
	VjX5oWd8yrNg+lri+7cpC59hHb9xvmbmn6MncuOLx1TttQKJNBh6B8c67ipE9VOS
	CNK9XkEVg8PbwiavbGDtYuAJ0QrbC03P42QtOS4U4oukaxVRMoCr3qRE278isjTB
	DXFr3w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvms17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:53:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611bf61a809so355909137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881196; x=1778485996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUDAx8+5gD5l8P+ilecAiP22roMtio2UtbDIJRNo0XE=;
        b=adAcISAQ8kblJot5NwFliAkTd/H2n0fO49DCYXkC5S/fd+rAz038T9zMjCH3rhEhgq
         BV65hO7bMchLWacOJcPv8gpMrPOhXIse6IfsXxy5yOAxyesc71ELGf4wCTXmbRXkfq5t
         lURb8ybjMESxL07LkaAhqbO9HmNlxyYXLLUZXBLun6vtKk5pffOVN0ibeWqOcYuM2eMv
         339hZ1e8+RojwibGPjHvlZsjYNFrlztNxrcq7UQZArUHouUHsoSVBlsVIp0mF5NInOps
         FmgMBRd3IBRi2d8Fq/vCtmizuLt4JzSEugmYX6taDkgwbw1LOtFDi4hgm1dNFfLxE0WP
         jXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881196; x=1778485996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUDAx8+5gD5l8P+ilecAiP22roMtio2UtbDIJRNo0XE=;
        b=ftJIRCrDKUfaXdSN6kNlECKTHUkLdqUI1kY1AOw1ketemPtxmTFe+BdcZFcjMdxCjq
         pBzTr1lQfx0T4LIC198fZntfZWbrmmBOcuySaobDE2GXHFCc/G0i/pwu4Xibq36yGCau
         3q0+ATRC0lodqDLzQuL2Pqy9IrOFJHPjpOPaxjQ/PFs662+H8lXDqHHuUb1TPOBPWf+j
         Eef5Kav4vwHUCJR5tScuB1PlaiCsg98haiPsV3tKfMSJR2Om5GOysojJnEJpzq5dAFv5
         jsdXmtwbD+Ge3BVhTrS4O0o0Ph6rkx2/8JmZ8Njf7WeUNuMypZxqt384v6mTVZuLsiWd
         9q+g==
X-Forwarded-Encrypted: i=1; AFNElJ8EhfLeD3fgW6fCvuoMP7kw3nZZlhumtYDHitQ/nxRNEpH39Pz6+gwri/UPIo1D1BnQ38y8t4oDYMllhzfb@vger.kernel.org
X-Gm-Message-State: AOJu0YwbcuYaVZa6GoEiYT1W9YyuZ1c2hJcYCg2R4xLEbR+gg+OsUHol
	h8K1pkIIqQ1itrerrZHvg8/geuPBGGB1rRxPUUQ343L1QkTE4RnoJZTfAvndtOtd+LE1R0cnKrs
	ipBOjgTF7JeB1JDH7CNbRRPT8anw7DYPEUx23kLMwlwtEYxJQenOHb3QpbZZGPOyWSMPd
X-Gm-Gg: AeBDievYsgDLkVykCy4+N+LItF97nq7yp9/iIY1Ej24200gKGRI9NW3uZfq4cqTh2gf
	ZLejcmcFoqUrRVxGsK7kJCDr9G/hmagwLfcIxxQwERtJteET8FDl5FE+3Vdu5LDGij+ufHHzke5
	3L7yUTAu3aetgOkrspFY33R/YaVaLH2LFFBtuNRp/MVVLLpDKF52I/iKAaA0C10lo4lQOu/N3sZ
	mrUzc0O3Io53OQFtTPCgtCwfafIGd/sbD8fcGnEkJXuIlYhkanxSV6EI66tAT7YXD3ce/g8t/tU
	U7Oq+djkzOBmXWgzgM8FwnjhWRcbQucDbaBJIUijynVFnKT4J+Z0yppSLRC8MaocfmXiaxldN5R
	lzmDZf30mJWpiCg6ATOIj8WHaJ9oV/lIYYYLNNWOlmmBsRUMY6RKwY+JRiUVYb/OjG9Ek2VVf8+
	JiUOk5OUWVDl1xJg==
X-Received: by 2002:a05:6122:1295:b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-5750c7340ddmr1016306e0c.3.1777881196456;
        Mon, 04 May 2026 00:53:16 -0700 (PDT)
X-Received: by 2002:a05:6122:1295:b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-5750c7340ddmr1016296e0c.3.1777881195975;
        Mon, 04 May 2026 00:53:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc2e55d98f9sm31639666b.8.2026.05.04.00.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:53:15 -0700 (PDT)
Message-ID: <934a644b-270d-4f86-b7e1-db9fbe3db52b@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,sdm660: Disallow
 clocks when appropriate
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ymtmsj9ULmM-A5CXjb_Fcp9MLv5u1JFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NCBTYWx0ZWRfX7hiFccCkXe+w
 kD4mM7Izpclmp20tnjU2dJNHkYnMc4VkYKkrKMbYpPJnTjzr471xaAXi4prCBBfWbUse1cICcCB
 caHzDh/QgMGoShd1vguadesicV9iC3vRc1jsnSVJhKwaY9U0GCNiQ+QlrwtgNf8m4b4a1/u/4IL
 tRFUlMqCYxrK//xDLcCmLyIXyf0lyoRHAPourMvirXgrw3Uca3KqDxmDit+FLmjyn7LaOKMS+4U
 H0A3Cz46aHG5Vyz3EBRhy49D9FhSK1lMfH9xoll6+isXgvqTNv1il388oTGxRO4Kd7YnJlfaD2L
 /yGFHJxTzp9TKfsDgh3iBqxD4HDbfO9uZqlq4pChC+m8cdCz43a0pATuS+cdN8yDZBJ+fF3YZgf
 UsSZwAXQC3tcgx7WXQKt3ddRqeayqjBGRbleio2jS80cS6VGzXhNO/G/DsC2mUFVDVZn6IIYZsm
 KfIDsphSWAHbA81Ctuw==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f8506d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GwjjA_OFujnSjQWLvtkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: ymtmsj9ULmM-A5CXjb_Fcp9MLv5u1JFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040084
X-Rspamd-Queue-Id: 090184B9BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105653-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/3/26 6:16 PM, Krzysztof Kozlowski wrote:
> Only qcom,sdm660-mnoc and qcom,sdm660-a2noc devices from what is covered
> by this binding have clocks.  Others do not, so restrict the schema to
> be more accurate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

