Return-Path: <linux-arm-msm+bounces-93832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BC0GPzRnGllKQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:17:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5FA17E254
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD61304FA66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5D434DCD2;
	Mon, 23 Feb 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqnUO0Vn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANqK1PCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAC329E57
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771885007; cv=none; b=YBohdI0IidkJUH4Ju5C2+zQ5LSI3u/t4p7uHwPKYsv9BPa+SBJUK0+nYwySlEJZyvDmtyUpWkxtNawlKA/GDQEY0OoFb7TX7R/tfo+RtsO8cBUkPGUMXFpJ5KG1EaoptsW+rgC/OTlA8k17AIm7yzupzxdOPN++ycam5iBmLmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771885007; c=relaxed/simple;
	bh=a0/cmVtRZ98vLBBm8zUIs6Z5aLpkKikYYYf94CmUDXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+5ZjqDMQEL/3V2n+z+Jx8P+sMMt7fNQuVPhV459lA/vpRP8WBnxQ1Vjp7adb4WBA/JAtXcWKwdz4N8aAkdk9Oxzvqr+kIRUnNuNUjZWu2lU0BH+i3cNPRjgfIiJu/KWbn2LvjOR2W/UtrF72VeayRAW5ZH/nnhLU+evtRdnvgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqnUO0Vn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANqK1PCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRHSx1640476
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7va14BLOKUzsh75bZFAJzVRf
	4H4OIi1hkRGWKQdCG8M=; b=jqnUO0VnxouOlpzyWXInGXYr5DzwjgLFsroPbF5L
	Y0uoJUmnyV5M2ebDEF9jFaAzcqGMmDXMi2Ohsu20iMPwfpDmIdUTMOFAAgDKtBQt
	v/ts8dQ60FWd1poWlN+DFr+gn3yGafMurNmYJIw92t7RCQH285CcZgQv5cez/sT8
	VWnJ85O2ICGQg4ZkIKgufVgnrINPgeBw3GU9yWrUuMHZ/JJlCxlQyWwen6wjJ66E
	eQ7M9Md1c7UA5Rph+FUvX7GTWrN00BKrospt32O2f2oD5UQ3RZaM+5hbAwg3nyIJ
	/j3XInLOdijzH51ateYwHoXJQmd0zI1kbwm+bRoSxuI0Gg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8s04d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:16:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89473f5a755so591822336d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771885003; x=1772489803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7va14BLOKUzsh75bZFAJzVRf4H4OIi1hkRGWKQdCG8M=;
        b=ANqK1PCkTAKV7bEyCR52YS79r06t1PY92JcP6U8QlR1Fwrhhk+M8CC0QUEih3J9O1x
         jNow/uatFfZ7O1o8bkrw3XOdS0VyWOUJOHxq+0A4eb1Jvp31oKkeh6yvtqXAYAMdOMMm
         E2AcIEQo7rigVnWCtsSZHgLDb6GNtMqDOx6hHgf04Wvgyn2MhsHHVUh0jELn78kYR/Tr
         lHUhwa+XCnqvC4oi3kdcQOZevzbeZUN+vPijdjZhu70/czsEa8+JN0qb0KlxDlnLy/XE
         BXEXl4n0Sn357Bu3bMN7ueVoUMOCwAB3Ga+qLE5NabhcQjSzGbcF8nyu+h8LC4ReXtlm
         sAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771885003; x=1772489803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7va14BLOKUzsh75bZFAJzVRf4H4OIi1hkRGWKQdCG8M=;
        b=ZSqFfNLkQZac6v+kyZQ04W62xfgarhNsSyIO1CnHGt2+fOlIyCR2T+IMB/BVSP5vN3
         5Bt/gUj+KvxXjqScQMesgz5uegiXxPTLwGW8QjajsGdlMpaBzqe/f8txbvL8yVvO/NbE
         AnGitRcRT+h7aZoW8DqAMUreWpLOLzD+JzsHe1tRGb2sa1PEYDj3TsBe/zmF1rgvP7pA
         aY6IjYxm5SAsOAom+/5dJoFum2Oh9/USBp6RjIFHZGa83u3QpQ7Db78zsOijlzIBqfeV
         VcKeEvVW/SbKKBbmH4SoJELlGfV//z7983LnrCdWDFlgK5owh9b+dx65VXsi0eWpNdsk
         P6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUKf0Gh2W17gMXxW+bt67q/x6rnsvf5mVV8+J7NHRL0qqEhrhuih0hv3H6wCVWrUUORHY6b0fiKJWIsdK10@vger.kernel.org
