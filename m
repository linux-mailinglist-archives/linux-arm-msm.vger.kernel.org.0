Return-Path: <linux-arm-msm+bounces-107255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBq4KGpXBGqjHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:50:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D61531A35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B893034DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E893F2109;
	Wed, 13 May 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSGhW6iE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj14LACu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5DA38F65C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669404; cv=none; b=f8VStpp2H6R5ZcBEBYQPHRmBlf0RE3JHlMTGRG2tCvmrB9YzFHua5rKS8Q/7zHsSFc40cd4gxQV/d02iMeN6OsgvViA5a4TZnQj1jjaJdBUh+Qov366WyxldWpEPj4SQ8U23Sm29uz+GYbCWL1CI/+IHFJNNo1GZwQulnnrd3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669404; c=relaxed/simple;
	bh=ymkXFwxWeVoAvJD5TRg7vNGUmjB+3vDW3rHIV9EqBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzoPiJ0d2WaQyG9zJD09U/17bhO/iVcW2s1qIaIxqPQuWQon+/UMzRfBaGp97LrGaa3g5/t0lZdYZzFzahaZvgKxs4zf7fbN42OQqg/3QHtpxwonM6fyIxGZo5yOQMTDBxBIrqmA3F9UZS3G5dcI382S6K7ROCmbqwLStAjgQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSGhW6iE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj14LACu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgIo3007378
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YZ4B8Nyvk2agWZPoGiLkxwg0
	6cZjsgMkxTD3jPL+MYs=; b=TSGhW6iEJ8DKpUrKdVIYITZEboywVdB/nksd2FEO
	rLc05p6pkhBadeTV7Z73iRYFw95NwWOkD5SVPlCr9RDDPwpg79F4Iuy/KxLqcQ+k
	QesCKiAWwAf4nBdOPpguZo0LaVA5nTLrx1VTkUETUpDGrobPIhJfLmxZ49VRa8v2
	VNKfgHJNy53BuGZSikBMQoDirzTEtlGqp3DDBfUMNWvA+RmO+yq/uNzt08J443+S
	3CsyI46gczC4sXfOH8rzpbDaVRFkDJYZ5qaAMvA0Z+R9Bn/axly34T0y1kq6QKBl
	ry8RtieETj5agZk0jjMIux5D1mmNcAPhktYzeJ4dCiSGYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0g7r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:50:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so110436471cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669400; x=1779274200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZ4B8Nyvk2agWZPoGiLkxwg06cZjsgMkxTD3jPL+MYs=;
        b=dj14LACumWtYvGRDA3w3HGR8RtI6ZObiPESew4ukENY9lTWXf9hIEg71U9IBEzPX3c
         pGe0TU2z4OBFLGS1ysvUPBkGi5CcORVfQ97KCsVuzPOrVjS0cmHpWHx/I39XgrtYdK4k
         PI29aDe1r1NeiKsu2oYHEdeu/1yQ8Q9rSiC3xYt9HCO0zXxZfmuQMkECyr8231tHOgj4
         f3FttR83UOcYtGzby8y6MviarZca1Om/43g58WNx0LN+5UxOwxnqzOHBxRxJFrik9zmZ
         18oKXK6Fb2p6yQrQdfTLDVojYRVQaatngi0IjS7Bg7xUXAVD03HiAdG5PCxrpklrmxXV
         5eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669400; x=1779274200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ4B8Nyvk2agWZPoGiLkxwg06cZjsgMkxTD3jPL+MYs=;
        b=WoZczQXq/HBYAOQp9Ooe9aMvfuKwuu1EU+gH+i+I7UuWnMDEJPvU/eGaYGU+R/DWib
         68n92IdNEA7X/0w0Hbj4npeGt4ZCvhHmjxM7n2JVRt2MiyKCs1k0H0idHOpcFBvw/Kbg
         3SBObaGpAlFNIQRLjEwReUavl0UUZbMT/gxQe2IMlQ60CXcaMhC61NOoglVJfgtnLIBw
         TwLu7Hg+q1aFT1F0PMFnpGz+imdlZsBUyjEHvE0WXGGab021L3xjrb+nRGVXza0PBUoZ
         igs2EfTv6DqTE9HRKszFeAttfDY+jFFI6w5fv4wXBlBjegWrivx51zpjVpeUo9aJOCRm
         togQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qFgCo3hkV3a3gGye7od2JMvqzdaLLfcJWnw+obFOZdrNoK1MV19IZrSWWhFsNos65EA+pytALLxzHa6En@vger.kernel.org
