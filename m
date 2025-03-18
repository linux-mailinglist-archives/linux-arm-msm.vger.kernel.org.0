Return-Path: <linux-arm-msm+bounces-51734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A596A6750D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B767884055
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7EE20DD7E;
	Tue, 18 Mar 2025 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpQRH3J0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD220DD7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304168; cv=none; b=MWviLE7f4WKKDR6GzLF4e6yIi4PSGZRVkRebxQUNnqaUMY2gUMnoxC31v/SVbsBnnE1YyXL6wqzQVNO7HVXvF6AKMXD7b6YCEKGTaEcmQuCXQw0iMVhg3TpIbjr4h1cLsOaWBvdXyo6FmcBAAwbLc0nyzvmQze0gtK/hTlCHKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304168; c=relaxed/simple;
	bh=T3wzl5BuTKPC/Qy9/OCpWwcFWc5KQVgF1XBbM/fcyYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcBKYzAhO6ojQXi0oIuLV3yrRHlQknlcgGSc/Dy4z1iA11zjXPvuHmaFweqg2YttYqSsqVcsqYczRO/mxuk2MUewqlxCekuKyTeOzhJxqTexwyjm+Pk2THA6MPLx+Icx13iveYzKbd8aI+JNGSqnz3Hg8pQPhqhx9kycl0N2dvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpQRH3J0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9vZgN031683
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGDujaB4DLyabP57ZFAqglGX
	KkKUWQiyDtvod87xHNc=; b=fpQRH3J0JoYCzHouc7VQOZtfva+i9kXlHc6KQ6Ri
	zm9LRm0BfHgdGEIs1EyPgsnB94UHSgVo6Zu9fPCL0C18QOuZ7gOU3kPsXMCmQATU
	aTH6qUrZJur6wScr/l/oBM5OYmteJkVbf1QGitdKL0BQBOyl50cMw4Sfvp+m5jCx
	vzIDHi5sRm5CE/pY5pfgY0QNS9f5ADK7ZsAfzTx4+XQfIod1k5+8NG+bhvLyvWHO
	AyPaJ2jtU+evQT69/vAIQv2qXDvsXgtrIT/zTb6BKGPtjWsnhubM6Y6U9Xi2YCN1
	TIlOT+inw3bx2sjnr2KyB3pquTqS8tP/EZOxjNg81e07Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy0ba2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767348e239so117019841cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304158; x=1742908958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGDujaB4DLyabP57ZFAqglGXKkKUWQiyDtvod87xHNc=;
        b=krJ2Ul5jZ2jLqpUxgbh/fn3nJ05oLFcyFIB09kuQjUsPe8tZXig0t2D1NOKlBB3O/n
         2t5W0YiZsIcgGmCAtFCjgkU+/hRG5wS4W/i5u2O/z8m9IrT6npsqbFJ2asC3LetZmzbT
         zvy5QVxiyINJ5JoeBI6MeoR6AnpS34XT8xIdICisBol2O3MwLFxHIBGa8iEwfiWjMFm4
         oYZy58l9wYsSOzX1S6tRGEEpIAF02pjtzEyHxFG2cSALkyjszvhQVKpzamrzUVPS7r1y
         gWhGnr5iIrRF3u1YrE80DWFU8QHm+AhvYojcE16NwUV1oo1lO+lWZwOeEpcBJRxt4hV9
         sHdg==
X-Forwarded-Encrypted: i=1; AJvYcCWI3sDh9s6QeRt95JMvgr6UB3ZdhJBCfXHuBISwbxNAhALIvQUyF0uslRsjxt00BmAYzHM7Dq6dblD3c4z6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mEWuOYB1PLFElxS0iy/9zy2leKf6cgJka8sd9458ec0F8mLE
	lphgLMKmzu+fn/79hdFubEbdbwcwDHLN/AGqEpvPeSI8QDO6xPn68LyFqI1wWM8cSFdfQK/OfEj
	Vc32wM4a1qanqcaF5BzR9CS+QN9uzlnsOLHwuplSIcXdM7Nt5S102p9Eya6kyv4w5
X-Gm-Gg: ASbGncuqlr3T2XUyL6eLhatNK7DVT1aWbSGmv0evOcI/pEw4MbBpkJeoL8eKWgSkvfg
	VvOy9wxiiprpVTVuvohkFT9f5ukvKABx5HIeslCd0uEJebYalmK34LtyFasAbjGjeic5u/DQg+m
	NXTB4GeF7Ah/ZQOtmj0vlqEsJUeTI1zGdtb0SdsiQbP9f2bp0CUf+P4UvvXcQeeSnFmsoftRoWy
	m7y1uDJTnMHDke8wr/MuW9PoGGgHOlAsYyWs6U4ZRtqCSeDwJIGyUE7arEtTCQv1jQK7+zN1zRx
	bmjV2Znmftfqc/ONL3FHkH5I9z7xQIWta4kmr43Q1ZLn1Ijm1lev3bT+9kVOlAcPq6AULdEDXun
	zmvA=
X-Received: by 2002:a05:622a:4008:b0:476:8c68:dcbc with SMTP id d75a77b69052e-476fc96e517mr48614011cf.9.1742304158601;
        Tue, 18 Mar 2025 06:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaNdlc1pTWXWxO9BlgHhquQTXoTV7LfD1gCYHiNW/dPhyGJtf6v2GHBvytRzHabEmyDgw98w==
X-Received: by 2002:a05:622a:4008:b0:476:8c68:dcbc with SMTP id d75a77b69052e-476fc96e517mr48613641cf.9.1742304158143;
        Tue, 18 Mar 2025 06:22:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8944sm1695766e87.14.2025.03.18.06.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:37 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:22:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: apq8064-lg-nexus4-mako: Enable WiFi
Message-ID: <g7scnbxbem3xviz5ufuhqakgzgz3y5hpfuo3rbvipcj54aqjaf@7rjwbweokcvy>
References: <20250318-lg-nexus4-mako-enable-wifi-v1-1-e3b4a09d9f68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-lg-nexus4-mako-enable-wifi-v1-1-e3b4a09d9f68@ixit.cz>
X-Proofpoint-GUID: Tw4kG6F4ckquCVaja831mBF0ou2MFd5k
X-Proofpoint-ORIG-GUID: Tw4kG6F4ckquCVaja831mBF0ou2MFd5k
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d973a5 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=wz7sF6bqFnhUK9Hc8PEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=641 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180100

On Tue, Mar 18, 2025 at 01:51:21PM +0100, David Heidelberg wrote:
> The Wi-Fi setup is identical to that of the Sony Xperia Z (Yuga).
> 
> Verified against the legacy kernel configuration inside
>  arch/arm/mach-msm/board-8064-regulator.c
> using LineageOS 14.1 kernel sources.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

