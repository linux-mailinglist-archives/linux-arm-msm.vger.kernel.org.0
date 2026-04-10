Return-Path: <linux-arm-msm+bounces-102746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMSUJ+9F2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:48:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA843DB995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0494F303DA38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CDC3E51D6;
	Fri, 10 Apr 2026 18:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJiFhiSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKFCtJdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874B3EAC89
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846652; cv=none; b=SKRf6Ke2R9Fl/Z2EgAGXm9ck2rcy134SW6nemTCFNeT7b1adgBJUt2hJo+skQ+xCtJqRevZshT52PZAv/FStmSRr8/riPVwEAXgFJA3mduRo7vdkZc5gb0YIcXAvxvx07dVq2Fawq8FMsA+MQTT2N+tZsPYfFeOKr6jwjbSa2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846652; c=relaxed/simple;
	bh=/t2eeIB+o5Fl/LeZZS3s9XFIxqcFUVwSWz7iP5Ex8Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggbPOqA5wazbi/Y4d0qAOOHSlSYMcLB8MmtM4QWPKxfmbiTyFuJTLEnUgLHbkPeU9gwfRExiimpg5FRRKcE5jRu1Su0veqsBa4O6+AYSv0tqkSt22R6MNLzzYiB41o7TGrbJk7yWdbFnVCkSLKEdrdbSgPbL2ZCcXpBcpljL6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJiFhiSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKFCtJdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHA9th1498630
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5s9D9e8hYix
	OqU5sy7Crs/tgyj4HDh+iuwyCYyYRRyo=; b=nJiFhiSOJ1zS70ykGZgMZidY0TM
	cezJ3asFT+o2D7eU6ZGiATYdCTsxZif1p21Q9zxO+h5NCKWBcGKpljAcF3p7svH5
	kGQBsGr+3s7BWZ4rKa2UrrtDg8jNJQHPrrBIj1gYE8oMKZLPEz4vWAKS6QP03pyi
	aYY0XE9wUrp6hHRnf3ndvEwUoic78uO1MRe4nh4jqD3fuyicJZ4VdSbX57Uo3mjz
	nYjlrQRJnid6LVeov5uLr7vZjX+LW/vrtcPasF4fZ5RQ8Nwr3o+ffH1qZCixNQCw
	n67KRKzhM75zT9Fuq/f3sM0B02lHwZQv8Miolwd1Smbc56x9+xKoIbY1hdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b1hpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07cc6590so994208b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846650; x=1776451450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s9D9e8hYixOqU5sy7Crs/tgyj4HDh+iuwyCYyYRRyo=;
        b=IKFCtJdm1kEx9qf/M5H/uyCuhhcK/dH5dprvsAzR5ceGDnSaBjXcZs28uyr1z7lY5y
         xv355vgveOQ+y+3P0D841CuNq+oo/+m7ZJAxL6JShi9laQG5r1m07nFH5e+h65u8lDXA
         Ty9x4bdtxt06CkVGxCJC6GVo9eZpArZhL0z2iRvTKtrtBkv0qumTY+Yc3J25RcpfvxBo
         AuXp09RApchtmhy2C+0BC5E/lobkeLnOPodpqkGAK4STIUtDaqZqpjweGyainmXuFEmd
         WQGMXnfNReJg29dSvB8XEyXmQ+hVtP3Icgn6cizJcevnwmfGC3XsO7BILrw8V5+aZbmE
         DGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846650; x=1776451450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5s9D9e8hYixOqU5sy7Crs/tgyj4HDh+iuwyCYyYRRyo=;
        b=kxe8smxlV/9B+RnCX8Ku9mSeBdML3B794hte48igGh7+rSG3TLX2CFo3VlHEL1le8l
         ZDpJLe7UL8Hdjy7I1xPa06CLGyVIl8lEWy76hbSGrJvNXlnMsxiYSP+wOe2hv2fzWmHd
         EMaFJBwcfKbJjnqPiokD0UF2IjVf/ztM2LDqexfDp7rEvbNyHp3k2qolSq2Ke4LUwxFx
         H0oynAM9dn3M/u6gcBrfDmiUQIfdPyZU+h+qlAa6x8/s+/Nt8sIbbBSi8yX+T7ICA8Ag
         qom4bJOkVfd3TXthNIV4/P0Z4F0+TADwQIAgBVhdA+MYPUL/eARztIcuOTE5xMSSzZWB
         ZB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcJuHrYEbVmbBxV6Rgv5sPVySguXJJh0frAgWhid00WOThhQLmjNie1cj3mhUc2361eYfYF3TR7WLLZYnG@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzGDCoPcVAVbTJ9j+iBuRedRie29Tt7PPGAtNbHjvvXs85KDH
	LkcIw6vwaGrVR06FeVlseUKdTGI36ySoppeyelHCfr+x/uiqUgDmoBwdI2NuTDgnwFfriRiGXAq
	xKjIVzSClo1QrnTyNCHU179wJcT6CO/r4bNVSIi4FupnA0uPJjD9sj9KdMoeFL9JiDt1x
