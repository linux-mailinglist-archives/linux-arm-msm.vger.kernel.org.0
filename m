Return-Path: <linux-arm-msm+bounces-108653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHHlNN95DWqfxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:07:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66758A698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75C05300F271
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797533B9DA5;
	Wed, 20 May 2026 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9tHfKTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTLesh9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD163B9D84
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268048; cv=none; b=atZ321ozAk4J5d/hUhMPS0dMZkoh8kXg/1WMVH52qe4af6lsKVW/5vHllI1RenZ7ATynSWAjGSmhLaYDXhg2rJA1+fY3JmcdYo8+gIEKLRbkOS2M4uHqZF2pqq7q6U9IQga8UFXo6eM9cl+8OOvkFFNsqKmePAZ2E3ndhBJ7oPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268048; c=relaxed/simple;
	bh=Aq3EGiRll8cEh7kakXlEMZDPaCvsmEat3X04muRysSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MiJIox7lmTxJ0h9gX/zN3GqONUGFouZVfWZdX2L3XdTI061i1rx7LwskQU9RXlTVqgNYObWElFjxgL1Ce+SljIDF8gW31uF+R57rwxkkgGiMquZuxmAe+KyfSg1gvHjKBEbSmgLr9gBDl/jYKJjAKAZ0FAX7N3azNrNKvS8vAHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9tHfKTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTLesh9c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K78HdT1963823
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PcF5GShkp7/Z8IOVTXkjaq
	cfidS5rTrtlMbwB5Gh1gY=; b=o9tHfKTg1rk3aNZuTC0z0a/gIBuh7GEKT2zmlN
	+nqokjtIh5PNVy/AMJtXJ0FTsqgnQz7uKI/9phUGH/tlusj35ceVmHFsJ2llw9pB
	vRK6Fj+VPV00D7jqRQrTEqir3mFaL7okle5eoCzrGvn8XbYutVdEolPKaLdF6QTI
	hQnmFlq7ZVhZ/fpTCM3VllGjWoIM3nx99aqMJXuhRn8P/FXRzE8uU6CMnMs/XxDY
	U7xURVFIYaXVEyVT1UB1vJ1dwpaLOgjND6jhVE/n8Z5JS9wW541e+vbw3CObOKB8
	Q9K6Wl+lOEkhXv074in1JA+UzHgadTXXFQFPEhZnWrICoS1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3wnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so5178226a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268044; x=1779872844; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcF5GShkp7/Z8IOVTXkjaqcfidS5rTrtlMbwB5Gh1gY=;
        b=LTLesh9cbNc8kTQTQk/xhQKiXGhle3l5ofKIumbbljto4UWbFNOZJpelvjaLd3b1mg
         YGf72j+wWzU35trIJhVITgEPxDVeoOnBuUnhkZu9AssheYTaxluVNHDOPxdcc5o16w/j
         1TVjGa7rlSoyhCAS6gyQIKyhveLjjA0lrW3D77RCpF0Om5T4Cxkub7hdzx8BNC5OzeJK
         CWJyLD/nSp3dtU/pC+JCb+zUQSz2y1HiJBYgWA4UNrTmOEYkeJBgX0IgOVcd0aFpLgEG
         Y6GsxRGswoDVexI2ki9DoYlCCfv9MI7rM9GRquJSQ7/xAAXNFBOOKJJxel3ojHO9eNK3
         +n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268044; x=1779872844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcF5GShkp7/Z8IOVTXkjaqcfidS5rTrtlMbwB5Gh1gY=;
        b=aA5jnQ7+BoUSdO0VED65Gz6kw9Atr76XY+GlqI9zpWpiUxPN3QA3FQ1nkjwJTKE4XO
         zNCH+akvBMnNcKvlsQl8mY5ai6DPC0erMF76GuHi5cD1Nj4rWDfUIDH1mIdSjDyhk0yF
         E9tShxkM85MF6QA+8CfgRo4/FeV/cfY9TqwurQC2K4zW4ud/UqVG+FuQc+Iz9bccQIp0
         c6VKOwexRZT95fCRfn6sr08l7J22UMG6dXptmAH2TDiPDd9Fl2SyTRWcYl3+l1rga7WH
         Ic5Jz3TFS//BBftKhOdKDjPhYOQtU498G8icwCvmceVYNVl5bGcFiSd30+vcV/voitHk
         fUgw==
