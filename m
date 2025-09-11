Return-Path: <linux-arm-msm+bounces-73118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DDB531DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B7204879CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBB3317712;
	Thu, 11 Sep 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys/xrdkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266CB3218D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592925; cv=none; b=TYnwnzcLbw8fGaO0fd6ZLsvbyZvvCJedJWYAZSDOhCCF+TwlvGVjxgqby7ptKghv42CNJToAl0vYClcJZ4Ik9Ll3d4AXyEi/6kPulbzQlPnPOMYHJgRXX6YL3qoK1gFVZEF/ocvZtN0T72Ygd/HEksy7s2diP3bnrTYfJGSsK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592925; c=relaxed/simple;
	bh=KbY+GfGU8eYAzle6VU7JlfVLLGsvLi8waFEDCQACGmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/wza43mtD0q81rVja9XZ2wCXM4sPkLAGOwwumPaPlHPuHlTInaUBVCW9J1wpRBL0rZUvA0+TFdvJ+6l2fFUzZz69VOEZ7EmDOx+QYlBs0u4M9cZfiO6Juf8lLvYFVyklLs2Lf3EQWNeT4M5eaQzsdOs+0Zujpeyf7kf9MYCotI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys/xrdkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8VTeD002817
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GObnP9Nzl1ngqqfb5uQqTa0c
	8SykTYTzmwIuZSpc42E=; b=Ys/xrdkXQnosg3YlpDRWCeLeLg8FbSXtg8MsXSpw
	AN/92kmr8tSxNnuQDnjH90RM2cM45oDGUsM1XtOMJJ4QyxoSh+OX5LEaPclOInpy
	7cUtWy70FAMS+Kpw50FxUHBSOIYjgzYpjAkXoY3Sw5Tp8uzqwIA/DnbzsIfc+Pl4
	qdHmZA7TY50BaEvmDngVQNVmk2W85sovX7rsd+k9Ubab6cOghGrzgPMxl4NlhZ/u
	OybwRPheFSvquObjVpGuPY1n1e+1aAe/Smi86+jgQ6HD0k3pPUjGlZnrirbN7rna
	eLYBA5mkqen6XKa36xi1PSiJcTZb4t76PvIKuyodrh3pNw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxrn6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:15:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-720408622c3so12101216d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592916; x=1758197716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GObnP9Nzl1ngqqfb5uQqTa0c8SykTYTzmwIuZSpc42E=;
        b=Wib5KmlwJtcqRBFC0I34EFaohx+CE8GxRKnED/EbIlWTppkQuZy1sZkIAR7aq/h+dL
         sM2uruzW+r3lu6fxvwxwRWxN8mZkwsmuGvm4faZwsdFe4RbG7jQZnaEJuuRzcVzOaIu+
         VdR8Dx7aHuIFaEHPN2w5lGmynvkUADUIeNg/eTdS/NfJSXgxuwMgd1LK/Mo+LvUEr6+2
         WpsXs9shLs1YGzEPbw4WZwdtzwJGbXZ4FPxqpv249YzklGLOU1I0gpOXEaA2ANUgewei
         e78YjZiIkZI33qtlkgf5yFuL8GRiPJAOdMkOxu7Hl59SW5t35GxA4yfplGW/UJZMTaB8
         kP7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDWiAu7DTtpcb2wfW4W7j4LMekg+nSO0wsMSF53BcXjRjn3QQTeAQfFKAeL2FzGKMXB0tUCJIDB72vk65o@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDEs+CGGuSoA3MXPxKqrj8yXclEwRN0WAlEnQ9pH+YOToNm6T
	G0Fd93EGsYdgfjAWISo23RD7qchhNoVABL8Trmhs0/1lTmXZcXDBNHy95jTSXFCwGemzZc1txSv
	d747HUEEVVzms+sMdmm+C91I78Nt1fiR80+Pj+f3a5ePbok9n53CeYelCBIyTpI4QeTqY
X-Gm-Gg: ASbGncsv7hgOtI+WpQ2eKvC+5wkARv5N/uDhA7dJETJYZv2YojSJTiC6umeGgzBHA+i
	6qKDGzUf0vutwcCU9XUVCDn52pP4MF79VkJ52fN0ki+81CErA8gPKoC/WIrh7GHQA3tpfWJ2pmZ
	9iXW+2LtRYn0tEeL9GnQzZ9jtStAwa6jGcWqHafoaB3rci6Zvw7rGx5FpkYlboKC6EhzJ7CmXzz
	OR7FlpR1rqa3Js1tVUnt8XDaOraJSTOP0tsDmkqBc7yGE5KggRMXSbbwUOb56DF9sRJYxVXZtUV
	ntM7n88z19EcqF5LsqJE0YWK+80DoAxv42eu2Xn6bH/eZT+UR9RLwYOPP2IEaHo/kgZpneMJwLa
	i4Bm5BO94vEMIedCHkpcb3u3OI7z8xAHk6QLv9xt0OIQdceeRbvZ8
X-Received: by 2002:ad4:5ca1:0:b0:766:be67:3e63 with SMTP id 6a1803df08f44-766be673f37mr367626d6.18.1757592916299;
        Thu, 11 Sep 2025 05:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaS5hb658YOvULqbl+MwDx8ZfHggQ7H5w2l6Z+qTVeR5//f0vC8RYh8k3Hi2nLpn+vGPE7Qw==
X-Received: by 2002:ad4:5ca1:0:b0:766:be67:3e63 with SMTP id 6a1803df08f44-766be673f37mr366986d6.18.1757592915639;
        Thu, 11 Sep 2025 05:15:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c6ca914sm2605981fa.67.2025.09.11.05.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:15:13 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:15:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
Message-ID: <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
 <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xqsUTQgQ1EgGxvErBj5DDFcH3lhMceeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfXzasQorFsH+pA
 fnPhs2uPQP6ydHeIzQ+/Y6a5BRos7r9cRuS2oYNftu1/sIONHMOVTYMEVsm/3jRBJgw7i2IVdKg
 DOiLzPRdgyZLCZnxZBLCAQ7lWtQqngeJ3DKmSiVt87sDagTwMp1KpgwSu86u80yFWyKhqk/YLK3
 xxy5vgWNiz8eG0cbp4+FckBGqrhywKmp+9mTM8CE4GySaXFZdcc5oT1gMsC2TkPKoD1o3B6Pveo
 y3gBvNmxGunAfEDNBSNsmERCoNZrUFJF7DakucG7NZqqjDCzDx0wscBf8ysX8Apo7JhrRXokRy3
 IZThnQwVsfFAntcd+wAIMRVx2V2/sDYTtJx4nNOnQMQCtq6P8dTkHwoDvfmrOqtloq+GMEcbswj
 Eqni5JEz
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c2bd5a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=D9gf5YVWuHi62kVfqNsA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xqsUTQgQ1EgGxvErBj5DDFcH3lhMceeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074

On Thu, Sep 11, 2025 at 07:55:16PM +0800, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> 
> The LeMans EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in lemans-evk-camera.dtso, rather than
> modifying the base lemans-evk.dts.

So, is it the only camera configuration that we are going to support?
If not, what happens when we get the second sensor or second set of
sensors to support?

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile               |  4 +
>  arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 97 +++++++++++++++++++++++++

At least the filename should mention that this is imx577.

>  2 files changed, 101 insertions(+)

-- 
With best wishes
Dmitry

