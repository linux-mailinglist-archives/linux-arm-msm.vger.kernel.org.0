Return-Path: <linux-arm-msm+bounces-103729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACqwIDX65WlwpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:04:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D5A429269
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26967300C0E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E3A13D539;
	Mon, 20 Apr 2026 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kniTWOR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAsc0SDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D18383C8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679473; cv=none; b=tzClDj/bjFyjJpvqslAhiUAJ23jaxbBRiU6AYREbn7dQnMtNKRnIThsmpyTLG+WPf6+sixAA84hSkVBQMfXx9KUw4GMdxLHzHO7L9iUTdzpCfJPyURVMd9uw+5Sxne+qDJ3FVDYHOmSVv/lwhWmNSJ3iil9RZIadcQr/XYPruLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679473; c=relaxed/simple;
	bh=eV9AES1TbhXq51pA2mMeaDXNGOeNegLY90c01VW5r+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzfCWOL6ESzL8JRkiVS4O3SSFGAcDrP41WVVEDqdC8/3tlP68hOATQrmuhrPFbdcTjwpXHOShLo4Axz+oeK67nDjvKpwlkPamsV5EwcM5BCnRku5p3ylpIFAaGQSOe8nEVZ3g7GVWpthe76d3fkL+csHaDeU6rPsD/Ge517wAtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kniTWOR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAsc0SDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97WiH084674
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EHoyER7aYaxX3ZQ0duDO1RAvEw3sWVcW2tA
	TNTZNCgo=; b=kniTWOR/XREAZ+XnphXnrZ08z88NKFVhIEXCFD78IigEnTF/nS1
	6TuLtUW6juW4DFoVPBu7OsBa5C9RWqhO2W/MZm7sePFGayFbvETPj/eeN9/Gb83U
	CKbbTo6AieOyMQAHsDzrayohfPlgL5I6pQnpjb+TzvU84dBOshdOIhB0AgvNcJCA
	k/faOKNDCdU5x3Swgi4hlOvP4POSSas+r/ImfHEt3zSCliaVJcbhTvAB61NmqFiS
	bYuTqFSo5wu2hEniXl3dVy37qtGwuho+ceI26ZR/xGsL0095tOXu+Q2mOlXJipIL
	XjMBoslbKJlYqGQw12pBzqsIEEZ7VbM/e+A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81g7fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:04:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so2973641eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679470; x=1777284270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHoyER7aYaxX3ZQ0duDO1RAvEw3sWVcW2tATNTZNCgo=;
        b=CAsc0SDjzgb7NsYgZSqAw89njsNOWBTA0Mk76tKyxvq9aFMGWZLPrng9+M03UvQifC
         0b/B9XLrq1rx534m9CP8awRlZv08zwSpygRfxkkmiie8UuawwZubE/WWcAoWmseqp0OE
         Y5sdtnajfHCH1wat6uA5s0w511Bio01e73az6rb6LfiQnvkSCoKIfX+Uw/gcMo92vkwu
         ycpvDbv65bAL/qoRHcYdpFbgYHKNzWEgRhtViyRtxYMKkI5FeTZ2A5NGGlXumPCQON7M
         Mm9zZtc8hvBpnjFRREl8fj/EwzhWhDso8/7OqIOLAfGZxuzuJyJd/I83C8HiKQcrCCUS
         dMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679470; x=1777284270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHoyER7aYaxX3ZQ0duDO1RAvEw3sWVcW2tATNTZNCgo=;
        b=hXWXFnJjC5OLwO3jRCH5tQhmYJ2IJBngxUn5AWPfeJPs1fmLB33FgYBY31QvsKFXAg
         G/Q8fOZDOLZq+Uuo4DUHc7A8orhF3LyRDogvpX0Og5/rCrpiPOCq2DOfM/di9eevnt4j
         u8OrB4qDwOxVJxwpZLcu0v63Yz6XA9M8G1YwwukjNzKa5QREUl0ci6aR/mS3+QQGHGoP
         RK3h4DMKJHXoVyyPqWBWTbRsaMpzLzJRVu1PtQTmnNC5sU8Yl9bMTI+xlP9ActtlwQWl
         AfpwNVUYxMdI4f8iX3eITQEfAOaMS6q4pf7xiNB08C/VyvMJp8phawxzw6v6VBq1m/mE
         a/KQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LMy+JfOhZLqCFFd1DqZnbmovsjTWk+mA0S2tbx+40Y9pp+ewWHpKPxO/dJWrTPUAcTcQR7M5tuzoR0ZBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNczMCv9cuSZ+7dQxXSjwXKPXElDNYB+vIILm/R0X8I+l8RZpe
	KDH5B80fcHLPXknKQ6PWGFoeMZueC69ft0d3Qu9X2Vc8YFH122vkCRTxN+9P4U+pPn/JLmMzE1f
	Ucn8DPfwYafu0PeziZfzyz31uVNJxQh0RHjXkdmq5ajhvyWkFsCWi65Ua5yC/SKEIvXsL
