Return-Path: <linux-arm-msm+bounces-73765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C209B59E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E8EA160924
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695332FFFA1;
	Tue, 16 Sep 2025 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czdlgKk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF60B30499D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041515; cv=none; b=Vf+AXQiNYnGnwyL5UTiwjqXgsQGBkRVVaycL7aP34SX4ygtFjI5YHA55GA4Sl5c3gwpCm8d4zNaOv55COn81Nil0rPdQ2pobo6POtx9pkxzS+6uc5DMmf/mGjRjspnrEMzxaYa0LBPZ/HPavIyN/iuqtqDw2kZT17bGUky3Lciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041515; c=relaxed/simple;
	bh=NTFaKoTPG3Ylx63snUHfK4JT2185G5WG/QOmM/hSksE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvxoVFL9cPNzoNy7goHWlpHP9alXk/IZ9FEci2rrx2O7LQ99vUX4INfbvaQg8TXuOJMXiwR+xdxStijPwrhvxiyz63PPfGKrZ81lUg4F3DjxTcTMzlTESpfPpG08kG8mNmOM+GmOnkx1R+C2Dm/WOuYTpOlL+nDFDZh5mw6CsbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czdlgKk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA49lt005233
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 16:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=slsLYm5OKqlj4/tGuYxPcfSh
	ALvXQp26EBjotL5ZFm8=; b=czdlgKk1EgiJQBjN2WA65YPPj6PoEbXZzpIv4uLu
	zGKp2hiRrHYKpCvZrz1O1rh73sNBSlL5Ir75ECnnBX9bsECigYnjo3/AGMcDHn76
	Yi2oXMftNVz7MSyW9M9RlCrAmogp/aIYkTd+XWxYtQpymkFXY3W2y+Evj/y1jVLC
	f4sT/Y3Xb7EGDKMSmnZ5ncqhpB3yNHWKQ/H2SoK/IKX9CFHeEE9yEoCSijX24FLU
	l5xUUG//O9klvyEOje8+M8zUVR8b73Lh4Bzni47/2wM4t4qsr1JphsBim0nX99eV
	akNe3Eb3XWIWjgrwxHQkNWR7Jmc/q1YG+/GMBLu2NWAbgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n5c65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 16:51:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7fc5584a2e5so1807374285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758041511; x=1758646311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slsLYm5OKqlj4/tGuYxPcfShALvXQp26EBjotL5ZFm8=;
        b=V8GTXBnilH3oCQjfLrLOm2tDjFX+TaXD6Fw7iERLyzVaNsiu+/bC+gd75/HssDuJoM
         9KcLcwZnPsuxIifr16VneD0tltPQwlZNFhUUCNpLOJ79WtfjloLz07Zzf5H6n0+jpUH6
         fAiIpa/9gb7VBUUbfFaNZKvTlF7YxF3rzC+m5Vbjr7NZ8lgLDNbNSRj7EpmIRGxNvcWC
         kgOyLDLAy4V9yH3kj0ht+aJH7mKRKJWxHgJ76B4R304XPXy2ML3QdP5V4xos1w/9EA71
         QKl3zygC5Rw+wKr1/EE/0AxlsFryLD6duH555ELl1nlc0FIyMzwnCFNOEpR0n3+IeKcs
         knPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHghZ5w6QXk14lDVp4q7A8BexTCM1kxKCUeBK37A1FnMgNKkEoDzzlbveM7wIf/c3OLOVsFKTR295jy8D6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1BBBG+947M4qkZKwETqJLpPjFcKlOWa/3yEBqwtP3gAxZgscG
	9DTPmO2E6KwzEfcEuxs3kmNexKtO7vrRXTjsGIn0MoNd5fU/yygCxOuzsxeWKRn5zlePovNbdO5
	tcm1H0XulxLnDMCirdQPTIRbWmNFID7aO7eMsnuXZoecANCcfGLsOqrlY8RP7fhDuQgAD
