Return-Path: <linux-arm-msm+bounces-110104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAS/B0ghGGocdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:04:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBFC5F1083
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 557143048ADF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886F330C632;
	Thu, 28 May 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKfb0qan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vadu6lC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2720B3D412B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965955; cv=none; b=cEz1IG7bb1IK1Auuf8JBooZexazp1Y7GqvqDZg4gHsVT18q8B1hEdZhztOXSxo0+zQBEZx47a+D3OhrafcciUzyCGzCKjKI6KOaHFasZwdD8UoOZK77xrQHrJy3kjpCVxuIm2QkSdRY6R37oFS2M73qQhQqvCgRJnUXyKb00M0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965955; c=relaxed/simple;
	bh=JDEi2oo0P4BLqlVpKWL2iOe4Zq/zpTK5W3KPcRGwS2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqHPLVcugXlxJbtFM9uACrxjuphbvPAUUqwbWNNWKxTnSy5m4MEl6Gv463BiyrbjWwstoVZJA3l2t5cMkXpHXriaGW+tBJzItD/A6jRL8JeuiOvdv1tDXD9VW7GlUHXc1TuurZ5keaN8stG1r9048PO7hVwVWOI4x8UrUxljCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKfb0qan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vadu6lC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vVpP4031376
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OQykVN7zbGGObjLJasSgT0TV
	owil6BekcefmkEti1dk=; b=ZKfb0qan8ATcNGiJGr0uXfXU+nEvhd+XoDg0UFlw
	+46xOzRax0PcRFNWfdG0a3XtM8x5o8UVZPDruu27v1uV7uvdfsi9H+iBQ1aILszE
	PyDg/e92h0d43X6iQVaiARMxQ7dyhil4deXO/37DROU7Hv/tnRoT0PrPDJ7QXEMZ
	6KAgcoA34OWqncCiwPAR14KjAuVdm7r5NAg9A7T+WalvcY8fcfA1k8daFQsrQfvH
	fRSdKIFV8FsDKf4WTZB9KFEYVJWfgA93jc3IFFfUZo4XgE/U/hZr+oqQ8rVaZ3pu
	DPz1IPqPDq4sE9OmpolUAosQT0ae2i/qh3//Lqke+/JghQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4tedm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:59:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso178184721cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779965952; x=1780570752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQykVN7zbGGObjLJasSgT0TVowil6BekcefmkEti1dk=;
        b=Vadu6lC6MLXDvWGHVUaY8zXTykil/v7/qQSm3Nc9842rOaQHc6BrC9xHRkdnIc+eVw
         VbapuI9P97vVmFZ5er1XtzkfBzWpeB+orYMyYonJfI9+TSsk17czqoi1VejbwbjktVzY
         UNJptnKdLiSWRT45F0k6tMQ6XRjRKy5Xw+uaYaICuo1IcnRj+dGelVEciXXuiZWmtW04
         cRKkqsNYu5AM6+ARcXI3DZqIRQDkXHHKhJI+nwZS2JcIE+m/I3Kd51DPjW/3gFfQhWkn
         vULZ0Z3Ywlpym5cB6Si3orxhtYJOvXSB2GXK9sNiizszeBlh1PqnAf+v16MxQwnJRJmV
         8vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965952; x=1780570752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQykVN7zbGGObjLJasSgT0TVowil6BekcefmkEti1dk=;
        b=qsoSjZttNyOB4+kFnKjhA0DPXOrYqavELmiLU+v6ABC1U1ZsDwo0jZSwauGp2onxAh
         i5bsayeqdYfATnJ0W6vu+90Ws215pxhiB3/W7e/s7p63rA0tyfCqhhTopMWwhzqtWHDR
         MC4dv93R7nS8oZY2vKhTDn4tHb/9yLb6t8ueyprfYwHZoo7aM019WX8FvI5WWimDVBOd
         0UDyt4iR5L/sk88whk1K13ALvrp2os4PUO1V5v77wkKloupQuH0gSpzcC4Jam8zyut1J
         VNgDFLJqXMWTtpE2dBWVQNIlzcZ7kdDW/SRcRWcNknP2N28mSQF0R2tR8E/xnvr54iim
         HefA==
X-Forwarded-Encrypted: i=1; AFNElJ8I61VE3MlbBIyFnG3G4JTbay6aJkoLa1yg67Ybe2SXd0kvf1H0phILIojFnOiCOhS4oB/nkGKPDaZrCf7u@vger.kernel.org
X-Gm-Message-State: AOJu0YwUisdKFI6CsAGVZApd5yBlOenAVUOu9vVhQEbQ/HwwZiwyS/C5
	AcNTChh3R1T9OD6pdbvSF1khmQ8yQ7Db9GnwWLTUVLXquFO9hUQiIA1EXQmQFLbOZ+gNqB7Cklc
	1me4UIlmP1WkxmPhBufcpeaNVUxrzk0SpL5Zeg8L6Q3448zllsieLGy2LFx6VNufvZfKC
