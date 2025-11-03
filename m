Return-Path: <linux-arm-msm+bounces-80115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD563C2C13A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0EB0F4F5C24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F172652B0;
	Mon,  3 Nov 2025 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK1VDKeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2Fs9IUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB5260569
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176263; cv=none; b=jIkdbb3IfbB1OslquGiHwdiR+kxjo4G/qD4ZWmHJHTHNX4KsswUAjizXQ4z+dD+PA1pJOn/V04HNQACdlMCjL7paEtSdbKJM+BKW5ia+/saSTVAX/YYfLtgaRN7nUp1Vyfajsqcwyrf93OR4qNRK4+FhyGWSeKi/1xPgxTrudJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176263; c=relaxed/simple;
	bh=SZrZjo2s0yDcGXFZCdWPCh5Pkm0hk0faJ9y/OoFuzs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvEC+1p1ETGtWcaqAX38+Urrj+RNNtwmVCkR+0CXbHG3xpsdPfPyu7rY6SPk2/NO9C+FQRxP0BJSrIYuY010voC4rbijoPPCi/nBaMrwT1S/M6TK9kKAMXf1NzeXw6YW30g8IWh8MvUdQLDZWEpQm5z2sm/CMa9pT0YnHuaTjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK1VDKeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2Fs9IUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38qNHR1381778
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 13:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0bUAQePG1bGRaZhHjmNgnU7WKw1Px2yFxgVwokQWVU=; b=aK1VDKeB78Ft5zFt
	xrEHENj0XydNvyI3rfkNEGLsdT+b+/Ic+HfbcaeRhlJa52v3QIKIhJl1bHHn11ta
	QBJbtCV7iTR7LrcWgcA76pOW1aKugPySeQeRtF9h7n/9MjQGMoHV8ZAtzL3m+q6I
	ofY2in/j34uY5nvn7hWzknVRUu1L6j8/FVmiIpixmf1zAt1sOMD6EK0AEOyEUdue
	2zJXcxrLj0eYXzigVxM0xxEL0+ncArDUqVjEfGcUK/Ymqmxn/F0o/FBKBhgGeMmD
	bkoHcPLlPR2Ba2iRwkgHbbOPRXWl6v7NE7jfucHwgRBR8SXP2TJ2/e3kF+4SU9Lu
	gGysNQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5977ct6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 13:24:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33fc9b69218so1217486a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 05:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176259; x=1762781059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0bUAQePG1bGRaZhHjmNgnU7WKw1Px2yFxgVwokQWVU=;
        b=I2Fs9IUsB85hEv8p3/sbqT9VNUp7PB6R4/hbD0hj0PeMq6UOXmbUrI5EbI4CCQjFrV
         +x6JhCRlD/L5137qXY7QReIsStL9NvZmUQIs+T39gG/gjfxvKgnBDk06ZE3KahwmV9LW
         CpbQBO3b2uI5qIvfB8KOrCsGULBxIySfJ1QWpF0JzVzpuE2Ic/QHl3OWHfafTk1Bjv6o
         JHBTOI4YiWI4fRg/l13OVqnZ0OlfwghynxUnDSYW8T6RZDL+4zVipsPABH310YuF9krx
         H9IvEk+h6ST/6xsNw/ZRjiXIEZTKjhOIG/eUVkaof//E8P+MUQk8497Ou2kOaVgdVriY
         9Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176259; x=1762781059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0bUAQePG1bGRaZhHjmNgnU7WKw1Px2yFxgVwokQWVU=;
        b=eqJmkQy0QkTfejoQrQr+54ikDo0gZywVlCHYLGhpI6meFQkNPuN3vxOJlAf/pCgLKo
         uFlYevZYOTwVIr8x0CK2KrKlSGuDsncKLjxYxR2orIE6UbRBMUzDvRyc+uxdUfUuhvUx
         HXiOfZ3MdH/AEggiZIsVLDAw/CSEcaaAYtYgFGTjlH1OmOndYimtKcxuW/C9t4Mjn5ZR
         GWiNjvvGqSUdtuLJZiOJQa8Qw6DGTBHeOidjd3q7WyaYYVC+r5fPZJW83RNwmVESU8Ze
         NfT1+0w27JxwpzP3yoqM/nmYMO/SOfYlQY7/sUBFPijhu/8CGQdeIOhO+JFLiZ8YarSC
         VFLw==
