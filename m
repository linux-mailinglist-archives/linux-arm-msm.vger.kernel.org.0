Return-Path: <linux-arm-msm+bounces-81091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D16C484DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78A024EF65E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6839129C351;
	Mon, 10 Nov 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtT0D/fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm+R8jzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197D29BD8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795270; cv=none; b=hU0abx8y1uPfnUZFPaPLDi7sllcnhXmz7ARtpzf8XHLxbTIn0eF2W7Daq+l2YBdCCpPJdz1LimuodGvj+aHc5NfnEHH657cI5wXHr0BZGjwmSg4iDeCYHo8zfEshR/G30NeHHJjNtYal/ZBqGlRpXt7FR876hIYDgH1Zo3HINtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795270; c=relaxed/simple;
	bh=qhbIdRggLRpMFNEU5UvyclByRdCjN29zV1MHtYRB1EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DiqwgDljqPIk9xJLdeZWW4wvcsYXSTGR4driEFhkO748lOs9XTnyiAVvyTjZOjJBldBwYgc0d8R3rxzu+1nVnWeO70cRaihW7fUuiDYjRhr72FKDwnilk3FoVsoTNbipuUrbMpaITJSGJgECHm/+z9XtiWtrBUFH/Moi+ppL63g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtT0D/fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm+R8jzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGg5pP2992499
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckeiWHbZKEbeCpeB1+Xf6e7Acf5TIweUwRV6O7fxvMM=; b=BtT0D/fgnrRrPOIA
	zr/G++1yZOh71VUCOF4eIUqdCIj6Nl3BjeLEWpydbdB/xzsoTkbqcm0CoghvHefr
	vvM1wgUDpqSRNPA2B+HrOodsRQtpTnrbAYzCzxy4YjD8tW9mZlv52QhR8w5deKwX
	zIHONV5OVZtx/sQA4BGrQ3J0oF/42A8knx8iJ71Lu0MWdnzK3cATWT7ACWYkBQpk
	zU9tArshmjcei10qEQkMwy6T7e82BwMlzjdIPd0Si7MxS4vO+91wYbD794kb3m04
	sJyk0msH7vkC1mA6DgwL3Bt3knSkaOgEdBDA6PXfDuZQA7sxEEnez4ZMksTOZgDv
	+Ps1Fg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88sffc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b58b08b70cso125604b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762795267; x=1763400067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckeiWHbZKEbeCpeB1+Xf6e7Acf5TIweUwRV6O7fxvMM=;
        b=cm+R8jzWzINAkPDWlBU/QzhuEvQ5JwHlNnNGYhGVf4Rq/QbUqPyKJbbeKRZ0Hih10F
         2o1rfrfcgAfydrflVDb1iLSFVwc70bFIqMcqmqnidYdI9WIyxGLsSdvWPqeqaucN1jWa
         D8Rr0mVew6iFsCPvoTV1E6IPw5xs/u+QimTDtpoMfx2Lm3PaXvIcXeslWKiipjfWj8ms
         4RLzaem8T3QMA0AJvSXzAKVBXTozmQqifIFBUbwOqJlpk+LfqUcrthArU1KWS5Ty/lry
         rcnPX3yzxejwHvM54K+H2pD84XJbJps43tBR69In+2JSY6ZfK3JPpf95f2+CJH7SxGVZ
         HLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795267; x=1763400067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ckeiWHbZKEbeCpeB1+Xf6e7Acf5TIweUwRV6O7fxvMM=;
        b=Z7v1SJltSn0bqDJ6aQe20YQM1nylswBomv1GeEmEfkUXMIfTcH153/WUnEC5yT6CkR
         Mk3uaafxwe+jnRopvnO6qL1Jxs/cE9wLrPTw3PgFC4DxeYkO+lL9Ijs1ZKaxYy7EZt4D
         dBuAQTfU2XgrPOpD8ThgoW5pa1mYcjjAcXSBmKomiqFLUFXVtxGiqmH1wh/km9WSHW4A
         iM1KyJDNg72JuoBktmb20dW80yOLXOujyz2N+rrJgueDlAr0lVJ/PDkAKhwxDOFdIwOx
         YOt0zwXbNmeUanCVcK4e3y8xHxwrHnv0zH0DlLJl4jLiLRtWwdpU16gQ1zOfoSU863ii
         dDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKOS8AKXUMG5gT3MoTnNvkdyk9rdgUio2SwE9Iv6v3zwDDoZAgBqTDtMjEcNHnvEi+ugRWZNW5e3LEcxt4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28smikiq85x6+iQ9TYv6QEaorYjyaTJPNwL7UzVmk/57UmUEA
	t3ccvAOxIJ4BdpOs8M5kPDiqdnfilJu1z57BTyVnppm/SjLz3pT9OHaA+udRoXX5SbsTg6bpsy7
	rVRaSM9ee+80O7GZun5DwXxtaRAjGYKmrcdocgq3Yk+9blZedy7AplVhpki40UYnlTuba
