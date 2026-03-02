Return-Path: <linux-arm-msm+bounces-94864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLz9L3RspWk4AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:54:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C81D6EEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D22E30094E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1589356A12;
	Mon,  2 Mar 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5RwGYNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUgrFNn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5B33DEE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448670; cv=none; b=ToZU+8z1Vqg1UEhlWF3VnOQR1u+mZL/FlTAiwU6TUvqKppgc+BjC8VJPvtYZ6GFNj3ynUAhpiOP6Nbwx3v+9k+AZ9EzQ8XPO8aXqcdu/4/I0P8NAMAmVRW4AVcZnVptXtVLsziM90CbvjvuTacXW+bXuHY5E/CMOhzWYBUR3pyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448670; c=relaxed/simple;
	bh=Xan2sp5Unx0bPGsDuyVyevUS9wrfj0OnwMIJ+imtTNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcj5nchNJ3PxDmYzStbcP8jLVDdNYWgm+fMI3P2LevlBMcR7UvCJsLk2XTDgTmhrMgDG3SdarYAJzeNKptlR+g78KPsH29qMB4AlLUNXdLH7O9LOLJ5/7HHteSZdajGRY9JObI3jOH13u0LPxyxxdYOvRgiikuR3Mf6r4FYwDyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5RwGYNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUgrFNn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62281NBr2342009
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TW5XzJ8Z2CHrEQieBmz8WS7yy3jLI1DuwaSqa7l9+DU=; b=n5RwGYNBhbdExBN+
	TYTASXyAkIjViFgEs3eYEhh0hR/gVBFp9C0jFq+ZDAnuz9fybfRH9cQ4itqsrelJ
	X1PXqYKINF0lpTR6qUxAAIKWzkgVTxuX43BKOkT5j0uDYZBZh8FnifwIYipor19J
	yxMjcB4YaGRjo6a3pClduyc+7LRWhafrmf/mFUg04u8XlEQ891MfZB35/iCRX0pR
	HLFu2yT6CDAGAxtyrIWQ4txC9FMzX3XPW5XrS2UaSSVKmx0OhOCm+r02Q1Hg0tpT
	v7OjlZ+X34Hv2Vs4r9ygEd5T30pQHMJw6iyehYA8+IEoB6+TSWi7DzX0EPH84dl5
	rtU07A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd589k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:51:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3597b55adebso1175578a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448668; x=1773053468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TW5XzJ8Z2CHrEQieBmz8WS7yy3jLI1DuwaSqa7l9+DU=;
        b=gUgrFNn4l2Y4Rr6N4gqRro4J/QMh5pOsn99GnT185aQGqlMxxllMvzU3SwZ7HBbZle
         o3pGJ0Wr3oTQiInCo6aWhamdvIIELgxavJiueJfZNZTPmyKaF2KQUZWRne6tv4zhva8W
         /OlO/uLqh5xFwAxTE+23d3mE4//CJMZqOzjwlWujuYDDi0mSX0ZuLP99XiqRHZyPVnot
         WjsPjxr+vc9BZ/WmOSz8w1pRTuoTwXE4IliVOk3NecBDpvO3MZ0CS4YLNFT/NL6MzVcR
         A2RO1coLpMZI4U3cUB4L3mO9XatBIhgPgmdukmEQ9MnYaao56f7FSaFJZCndQ+eAXVwN
         btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448668; x=1773053468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW5XzJ8Z2CHrEQieBmz8WS7yy3jLI1DuwaSqa7l9+DU=;
        b=w0VDGhYwci4vhhhnDnUBh23Y3XzfRoOaEmtsO3f85la2HDcB97OQ12YB5wIjh2OSjl
         ASSxV9A4L40szhc7xCMSqBIJO/7zR3erylEwA+a7DY/xNveb4r/89bni4DfI4Rn3d90B
         WUldF3z1gNJGJ2xNqSsSstCdCfGXnRsmzjzn6rGnmNTD9hczsB9maihtgXoDtybzu9np
         W+aMNHiaUNY+MlQfv+Z1eiEWujSHuXUcT2jOTQwxytH8qjEKAk3V+VIwXiGlReN3YR3w
         MsYaCuvmKwKpgbnAa1HN/DbsmeWn0wRM2eQHNcWS0minIREUiaROcNzK0olePPyocpo3
         BJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNdfqEHV70AQ0RcBMCK+LNbt0FILfeO9kblm8anm0A1iogAFe+7vpL2hW2slWDlD1ignRjp3MISojcIrb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxttqlXvtAw9SmYqN2o5wa8fVh3/OInJvPz+GZDyifya2/oUdz1
	JoKaIuvmAuu2JZVI2jqxx7D68SuXgNuipGpE5W7GaJc3/iFpNtdPdAHm96MgLymeKUtFJgEjgtQ
	iqxxbOW2DabgEXFQbXFsQZLcohvyrPT6JfS5qMJ2RFI/ABZtvFFQXna+hctqkhwpUew++
