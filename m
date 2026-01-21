Return-Path: <linux-arm-msm+bounces-89997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO1bFTq9cGkRZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:49:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB85641D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D139176BE5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B36D3A8FEE;
	Wed, 21 Jan 2026 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwC3yBmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjeFApEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33646364E86
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994580; cv=none; b=Wt18V9slqXlwuzT5axZTieroqytMsqK4XDHlZImSrjZcO7wSarKFYPFwokYCA7cRjbIwTeaGKNNC4u3y6O1FG+zduXbAHAQhuelsO3GpX9ktCYd3yRhHH9nICqTQy2HCxJfOueBxUkG9TdryHs9tBvcm72HTl2M8961BkpuWpcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994580; c=relaxed/simple;
	bh=K4FkRPwqs/OywQpZxPxlR4YoCX/WWHm/T35REgzhrNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJGHBN/KoCa7DLVHP9UoddDQ4e3owqusjcKGhbxJ/7CCvDjQsIMPhh7NML3yBgliESR8zgGoNd+Hvb9RLrO/3v6YcYwhcl6k7CojUUzNosxcogt3S7aG6kpL7c9qnYRraHhcxbPNfZQG5JqVN1vkDNI85FtjXhXMqkarKjkWX08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwC3yBmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjeFApEI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9rMK22840457
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwGy1vb/afsVqyKykpJ5vio5KbnOtSx9gyHaZSmP1Pg=; b=KwC3yBmdkxZ75C3g
	qLR+VzX3wr/bldj3ADsFQuG9M577HnzZT86irNkynMf/Rsle9a2tB5ADIk+OV7dI
	W04e0qFaQqtBBJiuM6OOfSJ3FhoAEZKyVlgMzyJl8svPKXctzsr813cOH+7dt90g
	U56zf3LUXdWtaLPBzr4+XFT0p2PgeDYtUPemrJHWqKE1WqRpD6tVuy6u8fFQyURY
	B1OV3sfec0nTJbqa+T20fuh5gW4oa20U6QsB9mdSki33gLuP8ygucDFfvq0D73rD
	5+206zMi0hft/r3huncca9rdOmkeWU1AJbJkMxzEQO0/2wuwC66/bnggh1ByiLSb
	Ar7IWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1ss7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:22:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so145534385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768994576; x=1769599376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwGy1vb/afsVqyKykpJ5vio5KbnOtSx9gyHaZSmP1Pg=;
        b=EjeFApEIJTQYj8Tcsq8r1Utd8Mfsbxowec97ZnBEOZ/9X7ekRZorREUzhoOFqqG+Ib
         A5gj+B9IkKxW2OQNu5+OlTYtQdCMzlfwEFpMZyQCW4JarDyDaq/QlMg2JrD0q0AhliyE
         HIOX+t7GYE2O1UghCWKf59pQdn9aeslHueZRU/PEGXfssx7Vo/p4fW1c0AMDM7uqaqMW
         pMjWLM6w3/+hc6/3Om/xClf67hzI3TC8r9ajfTx++1Ehw95Y3HQmkAI+Qgs7dG/NjngW
         +RK0wOWfac241gmpXXEny6c6b7J+2cwR7GhbagRVfkGDXlLf+sYgvQDxOg1chJi4cgDp
         CIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768994576; x=1769599376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwGy1vb/afsVqyKykpJ5vio5KbnOtSx9gyHaZSmP1Pg=;
        b=FultyKES/Rkk38cc6xc1eAIfD8/GSawIoV2X+FJhsSfNTfgKcAbykBtPHMALIWeBS7
         CCMncc7J7/VGoNzTXxOdCGY/SXhkquScCFLpx1d15fRPE62kNbG3HHODzxmbFsvjReLv
         /xzz2HiHgXWwxKO6bG9O8zRoPjzRQVaL/UTWSTXWfTzq+xxRXni0qd9JiPTfyEg5uqdM
         8+qIeUa2QGASuq7mE0+6ATGeuOxn2NIkYb/yVrJWis8MFtB+xuAQ5InDk+r9iWUGttG9
         tRI/5TYWol6nJtrZS3ABwXJVvjQxP7VTxCn3fL86+4XmJbxImw3RsspEBFxOlLZN+1q3
         PefA==
