Return-Path: <linux-arm-msm+bounces-80908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF10BC44F2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 656F734651D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 05:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3A22E8B74;
	Mon, 10 Nov 2025 05:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vs3sb3Ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPPT7CgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C932E6CCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762751134; cv=none; b=TbU9hiO4onqBqKLTuxn6DknFKaSxpByaYGDF28l+JarECKQfMo0CR0ZxqdFovT8Tavb2YsXCVnIesaijbh3HitzcHC8lJWWi708vzXx62Os8dLFkLhUYKskQuDXx6+7ndsSNS20QX8X5RbOpsZ6EKA4q6MZnJdfZqympZBUfuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762751134; c=relaxed/simple;
	bh=FzzoO9k4M9sQjlK8nyUnKg9cqOI8/oU0g2MJWe3xnTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqnXV1UFPcIGKSRhsYGZBhri6SPAwhAxA9/cegXoalpGyw+7z7Qz2DqFp+YslO2Vjd8t0VEcAvlToz9K3/RUKEQ4CvJWIIVwLxxpzHka8N9H7fWcrjI5WBlaK/+YBLcJ03x7wJ9/id83GAJtTaUgUdDh5hDIi6AHP9UEHDmeO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs3sb3Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPPT7CgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9MRaoC1694379
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYWtNOwI1aavZwSln38Rwrj/x9o/h5lzzgA17JpG11A=; b=Vs3sb3Efo4R5Ah3Q
	MdS9/nWbMapc2thA92+5FGlbbo21lSg5UNlHJ94P91dH63bPYryquLhB6AVSSsV4
	JPeCx9iZc6f5mlPmqYljp0pC6NEDkcTacoJtar/4JDVCrvmyRPzS9LORO/kpX5BX
	5LWtUrcB8YtUzK3uWSSS9LnWuKJzrTZiKVMBvpcExJeTvhh9VaOOQqkV3ySgMqPK
	OONgcWd6rmRspt859MRhvAnHjmxjYRf6co8J5TcqbUAAcet6gRMsP04a46ymOrd1
	Q5RaewOLP21UXz4qQwgR9Xlg9llq5/PticdruUTfv57+FX7i5yUUu/M0wiFv8j4N
	+O+7kQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aad2a28sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:05:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340ec9b90faso937811a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 21:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762751131; x=1763355931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYWtNOwI1aavZwSln38Rwrj/x9o/h5lzzgA17JpG11A=;
        b=aPPT7CgDtGFk/A59OKhwMP3PjViSgvQogH8m12N3H7KgiJcMBNcLT2UKSxVCSLag/z
         TZ3qPFr+XgogBpxrHttcgXaK6TKKwWvQSPK6kPTobBO/ZUsPvhBhcc5LGVSmY3xk7LJZ
         4tCT+8ALra4GAE1yC7XsWZ3oC3XrUXDh7L6h8+qnmKtpPE9YKhkIxjdMXpgwTxs1EeSG
         pFswcdtO4slsF43VyFA3lW87a1qBY8Gs15rLXDgZ8jRkQ5KaMbdzvFsT04lFTJDRb4vb
         a2nx5QFmdyqvE9ho7c+Vr8iHUx4Xgj3UFlJC7nt/j/uuURjkFPIYkz6nYsIJNdoAFst3
         hpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762751131; x=1763355931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYWtNOwI1aavZwSln38Rwrj/x9o/h5lzzgA17JpG11A=;
        b=D8ZtsnvBds97ZsEz0appxijH8CZdd/gGNVFM3+8Peunc4Y3G1ohcDsYyQqSbsx4gXf
         eBwD42gHU+6LjYQAVx70OWmx6dC6rcwF3Xe1nv0DkYk9m6wpikWvdOEbyBUreBPKVnjW
         QXHlnkP72+jWvvQwaq0W82p4GcweOkNsrfBFylcgf9n8GdtqVJwmhovi9/4gZCiZiXx5
         NkcFdW1E7BSB2iLa/ljVA8yQQg4cGv2mUK9lB0Au7vUzAkyyq6TfMPR7Gh/lUFtSRVoR
         YwUFWRp8U+5OTBdqKSlO3Xvb3jXdJtZHkQcIndc2bO4bit5eHwHSXxH2qq1/f6vMB0np
         Dg8w==
