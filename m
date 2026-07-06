Return-Path: <linux-arm-msm+bounces-117043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Le+HOEgTGqXggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:40:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D878715C46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="HJ/ojeK+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jr4FIulD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BC21300D4F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80BA47DD75;
	Mon,  6 Jul 2026 21:40:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B5E3803D1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:40:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374045; cv=none; b=uIEqPGDqxMd5hWVc7aYbD7F/cSyIMy19RgO+CmCi2hOuP3YZhA3zEmx91K1+LtaWeLrSUbump+cNZWoNlcXbx/sfrB7JDS+UHdXu/tGc6bJZQn/5sWC4+VG9aMoI4tNXmpk/fZOuHTirmEUuh3tzMzYkmuPst3Ot0Kt/w9crBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374045; c=relaxed/simple;
	bh=bs+iDFNnM8Jvg3DP8d38QXtbWpKTJaOmfgrbI8NBa80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=meg+HiFHMZ9SPFcJQkA9VTKjQdyBEM9VsJREB8oNCi91GR0dEiJGLwPmQg55k+PHyveGGm2LWdSl1au+C/mtZEUUY3DggtV66pCZ9vmQeQWIYSYbt4SJkU9oNfFTEoPnkxXHrf5osFMVhmejhYSWSG22wF7LFLXZCdn5j4q1drI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ/ojeK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jr4FIulD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEP8b1639973
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sl1a701shpBJWVBwhh6ZP9
	Kq23RhfGUWyGD/s/IZgbw=; b=HJ/ojeK+rNwO5/4jDzx12MhnRCZul1oJFph8di
	W8Yl3e0LfnHow40KFW26JFj3+W3qYKDV0ThdvEkqL9uRdIcNbMlTnSrTI418lKoT
	HcS+0WsOkarsXHksd1jH1K+4H58sfNwi9+PMddDszR+cbSV5IgeQyDJ+ntG6W7Iz
	zeZrGa5oMyDGOs2y7JVLfXrwhK2cozLNPX66JchWQXlZv4Majx43CqdEbnpXmcCK
	cbRQzCkqDVWxSd4aW+JHVFDzexafSnUjkxgEIqVfvwlrRRVwzJxNQB9o/DOW744U
	0UHJJCZw8g3nXyosAH+SDzix1hWlNzdUwB8TOcyBa8nOt9Jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2ybq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:40:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9ed5caa3bso92895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374042; x=1783978842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=;
        b=jr4FIulDwdsQILHt8LRNW0giRkSew0oDzz+LHicEbi3VBPVo3UEvtdovw5xnOq76Gi
         rLZIcjS+iwAd8p5jpr/JJvHLekTm6RQvNxqHsreh0lPccZXVshz9PpeZsxb9uc55hJbj
         sSM7Bi7pX56RQorF0s/GDTFMaPhaQq+C5Rl2MZM5Xk1XWGQbkYvC5VXFsClzQBwOx7sq
         LYgtUiHHu9FopgmfTiyyDzKBzK/F+YkJ/Kc5Jvls4hSF4YvQKDAYGFCpcul630dk7iJq
         Hb54/zxln1Us4qYWGoqpvaCxMalvRv2h5sJm9alerrBfO+HdhxzkV08XXx0w/8EnjRgJ
         7hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374042; x=1783978842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=;
        b=YMfBWrftQU2Q3Tvppq33goy2R6aFcKIWdlMPrqvWDnq6DMcI9VynFZ8Az7rw5lnU58
         ovgrSvdhevYLnQKAQVEPQ5m4mZHv5CRop0804/+OXnFe5DDd/SSP0sMVHx0mBpvh5jBY
         7jEzahNUx87N22z0unoNod4M8SXWCl9ZSinFSeYM4f4HNDh7N5LYIPtez/SwODNdg+Sa
         qqtYc0qXc2Z37B44H3yHaqnLlfgZB6+Am3Ree2TO0F0BWMk8z7mY006Qo7YQWd2LBZJV
         Flv3IIpMGGUD/JEu4DhkrZrLXz6EjKlcti4W3vAJ7RKLWYaoiYZVasiGOnTTL813je5V
         OnUg==
X-Forwarded-Encrypted: i=1; AHgh+Rqfg5s40Ql88ILaub5SnEX1aIa4pVOI9Bv6IetwZDYaX3D71/w58u78AKt24Lqn3j70wEno1K+Gq9PiLMxy@vger.kernel.org
X-Gm-Message-State: AOJu0YzAC0BfnGfWi5w+g8lDbYLfKwysIRf2M9rlzeew7kuwCmpzhAHx
	IZk6lO9+91JLkt7KGTbnugTPnPtDxlVOh2wL0Ko5hLP1hPWHqzj7pzlVXdZHjXySn7g3Ln3xhCA
	0EpuEWEB+/Gn8JdDO3l5H805P3F6fAe91WSoNQ6pnGTaA5KyjgPtu9CZeQdXmmmlrntVj
