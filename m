Return-Path: <linux-arm-msm+bounces-84858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D9CB1AEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A1631299C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28B923ABA1;
	Wed, 10 Dec 2025 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puiiVmk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FS/eMFA+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004021ABB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331797; cv=none; b=izduKu944vIrymo7edjye7k6Q558CIN0YVoHjAQOSONuyT1in7q1FpwG7Br6JWWyU9U3hkbgjCEcCONkUv7XyeNgMliJMfNzSXJQvGFCgFHYIp3FYovKImGWVugaibzVWQ63Wqm9dZlU/tV5mNalxvwo+UMxEl6l6BtZFsjoGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331797; c=relaxed/simple;
	bh=e4fcYpHyZqzDEsYWXD/fCBBZoJQ6ccmxF1/S33V9RfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCs0OuCKR40Ray8Buirzyal10+z+iMjlzoTKNCD1WlaRDwOV2yH8ZJdQcMFAteGLC2vu+UFSyif3RZks50BBp/Fy1wqLHnsS3kA5mavj6G0h7DD2LZst3YE/NO+NvLnBmhmp3ZC/fXZhucOvBTEQmvhap7t/CEfTu4SereTYZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puiiVmk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FS/eMFA+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0O6VA311010
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8UlHqByzRs1jqUK0cOJbZ6dh
	LQhbGEcO5swtR+2QQVU=; b=puiiVmk0xmNxyNTCv5jf0lowwjKoFa1l1uihwU0c
	RszUDgGunSBOzJQ+DkPKhs3fChW7c2dqC29w/n6pR61irP/fGNRLPrsYDWI8XE2x
	eo6uuNFmBCKfyeC5m1timrWREhzRaxbvSsaEj1SBcoB9qJy33ZDuJv+avrPmVh4F
	9zwm5AvuxpW7iU9UvZTIP+bKiZsLhSs4N0RnJ60xKSV6XHFpueixdRQ3Pu79umPM
	/4ujEkByUhIVOHZhTo4tEm7D9cHW86olcI5Jjaw9OxVixH2z8H2r4tO5xJy0BN35
	5eS507vu5ZjQkJFGUtJP9yewwZq3HyWV17xIgJL9MV4kUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf0fxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:56:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so7137371cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765331793; x=1765936593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8UlHqByzRs1jqUK0cOJbZ6dhLQhbGEcO5swtR+2QQVU=;
        b=FS/eMFA+IihMWuVX+cHlTdzuof1pwjgWaZC3AyueE5jPqJ3Jf1xQlJeVX5aPUbQl9O
         rFbPiA4osmoWmsh5iWFwgY26fvdLxRIehG49aYho3lNTrU2Zz7Vv6bbxX5taA1m56jVP
         gxdMmT6N7YMCZvpHw7QP3ZBUcVt2AVDiMEzFJQNAA/CIa8ywoyE8G/f5YM7DuZS2dwOQ
         +XSTWxSEcWlIVM2K5Mn+OdkMCabvOD2JKB8Hoc08F8N+mkgxZWE3LeugFkgDj3n41rpy
         snQ+gO/O1TMUKSna1j3lrukfaE+9xEd29rRRbiEF9PmZHA+8++J/rxIdh/4ViOX8h9zA
         6+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331793; x=1765936593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UlHqByzRs1jqUK0cOJbZ6dhLQhbGEcO5swtR+2QQVU=;
        b=s7CliX6shsyOk/awXkl39bqNTDxvJiIGiK14sZxGW4sxM6xplRZt2xm/gAgCuetNwb
         ygb9Z+KdzWI0xfRtOBh6woW62DDt56eI4KCZPQ3KvgvOiOn6ZJoVE3bVXummmQk/UMGM
         YoDgcvu5y/J387pvl4TnsurG9/pEQaWA2Vlks2OiuQ7ZSKcuIFW1SabTniOyRlmF2WgC
         r4Le/URpGg+N12oCrMbKLVJPDVl8Nq7KR/B65pVZjZ1Ibkppl50gicCLjjSRVGaojI2u
         eFHz284qEN5kbzqcml4cPXensxZ25iB5lLbAQKhi7w1XyeNo1CAboD/0HaVK4SuEFoMg
         0lAg==