X-Forwarded-Encrypted: i=1; AJvYcCWCH5nAOZsq7em9ZCC6bGSSvrGSqo50pRmbadt/lnE33IY+3Tx7EqNAoZOUrfhuK27ly+n+A58bbLX4HsgC@vger.kernel.org
X-Gm-Message-State: AOJu0YygBgf1cerEnwfzTyy2EFS24Df1BbrMHlwZxMgjLTEbOsiDqA7F
	eK31Zu+f96T/B73qrHfOZRCdFxnkXs9OcixvOFAnZH2Fqp6IwKSK+RB8pFLwSzlip0tJpJLJEDH
	A4ZrhUO3+8HJzv/FAc8ezmzMBHsy7HF4D0cogW0ylgtTA1lWbe+BYHcdcKr3zrqntDjfU
X-Gm-Gg: ASbGnctKe1relIQkKfQO4V6miDIDz8524wY4wohpzx9SPn7IBUenYHqGP/vcAPcfXBm
	zG7RmVNyt6X3Uw1fLhqsq5UiUFYTDC91s/v0rDbrAfjWV64W2sUd4VgS5uPhm1o3a3E4mvfeSyb
	KzJoXaaXTR0HJaLGjukY3eCv5hxdEOVwrwkMK7kOuuux8p4hq+JRXNkP10UsnuBo5hM1WBXOzPs
	8Qk3lctvmyP31j8N7Icv+UUOnPq9gZZKBzJEnsHRxoKAw2FiISDLZUUUTl6lsVseKEUUVMSSWbt
	6bbphBiaoR2mBnTSBDm9LEQcKiD4fZ/93Qo3lMW0cZdgyY8krNWvjPbn9XY5quBlauXjyw8gppE
	zyXiJsrY9kqCGl8OdiOUQMW+2WQjHPMLwjlkWiiC1fpgn1IF8iO94fKgnaIk=
X-Received: by 2002:a17:90b:4a0a:b0:341:8491:4734 with SMTP id 98e67ed59e1d1-3436cd06c78mr4896022a91.8.1762751130918;
        Sun, 09 Nov 2025 21:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1ZQlaMD2DhRGFL3hJaFUr9NexYv+YtjmuBFDRmdJ5aJYXw4KC0RZBdZvJvpXZg0wWg4HKNA==
X-Received: by 2002:a17:90b:4a0a:b0:341:8491:4734 with SMTP id 98e67ed59e1d1-3436cd06c78mr4896001a91.8.1762751130417;
        Sun, 09 Nov 2025 21:05:30 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm5913748a91.18.2025.11.09.21.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 21:05:30 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 21:05:16 -0800
Subject: [PATCH v6 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-av1d_stateful_v3-v6-2-4a9bde86025a@oss.qualcomm.com>
References: <20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com>
In-Reply-To: <20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762751127; l=1278;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=FzzoO9k4M9sQjlK8nyUnKg9cqOI8/oU0g2MJWe3xnTY=;
 b=k0yqKF4t9t5rOE2GT72HBsr0YSn3egf6rNBVy5bDeukHAgfg2EhFRirWIbMtyrvTdutW7xyXC
 NrK+zIfK8pVCBqbu6T/LbUReyhA3R3A0axjZDlMeqpYbV2ziOG7cUMs
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=aedsXBot c=1 sm=1 tr=0 ts=6911729b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA0MSBTYWx0ZWRfX+luOQjYHl0HX
 UzYP5OwB8ED+7u+rRu/CRQnQEOV+kuuCmL1RmILtgNTv+gUitgqAHccLbo2YO/MUyS7R/nY6URb
 jWH76eEiZpAsonTZ/DtF+Bs4cHoLVwTVQKVCQpAYIzTEzt+B9Cqxx5ABwUd1PyYVOYn7Jo/3ZPE
 ZP9gbttzt9+fDlhahu/gB91Tg0FBzx8bsK3dR0QDgZNSRrEmxaM5WYziShNJ4nZPvaXS7NSK/Ha
 OKJVYrjJbilgvOFsXryfe6AlynWJe2ffF42Cdu4Y+OGjbfJXQT4a1aSZffCtKjD7RTlMXdAHXOM
 CZiUIB44PozJzNQgwc3wKm0sMI1nBXjMfPPu9fhn32MmhCp3jICAFeGeVFX4uu7t5sIX9wrZBRr
 RaLJSOrvJ2KzDF4Cg3grMsio1N2LjA==
X-Proofpoint-ORIG-GUID: 1FtEMz_Ifswc25i1wc7WyM6ykFXJ7aAq
X-Proofpoint-GUID: 1FtEMz_Ifswc25i1wc7WyM6ykFXJ7aAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100041

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..4f4f341c26b0795831dc20941a4cecc223af7746 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


