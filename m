Return-Path: <linux-arm-msm+bounces-100463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEc2JEDpxmloQAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:32:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C834B027
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE82831FD11B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1869B3A783B;
	Fri, 27 Mar 2026 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwUtV0wM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACh9yo8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1083A6407
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642807; cv=none; b=Ql8PbKwZwp5+16m32DWq6IGYTy5/3p6gGq2GraxnnMrLbOmBlLcqxxuT9hN5Cbl/9GJZPoR79tzZPIOuJ6z6m9Y4bLZheG8/scFd47y3ULiSfdyMMgIvTYBxykeh0MELgkjkvDwmB1hN3L/nq4kTwtvx02IK3wesKDOlee0vU/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642807; c=relaxed/simple;
	bh=XMmEmNUu9RVdz+GiH0qUt2UhQyeVsFtCItZxcUhLc/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVi7CzfJQDDoOecQ++WQ45mLfWymMST4OLNJxvAjWHMthONcTNZyfS9ujqHJ3SA32wIP0+cO5aLXfrTmuUBml13taqio4yB7Vj2qrYQpRQvjEqUVXny3l1HfYT7WqGkbVrohSwNI0wTDotJx+tCYKRk5DMcyKCWwKsXpJ2NQ/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwUtV0wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACh9yo8G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2vtV1775549
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=; b=lwUtV0wMSWBtkmHe
	9QfLu6S76bML3aU0EwUQWcq8alTMeK4iYYliRFNlxlocvslA4kZ5I/EWEMnwLq3Z
	ydAtWUnMgrfLF7SpLE9SdtAuyx7aldIYAKdOixBiGtIZSgzxDzXlPPdhBim/5bS7
	EbRf2SpTDsxHTOZzcrwJXaa4P1dBNH1fme+EXK/X9rd2V+FwZrL5SylVtcl5+oxA
	S2dMOUqzGkAlsCA7B5Hfu7XU1AaCjireBdxWs+tnMEchBCJS+kKmwbEKumgtWs5C
	wmszQiB/wnGX0K3yXM6RsPzlXPhWT44PLHelaDXdqoZ7BAPDaOFhYqMEXILcjIP2
	NDkD8g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv8ub5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:20:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so4540436d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642804; x=1775247604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=;
        b=ACh9yo8GTulm9AoTFNQ3s7hXH4M8bdAxztlbczLpJaLZPNbWaagSFJGN48m9M0bJlS
         iuxQxSX6sv68sdpZHQ4ZMvn1082/lLAClCa4qRiKXxqiDPHKvwfh9zOSfTRfuM9LWFvU
         lMuGrprwdqx/inLpcfHf9kLo0hu6pqrGm0TZcHXSWmcAHR8bTp4QlGb/TtPH9hrhHmAN
         vgCDA8W39ywgxa/RJpq86H+eZryyYNNlGTshC+u60QfmAnMk4Ww+lephkpom5zcLSaHM
         0xPpTuSkXrX884me6ufsQ4T+KSvnuMlE7IRQVh0GHteTKWw5FbqBja9iaaXWgJQVEu1h
         oZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642804; x=1775247604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=;
        b=swEFvUy4mmLdKSOHoMrZ0TYuQsLyzfHbAbmxULakUInRDvbg6XnNyGjfd8lsu/4702
         9sMBOi8K7w9WQymTzXJQieKCIcfmZGW89d5NjQzmdYos5MOb6BONSHFXTnfh7pDedtKn
         crTFWqpIdxVxc0zf0BCs8mMVfkVjCRGGeCFfpgsCIzrceTbYIvgJy5b9UQ4/LqNlyii0
         a8WGZPUPWWo8G7VzqdzhcLm7TGGh78Vhu7bFxN6ebrNiJ3R1WC8lap7ZRWwZAhPv5jcJ
         p0IPeFHtyPQdvXJbFMGB8tp8EVhdqHvM4WsE3to9asWcJZoxczPWW21Zy8ogg4Yr6LhS
         xkqw==
X-Forwarded-Encrypted: i=1; AJvYcCVNMnM1JeJZuxrqKetn0n5TBVT+Gx3BgKeh/8tSA1h2/DjLK8LehhixxOJa/YXYQu5xeG/Itkxnq0i9Jkct@vger.kernel.org
X-Gm-Message-State: AOJu0YwS7Ec3D15Q3iDkydU2ZrBj5Q0BE5t/SIfDStsse6+df+mnxV9G
	mFH/h9wI93cvqoLZOl5mnzkQ6tre+76vGHsAXwdLRuSHuyZxBYSDzRKRPbJumRNLuvzfSbeWGl2
	XJ1bRZKi5gQnKDEWNa2b7cGCT7pD/ouKauJDptoN2udRPBz4/K5gqcDrXI+FpV8HCRGF9
