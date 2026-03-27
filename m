Return-Path: <linux-arm-msm+bounces-100438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAyRJqDfxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9A34A750
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DD7E304394C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AE1390234;
	Fri, 27 Mar 2026 19:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Etlocc/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVQrNpg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD438F94E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640886; cv=none; b=kACFME4hqc/6otBg91lGsUer01xycVEfYjTfTbyzjif5zP/3fcZS9wKVaOxjrL0SjPTONQ9vaF1ifsUmEeueh44DHsIHxphiQVVMBNomXo8Wimjbz0gGgK07r6B6FdgUp+YgnCXMlNIWBlDAJDsUlP8jRnRUUmfkXKsjHb7pc/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640886; c=relaxed/simple;
	bh=GWN/HMuAuSRUszpQLDbuDHwwGXMtupL0jwcmL+1uiu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUa4LrtIKI0mtxDd8l8uE3u7tjuFCUsQQv4beRPDkx66PscrJYeeJZZTPQylt1RJ0vKXr+LAPVpg0hih+QNw+v5zFk5EUsZihYslakOyS4mAVRFnPpYpYJs4B5K9vn7rG5V7LST7cHPRJyOnkWoKUobCYJpM8pPkb1toczignaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Etlocc/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVQrNpg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2iWg083265
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9QlFoFwXhe0LUmSue/6VRw3W3wz42yC6QquxDczBlU=; b=Etlocc/3YNxM1KV6
	eTPvPiYE0rR5coEojxgfIOx9af1AyCj0YMqB5C5nIIrDKcf+bAeoLDWY8Fk/M+sF
	Po3ZlN29kNSNHBeMCLpYf3BJ/b1muydYuCp3KnBeBpFaFKwwZjBWx7L5n/MrtJD+
	SKXGGm9VWqZNx+7tOnHljA06XdPmFOQLj0rMRnbTJZ55Qm89xP7v5K8V77MJkeav
	IJeE2TwYb+sbl1mugOYw973XeqiGySwEPZ0JO4rvtpnF5h170O9N+wCirxzxnnYK
	sIxpNG5Qv1adwbPiquxyw8/diHNsP63QoRGDHI/ciBR85e3/8V1cNkkpXGYJXYYW
	eZIrDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx39sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso58944351cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640883; x=1775245683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9QlFoFwXhe0LUmSue/6VRw3W3wz42yC6QquxDczBlU=;
        b=AVQrNpg7HUTqGbdoRsKjp1ZovBlDsaAHQw2O8pXiZVAfEMUxVvAnVSlilHODacO8hY
         KjHP1EX4Er7Wp48/GBoIVTyVfU/rkSiN0EOwlcKTk+DMxO1jPiO5xu6trgW7hjdon3nJ
         3KzH3Sv8mwdo36lztJrQ1em2EiXg29WLewxFk/EXkodg5l0PRaOC99KoriM03kOaYP0x
         6G3tMbI2KEeB1LfTcuzCIcPRNu1ufy950GwfnL5Km+ZNB2TQZRHnYW9WObcXoPTVvTLL
         5qopKCukmgdB5jmJ3hfiR2j4eyzssO0Q84PLIebEaJ2GGQN/vaHyAUNRpue9WhohXcq3
         3/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640883; x=1775245683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9QlFoFwXhe0LUmSue/6VRw3W3wz42yC6QquxDczBlU=;
        b=iGkGOkBTzptq72uHzeNTkbN/oo93Nf8uSjCGW/3CZM4IwAqY7H1T4Sr6rjV43MPNnK
         N8G1Wmu0DekuW3rSR7nhdjBQEvrnttuxSqEKlZDodXAmjfaXkKdxGCUUEKXUQlsRkd6d
         zqdzBJaRPaC0E8Q7+OL9flN4fSK9jzOYebaJtjncEZx2z3QJvD/+bb+4MrjAEghNECdO
         5O6+QjAAWFNkIeg1ux1n/9r5MeidPxE9wylHZSRxm0CP1u5uKuK+qodfomy4eQrjOsd3
         XOSPQMV9US+n1GEeLnH+ArwjVL+CuM3vVQH43JlfblhQJbNl9XC/H1FpYdgDLGbZvOjn
         DLRw==
X-Gm-Message-State: AOJu0YxoOG5rR/T6iIeyo+wr9xrQXRi/nlHVMDq7+gmU4XOH9e1/AIqC
	vStoRHfMubAMNqVKHue2X+t7Qq2O309diX6Al20AvD2kxb5d/crMT7QeWGsDkS1CU4sWkmVhWNk
	T2aNQskAG/bKvZVJ7+onuL+xJmyzUF11QPNj2GcG0Xz9gN9giMfZ509Y3/hqaTa60omw4
X-Gm-Gg: ATEYQzxtJeLXh0vht2F4sQw9cpcggQyKIaJqgdM4xIRHz66rA1X7ixoKoVPAtaqofS+
	Iv7MFtbUd7waC82OUw6UNZxKdm3hVzD3kBuyNzA2KcST0uo/HKTJnIE1i2FzT5Fhzpz3ONnC1+i
	RhY9GaFYM5F31iAk1zHRRQTiBi/r7vIZ0vPisg1ptEzA/aVg+UILMbBdUBlHlOPJtLZjr8W92yN
	bBNuLz+u8+6hKe1Pt5PVwSsQtCQUJEQRCXx/+BJS+esH6TxzsqjbYixq44VUsNbpkTO4ewwtjmL
	ayasekGG5tGUm/HdxGOLOtHQPKCZnNBxFFzgR5lhMWpKUJAo1pK1k5AhOnxCvRJC6DJIvBCVQLA
	sPsOc88Qyzeu9CjuxR0c+DJaj4s+eFk7IUJSIA5IXRdeLoPVlAMkmA/uyEE+Ruy/FoeNiaKqkvt
	u2wxiCK39wCFCtTAsagakWYQ7vnOPyXnvh
X-Received: by 2002:a05:622a:82:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50ba39359e3mr56105131cf.48.1774640882951;
        Fri, 27 Mar 2026 12:48:02 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50ba39359e3mr56104631cf.48.1774640882505;
        Fri, 27 Mar 2026 12:48:02 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm: add missing MODULE_DEVICE_ID definitions
Date: Fri, 27 Mar 2026 21:47:44 +0200
Message-ID: <177463970847.3488980.4980999830021839231.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260228-msm-device-id-v2-1-24b085919444@oss.qualcomm.com>
References: <20260228-msm-device-id-v2-1-24b085919444@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6def3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=7BoRyOUxG-vAO69hLskA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Yrk0JL0o6B3MVINv1LXNafW-zLQhbkom
X-Proofpoint-ORIG-GUID: Yrk0JL0o6B3MVINv1LXNafW-zLQhbkom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfXzbGLje4BcsZT
 sB4m58ExOySrwXtR/FlpbMCYpZUd7j8wC8sKv9WZeGr1fsEP0tg+SKQs5qwRTA7qUOHDG7ci7Tr
 g5NROfNy+6GamHDHFOzSr9Tuuy7MuAKzaLsKU8vAkfuzvOJYAWnEUhi0+G73QSxkloScyzMnJSJ
 Kp1vxNSUmc6V5m6fSZh8NAu3onUDzBU5PM+mJB8UfGQTTH9Yz6L/8wdCPPZJcQOCgLU/vTQFki4
 NpVNqLAhO/hq1TXW0zzBajqWzYOYIZ6cglfLb0NCBxl4nU3W/z9KVg84wrF+4xKceBugAVsbXrC
 dIyjfbw7kTUy8KNqpFAVLtAaxmP93BT6TDsEOdy4Dv6gp4z7GEvhpAPuq7rinUhEv8yncfLEkcP
 1ZSk9fRFDlLC71ed0/PUcqU4ABxBHsaC1kTxybJwEORMzKF+wLcNqnaMmxRODGIpa55OooBU+KJ
 +rI5IRO+fFAVXRlMQiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100438-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: A0B9A34A750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Feb 2026 19:20:37 +0200, Dmitry Baryshkov wrote:
> The drm/msm module bundles several drivers, each of them having a
> separate OF match table, however only MDSS (subsystem), KMS devices and
> GPU have corresponding MODULE_DEVICE_ID tables.
> 
> Add MODULE_DEVICE_ID to the display-related driver and to all other
> drivers in this module, simplifying userspace job.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: add missing MODULE_DEVICE_ID definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b21e85400ce7

Best regards,
-- 
With best wishes
Dmitry



