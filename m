Return-Path: <linux-arm-msm+bounces-96389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJX4N1RSr2lMUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:05:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1C2427D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AB7C309531D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3367E392C5A;
	Mon,  9 Mar 2026 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGAvtC+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3aDgRii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC8344024
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097550; cv=none; b=VDXKfMs4GTn6bbvxyZKc6boRw1b1S6UuCQ/qtLQDpJF3H60pUfaPrVgqDyxgGw0dEMNfYOye6YEte4/PDlhscJG7T3lO9lLHDf6JWNJgSOZp0Jpy8D59QuO+A06R7qIUCryAp6wFVGM8LgmOTOnHnnV2Exc3zsruwgvRqsT7g+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097550; c=relaxed/simple;
	bh=7BL3P5RirvxeGT4CgaG6frt66Z9p7Tk3DkP10qveebI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjbl29QrDuAhg9xy1/8mv8Cq3rmXbcS5KrLym7kzqvgQfS4weaGprJf2QnpSYJfPpSsaUh/zdfQnCZIHBW/JMySkoYdmuU3YmHXyBXWeA/QwJ336963sDA07UkmrGrOPKqvCvuZAy037V/pSgTKXc0VabAH+NtgwXkyUF4j5LEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGAvtC+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3aDgRii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBqZN1297863
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 23:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog
	/LiUHgfg=; b=TGAvtC+VhFmHdK/SB4QHiNUr2OSxTf0TIJZ4F0waDT6myOD0uEm
	TtQSwYPGD800TpfPWF9tvzFyFSMsm4U3ggXX0egFvddV7WK5k+1cjumsgvIIb08e
	d01KNa91jg8hUOmeX2rtwN5upjv3mFQk6m7dX9UikEgQjlQm/RTaxJqRnToWyg6d
	GuBF1d44869BgXB1QtEIIQXH4XUToPE8AJG+id4DXom4TDuhbLSjI5Xi6X5P6qWh
	Qu4GQ6h998ay0j0QNOK+GKhCKu+KWCUPnniJ1KY5TO5achSxfbvtkWOjzXQtcQB0
	KIYedqR/pV5hHJpYd+ZJ/fW6bUzG3t7dbsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19nw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 23:05:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7c4ab845so959117885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097546; x=1773702346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=;
        b=d3aDgRiig0X71vwNf/doxysioT9HhnVAikHiO9kneqGVvBsTOfAGRXi4aoaFZc1ESt
         vTguUFwVXkcOvNgC0sYK6PAKo/AcgRbg3Ku4TmBEUDnKD4Xqd+oNgrevA9fsU1uEfQZ8
         RKXVJYiDpFlOP2zquWsgS4TEi8MRMkUjvdSCltcZUIjbG85vHv/NrgHvIk+yXo7WQMPq
         fAWP34KfAOtLLei+f7XT0c8iqXcj+/cmHzQaI+SXw3Qpj9LrZ8rvNX6mRDoBBP35183V
         qu8Z6NUIoIq4a9PtZNTCakqSj4o3N0U+vlW5Ieub8kjgh+BNEQeHNbfvfRjJooEuDZJP
         92PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097546; x=1773702346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=;
        b=PBnnsYmF/i2xWXCbtxrM1WYLYvmssge7GW1DiK91xe1Hs1Exl5+H+MpWuE4qNbj5nA
         FxHWRsV1vgCbmz94MB9nGb5rLsLnjB0wxZO+oa7Z2UDdbETOENHKeWiGSthKh3tMYkre
         ioYdpc6MmZOWkgZwUSZnBvB0vyNbs8O+E6+jU/JbqkP2Yc3F05ccgcH6CqxXD6E7DHLc
         EJUYlymPW5gvViyIWmIfnK2u886Xr/lHchesHaFF1dCYRCt+w7Wyma/T/JfOLK8Co0hQ
         loE6CkBII8pEq6Eej6YPUpdOQ9kbKtdA6ggZdGPeKN5g1DhiEE0CU11+6FnRwM8LaOyD
         JUZA==
X-Forwarded-Encrypted: i=1; AJvYcCWfuA/hjKucusy2t1iPJrXtOp+2xaTMcAtekmt+2JvG9pCvIQs56pOtpQ5taNS+mDGUi93YI0oSwMwrDtLo@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYBicyW9yBmSGqokJe5G5gLuIVTXHmE2KWJiJsmKLuVjOgVoV
	uekYLVKkNstAnFRFE0ARXB8aq3hwkLH7dr7uB28LDUEvOmHP+RID6Mqk1rOOhKDymWrt+5w0VhE
	EDWqybD3ULOYaWjU1vD+vCjs1WBHxxDpkLygN42G9mVk9au4ofa96AgXzxnxu+m7p6Q+x
