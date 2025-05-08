Return-Path: <linux-arm-msm+bounces-57280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF1AAFF3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 17:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 346AF1BA0700
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5AC27A441;
	Thu,  8 May 2025 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0/fZMmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D6427A137
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718248; cv=none; b=MKEEkYzyvp4FGG7SGGyGdpGJIOxr/OPXm3zbrLiHOSiOP0802cDnG5IK310UZ3OvmkFYOXd2uSQQEhcEtItWOHT7d2CJ/br6//M6jqfL1I/6nAVYA1HIbrrreejlLJWsTQXk0LlA+xRQWCzufFQLsymHpbVKgRONBvl5FK24WSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718248; c=relaxed/simple;
	bh=Hwq9EPxp8FC16XFobVGFtBFmz7z8fzoxIcMzVoGcSx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ld97J2Vpx8gRcaP4Z9yxlg79/OrfghU51briESmLvs2UzFgiRk0WgNfGLHxq2dsr6Dvgvk+gFKZ3K9YIKhQUmrLLOTH8tE2mG1VyPGbz3gkz+OSARtuvbnLTodrtYk29RELfJLPSe+KuFkONO4et9rUAXd3znbP7p0B5JYeQsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0/fZMmC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CjwNN022870
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 15:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fG5eq7oCcGLrY9+nU8ZI5t59ab5XGtk3o4t0+xbuPO8=; b=c0/fZMmCTTH1DGe2
	NsD9ace0U2qJN1YloODOXZcPPuTFMbUnIrudzy8bYOgflQz6n+QVeQ7c/ea8e8by
	G4na5bv9SBeUeKYIVTCGDndXpQSy6jOAxraI/dH9bsKqgD/tU4r/SOKLyVLEsC89
	2cFhc7Tj9bdaFuMbppRomMpfzPQvtAo2YlNW9js0VWjafRoXZ3KtfX9xpKK0TW1K
	6X7jF6it0vJD2RpP4LYO2/BMwV8ATb/ozhFZm4ez2/EZVx+COSfuKsKKHksjlUMr
	xzlyKbt7B3HX/lVwu6vorWp2FUEIZaP9ev4HXgVq12BigHrweocIh75exXV6oLqC
	1EmKFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp81tbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 15:30:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso26255285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 08:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718245; x=1747323045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fG5eq7oCcGLrY9+nU8ZI5t59ab5XGtk3o4t0+xbuPO8=;
        b=EG9SQFB9B/b92m06j5J4JASStwDrvEaloJXUe14Bm7JfgCXrPtxhsuh9nnsmub7juj
         9TT1hllYTuphp06ur0Hd1KGthxW1ROZoy67QmMYVLwjfg4N24h0ZJ0Jtl6MOeT16JZzO
         YHE6PmMgMZ7UCO5GNjcAszBUSBPMbYNpbEiWWjcMz1ZQOlfkhi0zyUkMc/CgQPyzDfU0
         KQxA7oH3ETo4AIEf5j+WJWqjmVw0kRk+iQwLoPvo/NLSCMJ1LMhtdWrew2bbDS9xM3S7
         EgkPkdSzB71qJriPgBJvuWnC9CJ2NvW/T2OwBIYMWjRYCA/XAPyshylaHYL13k3BwX7r
         fBRg==
X-Gm-Message-State: AOJu0Yy+v3ytuLI+qlwBdB+m3syLVgW6PHqfeajfL2GPMfD0sUtjsdd7
	HfstmbpUIT5jSvkS5xk5HDTg1Y/WBMdM5TDnFx78Z6oMfoQGzF52WVapUNtVzFj+bl+j5uY7B08
	mqMS/AFMk/GFmWVcSC5Gz31qRWZPfx5HL35sixyyVG2f6Di43tFZE7Kgh4Ki9Ib10
