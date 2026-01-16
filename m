Return-Path: <linux-arm-msm+bounces-89365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C3D2F372
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B973093B27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE07C35EDA3;
	Fri, 16 Jan 2026 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjNX+hYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxH5aaoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED472EBB90
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557754; cv=none; b=QVS1KeD/dlmNoN6V9ViNnD4lC1RQP7JxJIkhBwmWorIOwD7zzZTcWq8uc7hvxscM5BabyH4pgo2osje5pvWKaAFLE+hgTGcEUTAFpUluJx7j8buwwl5xPwTLa2yx0qUKxq3CfunIfTQIeVBUtsHhZEwznyufxoYBBXf//DfrvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557754; c=relaxed/simple;
	bh=8cQu4jKwVM5ZpKrZ5EVEEduGB7ENuFG9UeabVOM+7Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inkpFJnfhDPBAtUg7rCVBU02V3+3uT2WpTgIyWx1O8dxKamhGGNcjUeDV7ixYFasooyZnbubopWsY2GtBbRzMYFJBmr4ONReeNSNDxqVr1W6FC1q5uFGK1j+J46892GWMJKoE4lRsWc624hyu31zgynzigdySKg3uM8xzBovgNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjNX+hYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxH5aaoo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8F3rO3596641
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=; b=SjNX+hYk+L++tlmX
	2gEpuuzA2Y6ksLIaoiZLTpjWm8hDcO6wMAWAXcYe5bY3e3w22TIPCFsjklvPapC3
	DGL1YTSTbOS4/rAgGuUEJpMQdwLBRWNZ5a82ftzt5gMdqEvSrSbVGSNQ8I1aBOdx
	Zz7nnOHaNz+maOiksL+acfOG1KxBQ+wLCqjRHRWGDTrKk4Mzb2ILskRpRRo+T6IQ
	hyAcvtfJB6VgmMYlqQaS4uugCOzdazPH0wWXvpM9ftUiE1b8JNAd2fhQ+sUmPHWB
	oab9AZTeEj7wa+P7tAay+ypYUTkZ1ZkNWtXqqQe7X6nuiqbHndXqwRFmzcIXLWVE
	TGd/Mw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsqk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:02:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c532029e50so61851685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557751; x=1769162551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=;
        b=hxH5aaooY0/ptYS3ZzrOOWnnsX+s9/sZIGt+iUqE8W2VICNxE2nnnbs0bFOPXsKTYH
         n0yuYhMbKWfoR1kHV00yYCV9OE/wVffldYh5UW088EoUkxa495fZlBDiRjwVfMz2TCCK
         QHIqp5lMOyTyoVm7gIYpaH4Jrg0LQsuQad25WKb7bPHqcmGW+OZ/Ft4xlOR3KhkW81FU
         o0fok4Ot+054fa5ufCijlsD6oAJYRRukvl5bzkLORIPHOsyZo18BH6vIVjMQQnU+0W4+
         dmWsZCz/SYQACavac+jIOSMgEcPBLVAqFOpphC0JCeI5Ays6u8/pe/GaGokSCvEC94tB
         20bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557751; x=1769162551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=;
        b=VnnEiilzGwj3rm6hto523sYH5Ph5lBRXQhGmdDsyVEy6JRTfBxu4FUH/UQT54pD4jP
         nPpoQxlsP4ttzpBQ7ht9PYP+xNeNuCx/CIhalsbc5FUqZ2H/8tLWyYN1qZwycaIHR9DD
         fNBGuMSW+3iy1Xb9wXQL+7+z133ECzBwrrOYW6WeswWHsy3d0OnN/lBQTA+yEBgxDKCh
         3HTXDeEnk7z0nqjLyhRs4Y0Eu1YYVE4hVTIzZtuwIVahr8BM0fC+brvrmFwzWC/N/Am0
         7I8vEaamJvgA74jw0aD2KAKi+8B7xz3B+H3Owo3d2JVs7sVEVm41hQU2kVt4x0Hviyei
         QkDQ==
