Return-Path: <linux-arm-msm+bounces-87114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FBCEBFBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3C69301C3D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8432B321421;
	Wed, 31 Dec 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfNnQPb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZIHIAwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05903148B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184415; cv=none; b=IkDPN2ZhbEdAQ0FaktvK4/iAj6UP4ZutwmqLMeX+8SHLuKGWuvtTJ4HOo4fevnhtnpqHKTeCkYWi7xRhbsy8JwmBxIcYYKPzIbIt3rKkXMo9BvG6ce9aOYePspR6Yoda4sG3CI9KPZ3bl9dxB9Q8B4+0LmY/Ab0wToX3WO+aW2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184415; c=relaxed/simple;
	bh=IJuNNcXQtCp3nWgFBNBZvFfjG9949BV8pSdjzRkGGIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eSTiIJ377y+wAIo6YKTzFoXXFAEmV4ZKYWrYhomLryRf2XajrwYF6oCfJW+YleshTJbPmn3uo+0BFx/FWv6wp4/w7mcr9YlsvJqDEf+icLIuWXNpJY3JODR+SgpAfZsOQ/OT22jLG/MHXzDKPRD+ujEcobs4DdpXzA6gQc3Nvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfNnQPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZIHIAwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4o6u81429073
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuHoVQkLv6FjRX5V9FVHX/pNuysZe3i1za9/ao1aTNc=; b=aSfNnQPbqqPKmg1J
	OHhiWz7qReNg4idkG+p3pIbD7Nj4QDTI0dHa9b57WbKP1MnzbCvFHiNz8/MNvRw3
	PTL3oLQZpy7ATvud6QRDLIgYTiZ9VRJXpZ8Y8y152X2qQ71J/2jAr1a1sa8W6Hd3
	GYpWAC0aAOBjv6vD6/qwUi7fjut9sWf4ut4vQFAWUkPA5SSiBEIu+mvPoKdQ6n5g
	jvPRGQylnq4bReZawBrJBmcDZi/i+GGdYvXjHsbVvLK/1RKs30o060xt4yD/GrRS
	DWbLC8NUym+X1lgJDODvkEqXtnoBzyD/Esq04UxBZnzF3hbRVbY25kgpaazCoP7x
	tlYyWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcw5e0rky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:33:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so62221881cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184412; x=1767789212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuHoVQkLv6FjRX5V9FVHX/pNuysZe3i1za9/ao1aTNc=;
        b=CZIHIAwIE8Fzk14HqijYff0x/eOWk6Pz0hYcrLZmQKHS2MOwvFuWxsGVFUW/Mk8t/x
         +92G4JeJgaOANlDoGqXtov3BdYfU/73dHRneSTkqm2V4mU4BlyTGHFBmpZ4pO9UrZnxZ
         f21XjpPF3KCAwA7NrrWWiKh1KDmXS7tDuV1C16a6gUdOR9qkccWWAc3lCWU/WUC+ZerT
         5qdfNYWmxxuryjbpxWuNK85rC6cwpU4mhV6Y12zF3i9uNPMS/4HhAxIwyaBG9G1qJrpM
         r0VESumepTVIwkfUXwip8yk+109aYTWHRgF0KhvOtJ0Wns0TKJ5U0zs9NzYZuzZknujW
         htww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184412; x=1767789212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuHoVQkLv6FjRX5V9FVHX/pNuysZe3i1za9/ao1aTNc=;
        b=gy8YQq+NM+h1I9Pc/Y312lUXwbXN444ncEGpwDxadRQEuN5+dOmvdhw2oBRyaANAHH
         SiPM95Z/D1/Crmq1gu4U1USbFvZ5Hq1lBYVJf/KhiwiNAlP1Eii5ZkT75gmfSJ4vD3Xt
         lGbYYTfMf5LiepgSztghZtR3saMClrn/CkNL6wI/U55ftP9vjRbHn+PsZiHgcx+eK1Pn
         SrSrpOd8AOPOVeP66VmVk7dcBOvosLd65A2d9e8lJRXU+PhjeoEgTYAyJ0Zve2lJ3DEm
         lIamhtbDGg0Rsm7MDrJExFBh4So4bAp3xQyYJJqUo8V2iEm6cZX8hUtMzUbt9FG75vRl
         WXdg==
