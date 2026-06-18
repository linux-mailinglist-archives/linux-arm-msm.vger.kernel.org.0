Return-Path: <linux-arm-msm+bounces-113807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5j0SHZFqNGo8XgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C73706A2D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 00:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jl1UgIja;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eh7FRzBX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113807-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113807-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 326A43007209
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 22:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85962D0614;
	Thu, 18 Jun 2026 22:00:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16D123E324
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820042; cv=none; b=XzM0tq+0YRnnOt+y0rPqOrCVLlrJUqEOJDoXj7R9Px4Rs9S1cFduUqgNsdyk79/D81/ePq+Zuj7c2JnW6byLCvIazM5N5M8jS0wEWB7kF6LDBdoXP3MN/lPnCXg1dh3lK7LfctKR21Qp8QUEUnPpU4KAz/Nnv+bQIm1SuzLziVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820042; c=relaxed/simple;
	bh=wtJ5sds89h9vunDyHdGULTK0X3CA9KCgDtWoMhjzzB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y2KrOTgIHdaZ8dA5yh/jZh2C7wkunm0RTaxqFPoaXG1UtArZW5BqS76SSeBM3i/yKPSzMK3KrzEZpjux1I8QrnlESHQGPjVNeAn+PF/0ohrUKdRtfehUA3YX8eRr48NltgXustbnHZbRRvZNl9kx1Mid4YFj6lMfwlP+8PzssXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl1UgIja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eh7FRzBX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsdAJ4078368
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2jHq0CHr9j/tqTX87kkQ/2
	iC5qIF9+D+JK9fwz4ysEA=; b=jl1UgIjaKBvj18YaJLBfiCHYUAUrx1kXnoBqo1
	miS5/FxFekIPosUY1OVeWG2NZdJop7+6bXMPYjThY66M6IH63wQ059OSom4FrK2f
	iSEoYY6Fro1jCgwTPfKktrUJXvjrPXfvKo8Mi8sSfSeBOVbobm+Q1VERZeFsxuiS
	GTVEEk9EmKgx4TOkSi0zlIQpoW8FWDdM2WQhtDabFuV+Wz0UUkjfLJkPpqyuEEhZ
	ZBzrekO5kpsT+3GsQOeEsKzpZnhe32hQezCD9d9LDP7iFvO8F4dyJUKYglMk1knP
	UNaZcJExHBUHAp7kBAPUZmtbAqT144kV4ZybuoFP8nU1I15A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmjd8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 22:00:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ea42b025so848958eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781820040; x=1782424840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jHq0CHr9j/tqTX87kkQ/2iC5qIF9+D+JK9fwz4ysEA=;
        b=eh7FRzBXxEZj/+fIJllMTF4ExrU5ZMl571qU+BKiIkGOefS4oPq8FSpNzzwR6grKIv
         1H276XTWUSmo8mUskMkPBa8AlIP1aDDllZDMS9OlFTscNIhYHm6aWkperM9+h1FQjG5K
         6t1spve53SYJMUcXr5bKhZl9P+KrtOqWkkRhhyANIJqL1wDKESEi/qeCaxyeupvdokqp
         vN3lsY8KkmSzg/4JnUgbpkykzhU1bqXaNNnoVhr7dmulTU3CLYkXyMm7tf+UH5CyzezC
         gJ6YSNsLANLragPJiqzSQ9N2N76TFa10bh/DBFf67lm9/wsJdE8XiDeFuYFhtEGyuK6A
         Bfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781820040; x=1782424840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jHq0CHr9j/tqTX87kkQ/2iC5qIF9+D+JK9fwz4ysEA=;
        b=siuGvwRWOCAdIg+BndWssGkKnl6hA9/Q/uVTQUTFtcq/eLgscpYYZZjwuzTH34Pu+/
         wjZueyMZBmTPhXH7bixMbUHEmQx6ZwFfcftoUGedidLoY+CLKxjQJjpxwqH4+s0tPQk5
         E55R8AWG7NVUCpklZP5fZRh7YiN3ORKf+kYcsikBA4UAvRj3dez+bBTcPSbY/xnPytzA
         jTwuWCSTNXCOyd76scPlHsVsH2hhP5pkacG1g09AqIYQKt58BhPblOU8XtywHUtDDM89
         rfzOFSumm5REeE4//ucgGH6oCVP/w0Jk2nX22pqJpntcKDps4pDkG9n41GjjUnA1eEXk
         XggQ==
X-Gm-Message-State: AOJu0Yy6kOTWe6+kI0cA5n2XAU7Iq6lU6VHRp0VVSaLdlNIo5R5FptAW
	FzWApFB4RPeoUYhxL1MJmO6tviQ0Jpi7yN3xVNkZApPmpDHfKrhEenmXKlA0tqzxWQ306nqNH0V
	oZNBGgZg+BU25RfvHLBndO5wHUo2oCOnqm7jvVbFF1Spuw1LDUPvO4FhU+VN1hXKeUIQZlNyKDQ
	ww
