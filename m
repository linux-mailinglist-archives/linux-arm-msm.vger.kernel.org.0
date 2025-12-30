Return-Path: <linux-arm-msm+bounces-86916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02BCE8CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21F403017858
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B72F60D1;
	Tue, 30 Dec 2025 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQGxbrp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiZIGUBk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB272EB876
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076129; cv=none; b=oEoSmVLVRpM8EakUPYrOwvW31fUfwVFS9c4dkLBh+0scqp5YDOOjD9tsl3X8kuxFD5LlcQADF7vu0eSqtnBhTVouZHsEERDyl3/bQdrDLpuryNjYNOCwV4+tYiuHytt5P3xIB9Zzrky+gUY9h83cOcHn7QuV/g5Yrox5isQAuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076129; c=relaxed/simple;
	bh=F/9sfTN7nfDZ5Dx3C25HfKYIewR5jxcQ5l9BIf35o/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UVEPEriXPQ7ltMeV9JWHA2XTA3LytG7j07QrQQDI9Xir3I8x1+7kZ+KfodkOOgPDX8ygJl4jiBhFiRkWfY3fx66eGLzPkHJLOlHGD29m9WOREVU7fAXAd9Xux54rHfx2VVzYUOn/f6oLETnQQk3DsfAFmKAh7eb5dgv2AcZnVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQGxbrp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiZIGUBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU545p43539553
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6T5aBckh0Dl
	dCBnlx57e6ydV3fyOJ05veUQnGzWVFO0=; b=aQGxbrp65iZCXljc1vAhXHjTo2o
	gEcN+fgWSQZNiUk7xonF5nAzcBBR8oXO9iVxoptjwPvv5qzNlE5oUSJEqpRBHk3U
	5YY57RULM0ZmV8hSUxj3UaB/wLPsA6Ak8tY6IzP7eAl1BcoAhnGhJHq7D/w2xwWo
	OIPOQlTNVSoqL17MZGasU5fMt7767O9pDwQ0IMZ+nri4RJH1RfFBcCbM2Ktt/Lz+
	D8K5XFhcP21iEu2Y0DZB/K1z3iIlfRWMeIFXy9+1sn60WRmNhXhLo/uop88vKLQo
	no2Rdo80ybORFYuvQikmQGsAuldt1oCGqH1x05NesSzSriiBhJ9ja0YTPDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yg5kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34aa6655510so12049434a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767076127; x=1767680927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T5aBckh0DldCBnlx57e6ydV3fyOJ05veUQnGzWVFO0=;
        b=aiZIGUBk8bWYdcHF1bxz1Sek6EZvDHYjoG50UX8CqPA4BtrRpSjMuApht63TamAL2d
         HJGUCrGkaJujp3uYJurgRkzTtXLHMWC6rm9rqAlAsAfbRcKdZe1b/H8iemvfB17w04yw
         /+E0vnZCMIwuBmqP3x/SRvIvEWMLFd/QyFLE0u84pDtOw8HdKD4Ly17vYeZaeCiyL9Wj
         qyrtvu1jjPFasF0g5+k6ogBVz5HMDO2OS/D5+hJaE2lUJd2B6MbwLz0UaiBNWofnMnC8
         X3ZbS8CTjkmVzHYIhelj18cA0/u0dwowgkpO3PGEynD4disyhihTG9W5ATJdQQ0TXgaz
         QGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767076127; x=1767680927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6T5aBckh0DldCBnlx57e6ydV3fyOJ05veUQnGzWVFO0=;
        b=mKKHNpr/VDVOH5Qlf5HWCIBP5E6gmSwlry7oqxY1xdVCpegMmcrwQVMlERFnJ08nPl
         qeMmWy7aviaMxL351HbHY75yxPz0nfvQV7eDp01eNeG1cXDA5BagaxpvrJIN3u3bVgJl
         9TxIAVrDhp3VIq0AChucf7HZPldSWOW7KBkHC5zMCGmGjI4XJhX7LCUuc5DF+LdJ1PwZ
         9bfgb0Vnwn/7HFCAlWXe50HaYSgJqIrXfE3kHDeNh91jk1+qv93ZKHOIqf82uMvJhX3y
         cBGsBZEm3wDLQs5Ca9tphhWm+rseHgWl8vTC1b2PhO+Qc/HtkID0Q059tAhkVkDdNu60
         tvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxfKPcxaHTQJTVFNkDNsW3zdIyjCGvwfsLSO5NBiV2iFwjZurDG6BMUGp+N2wjo7Zlio98fT+WIaedEnOz@vger.kernel.org
