Return-Path: <linux-arm-msm+bounces-107531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SADxFqVvBWoTXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:45:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764153E764
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3DF3301C885
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5EB3AA1BA;
	Thu, 14 May 2026 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+2AjhuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIK7eQEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF434DB52
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741151; cv=none; b=YIlef8BAKhKFMfoZi/l+jdFyxvNP6XHMvbHv/HTkqUNimOu1/DiPdP47830qh7UfQEdJ9a0pbEU9FRC0g8E8k/LTGwZLSzJOAVgk1BISxAEzS+orjUJaA+1aPECImW6ntBNJiOiXKyjgvQ+yzdAg7crBx2UTuARDX/lamL2i0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741151; c=relaxed/simple;
	bh=jBEDtYGEa2IKZ3W+O1lVxJfYt+vX1gTebqiOx8/EH/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ElbKGMiqvLdxX0NV7VUzl5HRgA8VrLMThEWlRTjAKTbzbQDIjAjc5iH90oxWKhRXmWwHi74Q0ZjRh3/58AvAIaXHr5L1Ygp2b1/dkH1QKophfX+mG6kIrww04Ml1WgXDtfyRSBIjkoF9PxDskPKU0Olx8I4QHvEVTOzgwDo4u3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+2AjhuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIK7eQEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E21d6G2524321
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B92BQ+6HWYcw7rNENNk7fQ
	8re3zw84yQz2S+EvoqcHI=; b=N+2AjhuZzFkbY1pZJAusdpkX/M6Pqr+VGFgocc
	m9z2pVKVPbqRwecce8bC/eXplscD+1+S7DYaGtOwWrlE6UlMHjC8tplTCNC8DsVi
	oCU1Dd8/ebohi5YwNwc3dgDbPM4FJtzbhi69LuTpYEillvi+vN2ALQWB/rN7v0XS
	jPP0RcbujzPVN+1pmJnKuWqiLokCkgvlPLxfjXvnb+XTTxJRzAjXc1a28lKO9NvO
	Vtz4Gwky0+J1rhIErSpyESrayBvHQCYI99TtGS8zSHTt8j8TH8i5Z+tJjr91a++h
	tCMVSpwxHtmQGltSl7tj+4fSPggCXCDwEjHaTUag3XwMdfvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjjp15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba224c3ffdso119190695ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741148; x=1779345948; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B92BQ+6HWYcw7rNENNk7fQ8re3zw84yQz2S+EvoqcHI=;
        b=TIK7eQEZkVwbe1idzL8FRqWW5bw18sVAzZkoHRA418wEusWiY79Zpb27m3mo61MEwj
         bxUPNqiGZnY95nfr+LpkGDPHUixEMu5veUHSuKFzlv1Rm85ZWwVzqdnDA8wAPASUnVsb
         hDHzTLU/uTSW7CW/CQQI8nguhkDTUVNbu8w/U6MgqmSGP9+UqG4apdZso8bs0b0WNBKH
         QxAxp5IaPmldikLN9kcblu9h9xcORA6j5w72o7yrT0Rj2K40Y6LmoI37MGpD+YUUD3Qm
         WDlNmR0RuROjrl7R1VTvrpeoqrLOezOQFVjDqt9QU6hVkOoqcs0LdX0JnTyjBkKojnYv
         kczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741148; x=1779345948;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B92BQ+6HWYcw7rNENNk7fQ8re3zw84yQz2S+EvoqcHI=;
        b=Gz+X6+IHNVv2ZO1quk4dPlPEGD/a3w2mwdasfHdz39AIF1iltHgArfw1NcxWtEeqxS
         Rl++vmkUtnvAuCS2NxEiTr7qM/nB00HW6rLdrRYiMvoNBPhXAfGKIXwa9yZNSiq/Iagu
         fbzR+4SxDpfJ9CwUHVUIZfJbs104LijCLB6IQbCO/aRLGQvPgz3fNMMpHVbl2gKbW7VJ
         x3sTerTTGpzS0A07b5b7rW67nVVX8woc/tIoLuIAUv4SJmfnrsWbGCR2wD9o4OupIeyF
         X6CqQaQJaPNE9TZ8DtWjG4ZrDZhzIBCnWXtu/4XsEteBr4tssngsjasL5Y2A8WEO79ER
         4MgA==
X-Gm-Message-State: AOJu0Ywh6AooZuVOGL44Pn+JA8aaRBozNimFWfgOABMH6OTNk8FXVLYu
	o920Z/sz/pev0wlYH63yOVBMwlxqSFybYPIEi/srvLv2QPhreqGBjPfEqVftHhoI2WGd904ZTeQ
	2g8YoBS1mOkLSlFk7zYnSDPoL3uIhY4rOVg13W6KFWhhYjcoATt8//Lf9hY0MJZv0TUq0
