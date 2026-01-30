Return-Path: <linux-arm-msm+bounces-91311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL7/LGmpfGkVOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:51:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625DBAB82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE95D3046E89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C4C37F107;
	Fri, 30 Jan 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgh/ySsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/D3TUrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86137F0F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777366; cv=none; b=H0XgEXx8Tubl1ZDHekwOd2Wk80x7woEqXVmyKO4+WZ+Okp25jql5yUgmFbvL91QWDTxiTdBsrtzg/LvEitbthhErkLWv4oXKQDiyJeOUGu5X4rhztLx0MSE5QqLSVVBLExdr/ptKuQ2yczhfWtewf18x3wg0jWgQMiYjygcDjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777366; c=relaxed/simple;
	bh=K+iBHGVfK1+Z96SDFvc/aRLaNcnv+Zzn7na8mPRopKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAH2ZHzreph1GQCu+v2vRhEab7pFJ6qkf9jirvXpCfqCSExk4Vz1AfpVManDJYRVH4PNubxLfvysmDCSoMJkOu4Bh87HUPhjH48pC/rCUa+VJ28Fb3+d+DRG/+oChKdBskTMIq9EEI0RCOox/URS/PY9bRcaCStLCH/iptbUqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgh/ySsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/D3TUrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBVhgG1825992
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoR9Gqm/yFZjJ8eRAFItY0g4nyGdiEiUyHMrr9c4s8Q=; b=hgh/ySsuSv/wARBY
	5BjEzvP7KChP33QndGEej+gDSH33SLEKMfuWI5EftQQUFIRwFuAENV9wdfCn4+ZL
	ZNGHzDlH0WlOAiQLKhQvlzPHR2+2VCv25J2/SJ3Tt2+WEaJdNGThAN3IhRIba01Z
	3Ersb1iVg1tORqhfFuhgl3TqBPl906b9UAj3kt3pbCCw5sOf9RCOmbCbscpMKdIJ
	4HCcFSZmmGkt843ZFndD/hlbqCgCuDgOvI30VEm2FHRi4uquiECLjIVrkEIh76vE
	AkwrO/1iPOcTEUAL+E/IHENSrZZdFKFAEymJ6FCmkQrGGzMWU8lxVbzeGnreT2fD
	V7siUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsmsc32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:49:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7701b6353so22880135ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769777363; x=1770382163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoR9Gqm/yFZjJ8eRAFItY0g4nyGdiEiUyHMrr9c4s8Q=;
        b=B/D3TUrz3OjrhIMPAKeJJ89SrMoVLeozIqKccFYjDBUQw8eh/cVi+rlUBkHNSLs6N4
         jZRNCaO8kP2F8AjEVVhnwCDTYGODFSl4+x0ok31VPz8Jv8M70Z4c23+q7FozfPgELrQ9
         7WeBjS5EeFILr17eSR4O1HmbE/QGBgJ043nHsF406BjhuF0diQz19VamMKNA8YawK/S3
         9SI3xzjgYKt9FeZDI68nxNTYQdKJVo5Pfn7i4E/0oS/pcg5+L3bg1x1feehO6z98q4hq
         L6OQSABOI//bJc5aMdVMT0Oxo86VqQtiQy6aoI6aHeE5iZp63SIks6odHHkC1vws7nfH
         0abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777363; x=1770382163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoR9Gqm/yFZjJ8eRAFItY0g4nyGdiEiUyHMrr9c4s8Q=;
        b=fODLFECn7slArQ3aSucTjdiwap4cN+ivQnHIWl0Q7TkX/yVaLx9jTvC3qoZMnohYaY
         cDxqwgjTYADR3Ra+nbRIBbDlUngpkCpzmH1lY7l/QsnN1TDZTWFnNw21HrEkITSl1sJm
         o0n+fQi6W0c3n2QxKL0awVbC2RLdd3XhdGCzEouIx9OcNnImYVCCS998OQYBM1Az4sPO
         92qG6YFtCIefOgPFTxAxHECrrSqPQ0cZSI/aKRGVtb3LfnfLLiDq3VymSCrtZnS3uUIu
         jR5kohW8FlrDRslMMhkNkRzrgZIHxxxowDtySK4zSoDuSh0Um+jKYlHpTJSyk3aGPGV/
         E+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsNbZMKrC9DFtkTZqTeINOsnCVqaa4i8sD6OYOp/XlOd9ZAUdqYKKN9NIrNQYOGnNlXTsbx8NCMcIQFkBx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/BpIIZZhxTZTbhWqbywp+kqCW5RJLcjYP9FLyDaDTBV+cHBN
	e1UYX2LpxI8n5rx4coeQpRruK0OClQgsi4qq4Nm8d6Fe2vL1w3PU05uGRkx1auLYP5FGYfYBxuY
	jyXs+3Jgk9/IBo1nfEu/+KE2WgAw/REecUCLyM+Dsuq4oM5/aNWCdK2Muec/3jCcxg+Ju
