Return-Path: <linux-arm-msm+bounces-81339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFFC50B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53CDD1899933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65802D7813;
	Wed, 12 Nov 2025 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgKdOT9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiFQUaXT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF361C5D77
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928945; cv=none; b=Iq+XTX4mjydrddOqq2/33mi/fepMvzWYrllT/1OI6/Bob0YM1Y6myWd7YW3F3mjToEE/2dmoudO90zqWwbYOWeO4NdXCsclVXx/R+1XNa3o/GyBKv0FujT//ly6a/uUHD78rpolfFkI8zx2nkiqtOREduFo+/YyrW5CH6Abp9fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928945; c=relaxed/simple;
	bh=A7CUWqMjauXHT6hHhvu+ZIxufMH4sPH9yuX5FupcZVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwQZsaGhN8SY8Mp9QBJ1o4sOHTo+zTEI6EPJaBAjFtIryWEt/cKTmLccPqmQx9mDia8lynw0mY5cG9bzG+sRJUzB1zYxRYHSD6OahYeIfqGgNluSoAmPSRHmkbdw3AxW62zyvyL5GqkSAfoNE5FAufuTyS2840RBNOFS7mEz9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgKdOT9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiFQUaXT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABN3dOZ3924235
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzAUhRKeGOhDrL0SVzP88ptswnErMqcNrlcNyCzXAfU=; b=SgKdOT9bNkdk2FG2
	oLkEW/LEAQK9mTDR635/9241IOdAebnYCzzVOk9KKYiwBfkKVuR0GAp9+SRb96xj
	ivb/+UVJLrKHI7Z5UjWDLuf1jQ8d3vujsNScV1TrCb2xN4hEympNeuwJvI6nTkvf
	HCAqcJ5776+1wLfT9fXDD84FLtLrAyO2+flNveFjL4Yt/+Aq7wA53qdiEolDPv+y
	syRoIwia6rb0pKPQP8tJayNCxAnAiZgDsptmyLYLcCq1cqKZun+AtpPFUnqhkvmh
	Lqsh7Rcp8/yPvsy7Pif/AQuBD7Xcodu5CfsUbOK+1ymtyMt6IgB15lvjNDfV4IaQ
	eizd2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acefus0q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:29:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340bb1bf12aso1441408a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762928942; x=1763533742; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzAUhRKeGOhDrL0SVzP88ptswnErMqcNrlcNyCzXAfU=;
        b=RiFQUaXTtg8GPTSaOLHIlhG8QbrFZjkJ7+zXhzD6cNzFRETilMSnHZFQOyrUhF5W4j
         CThLa2tau33YXv0u6q9ip6aXkjH3QJesAEEgtVGiT1m/dfi9SugEq2kQdCs1eOUh4CGR
         B9hmMqQqTiqVPkclKbGDdNAmcfPD2z1h0J1JLYtU+GVxl8vRrC2PmwYSMMVJvY2gXWHY
         2SspnZnQ3dXTASO6K0Ys/RVp528b2FGGP2YBpV694XiMj5Ef+M2oZd7vSdPJRpIiejny
         WCUaIbnM7B2/VdpViSZCc8CiBCKWT5KOLkZj+p5CXwU6bOdVInkY5dxmYn47QNnovICJ
         tlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762928942; x=1763533742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzAUhRKeGOhDrL0SVzP88ptswnErMqcNrlcNyCzXAfU=;
        b=nwfB5cJ8SoZMWCG5EqOj0WvVyIQa4+4w7EYJd5kj9Q70EOnZ/KWYTum5J8U2AoZf7I
         k4coIia6W5n/Ad6NY37/DbBZ++5NKIA3hegHtgEWGwuhZka7inCiOtg4ql+6lzun5ERt
         aF/oOJ6qzlcfxKCyXn45eCuL+ICcUk4SsAavmq+YszGkixaT8NSJfJaTEMGpd8QeuF8O
         alWUWATAc6aVzaAi5/LE3eNa+klpPf2jeY0CwP7UFtqL7YmQ18jvnWBTevzvuIyZFmOb
         PjraUopiKqmnY0UPHmU9/Ez6ibzrhyYuhJCguQFDFoLHEsuue2vMfZqPoepvnaa6Um40
         gJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKT5pMCLvEdaOGWHCp3jDb5FSRbfOqmAgZK0XnwGs62Jq8Q6xXIY/7rWGG9ttFqFPuAg3MYyqVdcz4lkJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzip4X4beTk/87DSv6HBkYX6ke6uJBQdnU4xp7Iqr7ivU6QJ0y8
	g4XbTBl1nu6rCbIK+kKOCREq9C6D8rAaDFkHHz1y1WtGwOHhIcR4WBLIjucNl8JmR6biTwSp2XG
	Dh3alJcQ9BvOOEZuqZ0KK6yAqDThf6k9IfPBWGLHTSPtZstx7L8cOBTahsUbID+ydY7HM
