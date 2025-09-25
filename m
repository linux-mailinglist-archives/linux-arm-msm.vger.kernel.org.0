Return-Path: <linux-arm-msm+bounces-74891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8334DB9D3C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E683AA743
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3D72E6CA8;
	Thu, 25 Sep 2025 02:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFlkY+kv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908CD2E6112
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768619; cv=none; b=dzvpidOPc4zvZOldyBMlLKO5JuR0fSE0uR3cCz8rydcfahZakXKeh7b8U0a06twC/KZ3WT845FLdN5xf5BtlVDszUGtAmomAuoZtRgbzDRD9jI4Qips2Uougly8sYrC4809bORbm6WXzRlxKBG7DtcNTHEtTC94tCKwYtuqGr5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768619; c=relaxed/simple;
	bh=//JuZfSiU5ZOHan2hVqEAb98T+pI2MO07exn9jj/d7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTw1ebxzR6YamSl0Vm6pnS0e4BXLhNYE5pNwBTLvv+wbXqQfEj83z+DZCNzahkmYGCCE/WrhO4TsHcvKPUcPpQAANOfDszcFG3E/wPRV9vjp+/hed2xUsNbZ9pntyhAeMSU5hW+z8H35q8dUQY87eCrJ8USFl7hhNO7WgYjrenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFlkY+kv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1EJG8016435
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aTjhOlbDGoi+nAgLRYqCc7oF
	FUvkDZHGjtvCYSikgJs=; b=NFlkY+kvk3DkDeJ7Kp3u9alaExlaj2NbPl3K9MBJ
	2DPcQdzpC3hz/nrnlDpVGZR3TKu8Rva1p1XF4vWWgAOg6FoQ0m93KAECNBzqkUny
	kH/ayuWVl+CuvnS6ryJN2hvPciWNTbqXGBGbWDuaYcQDcI2i/65PLDIe7uebt8P1
	Lt1SAmHgrgOun/CEGG9rvjIhchuUZzobq6NQQYvdpvPA/AX0qMeH3ODj/COT08yg
	+4z3VLEFTOmPn2dHvbsIcviJabAiB75kQNa5HBNYKw+25vcGcaIFPKs+AAZmQT3U
	jY0IbAl9FD5WiqHZ7lMdQGxxGVVWDAqyPg0hBjxe2rwGlQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyjamu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:50:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-856d34460a3so113122285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768615; x=1759373415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTjhOlbDGoi+nAgLRYqCc7oFFUvkDZHGjtvCYSikgJs=;
        b=R0me7ADS0gnfj9JAEdOidV77F145f3SO01E1XCB6QIeV+jLyKG8ADliNIoqFmkG7yk
         5xB/84AIEowXmZY4Dzzh4kWwZolBh0GFw3b5xzsuil4S3MfRBQRB6392SzM1Mdl0feV4
         EAhNH/PuytSs61dgnyFubYAblSicMpYdpa8RwaHPxGqA8oJxX+VyLwBfRcyiEFd9Gci9
         lXn7yd4XkCUbimir15uz/BVh/ssvlzl6i5i8iRGFnC5CEws8LjTJyNU1SvttN7qyCSPa
         5C2L0ILrGjJGfuqzunful2iFUP1FrgjJv8tq0DVppEw/vAxxH6JK9dfrHAQvC/emJmKq
         iOAg==
X-Forwarded-Encrypted: i=1; AJvYcCWBZXvVdpkc79TSt/Vwk+4K9FfizRqgPzxs6tMTahtVTX0elRzeVV2JbDZCc3/YLypmSfaKUpLVZPC6Ecar@vger.kernel.org
X-Gm-Message-State: AOJu0YzWudMuB2qsQR5YvvBcN9Oz76F14rmTl7/mVgiyWNbkpqL8xtRh
	paaq+EMEbX02OLFJ0WFEA6XQizmPRUyxLM4jLgB4kKETvuLYqpIgQmC2VPhM6e/v/Hk5yi2p1yM
	MnutEw5TUO5bAsT7CcEJe++TJypN+uptV5aZrWH+dSzVTI3Q0lsb2yEDajs1T1VzRh7WN
