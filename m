Return-Path: <linux-arm-msm+bounces-85137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39577CBA46E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 05:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C89F300A28F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 04:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D420190462;
	Sat, 13 Dec 2025 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6YYH7vH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kqq2iV0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10FE273F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598705; cv=none; b=ED/VbnOTe7Aok5wZpfPJXt7zSmba3ansO290m0b4HUw44SOsZ1miVRsh0FWsFjKMGQOArC7Z5uGVNKh0me5a0p4TLoJlHHBF1QFeO/yErz5KBNuxP9VM3uDOMN7+9Wuo9zmrEOqfMHiu8MuY7FN1whE4Jq7DBr3cXTTFrvyYu3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598705; c=relaxed/simple;
	bh=8pkXydEVxE7O2MxpAcZifL/kdWfTrY2IfgxnBwUMtqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SP5RtZBDVGeH8TZaCAGfPx6EESr0BtFcREIyKuPc2OO0c/VvEQGlO8IhVvDNJgnhVrNsiTXjOAvQkWEKQn5iKv2N/vnZDgOP6rKkgf0rzx1YPoJEt31HD+xhJanH/AqpuVS0qglchytfYe0apEu5VUlf5IU4b2cDLIzqDT2ETRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6YYH7vH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kqq2iV0n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD1iREo1322412
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XwQpGfSBXmqEfWH+1QANb8m+
	xJQRzjaf4mWTlCFxoyk=; b=U6YYH7vHbMus7uw8eSeIZ9XynXpfYkKMkgfgEmkq
	uE2jEx8rf3d4jKPuNfGitIiAf6yZBlsByUqLLO5oeRvuAbdiKvRVOu0LqaYbgrTA
	SNyv2FeilY/uesBJebjshoBala6pVlCfWKb9L0SBYQfov8+LrsKvtobAccGpCNQV
	XnwRScn/4ugkvTvS39UcGdhHQaPwpLyupcxoToIk+SkX2lskkKhmAZQbufESezEe
	0oOcvHQskIA/znaNuySBBvZEXMWzq6lFEE5QcYZg4Q8oQGXn6UnMX0zx2ZSL879B
	pUtHsUXgTmMr61opgQYehe7ALk0tbAdnr9JEMhJWQPOYmw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0fjt9ym7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 04:05:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5e5270ec826so1107916137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 20:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598702; x=1766203502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwQpGfSBXmqEfWH+1QANb8m+xJQRzjaf4mWTlCFxoyk=;
        b=Kqq2iV0nXecQnVH8uVIcaO/0c1MOWANkWBv3UGLRt5MWwBTnSZC+DDNPRd7YQDH6HA
         0dPIy/mnVd01UibyKG0IMfh4WdsQpOylM9Wr1S5JhspMKAMRoCvbAEhFa8F73ppu5Zw3
         dmtqJNbgvQJxR83ZPE57Dj4WZvu+yaHEPMHa/wQPblU37GgKFWBzuHKFbflnEadU4Qug
         X1V4n+zlDQmHMtO8VJ+pdb70pfUTzfnvuf3dcIlbIRibuxkDle5IE6/8GXu2zvgGKeIn
         GhletvUtsiOknvycAHYB3HsyBjMIeiZ7dIikgvQRnTUNimMvxyCWZY1wzyCzAh7NwcRc
         hdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598702; x=1766203502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwQpGfSBXmqEfWH+1QANb8m+xJQRzjaf4mWTlCFxoyk=;
        b=W3gpRtlrDsDUIhnpq8b9K3kilfKZrrg1UDCluc1zHFIRHg+MixStGSEpdBEsjG74C2
         Z/GwkMD5j4R8yRzx/sgw7mXR7lEvgq0eLVKaLT10WGrwqJmCohZfdnSKMFShhagQJzzI
         XA0A0E2EepIi5aTL1h+vZOWJs+fkfHC4yW2U+p3Rah6SSaa6hVZlb0TiDrpkItKkmQ7R
         X/0PeHkM9MquJM92lxCslRqgOhlSJghv6zCwGy83V1j2LMtQRXrLLm7nEOPOtaomwWpp
         tGrMYiwLfqotjEK5bwvXDK+FL2MotcecIIwB1mdgiKqjUoKROPyGWMLpHpY/Cu2KiseD
         vd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMZerVGuiMIPdWvJa+1YndVFAIbWsCKRY/fKnjs1XMdyfKSY/GFAIPwwp9eUBfjqGQ3PMExw7y8sY+1sRP@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFucVj02PgKmchl1OK4g1BlpVLRJJH1haYaz7J7whAUXat2fy
	KcSPl7gZA0RQR38B1mp0ENFWdWreOlU4yND6LwSZ46oZxP8G3h3PIHf8gqB32D6w8eh7nu7bpoN
	x5so//AYTNHSHG/ylIzaj1YeQ87nqJ8WOygde7Pbs9wFTztMp0AZ1enTjfLTZs0fMx7g8