X-Gm-Message-State: AOJu0Yweh/q/FxCXS9NJuHaaycl/ReDJsHBwNELsQXeRInsbA3AtX6w7
	Nid7ROIq/RYXUFs4JQKJTCAgHVlY3IH2x22wZMON8KUxtplbrRY13i3Q1of66sxKORsR30W+jRu
	ezSYko4FGQRfRBqa4/OaWLWiQmgmhZ3g4N35wVm6lN/NTHvWsJCEyDuYLglCOgTqXLxqp
X-Gm-Gg: AZuq6aKDN6UX98dPazWAM6kBuQ2iLWniVw33VpP4btDuI1qgxzTazU7Ky+mzBfmYFcY
	lOHoGSF4L0uHhFdxlNNEJiIEhW7ZRLUCj92wcHTlkL2f7rRzXUvxzgyqm6ABKtTkpLPpkJWh9c/
	iXY0DINqTx5/4b67dq98MBS4tyWdTJiDZXorRf6rfULVptOxesCNTIJGWwuns0atP8p7ZQYXm4F
	Dr/zOqBoBFpT/q+Iw4NS8gyw7G7HuwMH4G2OlcKoHfTTkut/w/MIvSkYtJfBDHOIQUHQPdpElW4
	py/oPnHYbVvmMTVBAJHrP09mOq7mpStTyrHOs6XrhEBmeUmVwPJ8MPN1l/GXrRIr0+hw/lhU0YQ
	TuwDO/XlammYvk7l4LyjJj84tZTPyGTqUn3AsH+0yE4kHVbwEKlkBu8/D0CMSH3p5MxC60S4YlV
	tndGNMM0euFRxw0aFicP3dnoAxsdK0lPdE5Rk=
X-Received: by 2002:a05:620a:4482:b0:8c6:f414:3ba8 with SMTP id af79cd13be357-8cb8ca65b37mr1186747785a.49.1771885003363;
        Mon, 23 Feb 2026 14:16:43 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8c6:f414:3ba8 with SMTP id af79cd13be357-8cb8ca65b37mr1186742585a.49.1771885002701;
        Mon, 23 Feb 2026 14:16:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3eaa4sm1837408e87.46.2026.02.23.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:16:41 -0800 (PST)
Date: Tue, 24 Feb 2026 00:16:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 07/18] accel/qda: Add DRM accel device registration
 for QDA driver
Message-ID: <jjj5b2says6y2sk4lokcxslzcwlsg3gj7rme34lqmhufqc7eam@x256mqlsuvet>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oQN8ZCR7LkNj2dG4qemhDA695ZqQsICG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NCBTYWx0ZWRfX4/wOg3ADq7Mk
 53I6BaD4RRaiRJBQ6uRo4YM8QoZD9d/OVD92S/deApyZ7ddJqckmnNsHe5jSrFwiHkimF8v4RHc
 eO8/QLLQsLWRFwSZDohG9Si4g5x7bYwcpaiStYmdBOwR29GKN2j7CLrKnkoTfKD3Zsrdad2Y0d5
 1vxGORerRfkT2+jSW9qQWDGXXeX5yF+hSH7fslMbTWV8zNwtIySRUxF31USxfFWzZ5mu1OcMV0r
 ygh4pQQcWWaRXO7atUuTyh4VAUH1pG5NGVZzWrw8jFCzZ1vNih/kz1EwDzo009PZRpE20ZseIlF
 kVkuQD7ksS65jBM3BI+89p6cLpUAHGKU1e1eG2XYgEuVGmJryMI3POSCHhHDKvk3CZg6bnEMmcp
 xdbwWvXackkVredIr+54cecOtd8VFpH6H44heVsbCWUPs7jhbHvz3WlJMDHxoK0cPxNdi/30KuL
 MsQ5vUWx7zZiwA3jZqA==
