Return-Path: <linux-arm-msm+bounces-86373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B22CDA06E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F4063000E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B20320CD9;
	Tue, 23 Dec 2025 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Urd4RnoV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xiw3vhc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283292E6CD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509515; cv=none; b=Tnor7hFeJMWgX7PcPghKAGUxvMvA8szmp7DSFn22buTkCDYrA61bdblFStCXfSdTDKJCRGY1nHpuwhWZGeYVWGlRarf4Js8gaaX/XW8hgftlqaxJi+I0mMFRx/jDxna+Q/iUYuWn4ytHcN5Jn0k9/t54ptUZ29QaipP9iolcr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509515; c=relaxed/simple;
	bh=J54XizqoK+pqFMqVaAWFt6DJf/q6cw8fJ2XeXzJ7ETQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKB8PvF3KIBQi9xI7MvkaRiBv0k0uxcHz7YAn7O+3TvM2uCw0kUWdXeiscgXGsele3tD3z3ApLyckNBaWebV0ZOZ+Jk2r94QOLUXdfZutkr8tTaIXxAB3cOI0wTTgUwpEn/dUwApKdgTQbegUxywP1gKcAtng7TeiTGeNy1u0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Urd4RnoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xiw3vhc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFrgCs4044651
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Lty1BfgJdP1IThHGEg1Cx+1VlMQBelYL/9c
	TvEltMSQ=; b=Urd4RnoVkQlx11NsKa0G0kkqeCzxweAX/Ea8M+uDy3gFXdgKdxC
	8Jx//dnjna/AroGnmTBE6cbUeg1sHgVkw9OeHrJFVi12Rf6+j79ZdZSeXcPGqka4
	2M+Gye8X67eoh5Q5crmjDZEu8peWONqYSEKEDp7zkyMuez7vuHpksing+6ekORMS
	ur9Z6K7QDjpTGH1f2F+Y+MKa6m3osaA1u/TZ73UBj93HYujj/X/ECSjAsMSgkaDQ
	0K1AoWXUzi4iIsd5Zal8kkWU0Y1epsTpmLrOGT5BcKul6MB04COPVY9dgR4kronn
	m54D41mTNQ/Y/OD+QmeDh2Vc/pkHR8fyKRA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbdqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:05:13 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78e7ba9fda9so68451367b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509512; x=1767114312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lty1BfgJdP1IThHGEg1Cx+1VlMQBelYL/9cTvEltMSQ=;
        b=Xiw3vhc6o2oHHlGAqq1PHbYsQmkGn+HrkB36GE8TKMx43xcdfA5SIO2gypfVCL/QC/
         OCQd/ywOgfFrsBJPFh/vGxeXLcud1sbgm1xznGbx89jG8Q1C9TUEUdXV1UF3I2ZiU2zx
         7lfwTH63Os0IUyD+LmkVl/8UgvCdyBc25b4uyEvdy5UxN9A8tHkZjpyCN5xB0KnbgRl6
         AcZzXbUnM7Lxd3wIro4MHCQt/z9E68LQ/uVJtXf3fnQ/Bxy50yS1/ytZ0R2NYHDZDN+/
         y6EHV0mPpTh46AGFeJryCuexhyC6phP4cScIVt4o10gtkhmA2AxA4Waf92Pki61DBDon
         SNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509512; x=1767114312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lty1BfgJdP1IThHGEg1Cx+1VlMQBelYL/9cTvEltMSQ=;
        b=C9OxOATKVnb0QhHNrig6HEiYS+UeScbx6oP9LJkX/N+ZCr+Yr1BBTUaXH07JRGaZZx
         vruiQ7BlDpOJx4OEI/hueDTNOQbw3jiRckjkOjG18xzkKZxt7znZ07j0sEZ3hqc3DNs0
         OmnGIpXyRpVCFs+pg8mmFlBg5ps/DagNU3/YdFi9BB0vDbcyeo4dr2dFF750FdVt1Vj+
         2568MGKzrjVJeyPJciMXOkyyQ44DgzGr11Nu0qD0wndQiKcm6Qy8LHzobmI2F4HrnnPJ
         GU50fkMSLLQscLOtRLoiuYGYjZdYSCCUEX7rP2K6po79G9ZH4/k5EkyRqc/LNnNg7HuE
         gMiA==
