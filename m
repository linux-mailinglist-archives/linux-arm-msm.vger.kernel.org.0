Return-Path: <linux-arm-msm+bounces-68104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76804B1E54E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C7F73A3A10
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D72265CC5;
	Fri,  8 Aug 2025 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHXrNcvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C52222C4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643967; cv=none; b=Kd3y+X8x3mO7Q4hkmv5NGv6mmSvoIO3BIKnHzPNKH+q55bGtSoc95OO78+mmIj/ttQqfGEgMJg09zwTvcfUcPlNANa4qclpQev3995Dpvg2VvDlpweFFFud2aVIHMULsYhqMJNh81/oQ4ZEvtP8NB/WoQsDOMn6kIBR8g9mmke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643967; c=relaxed/simple;
	bh=AgYL5ykopYSyKknNc3hxEA75B6meDQ6pQm7/9sGu2CI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrbf35QjNX4h3WnhZuAgF5fxSKU2iKNpa7bsL710TZgNuWNVtqTUEA/ZdXPJb0T3CSWCXd0VNoNoSEgYuFwgJllSRfrCXQL6EYQ7oHOfB8I8mJ7+dOMFPnb7Iheqo/6fQaaI2hQCOKv/th2oP7K/LVslQ4hece/y4WFVW9XUDik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHXrNcvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787P3Gf007824
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 09:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K7HQ3WGypHi6Xpz529wL4oG7
	Pm7HPPB9mqOQp+Poh60=; b=KHXrNcvSI6RBt0+nl3nywv+wydu7sNx+TVKPeGd5
	VRDHaqzDP1K+kZvse8lF4brrbQ1BrvgifObfu+xspTup1hATtK3JV0Iy97dY77+T
	antlxhKbTIYcJTmcim6LiTjXbdFxNxGDQh0HwEq51PDOm4GVnKats1E/wM0UmdaG
	jTvKfOV24EtnxpW9blEkeO3IDw1k3dwU2e0v0e+HfvXkbb+DdJJejVnEGm5ApY/k
	A3ET3nMCfI8BtNJUDj1PDXqdVAlAShechBmYX4CA7zNcIO0Q7A6XTwyj4p+1Phx6
	VX1blcq+SOf6ZZrCGMEVxTEDQyFP33gwOUKvhg0qMcN9Tw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u26f2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 09:06:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b06228c36aso26181261cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 02:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643964; x=1755248764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7HQ3WGypHi6Xpz529wL4oG7Pm7HPPB9mqOQp+Poh60=;
        b=uhOgApkEa5p7qPALL0weW3pGKba9dgyDnUeClLxS2KtdFgsGswgMDYNKDAs7cFOPyY
         gkMqi5wk2115nvRy8ZM5j2oCf3AU1/IyDVQgzD4GH2OPwFOjuD+qdLtQxalw89KWS7EQ
         00RUDzsI1pr2A2hmUBKObp0S8tL7GmWR8biUXiiGxO3ubjPIf0eiXxqRxdMh5TSUy20+
         UNOgo13LAiq5xKOQv2oQpYegilaU0I4N9EXjqzxE8aQpucCgEWy2Q4hQ/3lnwxg7nWcQ
         4G94lJyv1VX0wIvMHz+eB2zfpSPlknXqrDovDIF4uwpVfJYlEwMUHxAw45XiOxdSArbB
         LU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMtoWOKZKuJMhIHwd0ZECRqUqgqMhOMyIVyaeS9xgkr9JhEiyRJFCbFyTJ7xJXYZcArwNnbMOioNrAqzJP@vger.kernel.org
X-Gm-Message-State: AOJu0YwgjwlpRG0U+Jc4W0qzybLj6OF10P1Soq/RSs/81YV65PelrJpl
	iuwPCbL9FHTtUqmp1E22Tm5PGoE1CiGnXLCQJ4w9xBTj7Ze6Y0CtnAxZWQ43bHuR1WbsSTsmjnT
	keCXYwY8sWfVufID2GXxuRGb4PorzAE5DEZDprs5ZVzYCvxvYKJYoidyIA5sAuJ30luwO
