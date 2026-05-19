Return-Path: <linux-arm-msm+bounces-108361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEupE0wJDGrSUQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:55:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071B57870D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54A4C3091B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41239DBF4;
	Tue, 19 May 2026 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd6Tt4q4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSoGB9mN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62239D6C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173412; cv=none; b=uNxoIJbUpEhNCEdIO3MGR8nQ2GKpzivCrtHHTnnBY7jUGz6H0EJEhsnsKFsUijjuSr4/i467kK1RiKDevPLnK59UIT6oorBAeI3EQpSUdkF8KE0eF32mmsKaKm2ZAPJxD50rz0MX5fKbH+xDlLOwI+j0i/GVuNXMd6MmFWFzOCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173412; c=relaxed/simple;
	bh=daycsdQGYWas2V0105xKqPSpRZFZv7GF7t+kJvOHzxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RVbucIKq55OIokrIVzxbPaAc+/b5OswpdVQkY7j+jWmgXqvm3BLP3PgqTS28DPHPcL5LUNeVGqxokYni9x9adSyjhEVVsLfCSCwKRi28JrY7MODpydxWW9OXGKgsp147Bh/GgU80m4GqzvtU9kPyCnYXJHXlMka7d22CzREC5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd6Tt4q4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSoGB9mN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5aBdA867065
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BfYN5kZBLgfGldHL3vQmFkXHIXyQ19R4u+D
	xq/y5Qbs=; b=Nd6Tt4q4xMhjluSIunUsKVArjtb7yF48KYJKGu93Kn0wgaJ0p+8
	mBYBD/3yXUusVlhNtgGD3t4Bi63xesETbM5cfnil44laAqIWInCH3spMfb4Re2I9
	7FQjfUw4ut2p/M6+QOmOeNsx6C5STPZ64J90R8+R2bsTEr4Jlm+W8GaMu6K6BqYf
	ZdF3iz2eqQjWtteeoGzB1PnTgGSrGNGK80sGAZjX2830k7n1zhlnvrdU7qjCjrx3
	Ufxb0lk717KUGNFxgC4Y34oTD2PkkdZIaW884yWCcfUeNUB7dG0LuNNpkhsxjuKf
	C/aggpq/puHIRUl36ukdYWjA2JpEz/xNhTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1g9mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:50:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so47703885ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779173407; x=1779778207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYN5kZBLgfGldHL3vQmFkXHIXyQ19R4u+Dxq/y5Qbs=;
        b=VSoGB9mNB8rZY967BLUvmqaMR8pdlIex58UaLqNEOKLs77H2Y9rf3g3U5EO2iybhvT
         WGZsl6lek1f6DD/tlHSnOQYcjj5V01EWY0povGnnQiUXo0AxqoZZZsdTtSGhhvx4GTFN
         +w7Xn+/sCLpu71JmIX5TdmaqK5od8iJBc29+1J22CFE+e3gig3XNAWbw20fnVQQaOt1v
         zOBiUPoYFfiegNGWK9toQK489UNqUbvtdEsK8VndzBdHuNHhg3HLgbs+GjwdRphKkgzr
         NLIvHooIGYpNLeQQZNRBkFoeKYQ1rmU3b/+DutzUgUfXOGcWzgU732G1ZeOe4iqcEyOd
         sGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173407; x=1779778207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfYN5kZBLgfGldHL3vQmFkXHIXyQ19R4u+Dxq/y5Qbs=;
        b=UvE0xSQPCc1fo3OMpglTy4mDPnmx2rS19Uh5FAlInu20rQhrP22IR9nYYMeIGNJX0K
         zfBN/Ixy51sUZ5EClAjPOFtS2HzUinH+tQVksF0lnVZErdzBNSxu/aXfle63BJCB2ZQM
         mh1gCQTZMZ97IQPXupb5sdQscKC9QWaNQLBMZo1fkfXri+ub/muxyLvCYIZF/xk3Rgmm
         cx1rWrGW8GeOfbk1wubqU0C6N4kOthlhmyw/bH6ery5Ejx8D7U2ZYMAnwChW5VBkaj0j
         6XW7wgVzlm4HV3HcBHu6pT/fqhos3RPymkN/S2gWe1Qb+8qGv8MdxQwhrQhyXG5tUgfk
         JttQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QUpvZ9ndKOwvVzVa4CcUjJGmkeDcvLEbdXVKnQjhKofVQulr/ADK0y1p6vXEWa01X0y/11zvFQF6Ly0Po@vger.kernel.org