X-Gm-Gg: Acq92OGwQGVB435BrkYx/VAY35IyHKmrG0w3YWmj6ZjGMNz5do1V+VeoZHzTF/VIRfK
	XMsZdSYoooW039M8/3LXfikC453jmrpVppKF/91k+TY3UaLCZieeHpphT+bYu0gKVDESNqMWgkk
	OBi0TmUwOYn7OLcorzE5FrMmged+jJfVHGS7APNBl7HPj6r6rf3Yz69xRQ+vEUUpd0hj6hP4QBF
	lQiapJVOqXpi/ZrMcNxr8oXg+/x8EFKKnjoK4gVAlY1rDa79XSo3Xe2MZQE+1cMGCL0gELPhc8H
	n+s5Xa6zPOilGsgZO4nmUIWuHaezZjW3cAY9d4zAExZifBI4Y53x7ifWw+2v2RVxIh1LrqGn5WY
	82Hc8/MKaKKYwrRdY0U33j8Ya55BoQDL4p7UD8wFwUmHNvWEZL1bFH5gz/KNhyx3dQElg5XrAQp
	uHgK7xYNJM8qwRcd6QkJDIm+xMcm8WcPBtkPsxgSDD/9gczw==
X-Received: by 2002:a05:622a:684c:10b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-516d440e798mr181630841cf.59.1779965952193;
        Thu, 28 May 2026 03:59:12 -0700 (PDT)
X-Received: by 2002:a05:622a:684c:10b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-516d440e798mr181630531cf.59.1779965951660;
        Thu, 28 May 2026 03:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4bae942csm1105133e87.36.2026.05.28.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:59:10 -0700 (PDT)
Date: Thu, 28 May 2026 13:59:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for
 platform specific initialization
Message-ID: <6gbdp4zycx72y5dpbhsvxrv22khetqaovylmazusp3qanqp62x@o334xpoh7gkt>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
 <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
 <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDExMSBTYWx0ZWRfXyZLqDzlAe8se
 JkeFZ78f9Gwx9v11FJUkK+nczw8i6e84DH1X/UVrynq96Q1CjibDgMhKpFoC6fZtlQa2Q4HXYGS
 39kYopzsrLwXofUY1ueoMk3GxGtMCAkjA/ZG7oEWVjVbILhPC6ROB84Tqm0D7sEEgIDetQceUpY
 blKILtKM3amWTSiJUH5vIm3wbJEKafuihCbBXOJstIegLhIMxFOv1tCYd0YC10OV5jKIz4rLKIS
 OJbYiC/w4LMt2xusZ2lFHjqHDrOEgcL1VZKwZdWeiB8zjWq0VOyUQD36zj+inK0m4JcfDEsywyv
 NLcYsraiwkFL+R1MpZmDmrGNAUwhdAIATBNpTCj4O+GV1SNTaa8WSyEVsBfWVluqP0RUQhju172
 x7nnoHpUMBHXbwc5JADpJBm2jEW+mbAY8UFnM+0AsQvQgI+TMh3qMMdy0LEyZNRzvelt9xSxjmm
 7rlAlLDVkQarGY65qrg==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a182000 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5AEaNukWL0ruuHmld-sA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kdss2LF8HVUMu0qS-rBXkU3jGZpds2-6
X-Proofpoint-ORIG-GUID: kdss2LF8HVUMu0qS-rBXkU3jGZpds2-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280111
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110104-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BBFC5F1083
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:51:52PM +0530, Vishnu Reddy wrote:
> 
> On 5/17/2026 11:05 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
> >> The Glymur platform requires a dedicated firmware context bank device
> >> which is mapped to the firmware stream ID to load the firmware.
> > Why is it required on Glymur? Is it _only_ on Glymur?
> 
> It is required for firmware booting on platforms where Linux runs as the
> hypervisor (KVM/EL2), where the driver needs to manually manage the firmware
> IOMMU mapping via a dedicated context bank device. This is currently specific
> to Glymur.

Is it explained in the commit message? Usually, reviewer's 'why'
questions mean only one thing: there is no good enough problem
description in the commit message.

> 
> >> Add init and deinit hooks in the platform data for context bank setup.
> >> These hooks allow platform specific code to initialize and tear down
> >> context banks.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
> >>  2 files changed, 24 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 6a108173be35..84fc68128c70 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -263,6 +263,8 @@ struct iris_platform_data {
> >>  	 */
> >>  	const struct iris_firmware_desc *firmware_desc;
> >>  
> >> +	int (*init_cb_devs)(struct iris_core *core);
> >> +	void (*deinit_cb_devs)(struct iris_core *core);
> > Why are they being added directly to iris_platform_data? Why not the
> > vpu_ops?
> 
> Some vpu_ops are shared across more than one platform because of same
> power sequence.

That's still fine, it's better to have vpu_ops with same callbacks
(except for this one) rather than having a one-off callback not matching
anything else in struct.

> 
> >>  	const struct vpu_ops *vpu_ops;
> >>  	const struct icc_info *icc_tbl;
> >>  	unsigned int icc_tbl_size;

-- 
With best wishes
Dmitry

