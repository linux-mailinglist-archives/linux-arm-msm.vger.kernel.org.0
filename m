Return-Path: <linux-arm-msm+bounces-76307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C6BC35C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7F153B9CE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455DB2C0260;
	Wed,  8 Oct 2025 04:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBdKkmjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D22BFC73
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759899528; cv=none; b=gm0CGS5z8DQIfiwcS75YjXnmPyXi8gIU6lYw7rm4c/FcuSG7SAJAyE4YGir7MIV6IHWAwEbKVwpRJKHKWDOsY/U0wsuH4FhvfSPdveuL3yborA/LWdm3hR4+M6UNPPmIbbijYDxIscRT2a+6nWhjiTcvmn5IzOk6AmfwBgU0Jkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759899528; c=relaxed/simple;
	bh=kVfA3PQBeAMY4VR/yirMkB1CU+nJ+TFUfcnv0HBDb8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8sXMhNBv52PXaKWmr4i4Nvwk8unfPjNK0yrAQW9IqDsB5EMyCQII06BVjZTd/947NtkBudgcYIj6HDhAmJMx2WluQMIG1v1RKzjA/OcM4DdttW4jkyiag87BLpiq3+Vsfqz/tgV4dkLmS7cGtsfkEzs96oqQJC+2036HtWKDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBdKkmjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803TT8005561
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QbTQI2WQv8U2fmkSw8SyD76J79giWpu9JljQPYNGIk=; b=TBdKkmjJXE31Cvcx
	tOgQCYSfCLJbxkHZaNMzQo3XTB3Udipr+fxaBcg2y2RCRq0hUIhhQ/mh7m4ctBuz
	2xSa2fR3zpKjvKTBvy6CKpgukNtanCGxWyXwuX0vDf4HaaDTdAlg2D2jMRHn9u6D
	QSFM1HASaiH063Vfw6y4hZyEfQ/1gFLu+J815tJZP0gO3JJ0LOG0zvCF8/Z7g9kN
	HX0kUS/ozLT8Z3isHkAl+uSsyWDUS8g+z21rIMlQSpI/zVzaRt8cd0F0LKyKTPU5
	7xfbscFojMdGJGSmqmlKlt5z7Qc8TYCWBwqiHmOi8rkk+sREw64vB0kGNpKadoTF
	s/MugA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn9p4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:58:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso647185b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759899524; x=1760504324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QbTQI2WQv8U2fmkSw8SyD76J79giWpu9JljQPYNGIk=;
        b=dJf4VVkl3zH7TPJHKPsNsgnMcU4CNq5jss1lx6RnV92J1aKwXFRPTEDnZUT09TVgi/
         AaVMOqYJPhZi3+v5pvaubyAZOtLyMS4gKQZOQpxN2pZO0mocYunXzKWz1IxelpWuGbeN
         9367r1ZXkP1IvY5O4i2oUDUcusDgxh+DCdcElN/EM3ufT5/S+M6PQQERdFd/ppFtf6+7
         i1kBayd1ruNLkPhXVn5sgvYRSiFutpP40gTnSRA0O/45NvTJBnSioGD657a6DPRB+Pu2
         YYPvF0gIaoCWwwdYjrM4evOl1PreniC9WTMtyVf5yZeeqGF/0as0TWgc3ob0E8GLquga
         YzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZsilI/pV524JxoNj+Y0Qc8qVSTJCMBmW2VB2JJlN+Ll8qrxemOI+Ul/bgHmlsWHXQ7Z+ihcbefgFyzLw@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFV1EM34RjguoKuGfcJggaDha9P1gBGYyuBBH2SlwIfjR6qjM
	MVGgjATbxZ/+dWSn8e0wX/8pSNcC16XI2ebrkTKch4wQmfMjI+T2njYndJCm59u+8GE0tGJIj2/
	NS3VWuahGePb/nBmetzyd64TeCqbsO4beNUlkqVKd+NJBLQqeUbLAH6YlE4ThkMcZ3ay8dkyYAr
	qu
X-Gm-Gg: ASbGncsaNJ8V3EGCrVvgMC7d1eLBk9h6gw9vhbHI8WBgdbyiY+x7qhI/pIGV7ZH/Gsw
	gumaC90u/gA+HAlDmhDu76DpIatVa8atfpc4nnSB3TFtTdlASWDQIFUAnc8Wb+mN++GRadcAqCn
	fJwVFwSV6HuykacSOk2XOHMVKsYGWXrJrE95u+fpQ9oxMdsINYbOkiRmlbqL4gjPqlShprl/E7/
	7EN5co/3qtoAkATVGb8xonOwVkQBXWcAnKLxhBT3MMoyvGrFeasIuAH4+0KXokRNt9UZ9t/6oji
	WkpwfmUH2HSxVjoJY3NLiTUIKFwsXa+sILhSsv7voSmQaApSdJQenhcP83F0rsQqEi1GpT6g
X-Received: by 2002:a05:6a00:806:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7939753d3cdmr2164043b3a.5.1759899523394;
        Tue, 07 Oct 2025 21:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPyL1wtsIL9oElD/vW5F/NgaqYtaOb0BSOZcSEm/R3DuE7PYYnwUFcC3CApID3Rwt+++F4JQ==
X-Received: by 2002:a05:6a00:806:b0:78a:f6be:74f2 with SMTP id d2e1a72fcca58-7939753d3cdmr2164005b3a.5.1759899522532;
        Tue, 07 Oct 2025 21:58:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020749b6sm17406444b3a.78.2025.10.07.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:58:42 -0700 (PDT)