X-Gm-Gg: ASbGncvuXMvpF5iIcYrU/ovdQthLyMuAlUCfIGwi7lDnxpu+tnK+CuoeqbMMaX+z56o
	s4kEkr+eWUHmmKTpHoudDfc/PKDumJS8Whswgw0Qm7J6WStu8mO7VrqNeHA1fJAtoIC+A0BMGW3
	sQHFZmazn9IhgSzjf62SsIozQfKeX6v7GCDV5OahC1jTaIvesWLxzFrIDQUE/d7qS08OHlW29N9
	Rubb+Bve15CApULWtAA4tkOrCVZIMwUhaLEC7x0XtGep8Fe8LaWfRymmVjuOKp6PeXvmumMxjHs
	WNEY4Mf/Z6XevMiElAe+3s/NAqhjL5Nh1WFKknW8Y8rqqNZ+VDN1awKs/5jbfSym56s=
X-Received: by 2002:a05:620a:269a:b0:7c3:c340:70bf with SMTP id af79cd13be357-7cd012a3e67mr101185a.14.1746718244736;
        Thu, 08 May 2025 08:30:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcHhfv1CePMih+NQ7khTsqGDoI3CoI/rsyT7oxNoEd8Echel305z0c+OwfziY7rWKZ5y4aBA==
X-Received: by 2002:a05:620a:269a:b0:7c3:c340:70bf with SMTP id af79cd13be357-7cd012a3e67mr98885a.14.1746718244301;
        Thu, 08 May 2025 08:30:44 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21974701dsm451366b.116.2025.05.08.08.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:30:43 -0700 (PDT)
Message-ID: <b3c662ca-16bb-44df-ba68-faf55b1e3dfa@oss.qualcomm.com>
Date: Thu, 8 May 2025 17:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] scsi: ufs: qcom: Check gear against max gear in
 vop freq_to_gear()
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
        bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
        neil.armstrong@linaro.org, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681cce26 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=ufAJUjbdAAAA:8 a=Ell6U6KZOJ3Qm4-2En0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-ORIG-GUID: ZIuBFKMmydu7cbNACcmLRyXduOj8b-8n
X-Proofpoint-GUID: ZIuBFKMmydu7cbNACcmLRyXduOj8b-8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNCBTYWx0ZWRfX9dZxog1dw3Iq
 3lpLYrCPuvHYm2C2ojyxDoZNCYZUnUcTxa0Tdsk0qRe+BIIfRN7oy2mwzeXTorev3YWFU+ezzeR
 zQtXK/AGKGnYg2f451nlORfunIBuK4eGZ5dCJsGYgQRd9coQyShf3APRHS/3fs1DmJWRgQo1Yqi
 a6+NiVh6EBaVC+JPiGvWObOvkCf/+l1GVkxlQIy9nhTXMfjkOBeC/2DL1ek1ouUp01IbmzIS7yA
 p9RpKVutVSQAzREo1co7af/5h2F4n1b3i+RexO540PIb3sxxaSXONO3lnTFj0wneEEBFEc8tjU0
 RMW+qh/91nysEgTqrTLV2ZN9lwFV/aZCR9qalV7pF/TW42fG+XXeThf5NLuEQT+DTbJXlbykNI6
 B4U65PIBHZCZAFbKl2O4uUp+giGu3bzbHV4RnU/aQ1cp95WdNoeL+CoXhRmpB4rcKJc3VgzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080134

On 5/7/25 9:44 AM, Ziqi Chen wrote:
> The vop freq_to_gear() may return a gear greater than the negotiated max
> gear, return the negotiated max gear if the mapped gear is greater than it.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> ---
> v1 - > v2:
> 1. Instead of return 'gear', return '0' directly if didn't find mapped
>    gear
> 2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
>    return it.
> ---
>  drivers/ufs/host/ufs-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 790da25cbaf3..7f10926100a5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2105,10 +2105,10 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
>  		break;
>  	default:
>  		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
> -		break;
> +		return 0;

That's UFS_PWM_DONT_CHANGE, please it so that the reader can more easily
make sense of the code.. Actually, perhaps this function could be tagged
to return an entry of this enum specifically

Konrad

>  	}
>  
> -	return gear;
> +	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
>  }
>  
>  /*

