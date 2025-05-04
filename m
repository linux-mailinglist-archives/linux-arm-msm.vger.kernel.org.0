Return-Path: <linux-arm-msm+bounces-56708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41449AA87CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA6A7AA2DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C216A1DE4CA;
	Sun,  4 May 2025 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYY5Lk3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8171E1DE5
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375222; cv=none; b=Hkktu65qLFqea8xNx6ZX6NgDrBEfVcUOZHs3RBtgP3tiAH5hXJFzY1jGSLiNyYFp9RsI4zTNcw4xSNKs/F7usHWx9Cn+blcAIoeSWLV3ocPYCW2m7HEEvf8uELqjjQ5vg0FnCigIcJaD+DW3bjlsDS1kuXdC8tdEV8F0d6IuE3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375222; c=relaxed/simple;
	bh=h78fdNgru3raJgZ3WE0MgKX1Ryfd2RCOsMN6h6hFIo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ami2sRiB92owszyTB7xb6fc3+mY4uBNBhCs0AF4i2adkUlxwI1jDiYxxqM04sbOWXJQhkTLCJntwKFo1V7zdBb9I0YslfrCXaXzFZOIpS1Pd4P4xYYT4wcmG1ZFK9DzZn0FUY+caYG72Kuj07TwJuJzjMBYSlXDg0Xst3wyocrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYY5Lk3e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544DNf0q019044
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=mYY5Lk3ek8ARjW36
	ya8vLcViA5oGGfbflO8GqSaijdgywhA/EQTzHOUFPRDpjrhxCxfZDkt4HtqOQhan
	SqyB5dVuRVxw2Omtl/YX2bj2RB0X80D2/f6erMatdmoR5Mb6K/53Evyrf8XUY9qw
	rm+/a5Kp2OhZGEuZqNBIKp3qhEfhMMpEIQtetFVCXJYDpyHuU7tyEXj7B4olof5q
	BmlQqXjfSCF4zlPTz0RYva+HvcOOuVffDe1F8vGZ5M5yWVMKil1ylhQvlKyHOVk3
	lNOaQ9woRITIddiQ8r99fnzQi3VNB/WDzTcOc6uVOfTNYUGv1AkST4Vzzt5+7qIQ
	K2J/Kw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg26s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768656f608so77614561cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375219; x=1746980019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
        b=lsg6yq/5PeA7R3UAGBBKK0AdlrXbK912zLC5aCjQU6e1k3e4YA1mmDXB+dFa2cetkJ
         LAjs4ubch+ni1teKzLNVk995WX2F33ZDWV1/xO8xPYFOauEQyEM8KiDu5Iv/UkHHSj4T
         4A7Bsv9xuq0yZZKFZ5WN8IuXTnX9A1JBsgnc5v3F8KHFKCvra3PWw3bjlpR/TjtZjliP
         xFHnHA0wTQzbfkIEtMru8BRnq8lBrs3qvR92XSlO8o43De54g3XO0RaiE5EGRw/upAWI
         yjPvTmswnKYSdC/HW9RwCMxPJWOKy59W/dNdQG0E5k/il3QFQH4Dx3jRUfscmgOmDMN5
         8ltQ==
X-Gm-Message-State: AOJu0YxHM+5FrP+Fo6c5NuK3zelAzbuwfgNLQn+SdDpygDSNX1Vdd2B6
	8rMDI6ghCLSyVylZCqz5kVnno0NSYax33Rzz6v7uFUTB1BeVphb1aeGVQkpI9zp5tfEQiko5CFx
	ju+mXCn0Jl9j10xf8RnLudhW62OUml8vNtD5QI33iL1wNdwkMLC7S4Z8Ed1iFTmnh
X-Gm-Gg: ASbGncs+ZU+BItemunhJWy7kqcAD19tiFt9SRvobmPSjm68nowwzxHnq9IqOWCaJ1hg
	UMb0l6cVVsrl461IAJaxdHom4tyuLEZ2xraK3uw9bznaIOtZ4HpE5ujH8uY3tsPy94ZtMM2AQih
	IUIOEbghXixq+cEO1PXT79LuiVOvUSGToToEfQ4pUNgFbKUzCXYvjM3Jz6oeQuMJggJDS3mnRzE
	jK8b/9OU350WpmdkkRbIdxsrUnbjQAdfmao7e8QS9aUzVte8q//yG7fo4tAzJGBVQH9+6/e9EH9
	pmEDdc0Trtm1hUBhd7D29M6b9LlJ0s8Gl0uW1DaCxPonX7DwAGd0GQ55PvlNsSQd9XxsAqJoqVN
	tEq62fncjG3Ob8M3zEsAMWwVs
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48dff9dd1eamr62916531cf.21.1746375219170;
        Sun, 04 May 2025 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4PpjTVXPh6t2ptCuDJ0u61ftt8JaFdmA2iRccvAqFCJVOcO9pPmlvh7PN0itVonAKVAxATg==
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48dff9dd1eamr62916281cf.21.1746375218850;
        Sun, 04 May 2025 09:13:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Sun,  4 May 2025 19:13:22 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GKLwnAmIGdQkoGaVQG0oxebT-0dGbEFo
X-Proofpoint-ORIG-GUID: GKLwnAmIGdQkoGaVQG0oxebT-0dGbEFo
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68179233 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX9zczxXhTb7dL
 /usKxJ2WcKBgoHW7XEoEID/tiVJTauWNh4zQXOBgXSS0+AJ+80H9lutQ5MEFppLO98RRAkwHHGn
 42EMEKbYpsr3dSBdGhSWFAo3fvcicXO+fPPECRr12MyGuZP9bY1dAOIJEeiZ3pa7kRcIhf3NHOJ
 qJAuZvSSd4cISYSVPhETKVH89J0MfR4PSpozyz0Q9Av9588ghwPPKEpFjl6YL+JrrBvJBnD+6E0
 AXXFY8zMO1QFaRLn8uF+Lvxn3CdV8m9evw0jSJNEUX3umef+KP0I9A5ftVlskeeVnVtgprVJiAD
 B2z1OHdcC7YWC7lsq3CdTonxWMcSHAXAeK4HA1tQBTBrlqzjb/9wbGmBkKsU+38gDp+Y8ddv1bF
 1IGnHeEgU9PpCJLpFFa+3lErGdKzBEZGoZVpwcYmxLZ3Uv4rH5KaCfyoIhYCaj9dSEO2UCkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=630 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

