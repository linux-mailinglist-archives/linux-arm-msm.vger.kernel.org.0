Return-Path: <linux-arm-msm+bounces-87298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC1CEFEC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 13:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1C23023577
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 12:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC42C1E1DEC;
	Sat,  3 Jan 2026 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yz0s4NPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7LyjEfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DA13E41A
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767443921; cv=none; b=qYTyWi4XPLyU74EeUrnTosq454NdFH8zLhhuHhxV8elm1NUgD//CjXRR24WVGmA+ozxpHm6UKSmDTpnS/olCAYWCNJRi2CX9XOpB0dOfFhrMYClCoyAFm6o74PST6oAK5poJyPL8hj1q1VH1bX09LqFzlxwRjRUpw1fWXMp1tnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767443921; c=relaxed/simple;
	bh=4htUXGojMQA88jExOZmdbcfB086K1N9ZciZUecN+H10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txkevL3LN7wjqWjV+65dj0vFjhPt9Dslk/l1KoMsLbX2FaqNCoHPVF5F+8QQI+vtqEHfwWrDlNImqwL0Y9t/3tuRbGjryXvo3fksFwmLs21AO87E8ivVlREq8zbplp9axh24loETHek/9vcjuqphke3rzdB7Qe/aPkUW9eYayOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yz0s4NPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7LyjEfH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6030gSxw2338781
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 12:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=; b=Yz0s4NPV57i1ZihS
	WOCh9vS4i7/YfLg4vzngSjQQ1FyRqWGUBiQKZyIGWY10ynGkAEJaykPWezSCvNGB
	U6tJdCNZ33wJDwNo94DYojZkqfLa9AbRJHjPDnPkFGO3fB3g5uldqXrrvIsG5ifR
	MKaHAJOmuSDZdlPQ2MjHbq2iOJeGudLZ1+uisV8O2isuXBh1Mz3vs8wl7MiJqV2x
	br5BOz0igBwnRYismktwJ6yAgbe1+mLs9F59cffpP3ZlMfoquHg5WmhTueAtiaup
	QorhF0lqH07OxZF6YuFEgRZKocVX2oFtnPBJ/8DaetIeMprqNHYpcUX9zqNuQ5ED
	eQd1aQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertcgry5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 12:38:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so16278871cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 04:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767443918; x=1768048718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=;
        b=d7LyjEfHkdxmZy5m24AT0bca6PRSVv/S5i68NW4u2VoPkr/5T7ISIq/RcRKKojLz/V
         S/xFtfh3uQAaDzfFGxB3ZJxwhL5stCcepsh6BinACwwli1G1yQkmzxcMDMdDuogml2Xf
         QEPxf3XtaRAln8Wc1AVpOh6uYS0k22MvgZt4PwzSPYZtEprjS9QbqUOxJRcM+Gv3esOI
         xlFN3StnJWk6G+kMrWd6wNpyC+XHNO+5FW/Tk7pZQ6pPvX2Y7FSHfO5weIrsTrxgZsHr
         vlesUn2q1Io9dYotn1r77GFmrs212NWwgdmSjnZAY8Jq9/dyu3zLx7xod+6WS8tgfQNz
         gzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767443918; x=1768048718;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=;
        b=JTfK5o/qeMnc7Yrd0nKWDwPLO1lPRmhwKsNqPHLF6vMNmkVKwVkcBXpPeM5grmz1aX
         xhDSz6qqnRX7Baq0zoJpjLFt/UMlAInkFKg1S3eIPDQKAE8IIvqjYr7D0wQ2R7DluHSQ
         UglSr+mUQqQzMufkaLy40TO21CpiPGkuYVFoWfPxAmXwTzBndo8l17o6eUkny98vn4EN
         ROBgqGLNCs47fl+T9C6QcSNkrVlKwsRIPTDcg+52UaV5YRvcJPAw6H+bv0a4yoEmSpYo
         oIquE+GT0I1BTaYtXywPiGgjuOvwm2z8qHI7Tdx0znzluH6TnrF9eVqbuMC1J/EKM08z
         lLSA==