X-Gm-Message-State: AOJu0YziWYtFBTai7h3TGlm1jDbBU4VT+7Au9LAx6mw/jOhgIq2N28wV
	BTDqY0igr3+nkdjtXKgwPNs8756i0Lymymtyug3wZfckgm/lAlBU7T+Z1azCc+mKuSPs/H7D7Qn
	AdRyJccPNMbhVpy1gOHHSfDGZpj3jVQHMdZc7eVydvRHHDUCTHIjCQzaZB6EXdgyLOdk5
X-Gm-Gg: Acq92OGLCdLit/e5CNAPNg1WDTxkZxLqb3PCad94z/3xH5rpyTccv3gaWUZ+D8FZ8uV
	Bw3SIXXPC7yFIHRs7kgYsTxcEX/FlwzWV+1wmxL0CNTw5px5hvnSYGthNctdoX0sEJcGN42KD2g
	Yv6hdwqFlF1wkBmKHcU8C6tac+yeX9tCMrGuIygJzcy5WuDWkrW0VjUgFdnJtyrtyw45xutA0CG
	K1HIXjtq3MYlKvT/WkSZ7oJV/RzqfOJmriHL4qp9WFCVcZ3psXq9f0U+lIdSLtLGyGSYxWO8z8E
	G7n/c4auIdkxrmhOzZn2JVlChsFcqTI0L46VG0rXj1SPD2QtK80OK/ri3M3ldcMUsDQ+OZck1Fx
	7+9i3HR0eieVZ4JV0g1Sg6rGS98CnlIj4hQRENtfjhkg88fzg6pOntHE=
X-Received: by 2002:a17:903:40c5:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd7e92825dmr181228715ad.41.1779173407052;
        Mon, 18 May 2026 23:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:40c5:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd7e92825dmr181228435ad.41.1779173406609;
        Mon, 18 May 2026 23:50:06 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d6easm188306675ad.72.2026.05.18.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:50:06 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C GPIO expander
Date: Tue, 19 May 2026 12:19:54 +0530
Message-Id: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2NSBTYWx0ZWRfX7Lc8L37dGD97
 O5gVgYa7HYjllblA8WB+7kXUrBGwWV2w+ggMvlRPKRXjAQahma2B0y36YD0yUXXtjV73MQ/Vum8
 Z9DOv+vwYMyWsTNkrmO/zYjzdNkMEanhSZJtQe0vjeA9WgOXOXKNrcryneyk30O4RWB/7qeJCTk
 rRibN9YkXMTZEgmO1roxSbkQx1j3hyOzwf0JCeWl1OtT7zL4S4sZfDNcKdT6dEP/tRqlpbH1DKD
 5ZyKFSIo4EAOruch0fYlZxu/twAsBX6b3595jG/i1t7/qk1/bzjxz8EpAwAavKBQKHRiGMCuRVg
 XGLAKiY0e72yjRmgYWa6XwMdSqdveT2Nh/CSkACplLLHreYPb8Wmi1WMwKxvU7u0Xeq5xMpzdU1
 SzI+yaDuVGXhLbU+AXtnMznhUGc6b4d6yOtJO/6QdQdcvaj53v7rvnmawxImz/aTja35kFbl2l8
 lYyiYD93IagXDKWeN7A==
X-Proofpoint-GUID: IuhS9KaWxIn5RSHwSFn22UC3LbuxIaa6
X-Proofpoint-ORIG-GUID: IuhS9KaWxIn5RSHwSFn22UC3LbuxIaa6
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c0820 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=l0BCks6i3eRASjQ-E0wA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190065
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108361-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,3b:email,0.0.0.50:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anup.kulkarni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7071B57870D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LeMans EVK board routes the RX lines of CAN controllers 2, 4, and 6
(part of the RTSS subsystem) through a signal multiplexer controlled by
GPIO 4 of the I2C GPIO expander at address 0x3b. The remaining CAN
controllers, out of 8 total on RTSS, are wired directly to their
transceivers.

The multiplexer select pin defaults low on reset, disconnecting CAN 2,
4, and 6 RX lines from their respective transceivers, which results in
no data being received on these interfaces.

Configure GPIO 4 as output-high to assert the mux select line at boot,
connecting the RX signals of CAN 2, 4, and 6 to their transceivers as
required by the EVK board wiring.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
v1->v2
- Fixed commit text to include platform name.

v2->v3
- Updated commit text.
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..34dfc8d22b6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -616,6 +616,13 @@ expander3: gpio@3b {
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander3_int>;
 		pinctrl-names = "default";
+
+		rtss-can-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "rtss-can-sel";
+		};
 	};
 
 	eeprom@50 {
-- 
2.34.1


