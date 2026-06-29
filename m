Return-Path: <linux-arm-msm+bounces-114982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3xHhBvtLQmox4QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:42:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8E6D9033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q7skX4TP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CXnift6N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E687C303F989
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9C3BB134;
	Mon, 29 Jun 2026 10:40:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90973D669C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729641; cv=none; b=Q1MazKjrg+eXtPhBSTrQliRnANKf1jaEypZy6uoqQ82GptPHUe0SkcB2KoFv4Z+/woVKnQu0hELHqJ/Iz9vsIsh4Rm7F8vjlDg0msJp1Uzr4DUC9XINLw4rg6STe2VnsTZuS7RenaGzU8AYKPcpiGjjZa5sFBhWKWLNySqoEwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729641; c=relaxed/simple;
	bh=WyQpH2B/LN7BX5HLrRyjsw1EQYPwQ+KIYTRR12EETqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPc0T25o2OC/Npexuz2V3WYbAu3p1ubDb+DDyblJ8EmM+rB6tGHa6IDxYO6iA5EjC9OP0uY2rkStxaTEa1fjlOj5vE/p+qZCwUoz0kN4mCR1OabC9ctnAjNXNe6rVkKGV7zTweWktS907sjj+7A28NfIYqP/yq0jGrit08jMjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7skX4TP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXnift6N; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAStHR2640759
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoMHToMrjef8bkWyrGDSH5bIV4nytcZGBlHCm1t4BLQ=; b=Q7skX4TP1liilTiw
	zu+DLIje/fnAVgYuWnBM6hEtRdDxFsKU/pIaI1M83k5khj+YDKloUBJ200+usjLr
	noKTvkDq2fLkCwkUzB6bQpX9pAzCgLFaWOe/YYbAjRR3D4+xdJz6KFqWZPwIvwz5
	x1yanUj0r4nspjiV/7twQ9l9hYTTMTAvxoLni4ofcLfKbDWqavigkXSpAs2sVCb2
	MhMMmO/vGPYoUtuRv2SWrBakgD+YVEMPoRym6Gfy1VgpzICQpCanIytxj/XKJgD0
	uVkqaxWA6+3DUE5a/4HZxt1NCfy8pYFWuy/WbNLLyn5BiJYq4lLH7MfuvhBHM0zk
	qlkzsA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0jmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso9740588c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729638; x=1783334438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoMHToMrjef8bkWyrGDSH5bIV4nytcZGBlHCm1t4BLQ=;
        b=CXnift6Nzyxf1F/42tGC01sTuwhjUXThTXEbRJrtSLig7M5h9svTjLKzHy6UyBCe7z
         UyRCAlbjNUarfxR28VwQjINzHCiPelh9C8QpRKNNHmjOTESc960ndcpegpeWSf6maT5Z
         +bj9zg1/IyGOmSvbEeLBB26qTD3WZHSyk80N05q7FlxVV8o5KTElvNLrvGA2B7Cu+uy2
         vXiGaVMqghmRnAXdfGlGK8J2BKG+UO52RXMs5t+WGPCFAfsWAx0q3rtU2lv6ttH60TiA
         Ux4YvxDaKJnFF4KMvtpEj28HSaxvV5gl0MKimMy80XDPHfTcz22GIzzSS8Gs4WbrwbTs
         SOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729638; x=1783334438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoMHToMrjef8bkWyrGDSH5bIV4nytcZGBlHCm1t4BLQ=;
        b=L/Lq+WTsEcvJrtyPDTsCuFtzYHXIZW3t9d7VTgWK0CbmTMK/Gzzi0fWFRPYKhH1Jx9
         F5WZOOobK1fkJHWye1nAaBkeK0a6m1Fc8ItSMAtQPiiBjygUr58aAwPNiX5gGY4/wIjr
         l4L4hMAzCk8xNjHEm82116OTe9Yo44eIkCWp/SbACsQ+WtLEf036aGvH2raTi3788kbD
         5i0Nlu77eRTjd9xcsRh0ng4tPZeTrmep5FuiApN+5QqiB3n7ChjiNzE2SL8ZNhSbMGgB
         96B6xaxntMKl+Y84Q6+Q+olgo7WXYU77lDVsGx3Hk2iM2DtgsIpZk4ZBsiibzPA99N4q
         RsuQ==
X-Gm-Message-State: AOJu0Yyo87MVdLEctdWqbrhHl/OJUW8deicJ3tNrZS3WNLh1l7dSH6+8
	abmqDlFFbrc2ui08O4l1zTAaYjgjYXE5nSdpE2KMJkjE6L9EVMntnqvyGS3/PtW4wU7kIcYz6+p
	psuatbStSPzGNtFkb0JyXNtcRkAOdIwUXZndi/hvVAFOqjfH8SeOcwRm+jwGCmNU0ZMtx
