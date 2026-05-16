Return-Path: <linux-arm-msm+bounces-108008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHrcLaeMCGohuwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:26:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2655C617
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FE013025C7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEB73E51E9;
	Sat, 16 May 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfJC5E11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ah5mN5x8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511BB3E51D7
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945127; cv=none; b=qlwb037rtlbULiHBJf9WSniAE9pFW8XqZFbLvfNw7J5f5tlWc6L1TN2NDzeWwpLFNY1ACxcaSd42jK9sOH5724N2eKrvyMx8KzozPwYAt6uzh3NjKl9y32gHf9tYCoYdjCSEFEiP3ny8QChdKvun5Xu/LcUZ6212Lqn4dQof/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945127; c=relaxed/simple;
	bh=CeBbE08vgDf73w8vKYhsJFujvNL3XiLT9kG2IrU/Gec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=deTV6YUksI3kX9Z8Dk9SF9phndOq84dc2JKkQpeRDemNlaS1jFOeDzj8O9sBh+kpwbHoCtARwJ8SSqB3jSnybQp5Bm+U7JzXxhmPK5ysm+1wYH06J2LJT3O6e9G0I06GCjQrZ7sJcwnOf6d0oMeNO1lgu6sloFfPqhk8ziQRTa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfJC5E11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ah5mN5x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3ibuu3750709
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruTiYkp6aQ4RGoWwbnJauZaAMDDWGd+o9GrPQbFZ+f8=; b=XfJC5E11Rq1DyuEi
	ITjtDr9G2xL5vBs03avzXduynWyRogEwU/A5BMxtkBJ/UvcU3Uc/LaDcfUPHFzja
	8aJb1lnJnz9ZHr4jBBnacBsuOgccqHA2xwbkcgmm+ukwDoyvtbLjabIAbNg9BrcQ
	/4HV2yj/Cyw6WXZCj7gxL9BMcw6heD86/o0TJwP9x05yxaGD3phKfHyaOntmIEGy
	1ySjLQ1XT674Uu7+oSmDL2ywZe/aW2H9TvZHBMsZoSFDV5TMbkuMTWcuVJO7hfKY
	ZvZ/jvCyNr8MCADYUKveDjNxZwdNcF4ZTW40/ouXCvgGXrdcf6q6q9hweBJu0aMz
	YXTrcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6s4bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514d2b22e7fso5068501cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945125; x=1779549925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruTiYkp6aQ4RGoWwbnJauZaAMDDWGd+o9GrPQbFZ+f8=;
        b=Ah5mN5x881uuEu0OOedXwZRUhxXyfyDZvj7Of+plnOtPp3hU9gpmpY6Jpwa0IeqU1h
         c1/IMadyf+6n5c1L8QuBHs8HfMQ65wfVIjugilwuCZT889Fzc+T29W7rCA/70eAvBIoi
         iL5ZooQKa+IzWhGRzBYi98cv05ex7w+RKBlEH0riyL0XOfG7Nl80wmth9LH/5e0z3hvQ
         IToyPts8e8CqRCFCKJES3/BuJ3dIqLD/xPH0XMnK2mkZbv7emcZogMIVDqxxCobgyTlf
         Gjg7/NgZWqRPIebx77v8iQV0+X/tnMMmwSgBbQQoYfGPt3lekTvVYEC6kfvKQLTcaGhy
         pyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945125; x=1779549925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruTiYkp6aQ4RGoWwbnJauZaAMDDWGd+o9GrPQbFZ+f8=;
        b=kd152+NSC932BnA/qQu5aWNcKA/NG1HhAETQwdHjhR1rzcaGyiath258jVj9a2gNQR
         2BBP7gg9Xvs2zjc7nWRNCct9hfPp9pbS435kHUejMO+Rss5uswi3ZtN/ziHWNNPA7Ozp
         VF3NjDM96bDLRvsg9llMjrqPYPDRWSIkcS/h3Pm5XHIKwcch+DNlSdA+j8L+2tbOy/rt
         6V06x5esqeUuO0XhwQEEtWeVm4lltgtiGZFf0ySGnKoIFE5axMtOx4XFDBt5l1Q9AoGe
         ALxBDLexQG9G6rJryBFgsE9JApCLcH2agCqA6s9IZf6Xjt4S8UrnLASkpwA3RCW5o12r
         7EeQ==