X-Forwarded-Encrypted: i=1; AJvYcCW/14UG1gPB2SbuQiRfIzbWm9uLnNMxiB955z233rzzSRkAtMliiAGnZExpiBVlfKlrTNdhrK8UCwiBOe28@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAMm/9BMorOWNntIbW0+Hlq9/a+0sG0eYNmXkPINoC4ZQ7NhR
	Qu4RfvsdkkGlSz3GhWLKDcfan6mB0sk6yYXoidzHWYxYy11DjdGt5Z8u31oXyg1MvUJ2MZw/lK9
	+63jv1fP3lytH018U9sJz3BKCrXq12OY3IrMOyCBbonrO62qYUSp3G7mW39XsgK/8bz8T
X-Gm-Gg: ASbGncuJd3g3CHL7heA0P3CA8pC7vxt9mEJVd9tn/X1nDF8EI7w/MrcDtJAkEUXVJEt
	je4GXyz4zFBvWCtqwZRTS4ealGQ2jVNI/PjHSfzlLfios/g/Q9TkDcy9RSM0KCOHbSD5pBtRa8x
	1rcfuFB0Y3GmRH71Up2OKpHgHOBl1bJ3qcdIwgldAJxbSud2vq0QFz7JB6nu4xSRrGXgf/RDOyS
	fPKhXPYcj8qf9dEwDgW6xwhhQVy67r5jjRDUHqE5gtY82/jVg0YSsIiC3beuOEmfLIaQc4LlAf0
	fpvN0C/P+US4oTS3v7h1xV50WyJkPTGnaTVxbqDOSLDrz0TCiEdwsSS9wfc3pBxbXdZjaKOHpMt
	U86rk5WybqzPprpQAQ46Vkc36tsLf2X5rBgpaLbCqtgNyxxaicoqdqSen82c=
X-Received: by 2002:a17:90b:4d8a:b0:330:6ce2:18d5 with SMTP id 98e67ed59e1d1-3408309f105mr8891838a91.6.1762176258871;
        Mon, 03 Nov 2025 05:24:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyIW0BH20ElS3Fhbf25HVcEUlDUuxxvJCKXdoilo6wy+7B/fZedx4edNGgyTNwUTrV/xSiOQ==
X-Received: by 2002:a17:90b:4d8a:b0:330:6ce2:18d5 with SMTP id 98e67ed59e1d1-3408309f105mr8891817a91.6.1762176258343;
        Mon, 03 Nov 2025 05:24:18 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ec24330sm6614812a91.2.2025.11.03.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:24:18 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 05:24:05 -0800
Subject: [PATCH v4 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-av1d_stateful_v3-v4-1-33cc1eaa83f2@oss.qualcomm.com>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
In-Reply-To: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762176256; l=2547;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=SZrZjo2s0yDcGXFZCdWPCh5Pkm0hk0faJ9y/OoFuzs8=;
 b=xSuETWOuPoqI9D+MZWk5uNiBkn43qGqWDa3uSgo70INpcWRAUANQ3xtkRbzI+KII7cm+NG62e
 +94auhPzarMAsqe/rvCC/wce1tvZ0f2cwQxCKu8JtN8Xoda6Pq7iyYU
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: cNUyV9PvXjZAVP3dm3EQbVpSqCLpBP69
X-Proofpoint-ORIG-GUID: cNUyV9PvXjZAVP3dm3EQbVpSqCLpBP69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMSBTYWx0ZWRfX+0CcpiNsrrtU
 L2ry9itAyj1BpVygV5sqeHyfJLeTsgDwnUi7klgnUHf3Oy+pM75ZgunvF2VHMO1UoCK3980va5P
 qflkfIy+NFhhfRxiPzS1NXToJFLmur9qG2oFnYfhPPvmc33tExtrVj1hHBKrCg5fffCEGY5nTpW
 ft6NmWCBTD2RgXjaQ68MQIdsPFOpgvZO4MjcS/hapgzmQcM8nlfb6TS7sV1P99tfVUOnF10BeG6
 QJtD6Jk2s5z0c/gk/ju+CvPWjKUIB0f1IltFX1yfnePWH3KRbUj6qyASb6VNyNXENJw5G5JAWk3
 2BE3QmnycHU1kCJEqRC16g0GXt9rYiBopnWEubJkEPrQNTE2N63JfUzF5VAMKPZGRhxA6zssHCc
 0y6mBE1nB4c0tUr8/2te/dBmpSA0jw==
X-Authority-Analysis: v=2.4 cv=WcABqkhX c=1 sm=1 tr=0 ts=6908ad04 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030121

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -275,6 +275,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV01'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline. The decoder implements stateful video decoder and expects one
+        Temporal Unit per buffer from OBU-stream or AnnexB.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


