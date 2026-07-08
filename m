Return-Path: <linux-arm-msm+bounces-117526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sqBJKJT4TWrHAwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:13:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF5722853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:13:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hUfo+VjG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NZtz5URl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117526-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117526-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D10F930209CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098DA3ED3CE;
	Wed,  8 Jul 2026 07:06:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448923F2113
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494392; cv=none; b=VLaCgqJYMyt7FCSKjLrXNxwqr9K0NbGuQshJYChowjaq2QqYqpqd2zBXYLBSnA+THyNusjjlyVPuaJgjc4xGoeeJbo2FN6Np8XBOkO4+8d181ZUGV9Y0rfWFDZH7DMwvSPgyVWWCg+QPxDe7IF9Q3C7QZiKc8sewEm+2hlX8WeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494392; c=relaxed/simple;
	bh=KsY/Jzd6sqCes8KP9dBLhmzdqd9FLJpumSOrdFVcJlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GiSunKl8zAp2TW+T+2rXnhYHM+HESweSZhgptNjwkk6dKeh0E3Eq73g1kVKrWp2pZ8GJ73rzO518BU+UhaFQ5t8OVAT3erVT8RsJAsQ1yuBre/WueOq7CbxiHRm5x62Sv8wAxDSj+D+LlYGRlM9JvGSrlTNIeoNfcyb4fUMedgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUfo+VjG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZtz5URl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685mdSl1760893
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qdLP4nhBveoly+Cr5TP4Fr
	k9KAJFIX+cboR8a25H/hg=; b=hUfo+VjGTZgAv7FGwWz9koShyRUPABu5xWg/ew
	6fEeZZv3+Qs+u2yAd7/EDRzlzWRoAFBR9l9pQ8Dcr6XEEny+t61LFGLsOseUMH3V
	F/MUZgbmgBPTK+a4BNr4zRUSxeA0/fMaM+ghSuAYfW7X161nUywvwf4dn4dzex4A
	IjSYq1YBa84uXBB4yJKAJS8aJcqneCsj1Zi7o4Qw0KKS9hwZs4LY7i7Appa5wt/k
	eEdJ9vO29kMkdBSWs87VejQR4wDKh+T9zFXyd9Duql+7ryYf2DCyZBwLM5AKeEzD
	92Bf/Z1C57XNsiOxUZ+q0pUAw94ETVpASIPkIUulqSIyxjxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw89eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:06:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478ff5d801so877231b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494380; x=1784099180; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qdLP4nhBveoly+Cr5TP4Frk9KAJFIX+cboR8a25H/hg=;
        b=NZtz5URlX3xnFClCJcSXpcHIyxayCRVb73GIagHe1cYm/SFz6AaOEGeq1BfZTUDL5C
         xds1oT/vE/XE6uu0V7vP4XHIe7rjxcIIzxJSa9nUQximZGq5tPw9uSJW/vGTZEFraksJ
         LK2fXbsaVJnVfrTEgDHRHOBQZ9u5UHAZ+f6Vewx0RuPyCPTDdyezpwftI1jiag0F4c8Y
         Rt5y7c41KlQXGmsbL43ehpkS5JqDWRCHOIlaehDl6MF88j+zjGHYJmY8CCl2tcy1fSdS
         JCLeXZv6QZ4i2ubxPCp4zVJqp+As9k7R4xTboSmC+zBbWciy1Y/na695UIqRAHESx9Lc
         bwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494380; x=1784099180;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdLP4nhBveoly+Cr5TP4Frk9KAJFIX+cboR8a25H/hg=;
        b=KZOeUS5cMESodXuyK9nklgKsbPTwHOqmtFI+hvlJ2vtHNAWxezeDyxmoJ5Ai2NhZWB
         A+9lmN4YrPMaBTN+HqB04eSEzKnyhBqWtQVKrX1ygTC2ONlg5+Or/PAz1XqWkhvgdvKz
         /cXGPYWLKg7zGFWLzFi7SI3d+MFIaPWbFNowHQUSqj0bPkEBuF9aUqJGF/eqHDMif5a4
         1KpZNPczy9Js10XSqr1gLImwywBcXt4y8ACYf98GNw8IzY7zkf74sR7V6gz2giZMgjMO
         aXr+F5eWfol5dBw9vA7sHXoOPLwkrIKoAu+qKwgLgTh7vEBf2e5/hQi8KBLYXSF/wmUQ
         dVWw==
X-Gm-Message-State: AOJu0YyezRgEdrr/40SCzh5R1HDZlro2ffv0q2dI3YUO6gep8g4FneGp
	ylA19/C5pwv1BtCs89UGzNl2wT8CneGQeGn0eil1GOn9JgisavOakvxWQEgcIRLVmDi2ek27VjV
	Bzg8NjgaNT9ESCwgCxSUqbcwOFYzxCtvRbmy8BB5CrmNudQE5Tp2cNUdM3PBAC9aaq5zMoRVTkW
	2E