X-Forwarded-Encrypted: i=1; AJvYcCUg7oK6V8SksHx4G6J/4VTK8uLbFP8LbhkPvN5/j/6yafNUkIfm21iKU4eEMlfcVykzSyUBm+MIe8/FOXSb@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAQdGAhsutV/Akk3ucnliz9bR3bgvrmcd+N+WlZQbawq/ymN5
	gZ+nOS/dinp61jkNJQkEGwLt7B6mUynaHZIEmE/CX2xZ/4pdbmwC8cy4ZnVKoqsqBdNR0gLavou
	h4uPvmiaEEm+1d2GYopHfnePuYMv06rf2cbOFWHR+2kzKgNPTQRaugf3JcILu23cVrn8c
X-Gm-Gg: AY/fxX4FMpWTBGzHlL7p4xyowjLXVAud5ynotVgoULV6AJV9RcSYZfyYnOVfpRzl8LL
	nAjH7IGGfwbGmLS3j6seT99dnNAbo3EkoNTuBrM+U3sU+ENBXybzAGptOmaqas6rzAU2YyJOkS5
	B/TXPo5zvzys14bB1dBgIlPEKxmdly+uz1fViI3TOLrEIpkxBpyALXJchhTY/1cbjSnUP9kk18t
	zwroxh8QtEgvwXC1mZlwbGlyjZebLUPOkstaewanyuLTLvC2IKuRyEDyIIqbJdLE610PyIajZYo
	pfuMRPZHS7gI5LIcw243PS53S4dSE+XqYLauy6nhtT6TX7LLZIGzVYOQD3G9fKQKfP+kCyXq6RY
	h8NbS7tR/ylQTOUQyqh/IbK2pJUDxsixVDhZ+yg==
X-Received: by 2002:a05:622a:4d2:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ff472d336amr38212161cf.34.1767443918465;
        Sat, 03 Jan 2026 04:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+IkaHveGttYEdIkr4gj7LQeV3maNqbEyN4ReCR0MZJgN47NujIPEtRPhCrd9cYtAzFyFfbw==
X-Received: by 2002:a05:622a:4d2:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ff472d336amr38211751cf.34.1767443918005;
        Sat, 03 Jan 2026 04:38:38 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60551sm5054037966b.5.2026.01.03.04.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 04:38:37 -0800 (PST)
Message-ID: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Date: Sat, 3 Jan 2026 13:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <86a4yw87g8.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yGZ4xKiOaGo2iQiRxqhY7hkJYS41bR2F
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=69590dcf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BVFu3abGlNSLOwFpleUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yGZ4xKiOaGo2iQiRxqhY7hkJYS41bR2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDExNCBTYWx0ZWRfXx2HnY1YONsRN
 Em/XZ5WQO9OL7NRElt+a/eyPqhBlhBvMWw/08Y7dZhgf8KtOz/NlvOPdxg5dnlnWD2WfvKdslHh
 t04Q6qWlDFjFONCCbga2hmkOuQDdwW3mKblhwmE8jqI4rU+o8nswG1hblGek8wAtEHYzM/mz2RG
 onfmVCP99gzscEOraDHvYNnbukYnR8E42fVHot8afbLVATpcintrPbFHlbo5Q2jHonwBagW4BNK
 rOxBoGVxazkhd6j+CGKCLjU5/cStNCZLZSQsz9RiPS6yuxkVFxKqZWIF7inPIx4Z8KwD7DcQ5/G
 z96XsIeungbTZ/KBbyAMeKMIKHU4do6icxcY3C7oQHhQwmf9dCv0pmhV3LSE1LXU3QIsaqlV9KF
 wg3eRRt5nNKBreSUC0el0lOkqfmvub6OH1g9D8ex6ZaHzjY0Dp37Sz7MdRq8socdlHjfjLbgTd2
 Yk7i7cUd3wNi3NaNUPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030114

On 02/01/2026 14:33, Pratyush Yadav wrote:
> Hi Kyzystof,
> 
> Thanks for the cleanup.
> 
> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
> 
> Nit: the commit message is a bit too dry. I had to go and look what the
> difference between the two variants was. I could make an educated guess
> by looking at the patch, but still.

Really? That's old and widely used syntax, replaced so many times and
sorry, but really obvious.

We should not explain core kernel API in commit msgs, except maybe first
months of usage.

> 
> If you end up doing a v2, a one-liner explanation of the difference
> between the two loop variants would be nice to have.



Best regards,
Krzysztof

