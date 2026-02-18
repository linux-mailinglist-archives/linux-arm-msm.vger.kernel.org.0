Return-Path: <linux-arm-msm+bounces-93270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE3TDnanlWlVTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:50:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6801515614D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC05930060BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0161A306487;
	Wed, 18 Feb 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oP8LUnM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHF3ZP+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F42EF64F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415407; cv=none; b=JadpsaUXNSPlatTUiJh1a6fTBlJI9uCsDjXrEluXkSlkx6OL9ORRLkuGonhhIFTsphAzYkk6ZY8iTCftyljUFoMVNe9rQgjvMFsszWJ/qtQnxp3+xW464eJmUNdsbwjOn67HepQnSlNs8i+30qaYIjL0ylfN9HQXF6J1J6SIfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415407; c=relaxed/simple;
	bh=uTkG8SxfGXtGc9hF4EQnstCUvDWSkWDpXd7z4HESRew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jiXZ2aYvWiGF94HmDQHnsB7gY0nPMAJ5WP+0PuW8iKblkIs9s4rb+HiI6JBjb0O/TEaGS3r3OhJthRo6F2iES/oZ+chJrKSsrrO8iD+pzVWkg2IOIT9rEOCQLrhmq/hGh8aZ6CvAK6b2Ckl9v4/gURitqF79ul0DeR1+aVPnuDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oP8LUnM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHF3ZP+l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IB4lvF1624771
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GZc29+Xgdrc0I46kmjFs+LB5LdhfkOU3l2G
	Io8AJDOE=; b=oP8LUnM8aAwmbcdVfPD2lpzIYURxJI9lrkg9UqsyMwOLjMmpRAL
	7EgkrJyI830Kdqashn1A7ZRZN/nc5KHDHJiOWqozSjAUGwxztAuFJmi2bA/xwjs7
	rvhwKcqkt+Fd/cSXgVWGDC/dlTOmMwLCZBQNXVR9tBNcsG/Iptzz6FM9RJKQsaWz
	2wbjSnCrz5vzl6YICsvj93q0WKH2/Z99DEwlN/RrEXJdVEZn+S1EONMsze+KEATq
	KGYvYJoY6c31nKIL2fiS/Y8xbQ5awHfDUC8EhskKdLX092fDRiU+LXbeobp9v7GC
	7segonXsR80ws1Od2KGjA5I2vRPWCSed2dw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7u831s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:50:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so532822a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771415405; x=1772020205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZc29+Xgdrc0I46kmjFs+LB5LdhfkOU3l2GIo8AJDOE=;
        b=QHF3ZP+l5ACN8eWiTwZ+HztyIduLIQRxU3E7JR2uL6RVPcHK/EQ+eT2qX1E4URe1ZR
         +XA4WwPX0QduocXlO+ZlwE0huUXe2fzN0QfdwYa691zUWuQM6id2p29TdmpGimHIu1gm
         W7CmIi4l2bk5DZNUUjcuGL8RUyI4y7e5BmzE118svN45ccxflTTw9HP2rkITvkAUsZfn
         sf3x/aXmxiwvokTfPPJRJ7MXB1qgoNqiRHqVSELnW8vMNhRsLOavbZOtHyQ7D3H8uVZP
         BayiTHRXX83D6cgmIPmGq09H2mILNpeJ/sk9PTts6f48I3TgaaNj2ySaWIxHIkNceOQQ
         68dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415405; x=1772020205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZc29+Xgdrc0I46kmjFs+LB5LdhfkOU3l2GIo8AJDOE=;
        b=nYsKtWWCSlbaK0EBONsuiqO5jYifvIq4/CU/gQwIIrvhVAT4aS0ijKzKdtFqZOIuoj
         8SZcHb5IYjLL9dK86p7POnOPFKXCuclLYmLCHdfYOZijdkDS+MgfIYtaB98CeOPcaRDP
         pHI6aBldnzfHy9puPXrHZq3CW0E5oIrH9sDSTgM5+cTGIIMgOXSpieaFMSxQg2MpPZj6
         by8v7GGXoOTf7uU39b+ZQtQTfEJG1q5PY1c+z9GDYSMVl9vbCKhCtriXqEzHZec5Fb8G
         B23cncdxydeV2AzIaJQmwEXcZPDA2gksm1Z88KyZ+JnXc4J6T7GXaFEvgtG2kupR2vYc
         jJJw==
X-Forwarded-Encrypted: i=1; AJvYcCXcQDAomo15WJcTEt3FewtBVUJw6aKAxRIQBornaLERii45BSdqNxQ3//FUPjPG9vRLQ3CsuEsWh0l7FD7R@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZJAEjAAqsuD4M5u3NdLvz/BXVo87sYfRjgfC2sI+7Eglg/bq
	UwfR6rYrcWEd0/zIjAnnKmVOcc7bCPQn0YYFlbnZlrYFq3F0wXkKy1MelpkBL71kPisUwI4ri3H
	yfvfcRLAv+ztPr74HJ/tTCgIYdsfrP6VmpMwQ6c0zVwiDuVLSQNZxiUQTj2iWXtRZwsLwI5GCJA
	8u