X-Gm-Gg: ATEYQzzNrw07+xbfP0MmbzChl88Art5/PH+Hv+dhJzSum/JpIHxPFA5MxL0ynQhumUU
	BP5fkOukNDftgBXR2APnk1nfon4+RnlSM0EqlGbCz6ANE7SSSPSyx68ZC9PLOuoWgr02bse0y3o
	WnQAjxHOvjj07g9/pUaSqBiPZZrIwQr3TqS6LlPZYcfdJVR2Cczdtcdw7kou8bVdK2ckVCZ02fU
	kLefQckXviyzYdgIn+ut/WUHnD72aV30owet7iL7LdJzM65sZmsBD5+uGON/2Mqk3QiI/WdreES
	CcqvdyjhUmz4vh3N0In2OGtxbWQI+RWAh1oWemPVlRXjtg3bMQ15kqiA8vUs6fFZeQAQhm0+ZM4
	jUuawVhaGW7EeDF9QHJBsP3HBz8SNw+hYeINNGqT8mRbZQGva1mGWcFGEH7xTJSHFKJr1hykGU+
	ZP59gsfzF12jzc2m4VN2cMDHBPpSpeIhqeYF8=
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr54504431cf.52.1774642803775;
        Fri, 27 Mar 2026 13:20:03 -0700 (PDT)
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr54504011cf.52.1774642803323;
        Fri, 27 Mar 2026 13:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:55 +0200
Subject: [PATCH v5 3/4] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-3-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XMmEmNUu9RVdz+GiH0qUt2UhQyeVsFtCItZxcUhLc/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZrvI7psFdulchuoRFrrm3bjFtNBbfR/r+Ry
 EdAolOGIA+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1RaIB/90YGdp6y9KsL/zEmkoBJmzi5qBdnk0y1Gwq6BLObnMYiqMFx/DuBesNoXn7PUPMlQA3ku
 RDu7jzZhYbmPlwn3Exz9L5JtPPRFZL9TRxUMJzl98SaKUytGA1gbGFGjwNqLV3AtERe3DP2Q69M
 PnctmqJoVHm+dLJ6mjssqolccXtC1Eoai/cl8ZvUYNLF6mk+DiGlXoonFE/Viw9HNqE0h8IN/lI
 f+Zr1B51AUb5rywdJcTNtGVM1qG4Y1zzrH2vrAGcgTZhUv/JonezqrY+2/rOQtgJKP6vTgNC+0L
 OgmERuZuSQiQltC3L/vP5unyA6X14vZu1lVZtlUOZV59ohuG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ED7oIpce5dfA-Rsy3aiDRqD1kjx_HAGf
X-Proofpoint-GUID: ED7oIpce5dfA-Rsy3aiDRqD1kjx_HAGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX56/OK54SY2Dl
 Tg2L7jzxfWnCEaGzlkINLImS91aZo/gKIw0UslCXElANZYgTDbRxk9vI5aMe0qDtMhfBKX09xJU
 nYL85EH/L/brGTjIRpxn0gAH1Je/QLGs9iKcCh7Pw+MLeWWeX6eiaHtzWH8vl8gHteWiOguNhpV
 SuAmKM/szB5mBCHPk9Qg2k/+B9PSY425Aqk2TnOYqQNWE8MbwsK7DAd/PH5dydlUjptXjdISBhC
 Ztu8B4G4mloJFunpp/vZM1atAJz2+Nx8Pimm88OtpCEhkKIoXmo9ghm/jFqQSMEBfjzbiTU1qz5
 n499qQJxjtmwHsXMyhpzMNWyHceeCd/Sinu+CrSIVkmO7dHuCXkvXlMcuwyLEfFiZuDkLIyHxQz
 bDhPDCUj9/VFLgyIw+P9netDD5q162HlafInZFmwAsPceo91lUcTN+cUwvCbMJNJwt8sKM2+o6X
 m7OyDkunb0sa+qIuoSw==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c6e674 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2ewHlduzuzxMNEBOIYQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100463-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E53C834B027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
and increase H265D_MAX_SLICE following firmware requirements on that
platform. Otherwise decoding of the H.265 streams fails withthe
"insufficient scratch_1 buffer size" from the firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 12640eb5ed8c..8c0d6b7b5de8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -67,7 +67,7 @@ struct iris_inst;
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
-#define H265D_MAX_SLICE	1200
+#define H265D_MAX_SLICE	3600
 #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
 #define H265_CABAC_HDR_RATIO_HD_TOT 2
 #define H265_CABAC_RES_RATIO_HD_TOT 2

-- 
2.47.3


