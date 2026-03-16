Return-Path: <linux-arm-msm+bounces-97994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHeDAZ87uGmpagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:19:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E329E028
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47EED306572A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC293D0919;
	Mon, 16 Mar 2026 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVsSgDcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvDC9HYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8B3CF690
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681282; cv=none; b=pBv8+dPc6t1IAqaBYCFl38a0tcK4F5hAdvK80z7fD2GycOzzmxzXZKe6tWM7ZdS4wBzNRfdgKwI57CuSK/L3Zf7cy6l0fO0bxFTnNrysQd5AAL2+2XxnpHXLrE9EaqUpa3J9hWqmSlXLBT/oDeowRFxvM7WQrZDcBrMLQDTIE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681282; c=relaxed/simple;
	bh=vBQ6tTOdMa9PYbW5txamAlvd10vFcBIuxy+lZseqTwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyvjPhnwZhTg3tLkVprQwDoQYxa4hyZCjBcHf1ChPcMtANRMD9WV9a0tjo1ImZAURmQAJiqYjtO7VSpY/f6decbcoAOS4zF7RAinh+SRXy/yyBG1SHvQeZBoHRXdQziHNLid1BefCdYGJK/tnco6KcKHi+bPTMUOkk8dVlJDSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVsSgDcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvDC9HYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GFMrY02314805
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JbLYlc4Rhba
	fmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=DVsSgDcAKCTmEeR7blNUSxx/K50
	JpPXUhCOYXuK+aOwWkb5J5g+nEO9VT5fBX+8A+kFJiHfFYkae5jwOYz5xd2CDh+W
	zWzlQF6DjO9E+VAB5xGOEffGRrA7NKQsskBhnMhFhHMWdfJuESNFY4Awjhn5BLE5
	Z4zTDfL76Z1zQIRWnvwqMMGyxsEC2N7hYOU/0dATVMbpUIp+jxJiDr9Hd4uYKEmz
	GM1CtzSl9SJFqEuMBjmcv/KQhuJd/ANnR1xDVCrhJZPGDbk/16T3S+JSiMEYhnpN
	l84P19B96VJeN03VrJOLe+/Mz7nd3Yh2LwAN5/yGySj9hWp5vN0XahRUwNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf28e5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:14:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so2288760185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681280; x=1774286080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=cvDC9HYFa9itb9N4t8ZKRqYhyJSuSSQDSGak0uu0Bw8CgK16aoUwpL3tm/PLKtL0dg
         vgeib2Z+fSgrHi10uZoFsCglEc4C+nxuGUzx9W0eikP/poHS4hkDxXJ04qRgS9ShZ9Si
         g8uiT2YNun+E7Xw4ieayY7kdDaupYco3IMY0fMQoTNM9uUOpKdwL5MtWX5m91f0XWAj5
         /bhbZhri3J9D0TQ4MeobXSe/U1r/hjlM12JWm3LLqgxwMbypWjwHGMerZVLzsE7kX7Zl
         mh4ylxrwAM/+EthqFmBmLixkWB5fArz/WILuGeu72MjTpO4c1f+n2K7ylBi+qYeBlUT+
         1y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681280; x=1774286080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=RpUq8g3mXqRqrZ8fZp5JdsBm5xq3WX8UK7cVJOxzMN+iINkx+bcWYe+EqBIHMAVux8
         pAy4WEcSImYlcpDI1gopLO768HVf4MXmRl/28RrXCbSb0dSiLp08BO5/XxKOwYkVS+4i
         WqFKewlHNVT4omJGQDglcrGp9P44k+WdP+tccGIKKO5ZbYiOBtfGB5SJFI3P4nkeBoCZ
         C+2MMlvtnZIPSTW/pn1UyQRJbm3PYDOMRjVqRJWDr0Hgs6yt6hfrrMLpqssQdPtYDk0s
         ppAIGOWGR1aV/2sogsTdA7pPMzvBQ2hVsPmTB+XvU9jj+uIodzgqM24S0bSPiPFKJCu+
         D4zA==
X-Forwarded-Encrypted: i=1; AJvYcCX6p62s36gVM9R7NgZ1ZjkyK07BeRpUqidECNCjTyujQLe3uCU4g27BLzTx+rQGUapb5TU97nMDaCa0vdmd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5tMLlhfLLYEGp/+wNbUOJJ5dfMycxdnTSDu8RNCBm5D5IZi6n
	LxqgK2xaC6F+eGT0aICrJ2Y1x7kp8j03IqUNz6qpTc46WxNwyEWsGjsQu/Rv/rKou2SyvlwJECn
	yuBpXqKaB7pb6966atqCUQ2zzFLulqKTuD/s/ZeHb7ycVUkFMAgBN5dbExk347hozjnmu
X-Gm-Gg: ATEYQzw9r78mXua5GEm8oT8H6mZ2kj556n1mfRZqRASLWqHsq073gq8kMfU01uVzEdB
	topsxGm1PsaZALzt+QHgRHmHtl68rufTBS5DFZsDVbDQDNP3wQoPo2WZ4YCqU43VP/mfuiaSehE
	s3YmWNnH215bg/PuYDeCLjRUYcRi4fyFHz82d0ScXAmniQzK282LQSeMvxRyKhjFjDg8LOHgt6C
	HuRN0ZttePt/ksmd8yQzOQcb3NkcW5mo9QziKQ0S94/TMzwKoQl0cF/jGBFa5/ebMTZ8UWsM9so
	mBZuA37oOwTgIyjhyTVz1E9bQdWRXXary4vPUwWkhsCiTFQdibjzwEwmA7WryF3Jb++RJwZMXMF
	s3c8ceTugIG8U2X1FVkByYOAwHcfbbjiZccF/fbRSrFP2M1cfhg==
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859177285a.49.1773681279606;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859171685a.49.1773681279092;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
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
Subject: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:11 +0100
Message-ID: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -pV6B0qEnChZv1ITXS5olLMfCkLJaVzd
X-Proofpoint-GUID: -pV6B0qEnChZv1ITXS5olLMfCkLJaVzd
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b83a80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX3FVgPjvLuc7L
 lOYuNToDlkzDp56bWrTuK5jsaDdst4BlklxNKMnzmoRN6xfaGVQK/4PA4i3dwWXy8yKUiIeaoGd
 H7OCMBe2rn6qvx0y53tumTk57fy83r4CxFG8C7saQL4/lvjByPdpcF8dVPxT/wBnLYF2Rk95PbC
 3IF+EYxzLLF4ZxmY2tMx08Ea/V1v7NhZM6+fOBqOoJg/NTUpfUpVS08oPqeysuiP71VIzyzIKfl
 nCyaAwg9WOIp2pxheDqrH68GT5bLSSwr/GAwoqN63ZMR1+ykUOJ0LidGuQ7EQRSqtnHKBF8IHx8
 iXl75coF207i3d59MCnyN9JRbhhzN4RFLKgfnsC6sVAVrMySd/hAnh4mZbbdHm4MQ7NuXaX86HE
 l9xrsnR0uEJ12xV+s8k091NKzQO+FKqCLAEN5cqaJCQHZsF9xwunw3NhmZbhqVBgMoOvY6IjN28
 b1zAnrzj+rRHb4jAC9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97994-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 701E329E028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0


