Return-Path: <linux-arm-msm+bounces-92916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ04CPD1kmlY0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:48:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCC1427A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D15D3300EAB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D962F12C5;
	Mon, 16 Feb 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPHzJg7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP4IksMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E724A076
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238892; cv=none; b=P04JJfinkEq5btRIK6fnk4ZxkbwNKkrUGzx0gQeZnzXk5U88PLVSrDkPpTYY8Hh/zE8Bn1NxCoxNY5vymzSQA5ew1AsipXXrWRc6RNjgJR5HDUOdZn7+8UFrYmsaqReCe/4nuEk01xjOwy2kj+OVhHeZUtbqqDaZRp3cQG6GW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238892; c=relaxed/simple;
	bh=1zbQrVDLQB6w3Qg/Ku+uP9HZ5NDJol3JbH2TotTclUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=awgYogAUigLkvaF3yfjX8ZoyZlIgWJA47xuEV0GzsjMaGLdTVqa8KVF2hMdHJ79NDdWG6GA/7bJ2LE9EV46i4pX9/bDefoof3QAdGyo8k0uGe6WMH/nicU1NIXZGiFPSe9ZbKwgmiV/096El8Gq53zR9I2i9SB5hrzObs1gcmHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPHzJg7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP4IksMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GASuBj2311401
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1SaqNIg2+numwZT8FVXW5Ow+2HmHKzCnOHuqK6Vf1U=; b=DPHzJg7dkfvcPfJW
	nuINujkdOsd5bO6EcZL61hhPpkUh2XgrwnrOQJyB2WN5mlFwp2EAbxkqoh6b+IOd
	V+jChK+FBh2qdj14AkZFeN78U2Bm3Uk9pjyhAUdvt0iChTeXsxUFMRBaD7IiOjHc
	hOyOsEx3CHlAEubgMjU0ZG7bIWMAusa2KQypbQKMcwKr+Lo3OmuE2r1aNsHAcmcE
	o0T/ewQnetUhy7yKQuFOujwoLxXW6FT9L30rXINQCLTbKVKS899U1n/xBpPnZ0xj
	LGn6KZeSg5rHpTLEA4yhnTzVOxnExHlDq4nx5TGafO/w/nyLLsPaNojxKtdsz0PL
	GTOIiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4ak7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:48:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894a207e7cdso21356486d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771238890; x=1771843690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1SaqNIg2+numwZT8FVXW5Ow+2HmHKzCnOHuqK6Vf1U=;
        b=EP4IksMqLDr+B7cI9f7guPAi99cJXpn+7QVyWSSEvQY9cuKGCkVdhM+Y09rSXBFO5b
         1qzpbnpImYNi6itdccfADJyhEDl/0jwlIl8GLHNkxgXMpktVB4/k8Usf+x5Sa2KidCnR
         kJDk31kpriXODWLt0GGbcYGQMlcyqbE2iyrNTSJs8OseyBkYb2OLI/Stxjn+Zx3TMeQs
         8voEcv20XByY757lbRL9NIsv92bkSNuOPE5kP/NtkQfwMSGpQR7vVrN+ivLo1pBIniPZ
         DGvN3BmGDx4BNOg+6Ot/SStjvqIqWSavCVh4yq2lgnPKAqTX7PkNJ3tFY7lV06TB51zY
         GsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771238890; x=1771843690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1SaqNIg2+numwZT8FVXW5Ow+2HmHKzCnOHuqK6Vf1U=;
        b=jc5zj0JDX0lH8qR8E6zeLMNxUL5htTgWcsHNv3myWOzS5FsuMMHaUwyniEWIYLkg8N
         jveTU5c3iG19XZ4jLRKMsfVaip+RNwDyeWrkh4i0Q5Jga0e97g7YaNPPP7vXB5pi7bMr
         qH/mc+CW/LU1uI5hqvBpcr+K49vFtpt7Gw6C7LdkstaX7T6MHKVuQPm5+ebgxxsrbTEM
         6cbT8EWz4t7hqek1Vl0SFwADwbho/vB0gU2IMjzpX+ox52lvtT3b8G/UeHSp5V6v5mEo
         RJqie6iN3hFLmq3vnpxr1tbcGjfy8N1wKYGY6Fvj9G7yD15vBXqo4/CDlfmc+Skz7ObS
         k+oA==
