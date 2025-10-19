Return-Path: <linux-arm-msm+bounces-77922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A9BEE8BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 17:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85A24001DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 15:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FE62D46D6;
	Sun, 19 Oct 2025 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcntXBQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685129E0F7
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888231; cv=none; b=V+xzlRKQnUS2J9c8V7Nq5HsIGDotrcU5+YIP9hptqv6+JcruFjIOs8KvByy039R8RcjKCP6onwerRJww53TBD/y6WD8VRK1fEqwnmgqKizSekL/rBepGdA1KcMWhOno6AyD61Dg71Anu4GVXMqk9/JxWjaw5DImAv/MSWJrUNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888231; c=relaxed/simple;
	bh=hEg0Yf5DlxazGnnjSpW/iDt6B0Pv1nMwGAFG4Zj4n4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtmtEbrplXUmcMtb8HCw9EHaE76DE6YMXZIeZ5/Y5+R2k9JphNJNTcpRjJOPeZ6RdlObpGcNPimIsJnu79H3Uz7mbZigIuuE2a4p7JNgOdnXP2vgqkIL6G63IBLD9bs5V8sFggKLfu+mxr4+F0fP3f5DDM4uKJdWgEfArrGK+tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcntXBQu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8e2nd011756
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 15:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RL1Dojucgmcs5IbhdQTmfeBq
	uHEdKHvcZ4h5XAH9v8U=; b=JcntXBQuK98J117bXuEzc0MMlkGUc+okL818sRX+
	vh4EwV6K30es2tqhm1w7GEpBxPstcAfnqsfZ40cPCHTYrCWpzLPWs/Kc8VgZtmpr
	ovt6s9UslnAxBUsLkU5iLs+DEfVKZTOS+z6htFrbIyO7JHuN6/k91BI7uhFV/T+r
	FfRRljLwdsLn/q5ik8O6rOLDJ5ToDX7MGpQtmQaB69FsvRE1mYaR/5XAiYald9Kz
	QlonOnuJShCQGHcmOnWW5Q+4BqSygTrKL2pW1y10Pmh3pFTWY07utaG6wSVPzWSA
	YwuljvRJ8kc66/HXcrDMvmpH0MwiAf+xGuYg8Qgv3mbawg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08paukb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 15:37:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c146f81cdso64293346d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 08:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888228; x=1761493028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL1Dojucgmcs5IbhdQTmfeBquHEdKHvcZ4h5XAH9v8U=;
        b=TMqA+eaptNHR+CfQzgniGXDwTzECfF+uuGicL/WdYSKvxeLCO1djUZ2CPKDEP9p/cW
         u93wvDUDSlz0PAxhCNyV3ptycLYIpWboXSaGVGSzbnAel+wKHqViFbjrNRWMApovBTx+
         czzGO6CpFqTNoUqWD4UFcXLF0AEzOKid7ol664MSiee3TuYVG5z6A9pfPUiNnmWih/ca
         zEMLVJhRk7haIzoY3I8dej1ZZshrEUPKZPBMjqlyt1AP0LexW88XYMaKz9eUaWAJ+bcC
         S4yLwLCeJizXYIoF6t0TM1hRfzUJVjiLXMm6DEEK7HevniCYn35dOEejJA4I6HOw8ZF+
         a7+w==
X-Forwarded-Encrypted: i=1; AJvYcCUdnx+FHTferEOrtDrK0Sfkv1/EshUk1NtffJEb86W4a29ALXJTjfjDLdWj9V+Abl1tgnSrYEc4U+KuCEiP@vger.kernel.org
X-Gm-Message-State: AOJu0YxWbfQ2tlP0z4D3KvXJwcWDDOANBUYk0PFLlwOWrVcaTjs9CWC2
	raLazjmRvu0zlTEw9Jrum0AMwxnM4L/s3IgcmlkYuxKSme2cnAFSZoLxIfazP5ntTJaNC3+UYZ9
	NVI9pmzzNJhB06Nl0K7kVZE4P9a8UYTu0Rn8RuvK0pYXkh/qa8ns/EJJulji2HGuALPGK
X-Gm-Gg: ASbGncs6k41Pf0gPS/PlPLOG7WuqVXRL2oEtwE+hBQw9zukd6uF/8ur0VpX83b/N6S6
	C1hBeKycQkygNTHfF+1tr2jJssEL5aGch5vrHIBUWTWOOXcuggWZqPblKsR87Gnp1Z7u3l89/Hx
	TIjn9puwkhq65cQXZppiFWCUm8UrnaVWKJMtiwJscRkHFIy+ajMjQ0TkXUiJli8orqn9PZF94Qj
	Kp2Ffh1Mf8dm08lYAYCC/XYLaSNZA650UJcie2M5wmZiJxnDIzFf7u3ErdKgmGTJ3I7nuv1o4uX
	VhVwCg0RnoUDxvv8IBkoC5lm4+nWDLdw5B0u978RKQZ3PakSbeaxzczILPDq94CtOXYuGcPTczl
	XwWyvXeIc7WS4t5CXKdKqwSIlM6kNxSJFhQemAxYDEtmaUyJpI+PqK9gv32ObFlyAUv4f2D96b+
	p1/H1bIp4pi/U=
X-Received: by 2002:a05:622a:1351:b0:4cf:a3fa:47a0 with SMTP id d75a77b69052e-4e89d263e40mr127009021cf.15.1760888228260;
        Sun, 19 Oct 2025 08:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSXAeyNtiUxZMmTENJ6PxpIf0/vFPNuiwpyiUppu7120CbuRClJJ/SHmE9tFl+nmG6N6HwKA==
X-Received: by 2002:a05:622a:1351:b0:4cf:a3fa:47a0 with SMTP id d75a77b69052e-4e89d263e40mr127008631cf.15.1760888227802;
        Sun, 19 Oct 2025 08:37:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8765sm1671336e87.7.2025.10.19.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:37:07 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:37:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
Message-ID: <sasjgm6pua77syu5qjbr5zxl37jorvhs4dx75lbiqlisr5aq4h@zjxu4k2wcfye>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
 <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX3wn1ohuUZqFO
 Jv0aNFkLzBnGaVLk5mz0VQQs20sZQIlaWOD+p4hvutyudPyLVZCBMG7CxR7vuat5KjBuZn+xRO3
 UqF1rc8u9junbAOP0rSjDTnSIPH37Dlzxtkfg0xx/q31Ig24FJMY2DSrn9ScdiwVaUJYS6czvGN
 x+Lx1YvIGH4WmaUpWDO8gZMP3nf3Pg4BEh58hXSy4uLouT2IL+31MA8okRyYvyyuFDWotYHjcVi
 AurCDwk3yKPZfcxkN97H7zlFgdGlzruiscUb+888atji2n8SKXL3hETFjbKsCNnidcOkE0NpktH
 Ss7kfTcR9KAj5MAG8nNaps77LIKfveTWHEzTAE7hPgRKxjJrMSAxip7aknUaSb12D8NjCpNaPRv
 +mjSriH3u9mJeiB4ILwLknptt/xK2Q==
X-Proofpoint-GUID: Kzs7iWKNA6ynOoBPWWuWZ72Y5jehngi0
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f505a5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=X1EvOAfQj5F5E2kYnQAA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: Kzs7iWKNA6ynOoBPWWuWZ72Y5jehngi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Sun, Oct 19, 2025 at 05:20:21PM +0300, Nickolay Goppen wrote:
> Compute DSP in SDM660 is compatible with generic cdsp_resource_init
> descriptor.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # ifc6560

Please send DT patches too.

-- 
With best wishes
Dmitry

