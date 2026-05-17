Return-Path: <linux-arm-msm+bounces-108053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGydKhr8CWpPvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 223145629B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D761E3037DE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFE93C9EE5;
	Sun, 17 May 2026 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AF9oZJxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dec8j6hT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6803C989B
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039083; cv=none; b=rn7h3fidJ41IxSFpsJxNWC5eC4A15xPT1L9lp5KNwyP2+AwhDnPRB79ZFVtIDyZhmW2CkxFmMWo4jpIYBzwUJSzroOpgLj5/7kQcHv06mLfo7FsK/DwS7b7L9XJtsSdgld+wUfysAF8Y82J6VhZxrhDQC1yaja7ZMk9u4kmCgaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039083; c=relaxed/simple;
	bh=ddpK/1fQ1/ofrCYfSocIFVjNulkretdPKH0F1topeuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9PYe6XtaagCfKOHS2Zzs9H9G4mLU6VwJjRlRUotK8I3eQlK1oHgtFd3LUuvMM/aDXnTOQkI4ucsZOaSyCBgLcgybt1TVy+R8AQBxFj8r4CXKMxDyOQQMyxP1LSmeRY3VHv9mikO8jVEAkmLPDmNizSDtXXbt2qemn5g/C/NbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AF9oZJxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dec8j6hT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HFUWnB4145446
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KbfQWTa4JGz2bP3xz67UN369
	baMaSiTTAvAd+IsVkZc=; b=AF9oZJxha6L/fXzvJoYafBp2qJZybWVLfVy3/Ief
	Alzi+ZUt+mYo8hKNWfyOamZ70IvvKBJoegHSxV5n2FmZcMB+ORPHumXogHV5KKQ5
	gpwXQ9k1OFaJkQYXpeJqf+rhV06Ec8B1EpIbVvgPV65XQhGXBGp+EmYyBx8JMOoI
	IYuX+RMACQCwIvWtpv1cxDnZdLbXwRwCY3PKCXVodKbWKrwTZlWJe3Aq3Gx8pU4J
	80Xoep0rqA6NjJxj7Mx1aIFc6jMLDBZwtIGe7EtdGwFR63SBkZfRj2HE9GZz8NUt
	OYEYHh75aKt0vr94gplsDeyppvrzm69du2WSQJL1DpyjsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01k9tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:31:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so49260921cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039079; x=1779643879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KbfQWTa4JGz2bP3xz67UN369baMaSiTTAvAd+IsVkZc=;
        b=Dec8j6hTTjAOjV7iUQDQa0mP7OTdRejM058NAZMfwyBNveTBm2K/fiHivC2kSUla68
         0+1aSq87Yf/3+MEm49ArMGXcthLZbPI70KW1+3EKwwwR6dcRDa5FTPA6FakUkoOEqbtl
         JQwTOTBa50q7QDmSsUpnXKz6BQdI1S9rr+BMmu87AZVeZ+3RC1yBeoY0y1pF38aOz6iR
         fJmhuxOPiagNYZJX8ZwDJK98PeygF+Y+nj6hqAUydx0seFr0KbkMsIwNUCqCgoa6SbPS
         HjcXcMXzh+ShJWebRWWluA6Z1WsKV9gcgKRc+JxAjLQNnXkS73RobAD2LBPH1L9dTzok
         4+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039079; x=1779643879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbfQWTa4JGz2bP3xz67UN369baMaSiTTAvAd+IsVkZc=;
        b=LKeGGICxgRWMRx/GYo/YDiGvXVzSoxVrZlekMk4164EgwLDfIx7GHc23/rXBYfGHtZ
         xKmZBvtDeohZQB5W0ObzAZyOf2R66kMQE4xddXHkQOBs0AQ+xHXPSF++KUJw4XTbEMZY
         mgzYNiD1pz/XmU2V/vWBxE51CqLEYccr8rzAcdFv6QpKVLjGT30AqlpklT1+DRuaYxdy
         T1GAfG6Edp1z0V/8TUHpqiDKFvt4j9bj8neHXqoOStP+vXDV6uDD+8tpitUqVkuGS4vb
         794fKpxnYwugktbqiKckR9Owor2OBtidxp25vZgCosjpJtkVkq0qQCPF05/O/6FiB3yY
         fsgw==
