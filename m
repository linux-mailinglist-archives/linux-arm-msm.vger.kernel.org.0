Return-Path: <linux-arm-msm+bounces-105767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COu+JUbE+GlQ0gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:07:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC0E4C1295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE7603068870
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D03E1228;
	Mon,  4 May 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UooZoNMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQOtPHnl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BD3DD53E
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910631; cv=none; b=CFqjyjOT3hZuffRru8bmKiiW3H7U0E5+CDDESj8Dvy/+YasgVY21+hdGklkNF9WWFlblKRfuFd+nN8uMuSyDDC7fIX/FORVxtbTTg/96k0eZJGaIdmTfVBaYU9x8apYJcNGqUPlT8f9XlocobxvW7u2aqUh4NrBw1+XIlstAXk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910631; c=relaxed/simple;
	bh=sFJV9piVyzoU80B+ueZIt2l+Kf+S0OFQbpZGdavIBN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OmwKU8NabOv9uJF3LRE9c8Z1Qo/3HeGgSAR4v3zVQ01GD+WEabHhsmb6z70HhwJ84mHabu7T3Mkh0MzgFbqKqdq2hGAGXAbWwXeGwIl0VxGg+kFji4HZfauPnH+E5BL64JTyqCLg60clm3ApNpXZ1yEYb6mMtxTKK38OnKbZgN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UooZoNMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQOtPHnl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DwcWu3467673
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 16:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+A887ryxZ760eDs9FrcxFR
	m/+JAqOQlZHeis+Bz9dNY=; b=UooZoNMI3pvgB8IzFhu9L9HgLBtmM/P2wifIU8
	AzsAtCXSijlZPQky7r0XvcVWqg0H2w1PghBd5XCANmfZF6R/hmS1D34EOEspFwyf
	7YF6nqQUwWC5K81OPMY0+MBjq6WlW5y/xvIe+BgnZjWyEStadU4S3X6nugd1XfNx
	2SilPVRV61CLyKVEcroS5ekn+DJuqUrvVXYNodV+6HiZ6RYEDdJFDCXDlVmybsrj
	JjmGjVybh57i1YNez7/Os34oewCaK8ksWOUZ5HjaDD2MCAPCBXr5LPoUbgxCC5OB
	zLwnE5Aj+6Q8lG9LqZA2lix1ClVM2CDsus1D7SZEJqsVXbUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjrg9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 16:03:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso8207547a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777910628; x=1778515428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+A887ryxZ760eDs9FrcxFRm/+JAqOQlZHeis+Bz9dNY=;
        b=DQOtPHnlo1laVf4WbBi/VIfkLbI/Jf41kmFDolf0AP/tq4VWo3HUwsX/vaBO8ujGJQ
         Ucj5Z87GJe77vNBZZ2X83aSK9mTbFjMxHsx81jRe7zl3En2uhSU8fabmQsp1MLN4TjRb
         H96WWguVoqV6nhxO9fwO2wl27zCfdrPp5IMmU0rD6v9kDKPikIHwrYyEqiQzTp1PWvb2
         D1K1bEpskHK+H55l1vPNuBRjmdfzYp04ekxBKio5xRgJsbNz2qH02J3pZc+mdQSowKJO
         HmV/lKgrCw2LqmDrUCxASrD3hWxHJFpPMvcIs4+wJeApa1L7gTuIDVzg6ealF5u+Pmq3
         acNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910628; x=1778515428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A887ryxZ760eDs9FrcxFRm/+JAqOQlZHeis+Bz9dNY=;
        b=cHDOOYB8sS8jr+um/VpR/ZmJOLd13OSy5AnJQD+XvbLZ5hOC4Wf1SOsXXQ1wR9Fnad
         E14SZDPxqeaCyrjTeAmnPCr0BArmO2IML7Y5QgVesvM2qStuXviYvlXOUinbM2w4fI+j
         aMW1JtuywZ5W4uzaRthAWYR3dpKFz2BDC9QOKh39HLUj1qCivyaoZrN2MhS6fa+PxR5B
         qRP3ND4+miElFStOXrUUyjH2qHz+uCxtrsDOGKBEIChFWQiIFyhlLnynrMEo+v+mVve9
         43GQ8DW15dfgnVcyqDyZWza7MhUF1cS8YzKvpi3gNJP++0l/M9SsRUV/u+dDKa8tPqCe
         gTDA==
X-Gm-Message-State: AOJu0Yw7YhFtI0j3/tAlQiBIRVjzhUuLpG8enFZHkt07rIwrc4is/elY
	4jw/enXZlUUJYkIy3gzm5nbvrRfTaThidp1vCUQFL/3qyWem+WhKqXI+o6OQyHXSyNkglDpnTXu
	HIqY+GD10P7u/Ik8X8vuU6e4h7knDtEVTuRxh+BEK6Itm09illBlkoWMBdfMIBZhV9I9uxDU4D5
	xv
X-Gm-Gg: AeBDievZU+UjCARBMxvJ7Rb8nBmffIo/MWwFha85gGoeAtRtqNVMFwo4R5UnQgC3VFa
	K7HWBvkwz7gD0Pmr3PmfI71aD0uF7QHH5TjVIxaQqBdPZUgWbHrbYhbkkAA7gC/qGPJGs7t2PMb
	GYW9q0vQfcpMqF18Ef0gTQvzYYNkXo1fQUkrTx3eanFwEvRSUReV0wUmKruMrA/PM7Hd3sQR9+I
	GgqG0LHGciwbgwkwqsj9pkdJLihfcsSsvh6ERwexeVylhUjD90XqR0smrHHM8V74kmYiGJNgnUu
	hfroKlWPKBcx31yxlQj2ysdG7X259FC/1DzMEnzj2tBph/CRCNXHmvOaa5WINS26W2JA7Cr+SW2
	mwcZzFKnIfz4cxKsf6/xsgrDbocowJaatUKL494uz
