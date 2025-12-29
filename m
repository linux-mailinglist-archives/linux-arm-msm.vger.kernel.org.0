Return-Path: <linux-arm-msm+bounces-86789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0DFCE6076
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F3F23021F80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A782853F2;
	Mon, 29 Dec 2025 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMG/if0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhauOmzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F62D0C8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989913; cv=none; b=EcX9pbWQ5LuwM0wvD3yQjs1ngXJg0JS94c3GDgGjO6/YnH/EpUw9oQ//me5OFUxSB1cHM7rs7XjueMvIuKaciaOT33nbZLNTsrX4TuEU5qbit1UFkt8zcCRngEdSx68onReGfrVE0PzAGm86zrx6ojppoVFjDbVzYT70HMIKHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989913; c=relaxed/simple;
	bh=MEV2/qVVd99QWuTtE5bIxAoEdRDy3ULlE8nZBM2UNsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdz/vUwOvGDdrMdySTrQNFGsne+cQop/VPxLGN4deSDfgf3pm59U+QoQbgbpssunJOyHOTQdGfoGaG/tNrWs5CHrdLqCxyenIwttsrx1ei5MHQU5OQMcBvzlG+Ht9lXXNsXfXCl7J14KXBcleS1BLLbd35t++RqjTp/46RNAkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMG/if0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhauOmzm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMu4K03718751
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iZ4W4e1iDrWQWlO3LPsVRbwj84Rm21UBb36ptgETvc=; b=NMG/if0UzZivJsfX
	sakulDhkt9bNepDQ/GyN2+g4V7fKZK47CoEgsAQVIiQXKb00wq0TL+fTixjWutOJ
	h3XO8I8LqQrgAqe8PzCWbVssXN7ozJeM7XLFHtUh1QFCDBtEn06O/Ka/t7xtKeCB
	fdvSouTYZQAP+kGf+Sg1AXcDc33CCtmPUv480+0RlnlsLBzQL3AFsMoHiKL3Uddw
	C2ToyItwcPFe4VJnKCujxwdcepbgIzYWjn+jvrfisZcy7kp9XoeGyJHUW+IBaXVg
	gdQ7Jw8d2EUpKkTAUtAt+NOyyAXgcQwAqfW/DWJsMnNOlsBi2z5aP860PeDUmilO
	IIfYrw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg3k8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d5564057d0so20918413b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989909; x=1767594709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iZ4W4e1iDrWQWlO3LPsVRbwj84Rm21UBb36ptgETvc=;
        b=FhauOmzm31EU8bEv9kkxBujgLxlHor8j65zk47M2KZsL842IvvxKE9N9IbugfFFbWU
         YirOuFwfM65XrGyO6s1uYHTAzUCZKT2CAb+BrXo7IlKinkK0KM6W2FoFySGECpV0iG61
         s18pVPo3IggstJRNYj94NrapJzmNvSmmFnZcL9bAx+AkxrWodZc7juirq4BpR1pIepOB
         u0ZxC1MAceeUBNYFQ8trvjUN1o4G3L5p404yaZcZrysXEAw7oJSwyIlXSB3WT1qewawH
         nRS0EUm/RwypfTi8iYXxrFnFuEShtjOHt00ULuThDhQ21jMLSGjMx26Mb9cPdwLucxhO
         Gd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989909; x=1767594709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3iZ4W4e1iDrWQWlO3LPsVRbwj84Rm21UBb36ptgETvc=;
        b=WwY5btdHJRJXNZ2bylIJcEA3KJpqo/qrrlPoserUXBlJMfh/obpe5URl8lk5JQfLAa
         UKo+AzxMAQuaSfv7M7O6/Gzm8Dq/vVKtUodnvXuWjmMg/2Bw3S6PFBxwxyVwtbrmHu33
         QmXzpA3B49cWVYSjCRD0xGB6Iif0/ZBmkd/nApcSyDIavlkoazOVmrxXXzqb3/jtfoW1
         g+5nUJQL/iAVsudznB7n756Ygqdq+os4JHj+l/7Yg0fqFb4u34MKCo/toyWZNrRc6FDD
         Q4XC6C77hC3/2zgy63y22INRcIFghmWcgJYiFpFjZfw0KnBTnBE4DC/98+epv4+XdPia
         nc+g==
