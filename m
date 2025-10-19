Return-Path: <linux-arm-msm+bounces-77910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7422BEE478
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF5634E9401
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 12:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ADA2E6CC2;
	Sun, 19 Oct 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahbYeK2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A42E3AF1
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760875820; cv=none; b=d7XPYvGf4sNeL1xZpw0Od5kHagrY0iQoICUpp9F2benA1MECkKzAsuqtQ+iZC9rlOSY9upxm4lEyItNIFXvi3nR3Xa70j/wd7KVoPgZSHKhJ2Zp3DYif7O3lxnG4aNJAi4ONBtNhjZvpmFO/K98DTX6PphhgOg2MKeXSc/Ryo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760875820; c=relaxed/simple;
	bh=jTOj0i8zV4tOS+Sk6dFr3QVHcC5lOHnacWBsggnUafQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAgkoeoVu79aw5Mkkq6QY6u2Vc/XuEbGBDxbcOwpbhVxGOS0n3gF+rp4JN8bfre68kiHUdDp2VvgXj8RCJnFtMc+xiY6amasmElsIC3cjsQrXfR3f5L8yAOz220Z7GW4RNwQUGq5/x+p93AIrbdNgxu1WQlikyrS/ukeorIXPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahbYeK2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4hnTf010063
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oXZypdoDeo1tvUJy23zlSIGn
	Bm0OAc4gNdKKP1vbfS0=; b=ahbYeK2o/8Z4TcOWA7V0vrwjwOOlrxNo4EGe1Y2z
	AlyPLCVcKW4XXjINHusQVrtGgQiUFGA9cGki/IafqVoPIZahRfs0Mt7sOJXAaZzb
	NVRPw8MUdewgwtBRhMDOXJCkPvVVMWHBQbBQ6HcY3CCaSCIVuhWxRWgSvq12HGUj
	90z9hW0RVVzQ2ZmRaaq642pTY+gbHqa/Ors0a4vEiJ7jfsobx1MjH1WGXH4UaI+o
	6jv3FlK1QBqLYlpqvpRL6s7TIlnBeyF/N+0zm/x+PfX1tWjqv95taezhhl5kwxbH
	HhcibPMRuH5V0PdfPQuMN4aX4cGwAJh4iftnkBIVfGWukA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3982a33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 12:10:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-79e48b76f68so173157106d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 05:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760875816; x=1761480616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXZypdoDeo1tvUJy23zlSIGnBm0OAc4gNdKKP1vbfS0=;
        b=K6laKCxpveMekVgHcJtatk0IJoETcAdWtMgXYpjI7GSVXKbgS0shGoxPQZFvlD5UVH
         cTkdbFRckF+GpsEarzA0hhBirU0eaquIKY3dNjAazVEW0P+uwH26R4/JjZLGf81uN7/0
         EnZUO1fDYWimfZZ9a44MOs1SdkNjZoglWGwYUq5jnFQX9cyteApC9FqpkCYb0v/D0F4v
         tnD1AJmYJz06K1cbQY3+QShyzMaGwkjVtSXvKI/Zf1M7nONgHRu3FTbs4Zb7+qVbf7HU
         Ly9A90r1CcnOm0gLPEvbv+chzaWVbc/VYng59/XPrTsSAw09PzqMZPXUZ6nODoIZ1cdl
         hqqg==
X-Forwarded-Encrypted: i=1; AJvYcCWsKwDKN+F6wWwFxUkQ3jt1DC6854/8uyR7fZp1cHHx/iJgJ+8WhgF/ZSsHcieT/AVSfmUU9mZhyRcqTpPu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gRe6vGGrJ1TG5ZFYqbSjlEd5ioXi2StM8aCbGYtDPQjz0jXi
	k0bFQ5qjJiYo6PS4fj3+O3vpDJbvDgHSPsp8pNLkfrI03PsgancHVx25YrneIQZqv0e99RAc6uA
	FiXWcvbxVMQrnhzET1zDJ+mT7puQ8bbpv2ZNrWjNG3IqGFueRMgX4G1AJzvJTv1jg0S3t
