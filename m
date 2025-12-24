Return-Path: <linux-arm-msm+bounces-86486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA2CDB7C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F4783009748
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96F430FC03;
	Wed, 24 Dec 2025 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="If5K/Bj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk1dP4SI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CFA3191A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557680; cv=none; b=ZVQT2nD8ghv4lYMOQJW45QzLo4kgFmgXTX5gvx7hX2ZNttBy6jHkaUsPTlMXXL12jTW95ym6PBIzOAq7/wIpsjfBwcVGRwxy3Xa8GV3a0DWjWsf5uIAo1bUPMJ+ivZGfv6r+2bo1BnhzrbUSKCm6wkhgOEdjEEGq9fs79bB0ipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557680; c=relaxed/simple;
	bh=LQBwQ5KKiAURRSdH9SPmpV/8R5KpoEVoxpc1FUT4Bqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZiFg8XWKElaS1ZMjWYKowx7L5ZTzamhH0jziepgZSwD6e5/T44tjr6Xjt8i//mbUNWSKiNpc0n2r+10DDRB5OBu+GQTpYk3W0pmZVBJDwZhaO9rZ+rVTeneHmYPmXIc3LWOtJmih0zKNRKSZXCiuUD38j4DzPxNJaOlio2SVSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=If5K/Bj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk1dP4SI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17ZLb1597861
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+l/KNumtMTGWNi4cIdCRyGHVnnCi7mJh+TTQ304qCI=; b=If5K/Bj3zQdKfonB
	1P/HzoOt3wJXo77Lyt0X+p1W2UEspwrDI00B16J8JD0u9RaIzoNcTevQXUVaZM8z
	xv6Zi2bqeIRSzMY+O+uZ0VeZ3RYQRJ6yH+TeXN4aD5LLhsRn1sV+xPge84VpWV/N
	xUw8sUPoSESQr21SysouBHUj7EgP5XOnidYUpaUZGrK8DbNztKx0A1OdjqwRv/TJ
	xL+dn48loaHQPm6zetiyDvDmlB8AymMITG1vvKkLxxrQ47h1ApUSnSRJEYKNglYb
	FD5n4+4Sj28rGkshyG7+tgo+Iz4Jw7xnmf1D1MdYBekXN0pwdwcKL/quz+yxHOg1
	biS+mg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683gpyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:27:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so10501161b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557678; x=1767162478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+l/KNumtMTGWNi4cIdCRyGHVnnCi7mJh+TTQ304qCI=;
        b=Vk1dP4SIZSCI84SMZf4skZKqDskJu1OFqh2UhT1xm0lfCSenbcIOII3s62JRygfOf3
         lk/e9RcVCWwlaBjV24Xib0dUbZX+8fSn6sAmJDSS4R+0I5EHG/4ft+ywf5Z9g6gU+/NA
         iAuowVivHhlOG3zVohBFL9sB0oxGbJnOujknajHAWrJLc9KUw1rp0LaB8gy3YFK4IzUz
         SLZ0G0fnt3OGEnGC40CCp0LaCbFSD7t4xNzoW8WNHWEjA4m9Kt3iOTgGdtQNxWSJIqd2
         Tb8ZbKPtIk0p/hNVXuFjcFUsjVdDFlbMrwIN/naoBt+PODDMOaj/azfkuMqnZY8Y4UsC
         FWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557678; x=1767162478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1+l/KNumtMTGWNi4cIdCRyGHVnnCi7mJh+TTQ304qCI=;
        b=hLglyKMRRd2BN0oeQypVWjZ/QctbLc9/UwnLU/jHscwHDvI7XimS6GFTQ/ImMPtKNI
         6/lL01jTQpKgMJr0G5Gva1vHjT15SFO6V/meY9izS7DptmBT+4MX3VxRQebzQ7vlf90H
         MjQWm/iUDfnLNST0Nb8qke2O67iwinlJgadLc961hs9vgcOaVcvvoyyXha1i90jAGwKA
         V5ovfGqqJperLakBqFF3UTV+Sxt5CnZKSWiP9CVtIY0ChZMTrzu68/9OfaNic3skz7K6
         QJOEvNh4SiXWgKZo49A7Qs0xzAUiNx4dwtytebwN++++9tmfTObMyIVqVd0laGGhUyvS
         AcHA==