X-Gm-Message-State: AOJu0YxwLNRht0pNRnaCuUsJH28PucGDJqu5cztOH31MGm4kdDOxzeE5
	MQurZiJB5iuSZ1dDAIrbdL6hjQMH86E5OCGXZTmQtdQbRQtZ6kFzhjwIGpxJPfMFJSUsxWHx2lf
	lodOUo5VumoTOkhTQeAxhbn+xKdDHwtyxi0FeyfhlldBN2wN2zwT+dyRil5+4CTU0lCvN
X-Gm-Gg: AY/fxX6PsqQe6LwTtTWO7lI7vh9cQTwj/j8QorzSfwPFUgjPu1gX+eKnKUVOgI7n4ze
	xpKu6HoaMqcVt2DU5o0s1WRP8J4hvvi6qjnO0YOahZ9jgunSuwy3WAoGaIlcfGDxElwM15vmw/5
	wyVGtB25dK3uSsAyxRyAOySpUsGCFM6wmL3jdAHgGr5RHN/yEyITikAgd6r8gcKNMgN8t4CGWgJ
	GBRrFkQvcwpFVlXV2kZFElwj3vqPBb5i26VjmzSAB+SwulyFxukeYrFQler+Pzhgs7HgHxO/SJ7
	nohcYrviCZIBzspuyRFoUVedQmOUCaIVVeSduTH1EcspwTgozPNnpKR2qnJJa+9vxF05spVuyzR
	2XirNST83MZDCfJQVF5xQyI+XYgoylWZCuVgNpqVyXA==
X-Received: by 2002:a17:90b:1e53:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-34e921e9ca9mr26762811a91.33.1767076126766;
        Mon, 29 Dec 2025 22:28:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRMe+2U/aiLSBzMsqrv/IRia8jR6gfLlAnG9kGH+caVyUtzCdyEPfhIhk0zzI4GLOuzMmuXA==
X-Received: by 2002:a17:90b:1e53:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-34e921e9ca9mr26762793a91.33.1767076126283;
        Mon, 29 Dec 2025 22:28:46 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:28:46 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Tue, 30 Dec 2025 11:58:30 +0530
Message-Id: <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953711f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ou9iVbgrfxuWbo8UQ_4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: DtjwA0QovVp2QGGN5jo_elW_-cFtmUjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX/naxhVqbX4Jq
 MpSWZzyd+yszItYskjH/VCGqtc/rlZfk96nQefTY07FZZ5dn1MQ8Ojp49zQTb+5+hAQ7Uy4bMvx
 A4bquG6Eo0yizmjQPnoJOzNHDkmkftemir9sOfJQhIpGEID4rP/cuYU/JORkU5Jia/Mtm9/hngE
 3CdvZtLXQ8fhVuCmtyhFe9DZil//Az3RWWQVQ8NMbn6auC+kgxxPr2CO+PHy1JjDsWyR177BbqO
 V8lw7RvH4Bbs/aZfMYEATVZBpdMvUMmBbOrp5HUId9QNMxIXMMz+E4kNBeaMKV79zOTEKGVz7G/
 j6TaCX2ooty1+xOsLey1lwVSHI9sDKvE1po98lmyE7DTi86rtEGtaSphPk+iuU++iE78F+Ro/MI
 WlNgqSyQRWsd7RkGqBBwhmPlHNX+5W7ELRGnA2Jc8kY25SL+czpfRmJbCap1ijZeNcqIeAbzKOL
 dVAztB7OwiUQtQylewg==
X-Proofpoint-GUID: DtjwA0QovVp2QGGN5jo_elW_-cFtmUjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300057

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f7fb44a8e9c0..222ff15e04bd 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1


