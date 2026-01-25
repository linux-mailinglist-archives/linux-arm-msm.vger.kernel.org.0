Return-Path: <linux-arm-msm+bounces-90463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNKUMvk3dmmTNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:34:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BF813E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D50E6301F306
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A15325707;
	Sun, 25 Jan 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyoSlpaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRFjKRxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A94594A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355190; cv=none; b=ZKilCg6hiMQJat8D0winYCDopBizQn7BQqSibKpBh7V7pkH1rGnGmIR/ogYKCdJDKstmxIxlLLuj1lzlqDX8bl9/FzXxIIVUW6iv/Ies7ekbmM9DHk0DJDiKjqyTHeDNQvEO3kFG5La0jL9WvUnQoSp8iL9yV0aa/GKi0FL0NsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355190; c=relaxed/simple;
	bh=GDCux5/i6rzPNo4N6yDVLVv2AanlrWAqQOI1EaovOUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZmb3C4H8kIp3nmqDmhq2K/tuJpVvC5N0dJv4xbk6Z7QZeAFGN5M09+uI4mXRsNXzA/2MKShQf5rnSu36Iuw3tDgx/t36HfyuqC9oiKwARz0q+fuTvqT5RIyHJ67Tvg1aT42RhpudOT7ZX3eE6e/bCD3bIBm96VgqiCc8CWflVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyoSlpaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRFjKRxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P0lsaN2247204
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKl8bSKtWFM96D5GTRw8PuOME6SbjY9ZogCXmb1bzn8=; b=GyoSlpaXq0FhS6uK
	S0hWpWIbVjfP/XD8P53SsDqMkXDNnVJCqTTGcUZBCP/iS0MpM/cTHp61COnr4uGi
	xjo5pXbzu7zArUtF7cXXyDNr/xdmVK2FiQiWuGMAztJ6bWz3br4ydMcXaOSNrdI3
	oSzlOrmEK3I+QVcwbDSpBnGuZST9bkOMJQ1ibQ8rj5KUo6Wu9uO0FBzO9q0GUQnJ
	4Whc927W47+PbUsxIFNwZ4mok0a9eZsmuN1j3yRrkRvP6M77n3eUHjEVr51kwFtG
	wkCfWyT3CpNOJ3F/GFM5+4eO8Shi/M1cCM2kYzhWHqtxTe3dRJdmVTKskO7VkwA2
	18PCeQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj9v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a39993e5fso111860156d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355187; x=1769959987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKl8bSKtWFM96D5GTRw8PuOME6SbjY9ZogCXmb1bzn8=;
        b=iRFjKRxlF0dBhozgE+If1wfouxdYGkrJaX/rW8ZSq08gxbKAQ7QJDE2XZjTQ++Dul1
         QG3ChK41pQMmlbTFDTgHZsBPFINjjrKcNoMwRbg+qHWGIlutT43OWLtWSsY9gzbWqHNt
         q2Di1v6EcLiRTZybgy5JvhwUAs+2inYs76jGOw2aDJVvBtTWFOMi/NfQRKeryoK4w8ch
         CdhSqHR0S49dkZezN65k4Xre7YQwRH6ZsPgBvOBSAEcopbwaCvyFhg2ifd5+M+NsMILI
         abDLFt3vSV0hmNqv8t9sgpcR+inzz7rxPwADMNMIba4AHHsZXtetu16qax7SyOoMjFUI
         a8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355187; x=1769959987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKl8bSKtWFM96D5GTRw8PuOME6SbjY9ZogCXmb1bzn8=;
        b=je+yvv7CUB2fr5iRg3uya1IDgXumia6v8qObP1ba+/r5dHtFKinUQEO2pFzrCtn/ps
         059nX47rL39hmUM2MPSpmRfBvSTV7xcZyDIxYIyhQX5FM+h/4ztNOg7dYIE1CoqfwRcw
         98LtC2ez/BNeKpYBAmSh78MrYcujJIg37DjFnDEuXajOXRrbarN/792X5BTtjDUs1SvW
         m8FzZWts5fE9y38Yk4xoSXoS+9Fxi9U3RtAho2XR029LYNLkD0YZYw2raOxWJk/7Mlrb
         plvtPzL6+t6bwaA8G8r/kIFb5/89h1Qx1CzSn8aUMmuhBXzMxnOIY7rdSrlXUv/KkMLi
         2wsg==
X-Forwarded-Encrypted: i=1; AJvYcCXkJ35mJGSehw1Y2TNji4+nwpJbPB2ndt93oZJyV/vLxZGbk4i+UXWRUjA3OwwqfPgGMI0crwvbcB3ocfhY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk4zhtR6EKXIS6mu0EPaa/zZrBKqPPsW6gntGVcF5TXufJyrp1
	m+8Ojy1JOy/oyDpsMitE1FAfbO8MTI9AoMwYuoBUt7Ik2dHFz3oS0FZMkOohEHHe62aOYrfTMY6
	UV0r7Fvn0AfYrVUWjmQdOedtyuBXsgejtAEVTcQfIRBVb1vzd+M3T/tn3ip+jBzVCvKC5TTwdmB
	P/
