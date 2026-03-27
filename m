Return-Path: <linux-arm-msm+bounces-100450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LDaEvDfxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:52:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723534A78B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02013308BC99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11BC39E6F0;
	Fri, 27 Mar 2026 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+6qcBiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUuOjlWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383739E183
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640915; cv=none; b=jFaW1ghtofTnahFGZzxyc5SxBSrIK73Or3yagPIOslcaaEW6l3gSWTnRDrLPed1eAvV0DdfDNqn/SUiQnQRVOgVfopueP+WSb6FAyCvYcFt4nJ+8MQxYOxRxKnuGzNDB88yMekPb/dELG6YalxWq3YvlHxvKJVvwELPixQ6j0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640915; c=relaxed/simple;
	bh=FhYiQP96HY6KI1u/Sv5K6ZgtFOX8h22y24DEQ5ZNJw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMU2wHALEQT5Ox6dVBfVPpoYVMsSN7bL0sOPktEx02PI+taQCw3jLurLzgCW/C+CIYjbA3J5nVnBoGNF5x5OOGM/a8cMUmmF56IfuId3GSN0pPUAKZewB0rz60PrQwzyqFYtn2PZhQdkdlI06dEBYzv6VPuYgS60XzTyPwRyat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+6qcBiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUuOjlWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2i5c1458620
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTcml2DXC/4wK1DbbRxZTt2MfDBgAA+ck/H1+9Sm9R0=; b=g+6qcBiEQOMOtMCv
	7B58zVp1yBRYPPxi3g2wPPoVEEbnjb00A4+y8mRBjD0kTm6hHcm1/oR2l/JdI70D
	TuZqDcF8my/zLKgETCdnxG5iGCbE0Ob9EwJwbwE+YTzrL0Z8hFO0iMks/3hHMuz0
	BKMjtsSj6Xn+QWHs14ukBfjuN3DFEI20KePAPAS1HNcCg99kkU7HG6nUo2tYPhja
	wAmlxh+Iv0OfLcSs/TL4KE46DI6WWOqcGMthftBI2RlLHNZsCBFhoCuewmmMX0go
	rH1+QB0N1YYtAR9vH8w4enFp4Q8eH2pZrVqfBBJh0isivd7NJc76/iA20/VorIp/
	I0n7sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509219f94b0so24012201cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640913; x=1775245713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTcml2DXC/4wK1DbbRxZTt2MfDBgAA+ck/H1+9Sm9R0=;
        b=FUuOjlWXk0XIsJnHeEnY1An+JZSKXSVgOYVW3HnuL4ru5nwOKebE2Bt7oIJ+vmE8kN
         gc3vGMwjjMCUiqWhh7vCXB9RJqekogrXDviROillJTefPJ7j4Uv+zcS4zOsU4BnIL5C/
         f5Y+7tQCfreRce2rtAj+8DYEDLdMYNEkOB6SqJMyl9uqN4Vu4WdT2gNrqXrjv/WZYFRj
         QO6qXSKTNbmZjZYveEa9mIVChobcEIpoc8nKMmo8uszEUYAOHoNbePdV1hhzFIR40kcX
         bnHAtzBggfKnSzZGfodeEGpf9PylrKEXN4sew4phQAfu9E/MC7pBAFF1I6uCkV1flb4e
         /TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640913; x=1775245713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTcml2DXC/4wK1DbbRxZTt2MfDBgAA+ck/H1+9Sm9R0=;
        b=pwolLPOKxWWnZ88dinaTp4XcIKxtoa9fA4YLmD5WgYHaMoWte1KNZezDDatiWKmigp
         4B9wCwsGnoO3fDp3BGV8wLSEFm1ScaNYO9spkZXBkwnQyjOyop2GlfGObOfd+RY6kTKk
         3xycbLMsqRMhfC6L/ZPuhBO3gK5iSQ0lNIM5ptl8Wl6Tito9CmyoY9CybayAH/TgY3Qu
         HJZ0+6GTrMLcnXkanDumgMD+dqO+rf6HwqsXIQ7laLTck3D1xQc4LUyDk0RyVbaC+nvx
         t1iS5P+NYlrpJ4I2Igs47hBD9x27F5vv36vXKvjiDgALL9qP7dj8XArrHSAhO9V2+zBS
         u4Xg==
