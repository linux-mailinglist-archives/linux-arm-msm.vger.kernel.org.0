Return-Path: <linux-arm-msm+bounces-19420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FE8BED64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 21:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA731F22D1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 19:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712862101BC;
	Tue,  7 May 2024 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="omVFBCgl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F831C0DC7;
	Tue,  7 May 2024 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111525; cv=none; b=NEEbqIxZHsuGKdhveccIuSYS3t8wEUHEIUCVmZogPKSDDjUjwsCxoPJBfL4nSdNXTdb0qLYjrBpu5GvymxHEcXcZhq8GtE8K/2mx5nhX1PUP8oc5sp6SxOYZEZjG8i5RM2Ak62Dbdl5lGJ7QSwiiuP6JKmdCSYKhmeVDkhaU/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111525; c=relaxed/simple;
	bh=aohF1H5It4rN8CPl810oOMZyUSRQ4J8V9uxQDlYzYv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9mAQ9UvZNz2km/0Q3FoQNtGz8TbbDxakGEe9Jd6yh+4gObDp6D+b6Q05hzREioIWF5NsIVfNePHRQFDVFdg7cf80z/QbnvGMcZ50Es8vwm3KAXWLOCQtJ69adZ3yXx1Tq0DiZcMjxIdSPPwpvT+M9NJuYs6dY/4vei5YlBZ/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=omVFBCgl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447IgtMA007644;
	Tue, 7 May 2024 19:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=kgKTXHdqvQUPjTSXivSj
	9cZvpgdEpKIF8Fx5Er4rXp8=; b=omVFBCgloj8UVeZ7oeyzbeeBa1A5G4+ON2YX
	DzLs2cj57SKVQ6yzTQZ0EWdoiX5jm6GDHytq9lsNCCly5qNqGbadYZCQWOwIhHzx
	pSDpOuJ6lxHZrM0skz/FgxtMS8fEVaucdaK4C3sI+7sGUcmExGuQN1oIuvJgYjbW
	cF+0V0+i4zbHth7s1OWCm+YZhKe2cddg/4SBc/E49xR/QwTYPEq5hliblYA7sfcr
	1LgIcdezujrIAdc7kbTtZZT/TP9LGdAMEx+u2mREq9hv8zVbRAqPEkCLlje3MTGe
	ZXCy5CiOAsvar78HZ1w8zmAeirc+wtcRL6z6vDgmfzLQvvq+7A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyste03yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447Jpcvt008972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:38 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 12:51:37 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v21 37/39] ASoC: usb: Rediscover USB SND devices on USB port add
Date: Tue, 7 May 2024 12:51:14 -0700
Message-ID: <20240507195116.9464-38-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507195116.9464-1-quic_wcheng@quicinc.com>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yLJsMRKXDOWWQM2Li6pzngmsw99cjyDX
X-Proofpoint-ORIG-GUID: yLJsMRKXDOWWQM2Li6pzngmsw99cjyDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405070138

In case the USB backend device has not been initialized/probed, USB SND
device connections can still occur.  When the USB backend is eventually
made available, previous USB SND device connections are not communicated to
the USB backend.  Call snd_usb_rediscover_devices() to generate the connect
callbacks for all USB SND devices connected.  This will allow for the USB
backend to be updated with the current set of devices available.

The chip array entries are all populated and removed while under the
register_mutex, so going over potential race conditions:

Thread#1:
  q6usb_component_probe()
    --> snd_soc_usb_add_port()
      --> snd_usb_rediscover_devices()
        --> mutex_lock(register_mutex)

Thread#2
  --> usb_audio_disconnect()
    --> mutex_lock(register_mutex)

So either thread#1 or thread#2 will complete first.  If

Thread#1 completes before thread#2:
  SOC USB will notify DPCM backend of the device connection.  Shortly
  after, once thread#2 runs, we will get a disconnect event for the
  connected device.

Thread#2 completes before thread#1:
  Then during snd_usb_rediscover_devices() it won't notify of any
  connection for that particular chip index.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/soc-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index a64bfbd91bf3..457c71d2bbd0 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -584,6 +584,8 @@ int snd_soc_usb_add_port(struct snd_soc_usb *usb)
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);

