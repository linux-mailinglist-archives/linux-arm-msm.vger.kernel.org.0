Return-Path: <linux-arm-msm+bounces-106653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBvYITzC/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:00:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 864734F5681
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D8513013A9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A92351C20;
	Fri,  8 May 2026 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVW9eVCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrvUCN8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BA3451AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238003; cv=none; b=cV1vvQ1r2WEjCtpks3ZQYrK4ifBM/emk6j6Jzlst5DSSZ+eT2vtHmI9GBPUv85/Pq/oPvMu2Fe/nZG0ciYYdyiJQ8gjqeYF/w80K8fFqq9vHkR2ck0AlMgescluvRKUAfY+sHgMnYVBB9j42/i9gXYvZh4WomAU6x9gZrFWgkRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238003; c=relaxed/simple;
	bh=L5jpUNwBaZZzyNBxeioiwQmFHy1H1ScehT/qCt+M3V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zt6IjmlX1+C4xnenDBDd9Obxiym3/aY8WpqqX09OPGVgUYL8ArsBQcMftDeRdmimHJy8CVZiW7bHl/N7k206GDfyXEwxogIvUJqPJLhfbP/YE6GkLawmH8k67+zhDvRg2iCFvAK/Qh3z7xmzOl4FpS6F9DBYdqu/as5tM93H0pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVW9eVCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrvUCN8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648A5Xfb2182882
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bYBkyo6P7DuWHbTI2Wdk0OBp/BCK5aUC4Fu7EK5LHg=; b=EVW9eVCXTI2/qUbW
	To2YMMr4hIyat+sH/xNzOqGc0fAmclDhN/KzqpR4o6ooEQtDsXp2trM3jdfL9WCG
	/4jBXVrMG9zywGfp6s1Mmj9SeubGubNOoS8vOlsVtDRm/n30WqS1gAFAm4rDXXox
	yLCQaBee/XMhDO7cin5xVU4h1H7pCyVCkWP258xMZCFfqzbVq1wFstzvidP8eVOk
	py+KZKzqpLQl0wjjxbehtY5nT/ixY8neWe3Rmi9pSDV0EKFl7bxDAwzj79HBIgrG
	1d9r6CBw12rdM2r2fjDwhinSPHKFoIAryLO0Z4VjQYO5TXcr7poR8AhPS4D0sPBP
	xiLi1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb1ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:00:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso49289685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238000; x=1778842800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bYBkyo6P7DuWHbTI2Wdk0OBp/BCK5aUC4Fu7EK5LHg=;
        b=YrvUCN8n0ejznD91JFWrXW2R1p+dWStmQljzoL8WsSjFDa6DkjMhtkm5lVUOK55xmt
         0nqvjuLMZx68bn6v3C2KpOsx/AwylmeLKxAr0jj5KnROvtXdT+JrRSmsX6iC+whKOwHu
         DSTPhV5sFLiWF/dx4j8TJSBhe4lCVErf7qywFX8XkIbDnkvLGFhfWVOWh7kFUlOJH3O8
         /tyTh/RpXSzGfQglCua6bP9pCQornczLurdS0rsE8dcz1S+FdFdZ/wKsdDZm7KaviFWG
         y9p2o9S97unuAEIuHRCOmd2d3HZDqONL6wxN77DE12ZP2VetuSeRRY/taBnpu5umE8w0
         7ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238000; x=1778842800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bYBkyo6P7DuWHbTI2Wdk0OBp/BCK5aUC4Fu7EK5LHg=;
        b=NiaoncluFKUiAYmh45vW+a1FrzLympQRS1HOkA74zsPoWrZ/QM03+yfdKniAYwYlMQ
         87SjWScVw7wZC6+rzBemHY1qot1twCkUBWhLMEfSY8jgDBsxw7WsAWPl+Ostr8cxjyYs
         cqfSrCjnzkdoNvUtgcYes6YB8lSYQxpXCK479n/Qk6WiROB8ZcDwiErfZHnVSb0Dzo59
         U1XZOXNYzGcKqQJFvUcQqfslR4f7ZsGjs4loGTWtMn+CIWnN5pmpR8Tced0mREvl2ESO
         pda4JIBfu1Tkn0mJaqhZhPQTSnB2iurWkWJNDLTpFoM2vZuvyq9kRslrC6ZfTXyz04EL
         pq0Q==
