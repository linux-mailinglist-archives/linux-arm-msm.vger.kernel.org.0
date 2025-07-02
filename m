Return-Path: <linux-arm-msm+bounces-63469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F30AF64DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 00:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A9AD3B0B9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 22:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAA62441A0;
	Wed,  2 Jul 2025 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVVUUWaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC21F76A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 22:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751494437; cv=none; b=bl30Fu9RVg6jml//A0VZEgNujr7Ak+12fwGFlShYuggru2GI5Q+uGuawY3P/mF42oPsvH2oUICDgA3QjzjWhUk/qQ6zvj83T/YyfvWkinvJ6MuVbfPplSRUnGuMQwZxSSVtozccKMTvuaUE2Rf5IuGTi+Cl9cxr7UCcMBmbZ3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751494437; c=relaxed/simple;
	bh=w2iNETnJpePOtVNbqgnmbME7XZUPu2RHo4XGVEMyLws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE5YhIjkw68vcbhvBYZsPETOVsq2h8+epoc8Ghi70FjcD6ydndGXqOFcIzuCt0Nxynl5cjl4XaTd/y3lj+toy76tIABExRNhnsIoIwjYGVB1Yeptg7PquFEjoUEpJACAojUs4LIp0h1EXt/083iY7AkSYcx/nMjnXIz6XNPSMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVVUUWaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DPCLu032111
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 22:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zGB24ppNOh14GIw42mY96El
	8aCCqFFdLCZMBbv4qrQ=; b=gVVUUWaON/JE2/pzwHpQUCEFKTqQ1fOb3CQWOHTR
	8t3trxBxu52ht7z38KiLCs7377cQJ8+2GnnxKIFpgpywemfOAwG/WAjyYqaGkxC/
	i3eQgqxNVsP5yRP3dUGS/nXEoBy7rxeUUYinV+eUVQUC4wKpp18xGOGiqTTHY8qt
	dNttTN6MTx7lVSKEtkOF1WgG0uOY6bIBvOLx5GORFJz4qTe5qJHFXJRgXgjVAI25
	XBkiYpK0PpByI3aQBpOsy2btq7gq8bI2cGw48DFPwNqyr0ahCka3sbujZNNzzSHk
	QRGA1H3+lXAZKxAzAZl4JORzANie3sqYIeGVRqaO19YQJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kedj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 22:13:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399070cecso1027725585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 15:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751494433; x=1752099233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zGB24ppNOh14GIw42mY96El8aCCqFFdLCZMBbv4qrQ=;
        b=CAV6Re0bXHcBzQwPNBvpew1PEpGl1WOU/u8WjsxFyYIqI06SxRBW1PwZm6KS74LsJQ
         eR9/fXUqH9gEYW/rteIy8USjVyBHMTcBURE3JgH8iEM7tuFB3uT9RmIeYKgnOCQU47gZ
         gsaT4rddbhdURMHlepaAFjYWAR1HMvO70E+MNOHfY5T//IQe0GvqMeArI0qsljrIhUbj
         0AOUtV23WfRRyBA1Il4nWMUpu0L5C+4+LYZZ13pnaXLdnQf2+ng9uH+VQPcQZWFdcFc4
         D0LChsQ5/0FIRRnMytbOIYLv9Almu58B/oqsG24ekRvYv/1Odc7agUZaJwm/5zC1CLqd
         NFww==
X-Forwarded-Encrypted: i=1; AJvYcCVujJRxCACObu6EbrrrYyLtv5OW20euul+lqY/jcwJcX/g0nbNht3xNm0kRd9b2Zs6541H2iurpGcbg6KDK@vger.kernel.org
X-Gm-Message-State: AOJu0YxFvNZHuTXaZ+Bjx+iewlXQAW4sUe9wZS0GJGOmeOttLZjHElbv
	OeF1ErW6at6CW0CWXy7YVoyJcDxs6xAtELe8It5gduWcpkafMEH0rQMYQb3AR3GxKR9WxPFDfqk
	414+b+KeuigHSBdfLpfFsljh71GYdkTdwCZ1RGlfX7MPlR2dOydflfLgEG3Vyjr+jCqBP