X-Gm-Gg: ASbGncvoZjqFgHxo2/Rqt4xtDBoDxg/9369Kg3v/bemdsDBw6DJJRJ0DcVDC8aRqEYA
	7xoen6a8GPukl9Fp8T2mJipAFnZ+1uAFippM+1YbrwlkucHQICyRZuAKNxOXwgsx6oMKOqDDBm0
	vP4PXJGUsEoT2rE3NL2THxbWePHHL+xSx5NSz5HaLZaWOtDPhzBxwP7Ed7zHFYXiFjS10W/sXz3
	6xdzKg2Lk6ie5F+0vOJ0//Y7T4AaQbTRLSuWSH8W/NJJsD2T5tZBCipB6ybpELLXRf0o5rphExP
	GKLRXJd4Tb3isA8bxxA5QbKn3AwIg58ZfNsueUojCcb/3YtPVXMnCd6da7oLixf+hxWd3X2PdDg
	3M9nFCQzkuOIcjQGxJxkSayyv98mcyVtG4dn40XwhO2/41UnAdPz1AyoaomNFyH4DuIQaKcAMUu
	vVq+pe5nC+050=
X-Received: by 2002:ac8:4659:0:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4e8a0bff828mr85087461cf.73.1760875816373;
        Sun, 19 Oct 2025 05:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQFXMjwqlRtvoAlv2PTiR4X/GwJL5K60slTRcTbwPnJJj5IlSS9I4MUGzxmIz/JocxZMOSNA==
X-Received: by 2002:ac8:4659:0:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4e8a0bff828mr85087071cf.73.1760875815932;
        Sun, 19 Oct 2025 05:10:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def28beasm1513557e87.114.2025.10.19.05.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 05:10:15 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:10:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] soc: qcom: pmic_glink: Add PDR service path and
 service name to client data
Message-ID: <z6pivvpgdvwr43s2v5bqhsguvql3meufilye6ceenlslv2gtzh@44omnkrffnqn>
References: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
 <20251017003033.268567-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017003033.268567-4-anjelique.melendez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f4d529 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=wtoOEQ1CSsgGxPn1b2UA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX8oLYsWOnVewK
 0XkgmK6JF9wKsDiBLMigvb6otT6VtIqqesSzPLrmr3uU7gWXYqq3qJ4aN2UvA6XSNFJjcRmxclw
 8ed21w3OjdF4gdErhA1z8opjfRaGr2oWKJA63HnHRUW5pil3MVXLA477FaYYreiNuaSjW5cOavM
 sqWCkr5r5mjLpytHU21Np1V6C7LNwdtry5vlAB3Tg13PkkMnBCqs0GGcYqIIl0bBIME/xcCFIDz
 WLBvennRPU7LtauzbrkoCqwkk5zUqv2QG61LQU3zgy6LpM4NgEQWr1F05h5jzWp3ULQeVqIckoI
 4sGHUXnRQrkxNKj/sUzLIaUcPeVh/GujTlWZcckssq0BHnCh0elxJsdMWYL/O8SQ+Uaxypl62iF
 k8IsWgi/brndS49r/lQrp0KrKo70sg==
X-Proofpoint-GUID: 8f0Op9tPRY2slJrhw75S3G4HH4TlSqL2
X-Proofpoint-ORIG-GUID: 8f0Op9tPRY2slJrhw75S3G4HH4TlSqL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025

On Thu, Oct 16, 2025 at 05:30:33PM -0700, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between PMICs. For
> example, on Kaanapali, Charger FW runs on SOCCP(another subsystem) which
> does not have any specific charger PDs defined.
> 
> Define PDR service path and service name as client data so that each
> PMIC generation can properly define these paths.
> 
> While at it, add the qcom,kaanapali-pmic-glink compatible string.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 65 ++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 627f96ca322e..f64449de2305 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -23,13 +23,19 @@ enum {
>  	PMIC_GLINK_CLIENT_UCSI,
>  };
>  
> +struct pmic_glink_data {
> +	unsigned long	client_mask;
> +	char		*pdr_service_name;
> +	char		*pdr_service_path;

Please rename to point out that these are charger service name / path.
The rest LGTM.

> +};
> +

-- 
With best wishes
Dmitry

