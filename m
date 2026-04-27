Return-Path: <linux-arm-msm+bounces-104587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG7fD3a87mkaxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:31:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A781A46BEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30C1E300459C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4737621A447;
	Mon, 27 Apr 2026 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmvhDyWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1uoQ9Ck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128F7262E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253491; cv=none; b=OdDX2yrpnDO+QzkA67zQ5sY/xiTQrdvCef9rq2XzRsPMZVs18npjK/AbdBtylbDce0hddHvgzxORg2O69H9xuX3mCJLUYXGK7F2oMot9I0/+umksh4dQNPyC05rytrvX3rxB5ti/Vm5uy8cj8FuOt4mpp2zT2dgw7B8c05eUTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253491; c=relaxed/simple;
	bh=fyTQen4gxGRWLtVzQALD2SP6tF6oprXtAxdffqT5eCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ti2SMMVtNFnx1rqfdX1FqEH8Ghe77yqYR0rr5zoq2m4vIMBJewisi+TYjcjpuFm9HCMEdMbZ70aCxlY8OAAGE+T3BGdIw9fZiZW20FGxYcp8v6lEDN3IWvX+zKGmU5fc60H2Gtoz+8YoxhEb4TpsFY5DcI44Ib5PdmXVzwvYU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmvhDyWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1uoQ9Ck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMml3n2395309
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/0deA0ZT7ywlL3EfI1B58TJqpkBYFgAu1RO
	OeM6Ol5E=; b=CmvhDyWO1R4DJznOWWQnKV+ybh4k4Utzq50ipaUNT/WcqTaVFHB
	HLha+IDZHXnftPqPcfjzcxHMmZcfgDjJfCf93qsamAlSkaNAhc2i/tbukRApEVS5
	dwsR2pb95yCl2mc26MMs+WMfSgnSTH/yqwIt6IGORJ7477/DiOfqOCWWqfC3OGwc
	S+JdtE224EM8IvGTkGne2Xy4adsTnCs1lg45pLNXboboLj1hlCTqWgTsJbSqAgVo
	swzDgyKQyu2J2YOntuoO41tm4QJyDEZ5PMvqIJ9aEJXlE2yLZaSE5C15zXO7FS9a
	kOhQ1kJLqzu5dRFBsZQukYhQ1Rv2XYlTmbA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07kx0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2de07c12745so29358718eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253488; x=1777858288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0deA0ZT7ywlL3EfI1B58TJqpkBYFgAu1ROOeM6Ol5E=;
        b=R1uoQ9CkUtlO6I8DcSgFwz3I36TiizQOxIfoXSaXXML3VOtISM9Inxb9PsgXhucES9
         6pNW4AmVIAqwkSSIQBH0NK+/w0n/fNIeSip8yfY4lCSj/UwSnTOd6eo6osab66A4QLjf
         9RTWe9f2vqgdwvRywmSCbT+ZCfbj6b2BGGN1hYJDFRe7zrMJ9V8HumnEIXfjebQ5D+hG
         wxgH1x/eLpOSDy+k4Mc+y5FmuQ7FjZbwFdW2sJcGg1oNUSI9WQFpKwDBawkl3799dDiq
         7JLg8tZrQO7kEJLPMHLkaiYmws7q67vmVVTYIBQjBUOctW0pp31RtCEaemwJGqZqFux/
         7nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253488; x=1777858288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0deA0ZT7ywlL3EfI1B58TJqpkBYFgAu1ROOeM6Ol5E=;
        b=GraPRQnAq8wIvdQGt9/HuRFgynHTPiUK0QlkGCi87d74vi5B/1MzKaTpHQehg/GIas
         pubYVJWK90EOWZOJY+6N138tNTbLXsqNr9PGBdlpTkPQ1zy1a7mL1TRJdC6LC/t1J5Il
         JDF/LyPfrm+E9JdpztEpTUrOazOQh0S70ZHAM/qyk40nyFdrJZy8RtP863/pofYdjFxx
         ludC65hLUiHRMdKYW0Bd9juG2tlCoEYwCSxaHaflw/DoNdD8oBzaO/2NDH/u/Nhk8mTo
         584wg6jJ30HzYTa2+tF0DIr1eKVfcHgG0KiylPt3yFGvhI9Q6FpiQZVObxJa/D2Vs1Ok
         T/zA==
X-Forwarded-Encrypted: i=1; AFNElJ+35jEisMgOBerLeOe/6OinLJlhsbpc+KeyXWDbRuD8rJnYM8Z8AZC3Hc2/D3g+d2Y2wCOPfIsTo5RCZY7w@vger.kernel.org
X-Gm-Message-State: AOJu0YweaLMVM7z7tFGrJeXVvAox4TCnKQB0ObALEsYEICdM1++fzdPJ
	5Qw9/VLeJsR4mDFFxGp60t2OZpMODuRTHqLW4cB0p91CfeyT3hgYAhA26mMOg6+ir2Xl9DvfOqp
	yBEMEnZwRm72Lp3klCWGkVcANivExL41n87cRcP+Qlp+k926ggL8JulMcJiMq4orhAc/e5ETDeu
	TQ
X-Gm-Gg: AeBDievT8/epamx4DD8piafZV4ji3MfjjfR+Oopo/5FlRPjmjVCfqBror40fnnAXw3T
	y7my1GjzUiFF8khVWAhhowXBfZEqFrfyCdqZ4JS3NUtkT1XQbFxPrkfPokdfEZ9c9jxe7Xi+bvc
	8HR424PeSsqaF2LzttaoAKv2G+xLzqbA8WJPRl9V4HiyiBb+VWTceka/X1sjX7FMcN0OUFsenBx
	JWG9molfr79qR82mf1cseQoPRiHU83ex7/lxdjQvN/+NAu9skSdeM1aKcq4fRY7Ro0sOc4YI5dD
	BvkXzkMVdxRzuoJ2VlVoBsEgbp69m4YD8g+n5zSvTkn7UgbHSHIbuhCJxa4UEAF58UIpBISsXu1
	sCA9OEVygYNID9ymYvTKUG3WIs5yW7ysXRbnBSRYZ8dgcnzzW6F+QLonr2JrPbmdoykDNee8sru
	bIMxe9yIMldQMCbMOn
X-Received: by 2002:a05:7300:8c9f:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-2e4660475e5mr20976464eec.3.1777253487973;
        Sun, 26 Apr 2026 18:31:27 -0700 (PDT)
X-Received: by 2002:a05:7300:8c9f:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-2e4660475e5mr20976447eec.3.1777253487461;
        Sun, 26 Apr 2026 18:31:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52749042eec.8.2026.04.26.18.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:31:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] scsi: ufs: dt-bindings: Add compatibles for Nord UFS controller
Date: Mon, 27 Apr 2026 09:31:13 +0800
Message-ID: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69eebc71 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=85fteHkqF822gKl36b0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: UOA6ytVDReXgoBzXSOE1wg0H6q8KufE6
X-Proofpoint-GUID: UOA6ytVDReXgoBzXSOE1wg0H6q8KufE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfX0QS7H5gpHcZq
 WHoJpIBsHNcEweO1AVB76Yn2vFHE+S+b0j8huQOJIOdr8S/jgIF1k1cjkD45MdbVUPnlUpfwjA0
 gMODUwt4lFdJQ8cSWCN/WZN6haZBR8N1GSvuEuEhIUY3piRaxgNlI+TxgeSsjO2JoWjmbwm4/Ox
 25xXpHu2FnPWN2X0rd29kTyHyKqq4SLe3Y7QgEpuyz/WnkA9ry/lsDu5aTG3sWvwppilE/8eAoj
 GaKDFVH0MjRzCwNi8xVgKre1Xfk2JZzSo0SOJyZAUmkOTS+HTdlyAtYNXBipvyuJiwSrc7RAZTU
 BXBIhM83hTSOtFLFn93kyQfZo2T3/hQLlpigOgvzaM43kfe8/ovvNDxrzqJPDm9IJOlQ7bLpaEo
 OEhdN50CFo/KqXbcfDD8ycFitEcaAmCHYPNHmnfNR+8OusXl8rtl3CHRjGBcL5GR3lLLZjy0JhS
 nk8oCLCCBYqBsddWgtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014
X-Rspamd-Queue-Id: A781A46BEE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-104587-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series documents the UFS host controller on Qualcomm Nord SoC.

Nord is a Qualcomm SoC series. Its UFS controller has a multi-queue
command (MCQ) register range in addition to the standard one,
both of which are required.

Nord also has an automotive variant, SA8797P, where the platform
firmware implements an SCMI server and manages UFS resources such as
the PHY, clocks, regulators and resets. As a result, SA8797P shares
the minimal OS-visible DT interface of SA8255P and uses it as the
fallback compatible

Changes in v2:
 - Keep the newline between compatible and reg in SA8797P patch
 - Link to v1: https://lore.kernel.org/all/20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (1):
  scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller

Shawn Guo (1):
  scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller

 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml         | 6 +++++-
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml          | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0


