Return-Path: <linux-arm-msm+bounces-96397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKhHGwZTr2m/UAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:08:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BCC2428E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9660C3063434
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF5B3B5850;
	Mon,  9 Mar 2026 23:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR9bULr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8XOX31C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A1936AB43
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097572; cv=none; b=iv+IlQXqdSQqo0Ks1Fru5r2tVCsQtz2SkJi3qT6PdiOzjOgjPUe4CUTzpSSGFiHnuP1v7zJ+oK88n7TiW7TETqjnxLExD+Fv5EyrrIFgw0tGENAUtf+L/Sspu8/Yw1VzCnPJ5ZRn2G54pHDXvul5cnOI38FIZwgEixuwJ0Ux3Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097572; c=relaxed/simple;
	bh=JA1Emk2GOGrNm0wBvip1tqJqrJtVwNB/O0vGeFWX/84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=soaVVqU0RDqI7riacVi5bzdPxkDuIhkMUVQBiuWAg0uFqn5ut0DZBEmTjBzJGmL045TYFCAOHg/42rtVFmIo6ESJPPDScKIcJ2uePCyhGCejeeYogOZkyad7XqrVsTuETCrEctIYIB+SKse7vM0HDIcyWBAMl1CKAEaOuDER++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR9bULr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8XOX31C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFtpr2872799
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 23:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v2mAeI36jMe
	fxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=cR9bULr3HuHIdluNoBJGFv+4inn
	oEkch/dAK8iHZXChBmP5YbxIOSs9RppPQ3TOJwqxNc6KjUG44l0NGpnP6kv+bW+n
	93OhKIOseaCH6RpcaT4bQYVVTt2zIv9g1XXzGixEOaqkG8xPAETVQCoustms+8/l
	1XL6XKajpsOZ7fXoIessDCYomEMqLT1Sx6X3lbhM3jZxWSOKB3YGmGnJ74qcBg4q
	AsE7BsGsPW2E1XJkUAqbhWuTQ8OdZtuPblMct+hrtcMMvkjsLExjzi9rEA4GjGOg
	PXDfBsHsJPiT4nYN8l0FHvpiUBgWVuZ9EIQhJ32d6/k+OSx5hXtL/yADkxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gk7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 23:06:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso144403171cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097565; x=1773702365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=g8XOX31CxcmXx766z2IReF1IJvIswtIf5plLemO9Y8QXZHkKlFmlhiDNpl3v5o3+zZ
         SC6yDf7u8KyhpmeWRkL8KN4vIbavmu8TGnR/wapjh5/wN8uzqXrkiSfAypXpIjl2LpMH
         NhsYyx9v41ITpBZ9SLwd+I17SaxI1b8VPt1/JaSsnbFLGbE8Mmiacpd/ru8KB0+GiOyG
         6yQtx+vxXwnTukAkBwhS/jqXA+tCa0MTrStzdmLlXk2bZxumm07HAYvqA/NTEo2tv1H4
         gS78ZaphzaKzKMKq6AYNYL4ZJRp4iFJFFoWeO27TWz58d4JoCaJxtoaQHqJiZXruBvL5
         vsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097565; x=1773702365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=MP3QRVf7QE/wWIjY7wTgDfUBRhHHQ66XEMlMquOodcAzMC6/JQlRqVVjL9b/K6tfjx
         XDtdrRs4UE5oRVn9Rzt167NSzvSx6MDGGYB/TkgUGd4PwZ8cVK3MZvFSt1Xg8ao7IAMp
         q7+dVdfhjp/jNlQN7wbVnk3XN9edc9udVT8J/pGCoQVdnBKHn0lZMphnyJ0/mGOQqTpQ
         eT9uwvVx2SyqFhsvuB51UADgW9LYquFiLHI77AJ/Iv7ILZ7iReczxX7hbBb9o/oX/7x2
         Ee/t9wB1xIzRdPS2IuzebFqWG6y7NphOt1A26sCQzEQV2fCkS18iXzyY0YZ5S7Ffx9jj
         Batg==
