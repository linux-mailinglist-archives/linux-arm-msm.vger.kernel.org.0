Return-Path: <linux-arm-msm+bounces-99197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mInGAwsbwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:50:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9D2F0841
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D747C300B441
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2ED343D91;
	Mon, 23 Mar 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z69B7kUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8LTsdiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701138E5DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262729; cv=none; b=NA7v5z7QvU0zXSp3HbJQrSnKhDThK8ds++Gk0rIGdO9gvEncEwZ2/Sy27qSRWaP2gA+N8owXWV3DQr1QdUUTVnFZPahyYbShRaEoKFU0sKOmXQzHId/2pcJGCVEOLarJAXIiKXdomUWIXIwmBaa5hr37ULQcnyIgwWPwn5rx9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262729; c=relaxed/simple;
	bh=bJR3Kdjc1gGye6KW0sXyRoKoFmZCvahO2l+ajWc8zhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJWEeo2cyHmkDMhYyPVHwgvETgl8ODAMR0OWL3H7wL+PI+ndoq9REZonSd+RnHIUFGRcv2LhuxoA81mh+X4Mo8xIujZSbSUjlxkNfjYU+LWjAAW1OCgZbC7CtiNCeEYTaW88+3thsRGQFBzxt3xotQ3RjWDqyFq5o3RSQjNW6rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z69B7kUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8LTsdiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7DId12513219
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ZjakhbEwfLw9wMFFasNPzd9hrAyej6SVbhyTjALxjo=; b=Z69B7kUfynEEduX5
	9IYnifSRg+Dz29Sb9lwj+PdKV6zxxFWjBK8z3vL8QFviCOo83aL1e/S14fowZOQN
	s9ulyAKEKZ9jw31pyQhXCBDtaElx6EWM/qyGzcGIBYF51wwRviQYA36friTABnhN
	M7GZBL3Eak/88pXzkcPhlfn1VrJ4hA9ocQ0emudIY6611HHqJuTrNkOfflX81MlR
	jQT+v20Th4j+F8h6U9y6RdLETdzWMjT8kaq+fA5iQwCWFro51XWn3AG7mXp96TPM
	3G3PawmF7iyA7U0iypY4aplDsctdj30Vp8ib85Ns6sdqJvnRsoUlSEM4EtT85GyI
	E8Jbpw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5n38m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:45:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a01982dc5so40463296d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262727; x=1774867527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZjakhbEwfLw9wMFFasNPzd9hrAyej6SVbhyTjALxjo=;
        b=S8LTsdizo+Ls5rNMYU9aENgQN2rqXETcetHYPgcps8Mpsfrtg7hf+QS7gpDjll8BVr
         TW4a0BrYahCbXjRvE42k0sK4uOYSSKkuVQ4WrFcuWCYcMT6Y5MEwjP4MbdFOAb6QG4eQ
         ueOMO8YPsl/ouQpu4eyI0qTk9ey8mk//8bpe4CShjlbqUYjy7E+9CDAR/cELF3BBGFYJ
         4T1oLrXzY7byglfeHRElLa8uYjzUSNiD5hgkb1eGwuJq0wpOZKNPJ719TTqxsiDSvu3I
         F4jrd1sAOi7r6W2oi38I5HDK4Zs660KS+RHS9usv5Oia5XLdYWkeMcTUgxMrAoUbiiGg
         RmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262727; x=1774867527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZjakhbEwfLw9wMFFasNPzd9hrAyej6SVbhyTjALxjo=;
        b=YfKto4xr58qgXGqOJke5YAKxZ/KO/jXWm3vEekor+p0C/IO1eF+5fJjD97M5Yafiqo
         rGBTnCKXUCPLgN8Snwg7Qn/3q3EBqv1ZTx1AmeuohzMKDb2T0GmdxGAGOLEMm9E7xYUB
         6JUZCEY9LOQ9aTrdvvePFyBEgVzpc27VFJu/+PKKY+FiIYznub21DK3E+2CeTi5ecK/f
         ZM+p7oJkeE48eABwEPHhNfgg0kZTtZFxEWgDl/7PWBTFE2RIHOFXeID/yEgC1O9ejqR3
         JA86JCUC1W7vGbpz6CxWRPy2E+XG/BHMXTSlS1Fv3DXkUps2hgRKvY++S29Xyl1yj7tz
         yXqQ==
