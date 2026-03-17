Return-Path: <linux-arm-msm+bounces-98168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNjLJBxMuWnG/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:42:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA682AA0AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E30B303180F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFF83C13E3;
	Tue, 17 Mar 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbKAAK1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Y6yPHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A33C3BFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751047; cv=none; b=MLWW6dAufjCNLzHJ4GIRTh7nT2NLMovrnajiE8imKvT4gbzOSaRoAozbVK9IaAKFbo3r2zuvlX3FMnJt0Mh1sMpr6cm1LAqVWl7gwLqgteuAFp42EDWVN5mYfqn8buBtFRV8lSeNN6wqNvpHRXST+GXNrD7D0r1N5swcg5QpP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751047; c=relaxed/simple;
	bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vqvzq+PFGusk+2p8Z/p/cJFTcyqpyHjgUS/PBkjjxwh9OaHYQGXxXflqHHVGjU8QjffJwwHU7BTlU8OD2fAo9qx8cxa3Y04v4oXs+KxSKhmD+7nQqMrxTf0lqqJ6qarDoNuyKcpAQEMJq0TDqOoEg2WqPlvGMTubtx6xBr69JxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbKAAK1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Y6yPHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RWgN2906159
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=FbKAAK1L3AL/kMQL
	f+JgJitK6FzWufXruPRpNmpR/N97YYfGYs+qhXsYzFWU/djN2twZJQc7qjiTnnBu
	qTt5/eNxB3b/2vLfotFc4Y7XuqM4fHblNM4eierINCK1B4jabTQSbKLsrurGjciZ
	7aGfFsUvNSX4w3U09s76lf6h6x0DvWhcuaPILTyPGruHE/f0kP2huBNEhON9uZjj
	gsdq3+4KSJiBHmo+66/zT8vLQqawfThkN3wqsjpcczFuFPKRoNwmgma/E8T0/rAE
	6VSigu2z1dUjkcakUvTmm5MFDPQuW9wFV/GvxZg0QGiyrhCJEYOSIH83YJBphHZm
	ukS20g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxh42n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so549998585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751034; x=1774355834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=V6Y6yPHbF7qZedlpzkE+jtJ4gX2vtiE4pPjiGjBrwX9OXXT817/uSlHQZcrP5Yep2u
         6y0QNqBod0zJTgFhua0Bs3R0U2c/u1hr4hEUhn5zofDKY7UegRSGG46SO9li/7qB4un9
         SvIFOKeNHCKAbSbKf0iFmzu/DPIeDHW3Hnx8YtsX7JEhZxxg08fPthVhlAszoktYFr9+
         y+WEOSVofxQRyFhl4/oXvrUcj5J69SG0IECoUz9ncx9wYSz3ShIxMgJuwPfBT5qSD08w
         XZ4omKn+/AlI/T180ynFeTkGM4MPbc6EzM7y0s1s/mIwqh19Bb/38i0yw71+UP3MSiTU
         dZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751034; x=1774355834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=fBgmWruUkQqvllCjw5tJwS/aofA7cXq9xkFsmmK8agP04x69HBHgGe8xPT8N9xji85
         PYC4DrLQ8oDDRcJ+akioNbCWPXMfogMd8UlMcUK7XDduAuIdbBG7VLmnBP3y4i83PVdQ
         fQlBJabvqNLgocAdMBUTF6/jczHoKfdPn16yrT2zV77l1s5LEmBg0dQSNGoVrNbGYO7J
         y7ivxtQmb/u7G2Xx1HCqmlSniKVacOutb1mI8jSNVgq+utVJ3T64rE/gt4jwONi7MaJj
         hFBBkbm5WTVwxUlJthPZ8rXCQ3t+soXktl9qzzpyi2oGXf0OAjrODOaW+SsvbTG594uZ
         Itkw==
X-Forwarded-Encrypted: i=1; AJvYcCXgwbcBd/GCMXROdDgn1IRfLi5Pb93X7z9YjbDKt+9csYzZRI4AOGK8KneHPBYitvbrbUj0tQHZPcFtyflH@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ29gcSsQ78ahvHSbhYxiXgO0cNaLYAaqoNP49Us0XMKSih2cB
	b1U4UUxkEvFnD35VCsxRHa3GdIY0do0kUEld3XDtH2acO56pWavxmgLAzMOUHyw6eVt+iIxtvF/
	as/H95rHwNx5woS1cFgui9urm4hIQPz+DF5JDz+1nw7TQeRZN8fZyXJsW6Jl7cfWr97XQ