X-Gm-Gg: Acq92OFGaljngEWDr+YM+rjDJaoaj+jzo+IRt2dVE9+PL0Y1I4ZznSqre44ieL2Z8PA
	wxsBQDcIQO5P+EF5wd8BXvFK0TEZtQCQXL9nwlbLy7HZQ//F8F8eOthqncikx8UxbGWVG32L/zg
	Bn3JNXxz6mabI8bm/a38qXrKBHrQVPRh1WbE9Gsw8iDi+ADtl6A0DUgr9m0I1766gSj0ASeXlzZ
	dM2AAnAXmAdOVZ9gY3jMDfT9mxoKo1XvcHABirYquLvoMz3y8KiO1QIAzYXS+lVxBOq+7DzC3c4
	o/gdlGK/0ek8mrIeaf8vKoFXP3LotViR3WDbcJVdBBAKJD62nyoOGY+2dtwkXabR5Nt0FlYqsea
	KOFrMOzwDiNq/Ap4xopcG8gDXFTNjvWtyRONQXpqjWZd/aHZS9JUCpCDMmBrdSrHMrulufDIlVG
	t17Z1KSjH+NqY/wIGzRmWHD+tw7w/OtpUUcv10NVwOinftZH2qW+s=
X-Received: by 2002:a17:903:2c47:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bd27708c94mr73287835ad.36.1778741148005;
        Wed, 13 May 2026 23:45:48 -0700 (PDT)
X-Received: by 2002:a17:903:2c47:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bd27708c94mr73287465ad.36.1778741147511;
        Wed, 13 May 2026 23:45:47 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm13387685ad.49.2026.05.13.23.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:45:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable QPIC-SPI-NAND controller for ipq5210
Date: Thu, 14 May 2026 12:15:30 +0530
Message-Id: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpvBWoC/02OywrDIBBFfyXMusKMxjz8lZKFxrF1EfNsKIT8e
 6WB0uW5cM+9B6y8RF7BFAcsvMc1jikD3QronzY9WESfGSTKCjWVIk6zloQi2eQFu5pJe/SqJsi
 VaeEQ31/dvbt44fmVrdsVgrMri34chriZgtvGS+qpRofkPQdVVQGlci70oXKKNLbBNgr+35ji9
 8XZQeQ9QaW0yNygrtnsGrrz/AAztfxw2QAAAA==
X-Change-ID: 20260514-ipq5210-nand-eb7e15d0d371
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: pjBV_76vDvqT_7WouAZLDLi2YpIBLvd8
X-Proofpoint-ORIG-GUID: pjBV_76vDvqT_7WouAZLDLi2YpIBLvd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfXwJhth6S4Uhyo
 xpgLmZwVIm7VxWiYek6juZS4YsAIPxGdJ/0hSCbv3jAaK3VmKkR87wSP5eZzmM4cWZD1QSC6Rii
 55trsjni2vBBEJnyW5xL1QBW7megT8IMnyX+lGsPNpRIVCJ5i8o5WOeX1LCeFJMU7nZ/G0041CL
 Qj06X470bQ/eo8AEgt2xGnGjnCjv6FPjrsSmPWeK7Wo3Ye+d9m1/bkjCSUXLAcFiTmJ6CRxCn2O
 prih7AMjowlVQyGbR5mQnNxg6QhyuQ9GUwkKQoHysWpIKnIjmC18QOyMQh6D5tlwKt+PA0dYlqi
 UbroqQV9w9EV20kw+1yncaLUpQV2D6k6FtorZdy2E+uQonacsWsIQkHK8Zh8JiwoXQSMxxoNcL/
 XAHglJ69TD7pNFMbGfKeaIBWc9nswEPom4tcw2/rVXeaDwKo7K/eCsCA+ZKRcvk1DckEuZ+kHD7
 NrVND9vNkW2c9rrxQAg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a056f9d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PVFtU_vroSRoQC6WWaUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140065
X-Rspamd-Queue-Id: 0764153E764
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107531-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the NAND controller binding and add the DT nodes to
enable the QPIC-SPI-NAND controller in ipq5210.

Functionally depends on [1]

1 - https://lore.kernel.org/linux-arm-msm/20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      spi: dt-bindings: spi-qpic-snand: Add ipq5210 compatible
      arm64: dts: qcom: ipq5210: Add QPIC SPI NAND controller support

 .../bindings/spi/qcom,spi-qpic-snand.yaml          |  1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 29 +++++++++++++++
 3 files changed, 72 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-ipq5210-nand-eb7e15d0d371
prerequisite-change-id: 20260514-bam-fix-142a0ee8057e:v5
prerequisite-patch-id: 9e9abb177bcb562f5a07a4865e9d88e82dbb98b8

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