X-Gm-Message-State: AOJu0YzRa6x4YEa/e3CnJM1WAy46EmyaWnQNN6xEnYEaWfwnCWLwh6mX
	ts91WwZYFcgndZQsGdqw8R6PP1ucPZPw0Q/m89uPCjYVhLes/8+wkEJaGJjQ6vk3ZieN4UvHM1u
	ELGb5JHQlsEnzJB8ojow4D+JM5ZZA/yJDH0JTWeLRbIbdQEbkG4CaQ9vPjA20+Dko/N0e
X-Gm-Gg: ATEYQzybQ2+T5V9T7Cyvb4C7ZS4UFhTSGoU+njoPmxkE0cIoqEOT7MNekFlBVMPWJW/
	VvoN2PRoVdfxCyXnGSa4fi1lP7svChP3J2ROdA5w3yPSAi+4B0n79vKNiM+POVHm6j5pfEecCAf
	5wJnMFyYQ5r+FALzYG/rglQNVldeedFtWOF0Nlo/CUzkVhpO/OLRcx/1O4iCPGBj2WHV8kN0Ko7
	oMc0KZ1eHMHI/WBSAwTXhRLHUNBgAm26UZ2V7MViYSsRC6HMmNqJMZ7cLqcyxGYdIvGuw9Ta/nA
	D9Q5IHcjn5c/D3btN7xR9aL10T49md81VjsbezbXJn4cHt+GeSV6LRFkhUEalXFt1lIHk+mjtWH
	OxMkzImQXVaWWnnFJjxV4aTXL/u2dQQm17Xkqo35L6tEBCvuC3RnJjndEZJ7T6Owy6e4NaqS2bu
	TiNGM=
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr136812361cf.0.1774262726862;
        Mon, 23 Mar 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr136812151cf.0.1774262726318;
        Mon, 23 Mar 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2a4b390sm3567344a12.28.2026.03.23.03.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:45:24 -0700 (PDT)
Message-ID: <b58ae1d0-d4c3-4b30-8bec-295ebf3b9380@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:45:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] interconnect: qcom: msm8974: expand DEFINE_QNODE
 macros
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-8-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-8-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c119c7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KdZTDNEmWR1w-4yzcOIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5wdnVQb0F4DRNyQYMhGL-nYRaXfluNWC
X-Proofpoint-ORIG-GUID: 5wdnVQb0F4DRNyQYMhGL-nYRaXfluNWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfX8TGqVpbtn9uT
 GDjJNqQ0NPruAPD3lN+8ngDtKijk/e7bG9spGXv/NX25gr773YTQCzMT04Z6GVlcCsDFJSw04kD
 j+zTQoj9PXEaOXTIZygPdmzgVpO2iQNSrOs/UYlSkVmiuWKE2rEy2p9mrjFU8V4oZaXJCm5tIu4
 tgbQ+VwFdilhFMXeKge10PUtX54LavPFYq4IbuER2kdxRN31aPu7WkCJMXGUkY9wUwxttM7Rsbn
 Ex2iiMHk7BJuwiiQ1m61OXIGhTYKpsDqMN5avcBL5YatW2KzehaLhRKEPJdNqDgdGpg/R7pis1W
 oqGHzzpcIfGsa+GUnYxxASCSG9vmY7FVkc7X02zwga6dmxMwuIElVlhyKlMAMOxtFxKk+EZtpr6
 Nd1PVFKpFt/cRITVcdipc4Y8Qv2X6FKcc+p9lsKf7lDsfzVxfE5XvqytIchbXMBRCpXAk2uIOt3
 +ST+ZxBR5wN1N8r7DUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99197-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67C9D2F0841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> The rest of Qualcomm Interconnect drivers have stopped using
> DEFINE_QNODE long ago for the sake of readability. Stop using it inside
> the msm8974 interconnect driver too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I'm not checking that by hand..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

