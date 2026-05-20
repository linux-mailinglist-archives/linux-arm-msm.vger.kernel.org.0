Return-Path: <linux-arm-msm+bounces-108660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEfjE+iCDWrUyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:46:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A597B58B053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D1F309C26E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974E23B3890;
	Wed, 20 May 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+YV0UwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLcp36Da"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94FB3C9EEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269956; cv=none; b=XtAGjC2KPm9Y9MnZkdYNMSDNSsC6CqzXmCCEPqSLWJOL5t/8INUhhA297fhUcVwRaSPrj0AXe+/BbiHobPID57w8DYAvg/+RqQ8SYYbhADXAUAZVH+iPdKqWkGOYwZsr9hYwHivG7kH+mB6d35a+DuflnPmoU7xlKE36u9rVAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269956; c=relaxed/simple;
	bh=1ROATfcFnGfXhhsL0vtkdzZWxKejY13e1mc5l/KMd/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LjrbedazHseHWeH0dEWOL/xVAk67cgdBiH5DHC26wBfdKAe6IitDY8NtVnO55ef1mZgY+9mWl/4WPuk4eGjsLKs19Rm9Kb/PN5eujAQUvnBzEphEnBlQ/NzXao36fTv4NfcH93gV9YcwChWi/+zkCKjl8jlzOxxtDArdPrVbb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+YV0UwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLcp36Da; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7EOZW341538
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3
	lb4bNpyI=; b=T+YV0UwHvsJoEkGr3AJpgncHysLAS4mC4GpJrz72retPH225pcq
	G7vDmRwN/T67MZumvkR0aoRGvydBaQ5YojOWHTwvVxWUvlja6m0/hu7T13Y1mTRY
	oijcT8ozS7mNRGPu1HplHRPJnwfouus0rh6T7K3itC2l06vPbeinIBpi5yyl804U
	fpCevBPLOneNPb+dHXdEwnmsLIAMuulSEF2TuwfFvHjDtwYQmi89u1DDTcxKeHuv
	2KDua6YeHv9Jqq0J8l4bci4vhFHf05iTviBhixgBgAV5I+n2BcwadHxGJIGQAPWI
	ebI5WlaZwlB+5DqK+wAjZTDffPgET6ZW3fg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc2fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7aba0af02so45090745ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269949; x=1779874749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3lb4bNpyI=;
        b=WLcp36DabVpjvAEIRjz0iMTE9jOmic6LLh8dg6acY8K1L585pFoE/RutL9wXgOUX6M
         0earm7Yd+NhJ8SrGS+eb+BMKnVajFiKoJXXhRpRI/rCVghGx2jpl7lLJtRqDOPql6BAz
         XD+BGUG3dWiDSONXhcyls+qIJJ7YX3Ph0b/B5f5Y+2I9LtG0EUG3CaAaWWvp6xDn8rkb
         ni+wnHaLKVMxLZc8b/TU66LkNwpNinYUrqIbiGLThV/a11KLSIZHjB81jsAlF/g0V3vB
         taiSUMdEmGE/smVGLtwKFRg1ejGQ258Gbnsg2Sk3YIRXpn/S0z9SCaU38dbWZdcOQvjr
         NaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269949; x=1779874749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3lb4bNpyI=;
        b=dug0K+YUKdxTmSb6+pSrBeFA1fGvBT4lYXr2KFl+7C0DKx/NU2w/yIpMA2/k2KSWgv
         e5ZgyEtlPfhSre492CUOeDIJbt3Q1Qgg/tgok4foO8aizQM0EoLTmN84jxnvodhuz51T
         py9ZR3K6oMz1YqpBmIvAuFXySE05EOWT21PUrWyv9uy9c7sDOGv4gCnF5ziNw3GjSaTo
         j+IrW7Ltint/Q22EsUxaLpuQwNcWxdBsptiU5f+YZUEp+/Z3RODSI+0aHBrtQ9K/xnZA
         /dIFTdQOAJ5B9ao6XWO+5rSGQT/+v/aXCEv0qWLzEQ2BFEdrsmE8+n+DM3A76yMVHvqw
         S0rA==