X-Gm-Gg: ASbGncskda0BHsbIFMvq3hQ2IwHfoe1be2ez9+lI5v3jnI31fR09aRmaEK8LgVcxnWi
	OqBaUQD0C6UyWLHopv/RzoOK7Ij1mPBp3E/7i5Ra2tEeoDpoN45k7nKJ2g+ANtmJrNBacma10g3
	NkUKEcqd6uHksi5n4syT7cSzFKF52yUSe2NyF10NPfp1AVFIDuvVYgtxRUgRHfIrMPay0F7beSI
	axH73pmz3RAUiAn4GXmBRg+pxR+6y2tprjqpYNRweZMzmrkbvDTgsS2V5mdnY3LEX0+kDai9xoh
	d5PiFFQstwnzV4ni2wh/B01j+iJkp7smo7VDYJoCeWakICZCgYIdtyRNGu6QWQjRrWs9KRsQjXb
	EFLIngagQp495NkfNOEUQlwNP+f/+/aH9pKbQ
X-Received: by 2002:a17:90b:3dd0:b0:341:8adc:76d2 with SMTP id 98e67ed59e1d1-343dddeef9emr3091932a91.16.1762928942281;
        Tue, 11 Nov 2025 22:29:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoBsSl4PPVzSUNTAvxsQL7O5rfO/S9VTHWSRRJfl3UQVRGtUcOGu7eHItKP8uuHcfci1PbXg==
X-Received: by 2002:a17:90b:3dd0:b0:341:8adc:76d2 with SMTP id 98e67ed59e1d1-343dddeef9emr3091904a91.16.1762928941763;
        Tue, 11 Nov 2025 22:29:01 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f14sm17849673b3a.45.2025.11.11.22.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 22:29:01 -0800 (PST)
Date: Wed, 12 Nov 2025 11:58:57 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] ufs: host: scale ICE clock
Message-ID: <aRQpKdRkadwN2WaA@hu-arakshit-hyd.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
 <rge3ozfojjpurnxi5otwuobzcw5v6fstlvpodw4icmhimauckx@wpdb4orkjd5t>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rge3ozfojjpurnxi5otwuobzcw5v6fstlvpodw4icmhimauckx@wpdb4orkjd5t>
X-Proofpoint-GUID: zcGgleFuzseuuoaNtapyjoEXDDXTNvDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA0OSBTYWx0ZWRfXwJHFI7uPoipc
 OWJzb5PKTQQXIb6trUHHag5BT5R0ko/S8iyBquDY1ngIkHFPtpL8cYlw6LBrUrfW/0sQD4gl7g5
 N5uZIwr7Veh3IKb1MhPVXRAuyO/LapLXQ7YkTgGY7X4dgD7XEOy8Wx4gxWplTnw1mnC6dGvsTbd
 TsymNWLSwMtoGIXA2kfpSdYkGnSh8S55UtUNTxu4hc3TF6MrRSBVwSp8b+lpPb1CiNCA+Qzu4Yp
 MWPd+s73+5Q/WhlXmkwGSrsZPexCEy9WgqClHupUZYwMWShWw726Z3QzZVyLh6XDjahGcBdGeDx
 QS2aGRyB9WO52AyYjmeBuHx63M9eZzpvWoVf8a2EQCBCW1usrF75YV/IVS4SZ8xoh6MlwqWNyrX
 SY8UCwK4WByRYJapGvXZ8uoQ4qdmdA==
X-Proofpoint-ORIG-GUID: zcGgleFuzseuuoaNtapyjoEXDDXTNvDr
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=6914292f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OMFupFYHVdvZUXidDu4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120049

On Fri, Oct 03, 2025 at 10:14:44PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Oct 01, 2025 at 05:08:20PM +0530, Abhinaba Rakshit wrote:
> > Scale ICE clock from ufs controller.
> > 
> 
> Explain the purpose.

Sure, will add more details in patchset v2.

> 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index 3e83dc51d53857d5a855df4e4dfa837747559dad..2964b95a4423e887c0414ed9399cc02d37b5229a 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -305,6 +305,13 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
> >  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
> >  }
> >  
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> > +{
> > +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> > +		return qcom_ice_scale_clk(host->ice, scale_up);
> 
> newline
> 
> > +	return 0;
> > +}
> > +
> >  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
> >  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
> >  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> > @@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> >  {
> 
> > +static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> 
> Drop the 'inline' keyword.

Will update this in patchset v2.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

