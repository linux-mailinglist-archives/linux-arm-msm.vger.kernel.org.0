Return-Path: <linux-arm-msm+bounces-90437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BuBCPD/dWmMKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:35:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F27804DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67344305EFD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886FC31A800;
	Sun, 25 Jan 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK7hJNF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faFx1mnM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDAA31A57C
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340636; cv=none; b=QeR/1U4my6kecYHgDYuJDVoBCjFKRN9J+T1tzp8YUXCxd4I1KMucKqOZSFBnNiy+ypKR3G6dVYbotZ42RhxRxJGrLSsGqn5SqcztdnlYvwGZwwTCgUywrfLyCyef5C2z2zP9SXQw1SlXbIOyqW7Rl7kmhkZaC14iB4bXWoyNYzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340636; c=relaxed/simple;
	bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJoJ7muPMzScaoEMsxR1oyxmrRSu1CkRThaI3KXMVr01y+ERYnzRhnv8Pa2NDLkeH3Z0++paUOA3ux06b1pnA4NffyJio7X5kN9UmoYZsNGYX1P0+5adyVby7Hxt3VdTDKOOp5/Bwd+TdUqLaWs2Vhctp+CQJSsJicYzLJc6A4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK7hJNF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faFx1mnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ONwUfa1485276
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=; b=IK7hJNF/YSzESpjM
	QCwjiC/Zn3LCw3Wv3gZyLzFtZlAyHAxaJA9WKHdncxmRTWQYeQUH/OPdoC/xoC0m
	KDCjjSYeFjtSD+LAE0ql3RukYCeJ/OfidOcIPd4Qz23TRf6hu23T578ATn4pbjyw
	+AFw1ZkPRZ6xcYpfIGH9BIvD2FSWciaLGGJEVXabkp9o8216rba5DcHHuoyeU3s5
	VtuKQIaPz6VmAz3J0UpZ0FJkicjChbM9cc5aPmzcShc7W/zS0CAf+OUuXCuCOMO1
	ANj2CNabk73M6hm8zKygxAT9Not+24ISIteh5g3Jviw8MKQW1SGyRiU1xCVTkoou
	f20okg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24j1h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8947d47793fso201064296d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340630; x=1769945430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
        b=faFx1mnMASNpf5Vrbu+k/uVhhtvaGFkBBlaVlphFRzkq2xEBIlnvuoR5biQL6YW+hg
         J+lcZ9+ZV8jowpSMFNc9UIurYPLQ7TjKEYPJ1LI44MdCO6eytRT6ceJhZTdvYNtWtOUT
         4Nx9R/a5dpPeTWSHLzEjAEdgXNHrV42p8bxwmOeDgNWD7mtHf8/tocUzVm6+KfklIRrm
         rlcBU0kE9rX42CgBKDml22xKIrnRnIkRjB8rosFxI/54APl7PfIuxKPctzOt+HaXeRgM
         S3NUDeAgxH8kBGdib12GF8QEH9uwoL0ETGvOq4BShKKyRlJe0FwTTeIFDnllFeqhBNAT
         rIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340630; x=1769945430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
        b=Ik+lkqFsHTPjyIjaP7Zl7CpyZKEb0r4BoRv76F6f8K5ADgP5whBLQAJEMC3B3FqFn9
         /q0D5A9i9CGajnUynOEkfXVsPh46PeeTby0yYJfEFfVA7H3MPiSn9KMYamwOfvLojTaL
         ggkZSwM+BW+CV5nR6HtcP5oCydwepQaxY7lRppTlXQCwyfqiKQcXTas/YqwNWTt+sjs5
         5aTgu9HW5IrbpafhHP7+x93ZmPVLBda2pNPQuT3tsQXquas4gP4saEXSn7vqUmd85WD5
         uTLY38shPrfQLMauZwYAylyrb6fMrUgUIzEHksjXcENkQqir/Gpka6CT3FokU6Ph0ghB
         RdKw==
X-Forwarded-Encrypted: i=1; AJvYcCWGvM6AqtB7NQl0wOANtjgHbgESLjE+5lsoWdRB4hXc2YwECcZ7bCrQd93H5tc/0oNxxChAjFtrC07pg02y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FjfndOmZ25RBvHFZ7DOShOloXFos5xYcZGghxy499Arj4Kru
	tct1BXB8jqLFbkaMLM1YR+4EAh+FV9Hm/uCyMrDjYAc+916WTZ5bSkATgOaFxm/yKMoJqfmrAY5
	j7RtNGR6PjNZPmILpRfKAOgItbtwHANqI/0k13OcmSU6G1kDKvfPMReB7SMNMP0nt73K4
