Return-Path: <linux-arm-msm+bounces-114780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JxmEBRkzQWoLmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:43:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B66D424F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:43:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pPTfnK+H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JNigp6VA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 388AA3027B61
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7697D3ACF15;
	Sun, 28 Jun 2026 14:39:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5F3ADB89
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657557; cv=none; b=lfLz1/5UA/3Sq0UgZvz1xBc9H9B1WKfaQ/Y3CwRwf7OGZvrlUSMoKwpP0dWbBeZLFXH7VUutGSErVXKdBtMd6u2jF7rFGyLpu8KD9cKphQyaRaEGeoaZgP1wxooPAb/DpADpnOXBE6Vos14YGj9Bn6G9JftkjSgdQXx5d48bVvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657557; c=relaxed/simple;
	bh=HSbebYat6XuRCbr0vOrV0jghMR95+d0H+S3AZ3+N258=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fL3r0aTpLhglgyaQz5wZ81rhrx7gAwyf+8hZBrXwGqYFTzwSYHR11bBCK0faPIyFBeaTe1W6XjLG3ns7kwmmB5SwBdFdsIldFbHxLGgTuwz3SxwJz0FRF7BAit7W5n1RjTQJk31as4RJe0hb1bh2TKEGy18ykjdHTONpxDXbMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPTfnK+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNigp6VA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SET4Ux046300
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lKQaKbw17lm33vAWyDAZhQ
	TOkgV8lWLpQgOvWkee3gw=; b=pPTfnK+HxeGMhD+BrkYSb8GaMtCTFbLtEIdYMY
	S5R/41WrxgeeNT2VRCfggj7HQ/8CdS4UP89eyA3vLJnl3ic3SSkI+p3TKXglyXHB
	+ftUkL+3wd5MfwlVvTUbS+8EgRLixyt1nrazm6LB9ZAowcvpYC/1WmiQgUME4hUg
	dPJ1OezcEymMBcgs3AJ/QtHFjp7rcd1M7F8k/ww9kzfzm6qnF42YSkmew6/r5Kr0
	LUAyaxe4o+90Cjy3O+WNwUaaR2hvogenVNaq4m4yFoSRYVsk5dTjAKt6qqppXzW4
	lsk+OxOjIHDwQBvYWRIbS1axkZtdyiIvtFYWaA5P+ztJ5cCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8k2ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so11757025eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782657554; x=1783262354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKQaKbw17lm33vAWyDAZhQTOkgV8lWLpQgOvWkee3gw=;
        b=JNigp6VASP8qst+3N5U7ttOxHU7YG/El6SyZ6X7h+L7UsPbR9hdyBwuytq50MzVOIV
         4YF0INgHPV/e8oBRGtl7yX7A69HOFz12TWdgKl6Q/XG19YMwdUDgHiKAq3c5xxxry0xG
         LG/cMrG/riyyw/Jtuzk3YotVseWvRLj5XunuqUf1r7JZjfqtS71cz5jyIJhqUtjsVFg2
         LaVWE8HxdRGIyBUxftvwi4vxi29BbAVd04KB3MnhSxF+c0nVhJ4RxtOdNHul3dNZ6/K0
         sJAH+niw8cQA1E/5aQ3Y8SLPE2FWIFd8BkvCngDmqvAX/jlhk6gQ3pk/Y2iP9We8ZE03
         8qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782657554; x=1783262354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKQaKbw17lm33vAWyDAZhQTOkgV8lWLpQgOvWkee3gw=;
        b=YbutbKzYlD9VDuJ+1RJctvISeQ3ei/WRXOaoTGHDu4UYlvNill0QwCTIAC3DNnvsgY
         tFMfEnjJgDwMbqFm9HJCvcxMIyKNJeKw1d2ZN3dXCwcpo0MfOP2zMWcu7wOZFE9zUcux
         hCvNs25yrV3sjQKDbNOFKSkeXRTVqb1RTol5I7J+MjNcFWcoElgFeS5YXjKvlpE8O0c1
         bE+E1tzyxS5JYr3bEsCBcrTXDhgAZwmZoGqU/Er6aTUJe0QCWsbO1t+fK4bEASXubg79
         ML/IxldwnahYmuRoRpINGR8SGpglN2NsmfdMm0/rvztPhuIuF38syXfV87HlccG6b6BM
         3RjQ==
X-Gm-Message-State: AOJu0Yz92d+NBZiYfgWWcS3QhJCta4/XfQWa4GChLY00JCJiC1pe6Mcj
	ilIV3c5tHIFYMSVMkqMLMILGli4Igeywbdy7LD5IG4MIqdHZ+1yTv8kQMCoUltq6W0Z/4ZjhOPA
	fZIH9o04pVepbpCVxJhfN+QJedJtWPm2vc3/WabSJW3Q/DsXC4qcMLF4hoxBSKsU3rousYZb3Gm
	hb