X-Gm-Gg: AeBDiesChWeHDH/HtK3Xm6KsLIUUHKTNiGanm2fHdg3pCzhgxEg30dlbseR+9Cd0oOD
	FS3kgsffCjw4j2Ir9Mm0I910s7U91KAytqNazaUaLGWe5nbDN4oBLAuNmsYwYgeSN0zUKzHzXL4
	Rq2sg8B5ADRJta+US2Xh9Di3vpSvmFSPUyaIAM/SdpB1d0a6NH+1koW3CoTaj+/ae2zMowOoT8i
	/VUo0mGvZkGuU5VaDLBK/PwDlnRVF0b0yLasqEDeTMXNQY3U1BqYqzaV7BBCtvXSLMGIE9lnJWE
	8+ZZcsQoHBeic2z5sQCNMcl8SuW+cvG0M9fD/bGpcn/fLHdd20Wel5ax3eHmcCp6HKO0q8GPZZm
	UnoM1a6W2mnIr79H0072+F+Qga45WLHLSBzPgQ7VYhb+o91WWSOYH16sA4QKx2lvHv7XRyaqlyG
	VA5FCJNgUMv5+B8QxX
X-Received: by 2002:a05:7301:1f06:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-2e464dacd7cmr6486558eec.8.1776679470195;
        Mon, 20 Apr 2026 03:04:30 -0700 (PDT)
X-Received: by 2002:a05:7301:1f06:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-2e464dacd7cmr6486536eec.8.1776679469653;
        Mon, 20 Apr 2026 03:04:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm13076436eec.24.2026.04.20.03.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:04:29 -0700 (PDT)
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
Subject: [PATCH 0/2] scsi: ufs: dt-bindings: Add compatibles for Nord UFS controller
Date: Mon, 20 Apr 2026 18:04:14 +0800
Message-ID: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfX/8ZurW4X2QYq
 ckO/PfDpFGXMcQAfSQhggkiJMI5VSVYGYQq/g3G0LvJR2Bz69Rps5x/p+WTkpwjg8p5KwSZLXFM
 KEWGfO0c4jByliDIEC+MjfbpDsUkLQPoxyfpxp5BcqsqAEUaOv5izXNkpEMy0AYpPMV/uhe+cBt
 zG6yUv0xOr9teRPedmsDD4cg3mcU0fddBA0B6skTqnOocEDL9UzXqSfROt9ojQkhpN2b0axK8so
 M4YM4X8wAdqFt0SRJvy4U/J++/AgBm24ASJBX4eUpuggMsPkBkmy0Xn5SUo4q9DM77XkcBqc1+u
 UiKoeJhOuA8bnELbsC5aPn/jeVykPymV4SgmMTufZwTOQtklTdNhlyC3ihoS2t1msd7jvY2NOUy
 MPeDWDxQbLsv7jZL8U3phlvuY3H8j9jlchaF+2NEG2h8c/C8+3YgwEeyvnivXC7Ai8nBDesWKBw
 nBH811xVWahdhTfDLeQ==
X-Proofpoint-GUID: loNq-7QXzEYlhKIUnCpsGnfTvrHWBBb7
X-Proofpoint-ORIG-GUID: loNq-7QXzEYlhKIUnCpsGnfTvrHWBBb7
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e5fa2f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=a7bZ31jgoYMsa_LFyGoA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103729-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18D5A429269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series documents the UFS host controller on Qualcomm Nord SoC.

Nord is a Qualcomm SoC series. Its UFS controller has a multi-queue
command (MCQ) register range in addition to the standard one,
both of which are required.

Nord also has an automotive variant, SA8797P, where the platform
firmware implements an SCMI server and manages UFS resources such as
the PHY, clocks, regulators and resets. As a result, SA8797P shares
the minimal OS-visible DT interface of SA8255P and uses it as the
fallback compatible.

Deepti Jaggi (1):
  scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller

Shawn Guo (1):
  scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller

 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml        | 7 +++++--
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml         | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0


