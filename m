Return-Path: <linux-arm-msm+bounces-91373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG3SJ+QKfmkrVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 15:00:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A2C222C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 15:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDEE23028373
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0047356A22;
	Sat, 31 Jan 2026 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSVUfJ0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jN5jMVQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF133559D5
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867941; cv=none; b=IS/5niAeiXYNQoPBJpHtLo6mDhn8wSpZJAZO9OZ8mC57Mcu6a2t3wdKAzalUNFiD27HawT0vVcB+67tfGfuEvVLu6HloNiB1YfgzpV2Yo3lljAtSjodN8d96jW3yGbcrrYlsVuHWZx2oku0J52wMopw1Kp7tvcgdhfRKz4P//D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867941; c=relaxed/simple;
	bh=XMmEmNUu9RVdz+GiH0qUt2UhQyeVsFtCItZxcUhLc/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQbFJEQNiKi5Vlx/rBsI6rkyBrpaTuIRmkq8D9D+EP7hQ4GAYaPIoWbC+BFfABUczT7ALKTEpSAsHwQj/jMjSP2ouaJ8drCGLPgdwW6mPToGhSJH9VupVykA7n2AbPnlN2JFGu+8H+6Li4EptTfBSDpcusJYrX4jpbj0tJEfoIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSVUfJ0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jN5jMVQf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4Tmir446805
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=; b=kSVUfJ0Im0AM7EA1
	/UMOG+UbCZjQlmc4UiH7Nicv/GCqolpBw8KGNd8cCw/grgLI1wDul5s6sSaM6QuM
	5iujMVIirCcJol2P7ChldI3XwJj97d5CcEl4DMOa8BKASauP5dF8JO6UtigKqLtp
	WE3umJApTqwC2kuM3n67dBUNa9qzp/fuTlmo5nkbpNhEWiuIjxndJ968nqrt6iPK
	nkkv6U3VojhK+TSn13cpBfMt1gnOD9EgEvBuLqkEHOiQgDcUsbUv96BFlVjdHnGu
	jpod/AWI2RzYwK3iiIqbyHF/q19Z/IrKHcX0jwbkllZtsFjt7eWKIzjypczdapro
	e0pclQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrrvm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:58:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f53b45d467so9789645137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 05:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867938; x=1770472738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=;
        b=jN5jMVQf9TLEePy/hv7N84h1bGyQ1lXRy3jyWvxIgCHtzWJSErxhI5pkjSxxHw3Rrs
         isxmxWAk6Vi+klRvWyw29bbUPgE3/zSkDY97wu42whvZOn/vtOywz4+q1uRYtXi7jRs2
         AdAzDsQlw+Revb/9SHXOvQY4tTa67bFAItFw37izrGYtwCirRZI77l0GhX7gsxXK/imy
         GMT96CQNzY20nXUyfWyHm8EZEuk+puechAkc1lOgshmEdUjsUXMkl5MB1eBZbcRKJEt4
         aeyAFQWfbunXKtri+LK40UFiLHGUhfc1MXDIBUN42pnTHfdYA7AqIwKHJ8QqUiB5nEvx
         i63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867938; x=1770472738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GgdwoB+Ukn6VRO1bHY69INTqGlbDpb72pFrBX8+YRI=;
        b=RL3/8RKDIqh4B1db2QGrNonZxMouMc+AZ9eA/yUpae0K58b1JNOG58ymWXMnyDdlIl
         5jsqDwv9+pLXttgeSNeEuYJwYe91+xvyJH49IyZKlI/WR1Qc7Y3KkNNaLcOB0iIdWajg
         2BPdEk73b8N+rV3d9CDS2dYukvU2Z5yytBK5lxUeeHlzIHLTOszEseQ8UImt1eoXa9ic
         ayAizr6tQ7u0zg++V65xutdgIlX9HgKM21jBg5qqb6KdAQ5cd7Wq7vSj41kO4jF3EtGt
         kP6N+ssvmETxEkiCdSf/i/5BWdEa3BFJAPXcTuPqP2OhDbWg6HBR/aQIJjKQzycTn4Ry
         mwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVjL2D9fXGZcKllMTNNd4PeQHhMUQmbgYh0GaI49OoGIpT9z7IwIJz6Tx3YqG/uBMmVQ23wh9sMNUC/kDOS@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqampr01opl5JLNNdoiCsoTNRWm6nCmTfKlJHElbgESP+mTJf
	IAc3r6pW/kx5ZSfKhg6M4ljCOQqq62+6QNP4tx06UDo1X71PC9bPgQxBHqvQpbyPDBWRSx2szpM
	1WzBFypzMAD5lifO6GN3jT+pHfWZintaXZnidInzsfsc2fbJzkgUygf6ou5Y6C2B4O6vj
