Return-Path: <linux-arm-msm+bounces-92198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL/YIYVniWm68QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:50:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9610B9D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DA3A3010DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 04:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4B62882C9;
	Mon,  9 Feb 2026 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RISND8+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghkJ07Fz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB966280CF6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 04:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770612583; cv=none; b=juCv/Ey+b/44uxRmCMEwafUkpA/F3jM+awlJnS+Y0lRBbVVxc89IbcdHNSzad5E2AFhps0SlRDwszWOIJ5yxs9j9BcZUUJZqSJ3vIS47Bx+zp/vSzr6YNVdQFrvZufBN84f0Oqy+IThdZgPBkI4yxk/qh0mn7wZLgXd/ASF6ToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770612583; c=relaxed/simple;
	bh=APF9k6j1Z9hdQxx1Oyhs4DgyrehHijEPvAVAhIG/xKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N9dGAJJVTMoUblEga3OuNe42A8MaPUAxn3XIXWiBu2oiG/e1ZfMDl92Pedc9NohZOy2PyGRYEdW+U4Mum9e80eU7t6donPUp4YIdmCxeWj3N3RG3oeD+mztxv0ntcUiIC2XVnfxuUgg96QLZQqUU9h2o9OR21/wDQlAdDYlGwfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RISND8+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghkJ07Fz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194MJbh2381067
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 04:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B23Em0WW9IOUwSPkLdRB0r
	J5Swd3p6Us5my6HB1zSXM=; b=RISND8+M4MJPqJP6Bvj1n2Acyt9Sfenk2RGbM7
	vG7NcI/9vbxffENYK7Po+bXB4+cVbRxDGGfkEln3YbOfDw/2hs9x8usfzwYzkwx+
	A2nRVE07o0DCqI6P2ABO8a/Ups5dzj4fQU3whG79T9L3cgjE5JR8dKcIcckAEgtb
	VSq23Mnaj8xon70N2Uk3w1X+CLNRR+RRj6hBNHRL3/I/dKaR3riwKdeH0JCdLOWN
	TCziUlO4VXMj7DIwB80SPyhKPEggrQ71q7RMLcYzX3FERgia6SdpmYE6aktoFw3T
	Yjryz/4ZelacrF9v+ghoHL0WO/7WTzv6p/yLLd40P+jxwruQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78gdr1r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:49:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b86a963e9fso454777eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 20:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770612581; x=1771217381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B23Em0WW9IOUwSPkLdRB0rJ5Swd3p6Us5my6HB1zSXM=;
        b=ghkJ07FzCufMjyJE/M5CUC8qsr68SmSaRVTWXSoX6oswQKqChtac2NS30GplvL9TX3
         JRLN160DBG2+EsRsyO5Zb7CsF4Mhw+zFEZB9n2l9kX7J0ZcfuJcJUxuyPcHcpl/gL9iN
         /30EFNP5EgzIu5X8eNXM2lhG8JiB7cDXf/RTJHid+Od1p/vwj4+AefT5So2SBnyCcpom
         Q6Ku3+9e5o0+1JOew7NlpHJpP3b9FZqBzPBv0GC83d/F/YO7i3R66PEAfCs9vDZYxxTf
         +sI1rw+9k6eqrIB0Ez1g/YZaRHDDlNm0M8JJ9ZlvQNfWo021IAccSJOQtPOOO10iIKOY
         Dt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770612581; x=1771217381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B23Em0WW9IOUwSPkLdRB0rJ5Swd3p6Us5my6HB1zSXM=;
        b=lH/lyxyauZVIfsg86er4/3UB5A3ZakXmq539ivfmaArC1eWHLbyAzpBTHbHOFUp7Mg
         PElw7yRAGjWtLYbFC/ux9hbDEVoPk0LNIgg2d7o/aP+mWHM6We3cwjoUDMR3R0JwX3es
         SqsdhS6iR0wtDsf8AxkUcNR6eTrr8EP+3kaRcdFb9lR/XM7fKobYahJCoBm5x4eqTq9H
         8hGs58Z2SucL/S+/M762amfHlbIm7udjU1T4O2qJPey/2S8kMhbGvykluZLnm8KRa34T
         vWUwyYITBjEsY+jNdbMb+Q7ELsmNqaczLtwSvE4F3ppFZiVf0f/pViBj5rknwLpNaUan
         mubA==
X-Gm-Message-State: AOJu0YykWLvlmEg/L8ZW8hMrR1lqInpzcotNQV/LmCsjhGIS4QwQSDI9
	MPefAhbzfa62RRJhizISWPgWuBG1F52wcsvbe7hnKqN15khSxOAJMZW2pgrdGmG7y0na/qbaS0G
	9c+piafqSeaJc5ijnYcldXia8Xp+dd9Uw8AMbJyVFYookxIHZoSnJIWiC3lSxRSiDcEnI
