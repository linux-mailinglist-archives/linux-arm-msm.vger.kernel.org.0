Return-Path: <linux-arm-msm+bounces-79355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52641C18C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239821892CF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233921B85FD;
	Wed, 29 Oct 2025 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fx5C89Rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5dZaeXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0451F4188
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724232; cv=none; b=FcDQdedABhQ1Q7/wCBFwSn3eoLNp9RctgTZF8Lo8DrdC4fT7aiOdXFny8X8iNsmeQvvF/q3sMpRmcLvlF5OR293FC91gjyUy50vHUeMrhWJYnx7lgdhjFdfXacJf3gntQtXmt8Db0yoeIYWW3XAXp2SPZrqxSUVGpPOonqg0UNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724232; c=relaxed/simple;
	bh=T/IbTI5xaD9PcdWfELicZ2QYQ5TvNueDbfPT51973gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RG6HSLVCyvBdvCh/6RgKrS7OW07AZYGM0hcKKTprsNrFmKu1KTfsbU2iDXteapwkFTObsXzXUzcyPqhea15zXCi6a4z3T5/QfmG/9gg91In/7IVGIEl7VQfyo489oeEx3EfufxBUMo9koDJ8lMnIDWnTFvzvXY58Y3imqorAf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fx5C89Rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5dZaeXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uoNL3757463
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMJkUQVenyXNnUkuqWmmaeKqgMWhQaaisg9JMWnK+po=; b=Fx5C89RcoAhlSpe1
	TvnMBdcM/2wlXMR6UgSU34H6nzG73SZD44NMoemscVnvrgufIXby/VxyGKyFw8Pc
	Hn3BhTlYli7WAjahBP2Rd0FQX23uOGOnZIOPf3L1iraT/IuuebxafT7WwS9th/wA
	raFTFTF4F3QVCAHvZ3fwI5d6sAkcJbUyx6sQTmXNIofoh0O1Td/vMjbRENRyCM+R
	fUxCmxB0gAZ7Xfqzlc5PqSzFwJuVEHUVLIrt1ymIh9PutwmlaEVCqw6X8K4H1MyX
	nNhNB2HHH/hfx7vQHtw16WccW2rJcGClhyZYZl7DjGTuUAuxwpop0liFnuh4hYZx
	iFqI/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y1nvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:50:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5a013bc46dso5238637a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761724229; x=1762329029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZMJkUQVenyXNnUkuqWmmaeKqgMWhQaaisg9JMWnK+po=;
        b=O5dZaeXNtpZ5ReuXi9YlNyKYqGYuvjIrpniPSisI+xG+wPiKJrEjSHBP5ycOls9j2w
         tli10msM6Rg4rnzjvMrxlsLOGZIw9uMr8daid+Gha4IvlNWDos3+Owv12J2D4dp9PaCN
         hajKj8pxBzt0J7XCO9L3/E5QHGYdC/6+hKtf8eNEnxCh9nXWDKJIb9L60IlZzZ0c3RhK
         seHxR2RqacZoPoT8MSrIUwVDP+TU6heBEp8mb3yYqL1V1UEQhGtyvQ9RW3ygXntehZjy
         vKm0VyqHcp22Fd9ddJX2HXzW4sh+i15mb9fYTgaFuqDfTMdayukp8+rxZSB3ww00BKIc
         n4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724229; x=1762329029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMJkUQVenyXNnUkuqWmmaeKqgMWhQaaisg9JMWnK+po=;
        b=NwYKq3TaKBOUM0wpqWel27EFB39XsuuJI1zmL8LYP8yjDOJlTPkPi3kSJ+8sSAwlpS
         +H195Q+iPUWgp7saB6ExWcy+RmnhpytSFvxAwIxxyRy/P8uom83SxvvEHwuMPsgpyrm+
         dAHra/R2S9zCjw3x2e0HXn7+7r/hTIxvH5KqxFtngPraCY8zxNNtVysejhQQG0/zE4Yr
         gKGciPyn97D9y9po1MK+rMf6Szy/l81AF/7kqIu2CA/om2SBMvySBi3DyoM23X/2sro3
         qhIncb0hbG4CHyZ2vFkAzgAp1jLfvS1yC0+rtHVtLdwhxpIBXTJZ9miTCCR91q50+p+u
         Ef4g==
