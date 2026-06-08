Return-Path: <linux-arm-msm+bounces-111935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jOtoI2b6JmpppAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:22:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EF56592FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:22:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L0Qb3v+Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AZxbtwVP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 848AE303D8BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E723D813C;
	Mon,  8 Jun 2026 17:20:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC56B3D5671
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:20:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939252; cv=none; b=J/JHeYVS6yZVsb1c5yptNXjGOLOC5QpvnJYn/sfTTwfXOioiQXJpnxDgFctan7j3WQ7TrNp1RTt8lsRihY54MWlIqP2B+JBZLokIJLUvovyOkuA5UKobFg1RYGNVMV1TeJrFez5UP6vfV5CtoP+f/Luazn/a+6IcynTfIYdELg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939252; c=relaxed/simple;
	bh=Q2JBR3kGC10lZH2CiMxZsObJlEtkLEh1ibZOUMTXwhE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dCLbTmXABum7DyQlm/+9U8pIcNgIaVwmej4xzYedZLlamjo8O48/9anbaToeqA849Ua9z7V/6janvtEoryvow1w1qSEo1vOe+Fr1bIVn+3tL9vljJnidEX3p0hGD/Phz7dcojn9dNTRdOXaCR80BORB5WszobZFIi5q6u4gu4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0Qb3v+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZxbtwVP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFY5c3479146
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFN3LV6HI5bxZIkIvwfrDMorw0Yst+KEONq
	BEnm0csA=; b=L0Qb3v+Yuwt2MqxBrwmzePhPmeqefmybIoycc1CfOX8aS/d72rF
	mRaMFpUf573dw2YtHD64MD2EMb1T0zxcvwzALXnLuyTgBXvQrbo95ggOgzxjAtM2
	1MfoVTU2MMd2Z1rek5p2XBW4iJo87RoIdAGQ36GI1thySdK+42Ykw0UnFs0WZ8mG
	wrf8FSEjbG+3rEAgRZ9S22I/Sn0RwS7IpVQlKJAqKv1vZZyKHpdXDS3Y0KK5RF4D
	zwKb9vxpDM9u+4etawEPTMwWc2nADDigjc1RuCfVajaQdSjKMSBtrNwuyqRNV0zk
	Vq2PA8rZw+2z38RxlFvQteMqwDhdWkF6XPA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx413fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:20:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422b1354edso5437309b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939248; x=1781544048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFN3LV6HI5bxZIkIvwfrDMorw0Yst+KEONqBEnm0csA=;
        b=AZxbtwVP19IxOR31fkoyQHrZ7mOTCxXB67pr93eH5EgKBVnUOxvRBgAj4CPkD6KGJo
         kxlT223KbukFpEC60ybwzWcu8i2+vcsMOGt4XukcONtV1zgKBrDj1Hb03mZ10dJSeylU
         tO/27RQyVRSHeuhEWkblhlhO7f40HFi9J5rbg3xpa3Xs7uYTnay3p8iXU5i2ZqgNWHqv
         y29xf123ZUqJCZOt3it2/vx7P1G/HUF91d5NHYlNwJUs6RuXelwePawQzBcsUdhZGI/A
         cHlSQ3gQNUdX8WaAdW2q/M4Rn5nGB0ItMh0kyjckRGi4zdFukH0bcNjIs5zqIUe0t0ni
         5WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939248; x=1781544048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFN3LV6HI5bxZIkIvwfrDMorw0Yst+KEONqBEnm0csA=;
        b=k5CVfghgkP2pneduTVmfXQBOXaw2BrMA+OrkyuwwmoMHqr8HyasNwEG54Mwe3Yhp/t
         KCDS3y6qZYUk579Fu/pqixc8GD6Hp+bxRwyuc5m5j14fGgBRiyFuIYC9pjqUV1G+lgzq
         oNrig6rGvbZEN7npTPlfB9jVp2SWVw51fBQ6kYmuUN42ckxJWGm7F/RBJ2DKxbzdlAiK
         pvlbLdGLW4Tfz/LRaKloEZBQiC5FA9DhftBcnxpIRiW1ydQneoPDFZAa3DTwP8Zun4gf
         ASLOmUD3H7VqCmjTD/meX6K22r1At5awmaRx9T3IfjloWCPou1Cad/LivQLGPBS1M62Z
         5BRQ==
