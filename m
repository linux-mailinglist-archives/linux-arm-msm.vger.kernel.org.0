Return-Path: <linux-arm-msm+bounces-69974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DBB2DC52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68FD67AF4B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45CB235BEE;
	Wed, 20 Aug 2025 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7zNs3Ey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA272E7636
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692731; cv=none; b=nN+Alkkt8Cn0Fam8zCPYDSjJirgPitQ481MCoQ/8kPWPKvbRJ1oP86ygP8JjXV9t22AZIhcl0Dsp+SGWDN1TrLxq8VmQuh6P7fnfT+iPTIFp9KsZnCzn63DgvSHgQWTInAVi40y2Pd18KFWlYgY1b2z2vKa0bZ+ftQX01KRHcsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692731; c=relaxed/simple;
	bh=4vHHZXeXVwdz1xTWxcabEs/d3nrNswIPqPD8RIZ1EWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmhrvRNXE5pEkiOtfYb8eqcA/JD5aF3TJrAWY54klUPDTtWgrFF8I3gtidntqjeqBDyLKAdi/4lZAApT1ygtUlzbAgfvhgpn84svyBNAA0Y2ip/wfqrZawGmJhSmrOMBAkP0O1OOdC/xQ9AmQz/vbrEPc8+fQ0f0PqhKLYpXfXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7zNs3Ey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA2OFM019714
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GUc5/lZM2Qr23AxRX871V/L9
	uMTIXcimhfTf3S34sU0=; b=M7zNs3EyjvVwNKYasf4CwoLIqG8v3mCF5UIIRLUJ
	DxkaGDL9IMpS9ya8W8u/Qz37G/7iJz/Yg+1f85FNjihZGUOdz05aYKz6K7zzG4dR
	2lDHs1d1PevbJlPGvoYoAvq7HlfGjCbj8Nae4kKyk9hzI6lj/TXX//pGzuo7A0vp
	fmXKwOywneU03bUC7FG3afs6nynVyOQDEEM+EysNppgiEGxMs3dhnLJPLzAXWvTX
	LrcKzMsJpyhu3iNSBygIpaHWyBJAQZhxSb8Mi/jroC6Wmiffo9mKyR8AyDpxgATP
	KnBwqwKrq/yZkCFU54sKkCcB52SYSuM94shGVV8KV5bEig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291p3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:25:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24456ebed7bso10955865ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 05:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692728; x=1756297528;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUc5/lZM2Qr23AxRX871V/L9uMTIXcimhfTf3S34sU0=;
        b=qD/WzJ+CFRDu61WGM+2D0yF7zg/Uhd+WqbVkqYO0HzabypD5wLozE6gtVDfV+GNxAv
         E9a0p7jcXPF5GR0MZmFRZ6r8w4KWn7zSeCAxOHNs/aWFvJTCugtJXtEwI1J5LhAeuRzU
         g6R9PUxhRxQtHEqXmEJe3k4Wtndb+0h9H0d1X45LVpR8vtnnuaN90iDsxWszbnI75QR4
         q3EiFbs6i0gsUDGyKUBA3Rz+f9NNnAEb83JGnWNzpr9LNOj2QojGqm5/t/FeunhQKmMl
         echu00j6tz7TLEgJdmsRvrZbgPo2s/vfpN7XWamCEIQZ+kfdT5zc8lgOqVo2Mm505PrE
         Bbtg==
X-Forwarded-Encrypted: i=1; AJvYcCX9dlVxW06hqb16O2gwG4h4+RoXPXHpfeDp3VDnf35MyHGt+d4csZwHCEkdrcchWLVmTz45FDcfJEuRjc5q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XiEkslUfCxcnBjLRjlY6pYCSECKTSXOYwB1lqe4iT7v7EWSI
	u6I+hgrb5wNeMixCkLEH5DAskicUzXSZA0rMs3dRL+A88F8XlTkT4Xqo0+wOcAAB3MWIuJwpzvM
	ZMiBgq0nE3OnoFg1hzNDwlY23NrlujKvy4W6xiavKRwQ81rMVbw2BK/9EaAvzt0ds6OBG
X-Gm-Gg: ASbGncv6LEPpx7EvJdJo9CI2L6molRKStjZw20MTBrchYT9PnirIP9ZiFy2Gx6lQPQZ
	egcTDXmm8OuBLdX+UCyDUb8pawP6XGri2HQIkmOEbl/0Bgs9EosJyDFZ7xmVqhIONFuA5O1UigJ
	LVJKCPNpGFYoVKUDzKLomnE0D5xaRfj+h6/pBqXjf0XjrDk7qyNwEWbQzGpBBAXwM1vdYUzSjeG
	GJzQypmtZ+C5UkOK+Y8IrRk97PfEKwIkE7VRZws2UmYZyBZ7cgBbazQ87pzRTMDXt2eir7YQXNR
	I6b5YhnIC+Sl8+C3scdSfcRmV8OF6gz1pJWH/vDfdaCXSn9IQqlVrqTDu/UmwdOLtIY=
X-Received: by 2002:a17:903:1d0:b0:235:efbb:9537 with SMTP id d9443c01a7336-245e0909486mr68061895ad.3.1755692728123;
        Wed, 20 Aug 2025 05:25:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD6fjuRv0/wSn6AAy8kqeC9Evp+qbwhvgRykB5h54MJrgOnLweG3u/L4pEa38E2DtlTI7lKQ==
X-Received: by 2002:a17:903:1d0:b0:235:efbb:9537 with SMTP id d9443c01a7336-245e0909486mr68061625ad.3.1755692727580;
        Wed, 20 Aug 2025 05:25:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e25532b1sm2258281a91.13.2025.08.20.05.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:25:27 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:55:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
