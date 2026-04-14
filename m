Return-Path: <linux-arm-msm+bounces-103161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHf9BIpb3mlACQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:21:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CB3FBB02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 306EB302E335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 15:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CB03E9589;
	Tue, 14 Apr 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXyQm6dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnCQLQ0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186393E8C5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180026; cv=none; b=sdPFhu7kuHkwamB9uPg2xtKUa7DYNoBzpEhtY+H/gpzLkbj9vaKf+m8DLWbgIMv8rGzCrEk2RZOvLIhpaI9Of6Ol2DmZ7TvsI7iNfr8TJ94pDmoDCIIU4n1g68cMiU/09FYjgU4Jg1tzKttzU6z807QMqQkoVOclqkgALc68T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180026; c=relaxed/simple;
	bh=ZVhgbifAln2OzcbNbG8e+t48xa3IPnq3A4MkqBC2ucc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYdkvhmorYe/I8BZ7Xs3IougSjmWQxqTtETkwFpwtvgdUnyT1w+ybiUi9bzQFT3w+fmW+i7MrInhyjz/IyJ4iuBUnY/4iUKivUUcjN1nbQ3VYWpyNQ7cUX+9zs6bQ7F5gj7eQOIv/J/qzcHyTj2X4IEgLBz5gFJKzs3YwZ1pqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXyQm6dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnCQLQ0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC75gQ3157820
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eRyLpOe3BxkDfC/79y4mRDy2
	zo6Mqv/lVSOI/jQ5RBo=; b=GXyQm6dqs3c2KrXG0JeQqKuLblcaKvc25vRLgpdB
	p/hDom/XzWvcBuES8/K4MQjLNzj55AUP15ebX7HSketu3jDDHJIotKgl/BH1UeKW
	IQFDj0Hn1xo04LEqA9ZbEHtSCOiq9JOFTfH/kKLj7zcyBf3hHiZWEanwLIxB8GG3
	I+5kY46iJPqpYoX8PYicVau1UDbgvRWEg2R01CDOjkrp3IZhAkcbCkqyD7nPDJpc
	ZTZmm/ZD2LQVbND8jAlkpcwHqHLSY2k3SQznb2YAtXS7OK/i5Km0OmlgTJ+59Mz/
	pURjQBAanOS+FhWWG9dhijMCSmCxzjOE6/LiKekIYcw7CA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb9cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:20:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60ff08dfb37so1298923137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776180023; x=1776784823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRyLpOe3BxkDfC/79y4mRDy2zo6Mqv/lVSOI/jQ5RBo=;
        b=RnCQLQ0Rv1+QmUntSt5hd1ns0o6FnDGOdMSOgML+n6+gPL+XHRTajgQOBjrsXb22g7
         F3xDCoxW5gw2uQMwaRtBnqcCTNWn/jY07UU6gRr79+ElVc6ctEQzxcnT+K9BBtxLZJGC
         n89JQVNLzos72qsTV7eRfLE0eyYc0r/Fgzk0A133Fl+kcj1U5VX+sGkGoEUYUrIgtXY6
         Pd+L708lqmq6y4uV1Pt4Pdv+Fc19plTHwA7o+cKFoCQYuXBYDuFSVTv+V61794sv4Bw6
         WqJHU23HprBWBpij7x7AvGhqMFF0E7p7GMrgBLIyv6QoSrypYXtTpXOyotZNjFR+wUTz
         /+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180023; x=1776784823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRyLpOe3BxkDfC/79y4mRDy2zo6Mqv/lVSOI/jQ5RBo=;
        b=KBK7vT8UGVJwhBHiW0Hso+ua62CPtw09/JzsEMMqTvTo6aUh3edOYgbeu2Tak8RJAL
         d1iIHUJF2/e9RGWGCepDeAlx2Yz/wdfXOMF7bkx4yW9MsTVWV21fWnmu6L+V6XGyeBX1
         QvNHRJ68ByCq09mCEegAAzepWYYzFwr5IK1KT6wnFiKX9csyQ4kBUr9yDpwfaOkdjjSo
         1NF76zYVV6XqKc418xC9sqK+JZeB2Uw4jYRPFgMyuLIYGQwBZOIhZO4demR/M7+DIJ+E
         0FbdhhH7tnVve+fdT3u91LEMWIZ3wPtDIcJdPbSeUMPshXjv3SfRRERenqC30rQdL93+
         qoYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QTJm3lvidcuOrc9jqIu9U146lUSmzYxWfX3YEHMJFu7IRPkiiW4Uhqvub6hYlenVn68CKmjbV3X8lZHER@vger.kernel.org
X-Gm-Message-State: AOJu0YxksIphnFHgXSs+AgwqvsakDA6UGlOnCKqD6uRlhvVHDORBKLDp
	Erz7KYvEsvvwHgdFmcSADrsOQAZyThk6c1afSw8nvOUwgZYx4xRaakGYosLz71n4pvR2GI8KBl9
	tHirR6sHlQFbPS4+d8rzPPR2XNIpL0T4CCSjCMrriUJ+jRfxeTavuOtoTmaOcMtW63CeW
X-Gm-Gg: AeBDievrGUTMMoUg60CywU1enhRPypGqXJlGUx/AthNSctSUl4am2kmzCqGt1C1lSHU
	dL1hjwvXN7JJZyaqwNnfUKwQuZpjQxFtUlYAWgAqhyiJefKgGyPpzsYumOvO2PhxPML6BtYtLCq
	yibRfE9Z6WD8ykHPfbAh6uDG9EQCRKtbx8YVdu/gcCy/HDz+GKJdAmkTymJwlVANQmZ1AxSzRjr
	3R74JBKMd5Tam2brTEp4Y7jQi0zjU6ot+WfHNJJCRilp/tG4iFzfGci/T1D5qAIu3aylPT7jo9J
	tvJmWKvLL6nPY+/9RDeOQnjJxryr23zTfljYnaXgJtF3EY1l0MgWKsQNyk1disK23PZ7mEEmhWP
	Qe71gxhhIryaXY8fJ+cJX29oyTP7qeoRYmeL+U8SwTCXAj0IHfaiqxofGY+ErvFF17c4wCcyd61
	BEA5OFJqo4K2NbU+e0n7DK9Fvx7kuAYS2kM21XqM/GMMPhTw==
X-Received: by 2002:a05:6102:5e8b:b0:608:759a:53bc with SMTP id ada2fe7eead31-609fb5713bdmr6999557137.0.1776180023343;
        Tue, 14 Apr 2026 08:20:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8b:b0:608:759a:53bc with SMTP id ada2fe7eead31-609fb5713bdmr6999473137.0.1776180022703;
        Tue, 14 Apr 2026 08:20:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8657esm3314870e87.12.2026.04.14.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:20:21 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
Message-ID: <otikvdonnfakykra57z4fingdyfm7xebw2h3lmykzk6sbk7emq@xptiwpx5lvjl>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0NCBTYWx0ZWRfX+eF7PI1YyI7X
 FYIPXTfmjo/SILIZ53EkeXm2V0VZmniTsqsGxGw6IVvMMQ5RkuOkb/hCTd+ZrnSvu9OE6+gH+Bz
 UELeuIB41WDu+llonOXn9q3JiFyZZeMc+VOiiPb8UoVuzKu7NyHZ98EHuDceEuI2Ox/nUJ+AIfY
 MxIBAFVEsVfLtDZbGjU6D1AEyM83RLPgtepOXP8TQSAe1XUZpKxRoTnFsxXn+BnCSTB6eR9ZDQ7
 QyqRRVt0snuqgvOjd5lvFZqsGnT+5pf+yg6dxrY8AvN8icmW1jdDSAWkZUaEgXf/WfkPerlK0PT
 SOB/zSsZbJZFde2N3lzPvWCu3OhxZL6rvJxVAZ8jMLvUVujovE1FbU3gYvTPkmyIErz0fMqLPdT
 4i7joBaF8OWiV12YaTDInYfZd/eE090svyV2R4Ejg3pkydQRUWKPTg4RiE+BadUXVUz5EXLdTY8
 gr1JMaoN2iGXhY6PwBA==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de5b38 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oTq01oph0ifE-MoszjAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Nmri2GOO7_oEKLDsV96DvVmfha7CXdpl
X-Proofpoint-GUID: Nmri2GOO7_oEKLDsV96DvVmfha7CXdpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140144
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D3CB3FBB02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing

Does this apply to Glymur only or to other platforms too?

> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..bfd1e762c38e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
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

