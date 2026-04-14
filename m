Return-Path: <linux-arm-msm+bounces-103050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDsEMZPg3WkYkgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:37:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24F3F6151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B2530BEA04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AB536D9E6;
	Tue, 14 Apr 2026 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhAqGbNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCxpMacH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5436C59E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148418; cv=none; b=jtjJdnFfip1DhzHy/4w4e1yMQYFeA5PVseuNeNSXOJJzBFeW0/OVBpYAHX2g/iodw5vg09FkvFfTCGciyszBsApuaAI7VOWxWJfvmINU0XrX+nM0k1B6SrCd+HUaO0IbQpF4fZoXq7IPACVCkmdzeZRV+fhIyxaKkNdefJYZDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148418; c=relaxed/simple;
	bh=y1K+LaRyhz93aZWp+gZtDUUqtVcO3IOvlsscpo93Plo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvfbNANRJ+KiofvQaicWU2Z+uMiYOvUXKjh4gwpW+3nF7O5TuS5GtxejYPIK1SpEXTNjiF3f+pcEnr7vQ4Qkg7bAqw2bdYpFARqWuZd4bKIw8ONjQxeA5Gh36IxNFW16cF0hvOuRRLtuTgezIoporhCALel9hsxtZeX6GIyjmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhAqGbNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCxpMacH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCa6V967268
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kiBHEicgBcwVfHpBg7CCiYin
	nWHa6rAo+LKmoWMOeFo=; b=AhAqGbNhMZ2GwitpEGbeVgi2jnydxT42avO5ZwSS
	7rmpJQZwelKyMxwIYvfAlS3rs+EhBTn0wtmQDGlfofkzNtr2BLiv6ybCCwlWO34b
	gsyh0atIipinzGL45rw728cAlYgCtq3y68tOqDNVJFT2ukTiElgwHktj5FPrC8m2
	5p6HSvoSI2e0C5enq/EZ2kwkFiqBJ4jTV9WNcO5F2ptbkpIpZ9lf29pQDwJ8LtZU
	cp7TUp+w+gYq5H6PemUan4qtXZ8ZdrdGsDTZ7UcbuOagXjBclRRC1qZAXKa096OS
	IkS23r4ig4wpoOrMJc1LLhsPxSgqwevbXRbmo2TcbPtE9Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1awe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:33:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a77f807e4so5365584b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 23:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148415; x=1776753215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kiBHEicgBcwVfHpBg7CCiYinnWHa6rAo+LKmoWMOeFo=;
        b=kCxpMacH/BdDl92DTMvGvrpC3ah9fz52/4ADyZw2YvMfI+vXLD9y6g9pNLs5Kt8gRH
         96nzha9PKN0Rx/2p4wZhGQ1HJUYUY4Wkraz0c2KCO4n+KkAhk+4ydBz6jzdnYXLLqWdQ
         OwH/E/n/McIXSmrVPpY++Ndp+B8rIToBxnSOgK4JA3kCPtKKUJssi0BUwL3hNdK3/EIM
         k7cGD+X68EXpxCdFZQyEN1+InlmDdFcShbb8+P0FUzEXCEZLtZCWpWRvJqeftQxSiKKP
         X2f3oa5t89bL0/vLSIpe2zXJ7AFlBhwfWjALnt5hVJvhk3MmnUdhFQ3B/8neEF8Uwofr
         Gkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148415; x=1776753215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiBHEicgBcwVfHpBg7CCiYinnWHa6rAo+LKmoWMOeFo=;
        b=g0992WJ4JJvzaNJ6vJ9aGOw8z+ZrC2+AZxHmIgZiS0qG9XRj8cwZ6OEkdp6UNkQsEa
         snfiMxsDrClKbf74jTeTs8WOOWlCdQCqyPp8+y7Tj36Bd6GzoomDosVzKltG6ER9n79Q
         JV4Wtsel6U7jD9Iv19fZuT2MLfl3fLX7X8liPK6JA80XMaeXOINhKogXRGnuLtCAiHbw
         k7ZTircsqQ6x71ytpQVNgN9eR9ubUn3MBELjwNqfA6ZDuzV4BlHcNpt1Xujzykly1IIs
         irLxGH1N6tOubC+kfJYz5Nptr4kPgH20S6ZRh2DEdTAdYmaiobP3Vt9HNf3RRZ0eMHB5
         3EJA==
X-Forwarded-Encrypted: i=1; AFNElJ+E26MtDesZkENuFRxZwQZRMbDeCNRDtWfX7YKCa7JbJ1OHWQWKdpyRROZv+QiscpvdzdR0yi/HZMIzgavA@vger.kernel.org
X-Gm-Message-State: AOJu0YwuURKyI2efAxEERvkWpPeKcRbr18Qij1aIlZyAsr3IoSDwv9bX
	edrR8rA1fXlaslu4uNlc5zqF15WXV7HYs1VGoGY0YSUU+bkYvk1SWLXc0nb9M2DqDrwPjt74ZiR
	1Q/z3Nx5+OWq9Ld7nQCupWGxPTy5bG+I9uPQ3GDtNeBqEiyjorCPhMALiNGzVDWfzDQkg
X-Gm-Gg: AeBDieuM8wX/DlOaZTcvne13auSYiI6DCLF8FI7NOlMNFpuz0AlFu2Ltadgu7a7lqIX
	l1xgKzE72ZM/V4VoiGSFiacmhVKFtEifgfekF6RgwKmsqBgsvQ+XwnJd+sS/Ef4SgQlx8tk77hn
	81EWssY/bXIEF/7WhUEfze3xuv/MRim25fVM/Y5DhxU4EqpDCGdHQ9OOfNSoxRmVFoHcVwl2obK
	jvTj9do2oAdaFnypZtDjU2ZNSGyg+YW4DsY+oE+bTynDypxENmFQwSVg2a1HCdp0LhFX4zGguZU
	utfiUfsnkJ+9ZpteqROIXaF9CfXWjTwjTNp2fGGppRL5F0SfbJGcj9noHB0aE8/LrjKK2y9QsCh
	8zptsOZssa9H/0kFckX+WUxwtFd0zTmXkkvEj+PA/PgPeFbe5
X-Received: by 2002:a05:6a00:2985:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-82f0c2c2096mr15363527b3a.40.1776148414802;
        Mon, 13 Apr 2026 23:33:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2985:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-82f0c2c2096mr15363469b3a.40.1776148414225;
        Mon, 13 Apr 2026 23:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c377318sm12699558b3a.26.2026.04.13.23.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:33:33 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:03:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
Message-ID: <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OSBTYWx0ZWRfXzOgRuv+QgJwY
 O7k4M3oQ3393f8+SeKR3ziybMHxyvNg/XrKGpCpfRhYBedO13FVJSuzQsAadFAITiE24Bt/ylme
 k1RYRX20LpC5SpkCSE3CDH30DMIFVyq2wLIAHlYEjroMrLnxCue7PtdsKjJ956IJ1zseQz6FqUl
 QIicedAuAQoQYrzYWzSiAKT+9lsEXpgXgL83ZaRA0nUNjh0lGhjcoGZSPW/f8RsBPRUjauYax5+
 y75UX6K9KFdwUf5drWBuyQD8QonWrFn9/ML0oHiA1LPPZJj5ox0PbY0K9JDvP6LdhpXz3yz4BCD
 ZtR973WomDxti5Lhy6aDvMMQ+4u5zhFp/WKaoAtlX7qW3QtC0fC+1q4rQZnTaaimdsszpDRUGgh
 xga3LvZy+CFNZ7qcA0fLHDSE2HWfVTe0go0wND8smA3RmbuA2oXaWWD4YkcFzrA2iRpYp+0uEjk
 V1NqLhnSidlykS5b60A==
X-Proofpoint-ORIG-GUID: oBbS3EqPn_Bvdnc6tzqAwu6aCORT3f_O
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69dddfbf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oTq01oph0ifE-MoszjAA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: oBbS3EqPn_Bvdnc6tzqAwu6aCORT3f_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140059
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103050-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B24F3F6151
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

If this is a fix, should be the first patch in the series., so that it
can be applied independently.

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
-Mukesh Ojha

