Return-Path: <linux-arm-msm+bounces-105789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOztJwbp+Gmt2wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:44:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C64C2B79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 20:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B73830038EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 18:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6533E51D7;
	Mon,  4 May 2026 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/DeQ5BI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAMqMe6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3FF3DFC74
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920259; cv=none; b=Loc5OnQGRul5ZpfUOJmRcmWV3ZZWYLMaheRw4zz4Cs+HJwWvvJxSabAi3v3odZnqG2SxtX0dhC7+i5yER5seCKR5sqbubM11u4MtyB6r4paYfn+CxHW84fPs0rb9CVI64rqw1Y9yFvSzcbRVbzJMMf0uM6JeGAuCLJUUlz0EAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920259; c=relaxed/simple;
	bh=WD4j2H6bjtGAkyS0SVJAyteT6SmMdBs8nq9xxpMfJ7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTrq/P58PvlFvlKYdccsydv84Da/UQgdibktquiQiruA5a/pTvo323P4teYghPjNhAel0kBB2SDtPA25pROqRq6/ZFBiMOzjLv/iDC90TAqcdJs3auBmuCCDBID++pmprPoYgg4TciJNTzeqvCYKCOq8Uzg6vEnwfvO4M7dbn1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/DeQ5BI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAMqMe6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Dlgbc299461
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 18:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ODJgdbaATypYTwgXsHa+P3wZ
	xEFcEM51s1kFGKOx+lQ=; b=F/DeQ5BImE89iAmE2mNHtpS0OVfObuTgXNNGmbk+
	7hWMknWEdQ2C0RSzlrFijJjH/Btco+AYHVlUvOC7E8mTadbqyPjcXjwx1wzccN/k
	2s24wfRi9DxB7/pzmBH4zns2pZtyHDcoSWsd2NgpM9FLGQVgCRt3DaqtsaKoJnJG
	rmO91m0Dpqpz46yuK+JHGHkCXusQHUptiVw9K3UUrj3qtLYumiukBc4+mfUeQ7fj
	UmPT8F6cv0MoWBIZvyxS/7zst+vsCAjVH4R/digvuFHDRoMWC2z+XtZP7nW7bJA+
	uvOfNo/Ch3ANjoYn7im5i1OF9Ilrx8TcRwDw9++L28xkLw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvnd96sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 18:44:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-610169771d7so6363504137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777920256; x=1778525056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODJgdbaATypYTwgXsHa+P3wZxEFcEM51s1kFGKOx+lQ=;
        b=UAMqMe6NPQWcCz2yiNvQPYhyOqEEOvrxKBSWjRsUiA8t8z56LZJpCa64E5obEUy5x4
         VOxlaRfFHNP4Tnq4qw+XhNuIfeUd36KZTz8eKuqCq2NKpwQPwKD9n/oNXGaP7XZ6J61s
         f3bmqNhtPknc0cMCJxZRqEHIAWJkktoVdmEAk2cDYGyh+I4vnSSQivj7LYsCHFxrDwAq
         +dYu0DtJ/W5zylAfE3ScG0JzTQ8iD46Yr7Hh562kHBLS/mNo3md7CCCBvaSMOwTAqKcD
         pwnxyqtCV5WRaS+ZGi/d1642WJkj5x43V1FxpB8KiM1fo77TyeHLrx6WeC9SFBNMIk3i
         tVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777920256; x=1778525056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODJgdbaATypYTwgXsHa+P3wZxEFcEM51s1kFGKOx+lQ=;
        b=CQhSCRF6ZB9Whd9173KcEwCntxEycQYQCebfVY/o/haAFYa4PhATVjGKY0BSLBGfpO
         YwGDClmGtQznUigEK9KZyFOg9mRN6Fr3H8JusGuNV+SwVDmA7B/xpkxm3jt/eQv0hyuK
         T8D56z4gwNtjbqbJo80KkaOl/D5dkzG17x9f2uHCGBDbLtsnCdx24s+C+L/rG4mja3ww
         pS9XHA95C6yi1d0c9NnYmXZ32NupuRGEyqZZIfjixhLUCQCJ8QK6L5Y4yhFzxczGw0ft
         rB4h0h3tluDqL+UTcTAWdq1i8jW5yeK0R80HyND4KGqhffKBSD4XrJBvuS9ETPRNXxKw
         iccw==