X-Forwarded-Encrypted: i=1; AJvYcCUls6CTuvRwfgxvPFN3/AhgwvZ7SLh5RbY3YtpD71KCaUYSjpSUxec8o+qOdIFjLP2L+n+tLYnFNIb0WuTL@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZiE0q5rANgTzg3bRqYt2bqyUye9GWkboZHxYLy6O117Z6ue3
	r42HLykfXGV3U3k6xeeZ7v3EcMUlaARiyKWu/JnIpzYdmJnTI/fSyeKN6q1svXWWaSk1MvE54bR
	p2yFZyeyW4CStXplvLcecsDrATPQhYxtQG1X9BICEMNnXkG2rBbrzFsjcGH4Gg6ZoZzZa
X-Gm-Gg: AY/fxX493mKWi3llpNU8cYQfiAVU40uElxuC49LPVbaQx1FWSOIAUMabdfAYqmbfv9g
	JkwwOtHIYIyJPQTTr4SASuszPMW/GojBqSAKumpJlrBH9rz2OZMfYNxPe45i9vMXixAcKgnXhmS
	xt93hljrTOf6fixkC6+EYnCbMMRppGJJEbT4MOwPM/9J6kGIjAfQYouqeYLFhevEqLLvHU48cl9
	quCnawCQjmFoD49ACpMIhhXCwU2qvEibPUE1vcakRTz1kqGO4xWpT0wh6TlfZHk6TPS1vmZTEiL
	ZTBsFfw0IQZCEPk4u2vikGpTFg3djuozCBM10ZOKMuci+SeDe+Ci16k5ZF12mJ+aQIXnjNwjKCT
	cwu1vfb1WVb9jrWbFGLglB/oTRBZiMJLre8x3wN9CZnEWBIQ=
X-Received: by 2002:a05:6a00:a24b:b0:7e8:4471:ae77 with SMTP id d2e1a72fcca58-7ff6804bc30mr15661289b3a.67.1766557677773;
        Tue, 23 Dec 2025 22:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu1FE4J6q5O1UvJoccxuZNXG1nshn0LtkfTYhJX/wOLuef0Tz0VKj3C4Bs4u79XfEmdJChGg==
X-Received: by 2002:a05:6a00:a24b:b0:7e8:4471:ae77 with SMTP id d2e1a72fcca58-7ff6804bc30mr15661277b3a.67.1766557677287;
        Tue, 23 Dec 2025 22:27:57 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:27:56 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:12 +0530
Subject: [PATCH 3/6] media: iris: gen1: Destroy internal buffers after FW
 releases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-3-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1276;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=LQBwQ5KKiAURRSdH9SPmpV/8R5KpoEVoxpc1FUT4Bqs=;
 b=sQ3DmktSk8EVWqsjPA2/Ve4wcxGMmspelpgTal7NESaqCdsMXLFwRdhFqDmURH2S/SisZzPG0
 yg8VMPk4/PIB3/+DzTqjxF+LUNKqf17Qd8GZmywFcNKrdYuPrEYhUKR
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: gSifqEBnRFAUglE65g-s00Rjdbv9tiUi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX90puJFxxpA07
 DO318h+Fx6zAB6tfDP5QwLKC4au8E8r9aybpI2zTvUSH+RX8JAc0FWQxHltccEbxzEhlbgEv/5F
 vDJfYERNvYellHFRQlyHfj1l8U9PnQ+0t1YglDwEH5kP1RnXomDSJ9SiDKLuZHxiWHbmMKnQ62p
 n8+sk5cntKD8nZ28h4ibcziqkfxD+opfC9gEM4AxXBPyxEdZ/yHDRe+FJ4drUr53WBe3JfW6w1f
 cz2tEBXLBf9pZ/HfZQqVuFaaf2YJvJYgLq/LY8dl7yR9yEw76M5QOOIG59qFnU4ZwgFGEqYJqm9
 t6ePsVxJZQ10rkO9F0mAFPWwEfigmRQQJc0NO6DyAeJn880uDTX99Fqz8eh87iwKn3pInWDFhb2
 M4Y5FzSAhwReR5yk0ptn7CJehylbFNg6flKZAASAn3oU+mBRaYkpC8ifFcqoyfWPPxUtOxZpR5P
 +q/u2lOrgYOHtx3sjGw==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b87ee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ClRbyBwZYeV4lDUphtoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: gSifqEBnRFAUglE65g-s00Rjdbv9tiUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240053

After the firmware releases internal buffers, the driver was not
destroying them. This left stale allocations that were no longer used,
especially across resolution changes where new buffers are allocated per
the updated requirements. As a result, memory was wasted until session
close.

Destroy internal buffers once the release response is received from the
firmware.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5087e51daa842515e9d62730680fb237bf274efa..5ff71e25597b61587c674142feb99626e402c893 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -441,6 +441,8 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 		goto exit;
 
 	ret = iris_wait_for_session_response(inst, false);
+	if (!ret)
+		ret = iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);

-- 
2.34.1


