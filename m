Return-Path: <linux-arm-msm+bounces-70963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9771B376C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB7DC1B66C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7D215B0FE;
	Wed, 27 Aug 2025 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ogvv1BvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CED60B8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756257580; cv=none; b=bSae7krkq5u7NVVykUBGgRtYziuhDpp2SEP6uvS8Kie3lxtVrYxu8gFDGnqDpThvITRFMOZ52p5wLcr6pXsScl+XoOL0ZV15h+EIwIiKhg0gJrSNTP302xHKObQ/tuWTw2YMubhQNHtvgMUhp1T2R23XI6c+KXsMZsGSXac/I5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756257580; c=relaxed/simple;
	bh=IGCfstwo4XOc0xf+hWEIuk9cHwoPJ0osldUwqBU4B/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C258biM/x3alACFy5Xd5Ys6ex+47PV9XGRg84pI/40j3VGDiSmZjJ1T6YUIRreax1GkVnpqjEQSOwd4ZCYmyANwBbOiLZW3NitoK1hrzTlNz61jejH8Zv20rFW6CGycNCHjT0CQYj1a/CQVlSxVi3Q1blbFYtXAkd/r0n/x8Z90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ogvv1BvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLjk8k009905
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xsfaAguD70cRUExIu/eQLUJc
	3R3/gmniu/91/era61k=; b=Ogvv1BvZzZ7kyjcMnQBqHm6GBk9L1iBxRpAU3B3i
	BPnKoef9dbBIOpHVNMHgwEHZVjAw4axS1zhgy5hcnhPpcp2Z0mEnfr5n13886/A7
	3oVF/8PwMXFOK2U43a0X0+UkkwhKNaCbClHRCGHEvI1wyT40DnOZ2p/vNJIvFvd7
	VC64J4KjVPQkDmjURXuFPvAxk0bm/dWTU5JxrK6GwPnx66uP7jEhi6KbvefBJg3D
	yKItGNJ9wHyPQhUrVpgXfZnSakjDMiumy1rE+FPfsn3i43NTL65zPHH60ZD3HVUv
	SXw5WZmK4CTDqFDkDiqNT9cw8kreDBnzOw7D/WYpYORtOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpu2kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:19:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2dab82f70so61757701cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756257576; x=1756862376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsfaAguD70cRUExIu/eQLUJc3R3/gmniu/91/era61k=;
        b=Q5A/MUctDdElVMv/Lp20rrxZz2mfE57pi9EvFFrsWW8/DOxa4L62Y50q73t4Z/lGwG
         ZZpq3vbmRxyfPXx+2jA5UtOiTiUqAv/r/4anSSxTVOHn8eIoyY7R1xvKkcMT5jL2A9Vq
         TpqiChbdlw1sZa5C1atBAk2tau/O0hMqcPQiIza2XqVBbTxs3Dg5j2e8MMUXAvYAFKiO
         FOjkHspd7h1fsSItyI/DMRMRSze48MkLPC2ngViyuawpFuPmNA2mOObxMO5U1sf8g9Zj
         o3M/3zuSGB5a3r5PZT0X/GOSoU2BDK/LZAs62nEfVOR2o3xD6k+CjujFgieyK410rIJF
         C+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXPkNrUI145ibqWIO6kZuGzlz7aTFMFjuGQOyhODWNWyy99uz6ahzSGvxCDgQ7cJWrLSBD62Ur+8BUVhqZn@vger.kernel.org
X-Gm-Message-State: AOJu0YxIG3QitoN182s09kYl4fjEjx9E0GSIO71r/mouj85FI0r4gkDR
	Spz5Hbno2j6Nm2ZWO1bKLzEnD8jHjNb6uZE1dzsMCi6xyzKLQV19QTuYutr8//Ln1W9mS96lisV
	qiESX/8ydoNMUufp/wFWgqZQX+hzmexuOKLBqbs4Rvnfj7In0ftDE9DlZbqK53typpszu
