Return-Path: <linux-arm-msm+bounces-84998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D563DCB50B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5D813001C0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7932D9496;
	Thu, 11 Dec 2025 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0X1IAP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kS+c6LQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D212D130C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440484; cv=none; b=tf/Tn1RR7dJ9aZqa2QoBBoC+LtxMTaFKMnSaix9vYMUFo7POlU3VdE2awzc2xl2GOqY3VEAfJ5E1L0K3HDCvExA302qd+9DLudPvcEhJR2JBQz3PS5KdWnjsj9XdlMypbUQrXEn3sjSUO80mbuWZn5PdWNcJT8HHGA7I/ea8cfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440484; c=relaxed/simple;
	bh=sVj3mprRNG6drvaDTMIVs+xqjZm0zjQKaIX4lbi1mc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLTXIgbYrlAo6mJDJMZdTiNYChXHS6Vld5Qze9FJxScrCXjdsPL3iKqXHSijYilYLQLZbnr63cCOyTYTXnglUnwHroT9UMN/gsJw4tpRjeugGZdJX9ojVe/YGkLAPoY3yQtQcSJPGOoZ7HMpYTJdgKApd57v0q6UJMmiAhdTnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0X1IAP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kS+c6LQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSwNC3206751
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nh63pXsne4HVRwlvGklgIqjuPdur2YImFX+N/fXhtUs=; b=o0X1IAP94WVfXO7r
	sgiVEYZhh5uhyZxVsmZ4BNLhyym4Wfx3xMz1vRa06QCZqHcfYzVrkiXsp7tCBtDg
	eiWQusTj+MMqA0MB0UJWYGIyv3CBi3SB3zf+cBuxfkXZ3eq/svrrJkJvaAVt54UL
	kSrvKgLYwI7kkoD9o6x+FsQs59jjaP0xrQckqP7l0zgM2LW24Lys6L+iMCgaO0BJ
	0RV4x9pzsOnuPSjRGEhcpYabq/fxOCCmfHWjP05F/RHWzbcZzw+e3FDG7PnFnWlq
	VtJ8oJyA9zBdjShk0gmUhNrXQZ60qeXuidlIyMWsWM2mrloW70+MvbCoFlpKL8KR
	yi47Ng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygrx1jxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so850428b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440480; x=1766045280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh63pXsne4HVRwlvGklgIqjuPdur2YImFX+N/fXhtUs=;
        b=kS+c6LQYFjU8AKUQ27uCXRICAwwCGke4Yc88yViar2Xv4wr51zAkxBCL0Chy9+3Eq2
         pYyHchsm5yY355ZET18yNg/rxNNzW5ElHVal9URuDoqlfSsfTGdxf5Bz8AAkANj6+nLJ
         CGBF1imO7nHTpiRcjNnBZqbUZBTUgwK2iaesufMhmHToLCNvME2DsjWnu3KafjTxsw35
         OBDQDPvaMAMi7MjC7PghnUOXoub8MHjPsQM/7OETXXBQWJS+gmD1zJ9Ws0xkKYxI3iRX
         gAHquyFYqAjsfswxa6cZTHWf7ZjV2V0i+axbJyNMjls+KFd5A3KygatAvUxv/jbWWwDt
         KnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440480; x=1766045280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nh63pXsne4HVRwlvGklgIqjuPdur2YImFX+N/fXhtUs=;
        b=Ej9b0e4ofh7U0FECwGy/kloFmnk5JX6CTQU4adfpe7b19lrvBs0MLu0BZcTFh/PMUS
         QT7/WJiORj6nQGGMEYYSaHkIk+pA/13ZWgk9BI6iT1Vk91C0bkqB1kYItkQbqAr2SuJp
         ljp0uBabS/NzMlcGzuy+4E4JE85YYYiCSlcCyFry/OPMd7CmFbSYMZoEQf9XmdfFd1lG
         0TM1aLVYW6it6pvQxtjm9s00ndYSZhR2jkHG2ATlwnbIGmKgmTOF8izEKzU9zF/QcDci
         m9gRlvc/MRxJbt0/NlayMKx0Ya1tJ0HyzvOyMiY8Wma36R0AAtp/K/5wh2MzuOr3hVh0
         hoDA==
