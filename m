Return-Path: <linux-arm-msm+bounces-79947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EA6C2615C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 17:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4612B189B493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D908D2F066B;
	Fri, 31 Oct 2025 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4a9SlnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/Hkq3+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A504170826
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761927042; cv=none; b=FVQWM4mXadBiCfa3+1ATUbI9IZrJOMKDOWCNZGRXVyapLCdXFJMkLAwcy9w1w8JdX7WwfyUPRk7NO3s3AVj/5vFBneq2jZ99Uai+42NT+0d3f0XTyxkqQsMTzY/al8hZcHcrJPcAhUaDh80xGdIZludEciYpnf3g2oPKPYVn2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761927042; c=relaxed/simple;
	bh=wdhA7KdRQdGRFn1ciUKEOu/xh3EZktn5vBtH3gZoW/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQ9RLt2YMhAu8iok7Uigz/7gLCsQd9JW98cN2yodnC80MODsU7dVNIsjIev+3PjCargJvnD+xbgAdHmq9KWe6g7QWg6cYrUcBB2++zxy/cTQB1cklSqDosq/uI/UDIOzovfUF+Sh8glljwW1Ox4nhITIdgNOOhqbjCFmKMvpj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4a9SlnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/Hkq3+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VDJPDS1827332
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 16:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDhfCaLas3av++l6wCRbWmRupmbim+JRjVNXxtLxBgQ=; b=E4a9SlnCoEi18la7
	T5c99HFGcnd8AI9AzQvs+ZzHViRXFQQ+fLddOw7fbUfx0MFO2F/9K2esbCqxLHG9
	WWGp3YQdflKN6aP81ZaYgpU983eF2bxEsWJpRv+xkF6Jobm+xxP7Pm7I2fodNarF
	DVO3gXB5cBdiuSueBTghS2ipsvdAIrDCvEC8Dfx/iBjGcUESsiKUeHtVhzX3Z5SR
	o7U48WNjj4lol3dlgJxuJLcCCL0LKjMpePZZ6vpAvppUSyS7K53MHyyeUyuYSXRr
	/wi1XWp0D/KJIhi2ElvG6VVDmtQ79zUxPQKw5KrRP/annSg/+P2T16X+BaZiB7SQ
	Wj5yXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11svgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 16:10:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6cd4d3a441so2135014a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761927039; x=1762531839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oDhfCaLas3av++l6wCRbWmRupmbim+JRjVNXxtLxBgQ=;
        b=O/Hkq3+Vq03XMIR8PDlJeGAsQeYL4n0dYzF8P+rZlEXaPajISHsBdLwBxWbASZcamn
         MaUvmLbGfBR3aaoEtXvC+VgL8pp8HM9V4T+iShe7O+dj5A6w0iloJJFJ/6xEWek4Tcs6
         7Gt27+UqiJ1c61UE0Ymejn1wFUtUMNYHFUkrkSmQF5jPD9UTlEyRBCPlxmAGQ9RI17EY
         w8Kh3lqvxUlzIdnXqtypVrtxE+bbcCgaB++dgrIcujsHhh87xj2tMls+5mIkk4NW2dCH
         GoRwd4SS9EnpbMcMjdIKmvseXl1tvWWpU/jhTCFWJW8gWWxuVMiR/nHipWR9QkrIx8e0
         1ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761927039; x=1762531839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDhfCaLas3av++l6wCRbWmRupmbim+JRjVNXxtLxBgQ=;
        b=thaLSgLXnZQGP+XcGRT3XJj0n0CGEywJkzvk0pHNl1Sgl+UWb4OtGbFF/ekqbpaOcN
         ZAUeI/NNE/slRJ7JBK3a/9/dceMFNuJ40l/SLRftm3ZUrsSGORDi5Om4f+QmW/ysLqDd
         B8c3LcZ1k5TTQmVHiOu9m/aPZ3M8QA0ahrj4l5CzVxR2UXj1tWYRMRCqhhPaPYxNUe6y
         WtzxNCXJclFQY/OewUJhdkChKRveMiJqe3+atrfUqZ67Zqygr/l2/Gyrk9yTmVFYY5Fj
         5SA2icDEhr9TYLRzoGJoj12D0u5D1u1ANz6eWJwgRltZZ1ugJM/nHIM0Qr8ouvriAQdT
         oEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3SILoGnbt30EtEyIR6XIBH6vF3Jutw4n2v9VD+VISaYxyR0GQ4F/BVq9GAgWnQAY7AL8dW4EM2AOa2IQk@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxhsALSTVbHTmC3C/0G5uBvs4XRo5DldS2f89sjCDLBdbw6hM
	MazaLEjmiSCLgv2qID0UCXegraHJHkEqBpzWE5/WSuzjnx55DCgAbGFrLmJbhRWvFILDu3PeHdo
	NyU2YkzrUP30Vrqw1r1qnckeMjHtF7PCgN6LX0tuh4PqhEkoEt6DEu0uVvOwgkGtd55U3
