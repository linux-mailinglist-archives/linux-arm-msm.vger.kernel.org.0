Return-Path: <linux-arm-msm+bounces-81922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C43DC5F794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 23:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DEAF35B9C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A24C306B24;
	Fri, 14 Nov 2025 22:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GU4vT8DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYqCZNcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ABC2FB085
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158150; cv=none; b=nk7kLPf2ATSs+A+rq7bXkhK66fxBV6f+JrlqCsFAzH3XVYFCmOGVBU22YH3xGC74nMlnZEcebwd2NneKu+gz7tgv0FOjfKmPYbfaORXjogsafdLXzX7e3WWXQl7lkQ+i7d4GZmdJa49ADr4dpSIrFUvKfFLa1zDdC72S4G+3O0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158150; c=relaxed/simple;
	bh=iPSh74YU5xiboqFUfUJ0apAdLhJxZLeLZX1ZnN1flkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jga+iCqBICqqN9UcopB5xP6iIID5WYFp0pdtZfkRqOddSNyo5ZgL/sP2W91dJ0BN3HzPJiZgAyCt8uKY0XS0MwcINb+GDigm/naix7FrAAn+PUS4/K5smXz9SKZug2zjX/9M+4d7JTDFnqO/8YeVPDlUZQDV5+NPe2X8LC7ovlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GU4vT8DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYqCZNcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQ1Z9442852
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=; b=GU4vT8DHyVKRpqp4
	QjZvVFP4a4/k6E0xA/+fKIvziTwyVf/gGIwfLbGUvAIERvWvjKUXqYGEayA2//TN
	M4uVvYEyEUPJUweSBnmy56B7Vd8E5dYWETlhJhEfMX319eLG0rhK7KP3mhBPGfzZ
	l1WVLSXxhJLd14bqGHTX5yEs3CFTsndfMUz8pqwXtSW1+OOMqDudLyqSKx4GejXH
	h268tXjRT/3Dfi7TZRE5SV56KGMnBiRn58kq1BFqwfhw6ghGLGuwdiovbXtXg7Ct
	e5HZNF9N3LRilWhCG8N16cQkAbCfAmEHzZzWcZbLoR/3ctk0dvSqfqjGm/5LyDfM
	iw/u9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae7cv12e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:09:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so7949771cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158147; x=1763762947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=;
        b=OYqCZNcGw2hKGTkndYW93G+EkrFsc/tJazBtDW903brWn2L37vbSa+ErdtAemYXHNG
         kgeLKVAcak2XKT8Rp7gr8lBLSLUDJNiLiQGDoD7zhzyzz0IivPKJ15Fb1w3nwv1ioWHT
         sKlz9yzInf+Nb3n3rzdNs/4Qut254rsVvf+5pPHNOFVjou2vx9BvDXGXBNTMGVT6pPrj
         ZgoV/osNVC3lmxcIRw5+ZfxKHKPKdVHzUU6SB4O9i+ALB4jf+l4xhICFAnOfuCYvzXTA
         usQ3wq4ia2OzHCaAzUWFFtdxY1QKdZDyz8YENTxnFYwHyyncACSKthtgN0DWLIWtKKIA
         QMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158147; x=1763762947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=;
        b=MUT6tpeSobRHFA9ymr55dqO0iAXWlQGteubYMcJqZjgfL1pxl4P0IMeSVftJrgPMJg
         cqDiSCSQgKeALn3dtEQroqSRC3Ic3uFLL65oBA7m4o556lXJgmLFLTYKaiiPUH+tHhGQ
         aw13WyBW3IGIRUo5LFNb8gzXcmarKPYfcqyHlKVkb4hl26JWuM3014CqyIr6iM+RD5m1
         IdjXTs4etqjuzgne4e8MmGY8+vjeidvXw+OPYIGgJ2ga0ZyQB/5Q8k1YHScLmsdguTXP
         QRpPhzsrzoPaFylCnfb+hyf76T5jTq08PdIfuBb00UTO28TXIoIlMD0baFuV+G8sqKT4
         doWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzQPPXfPDKcHbTVQlEQM0qbZR5yMrLc3AWtAu1NZPaGAVx6UNmGePY96ulfg1g+g6wn0ZE5pOW/nDhvFig@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7sAmz4bxVkxJN2tWGMERneaz7HboKR0cC+It8vyyd7+j5YnPS
	ByQLPfKaybLKq7/Z1g8mdKJKwakuBJb88zTnRXcd1j247GKlW+wCwvEwX11ZbDql6XjUnTYV8jm
	nH2+JBEBOjwDYDA+H6N1qeEPvzlbT3QCW52KmX+CKy6m3vyG66MUqnJjtiinc36QUTsOF