X-Received: by 2002:a17:90a:ec86:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-3650cee7ca6mr10116944a91.22.1777910627022;
        Mon, 04 May 2026 09:03:47 -0700 (PDT)
X-Received: by 2002:a17:90a:ec86:b0:35f:bd29:75b9 with SMTP id 98e67ed59e1d1-3650cee7ca6mr10116537a91.22.1777910626023;
        Mon, 04 May 2026 09:03:46 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48af0d5a613sm105838635e9.2.2026.05.04.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:03:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:03:41 +0300
Subject: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Eliza QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFzD+GkC/4WNTQ6CMBSEr0K69pG2CBFX3sOw6J/yDFDoAyIS7
 m7BA7iZ5Etm5lsZuYCO2DVZWXAzEvougjwlzNSqezpAG5lJLgueiQu4Bj8KNHYWuyfB0PbQ1wu
 YPNPurLkWmWBx3Af3wPdxfK9+TJN+OTPub3ujRhp9WA7zLPbeX8ksQEBZKG5zWSor7c0TpcOkG
 uPbNo3Bqm3bvjGkIzPVAAAA
X-Change-ID: 20260318-eliza-bindings-qmp-phy-c53be4b0b131
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sFJV9piVyzoU80B+ueZIt2l+Kf+S0OFQbpZGdavIBN4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MNeZbpdmCaBksw/dXfD3UnTRn8BKXcq8N4Pq
 EUDVugo33KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjDXgAKCRAbX0TJAJUV
 VrPlEADDcd2ov63rM9EosgUP6lSLvDT6OHHGoa2SWfJBOD/93/4aLA2TLVWFKvTtfXAyWE8GEeY
 l/aPuw1EDAED4Hlqt2Gz5si2h1CTeXXOKZu5q3+gJud03OoG7fUtko7Xo55DHVQh5QGP1P0+8wN
 jl7uLT96wxCF3NTNt2bbBHq38MTPgfE5Cv4TI9XgJl9bo5DV3cKPisTLXi0RA2WvSJz3WOQqj9f
 yYaiVOJ98H+0kl4jW1SRL6LW3GpDcjGomXWMnRsMboBq1436/p5gAPn8OObB09GUBil41viNhrx
 7X9BONjurBEUuU1CEBCjjMySuqB6nieL3/XyRBbPMCHcwd/WyPZZL353mhFo/f8qUYC/y4lnmjl
 c55GjssGLs0aMKjZhv2fuPTebhXV4hSCkdLS7PHc44oOgy9l5lCBzCINLeWhIoQgCkaIoGe2mFH
 jFCwpy3Yk6eRP/c2H3FGwwkz38535mV85x6T8copkn7HmDhUwyylGFz7TeAcrYGS9+QdKnmwUp1
 fgnUv1J3QZMP5889xN6A6WGrJHjszoocAg9cvq/PjXBJHBImY+BmBjF4nBbPKNM7KlNy6/0BCYz
 doBinewp9Ca/JUOtt9xlSab2ODL7ONzSnbDqG8tg+UqDEoAHGyvU6M2kTrMzauMImrKRLkz3AKj
 B6qhLkDGmFm+lmg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: XK3ih1iwfua2lA5gPVF0OKzu55ZA9gdl
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f8c365 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=K6OwPNha_kR0oLd0V9oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX8aLY+SExnDzF
 33TCK5Xbf9zW3CAsz/jj4w4lF5Y6bSDUGNdYcolOZEidQb7zmbSq6YI7LL4yknvZIBOtwVIjCM+
 9Y53A0cavIfcpngu8GVu70M9aEA2HSvSf3JuSSlDqnj3LBmJQDkc8pNskMNns+MmV98XtrL5QG8
 8TSKOohJEqnhUC1f7J9y6VjlS0vol2zD+jt6EWSfv5WrQ6FHdmh0tqvTpeqe13xSYwvUrnstH7z
 FmUyek6IuPi6rpg0I+390PKYst2rnaT6lf3DsZe1pw4oS/R/Zz3rS6/0R1Vn9HqGahSB6thtfHz
 3BMO44HMYGjqWi7on+ywkELt6VOLnYdIfEW6mJ+784j3iIrkYl7jOp8Pi7NmOy0ejOM2IRWRpVV
 mOL0lGViIjhgxD2Hfl0TQWRsekMzc0DqD3kdOMgAvaSvIPuy9W522N2909nSCwSPIebBAuaaDZF
 sdu6hVMHFXUVUWdC3fQ==
X-Proofpoint-ORIG-GUID: XK3ih1iwfua2lA5gPVF0OKzu55ZA9gdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151
X-Rspamd-Queue-Id: EEC0E4C1295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105767-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the compatible for the USB QMP PHY found on the Qualcomm Eliza
SoC.

It is fully compatible with the one found on Qualcomm SM8650, so add it
with the SM8650 as fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260430.
- Picked-up Krzysztof's R-b tag.
- Link to v1: https://patch.msgid.link/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..4eff92343ce4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-qmp-usb3-dp-phy
+          - const: qcom,sm8650-qmp-usb3-dp-phy
       - items:
           - enum:
               - qcom,kaanapali-qmp-usb3-dp-phy

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260318-eliza-bindings-qmp-phy-c53be4b0b131

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