X-Gm-Message-State: AOJu0YzUjuRCxusHaAHTk/E/+VhTGYcICm7mxylVpJB+CsgMFnHIvytY
	CF+0eCz58unty2724+rML1GaHMWq1dYIPReDu2H+FkgFRj2y6JcOZDTLon7laUO2oMkKsaItPbX
	O179GyLEr67VfcMYoBUA0VvFz6mNh9fJJNFq+2eaoGG9cH2LbyVvCss8gL6KfJWqxhNIE
X-Gm-Gg: ASbGncuP3Not333afwnMUMWl0RWqyYxpUPTnpMpn3M2TFeg/qSLI3jIf14g3WiaLaha
	jy6O0FwMglFEJNxUGerQe8nAJLM5X5p1ap+ON/5CSpJAdh5uA+l3o1usZxbPHbMmJnDJNBDg6ie
	6l2QkQ4dP5EHRrhd0XVZz16x7D7PM4SBzfGeXWC7L2E/PW8OijvcOif/nAFhOLDHpEZI32rC7/O
	JtWhmaylWdbL1img77281jM5e9H3Gy4PaanHT4XtClPAhS5Oj6tU+8VSHfaOLOF6A+YE1QV+YzT
	rzFuyhIEgqXwtB778ufIe7rQMbQj7X0GXc4DHMoUX5Acy3ANkOgF8DZHPqzoOOOM7H4ux2orDeL
	inWOf7pqLyhOU8OXE7VcQKzK8Ji0=
X-Received: by 2002:a05:6a20:3ca7:b0:344:97a7:8c60 with SMTP id adf61e73a8af0-34651b39327mr2433026637.17.1761724229261;
        Wed, 29 Oct 2025 00:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrtX2riqRKQJAZwIzKrPyRlcgkmBoKxT4ObGka+kUyMH1rsu0UzCrQL9V1E6sN1ckaqk1v/g==
X-Received: by 2002:a05:6a20:3ca7:b0:344:97a7:8c60 with SMTP id adf61e73a8af0-34651b39327mr2432990637.17.1761724228717;
        Wed, 29 Oct 2025 00:50:28 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7127a09a8csm13143456a12.11.2025.10.29.00.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:50:28 -0700 (PDT)
Message-ID: <39b962a4-f890-4b59-a2ec-f1f749ed212f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 13:20:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
 <5e8397c3-5bb6-41e6-ac35-4090b7a9fe98@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5e8397c3-5bb6-41e6-ac35-4090b7a9fe98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=6901c746 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=41bDykYUuDK7XwA9TSwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: yTc21DrNmEtZro8NtUmsKKNiR-LMs9O9
X-Proofpoint-ORIG-GUID: yTc21DrNmEtZro8NtUmsKKNiR-LMs9O9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1NiBTYWx0ZWRfX+yidPDl3wW5j
 7vh+oTq37GS9EdL5jfFov3wqXuGHKEO9wKq4OKEB3V9jCQQtdQdtNqKwIOmqD7Bsn+T/RkTMRX+
 zLlQJ6rdHW3A7m6Js/07zmooyW/MoK7TosXCjhuGv1PPOGfMQkbbdwBjAJvVKecjSP25OAxbdT5
 6T6l+GNEA4D2S+0g9YwUd8o1uZ6DCCAn7+OnUQxYOQ3QA52xm5UpvBp9Ls3THMIDx8qq8EOiLWz
 YjhO0WvzQ0nttCxFNIo/XMBs5a5k9TmkAGZcG86YooXEGlL8fzhVwzy046Vhu7/F1fsFG74tWiX
 g4N5FpQi743Ww8qqPMuXBMOEnB8JThbUglvp4VNU0WgMtZpnyMS9c08bEsWAZ/5tM4wYv1S7Ora
 LZ6h6KgrSgvER6qUlyxxAdlHo//iEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290056



On 10/24/2025 1:08 PM, Konrad Dybcio wrote:
> On 10/24/25 7:18 AM, Taniya Das wrote:
>> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>> boot. This happens due to the floor_ops tries to update the rcg
>> configuration even if the clock is not enabled.
>> The shared_floor_ops ensures that the RCG is safely parked and the new
>> parent configuration is cached in the parked_cfg when the clock is off.
>>
>> Ensure to use the ops for the other SDCC clock instances as well.
>>
>> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> 
> :(
> 
> The subject also needs to be 'gcc': -> 'gcc-qcs615:'
> 

:( my bad. Sure, I will update the subject as well.


-- 
Thanks,
Taniya Das