X-Gm-Gg: AZuq6aJTQ7vGdUwYL4LxKNXY2unZhOKhHwRbPHnl+8MFIWMY2viYo2JommQHtRJhTyR
	km2ZV0Ba2zoWGllN99bDWJa6VvjkKzq4o8jEdppACMAcs6jUlVHbrMYVUkTZOSJWoiex4Htx5wh
	H87SLsftEUC73RPqAZaxkDKQ/Dk5F56obbw9qbLWAUwiR0bLKOQjCmiHnwa8KthLN+aQ5lvegkn
	3BDV4fEwoj7SEUKz2docveseNsXbIHYML2PZZF/jlEoNygPLR62WEonVRO6yEOYWHhJUKkZCYrI
	H3PJCsy28R8k/4OYtUZ2iiinBk0ZzQMm282mn3fhK7bizS++fxh2x4NsiP3vEutaZfoFIcXTwia
	2HuydXsJPgGmOLLIdMvStO4ccAZc0tR1IZXw9JuI4/0LKNOQ7ZMgeKMXOkJDR1aymnBw4TnkNc/
	ayKgZu1YiqYBI3DnJEo94lZmM=
X-Received: by 2002:a05:6214:5018:b0:880:5bff:74b6 with SMTP id 6a1803df08f44-894b06ad66amr15500746d6.7.1769340630503;
        Sun, 25 Jan 2026 03:30:30 -0800 (PST)
X-Received: by 2002:a05:6214:5018:b0:880:5bff:74b6 with SMTP id 6a1803df08f44-894b06ad66amr15500386d6.7.1769340630091;
        Sun, 25 Jan 2026 03:30:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:09 +0200
Subject: [PATCH v4 7/9] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-7-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/WiNKO4Sq9OFCR4Oxxq1utFJduJzlxUaxF
 iLJ3B7neHKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1diAB/4xcXqMX5BQ30Uqy0GElXqb+H6h1SGsxLW1W75gDkcFTb0gkECJ5GVJCiRaTWCVNf6uRZk
 QL7XCT2MX9SPDnbh9Ut90scwoFRPKEtso2OSQhAILE/ixRT1LO40bqbL+AJ6lwTMcC4ve0qzJ56
 eIrauPAWrJXJs8a+NAcLps6u4aE6jKyhyYUXt9DJZc4BugdJS52Xng+ImzTY3RxC5QvGChJTWJ9
 I4ogNAFvNkXFTNJQUIKi/CA8XulwdkwBmevA3ej0qfFhHiyze6OjFRvAkBUjjlssecdVUHVcYgV
 mYzkgtdyv5xBfv9OCl5Ig/FC9ZWYiMXg2gF/M6CLuWRkCAkR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXy2tghcQbVbwT
 doyaZ1P07/eSyz8I85PO4WcetXasqPGEpHAs5rDOITSykTJYyjWzKIDuOOm1VpFQCJrO/XQ8ywI
 6/VLE1g1Jvpui+sRY9FZFPCOfmGYZ2abssgIWNkNuPRKwvOWlXf4l/WwaJyOj0tsjUi0LMIU94e
 JBQBInh3Fgb1Ow3yrB8VnipXjh5W1xbZzZZhaDS6IafCxyAqej0dMT9t6xdHx+t1LiQMC/KEVRs
 NcCq8Zls16GZq2McLXKtp0eh9aKZl60F1RvQxLb6zlbNgTOFNZWpVkDu3behzP3an1AfXEorxhG
 /YOcK9SXlFqrZ3AKmUFjWuasGHGOz0Nuq6lixH9Uv4zuaSUmGjwggqTE98gw9UpIDRp43o2H2UN
 PM2vHyzabWyWVyzppPg3+68IcKRGmGL+hHfmmtygvrE1N7mXxrMCJ/eLfJxphS9wKKHjq4hw3m7
 Tfvm9ZiIUTWekknu/gw==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=6975fed7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fFUJnxvTdpzArna8SyMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TKbnX98GCntyV6kOkf1uY0y8saW2jotY
X-Proofpoint-ORIG-GUID: TKbnX98GCntyV6kOkf1uY0y8saW2jotY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90437-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[23];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76F27804DA
X-Rspamd-Action: no action

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4d9efdbb43b..a49394b92768 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -200,7 +200,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = qcom_ubwc_bank_spread(ubwc);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e217f15ef028..07c58cf3a14a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 8072f430bd26..4e617176dee4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3