X-Gm-Gg: ASbGncu2+CF2Sf2a6CzTDSrsZgnTeXdepQ1S5PK59j3p7U+zLZVSRiZj/zQCMDGfyta
	L4xaQO64TeHmAf0PeRgIlXPwpi0nYJJM5n/SxHaumaSIIjgV3u2135qa4SjKEzYnrVzV+UxTbSm
	DzCm/5wk/gdPSlfp97YFOxkIEWGAufBTfSflAMnzuQsLz1glMJq8KjBTpyCg9M/5QNpZpsXz2Cy
	ucXa/RGtgMS10PytOt4963WTy7IdIIrozYHsbFBE6jX3Tpq5EN5MVa5G/YWRz9XyruBO1Ab3/kC
	0tc3PsUwCTk1zwwqm8kVcruwmrgTvnnLhB5YgYMW2ECWVRvKuqFIGO/0q5BeoDWWlvE4TdIBbLy
	PdYieMja14dLmtCPK05e8v7VdE5cm1CQW22GdkpEJxUUtAKdUIYPktNcFlX0=
X-Received: by 2002:a05:6a00:a0e:b0:7ab:4c7e:a9db with SMTP id d2e1a72fcca58-7b61d282dfamr136295b3a.4.1762795266443;
        Mon, 10 Nov 2025 09:21:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEELUiMijyxZMN4E92SLkBrNPzgtUVRyR0hamAnPatOCyPCqUcuZTxdqcpVzOgQ5TviKL+IA==
X-Received: by 2002:a05:6a00:a0e:b0:7ab:4c7e:a9db with SMTP id d2e1a72fcca58-7b61d282dfamr136266b3a.4.1762795265746;
        Mon, 10 Nov 2025 09:21:05 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm12643064b3a.47.2025.11.10.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:21:05 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 09:20:57 -0800
Subject: [PATCH v7 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-av1d_stateful_v3-v7-1-9913a15339ce@oss.qualcomm.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
In-Reply-To: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762795261; l=2542;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qhbIdRggLRpMFNEU5UvyclByRdCjN29zV1MHtYRB1EY=;
 b=xOqrKV91ytxWmgJqtpfHpKoOWMa38A4VgDc7frjOF2yze69NXKkTlo37lp2Df6pyduvEQ2hQ9
 F4HrTDQ8TTABgIO5b4z//KijYvp2FEgjwmnmHiJBm1ULir6uf3L3kVd
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: bRGIetuUaVPNtLq3Whv3_Z2ohq1Gd_ka
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69121f03 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0NyBTYWx0ZWRfX31ohhkVWsgcM
 dDzuoQMbsKZmhKovbDjo63D1NX07JRAWpoJWkoZ+zaLlZEbpKqT6afiGbt3Bken3KkEjQd9GlKB
 mTtPqJQrx4STWB1Oact9t+1cm96gkIHr4WmoEMVlrdz1tO+bqa7eFSCgZ1gLmvo+z76J0C3UD3C
 JCypUbSo31UGjcw7X6DG7H1WR6OFdGtiCsF+QUixzcN98yF+M01WyKcTO+MO847BlR+EPQHT6mG
 /7+PTOZJ+dtjF/pSOjWrANoZft+PRzx9OrQxXc74P/rkRSjfURWbsb/RMIQQsDvj3Ftl+s245td
 BECBYSYfb/VHPSVRpEd4jQ4aluOewDhC14z8CDw0MRA+vDTer9IkuQtNsbwpv+xpNJKA2FlkvQ8
 Afj2d0R0cYIAqczr7CVQQHIoErpVGw==
X-Proofpoint-ORIG-GUID: bRGIetuUaVPNtLq3Whv3_Z2ohq1Gd_ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100147

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
index c7efb0465db6480fe35be8557728c196e0e530f4..235f955d3cd5cfc83b0d3d424e6625b14c07266c 100644
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
+        temporal unit per buffer in OBU stream format.
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