X-Gm-Message-State: AOJu0YwnUtq0/itTz1CabWdQF1zWQGHhiLyMiv3BlS2K0XWe9jZ+AZR4
	7ujhU6lP21Tvuc29qR3LMRUwEFOY48jKbGn7HbOM8wUOfRC/u4Dqa0XUXUCUWlTcJLL1me+Zak9
	5RoG8LY79svPQlmR4ILYFljw9oMU2nK12EUYpw+AIZY2TnHVQQIE69xcSQnkeMmof4frc
X-Gm-Gg: Acq92OHWVNcgbzWzgBE9WSZx1xcaoXfKNxWj1M0N+AW5whynxlblHdUrKzaE3va+Oov
	XtKkDtQvR0rJr6Wix061rXH9uak5gDgpWHWSTFUVWgHjQgmS7QHOMqfJkTyRAQtuduqeFP1OVTt
	cUncYnuD85TTsrPMhb+gMIa02XlwtnGXP9OnxEMjxYn56J7YFsyOj50waFPPfKsyEwq4TzstTYC
	Hy/wRa4hTUzm0pW44bUTDt/2X5ACBvTR8Fm+5BFwKVrG9Yf3zL7Kr9o5ExTeEO0QjW95co0qOyz
	iaY3B4o1D+kLqd2NJnOypG9E6WYBZrhMTfpMI1tP7EnIdw607EPWY+ghHu4kZ87+Fic6vLv2/Ww
	zC7jqLQPGQrLNvV6HVR4ORXdhgevpERbP44/lMKQ7jj12jeKclMYYqZMR9fFF4qtVS/oR
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr17238696b3a.36.1780939248472;
        Mon, 08 Jun 2026 10:20:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr17238658b3a.36.1780939248066;
        Mon, 08 Jun 2026 10:20:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:20:47 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Mon,  8 Jun 2026 22:50:20 +0530
Message-Id: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26f9f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=433bO3dLITp610D6LnIA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: AcucSMFJKCaYmAmsw4ayAVDEjMOPiLNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX6u9ieLmoblka
 XR5T3cn5j3z+PvGhQLGowlPmqjGjZDBQPOvCQtukE5t8iE+e54tlDERfQjNLmE9d59SnuDFtmLY
 /xSCZtwgaaxWIOHH9Y3JiWZqErF7/eTLk/uUFBS+k/ewrFDWYaqJTupuaHo1CPgK86+jVRbYRht
 GjQINnMuUnLyVKlBQWAxYcEni9VXcvpwmCbthlWl1X7Kh067RLzJUCZldFNZ9UFU4zQO1nh1aE+
 ThHoaYDavHI7mHxzYBDsiOJ+7/6OAaZ/X6qru3wgEps5wo5EzN5KQ1t/UOYC7TnzKIpw5jnmFLG
 FlZzmD6MRo53LMbbrtc80CoM4QMnyxWjqKX95VPvDSBO6tQstryVDhU2a+HuwIX3R5VZj2fVCvs
 yoSxyxxZB5QHpyQ8tx0jJAxEt2pD1PU+vCu8sZtx8Wl30gN5BICvlCzMkKTR2bMR9xv1yHm+8EW
 Ss5ORu2SQyskVB65cKg==
X-Proofpoint-GUID: AcucSMFJKCaYmAmsw4ayAVDEjMOPiLNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111935-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64EF56592FB

This series adds shikra compatible support in LPASS RX and VA macro
codec drivers.

Patch 1 updates RX macro handling for codec v4.0 and adds the shikra
compatible with FS counter bypass support during MCLK enable.

Patch 2 extends VA macro support for shikra by adding v4.0 match data,
a shikra-specific regmap/default table including ADPT registers, and
ADPT and FS-control programming required by the platform.

Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom: Add Shikra rx and va macro codecs
  ASoC: qcom: lpass-rx-macro: Add shikra compatible
  ASoC: qcom: lpass-va-macro: Add shikra compatible

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |   1 +
 sound/soc/codecs/lpass-macro-common.h         |   5 +
 sound/soc/codecs/lpass-rx-macro.c             |  14 +
 sound/soc/codecs/lpass-va-macro.c             | 276 ++++++++++++++++--
 5 files changed, 276 insertions(+), 21 deletions(-)

-- 
2.34.1


