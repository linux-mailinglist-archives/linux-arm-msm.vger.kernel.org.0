Return-Path: <linux-arm-msm+bounces-87053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DEACEB491
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 06:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 579CF300C2AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E68224AF0;
	Wed, 31 Dec 2025 05:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGth7NqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBanTQ1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CECA5A
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767158394; cv=none; b=c3iKiJ7ZUCL/iDxM0ZM1ZgLiHJPO9gWcGSDjpWGUP5Di/RNKfiHb7naIgpwy9nnDvVtAzoC7ccL6Bkq9hrjH/q/r/UW6U18NYXOeVmqhB3PdL7o9k3NYnXKGrtwx2jmer9ad3VvfIbo62JvY3hEi5IpFsk4P4GePdMiQnO5ydD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767158394; c=relaxed/simple;
	bh=Tnd03SeHSblBmICbICc1rJVhRKXPHHsr6lscmLdYyLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM8/CrhZh7DTqnGnmy2wgw/jRzsNa8GGOWMdqr/h/moPAgWLFMfCZu2OZmaa0Pvw7yMHRPTIKGUOK9+PjdR5028cLsUy8QTAmtb0bS85wNJONFx2t18ncin4zxhkZVHD4yj3r7PQIDSV74gSfxT8dk/0o9lRTka6qBHmIcb75MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGth7NqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBanTQ1f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNM15w814410
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1xGN2zrEApKTfUGasrY25ZakIX/76v/M3IaDtOqOQQ=; b=hGth7NqBa33Enw2V
	E8GKiShuylBdjziOorxs3p7T9Y28DN0vz/ciDWm5NyDZEF7HrLQeaxJxUmw3nyQm
	J2NawsZy1F5F2yOwfNt9HKx1lUHVtSru+3B9D0f5rFWTr5XGCcbW5DXEVSPx/kaG
	XJrlNc72mtiHEwk+9hGFqV1lcOwydYvUWnCC4bDL+HfwEp29DgCESQ5ru60lw+WZ
	sdqu8eQPdzaeEI4dnfJ8TVdV6KR8UqTajAo5Avm+voSXuAEsVXgUwum3Egcz7ajj
	o6WlbpgVWBLBNuItTtTIBViUoFEHhuGsnXlEp/SFDrXAtDexcwBIZqKhh3DyAYu6
	6dOSwg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sguk2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:19:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1dea13d34so255488451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 21:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767158391; x=1767763191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1xGN2zrEApKTfUGasrY25ZakIX/76v/M3IaDtOqOQQ=;
        b=FBanTQ1foMgqdhPd3rYO3rAXRpxP39v/vfuC6tlFsr5XSe5snJemh0g7C/xZPeN2UP
         x+3S+8nnxuOKq+gvxEyyCQZSrvkCGXO/zsWLv3pcWsD/IBZVyRNtjB7UfR2wtNJ5wlBK
         ohNSNu3IZyEV10NKkEtClxskO0mgU9jyoSGzd/wqYT1ilAujAySE30kOrXNz93ph45hr
         q8gDOscm6tjao7WOeK44KjJklvJOjaGHvB6s+0BoXsDxKlpqxqkRlFR/3x4NPPlXGh2j
         0eeFYCl0+pId7jVItXomRpuPI997S+2pBvqdNM2czpqBiXSmzMh1iVrf6+o+y3ma9exN
         ItyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767158391; x=1767763191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1xGN2zrEApKTfUGasrY25ZakIX/76v/M3IaDtOqOQQ=;
        b=pSSabjgEXpYbjs4jjOi91hFFX3LEAlnpKCxw4pDcJ7OQxNS5Lez5Zy18zpoazs6Yrd
         wdEYP2Xm87ZQ2aMs8QVpNLamkR5/1vOHikk65R9L5YswGz1//WDsljLbh9PooeqWiBkm
         CvmCZdeX6MAs1cH3wjraXyK+ntIQcsrkyWpt3X4ymL+5rjGLYjUUcR4w8Y4OEOs2D0o5
         iEeOeq7ym8sarflYyPq+wWUfGu+3WLbnUMGlJRXCVa7mvSrXUF0pBZkyHyuehAi3RCNQ
         5NyUJeXmth6KNf9NqxJ2Dnmz3KLeZ3nmkweuZ/jABw2jnXMvL8J1QYx1kGl6R17Sem7x
         udcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkZbLhQNKqzO2Q5dN1d6PeUpuGj79UZb6/DyCBxvZjq1lfkE1D8vH9zTg61E1ftoMGIaJoOksDY1OmYBIE@vger.kernel.org
X-Gm-Message-State: AOJu0YzhIcmxFaafML86MQ/1h1+c0a3fOa1i8dM6TPVIjimdvmPiVjkf
	gPaEwh0nnRgL9OnDGnI8wJanuvr1fdgdut9S3tN6D0EdZvTxRkluG43PvMilzwN9SyygcTQc9ZB
	8XOv8bQcz69GZC/mWbbm4UFE/XwuOZ9317mRgrWnW2F2LUVCodvUvGBIeVpOcwn73Reg9
