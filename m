Return-Path: <linux-arm-msm+bounces-85002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04854CB50FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D454E303A8DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C308F230BF6;
	Thu, 11 Dec 2025 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olOjqX+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCTwSFnR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0862D8DDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440497; cv=none; b=K8XmrlHd5Y3CcBP6z/vpwOnqD703i8nlpIGQ4V53XFmUGpQ2A/m2QHq3V0B8LAwCDSekl1Bi07OAdlK3oWVY65/IEXyIEoN4FOaUSUF/1I1SNYui9T8GstpowPT87D/5JdVu8Z3N4/6BIWCJB+9hCjEDRfXBiT5WT5FwMQwNbzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440497; c=relaxed/simple;
	bh=hLaP/rRnDWhv9osvquE39GRTiumvprN4V5xd/SF1WuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfmHPWEdb0Sj7Zyx6Q1G4zxBKVUx/3hugGBL6VsZ/ugk/Zu9uOlD/g9DwZH5yanY+L7QkjYdUH6HwWWdR3zr3oMBDqkqEpykltLPH6mO3/I1pMGKeVIK9liIu3lC/5GsAG83yGLRg3SAaTYO0kJ1VKCdSl8qy/ckV3Ogow0QTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olOjqX+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCTwSFnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB337Zi3683971
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImStdCUl9v/lFzBzrTEFzPiSnZ8dfVBQSUixUFSZIjM=; b=olOjqX+r6bn4F//n
	AWfj76fT19jbMwfdq+A4hP8QE/tCRgc93qRwIf/HHgM7/iUdBJH2sH2R/K4pePz7
	dEVaDzAO7x8AC9hmMA1ezPNxV+yROj+aiohkOYZYNkq+tktLL7fhlr5lHsAtyTrm
	1hh0leYAmnDdmjjHguA31I+SvWGLRdOwepVjuwZktg1VyUjge7X2u/YyFqAs/oDG
	8B9rtQ1xPUsJhj3rR0dTfaCUynhBx1e0aWSfFcHYieAiV12MK0tgqhvpIsx6EozX
	L0DvOVbiGIYJQC65jpKdO7MUJrki7HSFSqkXKfxVTuLF1GZLsf76nVTSwl1tWCTT
	ikpk5g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvrs49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa9f595688so1139328b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440495; x=1766045295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImStdCUl9v/lFzBzrTEFzPiSnZ8dfVBQSUixUFSZIjM=;
        b=CCTwSFnRuiTMiQ9HSZHK8VETZqPYe+apX9OFNvizn3EIDkFCE+aNRvdMhvvnlU0GXV
         B0ZQfrkPq/YIinMruTqjehh2bSgLYKjIIuYvqnBm8wHZCVd7usqx/g/9edmbLUQq85qA
         fF3UaqOUziC7K/c371SHHPaJgakxWtVSqhGYwMb/g1bKRn8ihCvuKMY6b+KklKWiISU6
         kyKIKIol3TtVIOvCIU46MUnUldpuXCsUdwQrFovYKBIMeSDeOx9QXvqOiUuOMlK7yexh
         MLAKFo61l36JfrRFC27yuXpX1LI0QTwwiRysrV9ZemWd/SzMtrtrf/99OvbJS9wkXj1g
         G1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440495; x=1766045295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImStdCUl9v/lFzBzrTEFzPiSnZ8dfVBQSUixUFSZIjM=;
        b=RsqMa4c8dejee4SVKZHDuX7/OCK5F1xpQUjyCPO3dDWq0bocta53oKhzw+oeyD1QfV
         SuK8dT5Z04/fO/ECgjOBDibdrPAg0t5SP6LRzAk9JnVpSnCvek/NvaFQJdi+h+1oWXRe
         csdKtP1PfinBRlDRNp3ibcDVKibyKBbgoO1ChUc32+f7EwKwRdOtJdMGNfu065xhzSfU
         8iZfiQnMaTZ7AdB9Vo9kP+pPw78ZiYk6kQk7omsiNoLbtGCV8ihwxSPbBpvaq6UgiTTi
         DGM+bIs90qVZUtASLaMkAUQN0xbvm9+BFPT2RbFO7bd8rwo8I7Pa+qMVjWropqE0HfmF
         S0tA==
X-Forwarded-Encrypted: i=1; AJvYcCVapNV11xIVUmC41PfID8a3oUOncg4x18WCRZiXNoEWBW5+yKhR7Hx33zNxXoyWpyb3nN917B2A0vEH/hDX@vger.kernel.org
X-Gm-Message-State: AOJu0YzGAFFtB7URJCVw0xTz7/OAPiiOXxul9+FH0df6yBfaF2hxzlBG
	SnBYDh4tvDr1RQk/Lil9PzJotJm+HWYXIXxgsJM5DRf7dsExFVJPIC54PlGmD2kMb8YNVJhTGUQ
	YIJ7Z7IV2l1hsftUZodHZgnD+iU4Ibv82EUcRKBBhj2TbPqjSmuXkqXs9wyuq/dyQaSI3mecNoR
	sJ