X-Gm-Gg: ASbGncv0/1xZG29CpgsRp8mlRjn535WfsxYbE+OfbRyG6nATDP7DWb2AjNo78BAWysy
	tjaGpgMDWrMYeIJlYQN8N8CP9sCV2IPejdt23FosetHdWbUopxI1pFF/6L5RiuTUAu2e6WnFJ+n
	Cne3ayIzNCHy32CwidoLBaGaPUzgXRzmA6HBo65JuDmMMte0l1TXFHjVNjbCFpFY77kBjOzbR/o
	fmfb2cDwtJOT10JRld6yE6NGZ/qu+NMD69AufyGVB98bfLxV9i4D9SfQjIWWeDFc+CdE1s1tL/f
	YSfRiEeEdPN5+m65ciNeqxUCacy85GaW0Y1WoE/6noBintQPOAAL7xekQyCpzkaQ5su9Z0NbwoU
	s3qfThjLdxcoKZuhVdUz0UO07PzFdDUFvHn4=
X-Received: by 2002:a05:620a:2949:b0:7d3:96ba:8561 with SMTP id af79cd13be357-7d5c47114cdmr644304185a.8.1751494433394;
        Wed, 02 Jul 2025 15:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVbGXWOKneAYyPAiO/Xt98EGwYCVb2c82MzH5+P7h62peKAYnJLAm7bYbTUXbKvi81RuMVIg==
X-Received: by 2002:a05:620a:2949:b0:7d3:96ba:8561 with SMTP id af79cd13be357-7d5c47114cdmr644300685a.8.1751494432975;
        Wed, 02 Jul 2025 15:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e31712sm19445901fa.50.2025.07.02.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:13:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:13:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI
 in SoC variants
Message-ID: <xydjgjcqthxnj7yfx65mv55d3zkjlwwdsd57pg6esuia6vjrxm@qywzftfjjwzg>
References: <20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz>
 <20250702-hp-x14-x1p-v2-1-af5b588d1979@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-hp-x14-x1p-v2-1-af5b588d1979@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6865af22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=gxl3bz0cAAAA:8 a=JcoKuXreAkErhi1c250A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NCBTYWx0ZWRfX61tsgj345n9/
 2ulCmoITpZg5KQF09Dyk5afILv+I3qF1WdDR+hcOAVdNgUU/Z/dI8dbVtLYJYB1BZGPx8ExwUWK
 BYOEVXUGRXAgk+AoREhgBryoQ71+oBsV8tMamcEw7f8wloxyy6r3WZpuWvK17dHIG6nTH1/qjq0
 6v69NZaegMunUeotXFqhEdoxk/Yh2xO0+O4bdqptXAXjmF8KQ9VzVQyF6YE/6P/mpHOXeY5L0o6
 vYf5w5v+T3eIJNVaJexymtpUED3gdDj6r2HQfwljZB70a9mionTkGXGL3ZKhk0W+CX4mwM7QCHo
 0ROiSh6CgF17dZ+GvVrkS+Dpj0dgWIw2x/7F+uJ0R1A/6Q6FrtbTX+B35BsMEmlygvcj+cSPRe5
 AqqDwaG2QAqpE2LKo4+RJUhJXcovmKioI4Zt2T8rXRacBVUd80+W7vqhDC6WQznxMRlNzI8Q
X-Proofpoint-ORIG-GUID: toqpJ-7ipAfIaRJQMV0xbpUziqnoB3YT
X-Proofpoint-GUID: toqpJ-7ipAfIaRJQMV0xbpUziqnoB3YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020184

On Wed, Jul 02, 2025 at 11:22:33PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
> fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
> split the model strings in 2 variants:
> 
> hp,omnibook-x14-fe0 compatible to qcom, x1e80100
> hp,omnibook-x14-fe1 compatible to cqom, x1p42100

Nit: remove whitespaces after comma, cqom -> qcom.

> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ae43b35565808ed27cd8354b9a342545c4a98ed6..d114b7ae4fa7b162a83a152d9bf8d3fc2d74750a 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1148,7 +1148,7 @@ properties:
>                - asus,zenbook-a14-ux3407ra
>                - dell,xps13-9345
>                - hp,elitebook-ultra-g1q
> -              - hp,omnibook-x14
> +              - hp,omnibook-x14-fe0
>                - lenovo,yoga-slim7x
>                - microsoft,romulus13
>                - microsoft,romulus15
> @@ -1159,6 +1159,7 @@ properties:
>        - items:
>            - enum:
>                - asus,zenbook-a14-ux3407qa
> +              - hp,omnibook-x14-fe1
>                - qcom,x1p42100-crd
>            - const: qcom,x1p42100
>  
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry

