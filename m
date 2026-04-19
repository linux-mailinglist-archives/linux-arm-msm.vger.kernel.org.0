Return-Path: <linux-arm-msm+bounces-103612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z2dqLG0b5GmyRAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:01:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B2422A2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 742293020EFB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 00:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DAB5474F;
	Sun, 19 Apr 2026 00:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFZrdwcX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bci5Ibht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64658BA34
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776556906; cv=none; b=sn7WdimwgOS0wVa4QFWF6JLWHUz6CY9QHoxOkoie+/wR6VrCwOeD7fvDcAacVyt0rq750lIPmm4elep7QfKGqrNsowFaB8FVYLakCvzGI0T1ecC5rUkF+scKdWfrLr7hXKl+LgFYfBNDAMD7DAfqaFWJWMWg+IsL+ltNGYD2jCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776556906; c=relaxed/simple;
	bh=bd9nAh1LVLMgf8sxP2vqn9Xv3LkCXNv1GvG6Xjm+rAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNgxACWBPMS58DcjwEHhlbTLVoekoatoHSbICK2qKsXjg9tZdRPB9T3IDACXPHWlFRZ1Rpu/mxy2VRu8edy6YrQwYjvWXEL21jERRWktC8KkstZRU0N0mCLuafbzUgsQQlpot5cFiDKI/Qt4YfZhPnrMk0IXaZqc8EHKpTd+ufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFZrdwcX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bci5Ibht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IMnT2T2240649
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NGTY1m/UuK0r49iNgHil8gNm
	NodCJUIGzhx2ySfqMWo=; b=XFZrdwcXcYEA70htF952MfYs4uPbfV/MwzzTiyoZ
	65qzLnnF0pL6JIS2NjcxpC+WTADhugkUgO12KTL6i0Px6GvB9RZmfkIkI+b/lHZ+
	tUmTH3PbCeQ2qvnFQqi9CEAV2YYyKiYOPk6XyQgGN+bKVE278k9neWPnDyacnpvX
	7fccv/nah4V8fYsBrswEZK6gqHhGkdC+62EmoFLMb4IoSlB1fz9ewYtmm6ccD3Da
	7tCZhxTuaXN9RVMUQOP8ABWu5TYLYLiGUFb2nyCIiPAJX2YU0eEcB0wgPvuLLtfH
	XDY4yij20jJvvrjmI/3M3aCpuhYM2B0JWNgcVE9ynUQU4w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx1pf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:01:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956a188d7baso2912984241.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776556902; x=1777161702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGTY1m/UuK0r49iNgHil8gNmNodCJUIGzhx2ySfqMWo=;
        b=Bci5IbhtA6d7blNId+butykB2/xMlRUACeXNFfjjuONqxp0yJhp3mC7ZXrEtRqj3kV
         u+HmXgoznGIwriPrjaQRU2pRHzKI4cY6SJoRkwyGf0Csr+F6JGgqGbk8eChebf3mL0As
         UcLcfmu6nd8hCmV0Ap6QH+tWlGAc58agKH2Cjjypfz+Xq8bNt9qjCfcCqP0lWGnF/nbj
         iiZyLkkdI+JgQNpmxeAYCdZuzm07Xr8IERuCtoSqB2hkfTO41AYFWKggoKl2133xyLE3
         7e85Bx5hfwSnSKamhlckJMs37NHvDclWtjOysOHoXS8VixOWn2VzvHdCvBohThss9cYE
         7msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776556902; x=1777161702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGTY1m/UuK0r49iNgHil8gNmNodCJUIGzhx2ySfqMWo=;
        b=I1/EdkNjor3/QN8vxQ97JxZB7+cjYquAkRHf7jIxwUThY1aMK+Qn/IgSEeOZLue8Ot
         CCXvFrv7B7UTbCEblFGUXxrIBcgKOm8w7vsxJf58lT+Ve+UGmLYGNDUolceIZrER0UEC
         Nxc0GDhSansEcT/D1FRG7a8xOXHZNClX1nOI0wSFUgDPBIRecnimk9YSQFMZIMryd/AK
         E1IZoJcn1NoFMR7Xgsnl5M149b6PzNr2q+PTejFQVAMEDPBF+PqACoWSoXWXrU6+8mhO
         d3j/4gdEGy5Gfy6+WbUJalhxSlQ4gnwA7vV+AKcY6DMz0GhY6NYRYmZJ8Bq35KW56EV9
         ID7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+eNGjF/MrXN7bnQSFh7EnaCkKiQATb5w2i3H9DzmN2Ny0v5e8QvqsGrKybBijY6LS0EBCHEVEF7zi0GaJ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3oulEnk6eu/PCqnRHBfbg2aqt/ehAQ3AK+wNSxv/WB80F1aH
	Lqq7fKkBkvbKQSJ4iA/AoRUwSpAE2UWrDTnUvScnqf41iyaNbq0akdd3qNgNc6VuM82pP3qlPIS
	FpUYtN7/tsovr/Ds6tKhZFeya5h1d+/glwwR0pVt1AS6s5yGdsn81ugzyGIhAem+v7TM3
X-Gm-Gg: AeBDieucxXmt+Lat6L2xfjSc/hvAd3QBqPjUkCkOty8sRZmrQmtuFeznxJ5QyXIYQjv
	jk31Ka2XWUtaPJRipAVbBYGoQDXtFgrJgqvzqMX/ip1IppL5S1uzH88HCD/7cNjWF023g8hYyMx
	4//SJfj9f9wgeLZxyhgJLqypgtJPY+L8Yx3/xMvhtpBaPktdBJcBORTuovwD4fC9Itecw8odmVm
	JSrm4M0LvnX+u0sIxkvpD3bIMegdkRdgzCKFOY6E7M8HUzngFDIN/fgvs5QYpVZYqGXJOJy1utm
	Ua2a1mCzqD8FdJqWrqmBmMl/C/yApsNWW2Oqrts/QJrL5Kcifnf8wc4heTInGWDVDRv3OuCiLic
	VYn7GsZCVFhtdSzD8SwYlGJQ12mAmbJdwy6FfFugPM/gqbnKs/TRpBH6uw10IlVCF33aPceByAx
	l1mfu4v5VlbqTE42P7pM1majM+OzMU1bPZSFFL+OoH0Ofr8A==
X-Received: by 2002:a05:6102:50a1:b0:600:d0f:bacf with SMTP id ada2fe7eead31-616fd91cad2mr2595860137.11.1776556902163;
        Sat, 18 Apr 2026 17:01:42 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:600:d0f:bacf with SMTP id ada2fe7eead31-616fd91cad2mr2595848137.11.1776556901775;
        Sat, 18 Apr 2026 17:01:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a57sm1703108e87.57.2026.04.18.17.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:01:39 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode
 handling
Message-ID: <5fjadji76scwzolayu7tjcc3pbxrbtmmpg2226cgog6cne3xmw@2ohpkff4gbvi>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-2-34079f92691c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-read-rpmh-v3-v3-2-34079f92691c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GofYydVJ2JvZkHIQlZkNSR0zPwbuEfHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDI0MiBTYWx0ZWRfX0S7jEGCWU30G
 ROElw5maRCFkVWIeekFZ9aPr1d80mOYT3ihl43+CpbgSpIeh0AFxvkkeW6yTao1xPqa4I8KhleN
 FQ8tTPGsOoi8l67t1KldA2y+sMA5UwoHM8S8i5oumc9cfogrj5LilBcTsAwl+VV87qsBB4iSrJK
 z9j+/49d4yoeDA3lo5/h5AVbGHQKJ/lgYg/hglu1pF/HHejIJ30vd1XIikjbNuADvSbMhXoRGYT
 zOjdXVNaDXjU3lmGpzhgye6v9Px8agQUoPYcdD2YbolaMozpFkp9fOe7QRpbDNksKwBt4oP9mch
 OGje6jijwhSs4FYrwKNYsfY7GmWvmLKWpLfHQBHXKlgWaODTtHY5zaLTkEhBscx0aVtqH3fQxu8
 wu3aiQH2uYXk3VRx9xITCbDer1gaKiGRtre/0aR+VlMzRTgNIdx8fCwyq4a9XgHm65poS47b1vq
 BT5efuoJz5/JZPGSV9A==
X-Proofpoint-GUID: GofYydVJ2JvZkHIQlZkNSR0zPwbuEfHh
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e41b66 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mDdbpi1ssUmabk3ks94A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180242
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-103612-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 195B2422A2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 10:13:30AM +0530, Kamal Wadhwa wrote:
> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> value for even if its a PMIC5 BOB.
> 
> To fix this, introduce new hw_data parameter`pmic_bypass_mode`
> to store bypass mode value. Use it to send correct PMIC bypass
> mode value that corresponds to PMIC4/5 BOB regulators from the
> helper function.
> 
> Fixes: 610f29e5cc0e8d58 ("regulator: qcom-rpmh: Update PMIC modes for PMIC5")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