X-Gm-Message-State: AOJu0YxOU8UrExolU/WRmtFRzBJee8y4fM6CkJYdbnVkNLkub7kwO+3I
	15HPTW+2rBI26PMTVldyo8YBa90vAVDu202F0l3NvxZnJrgJzu4YPYirGm3rQgcVF90XAxMnFuB
	Z6yJNvtHLw1GtpXtgxCTJh3IlD5CpQk7CGG9bo9+Gu6F8+n5FCNFc6vyi9GB/diFeX7o=
X-Gm-Gg: Acq92OH7nmyrSpNqQNDnRjSbJCN8OF2zm3Qd6MojSnNtMuycCwI8VYPNpMAukp+3pX1
	FRZkR+DfJokBJ+S2b5o/qQHD6EzYadv3TOgN3xsqz+N0y07q4fes4T9P8WL6kUD4o9kvj6E37T8
	feWz+JwsSrElxTi9yfUicwlNN4IqwY48NB9IlRw4RnQDNZ4ydt66AYeXTql0XxgsS+lQeVUdbHc
	OhDqkaS7nSOzgYL76o/nEJabiqMSkEag8UL7G7bg4zJVOL2zv8U8R3ku0TpentU+0/G2+PJ13+9
	USk4+9tqYpJlxgXMRNnWHjSmOu7YuVNP4SxvfHHN08tE96v+fj36XWyHu8afMIAzkwZoEgbHGn4
	6QhIpM12CtNds1+8Z2G2KNiHsWNwbDf1tteQS6yNTC2YGGuPVfoQ=
X-Received: by 2002:a17:90a:1649:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-369946d3704mr11068322a91.5.1779268043880;
        Wed, 20 May 2026 02:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:1649:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-369946d3704mr11068300a91.5.1779268043361;
        Wed, 20 May 2026 02:07:23 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a8612sm17079903a91.12.2026.05.20.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:07:23 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] regulator: qcom_usb_vbus: add pm4125 VBUS regulator
 support
Date: Wed, 20 May 2026 14:37:10 +0530
Message-Id: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL55DWoC/x3MTQqAIBBA4avErBswU6muEhGmU82iH5QikO6et
 PwW7yWIFJgidEWCQDdHPvaMqizArXZfCNlngxTSCC0FWu/Hc1OV1HhPV8RAC7baNbpxxpKqIZd
 noJmf/9oP7/sBsW/nXmUAAAA=
X-Change-ID: 20260520-add_pm4125-vbus-reg-95c858c6ae43
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779268039; l=815;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Aq3EGiRll8cEh7kakXlEMZDPaCvsmEat3X04muRysSk=;
 b=00F1t+ApeQIYaweDHjHwDoqN4Rb7fSVE8RbOLerC9frzmUrfynhFaHpq//qE2DiLJZFb/V8da
 XSQJ5pqKtTaCJZIRMhPwHtfuNOW59733Q+1jaCtDs92Mnr0wBLOlNYp
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: NkwgIP0S2AWiqw2XNZuJt19v2T9JFyzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NyBTYWx0ZWRfX9HDyJwkre61/
 bZJjpc8zTYfO+c2mAOkYWh4BNhoKoMdS+WgqIBUqUP9gLFr5CRv/gz0ItSoyDcGFdADTyTvB7tf
 3I2srlfynD2euoXxmYjPG742LWI8oTDrSj1zJ5INPIsShzVXBk9aoUBfNQFlAcXhFzucecrieoK
 Af2fZFoV8w+L5uddLjxctZX/GLyIKFvmKyvbF2in9+sOqrOw2IVRoRmx7UoLedEf81osVoJvPda
 35peHAJHOh2TQaPxZFpLTZtp27amBQP7WcW/Z3Cz2cex4yzTnvO3APBXObVrdn+AAPSr7xhQ20T
 Gif4Jc/xIeFfWA7aGMZ2SdXv4z8zHq8LPfdvnsCKUrhPinbQGm3jhaZtJe24FFbajr8zhOvE2DG
 SHGJwy5fgB3Qab5yqUHl53qFNYFZ7OOCr9lk/tFAZFJQvqxrQKY+KjVZ4tPQrFPLnSQkOnO476p
 f3f1EKRlBLbPfAXr50Q==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0d79cc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4HaxCju5o8_Txk6xNbsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NkwgIP0S2AWiqw2XNZuJt19v2T9JFyzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108653-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE66758A698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg

 .../regulator/qcom,usb-vbus-regulator.yaml         |  50 +++++++++-
 drivers/regulator/qcom_usb_vbus-regulator.c        | 102 ++++++++++++++++++---
 2 files changed, 133 insertions(+), 19 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260520-add_pm4125-vbus-reg-95c858c6ae43

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


