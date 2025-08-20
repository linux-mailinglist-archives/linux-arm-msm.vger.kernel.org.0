Return-Path: <linux-arm-msm+bounces-69969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46AB2DBE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0D95C460F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357AD2E7179;
	Wed, 20 Aug 2025 12:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sy6tkBpn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F282221F0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691220; cv=none; b=VVsj2zrWQ+12bCVXtoUYCBRyTkELSzWum2KWqUOolAhRdSfF71VKHHgJXtuJxdgbys7DHSSiRfigd4coMkfNLJn0/OK3NWEa1GJqV4OZx7MvFJlw8R8VGtDD5Wf66BEk0Y+WuJaMMx5Kms14ySzEpKC9MxNibO80uNmEquLE76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691220; c=relaxed/simple;
	bh=SDtexuaS3TKkKoV9P48V3eiMvbBMyg3XrcLVwU6MIFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cagJeEqp3V8rWtsdjgA8QU0tleEy0fVDKZ4IT4vq4ZH3YlOZWdqqDMQFvW4mPXrj3Ysz/AUR3imeGesQzXZQk3OpFz3s3kM8h6SkhjoXo1dFonOujOUOXXkjsxC1HdLVstiSG683uO5qg9Dfj+UQVA8OC3hvJfWOgmsalxE+m7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sy6tkBpn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA42fG010469
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uktrN5XsFXtMAjPUM9V0L2L/
	tzQmTaQWDCrl9jw4/oc=; b=Sy6tkBpnbYVPC1YK9/SSHBezlxA6xU3Up2RZ7TRS
	sCt+iQjLAozh1tP3SCWDYJ82KFiJUbt+nPC26cgsTr+N+HfP5+s3gVtPCxupWjd7
	RrO8j0kq3Ck3MOQKqxh/nFY+V1JbRLzE2Av8giDWJgVAWkn0cOjRaMqrhv2Cctv1
	dZBrUkucxeOwtH6uLcnt2qOtTi5FaW+zcn2It4S6v+pWTPeUM6QAGSC3XXf/1U90
	AX5cI4zqIebRKjccMQ8wYIRJrsMDPRCDbGhjyiJliq6DcBvzG7470umrw8bl2ZK9
	skwceB3J7NG9stvzeQoTK28aWTfAR6PA5w1H0iKo6/mRfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhmg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:00:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47173ae6easo11285733a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 05:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755691217; x=1756296017;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uktrN5XsFXtMAjPUM9V0L2L/tzQmTaQWDCrl9jw4/oc=;
        b=IHxS31nGtHtvOyw/s/Y/2F4my1mASTU2YBmq7ix5vAns8E+kxptxxN8PBplTv+9ynM
         3NigfLMx5A5hgzgUkq8JCvzbUCt9iSu8UGcoPzLCAd75W3DGWTmgRXMV9zY35HvokHfB
         umyoq1cZQ+wC3sqWnGxIilUazKSNn417Pn95G4oQ51dctOatfAxYFwfpTWe5nMNDe6Hi
         47VOVgUs/1sGVpx5mIR/vJ0ZneiLyHOcT0Q/+bwSSxpQ6sk47TYpnq97ybz0tUuCUsBc
         LUs1CSWaiC6tNrF6wrgIKYIbwsxtFLCfE5UVo5E7td1PAdYwc1vMPVKLT6SNi9iJwt0Z
         A6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtGytAl+T3/R+gcl78efjqzgOCbcj/836HPL+n42zhDTNJakfIJYqn14dyI+rkQZvKyysaaBkkk+q9cjJe@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKGVLAWNDYR1vCAqWW9THLtmWvk/x1LInjt+2GMRKdKnYWU8U
	gM8ftLMS+dRHjPbsPK8ftBBL3LX/cajKhFNqlwppbm5AC8+mGH19DVC8uvwEDKj6VzPICWBfcY6
	wBKvBjGxhk8Ztmife27Ru0o8SYSaQusEjck7biocg+/23JihHy0tu/PFhf6qZSPkvPRa1