X-Gm-Gg: AZuq6aIqaZgcUJ4/U/h4C7ddna1GC7hCasqFXGbhbeKLzlrrWVVjl/RdkPoZ/6Iueho
	FKXe97z6vt1gOyM8o0kVAw3tOwpSsqkeyDBLjJjfRNQ0vdKePdTR27rmlE+/JV63pkVJA3X4LPF
	YVzUy4e3pzNFugNTz1u54MTjMnpmWqYwMzwZUkiv2UvmZ2fMsd1k7Ac6ATkUznYFkH5JhGLgiIi
	J2/oyTcBdzyYnFp4YHbpiBzWJ9CD7zfDpezXwAW1pZGcLKcDCnl3EEJl95tNO0iNoQk6HvIoU6e
	AeUcuKLo/QnMUGetmkH8RDUe14rt2lCanOWMnLJzc8QpF7CSdHE7I7S2hzI3pcltlDYIac67SRD
	ISk1u5WbbS6K+X6Qj2YfS7813bP/ta7kC/+/e9yVubFi6KIWvGFBS1uTmwpbMl+WBr1ndBPPTUW
	wSmOIg4LSIRT1J64PckAb9cqE=
X-Received: by 2002:a05:6102:440b:b0:5ef:a416:be63 with SMTP id ada2fe7eead31-5f8cdc8e1famr3463241137.22.1769867938101;
        Sat, 31 Jan 2026 05:58:58 -0800 (PST)
X-Received: by 2002:a05:6102:440b:b0:5ef:a416:be63 with SMTP id ada2fe7eead31-5f8cdc8e1famr3463230137.22.1769867937708;
        Sat, 31 Jan 2026 05:58:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:53 +0200
Subject: [PATCH v4 4/5] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XMmEmNUu9RVdz+GiH0qUt2UhQyeVsFtCItZxcUhLc/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfgqcNqieakmJvNMC+ts6e9KzXlb8PBNWW8b33
 BXKF40pzkuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX4KnAAKCRCLPIo+Aiko
 1b/ZB/oCXNBLxnfq7A2nG2a5eVAzm5zJNon4wFNJSrJhTWuL7hIgST6h73z4PoFbuQwMf+bqrxy
 JUi7uHx1g09oNYksdmNUHXYWYP3TWHtEMOawLqhT0sCV8bGZdJzAL1/HbNI3mBchUiHhbtVUV2a
 pOjPjM/SYN6a2QpvizfOTpl4dezMQIqVFzTRdwTq/8i7luvsJ34MgcgsaFimS2fhGHUSEhbkVW6
 xkQBLny2Db32rvs/LVk1S1Bx13uW3apyJ/hdg+kot5+gYo+1hZU4QTZRLKs2T+6I0P8oLHw+kvO
 KhpdldvcPtzMKKVi7uG+GiDjyvVPDEHV9X1t8vu0Z4cfb3RP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wmC_TydqRLaA7xX2L7EkoF6vFmpdv1a2
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697e0aa2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2ewHlduzuzxMNEBOIYQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfX5QpcQgXJ6cdh
 kGZqX1GSRnPFHhtY3qygKMJWNZ9cz1UxRrFPJIwU4aXuuAMO5/9Ck5DZaWmgkpdoF/XRH+QkOqk
 n/0sy9iQcbqOinyQeoaTiANIy7OlBorSbMQI0Td8I0ohocdcjwnCAW+8AtNAFg9h8uZGaXbv30o
 YxgTyM8xElZvD+9xKhxc2s1aTfLZX1poHiwEL8TcWCSsCSaLYY1eGN1prkvjGH74GYZcpQImfnN
 5GyIYyt5tJuXrUw2ifGhbFU9QAeg/eU8filn6z0BRdyoLsKxLeKa1ilvBUJsMsoFu7cz5t0iV/7
 dNBrPhCRiYPsIXMzzDxOK+LGUrR27Pl4MIQX6PCi9fJhjRglaZSZhdytESU1l+9wDO5ulMRPgcw
 q9NOGsmvL3Vz9sQCDTFIGQ4Af2LdGRme1wFXotyo2w7lj2T8WgxzOlm/R/wgUTD9grrewmg323c
 4qLsD+7XsidyCdg/KJg==
X-Proofpoint-GUID: wmC_TydqRLaA7xX2L7EkoF6vFmpdv1a2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91373-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 614A2C222C
X-Rspamd-Action: no action

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


