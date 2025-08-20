Return-Path: <linux-arm-msm+bounces-69973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18EB2DC4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 849A33BA209
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF6A2F0C69;
	Wed, 20 Aug 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEHUQiPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B265438B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692682; cv=none; b=TPrmqdvnoOqOECdwKDvAtj/x7aY3dZp8dZxpRaLZaXIp+K1DZ84FQf5VZjfAWjVLGKkx+xx97loXiQ88gOHv5r07PtJ9cFQuNitEKZQPt4XfxSWL60bdxY2JlKwlL01ZhehxpUxOk4ZfdJGMlyOF0kP7xNsCzF2E0uDrxkbcE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692682; c=relaxed/simple;
	bh=MomZXsFaLDbT6+TmHvvmHexTKkxB4YMU4SO/vDjzvxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHFp+9VC3339n7JbktYMLlWD+iYUSQU9J5TVzcidmj5+Hpu+s9vdLi10z7R/kn313SrlZvByjvoBjAg8w6TE4rCvns5ijO2xXwS+ivSNLdQxTKIb2mkZ0BKWkH/47BS7DlOvotekvV6QxCdZYgZ70+eStYOrpqi0lVWRojI5sKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEHUQiPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAGVTQ001993
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td0CaUx2Mv5Qw5Lyu7yhTrBx9hRRCjajUjhMqPsrw5c=; b=OEHUQiPKZshci3wo
	ZOR33yd7Kwz53t4GeEpOB6cmS3TiQlnZoipvDV+5leJw1O9ufMzTlOD9CHu0ePfe
	MuxftA4S10jrtSKzbxtM1hPwxLS3mGh/MwHrdqyFQ4noLOxhsbo5+LOfDfIev/7U
	PU/aMDAL7dZYLtX0P18tJvzLZjp78P4g1fvXnW40NSoXj1eJPRK0jK+VD17n2QG7
	R2kiHtLnJguVFoq1pUkqaG1jLfHqn9fVgdpRB7nkruW+yPhc+cRSZC3h+BYplf1O
	sO0irGsZxwrcctHKRUL9pWJz7dnHDHmMrsUbTP+C/2TfiUGYNhYPN8k4d1Go+kR8
	IWQOdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528smue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:24:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32326bed374so5544441a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 05:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692677; x=1756297477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td0CaUx2Mv5Qw5Lyu7yhTrBx9hRRCjajUjhMqPsrw5c=;
        b=Po7dvr0WTPulEwGLAB6baQl1MzkteG+S4Ep4L8DWros9ydUKKzn5+QgWyConsjsUc2
         NBVsaqkq9jvO5w5ePCWO47zU+q3P01Ka4Vbbs03leodAp8jPka3o7jdYC4omoc/Hmm7w
         9MaBxqyIara8E8BmBy0zMhsyaow5YGM9Hc5OT1AbP2z6D5j8VSf7oCK3tqbkmXe+5EyS
         BeGf4X5+sMi+2CHHVXpTnTgPTVx5Mcvcpm4UuGPPIdQQt0hfB9spgoKUpKLQuGVMj/WB
         ltUmXEJhTigd/zEv5BE9bT2tNCDVC6aZKF5SOar587vb/PQaid/dJPKtXSVgh8n9qS4L
         tV3A==
X-Forwarded-Encrypted: i=1; AJvYcCXuqRYZoT/vulMTr8FrMeA8NkoZrIZT7HttA1KE5dYH/eCD+ODUG7Eys4dKFH24V7T4zeRsnjUr0tK37znW@vger.kernel.org
X-Gm-Message-State: AOJu0YwSpfXBpzXdKcAcs5xZtFFu+pf/cG7mRQX9vJZE0FF689bkLV31
	nsc1F+f0tD5JgD8pdfWepnsC6naFrHd+ok0PelOl3IAsFt0W/8LAow07f5GzsciBLFqlK0VtTOR
	NKTlFfVr80eEePP0qjioJZcs7jj1a/DODQocfvGKjMNsNqE3Da3SzCHV7KTktGWKu8afb
X-Gm-Gg: ASbGncvNAhdCcrIigfv2OzW43HwwMbVUY1BPLVaE7bhyg3JhDYslQti/aUpa3iGfN2p
	Vxx3NdHQ9CfAD7gZFzTx2Vva3DQcaFkcqxPKzyl7/LuuRmqfBrk4nV3yHihpYkStFXcWuxSl9+n
	7LfFHh0GfiFFtiLURfSighSK8oBjBeoCeiRYYcO98OzAAfhxDQdbolAiZceRcxmNvEE7TVndVWt
	ahEWQejz+RFl3aHzpbE/8J+5y/O2K8I3+07nRGeYalfXiuNknfUO6WuX8t0SkxGdtXOWDIHFx2t
	1k9190CPnh+2TmHgWI0fkgJRPkAaplBilRzZOrYvn+JxtmJAkVU4ZjotG8Yta3XbOxA=
X-Received: by 2002:a17:90b:53c4:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-324e136d137mr3422806a91.1.1755692677115;
        Wed, 20 Aug 2025 05:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSeDqZ1+f+FBiw8LkrIwhczOd3iHu1k+3zFS6lbDUoID7JiwtZhB6MFHXNPH6K7kLVr/h7Iw==