X-Gm-Gg: ASbGncugBMrmuv5G7DVSWCFul/azWhd6ghGofJiqKONHyrDZDDxm8XAM6HrcV7OOfut
	oLalY0RE1V4cUghFx+7nHhNmrScB2y9Gic+/hI12OzCyNOZxIlsupqOkemV1NCNsk0IYaagOTDJ
	rZ4TW0MFD8hG96os+GpvxhIr6yjuzGdhVkicerh342zZVudfbKueSBKcyfHXaaTtmZqRnA5onM7
	+KpFPgAXDOZDOxzGpkGe83qAFxOoO2QWtmKaHU7vapEjXEp3ohe2dQ6hzj/yw4KOydii6hO74pd
	tevxcJXg0kJhB93PiOAdfpLKdHArhsLnIEsrNJEP/KtYAOT5I+Jcs4H498LLE5QZurWKjPzSmvI
	oMqKes7YuorRXw3KR8A7wO+BH01Md+4uCx1OCPiSfFO3AOmA5LdYo
X-Received: by 2002:a05:622a:59c7:b0:4b5:eb27:c241 with SMTP id d75a77b69052e-4b77d01324emr182920831cf.3.1758041511370;
        Tue, 16 Sep 2025 09:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO65Q+Mf0oRTS5mX+F2J7n0yXVW47DSjXG/o3iEcmTan0BQYCkjtUmb7DOhkUxtOumk1LF0A==
X-Received: by 2002:a05:622a:59c7:b0:4b5:eb27:c241 with SMTP id d75a77b69052e-4b77d01324emr182920381cf.3.1758041510678;
        Tue, 16 Sep 2025 09:51:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460df6esm4533551e87.108.2025.09.16.09.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 09:51:48 -0700 (PDT)
Date: Tue, 16 Sep 2025 19:51:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: quic_pankpati@quicinc.com, quic_rjendra@quicinc.com,
        quic_sibis@quicinc.com, quic_pradyotk@quicinc.com,
        linux-arm-msm@vger.kernel.org, quic_kamalw@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: Add RPMH regulator rails for Glymur CRD
Message-ID: <m425sgj5cjcm5ho25rcvwt2cc237pd65hgimtlqddvn4atejca@qqv7bndcjwf4>
References: <20250916-glymur-vreg-dt-v1-1-f5877f1c4186@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-glymur-vreg-dt-v1-1-f5877f1c4186@quicinc.com>
X-Proofpoint-GUID: 7wycvCebzhPYDKcreQjbS6f_fd0ngNeJ
X-Proofpoint-ORIG-GUID: 7wycvCebzhPYDKcreQjbS6f_fd0ngNeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX5FLM37IIEY3/
 Vy+7MXmEFODGbEcgwg94Kk3F7hux5o+uZwPKbIs3ZZAUdaizLVJs+G3fLUP0yevKoIk6nQ8ytvW
 3twgkNyLPXkBvbJLNnbg2Xn91XzrWyE5um8EczfTOfISqINeQhHO8OG/kg3cMJjNQdUePcaGXuS
 iBbT9kb7EkZ7lQubY8q0xQ7mfFLAyr45m6lt87PaQkwdTsE19r1yf1gIS1JxHZU02Jo3+ICgsK2
 pU1MIIIjn1IFU87nlSFJRhIcm0hZjFLsd8+d0FoC2hHQvW/whekMMdUDkKmECwKcKwX3XBbdsm8
 gnH+yRqhw6Slsu6oORGpJmW/zlt4xpFKJ9OOixbjuatVYbulhK1Rn/xfb50uflnlSwWvVZ2bXng
 0ocbYcKq
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c995a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=12ARIVZLCmWi67Rtva8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On Tue, Sep 16, 2025 at 09:04:37PM +0530, Kamal Wadhwa wrote:
> Add RPMH regulator rails for Glymur CRD.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
> Signed-off-by: root <quic_kamalw@quicinc.com>

???

> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 293 +++++++++++++++++++++++++++++++-
>  1 file changed, 292 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 02e1f58ab7756dae8bafae1dbe2409b48eeaac26..e17611c6c3b8e64739181f80d6ef18bc037d0307 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -6,7 +6,7 @@
>  /dts-v1/;
>  
>  #include "glymur.dtsi"
> -
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>

Keep the empty line before DT parts.

>  / {
>  	model = "Qualcomm Technologies, Inc. Glymur CDP";
>  	compatible = "qcom,sc8480xp-cob-cdp", "qcom,sc8480xp";

-- 
With best wishes
Dmitry