X-Gm-Gg: AfdE7cltyyP5lp9c+DuPP5jOFGsM1pDZYOhFjQ743kGamPjGbc4BXGaIAzCk0vpj6Bj
	aXQEoiKkDOzfOSRZpkUtzVckP6SNd4w32h/i0Udc/GXhx2FeROaZLPxMWwZw5uYiyrNHaMz7Jj4
	4T0Nb5zsGn7c1L3O/Sq0eR+ASN1xmO+mdEJfrRJRDVyZGRJ92mPq6ruOU0Au+TBIubPg+Hb1i8F
	yzABKpoqOFnQe+4TXzyGHzbvu4toiHBxvmDVvdcDXBJ1yfOEaplkPSspmWfOTJYkN9veTgQxYnW
	wLWg5Lb4aFKGH/wK/tjdVuiref/rYwCIBwcLfPVjU7Tv5heX3tBvJovnMnvaXRCT96PDZ536O4O
	3ihPfW/GKCSROenUuBLElpj+iyXfiHCrFcGTj05nfom3KLc6b2BsHyj2hiUOvJHI3gXVSO+YudJ
	bgWIEXmz+jygQJyC7M1/Lh0cw=
X-Received: by 2002:a05:7022:60a1:b0:13a:225:e191 with SMTP id a92af1059eb24-13b2271d3a7mr117645c88.41.1782729638447;
        Mon, 29 Jun 2026 03:40:38 -0700 (PDT)
X-Received: by 2002:a05:7022:60a1:b0:13a:225:e191 with SMTP id a92af1059eb24-13b2271d3a7mr117631c88.41.1782729637974;
        Mon, 29 Jun 2026 03:40:37 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25413085c88.10.2026.06.29.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:40:37 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:10:17 +0530
Subject: [PATCH 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add Purwa IOT EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782729630; l=1026;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=WyQpH2B/LN7BX5HLrRyjsw1EQYPwQ+KIYTRR12EETqA=;
 b=k2RorFCoKpB1CAYCKfinQn25mO3hQpqhqq8NYZ5S20TyNCvmP3n8X3Bz+sUlnvO67VF96ocuB
 5kZn+IqLmP0BPh1ncnB30hJ/E+hreKm4vFDH3IbQ+lfJyLL6UIZYZl4
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX8F9dbSlVVDbG
 boprvH+hysYEKIJPhjrglUy5ulQkDigBNxLgDfBBjIFIXfrNhq0rzBttc37Yp2QO2InPLcrbnMo
 TK4gccBqOKV5dPAz8EC5lnoP0asS/qk=
X-Proofpoint-ORIG-GUID: o7k85CfqA8CEdtpoDiFF61tWCfnY7JBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX0142dlR+TQm/
 aqAWAYn5IsPghFFCYkHLurCOcmpmu4ZMLqPynRJHwQjBBD0CCka3dGaI8bGTkxZLiVuxGDx1cKg
 LsIHfm8TwB8ia06iKjpux4OUC+XD37pdTpbxUbTUpqEQgLh8WzBqcYOz2RiTXQHleYm0pBeBAlN
 Jarb9Hj6NqxLsgDXP7nDD8Z+J5aCgy4KXL11bk4kd576vS1wvGVeBtZFImBCMPm1HX6/t1kJiRK
 rgnNKErgi/b43REAeCCfX/BPXp2PZV8DqdPxZ7cxlfEYEEbMX7ZhHdld6b+ZUEbG5buKpRFE9e/
 VhpWvNtwZiWUoFmHgbo1x9Q5HhhJmgJOR60buuktaUbsv3BfZh/32KetBDGl6jRjS2OBKgFMOXS
 jCZJB8Imck/a8hTvr2N8FSB4VRGnh0TdxvJmjWYGXRZPDDYLlQgrHEmxXEUSs2qVfKZF5OYXDZw
 QY3NFMoLL4/wWzZd9eQ==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a424ba7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=esgZoLudUn-50EVM51AA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: o7k85CfqA8CEdtpoDiFF61tWCfnY7JBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114982-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78A8E6D9033

Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
found on Purwa IOT EVK boards. Like the other reference designs, it uses
qcom,hamoa-crd-ec as its fallback compatible.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..c07483aa5937 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
+              - qcom,purwa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:
           - qcom,hamoa-crd-ec

-- 
2.34.1