X-Gm-Gg: ASbGncu/3LESa8OGmWbuU8i+kVebJWUkA/3KBg17nMFLxdFNwsRaymPnDfWdVYgOraa
	aPtGjPRbL5HaV6Eq8dllBt9+iPASiqGaEYSCCPrZ60xdsWYgbDZTviJVE5njqiaYb8nuPbvy4Er
	uLk4SxUUfO8pifzRiSYpQvbbBTJ/hEBUUw2vgnt24OMPl5VLZde+euqh2c5CMnyyTdmecZPK+Yn
	Pw2qepC+vaHKPIcOc1dkipZ93oVcgGUAIwXBAovWcHLm3M+RaX2G70FdfRk5uMimIKOvlPPBhJu
	/8R/68l4UwrjG/d09BTWu5iEBfRIIaPKd3pv+3lJ6q3Orn8skhU/oJKb7L1xF4VoePzF5hei5Lm
	sN9eLa7fqPFNS8RepZW8Tahseh1FyiJFBP/0jqwRrVxZn/5knDXt468Gt
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr43928221cf.8.1763158147105;
        Fri, 14 Nov 2025 14:09:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3lhrzuy4JyzwvIwqTZ6/6GXL03D2BYdDOgndLmL+2Dwt9jORtRlqVlvPuSyThbnEBKHiqA==
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr43927941cf.8.1763158146676;
        Fri, 14 Nov 2025 14:09:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa811e2sm475740066b.5.2025.11.14.14.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:09:06 -0800 (PST)
Message-ID: <bb5ea31e-8748-46a5-8072-8f0484e72536@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:09:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hipikVg58K51H2S6RlwoLCsthFJ_fS3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MCBTYWx0ZWRfX7fgA0rhvuw8C
 4zpGRHfjiazA2ZZvTAhiTF96FAWCkBcdwY2k42U3SIjRgt5Xg6AvJtTcXyH+HDHrkzzMWaz3wgc
 TiHZSqKlIaQVZ62KDyWegmx9cBRaMAI5aJLZbh7VG6rWjEwsUE7pzlAw0i/kZaMlTEPr9xIwFfS
 CDz8w1kM7guGWEJ908x/1RfsMsVxTK/845AmtT1bIuvPXYUbHjZx4Osth/P8UGOA5bmaqfqoRgW
 T8CDd771jkdZLYu4pEBhWQxwCLgdtK8x+e3wiIAPrkSh3Ci1USXgnJXrKTMiWZcyntGq5e9F40U
 tB6VzIDsT5uqZQXXF6gu5hNs/akFA8mGckNvni2N4WmGhjNzRS/vWca+LtsNW+3lROkEfx/lZYJ
 0ZYDYkn7x3yVuyPqH5KGokMzmmHjiw==
X-Authority-Analysis: v=2.4 cv=Y+z1cxeN c=1 sm=1 tr=0 ts=6917a883 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=Cvb5ON7qhB3BCWpPquEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: hipikVg58K51H2S6RlwoLCsthFJ_fS3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140180

On 11/14/25 12:15 PM, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +		.regulators = {},
> +		.clock = { "slow_ahb_src", "cpas_ahb",

Drop the _src clock, we do ratesetting on it through its dear
child who you have described right next to it

Konrad