X-Gm-Gg: ATEYQzzQrHq7uolV4hMhLcsmeOasvYpUC6HM7irbOt0IColIg9nVYw7bfsugoj9D7CB
	1Sz66dKGNbK5mK5Dx40mrvljWanLwByDd7twrxYx1LZAn3oRcju1cHTBnsJgEPalpJRXB3qIiNM
	80ir5M1Jk4OLEDHn+BxFTx3JoENCpIyoND6m3mr0hzhx7FXutMoVazWcnoO2TTi3qkWpgR4lM/8
	Qs9KVuCZDa8wWAdqE1u1fmV7gX5AQon75er1dkLINLwa/5FPecw1UmC1umK8/MfXvG35j7EBX9o
	35G0eJ6jbWyAg46vzilPSPky1JPQFItrosrRtQcFl9byMpRRJBX7OOWu0z/tJ6hX/IAsR+D9wdp
	7iQKkvlyN8mMJ+vtPS+NGFn/AAdvBJwV84OdBocH9BzlnMKzdzw==
X-Received: by 2002:a05:620a:26e9:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cd827a3706mr628587985a.72.1773097546382;
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:26e9:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cd827a3706mr628584385a.72.1773097545862;
        Mon, 09 Mar 2026 16:05:45 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:45 -0700 (PDT)
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
        linux-sound@vger.kernel.org
Subject: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Date: Tue, 10 Mar 2026 00:03:29 +0100
Message-ID: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8PK-mlF5c8wcD4LIBBpbrUCncCST6rwh
X-Proofpoint-ORIG-GUID: 8PK-mlF5c8wcD4LIBBpbrUCncCST6rwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX0b43/gQN9Lb6
 cN3XthhB4Az0DDr/hCiy8laG6u1kmcbHxi5o/b2lu/W23s9lt1iX4kRuUyGx+p9N+zdsbvE32LJ
 IGxXZWRug8hEqXUn9V+BHZbi8ycv3yDG9MKIkdYN7PQPHBVRwI3I8+R20vXTyxC8n5Db/BNs2cb
 u0x4a9J1Xdep1KnnPO6roUaXOS/WEnaf4DuCzrTCqulg73BZfi3sKNmvGyUXTy/hOD03KsSUmai
 JT6hASfBQke2mqiDtBHHFCKwFqr/Kr0vBjP0DKEuXl62zeJiIsK22OuKkQE135lPifoR9F097nb
 IZnxeOCWjdnT5qH3iKyPFcTzmChVRBMJftUxSzfLtW+RbpfLAcUbmiuEZl2S27e3K29HEItv4O9
 TmIK7+EiiEbIwcK9N4oYnY2ba+mDxy1lJGeO4lF+Gi41G00+UjjpeatHSQV3DG/O9/ckdQ8UrUV
 sxSD62hjkl++QT5Gwyw==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af524b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8
 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=yGX2isoJ_2WtN150yl0A:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-Rspamd-Queue-Id: 84E1C2427D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96389-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The different subsystems implementing the QMI service protocol are
using their own definition of the service id. It is not a problem but
it results on having those duplicated with different names but the
same value and without consistency in their name.

It makes more sense to unify their names and move the definitions in
the QMI header file providing a consistent way to represent the
supported protocols. Consequently the different drivers will use them
instead of their own definition of the service id.

Cc: Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: ath11k@lists.infradead.org
Cc: ath12k@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
Daniel Lezcano (8):
  soc: qcom: qmi: Enumerate the service IDs of QMI
  net: ipa: Use the unified QMI service ID instead of defining it
    locally
  net: drivers: wireless: ath: Use the unified QMI service ID instead of
    defining it locally
  remoteproc: qcom: Use the unified QMI service ID instead of defining
    it locally
  slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
    defining it locally
  soc: qcom: pdr: Use the unified QMI service ID instead of defining it
    locally
  ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
    defining it locally
  samples: qmi: Use the unified QMI service ID instead of defining it
    locally

 drivers/net/ipa/ipa_qmi.c                      |  6 ++----
 drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
 drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
 drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
 drivers/remoteproc/qcom_sysmon.c               |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
 drivers/soc/qcom/pdr_interface.c               |  4 ++--
 drivers/soc/qcom/pdr_internal.h                |  3 ---
 drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
 include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
 samples/qmi/qmi_sample_client.c                |  2 +-
 sound/usb/qcom/qc_audio_offload.c              |  2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
 16 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.43.0


