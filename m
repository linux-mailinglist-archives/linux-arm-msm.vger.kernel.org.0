Return-Path: <linux-arm-msm+bounces-102744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPJNEdRF2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFB3DB971
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0160630498F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679A23E6389;
	Fri, 10 Apr 2026 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8S8qifC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzX2MV5i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E703E6386
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846644; cv=none; b=rDWNJJa25bNK/Dk7BCC9pKvi1m6tBUIjC8w17JKmj9t9+5uTSr8RWyWJRSc/tEesuyCqefn4VhYIAECmM6wA5q4ST6UrKEjJcLsOBrPxLtwzbrg81WcUoneQlDPzj2PVGFdUz5DEFFc/aHwCz5yzsN0qA67LJWrR8AdkqnThaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846644; c=relaxed/simple;
	bh=aO/ds3TjNStgfhHB1D44+j7Ui4RPphjRAyEWpbzLt7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEYUyhmqB4rKOyXXdFkL+TMTgXfHvJjt54QpM+/tQFr6OUmjkRblTqWhJGCDkybkxMX+msgTI9+xNO8fwPTH0C1pfhn8tto92PPoV739W6rZyb3Q85OWzjJWmF9OxM27hH1FJ85emJ5JAH8enhybAjOoilzh71LNZ8f/HkIQ/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8S8qifC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzX2MV5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIhhth709117
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2YrNAn2URfe
	wArBADgP3zBhtItuxP5QH+d8687n80YQ=; b=b8S8qifCopiDFbgTjPWhW5H+ru8
	0ynVul3JUK6trz2fvxSkQAfu359vusIpejnBKMfsjo2BO3Zkr+nA7dMJC/ZFvUMs
	V6N8zZRPS94A9w4+TmyYIVm8hnttULYX57dIqF9dPC/hBvPCJj2UGQXvEXg0J/RZ
	zg8zTSgZaQr00UW7ityhlDE5P3wEWz1Xhr0XI9TAuHKZyWJCkBsioTVj6YNPD84b
	DM7GISvOmjxOeGH1IUop/yqaozwgp93/Y1zgwmrz5jiVOOQvwbRX4b9zkXCsSWg3
	6CZPnCP3GKIUDropNJJvZc+/sxiMlhGIeJClXEroBOwSqYKfIpq44UJ0GKg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d02942266so2861759b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846642; x=1776451442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YrNAn2URfewArBADgP3zBhtItuxP5QH+d8687n80YQ=;
        b=CzX2MV5igd4rjKrhAB5E6UuJ1DQKV6vdO61jfmI/F19gcWvEyXwv9LvQsLFWU6VpJG
         aJ8TtKgFDwFGTNJfi8uwsYX6ZpSKsnTlKNBpGCk6F+jeCWdEjiieX3DgjH8kNPpi9Xm6
         IQMSaaXbLCUHGiZZmBph4kC+Bf8Po2KxMx3FPNXRqdjBlZxprEk7xM9W5lzBIbt+tWZM
         DovduH9K01yURgwrFd11ozjh5TRNybawEY4dfbp9dx9fEjY1S4b3AT82mXeaZX5lX7hv
         T1vu461hd20UCqwpthFZpdSxurWFdnV5IqL5NCfvaMp62ctbt5l5mA6IsriFU4g78u4w
         3hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846642; x=1776451442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YrNAn2URfewArBADgP3zBhtItuxP5QH+d8687n80YQ=;
        b=VLuyOabQyJZEXJ8+OT29CxySJje5ydpcvUkNNjMrIGzSK+yi2T6+8obUw6weN4JZ6Q
         Nq8rM/s4CYAaJ1rNNWEBKuAGS9tzowMdotagJYsEWTM3VNnP37hfsAQCs+wkt0C9DPL/
         /nsyViXUZazGAA9DvgWOTFaejNft12cpezNEf+96lKlZ5EmljW6TyRzsHpG6Dz/9qGL9
         N1+5oeOH7vbBdynWSFXJ7TjA/mE4iDKd40j7auL3LQytdNHqfe9gPrmkva51nY6MZnvu
         te1gp8t0wpnptskfNwBfXP4XoLlBK3M2y7ePKgBpR0YrTV3sblDZEhb6RZ2D4wgMl+hZ
         TUWw==