X-Gm-Gg: AY/fxX4f8rJ1DtAelolEzlSgG9KMmL19BOHoGvMX3U7YCyn9STIQRMC+Xj+gGrWXsEm
	qn+Uf6d8MPUPX8B8yQdg4EYcHKdTlVP5b4JENWwUxNmdyFzhvahnxewzr4uA1qfxKkTz2PBVvp3
	bBBYiyr58XaE4KEOI7ixUBhRLioJWPUTqmVyaY9jPNMU0rGMiK0b+Kji6T/e364+qrjPm78JXRQ
	RrKiLcLhsdlHDasO9Zyibqec+NV68rt3SUWmUPV9CH8/hPpjChm4Mg782wtyt9OI+niwASlGRqc
	lykTI+XKe4nUZ7WLxpOswaoFUMfOzMYa2kaNlPNfvNCuiKgSBhoHz0IGzzxKIsViSRjbAnwdFAF
	NGPrRNU8KobJpWRI+HhA0GEQU0QD7ITP0504+vqu9HdBvYWxI511S7RyoTYiYtvw7XDkAUCGnUW
	42imfPN7SK85Ogs91jS0jGQvo=
X-Received: by 2002:a05:6102:3a0e:b0:5e1:866c:4f8d with SMTP id ada2fe7eead31-5e82786d3d8mr1380518137.40.1765598701938;
        Fri, 12 Dec 2025 20:05:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb29xTnD6r+m1I1hK0XaOZiYjk9n8qaRwfr1WCLMdFOT32A7ozZS3EQhg03yVDJReUvxNTbg==
X-Received: by 2002:a05:6102:3a0e:b0:5e1:866c:4f8d with SMTP id ada2fe7eead31-5e82786d3d8mr1380507137.40.1765598701531;
        Fri, 12 Dec 2025 20:05:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fded760d8sm2884131fa.23.2025.12.12.20.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:04:59 -0800 (PST)
Date: Sat, 13 Dec 2025 06:04:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: qcom: Drop unused .dtsi
Message-ID: <c2mvshcq36eyigsmo5cbwlpk5usfsog7knrd5djwahz2s7crmb@hpen3pruobgz>
References: <20251212203226.458694-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-2-robh@kernel.org>
X-Proofpoint-ORIG-GUID: _9zzVL9y9YBxZQUSZXW3fzSK2X7vRD5d
X-Proofpoint-GUID: _9zzVL9y9YBxZQUSZXW3fzSK2X7vRD5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfXzLB1tDS/ev2E
 MBypPEM4jhD1GTa3u91YOeD9KfCcw2XrPjDH/awQ94B/BuzsLJPK7bM8J1WBPUEa5tMHceyjTMv
 Z3sbCHDENbctv9zedOWIW7R0xKRqtgQcmhxXbXdm13k2UEk7C/9NQ477ajC5e4pXAvLde1EEue2
 aN5gDfKeAxyx58MYzsj4lMDh9KdIR4eXNoPh2yhJo4ntGJRkEdFAc623e6XLZieDDWAbkxbOcpz
 CU1S+qRLsOzefE2zxV3PIQtQgBHhf3/vQHDObEvq9XUBGP1vgaUsnxGic9uxIWGw2unZWzLlne8
 C5jFJxCzv9d/IQQqElYTmz+GqknkGFHqdSX+L9LjvFbFOa7VjJHS7sa1llO9sRFcbFjxEYgmFf2
 Wd/6LYKPZ0jRRaGn5LUhCAJEYNgsmw==
X-Authority-Analysis: v=2.4 cv=GrpPO01C c=1 sm=1 tr=0 ts=693ce5ef cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=B13BkehGzsZbSpJw7YgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130030

On Fri, Dec 12, 2025 at 02:32:08PM -0600, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.

I'd say, either this, or we should get device trees, using these files.

Christian?

> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../boot/dts/qcom/qcom-ipq8062-smb208.dtsi    | 37 -------------------
>  arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi      |  8 ----
>  .../boot/dts/qcom/qcom-ipq8064-smb208.dtsi    | 37 -------------------
>  .../dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    | 37 -------------------
>  .../boot/dts/qcom/qcom-ipq8065-smb208.dtsi    | 37 -------------------
>  arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi      |  8 ----
>  6 files changed, 164 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
>  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
>  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
>  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
>  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
>  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
> 

-- 
With best wishes
Dmitry

