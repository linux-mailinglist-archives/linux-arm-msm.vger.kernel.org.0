Return-Path: <linux-arm-msm+bounces-83945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFDC96C80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 11:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36ECD4E05F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 10:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51472F90EA;
	Mon,  1 Dec 2025 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o97fQFmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOgd6MkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CC30504A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586784; cv=none; b=NQfmggjtQpp0K0K3OK8quobODwzp9KQ26ReNzgWijTYmQXJALGWlnwrK2nNC2V8XseTNxnWliHJ87e1BpOVIcYW82kqBRx2NSZa3UxKrF0PnxlcRbzkNMHh8RT+Ie3iT4fmO3QohZ+qfz1CmJr2fqMPNB+KtPdgjjmK8tIaOgP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586784; c=relaxed/simple;
	bh=ZRsAnAVe5nrAGb6ovG+MsuQzA7r6lxjyBMjJZd1jnoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aH+u8LLNKoADfXEuZEdQpmm/dKktKG4qWDdFp7/+i4DxS9u32IgYmtQjz34INNLB9GxEtG1HZ4cT6Qtng6Sbigd7WCjeftST4yrPorqtkVV1X1R7uXqd9bq07eSfaZfSMKiZMWIBusbyXCWw6jKxTgpPZ78GaAAD25x6Ek92M0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o97fQFmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOgd6MkF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19ZwQA451749
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 10:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2c+Ffhp4nOSJTJMkIpqnlkvNRCAjezekaTTyr/bZReI=; b=o97fQFmHgiV+uSBA
	DJw3GOhGEWTBq6BpTvQBq7zUo0C5uTb2qJKXR7F30ntJfEsPm2w9NFkV86Ik5CwW
	34/j0xzkdXzUE3IIjwdbxECLTM0BbTBRdWhdLgFxyho/xG6aZNSMvENnGXXwuYOG
	9U9Hcf3gLQCnsfk9wfY0TBqMGhBEPrhI6uFXkF0FZhF2uQX/ajEnPqzKnTlradRq
	czHEIK1Eq+bxsJfBg1bg0iKifq9sBpaZcMDvm63MuMIqTLKLV8MgxliGnyx23NeI
	sTHSSwaULSwW/+ptKP85b3hJzXPYBX1Y6Sr0oblk5WNPJEqzIa2MGZNKjkPoJRnt
	GGa2Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8her7yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 10:59:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b29f90f9fdso76047985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764586781; x=1765191581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2c+Ffhp4nOSJTJMkIpqnlkvNRCAjezekaTTyr/bZReI=;
        b=iOgd6MkFecr9cKJ4uxIGQWoGAU76cpfCvUW4V1HG5Vzo9VqWvdq9rvaslTijnyxxiW
         Yj29ii8/onNC9WVWEUcd/dUaeQfVmoYukxZ5Nm5iNx/iRiR0nM5SYyEHO5ZM3f0gnF6J
         WCO16TqlXpwFK4T3zcOjnIgeQT6T9uQhCZvzsi/Ll0/f2nRPIMdKX0wPtY1EjJolf0TZ
         clXnL9UUGoh0u9u0ETafH6muJav6SUKkQds0EKge/DNG3DUeVYoy0AomTOisz2tGRTcq
         R4lSpCla+ZTlBzxYlVh8bZtBMlD6nemHmAwo/nMQavtN6RKcYKHGVYmqNnmgZvQxmcXt
         erCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764586781; x=1765191581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2c+Ffhp4nOSJTJMkIpqnlkvNRCAjezekaTTyr/bZReI=;
        b=VPw85puZNgGkqST6BySQJ4eGA0s/HcaoMV2u4SOKmCT3bvLBInL0kOCbKn3Q1zBnD7
         nwHB5kPlFuDT14bPQ0FJGGSeN900zAnh3ykwt27Gf1I0BFXVhdICpj4f03O+/njLl5oT
         IlPpCpwmaQ9j+JJtDa0Jaxj9Xih02s2iaHA93srglqNWQcQH7+UWUKlDypSJAw/fds/f
         IZ/L/ljBBf1UJcJjwS4OjiPAsXOS7/JaF5hE3ZlkIc37m1y8IJYKkSNYG1HyrbPP+v5X
         nE2qd6qDn1fOs8h0B4BS0Lybeb2N6Z1zPJIUZzd7MJG576pyhFzIPIMgXwFZblzYb4Fo
         oqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAE31yHLhgVPGZziZI8Gm9xfyJc+TyMXgGBKhOO8ZzroQ4swiVURFYFfDiMF0+dzmOCEuPc35qRbRPtJNk@vger.kernel.org
X-Gm-Message-State: AOJu0YwgDL/b7Z7V/Kzoutctqvig87cGWZWJxP4lSYrmBhEvNwemu8kl
	HMhLTSjGyQUpLZ7WiFos07AS00zglyrtE8hvlMrDZSk7254vqEC3lYvEibFCIaczNpNj71ST4zS
	k+0YiCgMlGnGuRax1BcK0FSG/Y1lntBBPtPGbHZ+kkG3SaycuzMsyjceyU0IRpUxCPovW
X-Gm-Gg: ASbGncu2NKv6YKcd3zZleS02dJNdLXnUpcgOI8BSP2zlMfGP8gOEXjG62cEuDbj4egt
	Fygj3t/1pTUXMUxzdm5aA3uFIt6EqN6GWN+d6ew3uDixy+SYqS5zfD1a9afoVkSaGjJvFOvsiS4
	dMbAFEp9Cz/0OiXVtFN3p1hEd1bDWdKunyZubrtGj9q8BtLXiG6s3jcB4H/JvmcIPL1cU/aYy5T
	/KwCp0iThsy6lTdZOYdMy+9diGuYjnvdq5HL8ByBVV9xmRXEunG9D8ZNRe6yx7fgFggVVt+/+qd
	oluP5fxKsDPUSoUSKLW0j6gdGExqDraf3IZ+5uedZ7FJiCXUMdRhEPi3ZGq6VyGiQnudIKXt76p
	mdbnnacHeD12M6YbKTArc9adUs3PHtxUpbCnHKFPXUlx+ZzEUE6+f35AEp3qzjtgetRE=
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr389386381cf.8.1764586781395;
        Mon, 01 Dec 2025 02:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzcAz6lnqni0OiVA7BeYpFQ8kmZk3t9z8FC4vAg7GbpyN5xeNg6eSwVew0K9ygYxkwJBUUuA==
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr389386191cf.8.1764586780868;
        Mon, 01 Dec 2025 02:59:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750ac0276sm11886760a12.15.2025.12.01.02.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 02:59:40 -0800 (PST)
Message-ID: <d0323387-df46-437a-bdae-719d142ad61e@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 11:59:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: Use guard to avoid mixing cleanup and
 goto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692d751d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6rSAO90NPIHcuN6HuFQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xjrRQjpJoFh3AM7C_QbyIFbnJA8mQKG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA4OSBTYWx0ZWRfX5L0ymzXmaOK7
 TZamqsa9Ve7vs5MalczODZHJm2fZYwWqN2edg+jifvzQOHDthIuaVrrkEDgEhXT0QQzHI04iIql
 Dd8S7dGhmHSMS69MCSr9N4a6YyEc4deTHnK5+6D8IrSmu5cTSktHFVUBTADcRNEVTYRthWFTo4M
 ylWi8/hALn+TOuQ9klhp5IbULsnfrgInaTBvWDZCM1J8fY8/Wfxz0ghlF6FmSHlExLOKW8ILFY5
 +ov2W8O2YmatQ3y59lNU0uXjcJ3ilEatoi3kL+rEgBF2ELTtKjLqXWJRHttsUKw+LZ1ePUWQNrE
 INZ4Ekmc8ZklQaQuL0Tz3pAP4NFpH13PVLteZaumCP8Y4T5iO3L40hM5juQGylZg/Sqbxb64jXf
 5GAef+LAfjnaLufJs7wNvMy509oCCg==
X-Proofpoint-ORIG-GUID: xjrRQjpJoFh3AM7C_QbyIFbnJA8mQKG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010089

On 12/1/25 11:26 AM, Krzysztof Kozlowski wrote:
> qcom_swrm_stream_alloc_ports() already uses cleanup.h but also has goto.
> Such combination is error-prone and discouraged:
> 
> "... and that the "goto" statement can jump between scopes, the
> expectation is that usage of "goto" and cleanup helpers is never mixed
> in the same function."
> 
> Actually simplify the code with a guard which allows to fix the
> discouraged style by removing the goto.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

