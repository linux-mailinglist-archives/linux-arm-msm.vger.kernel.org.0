Return-Path: <linux-arm-msm+bounces-118481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8JaxH+x4UmoNQQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:10:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586474256B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:10:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZJn6bLnP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UX0NP1N5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118481-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118481-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7514430089AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB383C140D;
	Sat, 11 Jul 2026 17:10:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37D3C945B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789802; cv=none; b=Oz0+hLMlC/+dyiqPI9akvFyOehAbUk+pDKRylVvBgr/4nenQMGpkQf+Xa1QfvA3f0xPbl0aMvErshQN9cewy0Pk/iGqiaMAiu5x1GhzoVdE123QcofdcHPbSUbvIyW1lFXJoDOH8Gz35Xfa+FzrqgO20OgEXmFK+vBSz13Os1hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789802; c=relaxed/simple;
	bh=f5M5hytx1ky2qfopaUhBZoYqxyomhDfuBgV0wm3ocnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RFv6wl28/heOsqpyvuZTnTl80WQhhuWK4hTYQJtqQHbmVEezJfXQiXobMOLHDZXNLNby5PhoSWk9vKsNms12yFHKZ2i0zl+0b34dkDdaqRnO2z06iq2VQd6AfObPObxXOG0WrLLLxaxvEvq+bDZR/ZslqD8QX6BkC1oSVQaVxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJn6bLnP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UX0NP1N5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOXAa3916523
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=62TjJ0RY6VeZ5IOBdjTqk2
	iAOTl905RMhzB3iESIMIU=; b=ZJn6bLnPlKsXEqftIeuZ1GwNFtzcOKaheZRZpE
	oHnVV2+vOxaR3yhmj2EMBk22qA91i/ekI2vmPBY4JTB2n9wTzfnCklqYSoJdhKVj
	MoiE6SbdN7sMYy6eiCS1J1PAg1igFDYEqWhGi4rNIl3Q3P4Hel3O8Xz0pgnCVz45
	cfwidpvjS9dWC0UVHZV4d8CRoLLqSguACr/u/pNQphMng43JyAh9D4Z05BX+jFq8
	UOdipfFuMTldtRXjpq47+crdx2SqNgYjc9p+oNVDm94/1Z6X2BehWwG2LFFRBl+k
	FX/Ypl9FgT1eLCEwCvypw0VyLslhpVPKYI6mMzj/Rbf9Q0dg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9h94h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:09:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso2975804a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789799; x=1784394599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=62TjJ0RY6VeZ5IOBdjTqk2iAOTl905RMhzB3iESIMIU=;
        b=UX0NP1N5NcMGrz7psz3Y5IPIVwoRCm9u0agPGp3/hrztwE9TF2V/FV7+DTPFkrv+W7
         9kb608lITxiyEjkxHEqs6Ur2IBNfgRYvXngf4ohyBGP0L+lE6ne56K/fHedI7JdhKjMO
         hKTSrNVOFWjOwHq52YlwWqSmom3dlb3t4njwFtxsDKpOShK/7qwH/1reiXqaupQ3jMT2
         PIGiwMqk5AaE6qIGsvNWlJym6CHo8K4lCVqBkzJJQJCaeVDLVL5S6qh0a60KszW6rDS8
         uG5aDAjFVseb3WQEst8MHhX1fZeydYhr76CafrHFJVLar8+DuDrNO+OsCnMNBI97lijq
         5wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789799; x=1784394599;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=62TjJ0RY6VeZ5IOBdjTqk2iAOTl905RMhzB3iESIMIU=;
        b=Mk1e9nexqTJ4+i1CYQKmLntEdEdlE94EKKJiLGjRvhj0u8nwRcli4uNI7+D/xjOqkY
         mUBeyRIK1ruknpp/s4f7lXpG0KfNeCnhLqG7amIGG8yPniDqcTN2CqmWcxbWgJd7RP5J
         x5zqE4CbhryexvfW+4h7tPdVlzPQwouWN9vOm9hj5BbG6XjAaXo2Rak6HwvJ0USJ/Cmo
         Pa5IoIlL/Eye+Tx3R8bcFFeUDKsuUyJDFiV/kil66WE7k4zIo7AnME9j8VGxlvDqZHPs
         djop4urZajbHriOML6ofYoE1pZCP83WrMN+UYYjF+taMXZUBKkNFCiQuNOHEYcU4eRuQ
         FfCQ==
X-Gm-Message-State: AOJu0YxWNDAUBRWy0L9GQHU8ADULs0Pjdh19cht5Y1BE2yx/oReVkGbC
	5wRGC36gu9j+GUaI8LksuTlpy3O5Y2uRMk6CAfpwGOe/mOYP8LfST7EZKeGQ9dD9/UCZhc42E29
	yaLLgUJ+uNvbvMAOMu8pWAofdMFKz+UcrCpxYyecSX/gGv4JsrJjN0ycuvAw4lHhmIfii
