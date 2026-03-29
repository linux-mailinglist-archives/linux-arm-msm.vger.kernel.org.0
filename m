Return-Path: <linux-arm-msm+bounces-100631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOIuGQBnyWm4xwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B66CC3536C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59647300F944
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF0633F595;
	Sun, 29 Mar 2026 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ4lqIkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9WUD9MV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF7264A97
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806780; cv=none; b=jEwk3Yq8qjmLDxn6X16DUx7mD9zMe1dIM76OeKDGfA0x1gIEmg4QPtpaywJ2Ur8DBAkC3ikAaf8BUNE1+ppiwr2bz4DftlyzzhLv+VoMmzLqW6r13JwtL+AtlfHdZnojmK11cyvZrbevpmcKSSWvwWxAN0l+uVPaiwBiLIET+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806780; c=relaxed/simple;
	bh=d8P2id2IC+kxZmNPYnq2jpvigp1uHGraqD2gXOiQ0VQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eRNqEo6t2ApGXL9xvQjraXGEDcSifEBBRrALgNDicpFcH9QGPi/Zfs1IeB4pgtk2UswX2stXFLNX0LUeSh/Vd2b0t3Ir9EZ61wqryqpK7s0IFJIuJ61o+Z/5HGRiovdO3g4/p+FttgHHCajN490j+6nUYNaY2g5qd/6fuqS1oVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ4lqIkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9WUD9MV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi7kQ1617605
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jslQs59Tp+epsfDp0e/6dfPWKytmm2GvwOq
	6ywz8kc8=; b=MZ4lqIkOCfg/UNB73IlaUqqZkdD1sYae1XrsvwNNhwNZN0Hk8s8
	fJM082ZWf7Kc502kgKXtpytsjT+9+mUEToocpnuq9F/7OPBbKf+XbBLamWJoaW33
	nIQV9NTWHkUXZmXGn6zLkSZuKMUF+UbZ2JRlPbnsS820bOHYuAM1Uu7Bm5HBBNit
	DaqMsQKyaAI9Yph3PEDdVuJ3eV3WKFBOJF5C5idelV4XN3nQopuVQrioN0mAzWVq
	Ht7h3AHAgWv+dWJCERqrMPt866i0lCupsM4J4CSEY2NIu/1ghK1HF5NI9Sk/UZVd
	9x/7ZER5yhHHJIZ2g81heiF86+X8ruhzq+Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672ubb72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:52:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76a2c99a27so285016a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806777; x=1775411577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jslQs59Tp+epsfDp0e/6dfPWKytmm2GvwOq6ywz8kc8=;
        b=Y9WUD9MVCLY8wgPkxuXBUvFfUilEvJ35IGCx49xVtG+4fHfkcjOVUZHMl6KSl6jUYS
         hcIWmbGYsqTke0diRLfVdEogowE+4loegLt+pmLLMwrJomL9eM21DPuz75fD58620AiF
         RseA2qTzb7et9jpFhmfVmVtaSp7W58kqidk/T+9u1IdI2KLcmCB6/TlqZU14679u9o/e
         SkcX5KDkvVqqN/GMQG85hGERxoP/0lOj+xRtFQ6uk4p10Lsk7/QJMDRHMgAq0sUFvXNG
         4bhfff5G+6tJUSXy754Zv6ggViQPh6KkQmbCaSuf5Y2yt+1GiTHJIok1Nv2fuLrz6wb+
         HctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806777; x=1775411577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jslQs59Tp+epsfDp0e/6dfPWKytmm2GvwOq6ywz8kc8=;
        b=bjKO3D5GAqyAul2yTchivzo58PHZ5fTRxz6GNwVXkUDY4+IRUudyTSkCXlePWI7G/m
         OZ9JDpXpT7eo3DGVADtlxmjJgV7YsSXqAPGsL47wa9ccQq5q1KzUDu7PiQNxYi0yhbto
         9rxpHS3LlcIjZfHM47u2xnqAcV4nfNZloPneigmgeqOCl+hegCUmKrrZbZEAE1KwFs8F
         BmWl3HituV8vpSJAwdSwJ32kw4IELUYoqUvJiAVxpe1btSIC2nRyZZ7yumkAPhKCHZe4
         NhqbQ2XqFc6Zat1ewfaeXowucaSuV728bT/gDoMk2Pq7CDhsDx2iPqn0fyB/69JKMEL8
         Z9sw==
