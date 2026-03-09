Return-Path: <linux-arm-msm+bounces-96396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF8cI5VTr2m/UAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:11:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C8242972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0116F31C4881
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20364279F4;
	Mon,  9 Mar 2026 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnmPJzaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjDTeJsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459742668F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097566; cv=none; b=Ny2uwp1IXHRSOlFw/M1I5wuyNnNyjkbJ3EpasCExl8cbujjZlPBQCq6WMLdCjkmYpApm4EaN8MqJlLP/YW1RfVd/24RzgKBsKlFujs+acFPBylCgbr9nOOEDTu7i87iCLSqRBjqxDbZ1bcsBuAgXmiozlvi/wEUIEqCFDvh6jLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097566; c=relaxed/simple;
	bh=Y5kmOc/Td+3kz/MbZfYNPyjwrYkMruVLbGOtRAiAKz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t66S0QPcXiQGZRjv4aE5vjJPobt3Kx1tYdGVkvSasQVWMkWN0+F/g3yCT3GkycZ0gI3DBfkyHnV+q4e5LANUtAtrdRFa3yXeyBAdKkGWNu/W55QrwUIG5g0rRQ4ZKGiNe/mWNHnZlbCdRJXTL3I5ktk+XmDDxem3fvp/Exr7RV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnmPJzaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjDTeJsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBn4f1203506
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 23:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+8grnDyx3a
	Y04II25yHs+DhlQHwGyE329UXeTulGfo=; b=EnmPJzaXDKfHbBKit2i6OzOm42b
	lS7sFWuQdyT6nOJsixiASHIu6RV+GBs7xstRQSxbPvjcChqJJ9XpdtxtEefvRUJ0
	/vzUYoWy6seDLrKnbfnBzBZ7VHyqTEwYNlJxSa42KZQ35lhO+qqrwgr0MhgF2v2u
	XIUOlYcxN0l/SiTaVR+/4vyGrXSRUNY4xGr02/UBTsA/bgKRuSiv0R0QaNzhBiq4
	c9maWi3bGH5wkaI4/sbRIvQcfqVK9l5BSHbTV8yOOhJoz5OsXsJifEfv9WwX4F3p
	jdImAMabQQwyG3m/dV4KrPkxvDG2ukxU3wSswURC0mqLM6NZKINavIDuW5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329n4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 23:06:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so1438857085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097563; x=1773702363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=HjDTeJszeb9Q3Zwb8jX/rHo/6iVYdGgz+RFLTkKOiy9ET/j6T4mtZ3sJjfgYExcHPM
         S0XbQmXwK5M4LXvWbjKxqA2hqVWat/67xWaVKTOBTyLS0jQWg8TAAOTF5v5x+2ZBt73R
         9CCKauRusnnGy5Z1w07WkGCB3G8fnQTlWKO9Jb4Cs2b9/Mii6N3BaDeBCz6MxDz9PknP
         6/BCgC5yEYaht2N+ILHB9Zx14lhnGp+sT5uPNWtqhv/C53/BFgAXKUKp5dJhiMw+vzbV
         XkE0B9dWYgWMIQSf94mvtlHDav+x3sRAoJBiCjlpAMZjjOqHbG64m7naa7GojNECgjs8
         xF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097563; x=1773702363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=Rwa1ags0HqH6YVr35rTcpyWxhP2jlSPHUJq7p71xxttdpw4il/wwFUwLVxV6Dxwg9D
         9sIfSFXRtDxeluNQX3o8S3IJ/RahMbZiJ41D3to15myNf3afx07QoaPeh/G+OJpkNWQs
         xDkTIOP3zi2ZPSDqJ7VT70xMBJ25mAtGHbLM0126KadHQYvrO4a95ezhT2AWSiPw+PwO
         rJXUF94poFgbrOLInCacbjlhz/m6Xvhz83RbDPKTO8U5O5ZyGIpeo7Nv5TRI36dDdcgs
         wcLRENwfWRxbBSt3GAYdYc3Io7Iiz2RVqIUPe61MAEWQLCtOLsM+F/jdZjoDP6sVvkmc
         k97w==