X-Gm-Gg: ASbGnctOWw34pn+D95Q2VdvBod+tBCvIkg79ZQMxg2Dv/w8JmHW1Pea04xlUmBSnvIX
	QMCP5hWwYzGCX9843lrTRw2twan8g7P7cxnK89ipYYM+LbmWE5rs4fhDfbRxzRTHG92C+sCi7yt
	Ci4/7GemTmueCAL4hGggyvT+jQ7j6vpT7kmbpkgGb9HVjDs1dR0FrqD4y9GSNPMEZGtCYRWRFeb
	ji96TKL3b3ws2NdxQ/Gwbh+59GUb/u18NY8ItaGnBtPX4hn+LksgQYXHAvhcPFUIBEUNtQUj45g
	8tQ1iZN4w8i9eVleTojPJWBJDUJM2u41GG/Fo8pyTAWpeXVPINIZzEIXDki3r1c/F5k=
X-Received: by 2002:a05:6a21:3394:b0:240:aa15:70ac with SMTP id adf61e73a8af0-2431b7decdfmr4286366637.16.1755691216318;
        Wed, 20 Aug 2025 05:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRd4Jg679aM3YF3UzAqMPYAbLO26XLH0+JCY2um8HiATG1KU+r/ICHR5XR444k4pP6n6OLXw==
X-Received: by 2002:a05:6a21:3394:b0:240:aa15:70ac with SMTP id adf61e73a8af0-2431b7decdfmr4286270637.16.1755691215413;
        Wed, 20 Aug 2025 05:00:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640908d9sm2105922a12.29.2025.08.20.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:00:14 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:30:08 +0530
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
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250820120008.jal2q55c6orkljqb@hu-mojha-hyd.qualcomm.com>
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
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <667fd351-7ee5-4c42-81fe-60061118f37f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <667fd351-7ee5-4c42-81fe-60061118f37f@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5XZ/tjDtQfHO
 x4JVTXQ7CPbng+8G3sKGgzSO2+2M704td8ekYJ7dJB0sMQMljmIhUYo9i1pFKWj03V7+sz0/gYv
 7RqUQiKKjFvcUGTCoNq6XVLAHAjfQBU6W23SDBppc41RwC6fiSp6okY87wVmRZ8Yseg+4JMJKSa
 3S+XFKkzIVAl52nhAasBsdKFXoh4mu0sva9t4qg/Wr5is8nXAmylZvXVh4ZxJTvi8F45fhxDwCj
 Eol1QhaaonNVVV2D8ti0WWL4E4556kPZ+JWUlrS1RKBtDo7gRYAJu+iIMYgsUzXksxg0xYtUtSB
 6hneRKfub/c2jNe1qofYF0K1oFqDkm99SxpjKQzVums1Pn6u8ytTX6gYC8L8C4CIPO/14HqScmh
 mQtpNqIYUvlrsmNixIZumGRu9xY5DA==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5b8d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DJ2hMySLIM-QLe26EjcA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EwATnvNVNd23inpOHAl5EYemNCKjd_8O