X-Gm-Gg: ASbGnctwQVgLN6GFK79VTZTKKDE06h9InIUMQdDfPGlYd/+hFgyU/ei3eFmUwXVpT92
	VYjTIwvmYNS0EOzGhAPeGHRVYSd4wGT2BxxFaXivw3hLiVCYWqEXZgJRlFsAaQiHKB689iQV9Of
	SwQdOMbu1y2Aq3f01C90yoYhXM4yBp3kztqH/gLbm9VTJebLCxqmnH54kLdwlWssL0DHfuF3IA0
	xgHNuG08wr3+oSZyZoAhU8ENhg+xRCEY2lOhzm3hqf2tdPOWUQtcqN3JuzRV6xLg+ByD3Vr94sb
	x5wj/b4WF4ZDv0kJ4lwWOIG5WkkZ5GPVK+Dwh9Jdnw7e16GseWimNs05GwfDsvNUphs8WxQtbE9
	GMq9vEZSdlHUmsACZ4Sjj5JJpjtLxrIFAyezl7LdNoE49h9fDsZbo
X-Received: by 2002:a05:6a20:6a0e:b0:343:af1:9a4f with SMTP id adf61e73a8af0-348b7502e0fmr6416108637.0.1761927038650;
        Fri, 31 Oct 2025 09:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwVdhGXO4W6ccy+Gs7nhmHf0xQRAxLoFsaiEkVtoeW1Wt9oOjMi8+GReoMdVleuWYmKRYOg==
X-Received: by 2002:a05:6a20:6a0e:b0:343:af1:9a4f with SMTP id adf61e73a8af0-348b7502e0fmr6416060637.0.1761927038101;
        Fri, 31 Oct 2025 09:10:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d71718sm2665414b3a.23.2025.10.31.09.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 09:10:37 -0700 (PDT)
Message-ID: <04645402-1e62-42cb-a8ff-3e5f8d852ea5@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:10:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Miaoqian Lin <linmq006@gmail.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
 <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
 <2dd26f37-7a42-44b3-8902-5c6b5492655a@web.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <2dd26f37-7a42-44b3-8902-5c6b5492655a@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dHOAAoOUFGkeo3gFrvdrqA58wLYjKSNR
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=6904df7f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8
 a=ozBfHW6_ZNkyg7WjN1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: dHOAAoOUFGkeo3gFrvdrqA58wLYjKSNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0NSBTYWx0ZWRfX+eg64zctgnEd
 6YIwbRGfvJp/fQFJnC8IsTbPT6iKAAv2HEgPYpoBU7Wf7nB/+uuJoN/um8nXbZTzv76WV4qZx6Z
 lbBuSRGcP4eZ7E3/tK2mPEwWAZhXoRspmruFJwVruPs6QpSHLjeiQeIzRaPRagsZGYi3kjr+a8F
 T1JKcKB5mR8d6BSW2N438NnAj9iMpHGca6Cb2febl95j61yd0hodMudw54+JkRR4lnMdrfHp4U4
 YFYMDbPMk4S1OwWVVgJ8D12TQhrdZZ8kYSFuko1i2bmdgMWoYhWSJibCWDY1NOSL3POf1QFWdS6
 9Z8ao5yTvpooZEMxpx98mgE36+OhCvuLRCDTZR2kHuoXzOQ6u5EQx0uxuXX5/a7Y5eCE45Kw40E
 DS88Wctpy7M3Y23QlrSCqXX2wgZe1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310145

On 10/31/2025 9:34 AM, Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Fri, 31 Oct 2025 11:26:33 +0100
> …>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>
>> This does not match the address this patch was received from, therefore DCO does not appear to be satisfied.  I cannot accept this.
> 
> I find such a change rejection questionable.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc3#n409

I received this patch from "Markus Elfring <Markus.Elfring@web.de>". 
There is no SOB from "Markus Elfring <Markus.Elfring@web.de>" therefore 
"Markus Elfring <Markus.Elfring@web.de>" has not followed the DCO.

The resolution to this is either the author and the SOB change to 
"Markus Elfring <Markus.Elfring@web.de>" or "Markus Elfring 
<Markus.Elfring@web.de>" adds a SOB at the end to show the path the 
patch took (reference the paragraph in the documentation you linked to, 
starting at line 449).

-Jeff