X-Forwarded-Encrypted: i=1; AJvYcCUkdLkiC19/hZVBUSpWbRHWi4S+fYSWWAloFUPQEUq2SjG99l5Z75Gh+Nnv2ipfKb4Pr11Um1qFhv+ZVT+s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe1H9vX9xcJn8Y+QiXil46H2BjnL0eqN27CBn9KK1+RB4lPaho
	w3UNXyKjRUvSqBr4pXkkNmzgB3GT0hnPio1Qi2dF58qEzqYJObj9auMmh8VHpoi2+gJ3tixxDM8
	I0VXRXZqt9HUIrLkcZgNe/A2Wpy9gXvkBs8V7rHXZqcRNOYmfkXFGwDSvzBhKBg6bxfXy
X-Gm-Gg: AY/fxX5vmnK3m4H2vKsybtoTVbWV59qG0ams1o5uwQbrzOBz/1WkcmbqR/RH7l3oESw
	Rl7F7PQKKgpA62J8ZspFE+loNdml86Q5hZ4lcxZy3np1QaShhb962AoYczQ46+0n0UAKgTzS4SG
	Ozh7XVGgQ62Nh8keqwM6DXgu8HclFikI4BsMkoNG9JOZH1ON36AzTcUG09naqEETk8TgJH79ZJD
	lQuZMhv6rq+e5FWPwk/y903MbaOZtCNWNFTUMxYMe0lFE4XQyXqSy0kKqn41KjC43XWxcSb38lN
	YByLI+5BSegh4qObg6dU5rdUodNAsIeI6YJNuErcTKtDm234BzhyI061SBdD36cY1+n90mNRHCU
	0ijMveCPCw0UGg2wj6yANqBZaAC/xeMG1CQ==
X-Received: by 2002:a05:6a20:7291:b0:361:63eb:d024 with SMTP id adf61e73a8af0-366e170d283mr5379578637.23.1765440480323;
        Thu, 11 Dec 2025 00:08:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0fZlDZez9eqWc3Zg/NtCewKDhLdcD4B6soIfEw6sCVczIqjxToXsJ9htwhWz+y8n4ik6TLQ==
X-Received: by 2002:a05:6a20:7291:b0:361:63eb:d024 with SMTP id adf61e73a8af0-366e170d283mr5379548637.23.1765440479836;
        Thu, 11 Dec 2025 00:07:59 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:59 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:37 +0530
Subject: [PATCH 05/11] bus: mhi: host: Add support for both DL and Ul chan
 for poll
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-5-d2895c4ec73a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=693a7be1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RzC6bOiaW50bpgbzjqkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 36IRhCpwxnYps2q_jb5F6hn5mDoBVlcI
X-Proofpoint-ORIG-GUID: 36IRhCpwxnYps2q_jb5F6hn5mDoBVlcI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX7UJlkjl9iuv2
 2XVcahzIquPEs/6OOwNbKKzqGh+R7qXCye0R1bVH4ldATfSrzKlPVQ1LqonoHILlWbdpYNcO2u+
 fPlD8LpvR8pxQypHj2AyBwR3fFr705FL7flX+rNOPh/QaX4W2veHwLkAaQc/EgsYdi+CndHeLlL
 V92X/YpaGPqAnY3NDBV8IgRuc/xFkVuyCfJ+MdfMDmW1iM19nvv+Uk5X5aiih9Spqa2h4bxl9GY
 jUZveU07knn8h7+X1IU2+MvTyCci8tXH5bWG+dQO/kH0+8kYK/9tKO57inHHsmrOcjH8ZbDGTtY
 Nehu+6yAjTbG7KFAZenxSFAGUYttXNx+KzHHV3HmAegeE8kw2rxa/Ada7SO86jfXw/ET29+9yaF
 lci833EK06ZxK3FMqyhZK90JvRA7vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add support for both DL and Ul chan in mhi_poll.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 4 ++--
 include/linux/mhi.h         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 5d50f6ebf6f9..53bb93da4017 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1859,10 +1859,10 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
 
-int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget, enum dma_data_direction dir)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
-	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan : mhi_dev->dl_chan;
 	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
 	int ret;
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 360770ddef70..299216b5e4de 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -780,8 +780,9 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
  * mhi_poll - Poll for any available data in DL direction
  * @mhi_dev: Device associated with the channels
  * @budget: # of events to process
+ * @dir: Set direction whether for DMA_TO_DVICE or DMA_FROM_DEVICE
  */
-int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget, enum dma_data_direction dir);
 
 /**
  * mhi_queue_buf - Send or receive raw buffers from client device over MHI

-- 
2.34.1