X-Gm-Gg: AZuq6aIsaVvBXU+4Zc6oEhJ7DPKSb2naZcLB78v/SKTvfUaHBAz8E57L/XNbJMiqaiX
	/VuCaArp3Iv0M5Zt9jq871FxOAQ/Yk3PWXlulEbFdTOa8uVNJQceLiDE+upBsaYZvINqoEJ+Nr5
	5p4mnJsKum57RYj4Lukux2u8+I1EOgfCdiXeYjxdV6/gNJfyzuvEMMWlTn7s0aVitkVLgmJOTd+
	Kmy0+yw3sWQ/PtQG8J24umLShnPjvatsgP/KSxE9gAKSFkIZ8Uc/+//aCWhi634Sbko2brrezkm
	Mlf50s5vttEFMUUMx3xBdzu5JoeIAArYk9I1u9WCwXoHVkH3lRXB/v6r76kt+ISWr162v1lZfxy
	kfBm5JplWOWwn6mDYDRgL+/AbATmm3qN6yyrPvBw=
X-Received: by 2002:a17:903:984:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a8d81667f8mr32460075ad.43.1769777363361;
        Fri, 30 Jan 2026 04:49:23 -0800 (PST)
X-Received: by 2002:a17:903:984:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a8d81667f8mr32459595ad.43.1769777362791;
        Fri, 30 Jan 2026 04:49:22 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm73225085ad.63.2026.01.30.04.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:49:22 -0800 (PST)
Message-ID: <906e19fa-28cd-acc2-dec0-7833f672602b@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:19:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwNCBTYWx0ZWRfX8AFbWGTszFEf
 TeLUs2dPbTf8sO80M2Os1ck2lpA6WgXQKdMmmMMm1EgXkbln1x4yDo0s2Yir6L3lfO+W2Fwv20G
 Kvjp/rE8JHdB3ZPrHqgdmm1drdT50PivRVDzS8KJ8ryCa7I/222sfWC7y9ASetBirCz6TBgUEQB
 xYLVYB+NhpDY9MJDfNAux5/bqHyd6FxjfW5H6PaUsD9R4d5VXGyucBrWM0R5Q5+7vrqqqnBdA0i
 +g1bYwbTQWOv9YwoyaKNZVeVtyqFDAFW9O5UJbEt2jJzwCcBpYkrxX30+2GBzB+FXCGP9pi8Ogs
 1Kb0IdBdo9pPmgh7FzNcEXz2WkvbqWagSrheO4Hu60mM5yo1hkG8Q3CJHE+Z9QQIqWacEeSN9Rj
 fbfXlWbFOrXoEcWa2hsvAfhezy2L0o1uXno1aDHG6LptLtceMfGrHchul+7+L4Ok0DClwMChPDi
 pWKdleh47jdTORvaEHw==
X-Proofpoint-GUID: Y4Q1TVG-GDgH0TegwwPzVH6DdWxqFooH
X-Proofpoint-ORIG-GUID: Y4Q1TVG-GDgH0TegwwPzVH6DdWxqFooH
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697ca8d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=UFr-MfHxuXdlQTEX4dIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300104
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91311-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1625DBAB82
X-Rspamd-Action: no action



On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> SC8280XP having just 2.

SC8280XP is also 4 Pipe.

Thanks,
Dikshita