X-Gm-Message-State: AOJu0Ywom8BtCOXmChHnnBJM8A6ec8KHLENpJVUa/pP1kTckoy9iNC4m
	fUs+HuyWl1T6nsyuVKfBTSuH8E+Vw7FYvEbM4J4OGOhHAZKADUTUwcicQG7GS/95iBOiaiC5ya8
	OYJ00cqSRYiPoYiw/iUcC9N9RcMUX+sln0Ut804xVDSvPKkrdVtG7tJp7JfHCtG8AeW9e
X-Gm-Gg: Acq92OHXXcGOdHoz/EV7tzh8MYdrkutuyhptsD4atUYMx17Hjf55V3eJEMSL4/QNyqT
	tgNqmZKAGoEgWUO2hYducmgapO7VNKs1tIUxuoPGA+YQ4zIcxw0StLPtoRXsHsQT+z9XEhDeu8s
	KeyrscV0MIGFV6qACmrltm/bE59emI06QoSR7hh+znKmfb/4e7dOlKY0oJ/ImU9hXRht+y/nXUO
	WC+IiZjKTpCAgsllLxgljQfz3JiOubMc62+bOdWGhRtqEh9SPuacDUy8FO0BE/zvgJokUBExT8F
	s47Mbj0zJfK9lRpfeqDoui58MPprBTqKkv29uz77hApIQn8qP417FR1Ryl+tMmGldxZloUXnCmI
	5j0sXsUC9pwyy47rkz6iXMQTTVR4ZjvvVBknzEL09dSH6qRiFFFMkN31/FZuceTJXeZFP5WDS1h
	hGZyVS0v7o13wKVb4MyYKj3VDKP1dPIrf4EUc=
X-Received: by 2002:a05:622a:1f8f:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-5162f422543mr35030661cf.2.1778669400304;
        Wed, 13 May 2026 03:50:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-5162f422543mr35030301cf.2.1778669399875;
        Wed, 13 May 2026 03:49:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5d5d5f9sm39939781fa.0.2026.05.13.03.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:49:58 -0700 (PDT)
Date: Wed, 13 May 2026 13:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Message-ID: <glr5fyee7q2gx2swg7pgk4plbjxuj6kg63kea4vdjo5qxlrlki@h7kzzbvoabgg>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-1-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-1-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMyBTYWx0ZWRfXwoiQmrJwSEFD
 pNQqjy3TMoohx0NVfM0I0QZ87wTAGYCFHxvh6lZFS6s9IsdyECRwmKZZ3HrWUiTnIvmwDQ5UcN+
 n+00kUUCzXUHjyeRKNC1LndZTN49mHVVQQbg/3V54w7qsB0onFwhVown/fmwm3/WKDs16ckJSA5
 lnjEQrdlUtI9K3dRkCiyFv4prIRC8B4XxVK8GylnOI7Mm7/qu7py/6Q4hcYPa7JHGl/tJ8bYoyy
 3qYed7Qrd5BPF+a/Ncq+PRUNIGQIQokVuSJDnjUF5DOP1JDu12NxwhisNA0Mw53Bl8JY6X3+py6
 gLhZNG5gOaIeTgTcs2JFKtXRxCOg6AzhRHDhu8+adBgZ9TsXlrA57u2s5xgdB47qgSfvscQ4Bmr
 UWU8/eWz846IUlJSMyZX+PfuZXGQjiIWxFyygz+3DSmNACBTm+glVvHOCo7N+YDp2FvNINCgzkC
 osDnVz07fN1NgfnNfDw==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a045758 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=8SZKpzWjcR6UzJCnZioA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nA9grdLkMXi9CAkBy60bOkEFAnosxekO
X-Proofpoint-GUID: nA9grdLkMXi9CAkBy60bOkEFAnosxekO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130113
X-Rspamd-Queue-Id: 00D61531A35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107255-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:10PM +0800, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 19 +++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  2 +-
>  6 files changed, 81 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