X-Gm-Gg: AfdE7ckLiuciGT7vAOFHkx9yhKLZddobpSnXRPB3zzxiDNHG+OKLxl1rHZXW172L8K5
	b7+dHER2Vt+sLJVA3fjCtuxEl1y0/ufEWa5izGDdNDsgOaZYaWoJrLm5IgsPV1T6PvkrcXe/sou
	xzPN0GKQyqOsnyfmGgwa7E/IpOefI7vQhFyRhZzOxhVj+SVdz46TKYY4fIixUEpS8heN6jgmKCH
	ghKSkuncq3N0ppuLS9OLeDt/GZoSTgnonE0ojJZN14yqwHk6WN+tXpd/2sLr5KSP2Jm7luV1yIB
	aJeqAadXjQZb6HECrOhCvkD4OD+SPsTvCGg1Q0uoeXfrlUivgYraFEUqADbH1ziF3/yNwsqUy/6
	OZ363Gzu6513mc2/4Ns/FTccZ6ZnS18UCov8=
X-Received: by 2002:a17:902:fda5:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cccaf33717mr555615ad.30.1783374042024;
        Mon, 06 Jul 2026 14:40:42 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cccaf33717mr555215ad.30.1783374041497;
        Mon, 06 Jul 2026 14:40:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: Devicetree support for Kaanapali
 GPU
Date: Tue, 07 Jul 2026 03:10:18 +0530
Message-Id: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIgTGoC/23OQQ6CMBAF0KuQrh0zbSmoK+9hXNQyQqOAtoVoC
 He31IUJcdPkd/LfzMQ8OUueHbKJORqtt30Xg9xkzDS6qwlsFTMTKArMuYCb1p2G+jFAFWBf7HS
 JXOZGCBYrD0dX+0rc6fzNjp5DVMP3k120JzB929pwyDp6BUhyiZIthcb60Lt3OmfkqZHmar155
 IDAJXGDpRGo8Nh7v30O+r7g2/gkbxQ/o0S1MkQ0Cm2UrEgVkud/jHmeP/+t434kAQAA
X-Change-ID: 20260412-kaana-gpu-dt-968a70134c22
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=2226;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=bs+iDFNnM8Jvg3DP8d38QXtbWpKTJaOmfgrbI8NBa80=;
 b=aOWgjsH3Quqy/Ba4njoZ6uizggyqsh282W4b6iHuOyw2JsdoW3L0lnBNH6TZEF9o3L50kD17o
 ubko8wpOpbwD/Y9jUT9CfcTBibDg0S/mj6CTh3/lk6huCzK9uduPgpM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX2YcggcVDz/jy
 bw+tYUbytlxkfbk3DX8J0cBDsOoi/S20sJKw0hFb81H5IeZ6i8lkpfnnqZH3wRdEPmbKsEoYBVE
 Jo4ZZJ6DXlrFteSlcKxzK5uQphps8pfH7KsrnR3DwFCJ7etayLFStCUTt/EbPoAXump45zHTuaQ
 BZTLOpS8MsI4UexOF1nILjcBUBw9bYsswqWd0QYPpV/U64UK35Io/eRujCwEIR4m4vrhp+Aa3Rx
 N8i58is7NBcl6SrDgVLhZSucfsBmS8ML7ndtPQAx9BN4vfT2hX8xd42pKy6rYY/zG744xPrAFPY
 M2IeG6tIwzeXZavTiJaLYy8WJCMBgiJoN73W25HjGEOQlkzLD1jz6AR5c853xfMpMNBCCDxK6wV
 171ym6+TPAcnqHUxXAXy9rACVq0ah/aVMjxDPioHcoZ5z7ZnJoy9cvwAxH6OpRPGFwpnQBZ54A2
 TGoZYIyb58ZMR/v95+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX21pZq+te2tei
 HquzRbtb1Flm/xqO3zIqNRCPUliICl2g03ULsIpb9N+RFtc/6QX7UfKP/JNHgWSe8MkiuOIqc6/
 h2x6XAgVGGXcnnjkYMs3dNLRpMzRjq0=
X-Proofpoint-GUID: sZxmnSbnAixH8k861zHeCq9iiUV68Si7
X-Proofpoint-ORIG-GUID: sZxmnSbnAixH8k861zHeCq9iiUV68Si7
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c20db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117043-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:quic_qqzhou@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D878715C46

This series adds the necessary Device Tree bits to enable GPU support
on the Kaanapali-based devices. The Adreno 840 GPU present in Kaanapali
chipsets is based on the new Adreno A8x family of GPUs. It features a
new slice architecture with 3 slices, raytracing support and other
improvements.

This series includes patches that updates DT schema, add GPU SMMU,
GPU/GMU support, GPU cooling, and enables the GPU on Kaanapali MTP and
QRD platforms.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Reorder properties of adreno_smmu dt node (Konrad)
- Drop updates to the HFI interface as it breaks legacy GPUs (Sashiko)
- Capture trailers
- Link to v2: https://lore.kernel.org/r/20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com

Changes in v2:
- Fix formatting in DT patches (Dmitry/Konrad)
- Update cooling patch to lower the polling delay (Dmitry)
- Keep both passive and hot thermal trip points (Dmitry)
- Update GPU OPP table to match latest downstream version (Konrad)
- Add a new patch to allow HFI related structs to accomodate >16 GX levels
- Drop the smmu binding doc patch as it is already addressed in linux-next
- Link to v1: https://lore.kernel.org/r/20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add QFPROM node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 458 +++++++++++++++++++++
 4 files changed, 476 insertions(+)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260412-kaana-gpu-dt-968a70134c22

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