X-Gm-Gg: AfdE7cnmIEIyTwBIkLsR2hL0JQoJgXhAQrTHqKrfw6ywkUjp1/XSHJ1ayuzsQecEFB/
	+kmqd+U2HMyrNhrneSamBrvyNEoKPJ41JKcdD8RfIyCvIhgTeIj7odANulEEhf73pSWslpRpWLh
	jZ00GA0FE4D1WoqIdYun7X7ezoLb9GH5Sdc1xKZZaihitrAqZ5uuMo/miOk9p8AEnxYpY5mpkmt
	7gniS+pxaPSxZCavfUUPl8rDCXDIdY+Da1EG6Qxz+QUc9fMFHyKb8Ivn8B7+2VWjYiFVqzYgJ19
	j6lnYw7ZxrUT7ciSxEVg2GU8qLx4CNGOxYQhzlrA7RTa/S6+dt4R/Fw2pRH2sdGUCZz8maPvkNv
	i99xlkWKiK4oIPaRfluQhmGOTRzmk48ZbDIDc98cajgfKU/MA
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr712904eec.9.1781820040045;
        Thu, 18 Jun 2026 15:00:40 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr712888eec.9.1781820039527;
        Thu, 18 Jun 2026 15:00:39 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm628436eec.8.2026.06.18.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:00:39 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v3 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Date: Thu, 18 Jun 2026 22:00:31 +0000
Message-Id: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH9qNGoC/23OQQ6CMBAF0KuQri0ZChRw5T2MCxwGqREKLaCGc
 HcLamThpsmf/LzfiVkyiizbexMzNCqrdONCuPMYVnlzIa4Kl5kAISEGyav8rniLingpgyiMMY8
 EIHP91lCpHqt1PL2zHc5Xwn4BPg1D3eBG+l+tUrbX5rn+YAyW63cs3YyNAQcOmAWQgSwTig/aW
 r8b8hvquvbdwxZsFBtAZFtAOKCgNEGJKELAP8A8zy+Nq/WpEQEAAA==
X-Change-ID: 20260506-hawi-pcie-f61435ca420c
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781820038; l=2115;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=wtJ5sds89h9vunDyHdGULTK0X3CA9KCgDtWoMhjzzB4=;
 b=THQMROGvn3zO2lI+WjghsHrIg0PhfJx1T5KYyRt2m+AUXA7gB8pFKhoEM5HItpxlWzOE6du3D
 3rnzBbt1VDoAWECjgxEUL72uYA6PmvrascK1HxGS0yXK5DddzjVLq8H
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-GUID: G774nVuOjrA_tJt91S07Ag7L7rIX28uC
X-Proofpoint-ORIG-GUID: G774nVuOjrA_tJt91S07Ag7L7rIX28uC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX/VXtYzCGqFdA
 twkIddb3i+IgPG1FpQI73Ma3nChqfid3/UwffdeWa+HnaCLgJnunaMVhhwC7C0XSgMVB17747vV
 cK96ke9lCW9ZLQe5KGu/7LFOoAy6eXIVgCv5WtOnNzCClh66Aa9Qe5RVDD3WYuF+3fF1i+DrKfb
 EKedK4D0xHoIYnIas4U3GZDzKaoSO92+jqA//0Kx/jrjt5ypCJ9ZdxJV5yDqFciamxezOjdlqkd
 boCZ/B9rFfgyEBhBSGYkrPAyK4vxZEXNRRfZ8nX1yBrt6QJDx3KHTplsKPeVc9GDo6TJOnmYwVP
 DvdXgXWzpS/A58p7t0tnvbGOfjnZPG28s6nhjRHH3z0AXYuUg7ugnY61ikMgNczQQHU8mpfWVBt
 PRkniiAfq4QjG/FANXWht6FdrKgf6zVzErgNVT+kzY5sgLuC3IlY1RnZRpAT4+ykbvFoMKPP3fM
 g84uM5qYS7eopqsJqGg==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a346a88 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=yFGAn9Q8HXAzXJEDlGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX/D/2ueOlEexp
 oXAawq0O/2fM6X8qwzS1d9NPpW+CUH/zpTzRIJ/yAfLjdj/g9WucNxVBN/RRKm/5h1ATF+L3ejx
 03gq0CsegoRqCpMFwB+3ypQ6DrSahcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C73706A2D7B

This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe controllers: one capable of Gen3 x2 operation
and one capable of Gen4 x1 operation. The first patch adds the device
tree bindings documentation for the Hawi PCIe controller, and the second
patch adds driver support by enabling the Hawi compatible string in the
existing qcom PCIe driver.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v3:
- Updated binding example to use ephemeral values, removing cross-tree
  dependencies
- Link to v2: https://patch.msgid.link/20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com

Changes in v2:
- Rebased onto a newer linux-next snapshot
- Previously required dependency series are now queued on linux-next
- Added minItems constraint for clocks
- Moved description comments for clock-names, reg-names, and reset-names
  into 'description' entries in the devicetree bindings.
- Removed maxItems constraint for clocks, regs, resets for the fixed
  size 'items' list
- Link to v1: https://patch.msgid.link/20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (2):
      dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      PCI: qcom: Add support for Hawi

 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 202 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 2 files changed, 203 insertions(+)
---
base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
change-id: 20260506-hawi-pcie-f61435ca420c

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