X-Gm-Gg: AZuq6aK/+Suoj0RQF+t9I5/x6NNB/W9RnOTr++5DyN2jFLgGGWuLuCT979Q9AdcFXw1
	h0vGyAG+HHnOZOURvUeeSYrSA2qVYa3iYMOfBFJxFSkq+UUTPcpusCyMT9C+kK61ck8v0ENykw9
	jBGH5qpXQqiOTYiIqh8YY4uoGd+ds6J99OmTRkdHYN3EX5CkfD3JdM/qiA8BdG7+d6Z25kT6ZYQ
	2cTaB4iq5IMx/i2LONMYCy0NroTq6d7aU8Gc1jkyImjtybDW7dsAY2JUNsxZYmyT3gN66vP529x
	PHBUTKlQNLIsCD4zNgtXvBSXCKThp2ko63BUBxh7o0Dkmgv8B8ZY2rMyWgm8yK+ct0SskhbcQi6
	I0+j9q11bzAShTrGTBPn7EER3OOO2mVq8lJkzwozjqbL5P6xpHaM=
X-Received: by 2002:a05:6300:4086:b0:376:5199:2708 with SMTP id adf61e73a8af0-394fb1f2285mr1782797637.1.1771415405157;
        Wed, 18 Feb 2026 03:50:05 -0800 (PST)
X-Received: by 2002:a05:6300:4086:b0:376:5199:2708 with SMTP id adf61e73a8af0-394fb1f2285mr1782762637.1.1771415404701;
        Wed, 18 Feb 2026 03:50:04 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fd08fdsm12459222a12.6.2026.02.18.03.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:50:04 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Cover letter QCC2072 enablement
Date: Wed, 18 Feb 2026 17:19:53 +0530
Message-Id: <20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PA8RDXb5dx44q9fpelBJyPYOOjZ01_uc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwMyBTYWx0ZWRfX324RNuCepmZ7
 qtK91Bbie5ea5zz+T7+HHKLHcjEwe7dUzflrvALknuaM+fgc1sE/oNZyiIINGOqJ4clRrbS5rfR
 HbDbdq91pRrxaAIghYwtqzbqZcAAgDIYRaSd9oHUXBy2S5X+OzzXPxBUDyfrrKcu4Kb7auguDxk
 A2J8AvKHkCko+0NnahFwPBGO2EQAotefLaI1dMv1JyfNRMH5UvCC2qt0yov3hq3c5sHPJ6dW4Sm
 K8fWKbwOyzN+w63J5KRyxBoorz7ujQmIRGetbaP5954A3+J4JOUSrXkFhh5zhXQHsAj90iACL6r
 5YiFojDQZUryyjWxyhswddAvaj4aNGkqZuC7GTJiOrFzd36DMRFeI/7YrwkGHuxnkwHFI4Aw/+a
 q235OcD3T1KPaNNhZNqOI4CPz7oPV8FfmAuFXZ5SgLxaql4Y8FQCAYmHAkwZNCFWviL/lg1FJ5c
 jAbXy6rjUraKcIKF7lw==
X-Proofpoint-GUID: PA8RDXb5dx44q9fpelBJyPYOOjZ01_uc
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6995a76d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=3MU52FBw86mTojjfF-wA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93270-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6801515614D
X-Rspamd-Action: no action

The history of the patch set as follows.
v1: First commit to add support of QCC2072 chipset
v2: resolving review comments to sort the chipset in the switch case
    and other files whenever possible. "qca_btsoc_type" enum in
    drivers/bluetooth/btqca.h contains all the soc type which need to be
    enabled for BT enablement on the target device. There are few places
    where logic of framing packets transferring between SoC  and Host
    depends on the which generation of the chip it is, refer api
    "qca_read_soc_version". So It is not sorted in btqca.h file.
v3: indentation fix and "qcom,wcn3950-bt" is deleted by mistake.
v4: made a separate change for sorting chip name. added new schema
    for qcc2072 dt-bindings
v5: correct dt-bindings commit msg and place QCC2072 to the correct
    order of chip id in the enum.

Vivek Sahu (2):
  dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings for QCC2072
  Bluetooth: qca: add QCC2072 support

 .../net/bluetooth/qcom,qcc2072-bt.yaml        | 47 +++++++++++++++++++
 drivers/bluetooth/btqca.c                     |  8 ++++
 drivers/bluetooth/btqca.h                     |  1 +
 drivers/bluetooth/hci_qca.c                   | 18 +++++++
 4 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml

-- 
2.34.1


