Return-Path: <linux-arm-msm+bounces-101622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPH1N/CRz2lqxQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 12:09:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C23932CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 12:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F224A302DE19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0583C38AC86;
	Fri,  3 Apr 2026 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHEbGbok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ce+nMIbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE06382F0D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210887; cv=none; b=FavydcamoAQ6QnFAOYnb2cwvX9yaEHLHT7K7/a4/4HMkz+58uP1DQacR1X3CBmpL9qEEJN16P6e1+FbUNPpEEHwzaqLAz9bGsg1QBUR2HR1bJXmbxhE9zAxjDtEjw9h6vXbgHkOWMEaWOGdNHBTUyXOLsYoWLhBfSsrlJbY9xHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210887; c=relaxed/simple;
	bh=5i2dlGektZ2bVp6geGN8HMb/Tbt8VlifUxmoU67T1Ps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kKk/rxlQjN0CNwLwaxH/iQtJTYhQ5u2/i3JQwkbbCXcfj0rviBbxuFrv62mRQNcwHbSVWR3VrCLBW2BHtpvt2M3VEEXoXWV35Lz1rgImeNnSCpANIhLmxqoLQd7Gcha/CJ+DqezpbuS4UwsHqCEsUoghN2U2J0ylN8I4s6vkp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHEbGbok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ce+nMIbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6333C5OE982316
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 10:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PT5gBl+sSn8JSo9OxtRaky
	+Wb1TH/j0b0IlB8lv5iXc=; b=MHEbGbokjfxo6rDJytufGW7W1ETBD2oJ/xoo/q
	5lg5h1BpgKISf6FLgTrQrPDcVKQEDowulRXVZ4o1Kkus144y7o8swFZ2StGH9gD+
	Gp2AWyeiL7AtTbysHFX6+YLpG+W8rogtYNlz6A+XrIctzLuCT5gXDyhuePZR9j/9
	RL2r7Hv+YkB7yyKTyM87GzKk5I0Ntjj/MKN6lFjLacwIRFDrN5JOlVlaRsmW/D6E
	I/vxmH5cPUvBlZgdqxuS8Fk4jiXAYcCE+123750CU2YHePDeImM7vbTy05EPPNcQ
	q7/elyQqcJW1m4tHhz5f09bdqCWB60cp3A67WfWgTbwgj7XQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupu5cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:08:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so2120711a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210882; x=1775815682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PT5gBl+sSn8JSo9OxtRaky+Wb1TH/j0b0IlB8lv5iXc=;
        b=Ce+nMIbPPLn3SSG7ArfykSswbqs9un/0KX20PkCWXAi/XfGCWnU2IlQUTbN1VwMF1E
         9WbHjm4r55F9ZEBGXx5g/lpuq08wSpDV1oVLl9ovzMoACk5tEeJD23LdaerXeAG1weMe
         XUxY5bGpNKFMunREM2KiOUyH09a1AyZU5uvGizTgqvGUMqrT2MboeFjiyHc/c/wbUgOF
         2YMuqI9IVT5PkvDWyWTvqBng2o0dNJ63cSgbsQTpWmq7lVr61XsAeP3pxnvUJ/4ckVwX
         PAfIOTIQ9goJSv+m+jwqo4F0yGgxX4J/g51HkvG41W4djMExScXmdmNzUf1c0Ibp/e9F
         XMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210882; x=1775815682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT5gBl+sSn8JSo9OxtRaky+Wb1TH/j0b0IlB8lv5iXc=;
        b=Q5fkzFU7kRn7IuFE3ANgRnnIMfqEB0G37FgkAL8Y+UH/EQmNamBRgSDSMYraQplcAd
         fiiVd2uzx9FGrwIlMKCDXaPwfH8lrKvg9HsPPZ/bJ4XdisFXSfG4hIrpzFd7yg632VyV
         ECA88ITooJSln6f7YyTMW9D7bHxSF65Tzd45ksIHnNDJmOxb8RKY1EPjDhdVQWCer9PI
         noyiBI1vxBugVqMRjArizk1SbCRZiBVpXs5SK46X/6osjAAnrxzjjOfGZRK+b/g3gycx
         3cxfp568n0Uuc7CXpHD9YDb6YozaZ4SR0hSkUcfF+M+DBI2CwPPbaiKhLWdF+4U4zt2j
         Vgww==