X-Gm-Gg: AfdE7cmcWuHGuXH4rHYFN8vopMcrMv/3dAhyKp64iKtN3uP50t+XX1HakbKzQgER7F6
	pP2qQB5QPkg7XDqrcmkf5PJGJrF8XIZm4J+Ln6s4LE5faS2ySX4UjKqtJLDBG6M6h6zp5srJhmB
	SQ/nJyuPb6/KjzkWkRjzQ9CQCuhekuyOCUjmJPxWgEYz5SWjRQ37/aGvWHbeaqy+aaiW8qBg3Jo
	ZEy8r8DP6BgDyzQfW2iLeTE/2m6951+ChESW3VFhnl7GnCn+syjSm7Wvs7OeuKCHtdAC9E+bqpI
	UrXeCHOwdFCk0aTQebRSQYmlee3702HzQWqo1cx7X0cqNZ35HQtEiSl1ATL10I3ugkiU1d0DIH8
	i/vC7F2mf7Jg9LbzLqTLEdSCpRH6cS2eBBNngymsto67dF5c=
X-Received: by 2002:a05:7300:6144:b0:30a:e531:3141 with SMTP id 5a478bee46e88-30c84d12a71mr12867374eec.17.1782657553830;
        Sun, 28 Jun 2026 07:39:13 -0700 (PDT)
X-Received: by 2002:a05:7300:6144:b0:30a:e531:3141 with SMTP id 5a478bee46e88-30c84d12a71mr12867355eec.17.1782657553223;
        Sun, 28 Jun 2026 07:39:13 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm39300591eec.4.2026.06.28.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 07:39:12 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 0/3] Add Qualcomm I2C slave controller driver
Date: Sun, 28 Jun 2026 20:09:03 +0530
Message-Id: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcyQWoC/yWMywrCMBAAf6XsuQvNVkL0V6SHum50pQ/N1lAo/
 XejHmdgZgOTpGJwqjZIktV0ngq4ugK+99NNUK+FgRryjaeASowvnke0oc+C3AaK8SDBHx2U6Jk
 k6vobniE76P7O3peH8PI9wb5/AF/1dOF2AAAA
X-Change-ID: 20260628-i2c-qcom-slave-c382ff4e8691
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782657549; l=1481;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=HSbebYat6XuRCbr0vOrV0jghMR95+d0H+S3AZ3+N258=;
 b=UYAdQ0J6ieyuQJHepnUtfY37oNslgOwYB3/BCEKxgXTWYNSZvUoDtWpmmfag6kkhGUCfz5QCe
 QoQmS6H2W2qD6W9mBoTkRVH3RJCRfg6g0GEIEIDqZfddQ9TnGuPLUL0
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX99j6t4T6K+Qn
 gQ3cYpFvPBGiBcgoHoWa/Z6TsjihbtpCwKBIpQTcYAcYtXHuR7MDiZ6JP3VwHzSh1LLkxU3k0Dw
 yzH2YQn2zWr2EIsK09yCcd9VptWjXUo=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a413212 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M9RsmfkhjSGwUMDLw84A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: sKwa7_adDSBYe-O0l3usxmEnXBnNfxD_
X-Proofpoint-ORIG-GUID: sKwa7_adDSBYe-O0l3usxmEnXBnNfxD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX4GjbQhatCem2
 kF3aqfuGOe6QVBSC5NicbK6/K4oiJ5Mo4pGGKH8/7WeiIt/7pQEsJ4r+p2GZeROFn3zSAc40tXe
 49Ew+NF/cs1qrr38vN7gQVDrb/YEUQDuU6uSM1XDPNRd6D5BVe8o1lF3JZ5WP4YIkWDFYJQn75U
 PAKjHys/CMBGVCTkwj5AexBqEGeq3AuVY2t/z4B+RrmHSbezHHiXyLdkJoaVIECDEh8XcototRH
 vpfis0PYDpA2RNB9nCydrMgOXBBFn8rzjOmvasxr3tx9Cg5qAHO308ZwZ7NGuHHMhzHCa+QSAl2
 /RGbpfVpZr1UEHV5aNtWYt0zi0FxPhQwbIz0LdGqLQCKYiNXTIvxoWlZPgrqvtetuacEC7iI0i+
 cLEAfmuGtpB/N1MlQLbwHD5FTLcDriRLrOSO6CxU2nSXqV/SWJL2msHr9cmhzIjyhlSi/UQQp+C
 HlRntJ/OF6oPugluYpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D7B66D424F

This series adds support for the Qualcomm I2C slave controller, a
dedicated hardware IP that operates exclusively as an I2C slave device
on the bus.

The controller supports FIFO (PIO) mode for data transfer and exposes
an SMBus interface to userspace via the standard I2C subsystem. It is
present on Qualcomm QDU1000 and related SoCs.

The series is structured as follows:

  Patch 1: Device Tree binding document for the controller
  Patch 2: Driver implementation including Kconfig and Makefile entries
  Patch 3: MAINTAINERS entry

The driver has been tested on QDU1000 hardware with byte, word, and
block SMBus transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Viken Dadhaniya (3):
      dt-bindings: i2c: Add Qualcomm I2C slave controller
      i2c: qcom-slave: Add driver for Qualcomm I2C slave controller
      MAINTAINERS: Add entry for Qualcomm I2C slave controller

 .../devicetree/bindings/i2c/qcom,i2c-slave.yaml    |  94 +++
 MAINTAINERS                                        |   9 +
 drivers/i2c/busses/Kconfig                         |  14 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-qcom-slave.c                | 777 +++++++++++++++++++++
 5 files changed, 895 insertions(+)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-i2c-qcom-slave-c382ff4e8691

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