X-Received: by 2002:a17:90b:53c4:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-324e136d137mr3422777a91.1.1755692676600;
        Wed, 20 Aug 2025 05:24:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640909f6sm2201034a12.35.2025.08.20.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:24:36 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:54:30 +0530
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
Subject: Re: [PATCH v2 03/11] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <20250820122430.pasbypbrtbaynxv7@hu-mojha-hyd.qualcomm.com>
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
 <20250819165447.4149674-4-mukesh.ojha@oss.qualcomm.com>
 <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5be86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o3WOxAlSagPtyj5-6KUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 850pklaxp8Ad9LR5luW2o4NU_1WVbF9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX56DArni0/RVr
 0EqDBWgxIKDTl6x/IrAVMH/FNvX4xZWZmK9GklegrboVOzP/DA0tHCYvIBC0pTWyMKfa/PI7Ors
 sE8PwcolxqUHuPO95yBbryMGl2bxKgNb3ETywLn6gheVHFR1QOv2uC5S3zTKTdR5/I5PQ4FroFY
 RIgNvUubCwDh7S9PyqgcngzNCVzVUNmGg6uybXqnCELRdeoggvBevM5D8wrCXTzMnvx/V1gjTVu
 6b8S7EBUCRTdEEFY9nXKoj29f8c/ZAxTXsF5wMXxUYliU1n6fRVHHrY66QeY73zKyFemjhc5WDI
 A/rgv7WPBhx7/paf+IER82/asIz4x0nkdO99hiWwMWXS/qMejOCdeHZIbUiQYzlNcXeLPUbv/Jy
 3nlW1Wkm+Z4YNl18mmqrZs+pvsKxLw==
X-Proofpoint-ORIG-GUID: 850pklaxp8Ad9LR5luW2o4NU_1WVbF9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 01:03:41PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> > Environment—a library present in the Gunyah hypervisor) utilize the
> > Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
> > securely authenticate and reset remote processors via a sequence of SMC
> > calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> > qcom_scm_pas_auth_and_reset().
> > 
> > For memory passed to Qualcomm TrustZone, it must either be part of a
> > pool registered with TZ or be directly registered via SHMbridge SMC
> > calls.
> > 
> > When QHEE is present, PAS SMC calls from Linux running at EL1 are
> > trapped by QHEE (running at EL2), which then creates or retrieves memory
> > from the SHMbridge for both metadata and remoteproc carveout memory
> > before passing them to TZ. However, when the SoC runs with a
> > non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> > metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> > for remoteproc memory (before the call is made to TZ in
> > qcom_scm_pas_auth_and_reset()).
> > 
> > For auth_and_reset() call, first it need to register remoteproc carveout
> > memory with TZ via SHMbridge SMC call and then it can trigger
> > auth_and_reset SMC call and once the call returns, remoteproc carveout
> > memory can be deregisterd with TZ.
> > 
> > Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
> > the SHMbridge over carveout memory and call auth_and_reset SMC call.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h |  2 ++
> >   2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 33187d4f4aef..9a5b34f5bacb 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -759,6 +759,52 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> > +/**
> > + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It is typically used when Linux is in control setting up the IOMMU hardware
> 
> Is there a non-typical case ?

In non-typical case is when system runs with Gunyah which in control of
IOMMU and create shmbridge before it passes the call to TrustZone.

> 
> "This function is used"

Ack.

> > + * for remote subsystem during secure firmware loading processes. The preparation
> > + * step sets up shmbridge over the firmware memory before TrustZone access the
> 
> shmbridge -> "a shmbridge"
> "access" -> "accesses"

Ack.

> 
> > + * firmware memory region for authentication. The authentication step verifies
> > + * the integrity and authenticity of the firmware or configuration using secure
> > + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> > + * sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
> > +{
> > +	u64 handle;
> > +	int ret;
> > +
> > +	if (!ctx->has_iommu)
> > +		return qcom_scm_pas_auth_and_reset(ctx->peripheral);
> > +
> > +	/*
> > +	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
> > +	 * shmbridge on subsystem memory region before it passes the call to TrustZone
> > +	 * to authenticate it while when Linux runs at EL2, it needs to create shmbridge
> > +	 * before this call goes to TrustZone.
> > +	 */
> 
> If Linux is running at EL1, Gunyah running at EL2 traps the auth_and_reset
> call, creates a shmbridge in "subsystem memory ? bod: which subsystem do you
> mean here"

Subsystem memory => remote processor carve out memory

> and then passes the call to TrustZone. If Linux is running at EL2
> then Linux needs to create the shmbridge before calling into TrustZone.
> 
> > +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> > +	if (ret) {
> > +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> > +			ret, ctx->peripheral);
> > +		return ret;
> > +	}
> > +
> > +	ret = qcom_scm_pas_auth_and_reset(ctx->peripheral);
> > +	qcom_tzmem_shm_bridge_delete(handle);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
> > +
> >   /**
> >    * qcom_scm_pas_shutdown() - Shut down the remote processor
> >    * @peripheral: peripheral id
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index b7eb206561a9..a31006fe49a9 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -79,6 +79,7 @@ struct qcom_scm_pas_ctx {
> >   	size_t mem_size;
> >   	struct qcom_scm_pas_metadata *metadata;
> >   	bool save_mdt_ctx;
> > +	bool has_iommu;
> >   };
> >   void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > @@ -87,6 +88,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx);
> >   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> >   int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
> >   int qcom_scm_pas_auth_and_reset(u32 peripheral);
> >   int qcom_scm_pas_shutdown(u32 peripheral);
> >   bool qcom_scm_pas_supported(u32 peripheral);
> 

-- 
-Mukesh Ojha