X-Forwarded-Encrypted: i=1; AJvYcCXUsndfg3gam9paOzQxh3MyHBpMPJFV6ptRXW1KiRUo2Vi5BsQjD+uHRq8168fc79k5XznXlAR0p8gZBAqc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd04y6JnjX1uNM9bXKDa/FTy/FcNo6bZyJhM0s/byBTsa7HbnK
	Yx3XlRSwWZ6BKr4YaoOvAuO7byiOVKNnmkhYYzy18wuREPFH+SxwjnC/YJvuIaVJXFbY/HBVzMr
	cMEjpnpnlPdO9FcUYzwfKwtg82e8mi9nJBDPb0tP/tTOyz2Urof4WwXmOIGWlSiyZolkh
X-Gm-Gg: AY/fxX7t9xILowxE9smWpuPBCbyZUqQTP7naESC3Vb9CZE5Px+gO1nh9DJNc3ybZ1nm
	zUC4oOxYKL8CNCeSk1NK82CFNpfPlNM2ZdQKMg8uOyFmcbe8OTtghHBBTPKTeT3PL1TUbKePDER
	t9fE5x3JF+qeG5RCTkgpT6g/bEA0hpM3dGn3eac9Uvc3NdGD5FQYNhJe08kBHgGL9Wu72oWgI5u
	ZjfG1HeAddbunq8H5hkC3tNJWvcpKsFcYMPh2/wIfIhFhVpXJv0zamxw2CSujTUKXbcaURkJORS
	zbekZvgB42O/+rV2FRneOhcLNsRcJ/E3lBX5nAkHhIR0hgWWeBpQHrbMZ3ANMylrBqjAmLiXaOX
	uOGbbvt2z19Kd1uEuDQ1Q54P6XjBdEEITgNjvGrlLkuiH883oSA==
X-Received: by 2002:a05:690c:64ca:b0:78f:86db:bef3 with SMTP id 00721157ae682-78fb3ec89bemr143585927b3.11.1766509512389;
        Tue, 23 Dec 2025 09:05:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtal+VQw9moQgAJlGNQiOjoIoCovh6cf2uyp3l5LMuwTRUrIc3ALximy8LcYp/GcMIMVHb9g==
X-Received: by 2002:a05:690c:64ca:b0:78f:86db:bef3 with SMTP id 00721157ae682-78fb3ec89bemr143585607b3.11.1766509511994;
        Tue, 23 Dec 2025 09:05:11 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5c4dfsm1460704866b.14.2025.12.23.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:05:11 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Retain bootlogs that overflow
Date: Tue, 23 Dec 2025 18:05:11 +0100
Message-ID: <20251223170511.2277302-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jpX2E6TH-okDATIE-g53JVEj7A1jWjmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MCBTYWx0ZWRfX5XiJEaefOryg
 bO0gwGnFUFAo0PhEHpEQ24nWXXUTJcWFKS8TveyiFgpeGDxKyH52i4NnmBVdk3udaV7z1upv9hd
 4w7LYFpBg+V8zSUFbHDcw1ZpfPj5XCkzeAQ3L4UCm4r/BP2ParXXIyma2nmjXpm7kk7t7hs17lu
 JmeyOMIIiuC86EWVHpH8y7EjLNy6LTp68O32sNeub9Yfatkqni7uSCLhn9iFc7Pisr3qflOXnb8
 4yPdgf99LC/Ymi4DF5i7UZ9rTEcALg1mdz+tUVXYr7n4+4Vdnb164DPX7lJ+58p586giFNkGamf
 0RNY1dNwNznM4+8W91d4BAKWSmc1lNH/ulL78F9A0Oykbd9fJCzEpJzs2sU0VsFADQ9Y8eZV0BW
 maXDAhvCsNM/lvM6y99nAvmByLfLpKEKY/6Tuez4TFCZ9fNLdci3fMhrHBkERvzmnWM0oMvjMKZ
 /qIym47R3R8X4JDLIPQ==
X-Proofpoint-GUID: jpX2E6TH-okDATIE-g53JVEj7A1jWjmZ
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acbc9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6lPVHfNS1Hr4Jh8Zh9wA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230140

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

When a bootlog requires multiple MHI messages to transfer fully, the
messages prior to the final message may have MHI overflow status set.
Preserve these log messages in the accumulating bootlog. Do not treat
overflow as an error.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 8dc4fe5bb560..8623e8464c5d 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -265,8 +265,9 @@ static void qaic_bootlog_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_r
 {
 	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
 	struct bootlog_msg *msg = mhi_result->buf_addr;
+	int status = mhi_result->transaction_status;
 
-	if (mhi_result->transaction_status) {
+	if (status && status != -EOVERFLOW) {
 		devm_kfree(&qdev->pdev->dev, msg);
 		return;
 	}
-- 
2.43.0