X-Proofpoint-GUID: oQN8ZCR7LkNj2dG4qemhDA695ZqQsICG
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699cd1cc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2N0wBCc5_LywspELBZUA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93832-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB5FA17E254
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:01AM +0530, Ekansh Gupta wrote:
> Add DRM accel integration for the QDA DSP accelerator driver. A new
> qda_drm_priv structure is introduced to hold per-device DRM state,
> including a pointer to the memory manager and the parent qda_dev
> instance. The driver now allocates a drm_device, initializes
> driver-private state, and registers the device via the DRM accel
> infrastructure.
> 
> qda_register_device() performs allocation and registration of the DRM
> device, while qda_unregister_device() handles device teardown and
> releases references using drm_dev_unregister() and drm_dev_put().
> Initialization and teardown paths are updated so DRM resources are
> allocated after IOMMU/memory-manager setup and cleaned during RPMsg
> remove.
> 
> This patch lays the foundation for adding GEM buffer support and IOCTL
> handling in later patches as part of the compute accelerator interface.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c   | 103 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_drv.h   |  33 +++++++++++++-
>  drivers/accel/qda/qda_rpmsg.c |   8 ++++
>  3 files changed, 142 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 69132737f964..a9113ec78fa2 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -4,9 +4,31 @@
>  #include <linux/kernel.h>
>  #include <linux/atomic.h>
>  #include <linux/slab.h>
> +#include <drm/drm_accel.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_ioctl.h>
>  #include "qda_drv.h"
>  #include "qda_rpmsg.h"
>  
> +DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
> +
> +static struct drm_driver qda_drm_driver = {
> +	.driver_features = DRIVER_COMPUTE_ACCEL,
> +	.fops			= &qda_accel_fops,

Strange indentation in the middle. Please drop it.

> +	.name = DRIVER_NAME,
> +	.desc = "Qualcomm DSP Accelerator Driver",
> +};
> +
> +static void cleanup_drm_private(struct qda_dev *qdev)
> +{
> +	if (qdev->drm_priv) {
> +		qda_dbg(qdev, "Cleaning up DRM private data\n");
> +		kfree(qdev->drm_priv);
> +	}
> +}
> +
>  static void cleanup_iommu_manager(struct qda_dev *qdev)
>  {
>  	if (qdev->iommu_mgr) {
> @@ -24,6 +46,7 @@ static void cleanup_device_resources(struct qda_dev *qdev)
>  
>  void qda_deinit_device(struct qda_dev *qdev)
>  {
> +	cleanup_drm_private(qdev);
>  	cleanup_iommu_manager(qdev);
>  	cleanup_device_resources(qdev);
>  }
> @@ -59,6 +82,18 @@ static int init_memory_manager(struct qda_dev *qdev)
>  	return 0;
>  }
>  
> +static int init_drm_private(struct qda_dev *qdev)
> +{
> +	qda_dbg(qdev, "Initializing DRM private data\n");
> +
> +	qdev->drm_priv = kzalloc_obj(*qdev->drm_priv, GFP_KERNEL);
> +	if (!qdev->drm_priv)
> +		return -ENOMEM;
> +
> +	qda_dbg(qdev, "DRM private data initialized successfully\n");
> +	return 0;
> +}
> +
>  int qda_init_device(struct qda_dev *qdev)
>  {
>  	int ret;
> @@ -71,14 +106,82 @@ int qda_init_device(struct qda_dev *qdev)
>  		goto err_cleanup_resources;
>  	}
>  
> +	ret = init_drm_private(qdev);
> +	if (ret) {
> +		qda_err(qdev, "DRM private data initialization failed: %d\n", ret);
> +		goto err_cleanup_iommu;
> +	}
> +
>  	qda_dbg(qdev, "QDA device initialized successfully\n");
>  	return 0;
>  
> +err_cleanup_iommu:
> +	cleanup_iommu_manager(qdev);
>  err_cleanup_resources:
>  	cleanup_device_resources(qdev);
>  	return ret;
>  }
>  
> +static int setup_and_register_drm_device(struct qda_dev *qdev)
> +{
> +	struct drm_device *ddev;
> +	int ret;
> +
> +	qda_dbg(qdev, "Setting up and registering DRM device\n");
> +
> +	ddev = drm_dev_alloc(&qda_drm_driver, qdev->dev);

devm_drm_dev_alloc() please. Move this patch to the front of the series,
making everything else depend on the allocated data structure.

> +	if (IS_ERR(ddev)) {
> +		ret = PTR_ERR(ddev);
> +		qda_err(qdev, "Failed to allocate DRM device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	qdev->drm_priv->drm_dev = ddev;
> +	qdev->drm_priv->iommu_mgr = qdev->iommu_mgr;
> +	qdev->drm_priv->qdev = qdev;
> +
> +	ddev->dev_private = qdev->drm_priv;
> +	qdev->drm_dev = ddev;
> +
> +	ret = drm_dev_register(ddev, 0);
> +	if (ret) {
> +		qda_err(qdev, "Failed to register DRM device: %d\n", ret);
> +		drm_dev_put(ddev);
> +		return ret;
> +	}
> +
> +	qda_dbg(qdev, "DRM device registered successfully\n");
> +	return 0;
> +}
> +
> +int qda_register_device(struct qda_dev *qdev)
> +{
> +	int ret;
> +
> +	ret = setup_and_register_drm_device(qdev);
> +	if (ret) {
> +		qda_err(qdev, "DRM device setup failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	qda_dbg(qdev, "QDA device registered successfully\n");
> +	return 0;
> +}
> +
> +void qda_unregister_device(struct qda_dev *qdev)
> +{
> +	qda_info(qdev, "Unregistering QDA device\n");
> +
> +	if (qdev->drm_dev) {
> +		qda_dbg(qdev, "Unregistering DRM device\n");
> +		drm_dev_unregister(qdev->drm_dev);
> +		drm_dev_put(qdev->drm_dev);
> +		qdev->drm_dev = NULL;
> +	}
> +
> +	qda_dbg(qdev, "QDA device unregistered successfully\n");
> +}
> +
>  static int __init qda_core_init(void)
>  {
>  	int ret;
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 2cb97e4eafbf..2b80401a3741 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -11,13 +11,35 @@
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
>  #include <linux/xarray.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_accel.h>
>  #include "qda_memory_manager.h"
>  
>  /* Driver identification */
>  #define DRIVER_NAME "qda"
>  
> +/**
> + * struct qda_drm_priv - DRM device private data for QDA device
> + *
> + * This structure serves as the DRM device private data (stored in dev_private),
> + * bridging the DRM device context with the QDA device and providing access to
> + * shared resources like the memory manager during buffer operations.
> + */
> +struct qda_drm_priv {

Shared between what and what? Why do you need a separate structure
instead of using qda_dev?

> +	/* DRM device structure */
> +	struct drm_device *drm_dev;
> +	/* Global memory/IOMMU manager */
> +	struct qda_memory_manager *iommu_mgr;
> +	/* Back-pointer to qda_dev */
> +	struct qda_dev *qdev;
> +};
> +
>  /* struct qda_dev - Main device structure for QDA driver */
>  struct qda_dev {
> +	/* DRM device for accelerator interface */
> +	struct drm_device *drm_dev;

Drop the pointer here.

>  	/* RPMsg device for communication with remote processor */
>  	struct rpmsg_device *rpdev;
>  	/* Underlying device structure */
> @@ -26,6 +48,8 @@ struct qda_dev {
>  	struct mutex lock;
>  	/* IOMMU/memory manager */
>  	struct qda_memory_manager *iommu_mgr;
> +	/* DRM device private data */
> +	struct qda_drm_priv *drm_priv;
>  	/* Flag indicating device removal in progress */
>  	atomic_t removing;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
> @@ -39,8 +63,8 @@ struct qda_dev {
>   * @qdev: QDA device structure
>   *
>   * Returns the most appropriate device structure for logging messages.
> - * Prefers qdev->dev, or returns NULL if the device is being removed
> - * or invalid.
> + * Prefers qdev->dev, falls back to qdev->drm_dev->dev, or returns NULL
> + * if the device is being removed or invalid.
>   */
>  static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>  {
> @@ -50,6 +74,9 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>  	if (qdev->dev)
>  		return qdev->dev;
>  
> +	if (qdev->drm_dev)
> +		return qdev->drm_dev->dev;
> +
>  	return NULL;
>  }
>  
> @@ -93,5 +120,7 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>   */
>  int qda_init_device(struct qda_dev *qdev);
>  void qda_deinit_device(struct qda_dev *qdev);
> +int qda_register_device(struct qda_dev *qdev);
> +void qda_unregister_device(struct qda_dev *qdev);
>  
>  #endif /* __QDA_DRV_H__ */
> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
> index 5a57384de6a2..b2b44b4d3ca8 100644
> --- a/drivers/accel/qda/qda_rpmsg.c
> +++ b/drivers/accel/qda/qda_rpmsg.c
> @@ -80,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>  	qdev->rpdev = NULL;
>  	mutex_unlock(&qdev->lock);
>  
> +	qda_unregister_device(qdev);
>  	qda_unpopulate_child_devices(qdev);
>  	qda_deinit_device(qdev);
>  
> @@ -123,6 +124,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return ret;
>  	}
>  
> +	ret = qda_register_device(qdev);
> +	if (ret) {
> +		qda_deinit_device(qdev);
> +		qda_unpopulate_child_devices(qdev);
> +		return ret;
> +	}
> +
>  	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