X-Proofpoint-ORIG-GUID: EwATnvNVNd23inpOHAl5EYemNCKjd_8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:33:44PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via the device tree.
> > 
> > Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_core.c  |   9 +-
> >   drivers/media/platform/qcom/iris/iris_core.h  |   6 +
> >   .../media/platform/qcom/iris/iris_firmware.c  | 156 ++++++++++++++++--
> >   .../media/platform/qcom/iris/iris_firmware.h  |   2 +
> >   4 files changed, 155 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> > index 0fa0a3b549a2..57417d4d7e05 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.c
> > +++ b/drivers/media/platform/qcom/iris/iris_core.c
> > @@ -17,6 +17,7 @@ void iris_core_deinit(struct iris_core *core)
> >   	mutex_lock(&core->lock);
> >   	iris_fw_unload(core);
> >   	iris_vpu_power_off(core);
> > +	iris_fw_deinit(core);
> >   	iris_hfi_queues_deinit(core);
> >   	core->state = IRIS_CORE_DEINIT;
> >   	mutex_unlock(&core->lock);
> > @@ -65,10 +66,14 @@ int iris_core_init(struct iris_core *core)
> >   	if (ret)
> >   		goto error_queue_deinit;
> > -	ret = iris_fw_load(core);
> > +	ret = iris_fw_init(core);
> >   	if (ret)
> >   		goto error_power_off;
> > +	ret = iris_fw_load(core);
> > +	if (ret)
> > +		goto error_firmware_deinit;
> > +
> >   	ret = iris_vpu_boot_firmware(core);
> >   	if (ret)
> >   		goto error_unload_fw;
> > @@ -83,6 +88,8 @@ int iris_core_init(struct iris_core *core)
> >   error_unload_fw:
> >   	iris_fw_unload(core);
> > +error_firmware_deinit:
> > +	iris_fw_deinit(core);
> >   error_power_off:
> >   	iris_vpu_power_off(core);
> >   error_queue_deinit:
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index aeeac32a1f6d..57eeefb38f22 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -73,6 +73,12 @@ struct iris_core {
> >   	int					irq;
> >   	struct v4l2_device			v4l2_dev;
> >   	struct video_device			*vdev_dec;
> > +	bool					has_iommu;
> > +	struct video_firmware {
> > +		struct device *dev;
> > +		struct qcom_scm_pas_ctx *ctx;
> > +		struct iommu_domain *iommu_domain;
> > +	} fw;
> >   	const struct v4l2_file_operations	*iris_v4l2_file_ops;
> >   	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops;
> >   	const struct vb2_ops			*iris_vb2_ops;
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index f1b5cd56db32..e3f2fe5c9d7a 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -3,10 +3,18 @@
> >    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >    */
> > +#include <linux/device.h>
> >   #include <linux/firmware.h>
> > -#include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/kernel.h>
> > +#include <linux/iommu.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/sizes.h>
> >   #include <linux/soc/qcom/mdt_loader.h>
> >   #include "iris_core.h"
> > @@ -17,15 +25,14 @@
> >   static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >   {
> >   	u32 pas_id = core->iris_platform_data->pas_id;
> > +	struct qcom_scm_pas_ctx *ctx;
> >   	const struct firmware *firmware = NULL;
> >   	struct device *dev = core->dev;
> > -	struct reserved_mem *rmem;
> > -	struct device_node *node;
> > -	phys_addr_t mem_phys;
> > -	size_t res_size;
> > -	ssize_t fw_size;
> > -	void *mem_virt;
> > -	int ret;
> > +	struct reserved_mem *rmem = NULL;
> > +	struct device_node *node = NULL;
> > +	ssize_t fw_size = 0;
> > +	void *mem_virt = NULL;
> > +	int ret = 0;
> >   	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> >   		return -EINVAL;
> > @@ -39,36 +46,64 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >   	if (!rmem)
> >   		return -EINVAL;
> > -	mem_phys = rmem->base;
> > -	res_size = rmem->size;
> > +	if (core->has_iommu)
> > +		dev = core->fw.dev;
> > +	ctx = qcom_scm_pas_ctx_init(dev, pas_id, rmem->base, rmem->size, false);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->has_iommu = core->has_iommu;
> >   	ret = request_firmware(&firmware, fw_name, dev);
> >   	if (ret)
> >   		return ret;
> >   	fw_size = qcom_mdt_get_size(firmware);
> > -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> > +	if (fw_size < 0 || rmem->size < (size_t)fw_size) {
> >   		ret = -EINVAL;
> >   		goto err_release_fw;
> >   	}
> > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > +	mem_virt = memremap(rmem->base, rmem->size, MEMREMAP_WC);
> >   	if (!mem_virt) {
> >   		ret = -ENOMEM;
> >   		goto err_release_fw;
> >   	}
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, firmware, fw_name, mem_virt, NULL);
> >   	if (ret)
> >   		goto err_mem_unmap;
> > -	ret = qcom_scm_pas_auth_and_reset(pas_id);
> > +	if (core->has_iommu) {
> > +		ret = iommu_map(core->fw.iommu_domain, 0, rmem->base, rmem->size,
> > +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> > +		if (ret)
> > +			goto err_mem_unmap;
> > +
> > +		/*
> > +		 * Firmware has no support for resource table for now, so, lets
> > +		 * pass NULL and zero for input resource table and input resource
> > +		 * table respectively.
> > +		 */
> > +		ret = qcom_mdt_pas_map_devmem_rscs(ctx, core->fw.iommu_domain, NULL, 0);
> > +		if (ret)
> > +			goto err_unmap_carveout;
> > +	}
> > +
> > +	ret = qcom_scm_pas_prepare_and_auth_reset(ctx);
> >   	if (ret)
> > -		goto err_mem_unmap;
> > +		goto err_unmap_devmem_rscs;
> > +
> > +	core->fw.ctx = ctx;
> >   	return ret;
> > +err_unmap_devmem_rscs:
> > +	if (core->has_iommu)
> > +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> > +err_unmap_carveout:
> > +	if (core->has_iommu)
> > +		iommu_unmap(core->fw.iommu_domain, 0, rmem->size);
> >   err_mem_unmap:
> >   	memunmap(mem_virt);
> >   err_release_fw:
> > @@ -109,10 +144,97 @@ int iris_fw_load(struct iris_core *core)
> >   int iris_fw_unload(struct iris_core *core)
> >   {
> > -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > +	struct qcom_scm_pas_ctx *ctx;
> > +	int ret;
> > +
> > +	ctx = core->fw.ctx;
> > +	ret = qcom_scm_pas_shutdown(ctx->peripheral);
> > +	if (core->has_iommu) {
> > +		iommu_unmap(core->fw.iommu_domain, 0, ctx->mem_size);
> > +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> > +	}
> > +
> > +	return ret;
> >   }
> >   int iris_set_hw_state(struct iris_core *core, bool resume)
> >   {
> >   	return qcom_scm_set_remote_state(resume, 0);
> >   }
> > +
> > +int iris_fw_init(struct iris_core *core)
> > +{
> > +	struct platform_device_info info;
> > +	struct iommu_domain *iommu_dom;
> > +	struct platform_device *pdev;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > +	if (!np)
> > +		return 0;
> > +
> > +	core->has_iommu = true;
> 
> You set has_iommu = true and then you check this flag throughout this
> patch..
> 
> 
> > +	memset(&info, 0, sizeof(info));
> > +	info.fwnode = &np->fwnode;
> > +	info.parent = core->dev;
> > +	info.name = np->name;
> > +	info.dma_mask = DMA_BIT_MASK(32);
> > +
> > +	pdev = platform_device_register_full(&info);
> > +	if (IS_ERR(pdev)) {
> > +		of_node_put(np);
> > +		return PTR_ERR(pdev);
> > +	}
> > +
> > +	pdev->dev.of_node = np;
> > +
> > +	ret = of_dma_configure(&pdev->dev, np, true);
> > +	if (ret) {
> > +		dev_err(core->dev, "failed to allocate domain\n");
> > +		goto err_unregister;
> > +	}
> > +
> > +	core->fw.dev = &pdev->dev;
> > +
> > +	iommu_dom = iommu_get_domain_for_dev(core->fw.dev);
> > +	if (!iommu_dom) {
> > +		dev_err(core->fw.dev, "Failed to get iommu domain\n");
> > +		ret = -EINVAL;
> > +		goto err_iommu_free;
> > +	}
> > +
> > +	ret = iommu_attach_device(iommu_dom, core->fw.dev);
> > +	if (ret) {
> > +		dev_err(core->fw.dev, "could not attach device\n");
> > +		goto err_iommu_free;
> > +	}
> > +
> > +	core->fw.iommu_domain = iommu_dom;
> > +
> > +	of_node_put(np);
> > +
> > +	return 0;
> > +
> > +err_iommu_free:
> > +	iommu_domain_free(iommu_dom);
> > +err_unregister:
> > +	platform_device_unregister(pdev);
> > +	of_node_put(np);
> > +	return ret;
> > +}
> > +
> > +void iris_fw_deinit(struct iris_core *core)
> > +{
> > +	struct iommu_domain *iommu_dom;
> > +
> > +	if (!core->has_iommu)
> 
> This is fixed in your code is it not ?
> 
> You presumably are going to change this later otherwise suggest dropping

Sure.

> 
> ---
> bod

-- 
-Mukesh Ojha

