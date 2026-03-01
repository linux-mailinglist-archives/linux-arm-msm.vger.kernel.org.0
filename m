Return-Path: <linux-arm-msm+bounces-94739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IFKOGxJpGmMcgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:13:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18B1D025D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17C38300CC3C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF951310784;
	Sun,  1 Mar 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzhR1CEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvDSFnIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123C22A4F1
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772374378; cv=none; b=EpgqPuvK7j7KNnwHESPz1iuVD7cVd4t8LQOPsBN7jueq/5nK4/wiBPxNft11GoLydFc5R7wUbXXyhVwE2nov8Wu+7kA/GvZ7w7rDy36FUyJY+4uevYIe+6EpFwBAxH0Y/+WCPtdqK/5lPvjD7nXDQSrB4R2+YQf8VjH4VlpyCTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772374378; c=relaxed/simple;
	bh=W8F9FfoSyYB8F6L1xaB23lSxNJLcZvp1lkK7nLQYTRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WY8pQI9jQ2pi+LnZo/3GdEPP0qVPIpb5qg/9Dk886m6WqEGXeJ2Mmo5eS4cEG+vU9BaB7k1471Fo9+CyUIHx8ic/Mkjp4nqEgOQ3zMrfjIUaW9Gtg7qYBLNUqdAWkh3Bn3msRzahwK1twAfThHfJDrlX37TmG3yLFx3CudqcDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzhR1CEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvDSFnIJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6219kZr32894054
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 14:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=; b=gzhR1CEsiPToMS+t
	ALjjry+gPfH0t08cE7CUFbacxuSiL8FKdtA8sApdCKEGAhGmnGGC7dfx7IWnDXT0
	77BiLxg8g4CIx2EwHSoCENgozLzcq6jp/FZ6b6jlHRpeDBQ5wtjbubdWNzcSZJqj
	3BP4434qzk69CU3NoKPA0d9B8s1FbYlQLEFpx8X9zbs+pZWCOGiKcapjCvs/albq
	j/zQ5vyU8gEAnm6IARyFMhxOsEgBoYF4FJ31hz+UTI7OiD/IsKizSRMNUpSQCN07
	OpLkoNc6hgI3SSYq5F1pV64NQZqLS/WUizbnl9VIHJCgeIW4hZ0vkOdp5ou6nzja
	3pCsJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jtys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 14:12:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so2863584685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 06:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772374376; x=1772979176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=;
        b=OvDSFnIJJTPT6u7hTZadoKLOozpOvpCzrsk2OGtEFNTk85a8MwZ+TZTA6h7ZwmGa2f
         C6uJIYPyLMnBhuQtu5PZsCpLtlYYmDvNqhI9fi857vqHvm0cUqf2Qll9+UvxX5rdRAOM
         MMLpjLVt4InEQBXJt3XF0IPD4YoKI57cqXOmc++atJTBTxcoltMHxihKdpkD3YdF8Dup
         g5clhlQlonimVHWUAilKzRw4gWM09DNnuXwWQDBUAmfNCRp0/s6bzuvZ7R0xa29M9LgW
         34T1WJR3Swj1YrPw8rB1PtQf9+JTGvr45n+a3LiWqf+9wn3ey0tXY7VYPitRbNMDrsRe
         Hj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374376; x=1772979176;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=;
        b=NSLgvmSeZciMyGm59dF919y+evk5BnCNfi+YW2rt9j71YHpzY08Nyb3qBm16Q1z9RY
         MAG/LRh/fax5S7J72QDkAy0nMy04Dc9c6cnpqgQmHPCPODzPOgpS9nZHqeZhb6uXOGfQ
         Bvw6zfcEYfsBI8MF/0dn0xbJ/WpVYcBY/w+d4S7JAUXl9N5lu24b1Hiq9u2kE5tPPATO
         BrU88fI+0K0nP/J/gLDiVk990LobW2bYxBq3V2aZm6BPOKaqd5MfirI5/Px5DZ4eCf05
         DraK0iLVqrVSfxD80QB9XEc3MwjtFQX/kaRkO2UbVDyRDtlHx7spE1Dl6spGJr4MVlJJ
         dchA==