X-Gm-Message-State: AOJu0YzFHkN7A1cN7tmE3B596u6A8TeRcJrU4fuzJg0ri5ZnnS7sBVHc
	yIZHzI05E3nuSX+B0O5c82nDCq8JjUTNDvrt3PraTvcONLRgfcYX4Fqa42y2O0a6y4Z9nO9yefB
	ivxRfmb0TsYs3dwYZeMDJxFRiMZOG7sm3QwZcF8bI3afFaUv7hB5AAJ07ANWIXEfYjKarpx1Rbg
	EL
X-Gm-Gg: ATEYQzxAnAI3bVpi+ALBqCC07/zCw9sMPGQOHK8ckRTcFaC7xdLc34uNPlfdAjPq29c
	8v3EvKuiW9VNAuE6iwQQfYp/vuvEKoJmdswDzVcudDrR2CMJgzRHKc5cM1aFvGuvKexDl/6a9EW
	F6y0E/SfT9M2QsYm0kmEETjsrmLyZmGGN8/gtlrr4E2yvCqXskIyWEd3kqOKsq2KzJvFcBHQuME
	ZXeQKFUFSCDC3NovAkCnvUoc+Yp2Z2hlX2GD0662IPfO68rZVTHckfXZFlnHRTW6ZRslafAr/PN
	1bG1V9FZeh6IBSjwe35YoT3Vo7D/NgH8asG0iSGjk1Mn5PbWQanaY8m6aIDSYoxAwlnZyykZDAh
	JY8bc/Yzs7dMMIW15G1936fWVVhP/SyGm4317fyPt+YwGQQ7UaR/mU/dmCDI=
X-Received: by 2002:a05:6a20:394a:b0:39b:ad63:4792 with SMTP id adf61e73a8af0-39c87c1518emr10652690637.63.1774806776970;
        Sun, 29 Mar 2026 10:52:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:394a:b0:39b:ad63:4792 with SMTP id adf61e73a8af0-39c87c1518emr10652675637.63.1774806776508;
        Sun, 29 Mar 2026 10:52:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:52:55 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add USB support for Kaanapali
Date: Sun, 29 Mar 2026 23:22:46 +0530
Message-Id: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 71t34AEoWeANI7J7qEfdqhb3vqCr41rt
X-Proofpoint-ORIG-GUID: 71t34AEoWeANI7J7qEfdqhb3vqCr41rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX8ds7zk4RaaoU
 2VUhuT6te6aF9XyVqGPveaSJ8F2DXi+icGtgKlAY4fPDuygRMRXmWEsjEXYdaHDXmHSBlWoFnfl
 taYoc75gg4FEm4fRzMHYAGjNNDd2PC4ASHYSk8/JlG2eoODSMAOlkIDqN/KZI4T5mFoB/0lF7Sn
 22ASV+lnMmYweAkbAFOvx2YEzUtCnn5rZe+5/+lQ+SXi+Vej9xuJ2tYBGq6sBuu5VkUn67p4VA1
 yW9OBPbxpp7dZVuky75kz1Rh5f2OkRbQuITvpP1J8i4MTFODpNuyk9PSotEyyuhM8vKaYh5r2UY
 ThyxGJlL/Z81Btpja+f/SZXjAzFsqBfyU2O4nlec2pPvXuRR7xdMalKm5GEXiYgujn1Jk4dgwXh
 zaT/vBUQiC0RxA9zw0GeK0JSSMnRZz6df16GFVNwzzHvu12gKDEykB21W1l9dhNwK6UuU1HIiVX
 W47PuwcL/8T955G5dPQ==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c966fa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v9h4A0QrD9t0TD2QtpMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100631-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B66CC3536C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

V1 of this was a consolidated series of many functionlities on Kaanapali.
The first patch is patch-6 from v1 unchanges. The second and third patches
are parts of MTP and QRD specific changes (patches 14 and 16) and commit
text modified to indicate mtp and qrd specific changes are being made.

Ronak is the original author of the patches. Kept Jingyi's and mine SoB
(with no CDB) since we just rebased and send the patches in v1 and v2.

Since SoCCP changes are not acked yet, enabling only device mode.

Changes in v2:
- Sent USB specific changes instead of all MTP and QRD specific changes

Link to v1:
https://lore.kernel.org/all/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/

Ronak Raheja (3):
  arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
  arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
  arm64: dts: qcom: kaanpaali: Add USB support for QRD platform

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 154 +++++++++++++++++++++
 3 files changed, 208 insertions(+)

-- 
2.34.1


