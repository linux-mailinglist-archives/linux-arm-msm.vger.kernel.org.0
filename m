Return-Path: <linux-arm-msm+bounces-118013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NlQpJc2lT2q1lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:44:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 50770731B71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:44:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cO6M203q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VURdcdvs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1073D306DCF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9A2327C13;
	Thu,  9 Jul 2026 13:42:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E9322B87
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604533; cv=none; b=g31B3Ro+AKXcXeQnMTKbTjPOXIxrCQD5n/rOSA5MsxTCenrrhDxJ2g3KKTMuy7B6YOwt4K5x5nP2piPkSDxs8ddx2l6f4ZJmbYMMwG3sOsSIj6l5LV11a1rNtuRZ9kwGQ8zXmGdoUKmutrUCN01GTCfy782u4PKhbxh7gblEejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604533; c=relaxed/simple;
	bh=acnsSKVi2aqjcn7maAiEpfFJlJtCDzjZpY88Lh3Q2Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSoxFHo0ws5CCnOqUcPc6TP/okmP2mS6+I9q9GXM7sfsQ6L1oE4SRGAJuEfzKBFw12hMoXLrz5eXEkCFFnddwyWVVhZgt3i8vxYyQJbZFxplBw/J+2poJox44/zNuWla2rhmSSnRnuhkcGMyMaASUEw8o7eUO3xxgNOpQCwXtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cO6M203q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VURdcdvs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DdiSc1930372
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=; b=cO6M203qZaAkVx0t
	tRs11xo5OK1AxwHsjmLF6x7TNpQVlT3Y4b0oxz/KaVblLZX3TceNR3kAALjiaChz
	D6qJwINTGHUPXx1lzAuy9zU2w0KzyBwywVk5VcEqq6+O+kNb67ykEtmB4KO6KP9N
	mRkriKwl3Tibkua/oyxg1d9ra50K2UR6ILGRql7WhuXBEmoae+UAIUHZ9VL8GESt
	veYIe/+nDw073zMRlTEzH8Pg6qa7HNICbUqtJhVILb+1eOTp30FCC9U0tjSmgiTa
	D1DdemG0HaHGYC7vSc6Lkp9+KIV92yLMqU9KtyoIktfjAieDI/9cEGYP/c6qWZI7
	g5PwtA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpg09m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7c36621so475094137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604530; x=1784209330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=VURdcdvszLD9ZEpenRQM/T7uh6D21y3MqYM4KDWlVgz7h+x1UFEqRJMwkRk5uuNWaT
         YwpxclzdIQY0A6YDwz2Lv5B5Qv222ihJM4U0qXrvBfkTWKKvAzYGOZ6U2tXqOxO/GBDd
         AY797LlLWwXFHtFt2oM8ZgxMahnVdgW5qCkkwoCw8fl0sUL+ETFqbpuInM+NfKDUQJ+n
         nXPhWgKAoQOzeIiZfPMcTVrjE/r9PF8OqxWiiNYHlXm4KUgN2bqE5g+Aq/e28quHc+dQ
         Y1Q/Hu8PB60NwhBZwUm3T9WDbTxq9PRNm+X7foMFTFhqkM1XcaI+XtDgHLos01UprHjH
         4FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604530; x=1784209330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=LEvkA5IGESEOrOoRSNsm6reahhbQD8u/V/bbw415LcG/kNyAQnWl9LcSqc0RdKI6PJ
         UZO1Ane58Qf8KFBlsEbaNEdZ7/leBzBgMlV6qsjpW6wQRfm4AyEkbQBVV01UjrZDu3mY
         UMgiX9hHGI9rOqbvtjVdLDtdmi6IJLpNJqNJ9NoYukCDI79vzzj+TGd1MiAJ/0AHBDi/
         gyv4g8ZoSyGUp4Jb95DboaGMe/P1kPszAW/e2xlNW8DHEiXI1VhgrpHzDME5/8iXEcxE
         zxWBD6wK0Xn9Wo3qoZeRlBnJUOGpfyyMCjXzzfKKHbDmjowron4saD9A8b9fj98mGOPZ
         msFw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0O7mHUyDdJneds5U5Wb/IXDRyAvgCgwz6W6o8XuFvixYWACstySJRSwKlFtdEyFlmXMeaTpYKwtljnSZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxxROTUPsiinmAaboRgzD4uXydwq96rCQ7a5GXUrOIPgjNvNf00
	3P6mQKRxwFUFb+l3kGcJYun0mne/O/yLylY0Q6ohsXDuok+XK5NL6SRzceSD3usxhBmy3Ntj42H
	J5nri183p2dAwjsCK145aLElZxKRmEJYyA7O0P1GYv2FVoOMuTWpmp1UIJTau6ukO4Sz0
