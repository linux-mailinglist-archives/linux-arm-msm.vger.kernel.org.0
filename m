Return-Path: <linux-arm-msm+bounces-58737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995DABDF63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453A81BA350F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397F6252293;
	Tue, 20 May 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDUitAJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030C18BBAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755881; cv=none; b=SPmEGi+VY+sF95E20mrVFb7DLkU9UfeoBjS9839iy3Ha/2n2RYfVyAy4nLm5Q1aT4/2lBU5toCYYwQz2ZBlYHWyuqefA2o5D2oy6pjh8CTxkIhTZ8AuafrvykNhsmSM/49vmrq9e0OxG3Qagn0KQhh3lN/u6IQeObvMTbAoNYq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755881; c=relaxed/simple;
	bh=vHPtQTp95qgHiVjk0rfgT4rumfQnjKWibWtqb4WPsqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/ICGF1b8x6pP8oF5qNb9qUCk/OvK9EyokpsKOblr71jwpbblrh6114SMf5OR/5lZ5NZdwlFen8IoM2O0iOeKCMCLtTZuo6trHQg+Wzr/T58IqkFfMqG/X+BpyJu40OUkzxTQloR52lHuS9G6fgnCqjcF3gvS7cjFhMbgOHNLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDUitAJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrDwW024473
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSAgwbIDWc01IeRoKRHNp/WQ
	jOOH+8S+Tdt/kRAF/+U=; b=dDUitAJDaU/aF0f3WyenDEDOHDcJoqmo3QtouF7W
	ITxRFH3aVq7oy1IEqbHkWEYQu3SvK7wKmgnY6sF/Fh3XwySUHp8pRjbPMMzLulB0
	kF5TPBQcFAniHLe7AId1JPitZWC36jqD6ZOoYBfwc0/HyhZqGOWR0V3+GCnzOM1Q
	ShuTLOA8aGwc54ypNWRcHBH58EGLzB8KkuOqTo8wJM05U7Zb4jAqwP7iV7kcwQVj
	Mkb1xCaD4TsDgDNWn68Z/cts62LZuS/AL11/X6oPaBdXfZxa9CsuvVeRQh+w2TEW
	ltgP58JVAb9eSMevVQaJ89J/PLkTumzNVUIt4X5FsOuwvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4r3de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:44:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so670139385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755877; x=1748360677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSAgwbIDWc01IeRoKRHNp/WQjOOH+8S+Tdt/kRAF/+U=;
        b=A6WzAFEpTvu0Fn/Trq9Tmzytz+BM4O8Ubb4ORXVEnk8q5eRvhJ++Gim6pQvlcOyijE
         S+ppFtDKbjAuIz/V/hZzDxNq8py7UTlUKIlIaoBg60hSY/fOI0h9eIU7r1dkg6JnoPQR
         SsirvUBeY7EPKYnnBWPwLyXalJtvoQAaN288Y28F8nsbK/HA2zIcPVWyw891qkifJhcR
         Manu/b41/ofEMYu1clJkfF3pLSN1X9aoDODjTNQHx4YIzuXomrP6+JsxHX7wrq9Zd3km
         2pUzyCyOWnZ2AEyzcO4c+qtW+fzmQEamBDVpawTDLitf90j3toHYvBt5SV7xVGCvjkRD
         zESw==
X-Forwarded-Encrypted: i=1; AJvYcCUK2LW5QsCNHpviJfbNcqTXRY5Dq7Ilejx9JFnHlrfQahisHHaKt+huTljNflRi83v61ZqZMvP77dPq02Ko@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlVQOAx4jzZfhxjwycCtqfd0YanCbgcN1KTOM0ebHqTQArI07
	e+Ny2uF6pBPCMPgH8zl/DplwgVXdh9GvmGRNO3JYvLViTFxqbXkUp9h2oS/l8uvUFmoTLp+1VNW
	bazbqfcdm9LdwcCfBp72jNpKp9FCM++CtWcIV7ixEz82MhLSfgyYyRffPC20Gjr4UmWpk