Date: Wed, 8 Oct 2025 10:28:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20251008045836.vf4wz6cevosw6klq@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
 <fo6q3gl3dmcso5gcfp2taaao3qwazxw5uutkcwi6qg4aojt2av@tprjv3xhcs57>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fo6q3gl3dmcso5gcfp2taaao3qwazxw5uutkcwi6qg4aojt2av@tprjv3xhcs57>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX/UHxA0ZsYAjI
 VuxuCjEyfoTSwsM7O7vQ/tJL0CkgaZgaJsyxqjKYYIw0cM1HmZt95s0xyakFh9CYgOYmL/3L2s3
 lkunh+AnKEG9vPTuvfyFSTWxtAkhZRFdypbKNSBb/waHnGZb03LcSRVC0mr6v/LwD8MuWZizMUt
 IzPEv3HqzhsyBvnW5n6qG5TPHsD9qKZniAg6jK29PbWS1OX1LXy5X9+YhpAGB7kLy5S4HFWItiT
 18oLwPFODLNqEddUz+OExGiBSrQ3PRAIdfTkkGpkOx6BHAargmqlFvagUSGybhC2FJqDEEQDUjF
 4Sz05DmBDDBu0yILfqt7O8emQD6fDgbEdy3DZM4/L4Af0X9W/Yf+2voaVcUWyvI/BTVSQm3+sv+
 UeGL381mp02JkcoIWgPXmJqad9Itfg==
X-Proofpoint-GUID: UgBG6wUWCbLKaAFCc9lWB3DEblmQ-rG3
X-Proofpoint-ORIG-GUID: UgBG6wUWCbLKaAFCc9lWB3DEblmQ-rG3
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e5ef85 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=kZm2_AX0drxy1KB4Y_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Tue, Oct 07, 2025 at 02:52:13PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:56PM +0530, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles IOMMU configuration. This includes mapping memory regions and
> > device memory resources for remote processors by intercepting
> > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > during teardown. Additionally, SHM bridge setup is required to enable
> > memory protection for both remoteproc metadata and its memory regions.
> > When the aforementioned hypervisor is absent, the operating system must
> > perform these configurations instead.
> > 
> > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > own device tree overlay file that specifies the firmware stream ID now
> > managed by Linux for a particular remote processor. If the iommus
> > property is specified in the remoteproc device tree node, it indicates
> > that IOMMU configuration must be handled by Linux. In this case, the
> > has_iommu flag is set for the remote processor, which ensures that the
> > resource table, carveouts, and SHM bridge are properly configured before
> > memory is passed to TrustZone for authentication. Otherwise, the
> > has_iommu flag remains unset, which indicates default behavior.
> > 
> > Enables Secure PAS support for remote processors when IOMMU configuration
> > is managed by Linux.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 61 ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 56 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ed7bd931dfd5..940fd89d4fc4 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/firmware.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/iommu.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -255,6 +256,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> > +{
> > +	if (rproc->has_iommu)
> > +		iommu_unmap(rproc->domain, mem_phys, size);
> > +}
> > +
> > +static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> > +{
> > +	int ret = 0;
> > +
> > +	if (rproc->has_iommu)
> > +		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
> > +				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
> > +	return ret;
> > +}
> > +
> >  static int qcom_pas_start(struct rproc *rproc)
> >  {
> >  	struct qcom_pas *pas = rproc->priv;
> > @@ -289,11 +306,15 @@ static int qcom_pas_start(struct rproc *rproc)
> >  	}
> >  
> >  	if (pas->dtb_pas_id) {
> > -		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
> > +		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> > +		if (ret)
> > +			goto disable_px_supply;
> > +
> > +		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
> >  		if (ret) {
> >  			dev_err(pas->dev,
> >  				"failed to authenticate dtb image and release reset\n");
> > -			goto disable_px_supply;
> > +			goto unmap_dtb_carveout;
> >  		}
> >  	}
> >  
> > @@ -304,18 +325,22 @@ static int qcom_pas_start(struct rproc *rproc)
> >  
> >  	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
> >  
> > -	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
> > +	ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
> > +	if (ret)
> > +		goto release_pas_metadata;
> > +
> > +	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
> >  	if (ret) {
> >  		dev_err(pas->dev,
> >  			"failed to authenticate image and release reset\n");
> > -		goto release_pas_metadata;
> > +		goto unmap_carveout;
> >  	}
> >  
> >  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
> >  	if (ret == -ETIMEDOUT) {
> >  		dev_err(pas->dev, "start timed out\n");
> >  		qcom_scm_pas_shutdown(pas->pas_id);
> > -		goto release_pas_metadata;
> > +		goto unmap_carveout;
> >  	}
> >  
> >  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> > @@ -327,10 +352,16 @@ static int qcom_pas_start(struct rproc *rproc)
> >  
> >  	return 0;
> >  
> > +unmap_carveout:
> > +	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> >  release_pas_metadata:
> >  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> >  	if (pas->dtb_pas_id)
> >  		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +
> > +unmap_dtb_carveout:
> > +	if (pas->dtb_pas_id)
> > +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> >  disable_px_supply:
> >  	if (pas->px_supply)
> >  		regulator_disable(pas->px_supply);
> > @@ -386,8 +417,12 @@ static int qcom_pas_stop(struct rproc *rproc)
> >  		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
> >  		if (ret)
> >  			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
> > +
> > +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> >  	}
> >  
> > +	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
> > +
> >  	handover = qcom_q6v5_unprepare(&pas->q6v5);
> >  	if (handover)
> >  		qcom_pas_handover(&pas->q6v5);
> > @@ -757,6 +792,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	}
> >  
> > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> > +		struct of_phandle_args args;
> > +
> > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> > +						 "#iommu-cells", 0, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		rproc->has_iommu = true;
> > +		of_node_put(args.np);
> > +	} else {
> > +		rproc->has_iommu = false;
> 
> Default value is false, is't it?

Thanks, will drop the else part.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha

