Return-Path: <linux-arm-msm+bounces-100534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIxbGKa+x2lxbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:42:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C34F34E396
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8D90302F251
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 11:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D67388E74;
	Sat, 28 Mar 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnZarFSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDW7kYgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37313DBA0
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698101; cv=none; b=MTfG9e6ArJAIzg/oqEPMk7vrb7sZ+csm9zsFhUxBzt4UIjc41zLsSOXl/V3dk8y2bP8K6jKD/PD8kerl4v6dl4Et0f4tgh8hXQAXvzr3Gb/KwWungOFFw3218zekW4zA7ulRg5JmCG0SoIX3ttiwwBojvDUS9Ul+Z2ZbcyMV1nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698101; c=relaxed/simple;
	bh=bnU6dynflPew875hICHHOHSbmvl2NPUqPBjNWh2PwTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TYafKURHJtlvjNcQgR7/uz2qCRMtsqBjQQ+uQPsaOTlV2pTik5sUIarDHjWyWgLoXyzy9UvDzptFStaouAM7cPp1j0iCPj1mtHegn6rzFTymdOAkYSe0PG/zegeWuoDrcEdr0d7cs+0qOGtK/9CVx/gazKbXxc6XFxhJd1SK/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnZarFSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDW7kYgV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S4Bnao2275085
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 11:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EcsKpw5E9xiRYPE8J+Q8nx
	afgyfjjfSrJbk6me1tHNE=; b=lnZarFScLnqIzEFjdrWhRLA0DsE+P+Y1vBEmcK
	jEoEWcuoO3wMkPGANAkuvDZFW9uKVZiZIUp1eV6mI5+MWMTHWO19pYVVzWqZeO/y
	GYIPdLK4F00L9m+UXHJHKiRLKRXrQIR8q2g2nSxz4qHMZfho7GIYhHBr4p07gPWh
	2Zrk+yeY1ai6qLioi+uGqg4p4/W8OMCMvKzu2i1XeyojM/snyHXMliq8XRg7FPui
	zE7attkp/kp9K5msrRPKDPvvS46Ptv9f6atE0keyS4tPhypwYEEHx3CCr+MU43k8
	s1UY6/JOnIw0nKPgTce6gVwA72xVk1917ChzceeW22IUmNOg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67rc0npb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 11:41:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c742679ecfbso266574a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774698099; x=1775302899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcsKpw5E9xiRYPE8J+Q8nxafgyfjjfSrJbk6me1tHNE=;
        b=aDW7kYgVmykPeTYuZBo7j2XgLurh3YXFms41ygUFGjfKwNBKFjtqiGJ0vbjZu5a5d4
         i+7Hp/EaWIoAJvdPaec2kqy4I/gqB0b0ccOYVBiBFieE61olkVC/Gt/fSUy6MxdviZ5t
         nYxWPp1lhrhSc56H7w3xqGysC85lmYycyIAJDeWZZwVFlaYHaY7vMFUUq7nUdq0XgYIS
         D4MO/WXmLGCe3hG1SKsySeX/PD08O6XyUNs3Ra1cfxfw5u1HKUW2MrXdneIBRUXlQ8X3
         4426//WLYfBGCuNpjOo6Kg6oZNSlLbtl906ikqRu6NIc8KVIkAHadI4BoKHa/yVzSwrq
         JZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774698099; x=1775302899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcsKpw5E9xiRYPE8J+Q8nxafgyfjjfSrJbk6me1tHNE=;
        b=QNDW1+h1m39I0koG+qHpD/Q6g0AM8s34cFGUHN+rztaojwkXzLHWqnZ6EGe+q/hFQK
         +ri+5josyIamzwtaLTLX02wfz4X1KDxRmbwIqW+mfF3xDiJSZQ8Cw4iMrquoHfE8bJ8h
         tlQDhqrmhLMIE9bYWfiRoP6Xy6yHFljYDr9tdKZpFooFUKnEyqmP036BjIOjT/227FML
         Q0Ldzusxi0nlxjIiyumXQCM41gu4kMipGbHjequdl4NJxy4Vv1oAUZOQORY52o9STK9m
         eIMG/gkbzcCJgjg0vCFRMUc+Ts2L3ovoUgpo4AiA5BIljSxOgBo8WSUbuRRNP7VNOOE7
         ySJg==
X-Gm-Message-State: AOJu0Yx4SnYDL7qIGkWWSQEvYmMpDGOPjhOZydJXsjg26A9oidetHkrG
	Jc2hVEaoGP2jzO+Jj3CximMp6TmPNkyJeJC20z2nJ2UEv/Gt5/y1j8tfYO+Ndx18YHOSAUMS6Yg
	ajxTv1LC3VBkzC3SHxF4vn2wBm0mrEhji4AX1hY/HehUddAr3yOV8/SMgnYYl4It9GVLX
X-Gm-Gg: ATEYQzx1MXVHavxH7YSpUrgncYAHmnjpAOOTtu4vnG7DHQ+jy+oEsOUdn2jtlTjtPnS
	J1PylW0DesZ3Cvn+cyDMyFebouXtbmEGXU0zX9JG44tCAjU37XWhuMWdLg3yx0pzC+rJ2lK4RYh
	W1lqN2FH4vwSwaSp70ExUPstr2SeLcHYBVT3GIYCydaaIRS8oBL0GJ3JF0rB9FUuW4EGtzxYDu3
	HThi2sMgR7ol0I96QRfcLLC97zw4qrUrpy9XV8TJNDMcJE5BGpWJGrtmwGd8sq+Bxufg/hiVilr
	ZTCW12efE26xBurL95+JXK3cBKFqaQZqMjI1gcaiM8CTik68c5vs/DlC3noWK2CSscVIJGbeMAA
	svnDlZMhSz+KPmtrtCQVkPeiIPEfdJu/XIPAC1vy/PatKS4ukxnyV
X-Received: by 2002:a05:6a20:12c9:b0:398:6e91:8554 with SMTP id adf61e73a8af0-39c87b98675mr3770945637.8.1774698099482;
        Sat, 28 Mar 2026 04:41:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c9:b0:398:6e91:8554 with SMTP id adf61e73a8af0-39c87b98675mr3770926637.8.1774698099074;
        Sat, 28 Mar 2026 04:41:39 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db535sm1681238a12.30.2026.03.28.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:41:38 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Introduce support for Monaco-ac-sku
 Evaluation Kit
Date: Sat, 28 Mar 2026 17:11:16 +0530
Message-Id: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFy+x2kC/yXMwQ6CMAyA4VchPdsEt9Cgr2I8jFK0EDezAiEhv
 LtTj9/h/3cwySoG12qHLKuaplhwPlXAzxAfgtoXg6sd1d61+EoxcEJZJwyMNi1IPdFwocb7hqF
 07yyDbr/n7f63Ld0oPH9HcBwf+AwxMXUAAAA=
X-Change-ID: 20260328-monaco-evk-ac-sku-6d66f965335c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774698095; l=1074;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=bnU6dynflPew875hICHHOHSbmvl2NPUqPBjNWh2PwTU=;
 b=FlZWSA6pubdtWMQ/f7H5e6M7GADZn09t+Xr9Mp/pKLgRMci+IeEZlgO0dw3ApZLl6KyZEt5bp
 LH7cRpieaqiCxTps92iQYlufx1vAz2bdhP/ojutsR99pfWCjg1fUUU3
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=atu/yCZV c=1 sm=1 tr=0 ts=69c7be74 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NCBTYWx0ZWRfX0rf316LkFcRo
 VV8yc2mJUHMAloOh2FT5Rup+CLX0TaVE9GaWqzyqVtXqy24+6vX0kIXrjWE5pGeBmKASgrW8feB
 9qyuQ7SK1MP+Nqcvskbs0T6YINZOb/HJyvxcQb7gh/lSQRcNx6kbxHhUx+Sl2F89nzOaCkgjEP7
 W1AA/MyHH/ubfBgfUp5lLo+T/r2RzLBrWaeIkY0ku3rREnEr+KzrEUtf5VNWyfqvrX9KlxYevhl
 iRruFPp4FYnjar0TIsVLZPgTXJFWjP2OL5YDhXsef0FfewyOCuPkFBbIpqUBf+O8hvGQfxv4Vr1
 WBtzKxFDvrYZ8AUFjmv2477v79uUbBB1/DgZJUghXwq6mo/C6AMGgBPbO8VheOUW398I+HRQKtL
 ngKa2m+tAZALBH9i0oVdlAgrMmabvMXZ9J14IXTg9OB+9oK7A4rre35rmFOBEbzo+WawnHoRC2v
 2Mu5gmpo0utlX/pQMzw==
X-Proofpoint-ORIG-GUID: kkDztURx84c0eneGS7XHXELB3NVU9T84
X-Proofpoint-GUID: kkDztURx84c0eneGS7XHXELB3NVU9T84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100534-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C34F34E396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Umang Chheda (2):
      dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
      arm64: dts: qcom: qcs8300: Add monaco-ac-sku EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk-ac-sku.dts  | 730 ++++++++++++++++++++++++
 3 files changed, 732 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260328-monaco-evk-ac-sku-6d66f965335c

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>