X-Gm-Message-State: AOJu0YxgaTRXinIEcOS2tilLHQLm1bxEQTXOlveNrIYtJxfqP9XJOYGn
	N76EfmCnwuJJQ0/5JcqAvUsqYWmcThxthO8wl/q5kd8aBxxmStQXKCw6bru9gL30xaSZP2CT3Ln
	MUV/7udok0E8nJpewEkFFN/E7EWWIK25jYMLfp95U0mfLi8UZ18vcVfUYm0abbqkJqVH1
X-Gm-Gg: Acq92OGwo8tr+X9PG9l39lknzFm3pVJgpIRMWjw6DRtEB15agjZ2Q20LQCUr6ojStIm
	PRYqUd5wHvdhWRK3kxpBgBN+crFgyiAI6EpFmFpv0iEirjWdLeNreNzOoCCoE4VHjZIa2My5YBg
	iPzV7RvjtKUf5x+neZCkfxNlL8c29OT2EWixG55bvjH6UExwl9ER3Apt66re/Tkompvljx5Vwc9
	ArOubs5Io+USZS6mnH8tP9QKhdvmU5MuUQcR1T48O2APStrYxflKLq7Jv70bflnrn0s+uLfR+2e
	9l5Fk/Gq3vZnShLoXu7wfrLPzYzZ4fAHs7bpL1AgWrcRysqInF5y1XljFU0ezxEcBt358fUl03r
	Psmd1Z9qzU5yL+hYxd98I7EELhVWALVHot4Diuoy5NZnY5rl7QRIczJEmmGLg8dgeV59SAe/t2O
	tHLaM+gRMOdOUGIoXgxXBASs+XKz5hcOaoauO2cFzZvIpVhw==
X-Received: by 2002:a05:622a:6189:b0:50f:af1b:1dec with SMTP id d75a77b69052e-5165a2c686amr113177411cf.40.1778945124545;
        Sat, 16 May 2026 08:25:24 -0700 (PDT)
X-Received: by 2002:a05:622a:6189:b0:50f:af1b:1dec with SMTP id d75a77b69052e-5165a2c686amr113176881cf.40.1778945124076;
        Sat, 16 May 2026 08:25:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix Kaanapali CWB register configuration
Date: Sat, 16 May 2026 18:25:16 +0300
Message-ID: <177894506980.2448625.4812573221754001186.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
References: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MQoLRrvVf5RRzSKzk_Kf-U2Yc9XS8JSi
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a088c65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=icegP6A5NOjrOqdk07MA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: MQoLRrvVf5RRzSKzk_Kf-U2Yc9XS8JSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfXxqd0LNEmdNyD
 LOJ/6KlzQK4p7gZKDKplx37F+d0lpOeJcEzpACMUs0W7QZuEDncAu7GU1JfZueIt2qKiWYn5byD
 fGceuGX/Hvf0JKtGSYuZZVAIJpwr5Y/h+TC4wAvXiPoB8StO/FelDGv34dAVrtcWr1wJckFKfhD
 s+oufCgPJacdtINPI0SL/i0ev6fkL7cV0M8XB7YzZ2VlkHfCmKoAmxtStQk/a5ZUIApii+Qr6UU
 375FVpxE7ASNn5J/zjx7nKra+awlcRrBOyGmntHLrZwmnGU33Zc7UtLdEqUEUFJo70ovOixwlcL
 qd95K3VtK3p7UYe0u5HzEKSnDo9WKan+aY1UIjc8BNFbwYl2HqcS/Hzon59F4yED7SUUKDVaWDA
 WskiGpXOyKVdWYxP75Gp3/k0/r3SC1Gt3M1VJaiEInWx4VPKgVBxfF5POCbCwZ7DSvwIlPe7LUn
 zFNZaMaoh1nWoBdTxhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160152
X-Rspamd-Queue-Id: 2DD2655C617
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108008-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026 17:14:25 +0530, Mahadevan P wrote:
> The Kaanapali DPU catalog defines kaanapali_cwb[] with the correct
> CWB base addresses for this platform (0x169200, 0x169600, 0x16a200,
> 0x16a600), but the dpu_kaanapali_cfg struct was mistakenly pointing
> to sm8650_cwb instead. The SM8650 CWB blocks sit at completely
> different offsets (0x66200, 0x66600, 0x7E200, 0x7E600), so using
> them on Kaanapali would program CWB registers at wrong addresses,
> corrupting unrelated hardware blocks and breaking writeback capture.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix Kaanapali CWB register configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d03279f0d9fd

Best regards,
-- 
With best wishes
Dmitry