X-Forwarded-Encrypted: i=1; AFNElJ9rYWGEcdbRQ1u29BqwuRYJgjq7ZzlEARYflOUXiMBSVPvPuj5c90hdYkjsUMJE5Hn8uhIgrKyOb2mWI9z/@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcbpdEC/3VgJp24MavO8Uj9SglQ4LJbJucOK1H/1E3iveUEom
	LuiDj8WIUXyJ+EyJNS/HmcfSo26x5+EkDbez9tLfbO0eB+9ckY/QDukz3RLTcPJ0yFg58EqFK1n
	kmNsGyuAlIK1sQbVMBK7njlfVtfciMkBkSSsnJXD8o+J69mElWxg2APjJ6uIS0UYjPmov
X-Gm-Gg: Acq92OGnyLlhH/WBzh9M0KSYwn6/hxf9Xb6Ej0jKA7Afb1AeNgJFbaFKQh49Mp4vbR4
	4XYaLv9WXciRPXVzKy3ZpYVOHSvl3u0fzZ9NknNeucHJdN9q9GAibq/Kayk8y6ndYwPtaRbbufJ
	hJd1fr0WC9MrYePATw9F/L5eXzKQl/8p6FX48MAgtR7iALmjFYVnv2j7FIvvVFQ1KnGvtLQZ5Hd
	x8MckQA2HeJcCRcVS00AxADsEEwbnsKgE2rgTK1nlVWD6r8nvOAOc3Y5aEwejZwLfgUhOVL+TEW
	oRuOXe3HcdXvlPpXNspmDF89CYqNS09LOAMqrkzllueDa69SaZHi1sv2LnEEwTkkdJNF2R5HlQy
	PVEFNM2GaS140eo1wbfRxfyzMw5oNsTR3b0cV+8B0oeYiZXfM+v+HtEtw7EVQgJSiVYFIOZJJY9
	hJFo/O98/59FTXkkIhcHWzFFye7nbh62aBt+rJuPhacVqxzQ==
X-Received: by 2002:ac8:7dc6:0:b0:515:875a:ec22 with SMTP id d75a77b69052e-5165a0022cbmr183435561cf.10.1779039079347;
        Sun, 17 May 2026 10:31:19 -0700 (PDT)
X-Received: by 2002:ac8:7dc6:0:b0:515:875a:ec22 with SMTP id d75a77b69052e-5165a0022cbmr183434871cf.10.1779039078744;
        Sun, 17 May 2026 10:31:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b6cb8sm6534341fa.37.2026.05.17.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:31:17 -0700 (PDT)
Date: Sun, 17 May 2026 20:31:15 +0300
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
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v6 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <gabnkc3nmsat7bdevnpgpba2fwvv3juzwut2n6emmyudrntht3@poynzfrdwjmm>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-3-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-3-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0kpLK5tcnqvgR41KnQ11rh5S0Jq4Lz5x
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a09fb68 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NngpiPSqF1r_w6X9nHoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0kpLK5tcnqvgR41KnQ11rh5S0Jq4Lz5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OCBTYWx0ZWRfX/ADIdEnTajRD
 21/xcpqoLAAIDz+en7kE2I/HU7yLDNYf5JlRDom0EOrs92fO+pHAeK26GJ1fhcHvPYkd1uDiUrx
 GWneK+44V6Z7RUHQ8FNnO9kyY3yQsfZhOB0OVkT7OFzazR5bn36GpuRoiE61+vwyd8EFaWk084B
 R88Tk3n487jajNjHxrHqFT2WXO2O8tKfBk/69aTvNAkU3avPLdxniR6NHyUDwgLA75jRL/yr2XO
 G9804PGyfa5F2fRidSXfXyln3jTv4FWrrk5vJAvyIKqetoo/m2DhG/CwojGIb6rNuOQljXaJanf
 vgxm6nYGlDSDekcFnkC7wyurGwgVSc34CTL8aVbWrii9aaARl1DqqL65n5NctI5gvtuS+LyWHZL
 m49SyrBAa0+vvr7puKrnlePK9lZRiIW1KTwcf3RhWZexoqfmSZR11RbUSMNG6B7p+nMnzdvrhLR
 rtRBv0tgdWp4PU7FJZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170188
X-Rspamd-Queue-Id: 223145629B6
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-108053-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:18PM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 --
>  1 file changed, 2 deletions(-)

Please settle the discussions before posting new iterations. Just
providing a response is not enough. Get an agreement of the other person
(or a timeout).

Until the discussion at v5 is settled, NAK

Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 7bba3b6209c2..df76530be809 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -26,7 +26,6 @@
>  #define QTBL_ENABLE				BIT(0)
>  
>  #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
> -#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
>  #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
>  #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
>  #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
> @@ -78,7 +77,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	iris_vpu_setup_ucregion_memory_map(core);
>  
>  	writel(ctrl_init, core->reg_base + CTRL_INIT);
> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>  
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status = readl(core->reg_base + CTRL_STATUS);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