Message-ID: <20250820122520.c2rvwlrspatvnst4@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
 <ea769342-4d0e-497b-bee9-ed761401b63c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea769342-4d0e-497b-bee9-ed761401b63c@linaro.org>
X-Proofpoint-GUID: 91ccy_YRsX7peApw9sg6y_FXV4GUNTyl
X-Proofpoint-ORIG-GUID: 91ccy_YRsX7peApw9sg6y_FXV4GUNTyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2Q14Q+KakSW2
 9dBE6fTQ0oSMQ2KYfQ1PuOQt/dvzO9t1Q79x9aj6HEj8lq2ZP4iEbPBRcnwpjxJqfriXU/y+fi2
 zqGIelj8rgClCDuTfmMW+l3vl2EfILEbMICLdmPzL01x6bR1BsFRP+ZjfhYDtKSA/Xhkt3TVBUo
 cg9mRn24W1ecC4sd80P1GpWG9UVe6oChYoAP+cpMMMCoj1Vlww91NVTn+Ib9DpKa4sBBxBNJtfL
 46mKjgO0MEf09FdyVhLyfGGVGyBUtzcWwJQrpbVM4VywJyPOaskN89cH8xFmselF685y1k35CVq
 hW6zwOAiKjcoLmvA2D4n0LG0V6WldUy6k/YcToNjShpfr8sgoTnIWPOzNOHN9xzz8mcMppc5qfq
 XIkSRsWc+hQBiZonfcHCOjTl3uvvpA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5beb9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DgsbP352bVNZhcq8M8IA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:48:55PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain this context until
> > authentication and reset, while non-remoteproc subsystems (e.g., video,
> > graphics) do not require it.
> > 
> > Add context aware qcom_mdt_pas_load() function which uses context
> > returned from qcom_scm_pas_ctx_init() and use it till subsystems
> > is out of set. This will also help in unifying the API used by
> > remoteproc and non-remoteproc subsystems drivers.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > If this approach is preferred, will convert all subsystem drivers to use the
> > same set of API's using context and completely get away with qcom_mdt_load()
> > 
> > -Mukesh
> > 
> >   drivers/remoteproc/qcom_q6v5_pas.c  | 53 ++++++++++++++---------------
> >   drivers/soc/qcom/mdt_loader.c       | 26 ++++++++++----
> >   include/linux/soc/qcom/mdt_loader.h | 22 ++++++------
> >   3 files changed, 56 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 55a7da801183..e376c0338576 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -115,8 +115,8 @@ struct qcom_pas {
> >   	struct qcom_rproc_ssr ssr_subdev;
> >   	struct qcom_sysmon *sysmon;
> > -	struct qcom_scm_pas_metadata pas_metadata;
> > -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> > +	struct qcom_scm_pas_ctx *pas_ctx;
> > +	struct qcom_scm_pas_ctx *dtb_pas_ctx;
> >   };
> >   static void qcom_pas_segment_dump(struct rproc *rproc,
> > @@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
> >   	 * auth_and_reset() was successful, but in other cases clean it up
> >   	 * here.
> >   	 */
> > -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> > +	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> >   	if (pas->dtb_pas_id)
> > -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> >   	return 0;
> >   }
> > @@ -235,15 +235,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >   			return ret;
> >   		}
> > -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> > -					pas->dtb_pas_id, pas->dtb_mem_phys,
> > -					&pas->dtb_pas_metadata);
> > -		if (ret)
> > -			goto release_dtb_firmware;
> > -
> > -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> > -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> > -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> > +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> > +					pas->dtb_mem_region, &pas->dtb_mem_reloc);
> >   		if (ret)
> >   			goto release_dtb_metadata;
> >   	}
> > @@ -251,9 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >   	return 0;
> >   release_dtb_metadata:
> > -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > -
> > -release_dtb_firmware:
> > +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> >   	release_firmware(pas->dtb_firmware);
> >   	return ret;
> > @@ -301,14 +292,8 @@ static int qcom_pas_start(struct rproc *rproc)
> >   		}
> >   	}
> > -	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> > -				pas->mem_phys, &pas->pas_metadata);
> > -	if (ret)
> > -		goto disable_px_supply;
> > -
> > -	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
> > -				    pas->mem_region, pas->mem_phys, pas->mem_size,
> > -				    &pas->mem_reloc);
> > +	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
> > +				pas->mem_region, &pas->dtb_mem_reloc);
> >   	if (ret)
> >   		goto release_pas_metadata;
> > @@ -328,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
> >   		goto release_pas_metadata;
> >   	}
> > -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> > +	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> >   	if (pas->dtb_pas_id)
> > -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> >   	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
> >   	pas->firmware = NULL;
> > @@ -338,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
> >   	return 0;
> >   release_pas_metadata:
> > -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> > +	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> >   	if (pas->dtb_pas_id)
> > -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> >   disable_px_supply:
> >   	if (pas->px_supply)
> >   		regulator_disable(pas->px_supply);
> > @@ -774,6 +759,18 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >   	}
> >   	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> > +
> > +	pas->pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->pas_id, pas->mem_phys,
> > +					     pas->mem_size, true);
> > +	if (!pas->pas_ctx)
> > +		goto remove_ssr_sysmon;
> 
> this function already returns -ENOMEM you don't set ret to any particular
> value so if qcom_scm_pas_ctx_init() returned NULL, you would exit your probe
> function here "error out" with returning ret = 0

Ack.

> 
> Please ERR_PTR() in qcom_scm_pas_ctx_init() and return the error up the call
> stack via your remove_ssr_sysmon jump label.

Sure.

> 
> ---
> bod

-- 
-Mukesh Ojha