X-Gm-Gg: AY/fxX7Rn7TW76hmUnEGLneOzRx+ddz/2GfOUwaTDE+ywe08ICRqIkS+n7BA3iZaBUI
	KfS/miqKM493eo4jZEVscDitKqYkmZ3tW/q61XhCNdUdS/+ik8fuT9CgRo1l4yV3FntgY7ogsWI
	24QkXJkn0BZXAz0PNbAIf7J0R0SlwSK0Um0mNFK6bXkM3QdXnkLqJdwqTQGH46QltvfJJgSHUTl
	TjN9AVYGJyx6XYbFuLQGRslZtUOzbV2fOdlfuVoVZ2V1SeaPZW2kcJGe7YbDzI+R46edUcxNdR2
	tHFShg9wuzx5yXwqfylzgSlY2AydF11o4+S9DnPhInYYNJ1fv5S3UaS/WTp2l1Ydg8OIxcUvZj4
	/iBs6+QvzjtX3gb9Ys2s931ROXVGsNaKO4g==
X-Received: by 2002:a05:6a00:1a8d:b0:7b8:d607:41a3 with SMTP id d2e1a72fcca58-7f22dac06e5mr5622550b3a.13.1765440494733;
        Thu, 11 Dec 2025 00:08:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlrPwfKh3HROdgsMqlLzKbw9DtY9zM+Aqjuc41a9ui3a+yx6HrhJ4ykGZ3B3q0XkDcWNWOvg==
X-Received: by 2002:a05:6a00:1a8d:b0:7b8:d607:41a3 with SMTP id d2e1a72fcca58-7f22dac06e5mr5622527b3a.13.1765440494258;
        Thu, 11 Dec 2025 00:08:14 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:13 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:41 +0530
Subject: [PATCH 09/11] bus: mhi: host: Get total descriptor count
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-9-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX98TT494Sf6F5
 Z6M5eBvAVgfjptVuOGiQtpRKWP+a3HpYgSAyfRILWT44BH1tDv6U3v+rk5X7yimXxF46hP3rGzJ
 zXPlWtBFDJIwdmBLn3D1fHcm3OSlhTwSBza700QtEQlhpGvBOW7RJVPFrD0B22OQv+BJ61Xz4Rx
 r/xGWrKtQxbKHSxSJsU9+oRTW5Nx5L0FkGGdYut1bxp48/OXFa4Rf1LkRMUwYUdQhdwFMo399xZ
 yvN6698v6DrDGHLKAmyRBchbEv48hD1yiYoLyjb1l+W16lyan+xf9cULFzh69wnrYWFim7V/UuA
 g8x9aC1i/2h3XDw5S7kfHSYO+4su5mZPqq/MudHDizKnFylAMMDOK8CrbegAEzpRmE0WRfwjkqk
 Ds9JZnstG8ND3CTQpfSIaYUWyzSa1w==
X-Proofpoint-GUID: 7u90xTudJ3o_kTIqq-enyXTkYQnPK4h5
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a7bef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kBv2GRQmL64bnbioCYQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 7u90xTudJ3o_kTIqq-enyXTkYQnPK4h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Introduce a new API to retrieve the length of a transfer ring.
This API allows clients to query the ring length.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 11 +++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 9772fb13400c..6be15297829d 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -345,6 +345,17 @@ int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
 }
 EXPORT_SYMBOL_GPL(mhi_get_free_desc_count);
 
+int mhi_get_total_descriptors(struct mhi_device *mhi_dev,
+			      enum dma_data_direction dir)
+{
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
+				    mhi_dev->ul_chan : mhi_dev->dl_chan;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+
+	return tre_ring->elements;
+}
+EXPORT_SYMBOL(mhi_get_total_descriptors);
+
 void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 {
 	struct mhi_driver *mhi_drv;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 66fd83bed306..013bc2d82196 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -620,6 +620,15 @@ void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
 int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
 				enum dma_data_direction dir);
 
+/**
+ * mhi_get_total_descriptors - Get total transfer ring length
+ * Get # of TD available to queue buffers
+ * @mhi_dev: Device associated with the channels
+ * @dir: Direction of the channel
+ */
+int mhi_get_total_descriptors(struct mhi_device *mhi_dev,
+			      enum dma_data_direction dir);
+
 /**
  * mhi_prepare_for_power_up - Do pre-initialization before power up.
  *                            This is optional, call this before power up if

-- 
2.34.1