X-Forwarded-Encrypted: i=1; AJvYcCV9DPsi3g52rMmh3aOU9S3Smz1odUDcyzTcS3ABrNdFzanmCjNMJ7j4hd+r+u1swtQ9MZfH1ScwS6NauCa4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0Ae7FlD7b9o/kRcPmUNLKFgp4XKSOosczalDll8RIjv9mZwr
	FAIF7gMySlfo5BtPyv+wEMlEcWM42gn8Ku+enS6rd3OSOcCS3He20k8NXde1K9756BrJpMcHD9H
	QgWtb5vor2s6JDK3jDL7p75CDfzLmOke5lT5X1/RTaCNvlkCbXfLnSqbVSD3eeczLzT4H
X-Gm-Gg: ATEYQzwH77z5+EV0k7YrRKNODK42NKHP/2Jc+mpdrN1GIWPG2m+aNsk97GkQwXa7uGa
	MJFHINTDjZpRvF7OHlu4fkTtvHNnbGN2pW7X0d1zH3Bw2kNkn0cFggvbselmfEBoNcPv4COsEut
	b0RvVmsMar7Bhah4BobBHtXnbwQEPUflKTJo2dciHDMei3gOvY9vBIeZK3xxz8ckHFnmxTee394
	/jIRdPu3mBh7FfyxMGvSBQuHPVqUNc3A2dTX0RSO0d9OlAJEirwl7/HRzh90B0ZyVeeIZNzCNZS
	2gyV8i+vPVDNdW9CAhOU+irdXioYHa4zLCAZRA06AI1wyFU2ElV/5vr2VomBO9BAamgPySE+FUe
	u0mGiHBssb77ohO1ypW+aK1v3mnopwrTxggxaOMjv7shAnDLKsg==
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770645185a.2.1773097564722;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770640485a.2.1773097564261;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
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
Subject: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:37 +0100
Message-ID: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX9RX5ATuhXq+3
 ewq3+R/k9A2aIuzAgz19vfS2pPbNWGdbDtUddkiszgGAfcWvwiUfohKw9g3K699+Ec/+RCn9tDz
 W2ISFhsifmRkoz4ndUT0d8dIvhOn5OZnLPA6EXYGbBHbSifG24g9+Ze0bFEg1GMSUp3jxhX8Duq
 0AJlVftreDsj1f/m8xDImIAEO31EZmvyA2UMulVimpRIxZqC9cAMdgfDSQ6Z5aOSXI+eAKHQBlq
 3r16YIaLCDZVS39pJ2JerNPgbspDEXaneAOeQHf2DRljw5SNuUwYIoVeksuNDBk9/0AVfTyGm/+
 gIblSxuWbMK0iIS+k+C5vWd+w9BYT4olkd+Mua7MslKgfMlooWEG42EvBKduPhZbcpqmZD8Au/g
 kqffzWIsReMvCzhphTnvCb7m7WGvXoMtV9koOS80mCpAfCSDv+JvJhHgPmVHdTOGMBl4fu8BMFb
 puZVyl1V9dQqToeWAaw==
X-Proofpoint-GUID: w89CkS0Nz6QDF3sienQbZUerYmS2W-Nr
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af525d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=RE031ben1CQMdFOqpmIA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: w89CkS0Nz6QDF3sienQbZUerYmS2W-Nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-Rspamd-Queue-Id: E1BCC2428E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96397-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 samples/qmi/qmi_sample_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
index d1814582319b..247ec5e54c4f 100644
--- a/samples/qmi/qmi_sample_client.c
+++ b/samples/qmi/qmi_sample_client.c
@@ -592,7 +592,7 @@ static int qmi_sample_init(void)
 	if (ret < 0)
 		goto err_unregister_driver;
 
-	qmi_add_lookup(&lookup_client, 15, 0, 0);
+	qmi_add_lookup(&lookup_client, QMI_SERVICE_ID_TEST, 0, 0);
 
 	return 0;
 
-- 
2.43.0