X-Gm-Gg: ATEYQzyGU+deqCGPI02tp6180DeJnqsSbMIab6YZ3n9Fr5atSeiD7OKjvUXHZH0Vn0U
	/BfEcmYH+SJIofSCsx8kMdrNAAqB9pfnQ0R5byA2MJDWIFRZsc+VmAuB2guhgxSCwWEGrRti/d5
	oaRIZE73iEtaBETJ+GiTs1sjI4xrP9Nrlsibau6gshlvOmaVyf9l2GaNgsN+EF2SiG29WDcAPC0
	4o7R0IneoVx/Z6e+snNfCWx4qmNw1ioFXIXetxW/etAK/VxUmpiKS6VMKyq/VT7igeHtrCAyFsO
	PRCHvzDjdM/+j75ayGOScwnoV0bnnAXGCiq+mhui6WriEOzubwK3MX7VPrVOEuFCWMmw7kREE8B
	IFD+zGtPZ0Eg3iQUN7hCrKz2a2N1LtX8smrx8X9qKrn6NK+1j/XQU/A==
X-Received: by 2002:a17:90a:fc4d:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35965c386e3mr8793225a91.5.1772448667648;
        Mon, 02 Mar 2026 02:51:07 -0800 (PST)
X-Received: by 2002:a17:90a:fc4d:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35965c386e3mr8793204a91.5.1772448667161;
        Mon, 02 Mar 2026 02:51:07 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a03fbsm183069735ad.43.2026.03.02.02.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:51:06 -0800 (PST)
Message-ID: <f9938ff4-2ef6-8ea0-dc31-19e532b08ebd@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:21:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: fix QCOM_MDT_LOADER dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205145623.1360105-1-arnd@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260205145623.1360105-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 35VXr3_b9Quxlvo-WLAHzCAZ_oUKGBnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfXwM+tjgQlDE/y
 zJ9ACYNsFZTy/i+l0+6Nz3tzKkslu3juOaPaJV6P0ciWqxiK8RUZJ7XmSUXP9pgeC4/9WigoS3j
 0ZxDjxZNWnvuZO4BtnJNdiAhEfsX6CQPxTUQkUbdzl5eccpIoV4GAkdCPbfTzFS409I8mbbRk8u
 K2SsL0FlSEqO1l21cr15asfztkdBEZO5p+93KmvvkVaZrykhkr3P9MvzTXpdCnTqH1OjYMz2C98
 /c8x81lZtnBgtCt7hyyDXhkGaHQl+sl66mwKB/2KD0g9t6qmyj9kM8wUpnXXBc9+fXpeL6uvXiq
 b6t4g8EmeGUah1fPUpV2vJwBklvx4rfXG2a4QVn9sDmRdx6INYX++JNMd8IyCUS4e5+HYJqTWOz
 DJLPoyDEQL2eRLSAbRx0pM5dnP1XoEcQ6qbL1XJjfMIBe0HdvRiwsch2sodvYDOX+wAPAt4sLzB
 pnY/IF68HFqRN8UPcqw==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a56b9c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=beQPn6Kv1YGn9YLEiWQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 35VXr3_b9Quxlvo-WLAHzCAZ_oUKGBnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94864-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 388C81D6EEE
X-Rspamd-Action: no action



On 2/5/2026 8:26 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_IRIS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_fw_load':
> iris_firmware.c:(.text+0xb0): undefined reference to `qcom_mdt_get_size'
> iris_firmware.c:(.text+0xfd): undefined reference to `qcom_mdt_load'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/qcom/iris/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..5498f48362d1 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -3,7 +3,7 @@ config VIDEO_QCOM_IRIS
>          depends on VIDEO_DEV
>          depends on ARCH_QCOM || COMPILE_TEST
>          select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER if ARCH_QCOM
> +        select QCOM_MDT_LOADER
>          select QCOM_SCM
>          select VIDEOBUF2_DMA_CONTIG
>          help


Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