X-Forwarded-Encrypted: i=1; AFNElJ8PYmGzDupwuKMw6MduhRbe8ee5UExAhap0DLnKLhlxLZas5LbbrHILpVLCF4ZRh2rkDOnZQApbIIu7p3WD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7UcgwimfGcy209L44a8jsN64Q1OP/gzp8OQPJcQHa/8kFu3+
	x+akrOZdx8CxvU1a7UDYOad+s8mSM2iSDv6t3guVMs0U74VSzfM2S8OKD1/YTo64gIUXztzABSW
	lMZtdSj+Rn+9qIVv7KH5BYRuu2+hXZrUDoGUNa8LZxuMxCIq9dmj0dWra3bgSEfPwDUwm
X-Gm-Gg: Acq92OErkaeMcIYXHqxp8s2tQxwdm++DUAEKKBmQPVAh10U3Qs9nyvBGbbBSt+q8VQf
	1Uk+CAd5jQtF/MDBkQoM7hOQrGXejaIm+Y88q7wNH0f/MxYnF66l6zRV0jf+rrMQ6Wb9TQKO3GB
	qb08bDhM4D4ZikP38DkoCsmEJ/9NcxipFwyNHubuvSUPheZhFex2UFTzkRZot4WgQyeSYcWFJH2
	LW3cNDd0VDCnZEU9xDuoRZLM5ciMT6x3S+GEATnG1CCHOjU+Yggsa4/0zzF2+mJ5wxrj1SqORpV
	CwF3F3ohWwThcKWF5MHcFEAyAg/jLt+brab3SPBeXHo/TH5YKcuA/EwBsh2YrYSVrBdoeNyNk41
	bGhSKwRB6JPPcc52ngyBN5+myvK22vldxUGC87W2RCYzpefEtGg==
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr258310185ad.27.1779269949191;
        Wed, 20 May 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr258309785ad.27.1779269948744;
        Wed, 20 May 2026 02:39:08 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:08 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add Cypress CYPD6129 UCSI support for monza SOM USB0 DRD
Date: Wed, 20 May 2026 15:07:31 +0530
Message-ID: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ldhNyUHDQJWsWxCH4H8YobdzGM3qpiyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MSBTYWx0ZWRfXzGgfd0ApuPaO
 EScRdnOZizea2Y/agM4OdsSngXL/GuY9ufO4tOCeZFzMzxYGcPEOQpx1LceDoWsUAykJhBuzDW/
 iFIuBYr+CqHnbyK1JF3hpfL9VWMeyYZ6DVLdFUTKZVN1LPL2bOsU9vUyxuXsMSOyvbdg4/XZR3S
 +xUAv4DWWdOAC9Dw7u+JPMbBpmxsUuATdNZTwguxDZ0VZkYGsF9+Js8Uop0Mv4sTkj5PHzdss5b
 +DL/trWpbGUUe2U2HWycxcbSLTwuA88KmNCAbarNX2rmGl27OaJZLkvRPZKX3H1Y9B24gPbd4Z1
 Crj1963RT2GzBGFUUJTRQpYXZ424VKMeBo0haYM4GUq8BrBfE/+l8ntLCYOnwpWtdpqUtwXxnal
 7A/RU3nUodiSd/tPHvzh7Y27Ux+fJAS/UYU5Je1X93KKXYI+YkOHnhppunbE4wrEnnXMWz+uEQk
 /8Y7vsgosLeOQ9MjEqg==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d813e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=C9H03ch1PF7tVjC8yJMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ldhNyUHDQJWsWxCH4H8YobdzGM3qpiyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200091
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108660-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A597B58B053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series adds support for the Cypress/Infineon CYPD6129 UCSI controller,
used on the monza SOM platform for USB0 dual-role operation.

The series consists of:
  1. A dt-binding update to document the CYPD6129 compatible string for the
     existing CCGx binding.
  2. A driver update to bind the UCSI CCG driver to CYPD6129.
  3. A board DTS update to enable USB0 DRD mode on monza SOM using the
     CYPD6129 controller over I2C12.

This enables the USB-C controller, connector, interrupt routing, and the
USB2/USB3 endpoints required for DRD operation on the platform.

Akash Kumar (3):
  dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI controller compatible
  usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
  arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD mode

 .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  1 +
 3 files changed, 113 insertions(+), 18 deletions(-)

-- 
2.43.0

Thanks,
Akash Kumar

