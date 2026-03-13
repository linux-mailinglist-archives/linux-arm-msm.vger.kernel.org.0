Return-Path: <linux-arm-msm+bounces-97556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNxFI4UxtGmuigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:47:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD242864EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0396C32AE3D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E762F2153D8;
	Fri, 13 Mar 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wyq2R13q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWMcsWqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0923C0610
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416507; cv=none; b=brKl3FM/vosJp2W2YWnFNrk8VpubCNCLDzpWiP9EgG1ufS1qyx8R0321hi8QFf4I61VAjO6+QfgQNk6yxyFCioniTyH2mxjCEyAKXdTdKWLmKgfuZ7dQ2/AaVCHiCoOxVQthHzsgi6E/HsJxfxVPope1BuNL7hquImrik8VIO+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416507; c=relaxed/simple;
	bh=MaiIry6g1HGAhKzGVifNyMsE7l9EPQrOe+s3ZJ/XqnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCVWpIzPnyYqiaDySWDZFdJOPckKz3MZjkIY30wEKF/dErOb8/VXHzp8ynO7BxNnq2TibcCgB7WQmdU+s1yzv3ALRW026aq0h760dVfxmFdelL4cSA1tPUEJM/8Nf8H/SSGbzCTGATwOoJfPvQicsu5Kw6K0lzhMG5zp2f53bEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wyq2R13q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWMcsWqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEMUmk237560
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3huDFL/uMHzUyF/m5Jbypl50
	A1EHb0E/+PjkLmvRWTo=; b=Wyq2R13q9o/OD7KN1zwANuwq3sI3bpjvBs5kTnpz
	szKqQYaGWr6fRxkPO4H5OsyUuJ5OzJPHpKH5jip8P5aInYOBF0iijWdALEO6Y/cR
	grEralZ51vN/COja16IW+SEBJqOSNoSYDUNsabRyYaURSVLLGaR0Bw49DgFw9DhM
	a+L/3D2QRCGdyGhiA969NEWYNzcNsHmyc0GFIUB8cH/LjKsF4okWqDYnGglz/fQl
	uX2ELVnCGDS217qoVTuI8gig7SNb7RxPV5Vw6/kWSNhhBvFWpXvINJRdKcZEvoiR
	EWg4d9l+mD/Kci4iEXUIgkPZ9jxo2GAjFjCY5tHPBp/llA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d9rhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:41:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fc74c6634aso24992076137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416503; x=1774021303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3huDFL/uMHzUyF/m5Jbypl50A1EHb0E/+PjkLmvRWTo=;
        b=jWMcsWqWs+6Sme/WL2/PeQGV4fnEYKDBOyz2HiapoDysO1VpIwG8clofBMy3ujkC7v
         UNabBhxseKtInmtlsyNBkI20uspKlBAjTGre3U4sC8MOiU8sL1kQKS4e4IpX33P9BwHA
         KgtNneYhRzV9CzV/oaOduTGHFF97lLhc7UrVstNmUeUjMvANkT9uwh1aENqIv8exeGHc
         NuLGZTTB6EpscJtUuAjOPB9iMi6bwwc+mGm163TSzooVcas3O5wHST8LuuKLITmHCvT0
         AGqyeSXxnHq0ITIMIusFbOeDAfL7ePRBKL/LMHR/XJ2vsjN0G1pfMITc3q5mxjLyZeAo
         o6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416503; x=1774021303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3huDFL/uMHzUyF/m5Jbypl50A1EHb0E/+PjkLmvRWTo=;
        b=sYrp7Pz8v9GkNlZASkgw5gUjmCHHN1voniIDfemor/fx+TSPMQurIBVeamjRGOkmGd
         eeh7b5kZG4KTgdWH6mjyPiLxskc23zM1cmKUv0gfG0AYYdK6Vpi3jsCj3gfcAwvt/GQl
         ZTB8MTo3QjhixECFWVJO7mm5H6V27JbTaaued9qBIDeN+o+VUXKVsiA0gJ0ARF5spr0+
         l2w4xFBtPr+jamwOW3xy2VNHANjXT5LGjjp+gGBxsZRpJY4FSfUaN1z+cc3n0I0nYkjo
         crdJ5HdHyLNfWEI9/Zagtml0tlFl05OEhsEDOyWRM0iMlRnKODeikqpugZrFv2101fMg
         G99A==
X-Forwarded-Encrypted: i=1; AJvYcCXQ2OVAv4k/ldSmjm6Qm/L1loX/QGOc3/+Trj7yv8jTjDibwuzBsl1bv16QaaXrZw0sdh/6ZLjkLHoRaR7f@vger.kernel.org
X-Gm-Message-State: AOJu0YwlB72PwKBAMFct9mGJFfX378W2R2OSa87+xL4WgSp9qYbITAqM
	J7l4xg/IgMKuAnRmokf3LGRqRfeRcuTjUiqxJ1s/H+FRCgm7HZPQLSFjxErO6pD7xGgGZacDKWZ
	HYyo1atTR7JWpLYhbiSNK96Ml8BVWbXv3txp79DF608hUeT1QuI4hFN7E91JickI1jPgE
X-Gm-Gg: ATEYQzyD+lfFXFkKLhQ5ArUM5Uva//HooIkXvFxK5E46LzabYYcT3B3PV9FP2aYkdpd
	GZfrTlt7jx1QpvDOYAyXZ7DdPf7firXkQzM7PZJa1DPcme4L/59Lic/OhETHgrwLSUNbhgUTxU5
	1MyjLIL+elOXYuCGkTlN7j+bD9EA/XL/5UA6zbdf5JvqkmZGtA+xtd4e4DRw2m9JKNf/XdQ+AWZ
	v2w54GjofpHGdgZ50bDjK7HVmxV0GmXTFwLo3+fBAzHDFVxsEKekvlzoTzBotWqxRwMqBjEBR/6
	3soQMgXRnWEbQkeHjfxFslLqNIDUEi1E+Ka4HaOMITmJ83Sf09Ju3mPBXtplmYAmRTvzKWgPZBW
	hsgxGx5wh0NZfUVtwzhI1PzyLYoVlHjZCC6U+lI4oYsp5y88G9Ed2tn9wBXu87cacsDtxn1yosm
	AaMLG+BvAMiAjjqMSALvskjWbTbFBcBMyvhx8=
X-Received: by 2002:a05:6102:508c:b0:600:a2:1397 with SMTP id ada2fe7eead31-6020e5345d4mr1755129137.25.1773416503384;
        Fri, 13 Mar 2026 08:41:43 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:600:a2:1397 with SMTP id ada2fe7eead31-6020e5345d4mr1755102137.25.1773416502957;
        Fri, 13 Mar 2026 08:41:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed6esm14182221fa.23.2026.03.13.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:41:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:41:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 5/7] media: iris: add helper to select context bank
 device
Message-ID: <5a33eitlctupl5b65zr33kukfgru22qldkmfiyzlq6buczttmk@5nayj7qea3fq>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-5-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-5-9c0d1a67af4b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6264MxrjWRnia4IjwZbO8o4h3mN978nW
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b43038 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=m0VDa53i6esOPautn7AA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNSBTYWx0ZWRfX6Y44Cfp6iCAu
 UkbktdcKuZyJAaibFfELqqmCYkE2jErRl4kBhUSpZleKLmUN87qAaZs1eBgWdft355ffm4PJOB9
 h1tnBVC8l1EV/Tn+CRkmUEQrR6Q5iC9utOOY4MysH9my9Eu1+Ro9VHh99+4ZrV4XzXF3PQKu8jM
 +Eh3lqcJqUwPfHuFNbX+MmMjuh3PusEcwPDVARoHMPPYIQJLdl7AFhoO2tMvOC5XOKlakFLU4r0
 g8wUsnv26sSQ4eNdjyReFKlMhFZfGiL7XZFrG73Ex53zoKFbvUGXQSgic2iMs12p+zCSb+dTxNb
 Ad1hkqF8PinxoPtlVtHRZIKx1OtsJ/VC+Sa5e4X0rNR3Wt7ZJRwyEn5gT8wyiCVKuQgkK+DTlQT
 Nrk/m7ttgvDKKUeq3Dz0tB7wlmjruskUYo3cYmV/6xyzmHXhFrCKrb2cAUEYazsGWrQQ8fFUmY/
 sSnIMqDsqd+Domw4ptA==
X-Proofpoint-GUID: 6264MxrjWRnia4IjwZbO8o4h3mN978nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97556-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBD242864EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:39PM +0530, Vikash Garodia wrote:
> Depending on the buffer type (input, output, internal and interface
> queues), associated context bank is selected, if available. Fallback to
> parent device for backward compatibility.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c    |  7 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
>  drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_resources.h |  2 ++
>  drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
>  5 files changed, 58 insertions(+), 12 deletions(-)
> 
> @@ -187,3 +188,43 @@ int iris_create_child_device_and_map(struct iris_core *core, const struct iris_c
>  
>  	return 0;
>  }
> +
> +enum iris_buffer_region iris_get_region(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +{
> +	switch (buffer_type) {
> +	case BUF_INPUT:
> +		if (inst->domain == ENCODER)
> +			return IRIS_PIXEL_REGION;
> +		else
> +			return IRIS_BITSTREAM_REGION;
> +	case BUF_OUTPUT:
> +		if (inst->domain == ENCODER)
> +			return IRIS_BITSTREAM_REGION;
> +		else
> +			return IRIS_PIXEL_REGION;
> +	case BUF_BIN:
> +		return IRIS_BITSTREAM_REGION;
> +	case BUF_DPB:
> +	case BUF_PARTIAL:
> +	case BUF_SCRATCH_2:
> +	case BUF_VPSS:
> +		return IRIS_PIXEL_REGION;
> +	case BUF_ARP:
> +	case BUF_COMV:
> +	case BUF_LINE:
> +	case BUF_NON_COMV:
> +	case BUF_PERSIST:
> +		return IRIS_NON_PIXEL_REGION;
> +	default:
> +		dev_err(inst->core->dev, "unknown buffer type: %d\n", buffer_type);
> +		return IRIS_UNKNOWN_REGION;
> +	}
> +}
> +
> +struct device *iris_get_cb_dev(struct iris_core *core, enum iris_buffer_region region)

Are you going to call these two functions separately? If not, it's
easier to squash them.

> +{
> +	if (core->cb_devs[region])
> +		return core->cb_devs[region];
> +
> +	return core->dev;
> +}

-- 
With best wishes
Dmitry