X-Forwarded-Encrypted: i=1; AFNElJ+X0HDe2spbiOUq1H8HBjMnbOgtbpVuYvxNNVFuX/RlqGpTuPcC+VX/Ur2DESJU99Oz2JRkK3Q0zBXItAhX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx64gGnhqJ+4fyS3o7IE9IsZEHAY5c1+kc/cYUttxg2GdHyBeS
	1TB+QDOqc2bHpsEB1NmOYu4V2gAUxFYn5Gtq3q+aOWGjXfFYDfkDBw600pnOzlW9gtUVA6Vysnr
	ZVkQ1yreN8DpB2UtOjQSSFNx8YK4dfC7YT9d5JsUNeQm8EGTYLDnAoCa4/aCXdZLYZJs6
X-Gm-Gg: AeBDiev9UmfPUB7zkO9LafQ0yX/kVvD4GxgfEUU5kxiBap1IsNB0BByy6795kOrl8qo
	LhiD0y8mxmqUZw+Tprt+O0RJGOQSoBSq+HejaeQs6Fh778f7EsGwoMbXR6JwdWQjT/6TDbiOTFK
	yeGTGEjip7+V9UzHDFntp8VOOdHEw9K21FWfsVCK9irZEHtPnOIv/cQj+9WvpboK1lbg6fLqYTo
	Siv+DFt0KRVA0euTXTCIaKgg7B/z2SXWGkBF3FjkvAAMaB18ZKXSATBVZdnjTynh44sSKnBB8jI
	yw5RaMwXIbEsMeM0xSNdiSoaNOb01Lx2ff0SujqKa9DcwGVbFDaN8h7duhsCnKvY8lbrGCtqe97
	xARcNEZI5XCZAGkXJ65cCoYox8cf1J14eqdvGL/pZ0K0WN6Pi0uncLAVy2yIPoAEyzEpnlnuoxk
	lP3Z8zm4Cn7JG2Z3lUhQcHDOh/C72M9MtBdbGY5RLlTiiPLA==
X-Received: by 2002:a05:6102:6045:b0:609:4d86:81b with SMTP id ada2fe7eead31-62d87b816dfmr4742507137.27.1777920256352;
        Mon, 04 May 2026 11:44:16 -0700 (PDT)
X-Received: by 2002:a05:6102:6045:b0:609:4d86:81b with SMTP id ada2fe7eead31-62d87b816dfmr4742493137.27.1777920255883;
        Mon, 04 May 2026 11:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936138e55esm33135481fa.42.2026.05.04.11.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:44:13 -0700 (PDT)
Date: Mon, 4 May 2026 21:44:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
Message-ID: <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: i0ln-wyrwArPjlOZtceecEhL2Wa8xOWg
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f8e901 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5bUN7AB3zD810d2lrvgA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: i0ln-wyrwArPjlOZtceecEhL2Wa8xOWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3MSBTYWx0ZWRfX4RCU5DYhFCdS
 jNs1NgLq52OnY+8m7xai5w9vIpDKCdU0+fS8vlrQ4RgrGF20fQPvLNNxPqkmh+JIgDFn03YYDBa
 gtEPgoYuj6bPaoWd4y60Bla6VhkdQpEdgQwMc/jp4I4pn3/yTBf5RTnq3XH9rnff2mWmIkJTWJJ
 DvxAuXbYv0fWa7uVkHr3Icp6+o++7E7XT1N0mOXcfxW6UiOwWsU/l5Aj3fx7OOmT032etz/gWsH
 PkF1Hsoo5GXVZgcba7azmL3HRi+fl+U72gA/GF11ilqzycQH84z+bt2320kbq1ZQ487JFXjpnhM
 QINhx5ILhCcXIV2cfMORcjKC8f5iNtY7G1mavVgwnRXL2MoA+mSboCcTEvn/ZiDyfpK9rAjNpzJ
 QxuTg8M4Mp959eS2ntKBfWrdH/ld6SdbU7sDtREB6u+UwY2xIofLg0k4BoVr1BmNrn4B6SzvsjM
 +kQC3EdFnEU95SFzNKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040171
X-Rspamd-Queue-Id: 159C64C2B79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105789-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
> The monaco-ac EVK is a new board variant which shares the majority of
> its hardware description with the existing monaco-evk board.

No, this is not a good reason. Is there a common PCB? There was a long
discussion for it for the Hamoa / Purwa EVK.

> 
> In preparation for adding this variant, extract the common hardware
> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> include file, and update monaco-evk.dts to include it and keep only
> board-specific overrides.
> 
> No functional change intended.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

-- 
With best wishes
Dmitry