X-Forwarded-Encrypted: i=1; AJvYcCX7ceN9oeNCL23/zW9LoA0sy+abWn7jmkVTNgI7kHaPmblyjq2tEgbpRMNwu2b79xT0k6cS+QloTwxUMgdA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LD98VqtyTJoSJzK9qcUgRRvCNJ19LAhesve7UiGhs5/SHxYT
	2+PxUX57FwBpScdzCrQaGTz8AGkjYtFd3cSL7XqseLIKSNOrximDcYz6gwWQ0TPwA11d+I5axjl
	ZNI8PTHUUPEgIFoHrPM2cNFVLNQBCO5G8XFFmh5tIFLrX8UnHPWixpVysexNroLlhjUeH
X-Gm-Gg: ATEYQzyUi5KjdSea4U2w+eo99pYCvzXVLPswb5aXyaED+3w8aGWgn6fdwhaLv6/MlX0
	O64B4ZTtzSK87619afwxN8PvEg7yt7u1N9saqoARpDkPXfOCIlPYxNQiNkLW9V7o5VpkfJHpneI
	6Ybmyv8u6RXNZzz3p7pCilRoGX0OaIAVC7vpwWYK/FF84lVTU52JZiYhzjf5LGZ1cllO7zcuOya
	y0jVKqS7B+u54KhSwmh7Kp1VmiQjT4Ay5GpWI05i5FAp4G0U2PIDgByGsweMef+WneofjKyeLdV
	++DYAp+qZsrU3husIt1edze/RbvQIcRgBOJ1t4/qtl6Ojlaz1LI1S97lOk35/cqb6bAFDvh7ncn
	dKYvKOGPH5qijHyXy6no4SJGGVyps6wakcArr9uDN7w2ct+06fw==
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568428485a.2.1773097562701;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568423485a.2.1773097562240;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:01 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:36 +0100
Message-ID: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX65ciXZKaKqQZ
 eGCrM4VH4uISHiUYhJJYLZEdzO9/LaIgTSLCXzT99+oWWWPddPbbPNrK8CIBjb4rYlwGO9RX/l/
 uOEVl9Gu+CNHWlyLZ4m8qIGmhiy/5JOHmqSRbPFiAEd22yIzusUTVbwuKNFPcIcNIzMSwnw/UOI
 kVtz1k3w56zRVrOzHBpJUBGzfg06QMmZVUB81E0Xyz+6+QynQBH4qW9FYZDx1zRg/GkbysPPRPu
 6GRTHpyVxo3AegULuXCQmdqKVZOjG4qYxADNXxtHw/64zWgRdOU9aQFG3pS/goes+7l/UhWMSFC
 4fPJcSHpW4M9avRsx4osQOws0upwbMqtK7f/M3Ns1SlbrDxHoMWvCO7ufiwhxwdXBdWyBOicYMY
 734B3ceGrBbc6cNKMuRB25p26U+dgGTBM5NU+XY80CXWo8mpUpK+ePQ3e+4Y1z7FtDvgW2xAn+e
 OMHRSHrElKO0eAkLJEA==
X-Proofpoint-ORIG-GUID: hcnFpTHozYRGKhJCpck0HXgO3A9ASXWV
X-Proofpoint-GUID: hcnFpTHozYRGKhJCpck0HXgO3A9ASXWV
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af525b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-Rspamd-Queue-Id: 177C8242972
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,perex.cz,suse.com,linuxfoundation.org,arndb.de,quicinc.com,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96396-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 510b68cced33..bc4e1bdacaa8 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1927,7 +1927,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
-	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+	ret = qmi_add_server(svc->uaudio_svc_hdl, QMI_SERVICE_ID_USB_AUDIO_STREAM,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
 
 	uaudio_svc = svc;
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index a1298d75d9f8..c7eee03225ec 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -6,7 +6,6 @@
 #ifndef USB_QMI_V01_H
 #define USB_QMI_V01_H
 
-#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
 #define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
 
 #define QMI_UAUDIO_STREAM_RESP_V01 0x0001
-- 
2.43.0