X-Gm-Gg: ASbGncsjQD1o5QxzM4jL3Mw+GQhKE2qESIZTyIbTsPDkPb8b5W78Lf30hFUHWqmktrF
	l5/JBsUvt2k8QeQzdOwU3YDysZDaxMvdva94EEiz6sLmxDv5OhpfpkzBDHt/ISQA9h9V+EbZEUP
	sZG9gUTHv1E8tAN4wXcM6c3O6ALY0YFI0imYEnqdPWf/yoUe6V+l1TAo5daq1KSA0jp2Z6XC7ze
	YrlzepjhwOz4C+xorBdxYjmLD2Kqrg9oXQuifWpEVhcWh3Ujka4pDTqVbx9hnXwRo86c+sCdrQO
	p3IW3DJgTnQKhEHJjyYtOOHZzkAx9UPzR1+Sr2owQpCR1d1f1SpZyKZAi8iaS256v6byJSBtLqY
	=
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr209650736d6.12.1747755877441;
        Tue, 20 May 2025 08:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm9hVZxx6jSsGoAw0nQEashx/KJKae4VdE14/j2OPoOQ0PtJya6PHIlpK4xtUsXtkz6QIb3g==
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr209650276d6.12.1747755876852;
        Tue, 20 May 2025 08:44:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f39sm2401148e87.151.2025.05.20.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:44:34 -0700 (PDT)
Date: Tue, 20 May 2025 18:44:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taeyoung Kwon <xoduddk12345@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taeyoung Kwon <Taeyoung.Kwon@telit.com>
Subject: Re: [PATCH] power: reset: qcom-pon: Rename variables to use generic
 naming
Message-ID: <xyhqu7bw3kqlkl5q3q3hexceq2irm4vru6lfspsnpmxkhp6vuc@jpqtvyke5aec>
References: <20250520143612.109567-1-Taeyoung.Kwon@telit.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520143612.109567-1-Taeyoung.Kwon@telit.com>
X-Proofpoint-ORIG-GUID: vFTdic6x_lFDDxTPjbk0cl_gFX5ShjF6
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682ca366 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8xVn4GeRAAAA:8 a=38eAcjmzj4vKwzUmQakA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=By6hKCY_mHIbKsINY6vW:22
X-Proofpoint-GUID: vFTdic6x_lFDDxTPjbk0cl_gFX5ShjF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyOSBTYWx0ZWRfX4+Ft/zv47chn
 1J+6RlKdCE/xBWe5fYeR1iV7Nd5ChTy5e1FVVPMzSkTz4lP90WTJ3wxNyW0fvYeIa64GIAJvfXH
 BYIQI8m86pCpWYyJHXqG+UmZMsS49HU3PzthN2nNqNMbDzXYnLGMJk1271pYnirvHZRG6pbQQWm
 3o4pVIynMl6qVz70sCXbEeQF8ztJ6xXCeqXFJIDC6ifoCfHe7qBK6eQoeHHB5CZgewXbrzR/c1p
 MH4GnBPQ5weoiiKzw7GFfOhRt4fM99lOby+jDXgDG9w3YuJKSZTplPX+cygey/BqiR1DSJ1Ir1g
 6+4r+WVw4lyYjz6MLk+UGNIXLsVHzSz8mi1yfi9ahOBFMpQhBFMRq6/a8zPuOcCD2iawcXyhAy6
 yinFei7F8hh/7BhHSYF63duGME3JI0OnKZa+FABd+Vo/8RbrWUY9yN4XLGGcNPq4EWq5864k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=882 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200129

On Tue, May 20, 2025 at 02:35:50PM +0000, Taeyoung Kwon wrote:
> As my company email adds a signature automatically,
> I am sending this from my personal Gmail account
> 
> ---
> The qcom-pon driver was originally implemented for the PM8916 PMIC, and
> as a result, several internal variable names still refer to 'pm8916'.
> However, the driver has since been extended to support other PMICs as
> well.
> 
> This patch renames those variables to use more generic and consistent
> names, improving clarity and reducing confusion for non-PM8916 devices.
> 
> Signed-off-by: Taeyoung Kwon <Taeyoung.Kwon@telit.com>

Now your SoB doesn't match your From address. Please move your
explanation under the '---' line and instead add the 'From: Your Name
<company@address>' as the first line.

The patch LGTM.

> ---
>  drivers/power/reset/qcom-pon.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry

