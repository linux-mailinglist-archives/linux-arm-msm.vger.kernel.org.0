Return-Path: <linux-arm-msm+bounces-100163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO6zExHMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:15:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6033D682
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48834304564E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00773E571;
	Fri, 27 Mar 2026 00:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGIV1lEC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McX7Hwcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388E1A9FAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570481; cv=none; b=kJvJYAL9qh/acdacvzSScpKc0dvMAXvojVpDFCTjzRScUBMdVq3eT97pV9b9Rxn/qx4ZiFq0J1oATlz7WFmKThvtXM3MYb9m4SSg5lyRnCaNEUuNPNC/KmJR/+o6JphE7ywLw8RIKMaZBI2tralSdK/J/HH2StxrtYri0JDcLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570481; c=relaxed/simple;
	bh=3pX9IrVZ6UOhwdVv+Iv1qIweZ9HEPBt226ZOY09D4OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T27o8FCelzQARmN9zB4gRO4n65WfBFYghVwd6YQst30pbKw2BmBCvgGAqrzveKTMBX1FpfurIMhOmyBwtWjqBhahby1EJx26W5y0dK5yRo2VDnG5DCb1rVMHfelxBluSZ+MplMszriFSITFBadnNfQN0BM/n6RDh/KY+sPbimgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGIV1lEC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McX7Hwcd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9fjc3898189
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNpaMyIszKDUNSzxjOM+bcTLULmGlUr2/bZEHknjG0M=; b=dGIV1lECRpBmhhbt
	JhfR//7qxOaCLhlxF1+UCE/3RnJ0RF51wLtwfkwOqs4S+K4l7dHh0YHTmKtvWObZ
	UVEUdYEQituV/ecm3xviB0b/L1uCWAKqYP5dC3P1tge2iKgr3LqE6ujX2GZ9fkIt
	JR1rHvLPNteLXvlmeX8upEwaG5X84w2yYJd6i9UV6QYy6JJieb5+03PheObQ0R5L
	3tr/lV5GZDJ4XFJh5OAhoB/xSJUefOxSoEn4FX3IPbin3URj8/iym2ZZjpZkYxU3
	ZoerjpGcFPKVjoX9q9LXZH/xGh7EFeyIpMSGdFMvAhbngDBb0wqHuMK2blIrP+/H
	45J+HQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kgb87a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso1512500a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570479; x=1775175279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNpaMyIszKDUNSzxjOM+bcTLULmGlUr2/bZEHknjG0M=;
        b=McX7HwcdpjstAReD/msXTrF+ko1NCIBaBusqwA3ShyV1ngHeupDfAEjagwaNcxp4HJ
         TBoSW6c+t8wL8bwFYEMNrxsam2hxWNsbFVGIyFAMO4yWXLkCGnLxXsm8l7DEM9SuB07M
         AEAQQZUIJem2zu1LLeZ6n4Lec//HVOfLzLJ4kVHK12/wD9tMQ3f0qGd82/k5I9X9d3/R
         +CYl8j/RuB1biHFANXz4fe/KJu7XQRhcnVkSfw0fCpFUr0OkLWlAyb6IfpI78Kg3180C
         UTljP2uS4qUJ3A1TssjhQV/ZPoXJbpAgP1lbjosnG44I1I3cYkR5+i7eYMGedbcOE7cB
         4Clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570479; x=1775175279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nNpaMyIszKDUNSzxjOM+bcTLULmGlUr2/bZEHknjG0M=;
        b=aS9mD+cnRAQM2wv3sf7JufnR0jTFtNdn+A1YN7NcGvRIs4Awo3NtF8ypWQapa22vId
         5YjvCE0gKPRxF5LtvJKx6dwTxrZwMGbEn+Kshhf2xaEucXWt5BLBtjdbHOppm2DJWgmq
         bURsYGz56/f8EY6S69Xe5vmYUXo6nI9XzA8HDriBWlt21XoE37AUYdqFJUULInj/0vwr
         7i9A7x3rzqC0/OCk1waYS06B1sAdWO+54Si2AfcVYcXdIytLha8O4wQLhv6zjaunAYpl
         vpikFuO5LGNFHjQwTcQuF7jEGm73Bo8x2culMA0/DmFdrYLr+aRH4lfdkyynWgalr8P+
         AWCg==
X-Gm-Message-State: AOJu0YyOBFY//K7ozMi3EJ3mtlLZ8hv7UQMYM0fOVfnjQ6BaANaVxC/k
	4u/bTJGvTKcoVM3KUxXnvLc4cOiU5aV60fnZwor+UkjDX09xcHsoepJNAdxBnjWZHu8X7hOufPR
	pPYJid7li4zWvS6AZ2m/j7wB/N5eFDeytQtphMstD3Q0hNTBnJGm9wDBs/zuSyZfwiexZ
X-Gm-Gg: ATEYQzx676EUp0DPYtq7Q8w4LKD6nMGFXRl0IzElUx7LdiJhmyexK95/mMwKMtHbx45
	16EpK0/MRmN6SYA3AyQWzhdtY4XEQNU3EWqLSXnrnD4GYifYZ0tbFlaPpALRxGHEl7BY4/4k0Kg
	1YxjKkvdzcayWGuWz63Dk+GDpv5sETPGjrtkloWqUNbRsMn55GNQkXaDwOP5pvsSuDVpvbiQAoQ
	FDFSwMKakT+r4Mda/a+wGssNSzVWZsGMRiRhBpkMtmAQX0fwp5BwChuAQvw+4BaqJgZrG2UXXRa
	Hw5hahzEjQRPj79cU56EHYf81XOp6l8JkqGwhB4F30oGLkmGdX7LJyetH2tU0wn0vzh4PR058vs
	4Vlx566fXzAY/hgPcmj25YRIdl0KZhp5uZrBVbtBTpgIOBw==
X-Received: by 2002:a17:90b:3f8c:b0:354:a332:1a61 with SMTP id 98e67ed59e1d1-35c2ff4ece6mr472801a91.5.1774570478693;
        Thu, 26 Mar 2026 17:14:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:354:a332:1a61 with SMTP id 98e67ed59e1d1-35c2ff4ece6mr472780a91.5.1774570478208;
        Thu, 26 Mar 2026 17:14:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:14:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:50 +0530
Subject: [PATCH v2 01/17] drm/msm/a6xx: Use barriers while updating HFI Q
 headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-1-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=2030;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3pX9IrVZ6UOhwdVv+Iv1qIweZ9HEPBt226ZOY09D4OE=;
 b=JvH2dRbG4ITJpjmQolQA6NVB2qKkX1XCcEsdxfWmcYy0idlkHe4LVJE1Cb4XUmNQDXJIhZr4h
 tgCOiZextIgBeDLqloxlBE1FHss7ws1xCal/Gb1z+IGd7i9K11EObtD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c5cbef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iNLaHJ7vUJo6VPWp6gkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX5eWHR2ljNVbj
 VWGrzqCJ/dw+jQ80DQHWh4/e29IzrF2Cgs1Dva7D7zn5s1IuKfCOPwgC47Z6GxujNOOvaW4tAxZ
 /V/2a4Jqc+nSmI2M0vzNyd9QvaI57p5EvoNtEG/JHjfU5Zha5uHfnRTNtQVUBNwFDikJU3rzfUO
 RiBeGa+TQStjH248aZ4D0N/f13hdT6FL+Vaz7zWIvrrA7LlWctG01FCboQCMdKosxJxZRMBK3sn
 aTz9Q/kdUEyYPPUtiLwrRsmylKs0IbYPgTDlBriCaYQQMf9Eb/t0gPvEZ4dZ04urmceGT9rLVau
 1yD+QSypl4MDlVuRg9YTg4DisywNPAs4Axoy8kC+Eiq95rTjBskPvpUGslRFT3U1NQl0grYxZOd
 WlZ5YKN20PW2lhDmAqOTfApsGF88YMZST975j+1JeCvSpK0oQ3TZWOoPlyZkES9xWBIfUJIHsTe
 KEqu69Dn6CbeRFcXObg==
X-Proofpoint-GUID: jsa9sHsvdJ4vUR8uN6pCC5L7IPQpDc8x
X-Proofpoint-ORIG-GUID: jsa9sHsvdJ4vUR8uN6pCC5L7IPQpDc8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7A6033D682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To avoid harmful compiler optimizations and IO reordering in the HW, use
barriers and READ/WRITE_ONCE helpers as necessary while accessing the HFI
queue index variables.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 53cfdf4e6c34..4f5dbf46132b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -34,7 +34,7 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
 	struct a6xx_hfi_queue_header *header = queue->header;
 	u32 i, hdr, index = header->read_index;
 
-	if (header->read_index == header->write_index) {
+	if (header->read_index == READ_ONCE(header->write_index)) {
 		header->rx_request = 1;
 		return 0;
 	}
@@ -62,7 +62,10 @@ static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
 	if (!gmu->legacy)
 		index = ALIGN(index, 4) % header->size;
 
-	header->read_index = index;
+	/* Ensure all memory operations are complete before updating the read index */
+	dma_mb();
+
+	WRITE_ONCE(header->read_index, index);
 	return HFI_HEADER_SIZE(hdr);
 }
 
@@ -74,7 +77,7 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 
 	spin_lock(&queue->lock);
 
-	space = CIRC_SPACE(header->write_index, header->read_index,
+	space = CIRC_SPACE(header->write_index, READ_ONCE(header->read_index),
 		header->size);
 	if (space < dwords) {
 		header->dropped++;
@@ -95,7 +98,10 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 			queue->data[index] = 0xfafafafa;
 	}
 
-	header->write_index = index;
+	/* Ensure all memory operations are complete before updating the write index */
+	dma_mb();
+
+	WRITE_ONCE(header->write_index, index);
 	spin_unlock(&queue->lock);
 
 	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 0x01);

-- 
2.51.0