X-Forwarded-Encrypted: i=1; AJvYcCVDq4MgFTY/zIMzw7NFBoHldaWpfNbslIwSvWug7XSNIDQvS7i/1CxMWKejUnrQW7TJJ0eAaj3BRQUTleuS@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlhpxHlFOjTLawtc4sZpGlitG/dNpqT4faYF8F2QjdyFcebde
	WhvejgTyEq3Oz8cRAKiSs8acP5hcg3OI0uc7DG6gQocbksKGr3AytoG4D3GRMNesRFGtpPZEZCp
	c6qSB9qigTpH9Ulp3XaanKpWkXGWKTRU/5pUUx+czD3/ysxXlLBSrxbhJ58Zh48FAVLUq
X-Gm-Gg: AZuq6aJ0oYKD8H+3QLAod5s4H9CHCWNlr8RdyPG1stK4cgChyHjob13gWq60OT2SlBP
	RsZbVC7QyMINxVqeURciuZ1/yp9JD3Nkw2LpDfDZfXXtP60EOgz4y0S2NvbNrsv4DTPxTgMwJtQ
	o13IKY4RFeQzwI82Q4alIM++7lfECOkm5u6uzfvkQVXXr+C0vlR2CxkUJIeWfFrSjluMSo91soY
	S16jSjiNPCYbyJmzLHn286dpuYsjhVYClUkWrVzQM1aNwkitE44bg+qaC/m4iGqAryOAE7dQqxU
	7x9ZGQZNB0+L6ZbRyMPEvzzShLU6PKDFywP0E8YLT31TZKG2zA167tz6ZdebaXWbQ/Rhd1oLhHZ
	EPeAxH4aoqAa1Pk0F5SLbcFjYgEigHMLQk3Gx2MrsyIkGQ4zYvk9FTy2xmj9P8Y1CPUI=
X-Received: by 2002:a05:620a:2947:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6a67c6a94mr1641521985a.11.1768994576093;
        Wed, 21 Jan 2026 03:22:56 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6a67c6a94mr1641520385a.11.1768994575603;
        Wed, 21 Jan 2026 03:22:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cda145sm14661595a12.9.2026.01.21.03.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:22:54 -0800 (PST)
Message-ID: <c8cc5140-980c-40a6-a455-4a4e71d5501b@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:22:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NSBTYWx0ZWRfX/oiXO8WBaqBz
 Nu85HcV9BsZIQCKqxTli5vOs9s7fQdI2Z9wTZHLRQczAw7iiEYOU+7oS6FZ+YA0hgfUe0fziziX
 GN8lLH3AHE999NRYx0krZFR14AZH1fLVMHUTKF/Yb7iJ7ffn59gsZlz/WLZx2UjnDFPibXuMYl3
 Y4Tukq40VmXdkFuBF1twEt3KqXfcqkBD/SXFuq+wqZ4cYu9nss83+Szl+1niI+ENM8KPb0af3/6
 hqnFYq4gj+FshJfeUGHN9AOqhKzwX6wwsllH1noB/wVw3WE3FoTZMQuQmxFe/mCDehThRmFkEcp
 6hyLk6gn9F6X+y+1qvxiOh+eJg6PaXTninFhWd+ZRf0O3st7xUU++quvFgv91QRq7uudAgSZyyQ
 B/XJW0MR2eb5u3zzIw4o78AUD6Gmaa3QsZxhE9VjXvNj2CcJys8kLwjrtFUrezyU17uDi0Iknuz
 4OdhYvU5KkSAgHdA7/w==
X-Proofpoint-ORIG-GUID: XBFJfufo9NHpkPBfaZ9BgpYdai_c0YiE
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=6970b711 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gm9WW_mUwxRtEtLIGgQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XBFJfufo9NHpkPBfaZ9BgpYdai_c0YiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210095
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89997-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93EB85641D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 5:47 PM, Krzysztof Kozlowski wrote:
> Document the IDs used by Eliza SoC IoT variant: CQ7790S (without modem)
> and CQ7790M, present for example on MTP7790 IoT and evalkit boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