X-Gm-Gg: ASbGnctnVgBvEl2WVZvS2TY6cugehEZxAH6p8pool4nxXAu8SxBadcXWoviT7lhDqcB
	OsGm0S/xRnchw/Kqe/K8N+bL0G/bDj2+6rPchPjd2fpQpuFpT9+2lfgT9C2/EjWFho/LpLolZI4
	3VVEY3yKtk/3nUwvkh241lRAKkm5zoqpgDmykd6yr1Dxh2BK1qyXzS85+SbuycolJpBd1RrwgCR
	ll0IOPQpLtzXnY2esd2tqPS7T0G8o6/Pttr3JZDkiHv1cPhvGn7IY+1osAkRjhCS6tjiITcooAD
	gcnQDje24OiEm7Rg2d+JBX3ff/dOPt7gzqKDtWZ/LNQWT2S0Cf9Dfqj/ep8qm9eUeUTV+12kW/n
	Kihvj0aGxo7ymU4nTbuOA1Qb+esDcUtFMcc62PPb/BLFOttzcUsIX
X-Received: by 2002:ac8:5942:0:b0:4b2:9603:a4bd with SMTP id d75a77b69052e-4b2aaacf398mr219214661cf.45.1756257576204;
        Tue, 26 Aug 2025 18:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBIJX90L8EObhiLkdvR77pF3EwleHjpNvQLWAxyOYReDyxz2hOIAWEk7V784kNonw+M03DGQ==
X-Received: by 2002:ac8:5942:0:b0:4b2:9603:a4bd with SMTP id d75a77b69052e-4b2aaacf398mr219214431cf.45.1756257575696;
        Tue, 26 Aug 2025 18:19:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c02229sm2578423e87.24.2025.08.26.18.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:19:34 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:19:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
Subject: Re: [PATCH 1/5] dt-bindings: mmc: sdhci-msm: Document the Lemans
 compatible
Message-ID: <lxcbfiiw5ierl7r6wmrmkhkyavhysddfb2ndg6ydawb32xs6ju@aq2jkmx4irrq>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-1-08016e0d3ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-lemans-evk-bu-v1-1-08016e0d3ce5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ae5d29 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EhCOwLgeIwc9STI1HsMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Zd0qABmtTSv54YTIuK3FfKH8-LOOPmV9
X-Proofpoint-ORIG-GUID: Zd0qABmtTSv54YTIuK3FfKH8-LOOPmV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1KK6Avviy1tm
 EakeXz7hKSnQ6kK/fLixUaKBEugsahwS6zs53qy3stjvdgjLrxzVDcM17AemQ0nI5ho+ad5G4tF
 lRP8EzfTmw1Tnh3M8DGTGXf8cyn4jq9oTF78g8pUIyxx1WfRE8vH/ZYbqFQwi7p7DIAv0Pk9+/a
 6tc4HwYMzBCuDuFkTccBPhDRyI/ul1Q78pV0D2W7eXsJjFcbIgp9Jf7jVUYplFRO8rnJKuOcOXs
 I3J9qjf8wafUWjCXle6d+CJT2hEbW4U2qDguySXPcY9nsmYe1hWUSJ5qLlirMtxApWdb1tDNxUG
 PzzgfNCxiTJTyqxYHXwQ8L9wanGSBLzVBRllKfs2SvZ1y6yeMWyRhylrzzGP46q/MdmLEZXNUnX
 KB95dxdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Tue, Aug 26, 2025 at 11:51:00PM +0530, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Add the MSM SDHCI compatible name to support both eMMC and SD card for
> Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
> compatible string matches existing Lemans-compatible formats without
> introducing a new naming convention.
> 
> The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 22d1f50c3fd1..fac5d21abb94 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -49,6 +49,7 @@ properties:
>                - qcom,qcs8300-sdhci
>                - qcom,qdu1000-sdhci
>                - qcom,sar2130p-sdhci
> +              - qcom,sa8775p-sdhci

8 < 'r'

>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
>                - qcom,sc8280xp-sdhci
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