X-Gm-Gg: AZuq6aLruXoAu0DIabNj85be+L++w05Qx7l9vctPgUgIxQlLDemCVYRcF4oOeUSKbT2
	9fkxQRfGN4hLy+cW90wX7Hh6fFh9/YoqlN5mw8EYrG8fmH3rKzdULcSvvp/WBlv4pBhwul+BhqY
	pKub2YcqVXv9oJureY4On2+CtqHz6T2uHFEcza/8pdkEJl3hMyxD3DbMOnkM+yk5trOv+PtkzgH
	891dXuAihfiUD95B+0rl5Y97H1wJTd3+NWONcXOPs3zhzZZpy5YeTUB4n8uf9OgEltr0hN54c6J
	mfklkZI3JiDxRlOGZbYWLOJCd094OznPb/Le+OCuIPfeBD6aEiEj6GMh+oD22YD/okn/rGFwT3S
	FRf0uJwOi4fr+DRyx5AstPsHwU/sujD/YlhxCS4w33EOjQ2khfnNH/Lbt
X-Received: by 2002:a05:7300:641a:b0:2ba:6d87:cf68 with SMTP id 5a478bee46e88-2ba6d885c37mr942317eec.16.1770612581323;
        Sun, 08 Feb 2026 20:49:41 -0800 (PST)
X-Received: by 2002:a05:7300:641a:b0:2ba:6d87:cf68 with SMTP id 5a478bee46e88-2ba6d885c37mr942311eec.16.1770612580715;
        Sun, 08 Feb 2026 20:49:40 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8647bd6casm5609940eec.7.2026.02.08.20.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 20:49:40 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Sun, 08 Feb 2026 20:49:38 -0800
Message-Id: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJniWkC/2WMQQrCMBBFr1JmbUoSSSyuvId0EdO0HbCJzWhQS
 u7u2K2bB+/zeRtQyBgIzs0GORQkTJFFHRrws4tTEDiwg5baSobIYZxCFKN0VqnB+KMxwOcH7/j
 eQ9eefUZ6pvzZu0X91r9EUUKKzpxsZ522zt0uiahdX+7u07K0DOhrrV80h2ohowAAAA==
X-Change-ID: 20260202-refgen-f0a611d5c355
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770612579; l=1560;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=APF9k6j1Z9hdQxx1Oyhs4DgyrehHijEPvAVAhIG/xKA=;
 b=GohXl16p8xydv+2G4JUayXabZI8SuH9LA2jMwhRlcZaUExTSuv0PgdTXnETHE/vx8vQB96Wq4
 NSkN4ThX8OIDItm3aHG/Z/ferQdjzhXk5IUri9p/VQEAvS5GBxDw1xx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzNyBTYWx0ZWRfX+OetWA9Fn+ya
 NLGCcw+MHo2RolWTEaqXIAjsIzppX6tLUk2qJr0VSG3vNeQ2I8Qd6M5NdABhmueEFfnazRR17E9
 J4UkCywtKS1KHFPwc+edHBorkoJdDYRNM7rY8oGmkWiuRhQvLpcU88xo4CmvilcB0XRiXQ5riyD
 ZlUUB/GASjmDFcL6COIoh+AQ30dx5pacPIQD4fZX21IBz4qoRGWz8Q0sZNJhj/JuKYvOR5K7ZDc
 p5gIABhOSPsQ7ANYz7AgjnohoKKK6u+7o8/Cb3QB8K2L6S10H0Q/ukytjn0a1PJhFy44eD1nal8
 xufMQz9sKXRitK6DxDYdhsTemGVnnz+bDHTCQNWRVI5WMbmk/24bqofwHW5Xl0FpV2aAvs/YxtZ
 6UBm1gWhD6S3YCiKSRLWQY/Zsma1TlKhOSuPeMzuHylDjQtFZrCyHie3mNuaG0nf9mDgyg9UV12
 gCPdYwv6HnY2h5b0tgA==
X-Authority-Analysis: v=2.4 cv=Fv0IPmrq c=1 sm=1 tr=0 ts=69896766 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ht-hxK4C9M4zpVAjTLEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 79wsTMPNlOyt8weXO1EiPLs8kwRGIUVR
X-Proofpoint-GUID: 79wsTMPNlOyt8weXO1EiPLs8kwRGIUVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090037
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92198-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27E9610B9D6
X-Rspamd-Action: no action

The PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

Unlike qref, refgen doesn't require register configuration and has no
dedicated driver. Therefore, the PHY driver must vote for the regulators
that refgen requires.

While refgen may be a common component across different platforms, on
older platforms it typically shares regulators with PHY core or qref
supplies, making refgen supplies map not very clear. Glymur introduces
dedicated refgen supplies that require explicit management.

Hence, this series adds support for refgen power supplies specifically to
Glymur PCIe QMP PHY. If other platforms require these supplies, support
can be extended in the future.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml     | 20 ++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c             | 12 ++++++++----
 2 files changed, 28 insertions(+), 4 deletions(-)
---
base-commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4
change-id: 20260202-refgen-f0a611d5c355

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