X-Gm-Message-State: AOJu0YwOKo/5J9qUnT480S94fG8t8yHn6U7jh/gXE72Z6GfZx7WSQdts
	nk1fn88NxMMZAOI1G4xFw5eAKXGEkbkRh11SgB7hxFE5JuNaSNsA7ZjnnAAI0aYVqQyytFJz4Wg
	8ymwJn7FBsnLPxbch5fYpMEfiSopVC4FZow8KqjMzz1YUmL7WxRRQrIJht2tCvx3jOspiG3yHaF
	nX
X-Gm-Gg: AY/fxX4+hL0sNS3tTinU5rc/BMtw67JXYEeUZFV4zKtzPhF63eLeNJA/EfnNmTAeIHr
	S6rZ7ucYs0zVzUM7lnwFI++sg5UZ38Zcqti6NtKBzxqxrmC2Qkm83+96ZTdRbTOquLgcfx5JSFh
	c6uJdcLeUrD/e4K06zj/pu2MJy6OpAcUPhwxNIoBPZidx8mp6QgrS3V7C6/ztcIk+hYNxhItrjC
	0ZQQndjweQ2ZJQGcyGogffeO+Fb77e2/EO/PYwa5CZNUyucZE0oBgzs5idbx1LQgRzBCsV4Pfd+
	ChXMVtymCLdrloRvMv2c8qGRreHpYWM5FOoTON8FJ81quDuDieZ9u5Sq8JLfZ9dvEEimAM05nJR
	eLVDnRn6DJDx8C00QMOAgXtKsM5KFzjKzoEk0Sh1zVL9YSslYVlcSe76l20aNOpSEwEc=
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c6a67ab9d5mr216408785a.8.1768557751174;
        Fri, 16 Jan 2026 02:02:31 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c6a67ab9d5mr216406585a.8.1768557750716;
        Fri, 16 Jan 2026 02:02:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc4b9sm1984787a12.18.2026.01.16.02.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:02:30 -0800 (PST)
Message-ID: <fb19c7cb-96bf-4abd-94b7-9d5eca07c346@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:02:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NCBTYWx0ZWRfXzMnNapB1wWZG
 jKxiPtmn85SazMbt87oYUk//aSmebqPX/C9C7cvw2Ynz9hXx5hbHzWLLYAI3OXkFe4JWo2de4Qb
 pHNqDh0/jOwcalKDDwdLFX8XALmqu5lmTSzExOeIhpYI3d3+v7BnJ4VvNHe5IClA1ZFyp/7Bbab
 J9Z3pmpDb2j0Un4VQYEcrCTkryrKZ5NH1j7D1yJFd7yYLG0jzNyC3bWoElGgXV0dxRc0BrF/01b
 XTmBJsh27COMkY1EzsCHMs2QXAljcNfD91rbFM+W+t+OCF8PLIpUE+7mBLWIGw6gVzDKxwGc2wk
 T5WnoivyMW0A9D7ikhvkHXOBvg2oDIf2UIZywHKH+OTPKYzYpldxsl5AdNlR8cozd7uZL+FW5oC
 Pj3PjzTAalkkU4zJxOEING1ZCZN8F0SaMw1QlpvaMlP79fdpJfdfoipxwdrV92kyR3igFzRGmal
 KhNxnrL7lqyVdQMiwug==
X-Proofpoint-ORIG-GUID: q_bvkqFaqc7sRsd4QpPDWXPPggv59rcx
X-Proofpoint-GUID: q_bvkqFaqc7sRsd4QpPDWXPPggv59rcx
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=696a0cb8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-oCr93RSJmR9oNbpFyEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160074

On 1/15/26 9:05 PM, Dmitry Baryshkov wrote:
> On most of the platforms only some mixers have connected DSPP blocks.
> If DSPP is not required for the CRTC, try looking for the LM with no
> DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> those.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


