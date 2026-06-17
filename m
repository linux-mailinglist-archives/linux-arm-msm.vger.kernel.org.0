Return-Path: <linux-arm-msm+bounces-113676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K9wZNbnbMmro6AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:39:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A669BBB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:39:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lTluNpmG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bXjgBEwE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113676-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113676-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 355B9301AD8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE03363C40;
	Wed, 17 Jun 2026 17:38:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BD3093B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:38:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717937; cv=none; b=uB5b4wuvup3VamgBPValeF6V0T9urMQLfJwMwwi5vduMHmAAmeC0N7RImlh+YUTWl5sKr8YPbC6WmPDGAL7Q7qw8D9A2dDHbx/H279eRW0ln2YenKh0uBBup50E27Gzr0Vi4flJ0hpWSv4c0GQXHcIH5esIZFc/Cp1VlUvfyQHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717937; c=relaxed/simple;
	bh=zBII009NXCK6txLdpkC8tQvBqYvLEm8yfzpj5ca3VaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YbYc866uEMFIOllqyTQ/vRQuxXSOY/YEWB7brpnGhEOyRwlPvaOZq3+j6ImWLA5b+Opn7dB0PPNAFmXDaKRbwwPLrXqmluxs9t8YJVoZyqZ+qDNRwyWNcG73pRhd1iTviDG9M7fB8kL1SAF50i5p8U4Fiqo3LvZBTp3cxyjpeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTluNpmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXjgBEwE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFp9tu2698529
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CjI6CtgCxWDvc4aY1Dbfru
	ezal0p/zh3tfHibXZjGT8=; b=lTluNpmGJG0/6lUWJYVREF3aLSDSTJzf+Scbzi
	QT4/CmgvAS5w6eJnA4ChsZ+xoyOKV1fPRaMpAyZAq15YT4tkIu1PHo07MJqsE0W6
	qFdEnggvcJjqMJwRDtQXzNl2XbtrmBAGLcv/dQJvL/rjvC3a22Eayk3x8SlffceP
	tz02gjh2K9aE9Gt0nNs/LNLnMOsOsSXlt73nsPs1S+ciPfcojQR5sWWBGsGx26VZ
	fAzw9Fg8QVW0LhrbDVpSbJFHKQ83BV3Cfm7A+70ZBsl1DsjlE/Kp/SJNXstHEmhV
	nRFFRrOLryUGNyBGZ8G9gLJkYPITqtoz7Q05SBRIzJJO1K/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet4jnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:38:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so122035ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717934; x=1782322734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjI6CtgCxWDvc4aY1Dbfruezal0p/zh3tfHibXZjGT8=;
        b=bXjgBEwEMAw+AnJsKIGJUbgbjKjXb8ptuIfRqzBQgfMWEXuWRoGM+Ivz3jUTkP2aDl
         pTG/eG9uSh2ebPoEU7iSGO+f+XxEFFG/Qu0DHzgwj6Spn0hkcz0NoEw02v1S/rm3PfJD
         F7TCXSjD1ii0zsRYfzDMibwF7CFOsqhPBlrpOPTrsaDg05nc8hl6Vb3mdVmg1FDVUqgr
         fLuwPS0YT26SxedlX7vHqpIic/9F6AnYwHlN5+kIcKsm3R8dKTjUZk20ksgBuNI+ojm5
         xU5SF76LZ5eqTY6mPiJxiPa0U9svspmrywCtgjVuPNtCG2kyYrIz6o3qyXs3eFRiwIMZ
         chAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717934; x=1782322734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjI6CtgCxWDvc4aY1Dbfruezal0p/zh3tfHibXZjGT8=;
        b=RyBDB8SJn0A6AEJQAK0wYnBWvyew5j7lENrm2EOqQTJ7D0WQzcsXsIy7e3hF+sM1ZT
         Gz1E5U7we819yMA1JlQlgCL7GjrCAFEuvZ/xIIR91EtKiMp2Gbkhkax+GjOuuj4fxrQV
         hzmuNfhgbRf7Vmpb5tJRnxDyX9/v8/Ivua+3LW1tYYWWLZiHlKGH1bK2Kjg/Mx6fJz6I
         tgRUddSuEu9c635AWz7HR0fnQQ6mBdL8i+gsfSuv6yEV2sEoh352RWD0b1yOpPOlduyg
         mO1WY5XMSQE2baPJwSvtlKEG5U8G7rNT91a1EsBB6yEUE+XsZi2lAWkUagHmlO0skQad
         eBbg==
X-Gm-Message-State: AOJu0YxsYQHYTH7e1bplfbUy/J3K8aGqLQpmzH9mBzE05Mu0NVhQ1+CV
	hyvApBBqmfBu88EXRb02/77JynNO8oUCkAPx7XqaOJV/+1y/RPybvGhSHhFekFnTes9a9ZX32E7
	S1D613OuXx8XTYUhk3O+hKlwxlJuNHtWHS9BMVwre9m9qb+QuVcZzhYuNBMNIBWKVxJWy