X-Gm-Gg: ASbGncuaGG6lP716JAu9gcUxmCz46ePhrJiWt/3+Mtxpv1319ynm6Ol/kq9QysKZu+g
	XlXYujqKgRA2dQ7bznXZ2Vc6I9oV9VX8tak7EiS/w9RjSjz1MgByyqF/ETztdBDUKOm4Z5Xp/Vz
	yvv0EWq3hw8cbI3ovl0HoVqYHTFxhSMwnT1C6M/z1PjI5DCd0fifQx8OOGsYlDbzELmokpNVSGJ
	NAD5U602ihSWzEwaf+6DHvsDXwpemwUGB14Fo1EnGk1Ylekb94hY5xJlAseN/ivmXJevWtPnxc4
	GQBr5FRqMFXowLDFqb1gF/Rpf6DCpnfAcAUUHjhCjRdgb3WdzPJLo1/wfylOBf+ZWVqqmsVNNjT
	fTpiL3Jfi6BtYcMCrN6MI6WOk7nzWwa+kDmflHadNNeHuvt7Vg2xV
X-Received: by 2002:a05:622a:11c8:b0:4b6:373c:f81c with SMTP id d75a77b69052e-4da485b86bemr25522311cf.30.1758768615448;
        Wed, 24 Sep 2025 19:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPCPAHGHm02oKWm0hULewn+TOHb7/Ic6Ao7ghcD4in2rWcF+r1bHJkHP7fu0DzmGPlkvE71Q==
X-Received: by 2002:a05:622a:11c8:b0:4b6:373c:f81c with SMTP id d75a77b69052e-4da485b86bemr25522081cf.30.1758768614887;
        Wed, 24 Sep 2025 19:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139047d1sm260416e87.34.2025.09.24.19.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:50:14 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:50:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: phy:
 qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Message-ID: <fuq4wzdsvfxromlezvt645wrjynv6onolv6kfvehwl2n3neezr@gdfbmfzkljwv>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-2-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-2-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4ade8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FDav0VyUyA2TYFF6ppcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1luTqEce5pweHrtRIm6r7egCXIbtWCc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX8q3XomlrugMN
 rpqtO8o9EJsS3Zz/WwliZ4qH9nV/Q8ME+PnIwUqIoEbQBhY5QFOL7HgbyonFVqNI7Gpgwr9/Pk+
 IMAH1ARrmPUgseyhVtjjmirzCJH2hZPSD+4w/paTGmznjXa9fQInO6Y3LraRFvQv/T53MEFTZ8W
 XoWzRLhUI7hPNWWv5+d7OADKvk40liQBln9pUZXm3h3oEnBXDNRArUKs7YezrDhycROW5zwMpZW
 Foh69aGuo4CtwdTdHIyIKa0YOudJ+DObHW6FrVv71TGkzIU/EveQ2vwrzRl01mCnoaQvyB//QZO
 QR5D1RiD4P2HNCLQiskbksAXi2EoWe2DamZhvHnEaPs+x52HobU96h6aqsj/kridtrSXBshXPMu
 fDyCmNze
X-Proofpoint-ORIG-GUID: 1luTqEce5pweHrtRIm6r7egCXIbtWCc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

On Wed, Sep 24, 2025 at 07:28:41PM -0700, Wesley Cheng wrote:
> Define a Glymur compatible string for the QMP PHY combo driver, along with
> resource requirements.  Add a different identifier for the primary QMP PHY
> instance as it does not require a clkref entry.

This is no longer true

> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b..2f1f41b64bbd 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-qmp-usb3-dp-phy
>        - qcom,sar2130p-qmp-usb3-dp-phy
>        - qcom,sc7180-qmp-usb3-dp-phy
>        - qcom,sc7280-qmp-usb3-dp-phy
> @@ -46,7 +47,7 @@ properties:
>        - const: ref
>        - const: com_aux
>        - const: usb3_pipe
> -      - const: cfg_ahb
> +      - enum: [cfg_ahb, clkref]

Either define it using the if/else or split glymur to a new schema file.
Such enum allows specifying clkref clock for all the platforms defined
by these bindings.

>  
>    power-domains:
>      maxItems: 1
> @@ -63,6 +64,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true
> +
>    "#clock-cells":
>      const: 1
>      description:
> @@ -109,6 +112,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
>              - qcom,sc7180-qmp-usb3-dp-phy
>              - qcom,sdm845-qmp-usb3-dp-phy
>      then:
> @@ -128,6 +132,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
>              - qcom,sar2130p-qmp-usb3-dp-phy
>              - qcom,sc8280xp-qmp-usb43dp-phy
>              - qcom,sm6350-qmp-usb3-dp-phy
> @@ -142,6 +147,18 @@ allOf:
>        properties:
>          power-domains: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
> +    then:
> +      required:
> +        - refgen-supply
> +    else:
> +      properties:
> +        refgen-supply: false
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry

