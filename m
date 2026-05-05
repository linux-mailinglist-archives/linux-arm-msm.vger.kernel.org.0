Return-Path: <linux-arm-msm+bounces-105959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMKMGKDm+Wl1FAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:46:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F184CDD99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89DE13040F81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34192BEC27;
	Tue,  5 May 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHGmGxZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbJj+5dD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95594248F57
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985146; cv=none; b=UJYaLqtEQJXWWbNd0Wmc7WQtKVQeolp2sqH2FB8id3rG0fRMqR1YgWEU1XTEKVA7LMuc0ujZuBUmk937NAv30d0uARtNxwZnnTDvPg/xUvcf63mfoDNmlqhMJ+qdEFnYG2X4XQMfK0za7mGIKYySzO3ZpGFXcw9d0bVKqwhtVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985146; c=relaxed/simple;
	bh=CEyLqAyk/8XZ4kbIg6O5FriVbkWoKwTJ2mt4+nOD4pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dapsx7PsNn1nSsBWtgrE+3IhPDatgKy3WNx3/X34mJlYAG/UU/13Uzu6AkUhvq8//qvdhXo5XgeYPYjsb5P6yBQxNgJX5AANrygCoYqtSZGdusaIepZWzDBG/TnULWIxT1F9wZB9AAfPXFHVh09vFHiX6lOZzkh7HW4mDtNgurk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHGmGxZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbJj+5dD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456tiaC366547
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rRe7fzW8DQ71/cGj/cijBCqJ
	qRhiTXRVLYdroRmMEqo=; b=dHGmGxZmiOshcuXXPHq5EUSBNAeM+v6KpaiPZIA+
	9Kx72YGRypaD8rrPSnQfUoNeEyGtQjzcMIcV7SIQjrwV5iaBatPyXrhSlVwtqiDK
	s88Vyft9gpSjY8ebwOcIguBI/viXmvZzaI3x1SGPIiiX71tc9SMHfaHoHVOpc0NH
	LqyYUQBzALGLkUDqGA7FMdiB+AdtLNXJWJdo34rPGBfNKunM+DF278Mb1+L6cvqc
	Ape7FtV9UBRgIIAs8Cu8DK9MwkJf3Ayy9K2oZhRq5tR8OD0Eo24QLN4+dEM+qNUC
	RdAWWIEscliqR7Th2422aWCw/fHO4l8SJZCZt3/8dkPZng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6vfk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:45:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f817c3240so69539521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777985144; x=1778589944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRe7fzW8DQ71/cGj/cijBCqJqRhiTXRVLYdroRmMEqo=;
        b=PbJj+5dDbpbpC4NhElBZkEbUBXxg5XwOu2K9yUCdC/TzXNvNi3HbVyQsweUeBWFp/m
         8/w59R6ZINh9qPGiQJejyXj9X+aSLX7/8Tb4gMk5fmjNDPa6+PWOcu/DlG80YwV2sO1z
         11MM1JmrEHL6otEKifu8L/M84hHZr1l9rJxUEKqvlTA/NYkOP+QcIEXXjbQV6PyTNU+7
         +p9zQBIUAlBjbeIrp2HIC2gE+uBLW3bqZ+Db/q00eyNEPqRkHmHyCL2skpX5geRylxTE
         QKSVknn9WpkSdBWGj2A7Gek3qLyD41Y3J4W80IGvfKqAY8G/alGke99zmI61czT80b+O
         AnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985144; x=1778589944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRe7fzW8DQ71/cGj/cijBCqJqRhiTXRVLYdroRmMEqo=;
        b=j2z3oDQDr7Y4uV91CCyi/EZnYgDOkETWopyY5aRQWtKhSuhXBvzuPiLBFKJb2VFP11
         Ckjprfi9zRU2akWjSAFBEgqP/U8heoQiWqbuMGMlUo7Hncx8u7nT4lr04nGoXpYHLy0C
         bXMXm+ktvum+XU1UOf3klts0BhyVBK4tTtf4bTcQ0pThIqSbxRNihkLQPHOLcTRPyVpJ
         hxdJPopCA+Fcl0R/3I4+z7FSMloGLF9+EAd6tWGYf3uL79E/MyHSYN1mJokIg7EMcH5X
         4e9dhfQAwuFCTHy9gOZGEcXMsdkfltlX3b9rXc2NgF+iQgvuCkowMFiWI2b8i1m+9caA
         30VA==
X-Forwarded-Encrypted: i=1; AFNElJ+/0KhbTAG7xG3Q0GQc3gu6fUGhDhvZZGrVNTyA9aL7gbWXDx6rcsulx/yeIxDrIu+Aaelhh6gpmnycyeQO@vger.kernel.org
X-Gm-Message-State: AOJu0YwodlFsbIGgwJrOeYappaJkb8nD1KP6Mhdf92uYQ9d7PE6GO2Yb
	l4pTgNqCmNQy36wXMsBxRnNww0g7VH+AUJ2yao034RwR7Lu2+AUH64MLc5MJKjHdyOeVwfYuydd
	y0/6kIjpnXl5f+RLSZi9lSh7C6jSAnZoxsHQ7mBxtIUL3ZSXv+8If2L9NmC1zMutdPR6o
X-Gm-Gg: AeBDievDNLYTX3cPtCrK5lp2KgykqJOuCQ9Nn7EhZrYwIw9CKAk1bB/Atu1VeNjhI1W
	28gi1Cyl2E97SCxQhq/daC61wKWEbX0bYcLsPM3rturVsKKnrVMU5KFqXd+uEw6x+oVjTifamg4
	LTAyu03aWFVh6zbyjr+M/ZSyLVQtTMS48r4O4B8cHnBSaHEEaH7QzCHLiI+NyxYvPWgctT7RVFT
	iBjgKesVTqojJMyxwZApHAqeKcFdO9tEGjyrCVjyWF5UhLN+nvIIQRsXt7pt9vJp7kPjeW2Hkz7
	fzO971YEbM8z+FGmrX8iV4BT42L5+mJPLAmuiTJXx1x6oTxBmmd+HB4GHxQAEqaCUZe2UI/GK3t
	Lz6xtUvZBZnDNaO+3emd982npI11lnkfchGCbNlZ58jL2OyL4TWQ/64q9Vfz5MzYV9w33/O9oaX
	Jrc9GGKFMZHSYlIP6zewju4rUChRcL30p82dx84fztE9emOA==
X-Received: by 2002:ac8:5796:0:b0:50d:97e8:939b with SMTP id d75a77b69052e-5104bf98b3fmr196770841cf.36.1777985142948;
        Tue, 05 May 2026 05:45:42 -0700 (PDT)
X-Received: by 2002:ac8:5796:0:b0:50d:97e8:939b with SMTP id d75a77b69052e-5104bf98b3fmr196768301cf.36.1777985140468;
        Tue, 05 May 2026 05:45:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm3867561e87.29.2026.05.05.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:45:39 -0700 (PDT)
Date: Tue, 5 May 2026 15:45:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Message-ID: <hsisxgvzte5h3zuobmrjdx4uasan4urj5xbes2flxdq5cakygx@ok3rhermb2hw>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
 <20260331-rimob-new-features-v5-5-5fcf42a29c12@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-rimob-new-features-v5-5-5fcf42a29c12@protonmail.com>
X-Proofpoint-ORIG-GUID: -2LCxjzgFcVzEBHKHKA0LA3sF-w1InT8
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9e678 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=FcDylz7_6oNKbyFHn_0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: -2LCxjzgFcVzEBHKHKA0LA3sF-w1InT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyMSBTYWx0ZWRfXwfBAjQcR7fEz
 Ixmf+vV83imwt9MGgG1MxDakqLx4QMlRdCDEDVcNSB0my/gTR+fHu8pEZ3rGDPlnbBX/zEIklm1
 0pcaJ83ddVu3UUsoox7JsGet396cWL4zJ68tsDA6RyyTb5iW00Tm4m10A/qBDJ63ixZEo8seua6
 WZMFWjAK9zqecRSqwfiF+JZF7z6xqqUnlAOHH6U1WxIAgJTmFvGkBKtAgfVkRxxh4SBv23U5zgE
 7xe1F3FmZGBPcF39FirOhshnWf7cNLZCMukSvaXJyiil3e/qwHYK3pbSo0d4TOogfHhyVwvHjqt
 CjHHWWaQgfl3Xgt/KG/hlWUvafjVEb/gXJSB2Echa04To96Ix6wWEte5qgCimGGuROUBUhxekR0
 i7CxrR5HE7yJJIuZ3mY+1GR0XgbBhSwa+dtZMyQ+tUxAAx0KAQTOerW3aU01KDBCJp/81I5Go3M
 0jqVp1e1SCn1c2bzsNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050121
X-Rspamd-Queue-Id: 05F184CDD99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105959-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Mar 31, 2026 at 11:47:13AM +0200, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> Add it to the device tree.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