X-Forwarded-Encrypted: i=1; AJvYcCV7B4v6ipocHbhkMvMVsmM9VSWtSAzmR7Dx7BFmuY8UiJwqN85sfr6+qT6MSDMUUarjL4ldj90sNkkWB5Ax@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5hPtwIYxGUk8IuDVudEoGReq8hHcPK6vNIhO/qagr2skpwI/K
	4vrknttNiCG9emh1H8iGJHoOuSbvRhcgGrLf43wczPObsiY8qtXBOixMUz7EpK2conuib8QTKgb
	YbryXhYDz31AnguktjjhOxAeUtnCdkDfjvCtksfYxARfZXVaV5HhsDp9zn2Hk9s8aXqsj
X-Gm-Gg: ASbGnctzQjiP9fKB0UMNmgjDcBfWQAZ8FilXynQmjAzzsvjMJJOhgNx0OZmV8RY94py
	EzJH3fRxtSIyVj+X84K/vMXDhD2JwjrBQ9sth1v7+nT/2pc83Gt48SzEFZU3NCLYyeXfVYpoCdK
	jnSMJs6G/Oh192xijXlBMJr8L6N8PBaI/IxIE82mOL2jOTDmlwFqGB4HF+VCwvT0BhX4kAQg+3e
	FjNwNJnRCyPawQrcrQusRJBq3zOOu9kgLkcDJ+G28hnpViwr9zQ70muWliiPm9Nk3PLLlrOZSma
	4vAWxa4i8h50Kvo7p8W9rub4r2zu2CNPS1KRYBAE/B+kILhNmSvmHb8CBApGnMxMS9l5dmwOz3E
	vByfsQX3dbqcxzzzq6YJ/AZ/XjSAHgMePCQmKkpq6QboK/S8VLrkXACD1InsVW8asJRb6Hlf9J5
	fG4xarEszRrXMObzG+XyXBGCQ=
X-Received: by 2002:a05:622a:190f:b0:4ef:bd1a:501f with SMTP id d75a77b69052e-4f1b1a67517mr11770601cf.23.1765331793204;
        Tue, 09 Dec 2025 17:56:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7gqj3G1BiKUzip4pW3nsB9M1LGKa8ryFA0k+LN0QOWznITPFHf2QMQ02Nxgz2L33VFBTrLA==
X-Received: by 2002:a05:622a:190f:b0:4ef:bd1a:501f with SMTP id d75a77b69052e-4f1b1a67517mr11770411cf.23.1765331792756;
        Tue, 09 Dec 2025 17:56:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b245b6sm5681124e87.28.2025.12.09.17.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:56:32 -0800 (PST)
Date: Wed, 10 Dec 2025 03:56:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: Add PM7550 PMIC
Message-ID: <3h2kag7drftc5qiz7h5xapnj2kuaqexvknogkvusgca676cvw2@x2nkz6kmiphi>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-6-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-6-b05fddd8b45c@fairphone.com>
X-Proofpoint-GUID: aENTp4k5FrF3cqSyWuuPbfhxeZppl_vC
X-Proofpoint-ORIG-GUID: aENTp4k5FrF3cqSyWuuPbfhxeZppl_vC
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=6938d352 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=5gdSdrsV3EmceHnK_3oA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAxNSBTYWx0ZWRfX3fZrWk+CsMnE
 mer9398q9udAU7DFfp5PkBbsKU2Jr4E0zGJb3ElFmNQYsrzNQPx4bJETpmDihpB1U7RI9ayC90Z
 eIiAcOtFaFJEBykfqSXpNoyZGDY/F2VGo977nsNM6QdCcF0e0dSLAV6RDr/Y6OjSkpnEbb9lmd7
 dgBrwvY4iK5WpcF8jtkIuLTVAtf/4J8FTAOIiP8KbZOAMJ+TRBgpkMGL486sb+cGvngtLeVntSo
 uFMclWdmOGjrWwpYSptgqvbbZ/Fjw13FWBk3tN9ZJ5bp63q6wI3IQTWmJeyGuFlHKqVd1Xy8HbB
 ytH6DOCHcAA15eszrXRyVrMHPGAPTCJ6vPInPtHg54am1Dho4BAjjFh2twsp9ETOutHIg+dKU0g
 Qcq5EMbfVHqqeYfimyU13j0MCiVMBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100015

On Wed, Dec 10, 2025 at 10:43:30AM +0900, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with Milos SoC-based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7550.dtsi | 67 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