X-Gm-Message-State: AOJu0YzgxA+PDcCYY0x77J6hTcuIIal3PrqaRxxau1Hm65doeZYgMj8Z
	zk7yoJEavhhUXrez4udQ8oyGReWU4TdzzCcDFAr6VvJ7LlnketeFPBveoQr/3Ie0Rb6Wh6GTQvA
	DTsKuOEbIluAuzulA8WEXyXjHTi//YibsUIckycyUT1nAo7lOf/DwhBOQ2RFECkFRyZmc
X-Gm-Gg: AeBDies8w8VDOG+TvXsRLFd5yk/v7fugf/qo49nWPlNXKPtAkOqKH4a51AbIGjy90A1
	8fCSzoN/LLFmKHbdQ75UIMx6zf+fdZsIr33n/P+lLOkqukpxE9EXOg1zhmm0Evgos4v/DRsD+Z2
	1zgQMHViRCdZZi5e0rOJ5uQvuOWu4HPOX3Rf9OTAw99GcSii4XezszQDSN3+YQRQSF1LJvLU23Z
	lAhGMGt7pjrEDcjvtFOeg70rxbTx/0FcLj+tqHX3xAaF0S03kO5hAiVWhFrhplycrTgwAygR2GY
	HlrvVBDfaWDr7jREb7a5Z9CBD0ArJhaX9ih32Df5x+qrrrVXkZ+Ip1wwEAtV3+jJ3VNzJisZ4cN
	foQCVlUmQhNapbadFVkafNgYWJoSrhA3QJDPvTYMU1xmwe3ehATgsrAKFLFEsfN64m0R3nXcZ8P
	Xy+JU=
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1128996985a.1.1778238000406;
        Fri, 08 May 2026 04:00:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8f0:7516:da94 with SMTP id af79cd13be357-9051b259487mr1128993885a.1.1778237999920;
        Fri, 08 May 2026 03:59:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b9ebsm517672a12.5.2026.05.08.03.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:59:58 -0700 (PDT)
Message-ID: <3973a67e-b7b1-4fe0-a907-0c806ddb35e6@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-4-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-4-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdc230 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: bLKydjNHKgPNhjF7AgJvgMGLYUeGFacT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfXxbhXVxtfxa+F
 CypoaQkpKEpg+jKYb1CC94Kts8xOedXykRm07Z1jRyCj+t2qonNskGbhhmd4Q0xm0TZDeSRBAC4
 B0SFwaVwVtCWdIYL/CjiDZb7ZqqfRtYKg8f8ElXDp6cOVu0VI8oN4WzOORC5xg2fDILQGm20TTo
 BSXsCf1TZAjMv4LT9G6RtTYGScp9oAKBUisKsaIk1GofH5ao2A78tisU5fA+BuMvaMFYl5nUNHE
 w4tm4/7NoWUlS54M7QWPd4u283SKodp+1BIWSKEFPEaJUHcreaM6d246T1Jdn0BF3RBiSYvl1nh
 lY/cles8zT5S3YO6mzlSH3ffmQ31NOZxbDECR6SWdv3NYUE2Q2JJhlwX7gRbR0woTn0p6R2Mabz
 xv//PT48iiCMqDrLESw2v6ZOCxIf8sWTnJJ5IS9h32OapYeGPF1pK5rBzZTjE4c3aOgDJaN7Qur
 4kzwTKM8MvD/zlAMtEA==
X-Proofpoint-ORIG-GUID: bLKydjNHKgPNhjF7AgJvgMGLYUeGFacT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113
X-Rspamd-Queue-Id: 864734F5681
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-106653-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