X-Forwarded-Encrypted: i=1; AJvYcCXusCCsMh97yWJiKf+7EtXEXYecXjyT9wc1XHs5qMeJUin8ytipJ+ckfdvzE3XkF9QpLys6oH3dcIYFK2sa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3NeuWZiaM2/xocfrVa3SrYqn4FvRtol3tufTyDOdv8A9QOaWf
	eglCrJgt3G+9yMhWPLqlFfX71qB6rlwWPPLNZdCtrnoAbmyLxDjMlTP1n517oOXGJYFQ9vjOPYc
	Hpr3njomg2waTvTnr+jg3u/JmO1ZAbc0SBcafrVU44Tx6P96dYMnolHFM5Ivp6lLyC/ntVF73Bd
	7j
X-Gm-Gg: AY/fxX7msbKexrIxUFc/6gPwhY6aMSifvlyfK1X3f1K/ln6BIwM1FkjNTZs49N4QIE8
	GLZwCNwrf5Ispk6HMKsMmter4Uwi6b8tX3OKy/nlVBAqcb/MCx65YddYN6ZeI4OtiPgCOJEqe2/
	+9bR5PjSQGt+F7O54L1McoOYpijXQ87uMSYk3DqASzpyUz7WAB7IvtnmSyb31nNbR9/XrNxFy2/
	2H/9LcMiLR95JmVSMnvaNiAt+5QwYNQEee4JDZhTKV6HEumyZ4nPj3WLMtmrNONfxx8ro4L1ri8
	a8ghMv/3s6yNVuTqVzcF8QKpRxfMdMYWaKQy+XQ3Kdda5YKo5i4E58gqgpDkixBZJq02oDrDBPr
	WROQsYuSXgB3jIc6B+ASIbk26WgTz7woeylRWFpUX7IYGSQq0ycU55GibP0WzqJw7Mg==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr398303001cf.3.1767184411908;
        Wed, 31 Dec 2025 04:33:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4iUtNZCuxzLi07y4rX7yABbLeLKjRx5DG/JGT9DBtlNSGBgbHzwP5SNuS/sh+/KaomXp96Q==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr398302731cf.3.1767184411429;
        Wed, 31 Dec 2025 04:33:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599605sm37604599a12.23.2025.12.31.04.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:33:30 -0800 (PST)
Message-ID: <d9581e89-6e64-4450-bb65-d4ac836e943e@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfXwVUcl0PsYhob
 7MJ3JBTW1JhD2JeNz3RzQIWDGENxozYy3eQOtFcXkBzG81SdIr6VUfZfKd2nkq8ds3Gr9Mhxdwz
 S+r/z9oljggb91zq9YLE35zDD17RuikeEQkuDzI+YgXn5J5v0eVo+UH9UFdYQedjGr9yjQIQ1de
 qcOmIsiEANkMN5d7Cw3ZMLbujMczmOPVH3JLzmi6ogIp5z09Y4BPSO8nzZsiicl2nxn/TJDS/Rb
 Jhlcwkwm0CKigpYUF9fjLw4uf0+smCCwvFRcRxNDfln7y/y+f/GrQIoF4pwd8nK6w5act6ew2J+
 X0vcyF1PteWUdEkR02esAWL/SAllkYH9F9eJkm08oPGWLVJXk0EmIoEpLiC0UWbfKQDxKx2rz5a
 A/aJ/U/zS3WMOcz4+KGZWGKilWy55wpoaZKIYwZ0xIf+3Jzx3qcDFp0rldyfnocPa1Q4DAcSUB1
 kY8Kl9oAEJnnBqcSWAg==
X-Proofpoint-GUID: 8AYY1s8ceIjyXcWiq4e5tNvrqDKCfoAu
X-Proofpoint-ORIG-GUID: 8AYY1s8ceIjyXcWiq4e5tNvrqDKCfoAu
X-Authority-Analysis: v=2.4 cv=Mdxhep/f c=1 sm=1 tr=0 ts=6955181d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=s3MJbU7F5wKsRGJXuN0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310109

On 12/19/25 4:10 AM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