X-Gm-Gg: AZuq6aKQHJ/EByL9WATnb0Bw+Ndxsxvuhv/iyh0wXxA+gG+DwEG4azC8Wk5O7mln2+S
	JmP5vs4fIWIzVdFzU4pykEzd0mFbQJe2iPTxas73qVxOHxUgqkmLEic8JxZtP+NJ7RpLi13jN2l
	zxmjDBtzE8pePP0xcenVLDbxHqBfm9VBi9/TCyEfAVRAcBI7rwU5ZryJCrmhLwvKLX+iHi0TpAA
	VuB1pZpry1DPLdUX0Xl9ubJIeD5MSaF9FzB8Mp0vm/xL4ixZyGvCXdD8ojlBFkeMiA5BvCP0XEm
	oA7C6S+ZdmvQYr1g5Cd++U9pRV7MsAdKCC7nd/cE/5wEOOOWm+DF2FM8NZgPH0KDdmWzSaUXiDM
	F52GqypULnLPuwnHl+JSIF4LSG+TKeRoNfCWssyZb1M1pXKbYIGFHmjVxr3zNiMYVO2vDOu9JYL
	PtIKBiLRGwymqyfCLPaW+YxXU=
X-Received: by 2002:ad4:5dc6:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-894b071a436mr23646516d6.27.1769355186686;
        Sun, 25 Jan 2026 07:33:06 -0800 (PST)
X-Received: by 2002:ad4:5dc6:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-894b071a436mr23646016d6.27.1769355186149;
        Sun, 25 Jan 2026 07:33:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:32:59 +0200
Subject: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9801;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GDCux5/i6rzPNo4N6yDVLVv2AanlrWAqQOI1EaovOUg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjesxNu+Vsi+SF1XoGL0ypnOfyEOugZbLixIt
 UPDtAKMyHOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1Yg1B/9NGg+katrafwOK5KWFotLmO4QkdzZoVvV8fiUQyuTitNTHW0w1bCjJbvpR8d5wtaAS1+g
 eaiE2StS+ys6NIuftp3m3HJGGL1EQJz9iPlLsELwMRN6eTJdN3P+qJO0miErmQ62oXcciJRCXsz
 Vhx72mgdgTnlTrdpxw48GP/2ngbnfNvOkuBOk7FhlyCtvqpqb/HxNeq4kKyiqDBAR6iRGDIfbwm
 lKeEcTHJUrLOvHgqP66w/cw7Taz7oI8uSVsifbiXfoSo6wOW2i4+U9QFqntg1mZiok2wvHmxh8C
 pOA42v3D/4cvCtM+uww6favzH8feSbdBe42AcQcPCXup2vBi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: l_v6Kg8v5y-qAhi3mkFDBXceNK0X1zBk
X-Proofpoint-GUID: l_v6Kg8v5y-qAhi3mkFDBXceNK0X1zBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX6/zF++TQKhP0
 W/YJmYELV14BaZ+4PsxUOUzA5NaDJXACVRqOomfHysRqMr7pM76uxTjjcO925EQ46vyyqBBVMMY
 skyE3WVkJn9ehblWUhYPJLCs3SYvKMKmpDMJnZCQ4P2A4wcmM9I68EimsoCn8UsAt/x9PP2mOld
 Msid4TfKt4uaT60ndey0omAE3u7zHh40yBJFjBoHb/x2rb7b5EOdbA6cl9RTRiZfb17plD86mB6
 NkWvYOYBmUDBtvxYfnYl7MhxKBRAcnevnyE2NGYSDEggjvNItVs//58lV6UwmKciA4s99i8spXu
 5khqq+Wu8vIOoJ3BWqsXwNQ3Lm+bunsLHdwNRDZMsEeGE8W/3/Uu4euxh/Zes/mvH2FqFQMI1YB
 CH35EOgX751HKzyFVxq248XWrO5CvFJUtdbtm7je73x8hGdjB4s4BUTY5+XyIL97a4tng5BFY1v
 /nCZ17FYMaeKyVRoakw==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=697637b3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cRfOgoED3zJZRR43ZbQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-90463-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 674BF813E7
X-Rspamd-Action: no action

SM8350 and SC8280XP have an updated version of the Iris2 core also
present on the SM8250 and SC7280 platforms. Add necessary platform data
to utilize the core on those two platforms.

The iris_platform_gen1.c is now compiled unconditionally, even if Venus
driver is enabled, but SM8250 and SC7280 are still disabled in
iris_dt_match.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
 5 files changed, 144 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..2fde45f81727 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..49dba0f50988 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,7 +43,9 @@ enum pipe_type {
 
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
+extern const struct iris_platform_data sc8280xp_data;
 extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8350_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..c99ff4d4644d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -14,6 +14,7 @@
 #include "iris_instance.h"
 
 #include "iris_platform_sc7280.h"
+#include "iris_platform_sm8350.h"
 
 #define BITRATE_MIN		32000
 #define BITRATE_MAX		160000000
@@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
 
+const struct iris_platform_data sm8350_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8350_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8350_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
+
 const struct iris_platform_data sc7280_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
@@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
+
+const struct iris_platform_data sc8280xp_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8350_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8350_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p2.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
new file mode 100644
index 000000000000..74cf5ea2359a
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_SM8350_H__
+#define __IRIS_PLATFORM_SM8350_H__
+
+static void iris_set_sm8350_preset_registers(struct iris_core *core)
+{
+	u32 val;
+
+	val = readl(core->reg_base + 0xb0088);
+	val &= ~0x11;
+	writel(val, core->reg_base + 0xb0088);
+}
+
+static const char * const sm8350_clk_reset_table[] = { "core" };
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..10b00d9808d2 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -357,11 +357,21 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
 	},
+#endif
+	{
+		.compatible = "qcom,sc8280xp-venus",
+		.data = &sc8280xp_data,
+	},
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
 #endif
+	{
+		.compatible = "qcom,sm8350-venus",
+		.data = &sm8350_data,
+	},
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,

-- 
2.47.3