X-Gm-Message-State: AOJu0Yy0JE0v04k+P9oPMdhmMxJ45UGafXWDSkZxwOogar6L29fUKrDf
	HCSA8bqUQ+TNgUefrl/wEjNEhEH2WJ2R/qm83yDZyVAdlitBNQs/vD9z8fM91bRgRC0taCwqtOt
	0xt57sQ3HXMzhSfLYXUt/gD1fhtopC1AX3+yffHnqF+wQBIQkt9K+1YutPtOziwrB3ZdtaGWYHE
	et
X-Gm-Gg: AeBDiesxgKrYzj9eyhhpw/fI6aDX6WGkMXRqnXsduA1XaGSi+YCPKELxL6/mXG5jv48
	i6Tnh33b4W16+SZ43N5cRXEyL3CkcIQOHjO0sX1vO0SxxtEqwPw4S7b8cUGJgW9zFswej+CmAqI
	e9QtlaxiBRy7vOe5ARngu+5/Ug0GMEP9B6lMdcJCrQheUIQelZffG0n6Ib2UWmeWYDhCFtnmXxA
	xA58SXz8ooy/R7nj/Hy7WhEXSdQDRlZFQpzQF66TeBA3dQDgNENKd4T8j/k+Ru2PpiNQoWPzYXC
	N5vbqy8Qj8LOiTcWTAzSmhDOmKwDZLtRqkJwtEMCRB1Ik+gIGQRc5lr7G6cRv+NcikMSiukXr50
	KXbapyGMRLD1EriW7xb3wWhri+gABj95QQ9irj5CwbPoYWwHt7CJdCZw=
X-Received: by 2002:a17:90b:3143:b0:359:8eaa:7f42 with SMTP id 98e67ed59e1d1-35de696f02dmr2163418a91.18.1775210881809;
        Fri, 03 Apr 2026 03:08:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:359:8eaa:7f42 with SMTP id 98e67ed59e1d1-35de696f02dmr2163390a91.18.1775210881349;
        Fri, 03 Apr 2026 03:08:01 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm13497522a91.5.2026.04.03.03.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:08:00 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Enable secondary USB controller in host mode
Date: Fri,  3 Apr 2026 15:37:51 +0530
Message-Id: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OSBTYWx0ZWRfX5UgTARrJRA+9
 I+F9fx6S0aWv8IXEOlqeR3AlemgRNKkc+Iwty8Zs4mYzfnPaL1M8u1L0rX6byJjJ7Mx/RuKvnzm
 mNhO76LxITMtKym0SvFm4xCREis9Uw0R2K+xdlWljIfsrx9olzZhUnv51GB1aeyiK34CnZh3lHG
 0+HBTUNoODF8sga0fBx/EDpKSQJM98CTrZNYF5TegDGhylRnDFwaQ3pg9vUX2Wr5bM4mdr7/Opt
 AUxToMteTinFpzrdwFYumTm2Tbo4FF/XsUN7zGdraKulXLEkbvJrbz/neKtdBzy3wOSaG1hfayN
 Jq4NiJM2+CqvFUkVbIjVsdqMVcZ1ipnqBa/3z5c/w6jOtQSVSkkvsrs1TKGdqu1/19CWkH2l36F
 wO3wJwBDTY439NFW3LD7VVrsZURxLZwOu7SfAuFNBYdHt9wY8Em/MdptSTjpacLVR9avM4oJBNA
 2Wrgst02doQXOkd3+vg==
X-Proofpoint-ORIG-GUID: O6_ziss8R2qcf3BgXfKdHT-G-zAZAgcX
X-Proofpoint-GUID: O6_ziss8R2qcf3BgXfKdHT-G-zAZAgcX
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cf9182 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaSnYlJwPn2ZfU4Ri74A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030089
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101622-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A6C23932CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable secondary USB controller in host mode.

Changes in v7:
Split Driver and DT patch for USB1 controller and USB1 HUB support

Changes in v6:
- Removed vdd12-supply property status for all hubs.
- Added connections between genesys hub, HD3 port controller and type-C
  connector as follows.

GL3590 USB     HD3SS3220 Type‑C  USB TYPE‑C
   HUB         Port Controller   Connector


HS HUB                           HS con

 |------------------------------------|

SS HUB          HD3-out          SBU con

 |--------------------|

                HD3-in           SS con
                |---------------------|

Changes in v5:
Updated comment description in DT.
Updated vdd-supply status for other hubs in bindings.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v6:
https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com/

Link to v5:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Link to v4:
https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/


Swati Agarwal (2):
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 214 +++++++++++++++++++++++-
 1 file changed, 210 insertions(+), 4 deletions(-)

-- 
2.34.1


