Return-Path: <linux-arm-msm+bounces-79835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC7C2421E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 250684F6627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1AA330B2B;
	Fri, 31 Oct 2025 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOWi6KF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sdvu7OWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460BD31E11D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902490; cv=none; b=sGke2BEDO+0dQW99L1jdqIhVbPIFtLE+tZZdI6UsMLud2RblGxReL+iXXhQuGc8+8L6CYLbhBMwdYoDUaDxK/sGlnWK3GNhQK1/OpDFEhqbriFc8adqhm0QjebOVgHZa1l+ri1sCH7dXqLyQY5lTG1pJHP51t2oEYzrq0vPeHEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902490; c=relaxed/simple;
	bh=w8yfOd60KDdKJreuFqthqsd4fR7/UZE2/5nBgUt6onQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjqKM7MLOgogR0xSS7D7ePMGfYl8wPKqi+Cq8hRYlbb+qZxRICVF0reK9SHuaaTEWeJi6srZhlVtmJMPgDx76Ek/f9eeidIKTCbXv+VBmVbn5xhJeDxknn+m61NCEmbajKlNJb0Mcg6cVIbBM7Y7AwE4A6N2zOwO9Iw6rAJGRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOWi6KF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sdvu7OWO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8kwOY898142
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gAPrC5tF4vPjEpXPBO+URBh6gx1S2+j2eTdd5IbfCM=; b=eOWi6KF1gNtTSuYt
	DmYPGZ4NdfZ1wmCWN1MdjC9u/96ET7d3GSgO5A48EQyJT0xiuHJgoCfF3YlK2z6K
	0qBqUReETVN7U3lwt0MMul6+CApYb5wbWsVGkEJmNwtA+r2YqWj60u9BqHk2oxd9
	Ds6xElCR8XGK3qiNPIbuk7lGCbeGxWIHdoMFWx7561j1JGi8x+5KmCWzdve7dDYb
	BbyFXq66M7bn0UtWIWdMnu45mwcn4tc34FmvWSQE44os1du1JKVLrSMhoFybqyS1
	VHLeH+g43gZjqteDHcbHC0Hq7dzr11ZHN63JAchU4ywtHvnFWZ8xdCyiNzu5s02D
	jEuKiQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb21ht9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:21:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c28cecb4cso7401556d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761902487; x=1762507287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gAPrC5tF4vPjEpXPBO+URBh6gx1S2+j2eTdd5IbfCM=;
        b=Sdvu7OWOEBUOh6sEkV+23PEZoRiA0PXC4Rj+48h+qFVrjLN04KhwgCL5CZGwPPFE8D
         kFsw/gUrGa1vFDxbbIQllFhT+rijZyg72pCjf7kiyVTQnAgjc0lgywP58Z+qCYVKLSAA
         W+8hcaLErczgqpJ/vP4zODSoJ8Jp62mLk/ZApfAlngTIa2FeTHLN8V8qVre54X46V/57
         ZBRQ8ITH590gk166jmTelDo+ENHGlZyTxSfqC8Li/GLiClfK+gRn2bKItn97xoYisJBr
         DgtwKz0SMw72ohLcr+GaLNKfGzQCjOyxYuVPasWGDzIemDR1R17nHCOa/p2mLQF1Ym/q
         5Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761902487; x=1762507287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gAPrC5tF4vPjEpXPBO+URBh6gx1S2+j2eTdd5IbfCM=;
        b=m4etCZj9NyAK+ZEp9R/MsVZsXi/cnHKcVofjJ0QGlsCD2dBUPiwP3pqMA2cGxtgeTS
         2vjuR+atWLSYsOr+7P+7vXqvaLAKegu7vOYdfv9bVruJM3bj6meXFQfYdjkfDN9Zt8Tf
         2j+16TD+AS6hbEy5SYKWYxC9eXA+EmjjaVgJdP6ir57msl/yIkQNYTyLtJW9lgOHLQ/V
         eO47GurK11JaIl8FDnqQHvkYmL5qznmIr/xCy4gbf47UWbewSIlmH5xlxkUElBzA5lOY
         gmpiUf6Cre0+p9M5/cgXq92JaDA0jgUWGq0VXszdTEjP2dxIpu5KD7CzWVuZ9el2Lqho
         W0BA==