X-Gm-Gg: AY/fxX7M0c9UfAjOoRsIapVFvn/p/6VTzrZBXqOLs/deAxsUhNarsgMBZqAPyMMaet1
	AO/E5m3Ks5Tzf0Lj5Aa/8CWlf3bK9BiOlaWV0MaLj5J0DCV7UCk6SeHQTjJR1gx/4l/tzESe5O5
	hHzQdcZqR4Kte8vYKfhLSaLgOqMeQGtofnYw9HM3kgHYKTR4tloAjJVHHxfUV/XvssggFGzScQR
	YevhOV8mGJJD4vo/WQNhaxXwHUXLIgnX8A76FkhNPYfooLBHi8j3I3yJnub3SNEOh+BJ4Znmfoo
	PfrDIVN0J8R4Kkq23WfFCBTiK32HiaMhsK2FMTcI0ZQ0nHZtTm8qbBpVraOcNB9w+zCvSrQay8L
	BuijSVDxYn7gu4/FxhMHQdJ3nVgBkCH3MJ/8SDdSuRZfaDd2mhwAgxpe0NitJ6XU54/NEtir8ic
	1HfZa8E/fUBcFZHKWX9NmUgv4=
X-Received: by 2002:a05:622a:5a15:b0:4e8:b4d1:ece2 with SMTP id d75a77b69052e-4f4abcf3831mr561542231cf.18.1767158391284;
        Tue, 30 Dec 2025 21:19:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKFKoJm27t8xI1H3Ei0r+lIm0m28X2cssif0m/ROwGs0/pHyCtk45EViySb1qIrUoNgUgw6g==
X-Received: by 2002:a05:622a:5a15:b0:4e8:b4d1:ece2 with SMTP id d75a77b69052e-4f4abcf3831mr561541931cf.18.1767158390614;
        Tue, 30 Dec 2025 21:19:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b36dsm101143511fa.30.2025.12.30.21.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 21:19:49 -0800 (PST)
Date: Wed, 31 Dec 2025 07:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, anjana.hari@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/4] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
Message-ID: <4mq5a4lhboymigbaruphlhip4zvmxl6xusvqrqb57bhx3yirt4@mgxdlr5onl6l>
References: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
 <20251231045553.622611-3-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231045553.622611-3-ram.dwivedi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA0MyBTYWx0ZWRfX2+6FKjW2+R6D
 KEj4itkrhd+3bfMDKgjjd+E7yUqA/pgGoqX7uS4p9JJp8Q+hH8u7L1I6UJIF0U8D9OilJwdRFpt
 0rz5ADTOmYfNFp9CbnF8CYM2t1MDlNkBG28YmyIidZQ8/EXhHHGA1zblwPOQgx/DGA7KlCfhlag
 +Ut7nkhMehyBzeuEQSNESfVtSeNyA6ddArSSH0nPOEfQT5S9MfFeD1ru8NCBilJPupVQdp0QYhM
 gOymvAsH6rySdufa5ytv0gd7d7vtM3Hp/I0NFyKgyoEHrec72hXa9lnJJOgCfIUQa4sN9u/2C29
 e9ffZAQUDDuZTUmTI7kwudMfjGQtPt9dieJTgJEZoWyo56o7gZf9rYV7AvfyIv26D4UYZYGmWa1
 FJr9aQaW97kP3YLs+IlsccDqvoPMQFuXOJ8OVLJrpJLjOEYkwtBGQfZsiiwGiQWbQNNlwN7EEm4
 87cWztDkVvf6d7iJJwg==
X-Proofpoint-GUID: 6JUzx7a7gQ2M4eE6dPBQyD3GIIK1EStB
X-Proofpoint-ORIG-GUID: 6JUzx7a7gQ2M4eE6dPBQyD3GIIK1EStB
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6954b278 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZEv58NsGN1HZl9ZWw5EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310043

On Wed, Dec 31, 2025 at 10:25:51AM +0530, Ram Kumar Dwivedi wrote:
> Document the device tree bindings for UFS host controller on
> Qualcomm SA8255P platform which integrates firmware-managed
> resources.
> 
> The platform firmware implements the SCMI server and manages
> resources such as the PHY, clocks, regulators and resets via the
> SCMI power protocol. As a result, the OS-visible DT only describes
> the controller’s MMIO, interrupt, IOMMU and power-domain interfaces.
> 
> The generic "qcom,ufshc" and "jedec,ufs-2.0" compatible strings are
> removed from the binding, since this firmware managed design won't
> be compatible with the drivers doing full resource management.
> 
> Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
> ---
>  .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> 
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

This didn't really improve. You don't need 'soc' node at all. Please
drop it.

> +
> +        ufshc@1d84000 {
> +            compatible = "qcom,sa8255p-ufshc";
> +            reg = <0x01d84000 0x3000>;
> +            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +            lanes-per-direction = <2>;
> +
> +            iommus = <&apps_smmu 0x100 0x0>;
> +            power-domains = <&scmi3_pd 0>;
> +            dma-coherent;
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

