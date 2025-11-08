Return-Path: <linux-arm-msm+bounces-80846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CAEC432C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 18:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6BAC4E6E07
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 17:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91FE267729;
	Sat,  8 Nov 2025 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsOJbx0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKgp7RgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85954239E6C
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624760; cv=none; b=olKGUr26xT+MQVkaQgmCReVlsl7jz28iD+h2b82wDUcO8aWygYp0jjEBsyPumK+1WXCV6xfCbfzkreo9KBxMFJ+r2I/aywo+EikPxIQ6VKz32Xt2tL+lsejnv/CJuPKFv1yP+xZxDiZ7h+jMduy3tRCZIpm3DIyjd42RS2L9mKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624760; c=relaxed/simple;
	bh=wstHiNMcujFNhx99Jgc6AiOxnCPcdqeq3Vo4mwlMDPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlZ6xuN2LjPrvHtTowFxZDSJwnDhzZ+p7sCoHMKWIYA6aa/TV6c/xgA7USB1Zvf9MkeaBDaj3+PtDbWy5ua+EgZBGGpl7bVRCea9lfTDqQAn26SwHe3U+3lCNvTj31NI9FY6yZdoT47pE//W4nrLY0JHox4wcaGQ2nHVQ0O9DHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsOJbx0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKgp7RgU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A88PZbQ1246370
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 17:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p9VIITPBI6FH+3MumQYzHuBc
	LCwlSNsZGEMhVh7NkDA=; b=lsOJbx0UxlWHi0jz+ZnkYAcMJpTnqcX61J/4qV+E
	lzoNA53n4mHp4HKHDXsEMCEcaE4MruwYoUhU6tQ8E8eXrfk4ZmoPFOieZ5fCVRK6
	64kSDZS2CWDYjpl0dUhCjDKwCEAINF+iqDALjTuEMyJfO20mDjy98F58GRjmvO7h
	l32SC6YDW1VcBEsZtcLvr8iMJbYagArFo5NBjgw5PQvEas/QzG9RrBNvdouENtjd
	qtikQD7T1mCOp5aZ7wS2iVtMfQU3e6JLnADn0QRAzbE+H13QTjFk741s1WgkPrpR
	X58+5u4US9ouZaWoNZoIgP7sFKd2W50XHsz79tkTxF15mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y56rx56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 17:59:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b264bbe20bso78556385a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762624757; x=1763229557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9VIITPBI6FH+3MumQYzHuBcLCwlSNsZGEMhVh7NkDA=;
        b=DKgp7RgUrFuoLH0yOLahWR0CRnlP7ik18wa/2oy0mGNS+1FWnnO1sBTjNANqO+Rtgi
         9yLGGGln7nWLPeS3B3GjM0MlwUiipRd6+zaweRJ4NILTk5nj6Rq5R1fysJgn2s/264EF
         mWwqiCngWt21JrCtB+NvXg4adqJdhbgfRZS5PAD1jcSHGfyxd9li4si/1PFh9kNk6y0Q
         fghkDdiPPXjy6zQpNQNWA7e89WqpCbLa+d7hXHPWoVl28xJKBQ0f2bRD5paqK+tGz7+d
         iFPmjA3c3qdP2Vn+AcufZX5F/CFuppqx3OF98bbLb1vEXrCblTmJIeeVA4ixZCg4bQQD
         J6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762624757; x=1763229557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9VIITPBI6FH+3MumQYzHuBcLCwlSNsZGEMhVh7NkDA=;
        b=KHUyicW6KwF+aV4RHNQdNFKVW4lmONuzJRMp+xAsJ9HNw+FNZFfYZFxBlhN6KrZF98
         DOXEmEntFsOEwIRTdabsvH0DJaUMlHVpZhkfmx+Gx40+7Ii1CrCsG4YTPAwWVOO11ez1
         Tq9Jf3JSLRxin31A92jXVtqlViKj/sRV7rFy51Uj5qORDfRyY/+K0VVP3/61BCHbc98+
         /47ZEVrJcmp55pIfkqpU9EYr9pWNhclg32x2+/amRCR4ArGwflQJfoioKnny5XeXLyKk
         /n5goK55EyO+Yk0XOxfwvMy9oUbNm8AB2ZNTDJ9AV7HjqWhoquvYCTVDy8y2d14mYdrH
         dbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ClNw8xHXabwdl2Lexaa8wET7XwN40DZppU8bD0Te4uN7Zv/yaSeMNalen2N4VGq5WZRG2D50nGG7QYaD@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmrxy+TbdRoVe3RMZLwHjsIZdNGJ2aoIUZz3FjFMEV0mdBydg
	uSthuGkHGgbHFWcDE7snkZDu+mU+w8ij7CBwvz/Kw7P2FxZqhjV/8ZVwHRMN/RZ9rYj4pSBeG39
	pdaY3R/cutn4Ixd99HwDfz2JTrVK8gR43a/glLTRCQsLvrAdHIu1/5suys3pSNI3/6/mp
X-Gm-Gg: ASbGncsbWwBCuC7VAF9DmLgGR0xEXltn8iJ5T9A0wBjHdppvmg2KD0gI8kxm7+BBJsf
	wChin8/jgtkLujgfD/v10pcZqI3yerSNoRdSw4OQ9dkCIuKSLhyvY6ukmfMg1X8+zJbdYeaoWH5
	9Ax5fAipn2lXsKnTpehilIA7XZ5FNFh1YZ2uinWhS/YpiDymIdITood6jKu+rJ4JPlTDQCDueL/
	HarPz0RENjU9L2GqZn/RvDEYlG7F8r/zwi4zPQdbi1YjhxeebcERWx01BaO92fngpOY+l4Pa/m8
	0UOeJVK64mIcmTfjH2t2VWMPpbpQkZa1l03Ab3O1CKsw0gzqIzP9XkGxqDMMzVg8OiBe5AAcuak
	/o13NzkdIQfvarVoNATeNVUzzcEOMFBLAjWS5ghM75D99FqJLkE6SkJ1YYF/kjAT4gTqQfKADff
	1GFyE1GQjY42k0
X-Received: by 2002:ac8:7f8a:0:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4eda500b39dmr44706511cf.81.1762624121135;
        Sat, 08 Nov 2025 09:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3UX8GkmdwTy3sgfmRIRR485zCV767sy17zShEsRHghjOuKXUPgDs+3aiNzzZLVzaET00gqw==
X-Received: by 2002:ac8:7f8a:0:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4eda500b39dmr44706331cf.81.1762624120724;
        Sat, 08 Nov 2025 09:48:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a594e2fsm2334143e87.99.2025.11.08.09.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:48:38 -0800 (PST)
Date: Sat, 8 Nov 2025 19:48:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm6350: Add clocks for aggre1 &
 aggre2 NoC
Message-ID: <5vrvuegqb4jbd5o7ipghrhxpfx57e4toj4vsplh4imupkc5emo@2qto6v4ftqz4>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
 <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
X-Proofpoint-GUID: isvbd4hzoTDqqQhcoueDvAucQJYqasmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0NSBTYWx0ZWRfXxWaA3tcb0cjN
 6fk+AHu0NJOelBdXoFErq4KtJX7IyqWr93w7tHUq4iErWBoiYXJRrB0Wd+9neFahrmA4MBCLItG
 XugsTynvVvZiN4+J5t94kw8VLFzqqmeJc7VrEJCgfqwSYaYJURB/qzdqwDkG8GKb6dsd5PGQf4a
 ov6b/BM1i2mUlNt/Vw7KorhXmZz/BvKpReYzM7USEnudWA/dxVkKz7GrtEMAs03tv7xF4kferYD
 RgwxrNBS8sM340eZP/QRAk3BTcZs183oBip7J2a4PBqL/IJgPauhwXyU2ynndk+KzeOhvxTo234
 toiv5ghVkU7scrj2dqg49u3kCncD/SBDTUBY03Uway/y5J/Q7pkCjarFI87pZ+C7DWjp3bAmREh
 e5R140bcrX0FNH/ZGcUnYQ6So1cGgQ==
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=690f84f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=B5yIxIZ4dO-XZLLuwIMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: isvbd4hzoTDqqQhcoueDvAucQJYqasmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080145

On Fri, Nov 07, 2025 at 05:08:51PM +0100, Luca Weiss wrote:
> As per updated bindings, add the clocks for those two interconnects,
> which are required to set up QoS correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

