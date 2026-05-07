Return-Path: <linux-arm-msm+bounces-106221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE68Ba/m+2kaHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:11:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B14E1DA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D51AA3006782
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 01:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B73D222597;
	Thu,  7 May 2026 01:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmE4suFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlrkzceR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C9242D9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116255; cv=none; b=VL4R6ZXFOSyAX0PsTMYWVgHGc/DHFMAxuU8mCxX7jApMcsxi+JRp3MicQRZqieBeZeh21A7ivPt3PSPTylc19rMvPsFzfib9dH4/xWgh+kzjd48yPNgKIlN8B+vnChSfhz/6aoUKFrmspFsVfKpaikk6PYb22Nqy2AZ5lej3Ccc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116255; c=relaxed/simple;
	bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7UT0jjZH/SSl00S9j8KcNFwOi2QQzgMgZHe2tqLNagNVhTwJu8WgjOYdvM0bp14OxGQKgz++ZngiK3F6/xiejoaJ8RJjwa0TSWtkjG2Bi13uTXXCoW44tc2JfiRq42F8EcejAgkJX+oHfgPMFlpC6HMdan5p03lHvTi8VxhC2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmE4suFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlrkzceR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646MSCh02428294
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 01:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=; b=HmE4suFL6jSUT4uU
	SudBvpmnnUrwtQyCrnx1DbiC4j3ZJDYAFd/wSw1CunBkmUBoUhLfSJFCoFHiORks
	I7ZjDHliT6G8Sh/S6Zdp5Wt3+tjJuhjmTxJt4/aZgOxKCRYjKJZ92DBXXSgQwtYM
	2y5eVR6gXTUaHOs+HFNgYcc6jvnTPF2KB1eKrqZ9rMQhF9lS3pVWTpfSagsFgEf4
	YwyVeQZel7fEgF7lAvippSK4Y9x4rSojjFyuF+owZZHcN6vMyIAEN1qYJgRW+lsa
	92/wyhwerFzLgNZkORh49XxJJqzwd2/9ImndZSf/mEC6iHbd9Hnc0zeHvPOWknDT
	7C9Fkg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph3j85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:10:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso6273611cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116251; x=1778721051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
        b=jlrkzceRRt/YNzW692VD6Zcv9tb/zLXktLq/4igK8KTHYyn+6H1bxPOqXGotijIjYv
         Td9NQVauBTl1iOH3bogSysk5p9doZpVBRozw6bJ9PF9dn9ZNdyJ7HokRRJBpiAuGBOEk
         xonJT328u4qtRRNgMmBDUZrrGz7pQToOQjFtn4acSsnSFFhd7cgn1KAJhu815nrri07k
         58YSPN7IWzulOwwT+IRq9mbJuan+wZvgZ11/PY6lChgqNLDOr8KyxbRJIG0QN5vj4X6s
         UCoUjUKBYPkURYXL6nmOLGdrg5CP9peUTd1kFcc7ls4B6hmAmwaEsVu/5KIoKO3t+H+W
         ugJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116251; x=1778721051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
        b=pF8or7xv1oGgbPc6zcyu9/P9ID926Hn7WEX+Hnti0KeaxfCrLeHS40FELy2FY/ln+s
         lMe93cW+fu3ksIqroAFOPoi/PLbxTACWRv2jEqso/5iM8SB0HeXFfyQAyGbU5wCsCJ6d
         VrfYyjxiZIpSiWgQLqaQ3leGkinPhY1ycUQti5tMTgnbXakY9Fxo6v/8/U0KPl1pC3s0
         I0lkCiK6wylLyWLUB5QAkFuxA2uKFrO71sNHOxvV4yG2u2bmvDi5tN8TIGgfG5po14WH
         jBKCPxKjTbUNsRRyyycF1i458ru986dfQoJ6xuKgSlDw3utnlH6mblZtH1YL9H8KMydi
         NBaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ct6W+y5NkYbm336W7c/jEPfwBsJbYy0lWdrjCN69I2W0N4qNay9EwksIv5LmAOcAKnw6WJGn5IFk9lK2N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Lr6RY2fEegLPcOgH7bz+O2tJXpAZaqmGN1Gz3SEwGNwonoRP
	oKIVj6CK6Ws3JwAPavgyRXvzpE7pAQRI+DBua4+KgR51TaZFrZwtdl9TLsdvnS7dTtAAfLG0+Tf
	ewctEKrF26Y3zzZtHA4Z/7rBm4vET1KN5saKW570s4EapVdaTE3//wZ6NwQ7bNklu1O1k
X-Gm-Gg: AeBDiesnthv8fiTukNkAIM+nv90QK68mUtvYwN6pY5yFn3tDp12YrHdYbHsnpwiu1OA
	aE88mPgV/8dHF8BmG5XK0fx9zX/QP5r8cVNQGhOaV26lYxMBWwZGj4Ml1E4ojtlTTPPpyr8aAhI
	ebRAvu5UmzKy9NoMl9EWzUfyl0MZIUYm2Eto0Kw/l820YVqMXx6Cravccs7HBrahghXwGD8MG0B
	b2OLYgBqBRPiGDRpEdVs17QVlBuZTmWexqXyOZybv5cxWfaIhAU2D0rsQx+PqH/JXW8cBBIStCM
	+VoNEHcjwvgoz0TcXEIQzlp/gvtlj7bAqx28m/pRgBgmMeCnN7/dx/2MeLQCOnGJTkq7Vu9/o18
	esKAchwTDYYW//pklWRvVEE/h0BOGbCDwsUD0U1DPlzHVvIBCJ7FCrVTVq0WjZa/fuGxTwncmU6
	DdXof07vXmjDF5br8+u4o/fCcwnh6HGDzUcnpW6njwIb5Uu3e3YTqUk6GS
X-Received: by 2002:ac8:5952:0:b0:509:4198:5468 with SMTP id d75a77b69052e-51461c1e10dmr86160181cf.8.1778116251055;
        Wed, 06 May 2026 18:10:51 -0700 (PDT)
X-Received: by 2002:ac8:5952:0:b0:509:4198:5468 with SMTP id d75a77b69052e-51461c1e10dmr86159891cf.8.1778116250603;
        Wed, 06 May 2026 18:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:40 +0300
Subject: [PATCH v5 1/7] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-1-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aUuM5v4RogJfQkV3BmKwBztUcMWiNXUwe+5
 yNCUV+TVLaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlAAKCRCLPIo+Aiko
 1ZWPB/47QjrczU8G247AzlV+ITfriITNk8BpRACt9S6dyVshzhlADn0Mlv2DUXPLylF+7eVQz4F
 1u0MtEydrPxGXo2/76J5J7R/v2opSTw9lc3em85NbyIiv4q3Mw7B1qyxb30DKI4qnH0qJw1snYO
 U/8VlPbI2DOBoKJYMFsQAn1rYasOGMqbpIhq7uQsw3kyfy6nWnZ70bZHW3e0l4Oz2j0Kzv4wqdQ
 aNhLSj2I5KQWfcDrA3x6S6GtKrYOGFQ8f0cZGvtyATTz41J7GY1UaIEtMk4kpiQRb9Zvg2fpNhB
 IE87F20jhPz+D3p1Mqn+ocyEfGcosaW++bdLIflSzST8ErUy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX/P/Mth5vFZOK
 i9GRAEJV6nm1rdSEAuRZlQW5z5ardVRLi1gqdetFquME5zYEHo9b9feyKsnlUNMIl5cnEGdDAaW
 jsPS8T4mHi05I11rThD3H7NRSIGgiCLbrG4OPfuVy9iJR02mdFNY1G/Q/xJUsX1e82NSMONZV+g
 gwNg7OBSf0AF43WtFx3VrtGjzIZQtjEdTZw4raowNt6p8mnjm1I3JWysmYMHnaBDo6e4u7WbYkR
 z9Yxrjtfs18+ewYpD9g8/UDGDOtX+CqKrH5DtSXNXs6GbIAEmFqEfreo9/SJ45Uq8sAZG+1EFGN
 oLEYhPRKg4bUTvjmlysoWxv1HXS9cpE4eq5wLELqWda5Xh/HfzKe5YUkoVK3RZD2PSlW9p+wjRJ
 B7Vezb/FEuPy1JH23X6AMXmJ0mBdAgCByu7QSiHezSreqcpURpZHQ5TsVbbFLcPVB+fMsYjx8hR
 uCkxX6NuKsRjp1YFiLQ==
X-Proofpoint-GUID: ynPFYIU8kG_qk4aImqZaCWTq8ExxyN_5
X-Proofpoint-ORIG-GUID: ynPFYIU8kG_qk4aImqZaCWTq8ExxyN_5
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fbe69b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070009
X-Rspamd-Queue-Id: E63B14E1DA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106221-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..492f85f518eb 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3