X-Gm-Gg: AfdE7ck7go+EbACbwEwpHDuxcBuM31lADpI3Fl1mjvuzix2i0LSeC1oHoO7BjU1m1xA
	tVKfCAFwxndj+7Tsp8A1HE6rRfsOCv4s4/6ktmP2JlY1tqYyfneZ+37wxq/FGbaIcHkc4qdFuY4
	XcDj4zW4hQL1onIcyPQbVy/PkKgnFyB1rYfj0o6pHXyHLxsUTX1bN7kwfqoczXPTJ8XvwGQf6/W
	f2w+8Xy/rpcVQ5Xp3X7KmWUZ5FGOmapQHpDMM5S06rWtyVYucncqQSVg85q9zXX1H4p6p6fuDq2
	w8/iskSbsJE3eSMk8TyNC/o12GYSp/5bGSckybN8LKQfEkSLfYQQN5kBca0j9E2TVgHyu8pJJmN
	vknOOqgAu7w4pa1OeLk70zFlxdiOkn0g8aFx1EFRk/vf8HA==
X-Received: by 2002:a05:6a00:2ea4:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84843452ed7mr1380992b3a.59.1783494379721;
        Wed, 08 Jul 2026 00:06:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea4:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84843452ed7mr1380964b3a.59.1783494379232;
        Wed, 08 Jul 2026 00:06:19 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d85c04sm6829148b3a.50.2026.07.08.00.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:06:18 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 12:35:38 +0530
Subject: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMH2TWoC/yXMQQqDMBBA0avIrBtIgqj0KqWEiRnTKTUNGZWCe
 PfGdvn/4u0gVJgErs0OhTYWfqca5tLA+MAUSXGoDVbbTvd6UDPyi92aZSmEs4uZnecUOEUV0AS
 LU2t8P0AFcqGJPz/8BpuB+//J6p80LqcKx/EF3b6KeoIAAAA=
X-Change-ID: 20260708-maili_upstream_gpi_binding-da1d2af41b78
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783494375; l=1004;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=KsY/Jzd6sqCes8KP9dBLhmzdqd9FLJpumSOrdFVcJlA=;
 b=frOtO7U06hjqcljeD48PFcGu/9sGsVTQK9cTU2Udk1bNUTvCySKGVfCc4p5kaqIl0ZC1N611s
 4zRFiDMIK54Df4L6yd8AbLEmA5dYF9T9oaeWLDzD8H9x3lGihs+f97p
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NiBTYWx0ZWRfX/xpuzgs6j+fh
 khvaKt2vG3KRI5PeSqhrvhyUWwg5rgGySCVP5WZnfQCrBJdkri9/st+rb0zKJkw02BoIKhs0pxo
 HeWS3pLrbPKb1/LocKDYaVdaWyd01+WrCcUNAb6BBI924FiLR24/5EPIrOYnuIal1UeX/CoSc9Y
 492YvihU8mIIDx3J4j6Pe1WBe7R7hc6D54q2tDz7JjU5p5CdLV7A3YUDke5uxOaTM28dMVYyBoY
 gNQfkB0cBT10dTkXqOtHLBX4MknQA8hnA52RGaOMQCHgB1zlyH07cZMxJmjpjoCTWXcQRUDhjls
 TXYYj1/afPxjs6xPThmXRtrXVUHyfnYTQw7P6iusd+jMyMOH2kTc6cWhD3qWIn+0+CTYUHvPXyt
 1tsEXIyoC1Hxvm0SB7Rk6mi0jqKa+HjPlHAEqOGuZ0ixtLOZVU8NiL1YaNqWcu3qPtiejxuCPlB
 ZfwXkWOY1XQVBv/KbiQ==
X-Proofpoint-GUID: da9pg46sRVGhSF8vnfeFL3jc0Q-2J89n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NiBTYWx0ZWRfXyE7ezswzI5zb
 k5bpRkmy8jDgPlxsdAq5tW1o3m3dMRzSijWqw5vRIhdI1v3+dDtpzA1AFP3aQ4jrHakRtxKCShq
 tB3Lv1alGDOU2wg47eq/SSppgTId59o=
X-Proofpoint-ORIG-GUID: da9pg46sRVGhSF8vnfeFL3jc0Q-2J89n
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4df6ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Tqk0DnLf0ofBf8r947gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117526-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jyothi.seerapu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jyothi.seerapu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jyothi.seerapu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFDF5722853

Document the GPI DMA engine on the Maili platform.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 54dca623223d..dfc4a3054b5d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-gpi-dma
               - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
+              - qcom,maili-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma

---
base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
change-id: 20260708-maili_upstream_gpi_binding-da1d2af41b78

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>