X-Gm-Gg: ASbGnctgHFLH3wMAlPA2H/0naCEtwpZFR2y+POLvyFVIaK75Y+hIGASkif64grmGVCj
	JRS1BZBxc+zk2Th8YjWAkoveDsBgB5sh9StjAnOmu2oTDiAJfxG4yeN9xOMu+j/x5cxioNlpMed
	21ygpAVRnBsyK1fQFbsDom2hfIqBB4Q+/Xvkk3Ll/QunMfaqsYhZclv/lJOStjvU1WCt8ceKy7y
	YrpYJJ7kM7EuIEY939Cy9aq5wiosXIKVEHlExh3STLLIluOX0V546SV0wfLEHnwgl4xIZNX0PGJ
	BRYEdNQaS4gS93CSNMb56IX78YmaE/BJElQLylCQxrrNm7gznfwTDCVhoGQoxaFFJLX+1Q==
X-Received: by 2002:ac8:5a41:0:b0:4b0:9dd8:724e with SMTP id d75a77b69052e-4b0aed424f7mr24559041cf.20.1754643964072;
        Fri, 08 Aug 2025 02:06:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErIz/kzht0B+Rw6IN0fBC++6ASXeuQvJylo5upEdS9T/SVuOdpmMJslhAjiAsivP+04buUvg==
X-Received: by 2002:ac8:5a41:0:b0:4b0:9dd8:724e with SMTP id d75a77b69052e-4b0aed424f7mr24558761cf.20.1754643963609;
        Fri, 08 Aug 2025 02:06:03 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9160sm29690710f8f.21.2025.08.08.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 02:06:03 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 8 Aug 2025 11:06:01 +0200
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/8] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aJW9+YP1PYJo6+Uq@trex>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-GUID: Eq5VkFAvppxd-NfvHw-__6LaJ7AI3oL0
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6895bdfd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Ym3L-MIe7AMF0NBZbT0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Eq5VkFAvppxd-NfvHw-__6LaJ7AI3oL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX1YPdxDOYae10
 mGbLAtPvjemiD/xI6Pan5wYXXdI8zW6c8WkI6NTJBd81yM5SSgfXUrJbihvJhYxjAXD41jV35dk
 bxUKem4acpAGHD/foxw3x0L/El9ki+XaZfGS8eaPHfrkJYCtG5jP8iy0SplqD+3mbSifKGxik5p
 8gz4PTPB9pLTfog/hw6+m88AkpMA5DztFTPsEyTAnpS5alvpJBJr9VrJQ9vDGJqT7717rIp4fFU
 yy+Oibm1/EIDzIKpex9rsE1ouNG90QVca9aG0VUxS3flBK8qQ9+jkPlJ2tPYXq42jTpPP3PUGg8
 8zNrOoEkkigmeU/Wokhk0l+kXP9CvQDwaXy/UHwQ5P2ZQBUCwxkj+7WcSad0dnGWzOO0mDU4BKt
 enrsueip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

On 08/08/25 10:49:15, Jorge Ramirez-Ortiz wrote:
> Changes since v8:
>   v8: https://lore.kernel.org/all/20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com/
> -  patch 1/8: Add qcm2290 dt schema
>   - no change
> - patch 2/8: media: venus: Define minimum valid firmware version
>   - dev_err on failure
> - patch 3/8: Add framework to support for AR50 LITE video core
>   - pass core rather than the lite property to the hfi platform
>   - remove warnings
> - patch 4/8: HFI platform V4 capabilities
>   -no change
> - patch 5/8: Sort dt_match alphabetically
>   - new
> - patch 6/8: Add DT compatible and capabilities
>   - sort dt_match alphabetically
> - patch 7/8: Add Venus video node for 2290
>   - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> - patch 8/8: Enable Venus on 2210 RB1 board
>   - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 


Sorry missed some cc, please ignore this one, I resent v9 with the missing linux-media


