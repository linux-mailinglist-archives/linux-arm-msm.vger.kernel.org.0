Return-Path: <linux-arm-msm+bounces-97997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMXYGtg6uGmpagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:16:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DB29DF5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B44E830398CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C18F3D3310;
	Mon, 16 Mar 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3DU6dl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrqvfI+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C373D1CB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681286; cv=none; b=sWMw3U+bV9/gtcS+V97eSfv1rOLOZCABYCO/I8pv4eeG1oD+9DSdF5k/W7G2KChaYAdS1a3crWT4cJLeWlVjWsL/oQrD49Q5Cf/dBlPKZQdD+OlE4tyee5ttko/e0XjwjsksVh7k94RVDzF7ggkk2Jcu+xh+NvfprJmi6eTuS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681286; c=relaxed/simple;
	bh=UocqjRyfFzM84DjFYioQo6kEjdPifFN5KCFxnX+Mtbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zu0KrSet16gHXlBsg4b+u32cZbsVrdWrt4TSirLfyG1HxUMvBeMVV4lxS382ziacnYcXnq9z9C0Hil7bxszYTUpWj4G6O3WNR9Ju1GkNkjIuO2fuAfi7qxber1/QxYkxdmWVKmf2NJaQdRwANsjZcWIsmlW6ZKwgvyYdykMsGPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3DU6dl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrqvfI+8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjhoD1428768
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXy8rqV6ZJ
	yXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=P3DU6dl3c9C+mKOoFj8fLnflTRc
	E4S7OufGIBneH7YqP+NWIVKQr0JamAB0ccP/h1Fu1YGnyp4csg0npjgoFeixW8JR
	Vxl/OXVJfgmTwzF4Vn7J2fQ1stksLuZyNanswJjCeX+tEvcw4wn+3J9ef+QTeG1n
	nsaaszMiZ/kCXgERsFktG+NFb0XemxxH757PA/JfVm3NnNUUQzrGnDx49KGDygK7
	pFlzs5B2WwtrEU11sYGr3Wy7XXdUOW1/NAVcRbrPi0lKxckc1uUQdMkQ34QJ+ljV
	4HrjH64gyE1cItzRHI72edpT4EBGjx60xlN9Izp4/hJP4ItIfIEv51VQ86g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99991n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:14:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso5381463485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681283; x=1774286083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=NrqvfI+8EHRd+MVD032RWKR2d12VgpuKL0Oqd8RkWQ1N3C9JTANmVroK70M8+0/5Oj
         UdT6yk8N+cfZUkfq6S6R63zOLGOe+1THxBqMTKkmmHhx8Vt9jpMOR7KrW6Zy8mj28nNj
         Qffy16hAr4shMxnIXDgrvmOU1QXptyiaCfAZPP+GsXMc7CN4OfufezD+8WrkeYNLBesK
         oLv7RxmZLhX1y2B+9whenBjnhkoS7n8WQlTsq/3KlN0likuiOvykEDn4sWBRIpzcebsf
         E+XXGp3hKBfavX5GT7pPjfe2iRXfrFTuSLnzaaKLiMqIoD3k1Xk1B5PuExL2W47Bap6j
         +/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681283; x=1774286083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=QhFZJipWScqCDbziV6kZ2fsp9WrUymuXo946vhQWo9COqnQcJ7NFYJNmDcisgfHPgi
         oJSynMRjQA4MmRzpZRUZJ58G52ZPa7tVgsCiGXZhaztAvTse6SyG79dLzpMKc2w+6wFy
         R4X5l9BYtgwhuJWPqHqpZcHIuK77KFtnpw7l+aOjQRp5RSWM/fF/4x1iemQdyN1it2aq
         wXGiW6O4FkxNHBQHohr2FYxh4eKuHP/dZu+4Lk6gOTkAKZTYSYtWEQYVPVo218DEirD+
         UbzRvtbjpRG6GX87aN17Tz8c9tB0Y2DV5lZSGbcr57qOhoeymxeOYssyi3dAqde6b+n7
         9dmA==
X-Forwarded-Encrypted: i=1; AJvYcCWmpTjClDmJviLCVSkW+R8u0aAPPS3qvF0k9xkTOPJ8LQuCMPEUywnafrVBO6o1Gc4VmOQnNnefvuJikyDI@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8yI8LYmuc+NOt+agiu2zDFEBOSnLEFFCApnlWLBBhLnWpx0B
	DZhqr3qbKFeVheAgtIAeHX/sABSDW9Wrzk0J/iM0OpvIkuw88YAfj4TQQvmff3L1WY91qliaJ8K
	X8vIEQQjIYqPcin01qsSHqfzsLwayoSzU/i+oWYAReABQa+jtffAoez5swBLwvC1RpUbx
X-Gm-Gg: ATEYQzxb8UIObzzrwrMwYJJ1Ahs3B1DffsAqgK/tKCLCeCPp9VL9FnVm9/hp07cJT4C
	7UrtKCwO14KvwzXmwqDDVbqXFxPd96N+DxE2oODrZvUEL2icdT4bFM5EYCtQH0ZaGf8VVybZgT3
	z3P4qkmRpg6nBYDP8p5Nq7KtXs4Ga8b1HSPbZdB2hfSvOp3Hu8mPxhB6bBOgkvQWoLJ7SBMxML2
	goVFTn74AEmm7vVyqQDwzp6c+5ttNk/qhFtJsd9qV9BeAIptOGn5YEWe2fgZn++Fn7uWh7l6Fcc
	+uh4G71XFfDzrWc7QUCRzsl5cBS9hH0d2WMvXvFI31k83ty22p5dgg+HghElz7Wi+lhFIAmveJs
	2Ofe0A4c00NJ1BGKt6JM89wxm95Z2e6WCiO9hYoGoFPBfXzHXnA==
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839478085a.10.1773681283366;
        Mon, 16 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839472185a.10.1773681282736;
        Mon, 16 Mar 2026 10:14:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:41 -0700 (PDT)
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/4] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:13 +0100
Message-ID: <20260316171419.2619620-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b83a84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX+Xb/jVgLf1w4
 pgMQXK7SRJB7IcKwfBDSLGObuayntwM4fNkdzEWNjy5MMEW7Y3fb00wWn4i5kVuw2EwBVNWewJc
 g/23aNBOF6HdTVdt14yATn9nQVOhDzINRiOnmS8FBnbH23odyH1CVO8jy+WHKEyQOz9fcxdR09K
 nxeNOXVaU0y+P+P34FJj1je8/a+BurAMToroJ+vVOteDdzPc8s9en6bBL5NOpdfbjisT/GZGrHV
 B2Zh3wqAlcVy/tucn3SkY1dhsfFbkzXk3X+gmE4InCWB/St45HqMNiTSebA3kisNPXo9aMyHMMO
 2NNDcmht0iQFgQw5+TFsN99K8akblY5eRrK6xNII+QWkGDtCme/iiJhoprx+5fys+RrJSLTkY8R
 1w1Y+xN3bVD7JrWNt/8fm8om21LGxd1c4lHEJrsWOh8NCvY1oJjaTEBEI+WisGxCnF5Qf+/PVU5
 4No4OJ8sb1sg4mEoqHw==
X-Proofpoint-ORIG-GUID: MQAit2R8E8qYseYvwh4RUid3-YuCePcP
X-Proofpoint-GUID: MQAit2R8E8qYseYvwh4RUid3-YuCePcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97997-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E7DB29DF5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0