X-Gm-Gg: AfdE7cny1PF220EPqzRdS32ioxMfg0fryTUrZe/pk6Y3fAItsoGfWdi6GpVp+UHojm6
	GedhY/FwRdBfNaFlxVJMhJNqYYyu6dapkR0vgrtc3xxHbIBKwtZoLm0gP24JYm2Io4kzIeE3w3O
	3EvVif2HUSZ960rxqAXTfq2no48RQ+Y8iZxDwDlvXk1l8l5j1u3WWPQa2f17N8E/P7+3a7DZ16n
	VlGmRblKxQJHCiCNAE/OxAWaZjK/Hxg68uu51+tGrEcYpZ0Xc2ukPiDIkt1R7MruR8SxjgH5/wE
	jbB7c47FBdhLI9rX97HC9xdHxdRnTDJnBSRJqjO+PWTd6V8/YuaVEhkTqh0D6Y9chfHGl+b/4xA
	sctwy4aYcx+r9sjg64onQVBogYUvbY/hYGTCKhn9+7CH76yLjhzhhOnPXJTYvLF4C9Zmb6C3oNP
	AhqD3NvIvgiCMwND2YLQ1kffd5
X-Received: by 2002:a05:6102:688b:b0:739:18ea:565f with SMTP id ada2fe7eead31-744e0310bcbmr3879449137.21.1783604529617;
        Thu, 09 Jul 2026 06:42:09 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:739:18ea:565f with SMTP id ada2fe7eead31-744e0310bcbmr3879411137.21.1783604528742;
        Thu, 09 Jul 2026 06:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:55 +0300
Subject: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5132;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QN/GQkI9t2+DaweZ0uUnFoB7t+XgnQ7MgtUodJ5uTko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkHPvbbqFQnR8/r4wF4+bOR69aivY98++Bc
 bTKVYb3bDuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1QatCACGpcvMXpTn4K8hntSyBuA+tEaQRVaL1pf6Tpr22MZzSC8ZqQ3iXq3EjJzSNwmE23G0WtC
 QVgQlx+gucW7w3OJ1vhTGXziJPHRonHR1zvbiPa9iMYN7n4wJKYDt9fHy4Z6OrTSE2hN+FHuyBP
 bLKl8Gs6cM4cEgpCGa7uoOeaMprJVCG22Kg07lE2NQuwUQR5v1fYPAtM2Et1KxFgPTcCvuobjIe
 K1UTNHZGTiTWphZ4cX5LlDNXwtApniu10ExsVKYHiVHPAiHDAtUO0/JNVhACo622J0l9WxDDLi/
 rv8bNGVWZYmcWtX2X4JRzNbHsZUPnPSrv7Dx+md3YO0nvu/x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX5JEoLMu+qNjj
 0ebz2v0RGaDZvwDTzHkoRQzuy67J4ddk7iRXo3gMgSQGiLnnlFeRxyt6dsm+B/v2FTuCaa/2fxj
 9FondF9pyQPeTKv95btMXaB6yHpOylUznpo62chsSKOxoaonjZcUIUOFwtxsn5cEhgZF42kkUE2
 REn4EVohL26jrhBBsK8f+OkXjppRYdPaeot7HJqq0W9FGIpDDFy9vdGepb7c3WIpUBmtIOENzFw
 MMczZvJvcePOMdPP8yvZbniH1eZRS2GYEW7fCa/cbLHPf+E/k3IkG1SWi3xG8lcdhzhgEcvL7bY
 0fOWi/U0cekA8W0ITBJPwYDuCHGjX9F3AL9UNt/+o4jRv0GT/QsqaB9x8WZ2p98ANB7cM3MsfOu
 ELWQ6vlXMmmZ6WG3jZWWfmUMNBthEXe+Qqa4jwxh8VIF3QIDZIodhCfbj+i7yeToD58fZO4Uyrw
 x5h8PhuONKuUii7XRbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX48r0nNB9H86Z
 pnZKjcYaYCAlFQnhwS+tgbC8r24rFJzypUNNr5ZMwjJta7R/l4wkAWSN47Z7tXaw/NkXIqotjB6
 11jM6anMMNvxM8BOZJeO7/h0u8WL30Q=
X-Proofpoint-GUID: vb9IyfXc-WwrRAU84YbOPvwC0q4Jjtyi
X-Proofpoint-ORIG-GUID: vb9IyfXc-WwrRAU84YbOPvwC0q4Jjtyi
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fa532 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118013-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50770731B71

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4c8bc7aac135..9fee5f28097d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 16c52ad07e2c..2f2c56bf9122 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_QC08C,
 };
 
+static const u32 iris_venc_formats_noubwc_out[] = {
+	V4L2_PIX_FMT_NV12,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