X-Gm-Gg: AfdE7ckrH6204C3PbqUtqDwpsO7Ztismq9USO8W0a/sTeOMSFIg8+CcpgmhsWdfkX/t
	JjoQ77Dkyb463AmvpCKlA2cz2sQ8QanGDrQfB2gpVWIiPWC/kcvypTu/mGprGoO2AY1iypAeutT
	ef1j3cdZ9fdziqGdrwFCOsR3XKSEI6KNTWjh8yhDMhY29PFHJemUrFwVVQ3VmEwpF6NFRovWXf3
	PSuo+AbqHOrO18f8BAOADsfsNrOzv+oYqtdXllOcKwg2nvaQNHuFx+jxC4pFD8b94/4z0t1PkrV
	xX0L6013VJNAFLVO164IdgyrSYL5JpACwqa7YHmSgGcnPmA4AfvKuHxM9/jY8UMKbxxRhFi3k2W
	bzMzs4/Rdq1PHc13krP4aGX26rMgukr128+8EwMZHuRJT/iKuQhkSMKRellcmd8DFVFn9TYH1bd
	IWyKBA
X-Received: by 2002:a05:6a21:a109:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c1142e7916mr2962347637.1.1783789798586;
        Sat, 11 Jul 2026 10:09:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:a109:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c1142e7916mr2962331637.1.1783789798131;
        Sat, 11 Jul 2026 10:09:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:09:57 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add USB Phy driver and binding changes for Qualcomm
 Shikra SoC
Date: Sat, 11 Jul 2026 22:39:49 +0530
Message-Id: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN14UmoC/yXMQQqDMBBA0avIrB1IQmOhVxEXGidmWogho9Ii3
 r1Rl2/x/w5CmUngVe2QaWPhORbYugIX+jgR8lgMRplGPbVGCfzJPa4ypPDDzaLXRln9cOT9CCV
 LmTx/r2Xb3ZZ1eJNbzg8cxx8z8kzvdAAAAA==
X-Change-ID: 20260711-shikra-usbphy-v5-f120514ceffd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=2238;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=f5M5hytx1ky2qfopaUhBZoYqxyomhDfuBgV0wm3ocnQ=;
 b=3hRKKt8/B9PBUko5BUNEyYK6WYFA4VpMX778qo08Ux0D6etYTvZja932rpmm6tfzfGQQzrQxR
 fL61e6Dh2cpB43MyQFsFs2vbxxDQ7YkQDJSTBuSXCO2n0SQk9DVouKm
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX49+qGw1ZfwJv
 QPSmn1/spRYhYCVpuidRTKpSSWQXcWWyZY8hLtcTCv/0N+Deegce5n2QV7BwyqCIipUR0eRx7QJ
 58eEs3df/RctxisU62ZC5TTzzDFEPnw=
X-Proofpoint-GUID: IkDHGdgDhVqU8obxRnG8yr-NMm3KP5JG
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a5278e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=snenXNZ0Rr6npqWaDuoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX7HQGb9uE/bMv
 mwGO6Q1smJaGLvjLeUGee0qs6F+4k7LQQcarP7exhm75xKSROESq0idpvHRHaJoPDbdmQ6pUnGB
 78pRRP+JudWEGkLfPUDPYIsTG4akwUoLyYRGp5/OPAHLvkj7qyEaYk9gTT391uWlE3CfugatkBh
 WwdJjH92E1fov9/FOZv8I03FXkmf0GRawKlLV8y5Lq+yPCSyhfa6eyoXijL8aXvsiBShYVxwwJ9
 A+fGn1pAdVxUXllqfmEiPO9wShMKwaDRnlbuY20i2ovQ9cNoY+QXA+lqd1k3BFhENwTRdhU9GJc
 nYpisDVNfWsIiw+oSAY4+H68alUY0IJZoCb4NVhNHiU0LQi7WNEUUzO32eBcB8rr9VdA7w+PZyq
 OaKWLI43WWwCDiITsmMbd0gYe2IlFl5Pca17z/Cbjo35uCMrgiZJuCKzPaKcQXZiPzwYnipXreW
 ePBvvH5cVwIS+pTSGXQ==
X-Proofpoint-ORIG-GUID: IkDHGdgDhVqU8obxRnG8yr-NMm3KP5JG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173
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
	TAGGED_FROM(0.00)[bounces-118481-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1586474256B

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.

Changes in v5:
- Fixed shikra specific minItems property for qmp bindings
- Rebased qusb2 driver changes on top of Dmitry's change [1]

Link to v4:
https://lore.kernel.org/all/20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved to using qcs615-usb3-dp-phy and added resets specific to shikra
- Updated bindings to reflect that there are 3 resets used in qmp phy
- Add remote endpoints and orientation-switch for Type-c handling

Link to v3:
https://lore.kernel.org/all/20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com/

Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra

Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 54 +++++++++++++++++++++-
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 53 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 14 ++++++
 4 files changed, 118 insertions(+), 4 deletions(-)
---
base-commit: b7296e82650f0130b8811ef79c5e17aadbf85bd1
change-id: 20260711-shikra-usbphy-v5-f120514ceffd

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