X-Gm-Gg: ATEYQzzhh6pViKiDpClmf4El/ZB69pjmqHTeO2yg82l8qJmT4VrJA031kaFV0n+DtEC
	W/KIoz0J3ZmBDSRmS/yQqcqJno8ZAhEjkxgRpivcLbmRc3OUUIQKlhYq7wtQVx0CU8So0OUnyPH
	aArfn4TCZYtyuUv8UNdamkuqvBUuix1wpp6qU3Q2uZtq6EyeFYgxQrwQRbkrzF74hR3FjwwQiA/
	4v4hGnKo3WEjvFZIHGDaemWx9Msea/7hBmROvD8gEFespUlpMECCaXnbYu1lnAX6TLE5HdMY3wz
	mYwirxZCHYYU1nAp/pjjXYVKFZLaHiTJ5g22DdqHM8Dox0EVSp+1Rs8FLza0Y9bO9Hh9ORz4t8C
	e3K9fcMICRALpQ6hXqTFuMDcWez3dbDWsaqefgOBoyAyA
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379626285a.6.1773751033814;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379621885a.6.1773751033207;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:54 +0100
Subject: [PATCH v3 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-5-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrqgmtdERuN3F27OHUmSHYeKw5e7+/d1vJYu
 lQtMLR4gguJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6gAKCRDBN2bmhouD
 15jcD/4/Gi4pOzQo6bWmArEEKAEmKpSLeGaLTVR6yuNG8KwvwphE6E4w2Yi5wy5L4TV30U31R2I
 Cku6v9OjiaWcvGVp2wSSpAkv1HMyqXkUqKM3VHfhP6RHCCNEC8TLnAiGUnDmcYZ5niVVFzVmw8m
 v/1WQa9G1p2v/jzVM3WzKfga6U5SoFezZzU4cWQbM8mJUZUZVMjwaeLqLMyciB80jz8RDRSN24Y
 COQyhl/3m/c1wL8pNJDR8QkNDDJ1GdRmE/ege3JxLwdsVSez4uED0bXNsD53wFk9/9mC5uNOzZy
 3oFPRNIINZbspDiBrcbP8d9229ebKfUr9bndPzjyJbjoLLmHbcmghV90ZlFbO6Gs7b0YxYQW3lK
 VWc1iQJ4PKJ0ocO7WDxrztmD7MIHbH6IepDsz4MPOhFdalKDCrDXa0CfC2bSI1VFGFy2VFAxOBp
 8BGEJmqzGF4zhrXoSPG/6sIoRxAqlGYbCccADWHJClI5JBUqno7bmssBht1lTz7W3+Rs/5ILg1L
 zeQ9pis01EF8YVgyfAXkwrlU+HDue1nOXa21u1ELAm8sWnPWYD9AdR4W4TlYC2aktq5E9xaRTk1
 ZQ0zROlLiome5squwaqzQd3/PTC5FhHbuVFHq1nOwR7UoCDxw1FTX6zYgvjV4ALFXnkbevg3mZC
 Dr9djLjyQVcSO2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: PNQbGtgJCu8taOdYcAStvcjy-j9UFvJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX8WPXBi9/lTMK
 aewkACVqjQJ43BOT1x99siYjNoyhaVCTQL0mSAaEW87HeCLJxjkvfxDTZoJoHMXfmYpUhQVZkk3
 Dq9f+ErVcrVmXZqHGsjpwfcPQc8VQL7LN581N0GvAHzBN9DALntQFvmj6Pnw5LtYr2II+pcVpPu
 pGx8j8mwIqeLPlGFR9G99cN3mSWREJMG16YRPbUhgsC7v4cJs7pivbUIev8Nk0iy10ANTOrilhE
 SPn6SNHQSziNQ5z1HsSaEl3oIzl0dpq+EOfoyioftIAEML2MXwg7pV/CRBBQ3jIUeGrYtUe8Ug7
 ZuFZ/o9dZy3u47AoWrPeLLPrVvfGxsp5Qqi/70nopNcosoTO3Yo2K1lT7m4bMbgGNf3z+eU3L1Z
 r/23LOLo5BlloLgrSNnLGtUa9VadCkKRjYsEt1NIbNSPf33iuNH+GrBW8g315Ay8CgWOf7qThtF
 l/X2tI4/IECTwrLRQdQ==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b94afa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=lY2TEL3CVMzQJMwj26oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: PNQbGtgJCu8taOdYcAStvcjy-j9UFvJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98168-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEA682AA0AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0