X-Gm-Gg: AeBDieuSBWkabRkUkC4WxfTsFQr04eOOC2jbdU+uOG6lxMetE9Nl6f7ahVqtpK9aSs9
	zFXR5u5hyByow5mNp773/qhYG4Bhfd7HmUbGpX6vLHhcWIcm5aHg8iCyEy/phIruySwSiqGeuHp
	VrATkwVtG9Ungf5W5xVpzLfKl/aOjW9mCe8ydyfuqZ0E3lKZtk2onULM+tIWSG67BO/ypxcizYm
	SVX3xN8nGO5o+RDasUDyrr6+63nhN7Rzvm9s9n4Y4qxXHFx09ZRJT0dOLHvyc/lAdUAvVo6SKmM
	ZuAqc2SPZaBhaSckK00eLgDBLWXBhjLah/6iSEdjbb+x5BerbEOowcuPCeVHmueFTNEmf+ANF2U
	OilMFhMiGoFr498xTQTbIzNpZoGuZmmufNNB6sLFjJ9VsiK5t
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4854095b3a.47.1775846649749;
        Fri, 10 Apr 2026 11:44:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4854069b3a.47.1775846649137;
        Fri, 10 Apr 2026 11:44:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 32/35] arm64: dts: qcom: monaco: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:09 +0530
Message-ID: <20260410184124.1068210-33-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -lktFALfgkwedfvyEpeZEMfv-d9hQWoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXz5oFfwtDBM7N
 Emmt46y76Rp0ylzlTw77xAB1nn5OSQf7QtcD4xmdIX8IMHh+jqcG3m1N13gzX7SbfoC25igUG32
 iJaqx8hTr/DTaqLFlIzAZ/mT1BzfTSTtoW50kMEzOecYuJ3xmVpx75rAFws5v5OhAshraLlOO+w
 7w06dLbR72F/A1Xq08CQclHXtbUJQHbWlwIW8unWPkcS/xCKBSoppm7L1OUtXkaaTQuBWmP8VUA
 L1dyF9EqS6m8fR+ZBh7SZwl7P1HISNIVdEoziSre3Y/5sL4crtME/dlKamuJ0rcf4EToimaC62N
 wEBMfD7ILs0+wFMWki2GWSLdz9w7hoI7olRPrLSDqh+/TdrHtLqblCXMrWSe8bOtL4mTKbEbM1d
 7D+EJJDEJnxlhggAT3beMAPq8d9X7ZghL45qG9yhk43KwnK3kORLYwauc1VhANMyqRcPurlOjkS
 M7P8kWDV/KTiaHS6gIA==
X-Proofpoint-GUID: -lktFALfgkwedfvyEpeZEMfv-d9hQWoP
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d944fa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uPPXLhoC2QroOpj7Ab8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102746-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FA843DB995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 84b22866d2f3..cf71b559b094 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5744,8 +5744,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x10000>,
-			      <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
2.53.0