X-Forwarded-Encrypted: i=1; AJvYcCXYw1390D6JhyBXUbrffq6RfoNGLnO7zhYvHx2K3hJDSa14+RHW3hSV/ilQ+RaddwwYZtONqkotGqAsg+RM@vger.kernel.org
X-Gm-Message-State: AOJu0YydS3ymfhf29+eZ8+5OtREgIoDhHEqDz31IRz1WkkB6VmqtNSF/
	MP8p+TeIM6FlRkJvqxZ2i3TscG7tx16nWyx23ojB8KgoUvOoPMRA6187rBGJgDsfLLUgeQgSC/o
	/Tcs9sAyNvc0XgfiNI4YoBHje7XDyhPkiUNuRSuUA5jGJk/xP9MIs8JMI0uO3km6snK8E
X-Gm-Gg: AY/fxX4webhQr2UmS4YJDNepTFy0HoUS7e20Cw3aE9RZ+B2M5K3HSe0H+sUCb5iPKJQ
	LWV9kwwo1zBfJxDnP4KKLE8e59G+jKsOXarxsWJT/IOeUJebsu+vkVkKctkCFFuoCDH9ZYZ1p0J
	blal7T71G/yiRm3qQLgMfdsnMSavFN10kDj0lpFsR4POBx7dZrFzhyuI3Z/bV9PV08bkPCj7jA+
	/NAmOcueIGZaBbhiZkCkekzo9ZwOOfq/SrJe4dDnmA0DgyVE7NhwfjS5zHl6jCx4rzYs5eh4PwE
	kbDN2476/mNX6yfbvrscJBeIdFV2Z2AsHTam0Aym+PhlH+xyGUFioxLbAY5QVZcDQoVDbZuKgie
	sMnYpToLLSqNggb1sfaJm5qmuyHHeIN+qz3bzqYwnLvsiItE=
X-Received: by 2002:a05:6a00:3286:b0:7e2:839e:84e0 with SMTP id d2e1a72fcca58-7ff64cd429dmr23873613b3a.17.1766989909591;
        Sun, 28 Dec 2025 22:31:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaxbeyexC70WN43ELJxd4EwRUh/WhI8QxlmMzJXYH9f1Bscl31v4+tELm+vI8DjSSdwqUJyQ==
X-Received: by 2002:a05:6a00:3286:b0:7e2:839e:84e0 with SMTP id d2e1a72fcca58-7ff64cd429dmr23873587b3a.17.1766989909193;
        Sun, 28 Dec 2025 22:31:49 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:48 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:22 +0530
Subject: [PATCH v2 3/6] media: iris: gen1: Destroy internal buffers after
 FW releases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-3-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1336;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=MEV2/qVVd99QWuTtE5bIxAoEdRDy3ULlE8nZBM2UNsw=;
 b=IaRfzLARxFmFZs+06nVP6qXfmpdn/HGQKiRpqWvOUZKtj+oojXCHmnXdE09bQ+8JKXtQLg7D8
 RPFpdcQQ8RZAl/+hpZM5n/M5XK7LGrVZPhWd0dxQwWO+U8x66GP4Oz4
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: M8WzjCTCa6b4CDuJGDRwClBiDSVkajO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX2qhyUjxa9QXg
 f0glkloSidLqBEvD9W7FD/xmavBdRyyAiHg1isduDd4kt18mDK6xefq1DUNGc+pfsqYE91tOPpu
 ok8SU7zT+wlq2E1sYHYznPOUfva9f/WbGLKdRT+ymJ5YpHitBYcpF36aqiaHvkK0V38GPaUH93d
 Mmf8vxX8owr5JZ+pwjff8+3TkkF+XI2mI1K6RsTN8UEq/55ngxHfkG9uk2KJlAKCzp++cecX1Bv
 6viz3M7a3T9ig0EXo6fAUKEHF+BCwcW/U9P5OKPWzZPhiYMDuRO3gPjIKIcLzX0SKNzulsiQTaw
 SDaHpXxp4PdLm2Kio2wgmLhr3wnXRsOWdSCc210Mo5pgNt4qlJQacQ8ANO6N69JT1RY07hrUYmo
 oOX/5GfEqk2fUTK+yGb0CWCHM0L2+46rk1C5X0BMnJA8MM5x1lXIRzqRUKG0ZRd2kgA2R3T+Df0
 zvbvPMk7NzBHrjaVnOw==
X-Proofpoint-ORIG-GUID: M8WzjCTCa6b4CDuJGDRwClBiDSVkajO1
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69522056 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ClRbyBwZYeV4lDUphtoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

After the firmware releases internal buffers, the driver was not
destroying them. This left stale allocations that were no longer used,
especially across resolution changes where new buffers are allocated per
the updated requirements. As a result, memory was wasted until session
close.

Destroy internal buffers once the release response is received from the
firmware.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


