Return-Path: <linux-arm-msm+bounces-106731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IwMHsE2/mkroAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:17:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6254FB03A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA25303CE90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8992B37AA91;
	Fri,  8 May 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiWGhKT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAgfwcTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D233EB17
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267804; cv=none; b=YlRq0uhebD/qZOS3ajuARxkiiZElAGY0qGx/rh8KtrvXmnDNm+nsfG7EyuZAXnN4f2QE2VHtrBBdCN/Zh6m7QRrn0YKtERIauSwjrhzTRDV4JvianRgkiLPWu4IHpCTdlsYrSuAgZkmYjM38NdrtVcu19JMIcHvhjoHoT4Ou0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267804; c=relaxed/simple;
	bh=GqrSSFG+g75ZfR09SPDvsyRCtlFsE5haXopDyurtwfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGrOpwCN2lkrT+nle8ztRc7SGtQp9G/Q9cp3QhXMKI6xZc9G92yOIPu7lP3WGVIKEP68rTs81YW7KpmCdifdRcAycPUoR6fgPLheqlvVRogLYLdc/lgaV6NSMVyHvG0oxkCieMgkivTwoGX5naaTZMPzlbIrD9jaa1nLhSbu21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiWGhKT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAgfwcTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648He2Tt874557
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0S/MaBMiXgPLIl8xMXZreOhp
	tTdxir8IQpeWuhySA38=; b=FiWGhKT316va8LDXkb4dzlF+N1sHDUFf2/kUE5pu
	ORAY3pIpzA9b/swU83iCS8Tn47OwEGnuz4J3PiM5VEJgn/PsqR537zjWMiWtAN3Q
	PAW+IvJ6H9IRAmMPxm0hzPddoHC6wHteJDnKesYGOIc2/nxs2Uw9lMchBNr28HDJ
	7NCxHDgIndXeTW5KYX1++n/jOtxdAilkH2qK747cq/Fms5FmRM+ZtFm4CMJsJF3n
	D028s57sh5cDECU3NoWOHP01b4nSnHvE7eHD4EXcMIDob/7chcrZEax3/oUjKJg9
	FXPii95Z/XKIayq6AU0ozH8cFd8h5IjxcErddyqEPkeJMw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1me80a7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:16:42 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-423306870bdso4871059fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267801; x=1778872601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0S/MaBMiXgPLIl8xMXZreOhptTdxir8IQpeWuhySA38=;
        b=BAgfwcTxFSzzMxePDyCcyLFUy7rAkWTeav5MqdxsFK1LlicdkFB+owmTRz7c3md0X+
         3vz1SeGKroNFQfiabhBI2g9ap5o86BQ1mwzEzhJna1znbREYZKC5cNUxVF0JkTU7awwk
         jp76i9Di/j5rxRDg8kvwAeMUZAKT1YHxOnFdNrLMBniaAj90LNaM35n8eNKr81Etdv8M
         2sxLyAEXwZ9/Ncvi7xtm/UkrdzbxL/Sh6bkXbl9g86Qk/Ve/BNtkflG++5321wWjOi17
         vnL3VogR3SICBRzrLQHV0RQdkWVMByz9ssHSmTsEr0zmUNZkZS3freOWm0I7qOiQDiPU
         fGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267801; x=1778872601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S/MaBMiXgPLIl8xMXZreOhptTdxir8IQpeWuhySA38=;
        b=c8Dr6fv4Iaku4cy1rCiDtme8TKgfFoGWo5bmuQRNvYznfzO1orOICbzPjQpc+rokHG
         otTGfcIREG1QALffbF1AG+iVmaIlDi/p0OgP7SsHppNgwFHSgA2zZvM+KbQczQkIlQLP
         T2GF4Rp91mtbC8uVQ1pOv/RG9NMAE1IPg4/TbA/KqZAmzY7O3m8MSgpXBx7jjsvQwDZq
         vsMQourw1KoidCnnxyfQIRhb0YkvtrpTewUB4CAqmSDncMrEQbkBlpBK1TlImvrE7pfv
         /qf0r79FdF970Ckq85/PtK2VcrnQ+qkpPy2SuKEG1H08/xVdGt7ub7Iz3BHzJtL8ITDc
         y/8g==
X-Forwarded-Encrypted: i=1; AFNElJ8eblfEHhoV3FeL2Vb9eBUouWlj4mFSv+6kan3pmIQ5jSj5h/6Z4AxOrx6QRad5lsu3Fnhu3cxgJKEDE836@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6QNW7KzLZH6MBHnioUhi0b17IU771zSnEZWq2orLfKMUgDlNJ
	90EZ56afTF/5lZoUUxJicg6fBQo48p31yObjGHzpjyMamfeIbMNkep4VKTuxv5GsOsCfGne2RiX
	SU1cvblDnj34bujEX5XzskSbxr1yQPg/p/AL7ojCdnXVuVZuh0oBdRMLGgJUf+ExER8qO
X-Gm-Gg: AeBDiethp6aC5WM93BeiP2Ts4F6LTs9ry5iBM2ScsJ2R2glL1C40AljWHql6Dg/aVpD
	k3k3r1e9AYuN7djdH747btL5uTqo2CLytteYLH7GXrF+8WPmdqmTSCZY33AYIxtAJJY+v7Nsak8
	A/AICjN2ntmH2sWMPVW+QNlsYHUii7xYlcbcqU97vcMADQ7wHNPeGxkAmAEkJk5IapGDLkJ6Yuk
	JtrQufWxVjEMJCCDRik1eQ7/pAVVwminrzPxZFVjjDoSvZu9K9hfBMk5IyVsLXp8kZ8+9lSGNTG
	Hyi6OJ1bU6XQ5R2qqKCaKDxblHEBEyI6ObaZiDTIyKeDr9qmJjdAt8BOX+FNZHnaUeauRmVckc0
	Xiy/EIzz2ts4rnfWzBUer3us4bq44ogz2PH7gpgrkj/Q2xnmN9GsBUC0iZjnvXamQQs3izFfToN
	u9b7fy8hphw0UrG7JhYoef8T30Vyi6UxI8Mqo=
X-Received: by 2002:a4a:e914:0:b0:696:1291:fb29 with SMTP id 006d021491bc7-69998cbe145mr7809111eaf.24.1778267801596;
        Fri, 08 May 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a4a:e914:0:b0:696:1291:fb29 with SMTP id 006d021491bc7-69998cbe145mr7809069eaf.24.1778267801163;
        Fri, 08 May 2026 12:16:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951552dsm727066e87.6.2026.05.08.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:16:39 -0700 (PDT)
Date: Fri, 8 May 2026 22:16:38 +0300
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Message-ID: <ewu4nbig32tl67xwghulsnyotlxezkkbx4uystuky4xe74rpud@xblm7twcvhxf>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX8bfSxHvekCib
 Sx0+46ngfv4VuPPFKqFJU3fNH1VmjwPWw0/FZ7x9WTfQoDSUGwhQjbXDgq0D7u6ozbKAXGUivMa
 Hz9qG+UYvznm5oPdpkmPRotVQOoAGMdNb/KALf8Z+2HkYXOzHK/4ShxxF82thiXSW1hO3PnDVwP
 lsCU3ypNrkNgyTTqwuaDwkmzXKxGmgLUiYoYPwTbZaKKcyqOlQavo7IqJvYZeGnL4x7T/h8hLDI
 v1szrkSchAKtJyy+1iNraVPBqxxv6UJ2NA8P9DkEaTeeB+JoT5otQ2+FNjlVBaultSbO7myrb6K
 ILlbA+16vO/kzYhttFWJ/eMEkgZYRXjGFUeziuYjt7XNLa1WVgqi8D+LuNFejyMlMjo4xGkBQXS
 DZkfmoya6K8w365DZMTu/fE+LoTQIgw4iPFTG+wV+TMUjfEu/dw2hPHxz/a6wbzbZm3iGwAoWqo
 0p/OrJb/nLuJPyO/lPw==
X-Authority-Analysis: v=2.4 cv=BsKtB4X5 c=1 sm=1 tr=0 ts=69fe369a cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0ofZ2ib08pOWvdXbZkUA:9 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: VhjdNNl7QhVOqx6aBnRwtXqe51mS_Ywc
X-Proofpoint-ORIG-GUID: VhjdNNl7QhVOqx6aBnRwtXqe51mS_Ywc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080192
X-Rspamd-Queue-Id: DA6254FB03A
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-106731-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:51AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