X-Gm-Message-State: AOJu0Yy0erz8odVnluoh2HUup3AjyyQhugjuSIw1pX1p3pM1QRPkcAS5
	8yckUc7krWom4zccc+fkw8qOSvYv7sy9cSjdNtN0uHYTl+E25+MG885jFeHj2MjVMPIyPdbfFq3
	L7B1nhPSCJg0eM3SEwN7mLMQjLFtV+GEyxsyuI8Jw8a97YE6qHeX2/OqFAJ7vMABDV8rr
X-Gm-Gg: ATEYQzxZ2O//pXi0tgJTlUf7YuEHyp3uZXKlmTx9ZVYqF0p2sxetvvH1j78uWCUWnYX
	sBu0T716W6MFjwpT9HWJC9yZEmiDKiHA13l9nRcDv8W2GE973MC17C+z6TkoLKEF916iJZXFmqh
	K5liNyjH1S2+Bxud1vg2HNF0x2m1j/9n2povCE6+hSNjE1BO6zB6dboGM+jlc2RMRnsiHAyw+rj
	dMF0EmYRaJ/zcdYVTV5aTr5GLIQzkQwhr09aT7SN5N1rfu32bqp/TY5llqauKR9hP8E4Qsu3O2e
	0rLVkvVhyCHdlaZROoQk2ilwTHLAKqEPQS49pSI/Za2x3lpFhmoBbASP38idrAeCA5FqTHQCp1b
	ohyapnN5zuC+Kyu0SoWDmpwg/+isT1AjHAd8/4BIkwdd7U0NQZJhGl2b7n2dXyh66jlqNCfg+v4
	p8E7LuuuuAv9GKSQm8tVi+ABAnsHr7S2Ix
X-Received: by 2002:a05:622a:1ba6:b0:50b:408f:f54 with SMTP id d75a77b69052e-50ba39130efmr51506021cf.53.1774640912718;
        Fri, 27 Mar 2026 12:48:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba6:b0:50b:408f:f54 with SMTP id d75a77b69052e-50ba39130efmr51505671cf.53.1774640912293;
        Fri, 27 Mar 2026 12:48:32 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org,
        krzk@kernel.org, abelvesa@kernel.org, konrad.dybcio@oss.qualcomm.com,
        yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v2] drm/msm/dpu: fix mismatch between power and frequency
Date: Fri, 27 Mar 2026 21:47:56 +0200
Message-ID: <177463970824.3488980.601109933319325787.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
References: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6df11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=5-8HcrL-3tWewVUv8uQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: LDomJKP6nEvJ-8hjlLwoumx1_VNY3moO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX9gcMDcqWJ/BO
 pRPHzCRpaor09VN+1pkAjnmxyA8A7mH2mgfwC8wvil92hSxNBHiUJNeChvyTEbLqT1USgMVZPVP
 AID1bZG4SFlFlyDlXPMN5YVHk13LjQgpjq1nunVTebDcj1JnusqIvK6u2CwL1fdqHD2XRvksV3J
 ZABzIJZLaGJd5NruKK7HXUqzZxI6VcBs9gNfCU8HttpymsUEOBXJU5x74Ru6BWOsJ3mBVtQO7MJ
 knTKkE20dAk0KLgwJT+6G0tOb1YnUWc2MteVJoYb2wyoiHGvqnGjmtOHeVYi6KilYBxMYEVTKi6
 cFi9AHuEBMlyUgvrb6wG6wI0zn1Dmr0gp+NqZzXDqIxOm2LierLHyVehZluSJJWXe2CzFyodILg
 ce9kdcEF6xAIy2QknQvuqcdboTW2zcYQfyUM75rQ+uOOgP306FOmoiXOIoLv1bXDCjlQf+ay2DW
 fVwSHqQbHRt909feWTw==
X-Proofpoint-ORIG-GUID: LDomJKP6nEvJ-8hjlLwoumx1_VNY3moO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100450-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2723534A78B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 09 Mar 2026 14:37:20 +0800, yuanjie yang wrote:
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: fix mismatch between power and frequency
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bc1dccc518cc

Best regards,
-- 
With best wishes
Dmitry



