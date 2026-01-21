Return-Path: <linux-arm-msm+bounces-90092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCIyNbRhcWkHGgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:31:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4F5F8B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE0C7468C6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 23:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40F23806C5;
	Wed, 21 Jan 2026 23:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FW+4EZfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsVTa8Am"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68063612CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769038099; cv=none; b=uaNnWmZ3dLAsmkfGmUkHt9pFoR2Iir31wvYA9HYL6dmK2FHkofYjA10Cuu5rTheUeklQmUgQdlGU2096OrUljm5pE5ygicCdr4i2fLxzzCNH9L9ws9ah8E2igcPh7n+Et/0gaLyCo/Y9XZZRgNvs4QHJ8O2ur6mi4kBrW08pxhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769038099; c=relaxed/simple;
	bh=zj2sdr+NN7iDQrS834fZu/L63cRCCCauhfmWT0vCl4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3tGPA7RrJHu1SFCLEtXR7fGVDmjdEetNz56Zw0kTw6yPSTlyZYQ80J+yIfejdhdkXDqa373Z0kjjea+tmJ5bjfUnHUGqTkfNEhWKV3G0kk7aQarh2RfuLp2y0po+cwyoIOF6FarbPuD9STZY+Sb3kO94MUWKyWvWwVyx4sU2Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FW+4EZfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsVTa8Am; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMZYup3620131
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=; b=FW+4EZfU/iibQ/SY
	7UClGWPtwOTFeOKt/Yr5rdLbfIT6iegnm4bZD4QGlkaOwjy62ejlPf1cIriRXPh1
	5nrM2vHgIExHzRJpXshAyKnBJrg3hPtKesbrklwYAdgThSh+vRaV+3CsBnifkVzJ
	v7HTq4mc2drrXDnREevEA1mBJ93PvusBa3B2RFJrNUSSpL0McoJLKLewdjz4d4lx
	lWbTW+kMn4Embsz28o4+LEQc+e+f6MiOiIScq6wNjrWmB0oz1Z0AXxZNVuJOMpnG
	soQIy5nwikd/atV2DKM0nPM6DdHaOJW0Ftmw0PCLmsedNrVMxL5NmWoyk5chlaUf
	neMKhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu062ht7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:28:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f07fbd0so151881585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 15:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769038095; x=1769642895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=;
        b=ZsVTa8AmKjxq/BWps3WTtJOjvmabKkhHH0aE+thMFBMRarm28KeYMoZI+KYHBvz+eN
         CpOHegUl61uBIHghEfzFT2VmnU+nOjprYLb4NaqPjbgwhsW5mOeg4uV/38Y23ryvmpvo
         O30M/9MQPw+wVs3Xh2kKRfchXf3D42H/dru/3pcad19LaUmOTa88DWMofAd47vQR6ZmH
         8iYXHR2tbQpEbdF/aDJteqqiDelpN+6238t1xczyMi39mHS4x2i04a3hR1yK9bzg2Hkw
         EXRc4AnoTsPp/WgCt61vX2e2CLoYNErgHsol83aRtv1H8HtadiBJeIMpHNQ2ePmSVDmw
         WuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769038095; x=1769642895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9bPp3ZSthpe+t1u3JfXFYKqulcyRYf2GaBc9BOk+4A=;
        b=Ya2MnSQ0Qsnqkpo/IilDZ1OeNIJLahvN1+xYEoHvSiQ8fd/mXJ4QTNjvrK781bi4SU
         mg5XiT1LbVON4q3yuyX/Psj/6gtlSb6glkLKwyncbGGHXc/swLl5hevyJqmv2TQFDRik
         aMzT5r69xdUWXmGiNRnIwn0PtaFT1udHZvzUEd1KR8msqB9Ifa+4vmnQnpEXorm1JI8B
         GWf52nN7oNpWCz3v75Clx/O/pW1e7ykoia9U6xDj6/2hr4D9OgpuJdSxBr4I/q4EQZ+Q
         cjPpCtMwnPbpaFrPcofWn10EaYqol6I9+9cLBO7/9kmno/41AM750Df+Bap8xkXO2SZI
         hDAA==