X-Forwarded-Encrypted: i=1; AJvYcCXp+NAXE8EhjVKB3mu+CfiSck8EmD4XOgjLE93HLrUBLlee/5WzbskT/a4YXtLMIiSJVjOw45M8OooKz3TG@vger.kernel.org
X-Gm-Message-State: AOJu0YysUKxQZnAL2g+1nLIZQL2lewnDN1F2qqfyAWHJjooJkSigyeyJ
	8KjpDOJR5k4YKySGb1iR8TlTQkAizS3hKcxTqe6vyZs9Opo1/yFjbrS2sM3DLpk1SfkpGqAEtrY
	UiopaLvBm9qfNJFIU+w/JylS/MYLj1oeQd3soMFoQsUnJy0b9B8TpkHoI1plQHJimWAwg
X-Gm-Gg: AeBDietnV9WyAnL3JQjCP6HvFRS3JSWVpflYa6yUbwnVOiRenziL0O9eMyxQ53Tjn+T
	ETpwc2kgxwUYzkLj7el51DY8RDbc8P+yThYvRtk9sGOKFx2RJg2kz1hDsXgG4b6CCRQIHYqhSHr
	fUURJBL6fKlfn/JRBl9ax+cxgUBtaRu8SEmJbwfrtANTAobypwfL6JzJMmBEGueAkL+E++38Pk+
	00p+jzq8SdcGZr0gbiOza4S4aSMXZqMxOgl9aJJL4y28zfkU25O5m4vh4hhhiK5C5zyJe62fLNx
	aLfNyaAi5Rknb8/QlIEvhqBC8aYLOP5dF5aDgBrsUu2wy3qK7EFzHDvXsb6OgcgxiIlwjMPJzkr
	yXlWSRxlFdqltZFBii/9yvRxDROal0o6L7JMbRXHAIURAggWQ
X-Received: by 2002:a05:6a00:18a0:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82f0c2c20aemr5367877b3a.42.1775846641882;
        Fri, 10 Apr 2026 11:44:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82f0c2c20aemr5367847b3a.42.1775846641253;
        Fri, 10 Apr 2026 11:44:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 30/35] arm64: dts: qcom: lemans: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:07 +0530
Message-ID: <20260410184124.1068210-31-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JO7r_wif7ZWxNjZ8R0MMd-pdo0xj3AXC
X-Proofpoint-GUID: JO7r_wif7ZWxNjZ8R0MMd-pdo0xj3AXC
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944f2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=b1R3E_TPsH7j7qtAm9gA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX/WqC1JXKOeFo
 9AjQ78lgtGMvFcICirojbL4ax4VTHZcjsryOG8J+6qkN2aw7FZmYLRFnT0jcEmEqpi/WtORlUVN
 5YM6jVs2ezHjJ0VJ0csHbt/ED7yn1XE1S8DKc8iIZ3+5yGXm7GIw2nY3S2bQJBrcUSKf95oTMpG
 4jlL8/P103cRkIX4U8OQZDp/TB0lg5z8Q0iZ6Ll7ZmwU/2JtTRttes+IOvEv2EiZCO6EdrJBQmB
 i6DYGm71Ly86Ooz/mn4vsnWj3b21zzYYdJp4xrwllk2eOylGX0CDLfK/stgBWt+RvGomweNz3L/
 rTA6i2t1XqlKAVwOR5NVW4nf/Qjx0AqlkJ+ppH01chv8kfYuXeJxTj0mYdTsKJkMIdPqxqZoaNE
 oCCuCaBmgfWaPn3arN6qdjJI8bDx4hvTF2GVpPFFhL422gxLnyUj/YxYrK8Rxy0MKTi1JI2wT9P
 7dNYCAQJw5R2966HeLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADAFB3DB971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1724df115873..e48c8ef7d8a1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5536,8 +5536,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0