X-Gm-Message-State: AOJu0YwJvW1RMgYIBF1aVRiJ8YILR0eFEJpaLUOTtNRkt6cZ+NpD1JW3
	zoYvXVMCwlD53WEulAcZsEiBjiuClGBQYr7NOJ6xK+vInw8KmhVzT0BKtXQSl+cIWqhJxZGC6XU
	DDT+lFqyff/HxWZO82ZQ8HVqhNy/poIwHwNuR/WzmCUif3H9JpeF1iFR27693/GyQrI8q
X-Gm-Gg: ASbGncvSvmwTvbM1unz5ILRxf3T7iieyRO3twILE/wrANmiqDwlsGDpw3Io6L9O7XPj
	4GHRSZLNt9a/cHHpn1STPpW0DCF9ifzNVoAtqhoHn/CnHp7Eyx94od+giverUozqo9P7CN8dWhk
	ZpckIV8g3JrBl9+0UxFCpIb6tueAGnbunIX8XMC5TryvKSsUdTp6+4/fFRLRFPdRJIlIhK8reyQ
	QGmCEi42zLmKssnJV5bZQGoOw2UuNOlCNUWFZpPOE1KW9KhrqDNGwHa4VDsaBJKqgIv7dwKNCoT
	+T8OevKqdtBVHh8Bp3iMeEJKzDBF6cYgJdMF9WV5moWejG18lbyge0GQ8PkGHSp39WTG2fhjn+M
	MlhpNLvpmgKtxtJ2rAeomULnCL02rikSiynKahBvKsIv3UqCi5DUPNqaU
X-Received: by 2002:a05:6214:2aa2:b0:880:1eb1:fdfb with SMTP id 6a1803df08f44-8802ec2ef50mr21081266d6.0.1761902487472;
        Fri, 31 Oct 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNUAdNYmumEqNj+QhWtcRqw7r8QN5GKfMaLwnY2Fp+tH9FpwHXyXjINbqWk1YR3C2goLdtzw==
X-Received: by 2002:a05:6214:2aa2:b0:880:1eb1:fdfb with SMTP id 6a1803df08f44-8802ec2ef50mr21081026d6.0.1761902486985;
        Fri, 31 Oct 2025 02:21:26 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438b05sm1120434a12.27.2025.10.31.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:21:26 -0700 (PDT)
Message-ID: <25579815-5727-41e8-a858-5cddcc2897b7@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:21:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] SDM630/660: Add missing MDSS reset
To: Alexey@web.codeaurora.org, Minnekhanov@web.codeaurora.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=69047f98 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=Gbw9aFdXAAAA:8
 a=QdJS1fbVFv8XyC4bU-YA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=pioyyrs4ZptJ924tMmac:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4NCBTYWx0ZWRfX3uvVWdVboDV5
 kygOLtKXUMkzUbKDiRtOD40yQW4lEuWHfdidbzAzKqFZQIarxFqal2M2oAdrIK0kLVMWSHOzyvv
 fAXsKFpNphlIra0zQEaElWUyeP/KeqY8wwl4rzNFat6Z6T1JCRneIUYnVRgrgyQHZBZM8C9TBqX
 eZaq/7quoUKizXLfvrfhD3cXWvNyq7/p97zUC2tQCQGF/QXIAK5BzjH18YSgDz/gL0Y1rJGnFwp
 9+ynX0V6nITMdhqrHHUG/XyzGiReRjqFL4U4euZQ2jEE00gXd9A58tolyTANEfypBUzcxuetOQ3
 FaF7cyzF76bZ2CM7ROxx5slpONsgyAxrPbDryu5JTy8Njt951lgEvEwWmCsC3I6tz7FeadkCEMi
 wU7qwdtH3cFXKrJYAGZ8ZPra1OYsNQ==
X-Proofpoint-GUID: BnYlmXifWuefJwQIipoVu4r3HmCYfA0Y
X-Proofpoint-ORIG-GUID: BnYlmXifWuefJwQIipoVu4r3HmCYfA0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310084

On 10/31/25 3:27 AM, Alexey@web.codeaurora.org wrote:
> Since kernel 6.17 display stack needs to reset the hardware properly to
> ensure that we don't run into issues with the hardware configured by the
> bootloader. MDSS reset is necessary to have working display when the
> bootloader has already initialized it for the boot splash screen.
> 
> Signed-off-by: Alexey Minnekhanov <<alexeymin@postmarketos.org>>

You git identity has two less/greater than symbols

Also.. thunderbird argues there's two of you:


Alexey@web.codeaurora.org
Minnekhanov@web.codeaurora.org

plus.. I thought codeaurora was long dead!?

My DNS certainly doesn't know about web.codeaurora.org specifically

Konrad