X-Forwarded-Encrypted: i=1; AJvYcCUopb37fbSIZbPaEosbS7hfi1e4LsCtUzkjdpshAu23/IXgHKseda8r5HodGJjabZ7SebggeT6mrC0C2J8+@vger.kernel.org
X-Gm-Message-State: AOJu0YwgjkyMMxPuxQTsfxatyDuRwjLZ9ulpHqdzJ3PbuQVI9hO6LR50
	MvKCj5L5UNPqaqrSL+p3CgzIazFL4Hhkpkupy9IU4h1b5L3aE1gCjz/Mwq5cJMOrXIVKzfWnr2d
	IDroIkTO4pBP0vGzfH9/VtuekGwnwP0TiUzhhD23QIQI/e+MBtdx603F37qewbLwfr5pT
X-Gm-Gg: ATEYQzxoP6ktgmdDc74C4JEOAWw3pS3hPC0s6yFpD+NHTfe4aTQl6cP2pxdto32Zf1T
	EFG8couP+DM3wJC7PuwbNqsyNtbD0eR8rkfJiua7zxy2pxnfyQHemGeg5f294py/ap2Ou4XoZTP
	6gPUJ/MahRVCf0DM7kAa74Eivr9faUiv9AfXrLpJYucI/nnun2sfB7AL77iMqKK1PibMMfPj7wB
	jhv+StwRGgDovqUWoj6baRPOJB56hLnjaB43FZZ7bYlF/vG7p693N2jNR25Ic0ECyCV5IDMQo01
	9MWwzH+NchK7/KLqyfPncjGuiy5vM6OBP5CujZEcuAZ9vGNynJJoUGIkYEjrASXPB/4Jbuza7LC
	Vc01L0J/dqR1NHos02BBfpy4U3Kb8sx1+DrfyYhsV2uaiYLSg
X-Received: by 2002:a05:620a:f14:b0:8cb:5477:5278 with SMTP id af79cd13be357-8cbc8d70ed3mr1178938085a.7.1772374375844;
        Sun, 01 Mar 2026 06:12:55 -0800 (PST)
X-Received: by 2002:a05:620a:f14:b0:8cb:5477:5278 with SMTP id af79cd13be357-8cbc8d70ed3mr1178933885a.7.1772374375359;
        Sun, 01 Mar 2026 06:12:55 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55df68dsm2509164f8f.26.2026.03.01.06.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:12:53 -0800 (PST)
Message-ID: <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 15:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyOSBTYWx0ZWRfX/SDmsqzjVX/G
 0fLQA2uQ3a7hocXAUBSkr/d54sf00a2fTSblaRzgcoLGUfhnyhCWi1BtJjQga2jrnJFgYyM6Adw
 IcQHdROoZauq6230A/xqK+51euJBvsl/Rxs4Jq7IHS1e88bA7Z6ZGs9HjF4kJ1KZ2zr6Pqiy5wF
 jY4lbh2yCBWoEOtgtJhuuLfClWjppJ596NP02P5aEXvEuNmBQqZtqglfn2pXIVKkKsgAcvqhe2i
 2R15UBnnhnz0w8Bk1bBBDrhHqN7IhJtSp8R/Gfz3Ie/biR7hNA/Jh06ckeRH8+RE5xrgemP8YEx
 RbNvr/hjbZoxcq9AnExyG6fAVBIHsdEO40JuHAVLeghHg6g8xqZj+mzd/fmk0jkDfpUDTRjWVXF
 fUu/UoZw7UOkQbHcnVAx5IK4wkc6JYc+j6X6ipDyt1G7/iLJMy/9KljjJsJ2dG6LCotCUsXsyh2
 IWkaO/d0iqULDQmUisA==
X-Proofpoint-ORIG-GUID: xhDYD4t2xhyVg41KKZBLdPV7Bo5HawlT
X-Proofpoint-GUID: xhDYD4t2xhyVg41KKZBLdPV7Bo5HawlT
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a44968 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=55d_-0XgqAmJSplXZjMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,foss.st.com,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94739-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A18B1D025D
X-Rspamd-Action: no action

On 05/01/2026 15:37, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling and
> make the code a bit simpler.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/bus/stm32_firewall.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Is anyone picking up patches for stm32?

Best regards,
Krzysztof