X-Gm-Message-State: AOJu0YxczNOJ9rqopEJd3FeTVGUtY2Tzo4QrouXxHlS3xpyUL9V+U7/+
	6GUt2m6SECdNnr4yaypp0xLPlSwi1VfIspSmC3qUaGTdiQ75SL1MBLcUCigTb/GR/RSSJLbsNQ5
	H5QZmxpCDC9cRnPB1mbBMWMiYYWHt8TSnJd8/D18587J/JhBWs9k3KCaTzEEyb2X6KVLn
X-Gm-Gg: AZuq6aK8tcJaiBZFszQOZiSDTsbB9U5AFYtbaJa4+CxlAvMgThXjKkWt7RGVGNPed4P
	WS+pBUrbHRu7HcqaiCViE1feE+W9CpEtGYisLCY1dc9tgPAM9XNga4ywFc90Y5pqxwvXgHIX1Fv
	ckIrwn5kN3urh6Y72t7aCeNMY8hWioy6GZ25ZzSrffsOoU4xrOG+fo6cpreyJzIFFdK+LaP65P1
	drEfTkDkMrfS5v0R/dfyENb6hCp4DvVJYTj/0WrNGUGFsHD8XjIOs46k7cR2rVKA+LzInhvMG0l
	wT5/i5QAELVaV48eKpyNbw9rnyX/mUyxvvSvvw5qF4Hte5sqNOVfedMqL5+TKZY57+Xm+vbZjFj
	yKZaJkUdN37cWZiORU+/FMzvMTZTkRcnplU5n4TE+FiZ7O6m7tL2JoTVHs0X3WM4wDsg6acclT9
	TOsWrgSLREoDqO6nCzKk3dh2U=
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id af79cd13be357-8c6a6956064mr2749623785a.71.1769038094719;
        Wed, 21 Jan 2026 15:28:14 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:55d1:aa4c with SMTP id af79cd13be357-8c6a6956064mr2749621885a.71.1769038094195;
        Wed, 21 Jan 2026 15:28:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:28:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
Date: Thu, 22 Jan 2026 01:28:10 +0200
Message-ID: <176903808260.3665431.1048287995519392078.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5i0EetM c=1 sm=1 tr=0 ts=6971610f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=tjCOpFjsgevByX77PJkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 6IBuJBbKzTRi-_IZ_NkVuDG1M37JZOfH
X-Proofpoint-GUID: 6IBuJBbKzTRi-_IZ_NkVuDG1M37JZOfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfXxj96b/M4KYac
 GkDRZYe8wH2FFP396OldO9+xvO+56R76lyAN1hMJlFfDLgSVXBhOwyg2LIjltLnkuQdTyWqEE4t
 2oComqu4Cl9NaUoZ3r3P2F258bguD0GQnDuVQ+YDsDWGnPACo3VQhhHXE+CUaR9tNpsDaz/j8WR
 mV7q4aMgK3jbCPwhQuUvp8lyqzBLdBO0s90YSBHyRZVXMhcxfdDkWJtaYkYvDgCaaDlot5Kx5nO
 6E71PEwEKkBIUG9b34rkElckiLXMPDOeKvKqv1aXGo5wIqDiW8L+H+u2CDEfLk+DeUw3eMEHUzD
 MlgO2oGGBBvqlD/iCVrnFL6iB98tX3yYpMd3cuMpm7wuAll5CdjgEXTzhemarS5a07gNUWTwCh+
 7zqQKOOoEntdX6G6AqBQ4rc0EFbThklbvRBGP4kHcn24SVXM6q1ksckXGv26rmLxpPyPWfUwlx5
 hO7NSiPIXcvqzGUVInQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98B4F5F8B3
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 10:41:24 +0200, Dmitry Baryshkov wrote:
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/ci: ignore Gamma test failures on Qualcomm SC7180
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b38d2c3302df

Best regards,
-- 
With best wishes
Dmitry