X-Gm-Gg: AfdE7ckQaELvlCw88xmcZLGdalTwKlZCU4UAmvcCYiEt5QrKeEGeOm1BLhookwXCUjK
	gdNCciKGjjMKDQkU0hlG3tqcB2Trtuu5TY2GSdyQqyKIC5FsgEKZw0zvXC2V2M18+SUAPnJti5l
	BvXqeZ1rHwI2tHLxyQRVm0bQXGhgqwmWXzIVUJzwafi/xqJOklNa6MM2+l1XBu+Sh0upOXWXGWG
	POd7TS2EBAgf8zHoQkwIzRaZ3kF/GAbfZalfvRv9/Wwbc37/mm9qY54WKK8rCSJ5R7CV26Xwrhd
	S5WxFvoYyXmjCKYBtO67IP2JqqPx3lIZWUIfGmKD//BctO2cTJfpwCDoGjk1rKmPY3KWytS3M1q
	NnR8ERqeaUxs+NWtybA0oqDqHJXoTAqMdBuV2Y5Zh2QPnyEm0cHML5ApVRzQghyMU76cuogY7Vh
	1pOdYqcJqYlrVVjMzAqMHHtsAd6KkU2YuvSoP8xOch7lIciw==
X-Received: by 2002:a17:903:3806:b0:2c6:b3dc:b838 with SMTP id d9443c01a7336-2c6de6673edmr3240075ad.18.1781717934391;
        Wed, 17 Jun 2026 10:38:54 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c6:b3dc:b838 with SMTP id d9443c01a7336-2c6de6673edmr3239865ad.18.1781717933924;
        Wed, 17 Jun 2026 10:38:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:38:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for the REFGEN in the IPQ9650 SoC
Date: Wed, 17 Jun 2026 23:08:42 +0530
Message-Id: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLbMmoC/3XOwQ6CMAwG4FcxOzuzFTadJ9/DGDNGJzMCyoBoC
 O/uJhciemnyN+3XDsRj49CT/WogDfbOu7oKIV2viCl0dUHq8pAJMJBMAKPu/lBSsHOD9oIV5Up
 mYsvyXWYYCUv30HfPD3g8Tdl32RVNG5U4UTjf1s3rc7HncW7CJYNvvOeUUSEQtNXCWpkeau83j
 07fTF2Wm1BIvNHDTOF8oUBQciW14rnIlMI/SjJXxEJJ4i82+BISCcr8UMZxfAMMYN2XUQEAAA=
 =
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: H3NZqro5MMBXzOTWsEdNMDDZZmH0B24M
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a32dbaf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=jDu6XcLu4sYahdmiP6UA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: H3NZqro5MMBXzOTWsEdNMDDZZmH0B24M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfXznYJxKLMpK3F
 aNj0IznN92VCYz35ZEVnr1Lzs7SeF+g5apGQN7pxItLFAIhrjZx58mF1bxtwk+kv765GxKE0KxT
 xeutYjMAL8xHP9MnGmCt8KUZbYw1Qm9tVoScp8S3Yjl55R/1SCca5NenXNv46tj6ai4iM0TmEnj
 toQjOuyep27orqEHzOaqp021V4P0CkCbRi2bzHheBEO8znA3kA6f4T5n+8oj2BWkmujiJeowm4+
 jzWrvLtQbbpFMOgtAe6ds3J+QloQgjS5jcMwUS/p5JSYLge9XBquQmIbQt+ca5veOJJOQPMyaSR
 4NusAM5NOeCCZy/eB/XtnaJfw5wYUNyocyOiE5rxRXKlOXgqNCLQuj7xPOyvZQ0+ztQTgGGNbg6
 2YGrvaeZDQxtsRMDCgWY+DcQkrRRdTkyEW7MgDTWtXIi/fEAFGonhEi76yv18NgJVP57TNRCqew
 FgRrXetvMsmoULnzAXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX9+Btlso90s4V
 RAOs6zKEujf5zlRyZooPo9MiXoeSkC+zS3hgrtkbHZDXRB8mktnqbnkSouz/5ifAp1tv2VF8rrc
 SulpUNeLt2/MFE6RbZ1F7W+bfD60HB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113676-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:stable@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B0A669BBB5

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Correct the regulator type to REGULATOR_CURRENT, as the REFGEN block
supplies the reference current to PHYs in the SoC, per the REFGEN IP
team, aligning it with the hardware behavior.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- reverted back to the logic for is_enabled() as in V1.
- Added the get_status() to report the regulator status to user space
- Dropped the Dmitry's R-b tag due to above changes
- Picked up the R-b tag for binding patch
- Link to v3: https://patch.msgid.link/20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com

Changes in v3:
- Pick up the R-b tags
- Use the lower case hex number in patch 2
- Document the IPQ9650 compatible as separate one not as a fallback and
  move the allOf block after the 'required:' section
- Link to v2: https://patch.msgid.link/20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com

Changes in v2:
- New patch 1/3 - change the regulator type to align with HW behavior
- Add the constraints for clock and clock-names property in the binding
- Read the REFGEN_STATUS register to find out the regulator is enabled
- Dropped the unused slab.h
- Link to v1: https://patch.msgid.link/20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      regulator: qcom-refgen: correct the regulator type to CURRENT
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    |  31 +++++-
 drivers/regulator/qcom-refgen-regulator.c          | 113 +++++++++++++++++++--
 2 files changed, 135 insertions(+), 9 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