X-Forwarded-Encrypted: i=1; AJvYcCVdkbs7W4eLxuzmfiFZggkne8kWEvmfDTBe6cuttX2Vre4z+qdZRUPAyjAqQ+eyQFv6ku4XXTZeL6jdLvNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gbwmCjAP6Eg32jMPCFxJu6NUDYxroNUpkwlysqYmTtCOUbyo
	g6Ka5+v58iOJEDIzc4huee5Vq4RIvsfjUFuO2jCsSWH6aiBCvA2jumOQNDcKffbM2O6ZvYOlOTc
	waxRiDUdDs4+1w7VNvCLMkq9MtWSAxS/yrOkY30seSZMzHs7oy7gDLVSe0I5GJESF+fM/0EyReQ
	Ti
X-Gm-Gg: AZuq6aJ3l+EA1UsYLj5MmmbuNEfSS+c86gdwzS/qYCr4UPALmk3AWQ4CF33JYXZhiZd
	/XZ5uUXJoI1Dnp/ldxa/8J1wbV5T7qEGXU+e2tXqF4QuoOnz40mvGo0FGLLstbHrtzzPtwVsrdM
	y8YakE1B8es2OPT9RViN6RhjdBPlRAfm00aWYzoSgqWArbFdLKOU15Dbm2OzoAvENmixrt9HGuW
	xqTheiH1rGlW7mzoTGKNtYiQCwAp260bUiXpYROm2rdW7SVu7p6cnKB6l2cgX0Ywn6eV9eCHFTm
	y4Rlj654VEDPf7uMV+h0DXRvg5OzgPnLnnmr1GyuhhGygg1z09ahz/RNKKoDWHplf40DVZ6Y4o/
	+QeO/Y3Pt8/FccTbB4UKbFeXfqqc8nes+dkqe5bsJvtUyegKIsoR534lXpClXaiL1hk9Euv0OQq
	udB+0=
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr108822086d6.7.1771238889947;
        Mon, 16 Feb 2026 02:48:09 -0800 (PST)
X-Received: by 2002:a05:6214:4f05:b0:897:12e:8e8b with SMTP id 6a1803df08f44-897347e287emr108821916d6.7.1771238889488;
        Mon, 16 Feb 2026 02:48:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm248590466b.30.2026.02.16.02.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:48:09 -0800 (PST)
Message-ID: <7ae02a5d-b79b-45dd-be23-dbc1114c9a7f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 11:48:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sdm660-lpass-lpi: Make groups and
 functions variables static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wU08UfkGinBf_RI2DpEoeS9R92vH2aT-
X-Proofpoint-ORIG-GUID: wU08UfkGinBf_RI2DpEoeS9R92vH2aT-
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992f5ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=6-iG9zf4YNE-WpPKBB8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MSBTYWx0ZWRfXy0nPzewdk/PZ
 1Dq77u2Ga7SuwRD583BfKBE45kd04PhPdicaGkhGPxNxLKOYmonfxccab5543g/hVqL8fmCPvcz
 Etp146mwZVrvYbsdGwYWiNK1KkZ+Z9KugfdppOBvet+N47guU+89B0ohSBZvu4qWzdxmpawoYcy
 WSShF/Yw4g54oHGFjagwAIBQAQ7sQPnh1HkjlBDP7A0R7D8SVkaL85I7aZruzntTR3Nr+UkRRt6
 oOeFes7B3Oj+/jnzBvuZSvTRu67eBKZxV7+L9vE7HZbhA4GmoBIZdlho94Yjl0RZMfyQrmJKNBD
 +7GbORYsZeURi/OvVFnUqdAMawqA49TszIxpGdfSf+tob+aPlRfw3HE9f+9bg0qV+wpRGgyGe93
 xGVceahrnwSOC5enDJ5cpC/RfoDENCi6L0nv0cXRp/sSnkE+CVuqUG5yxv+5kqEIxg5FJXY4m6l
 JSsK4bqjsTgsnF8d+JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92916-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68CCC1427A0
X-Rspamd-Action: no action

On 2/16/26 9:25 AM, Krzysztof Kozlowski wrote:
> File-scope 'sdm660_lpi_pinctrl_groups' and
> 'sdm660_lpi_pinctrl_functions' are not used outside of this unit, so
> make them static to silence sparse warnings:
> 
>   pinctrl-sdm660-lpass-lpi.c:79:27: warning: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
>   pinctrl-sdm660-lpass-lpi.c:116:27: warning: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

