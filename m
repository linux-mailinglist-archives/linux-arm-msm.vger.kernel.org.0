Return-Path: <linux-arm-msm+bounces-91265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFvOD7uHfGmbNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:28:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D230CB959B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A033300BD9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB6326B764;
	Fri, 30 Jan 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLLPsIv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCkI7thf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEB35CBD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768874; cv=none; b=iatKypCedtgh/6T+OiyMGYguYviFDmmZxxU5TDaE5oeT7PY+FDwKthpmEOiuL2e51JjVBmk31/Lk66eeA+Mj7uRqfGxDrBwQj6rOk++pvK6335rDaCp2OLlg6tem+roOR971JcM2B2muicfDBDf55b+KsLnhVacqRioVIJKF2iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768874; c=relaxed/simple;
	bh=zk7RIUdr/qwb9316gUR2rjF4Y+JkM2vUiJ6JkLRmO3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CQo1VbnzRBEWNR8VUTBm+kOkdl2Jj03GDi5YZoMmOtTCBlL1+VltyUHRSrJEa33OJRpZU+LH7p/UNENLygbeF4dEzi29zOtny0jNprm9HLRI3KuYiG90l0rCWO3fLqqlQnkANW8Ey7UOB0plJGYg3PYLpNgEAm0VDhrfDx2glUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLLPsIv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCkI7thf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3Vpvm1488626
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IhJwIyU28umNklL9ib32Dp
	SuQxqoegGVwyZEq5xYgSA=; b=eLLPsIv3TQXYAt+1QAAE7N/vrGpE1sPWQVmRSx
	IINCGdwXZONBsJqqdBAtEFc/n5HijVza3oyjamd/LmKe/lLkoEbwtgmY47N0mDxw
	btppaeRM206VBt6wWcO6YOFBcSjgk4AHYJUBDvUNi5kVv0MUSIlixS42oQ8rW8N+
	ZbljH5eATatqlGcWdPuNEVqc+0F2CjMLmASQ2L/2jWW2He9PBiTVR4oPkjr7S72X
	HA/8xDFEF298Ca6TCydPLvhIw2Orqz8gk0B+iZ6n8fT6CfmdYKZt+7Tw4Gw75VUv
	Ip1zCvZ+hnr8aKdOc9gSi6TwnwZcvY6K1jRDwTmoHcE+dpcg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3ttw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:27:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso4519896a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769768872; x=1770373672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhJwIyU28umNklL9ib32DpSuQxqoegGVwyZEq5xYgSA=;
        b=bCkI7thfYzCiTkvE+PkfkE8GRCd1IXpSoFaKFHSmTTh+XJ0hKnaGLySoCxlbOIKx9D
         G/VyLDXHS8lz8tBw2ufsXVY2IBD3aKWE+4KXr7D10MLiLewCHR16rrHZgbsynaS5q4aA
         DY3GEiIJ5VjJI7oTZW8bmxooAsNufWpdykP/NbqgmqypEyVOpSruTF9sm6oIU86CgoiB
         4LhGz+zwk/JixyL5rLpAsDyRvZEyjzmTCpsVzZGcg5VTdyl/qHKicb5YRt5dYdf4JvYa
         Q4iab6MJrLogk54xgUpBBlkManSMVnirxXtV5DAAHq8qdJtafEXz/8z1qCSB6pf0im/e
         Lb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768872; x=1770373672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhJwIyU28umNklL9ib32DpSuQxqoegGVwyZEq5xYgSA=;
        b=q/v96Uiqy18+WFGL80Hrrclpj81yb1sUzdD7G/AqfeQUOq303+SEvSl+jYYoKgdqa0
         5eX+KoLgfelWTADF60SG7570kA3h73RKSEn2OzaB6xdfLKSmmkUHCsBRsrk8FRVopVul
         xIYNBOtnZtqssoiSDY2Sb5bX9JEfgc4VO7dybXC3YvTZqozkywVw+/rgtGL1Jcjo3iQY
         a6pwBqNkKWNHC1zFKOqAOHWopNH2EINRs+4W/PWlxwi3QSh/kHFJjHpsOVRADxieyOAI
         eWgSN4ocSjX+rKr5fFrSSrSJf4ks67ne57Bb3FKbvGAdv/d83J5j2hDzI3z2JQ8KtIxW
         9dRQ==
X-Gm-Message-State: AOJu0YwItKa21kKBDs1uJQCzjRJQGZsws9O4/uDkcdkvn9OnnhElcFat
	XL/GdFdXGneNeVHAyjQxVD3/fax2MbTlIZw3GBcWejDurw3dfc/wKEIPcRzrjZw4s9udA8Nto7K
	sRJ4jUGpMNPADNHoCl75C38VaNwxQPpQT60KVUKP0kfsO4AZLq4rh9FbV2ZxhJ1PFt1ieLQh8ix
	3p
X-Gm-Gg: AZuq6aL0sTy5IEVySCCnssD0nr74GeYBQkZp3rC0ygRbApU1IxU2FT4XvnDz0Ylem/h
	02zC43oxul2PO2SoNgB/VqyWxXVE4xffHQyJcFHHRR4ukwZDUv1jZDmc/4hsAPgcDw3q7vZ0Li/
	mSStaCpxRSAoblwUnROZMWLy4AWF5+GtHXvVHPgBpJjobUIlVtlMT0g0/xE4jIi6G8VumYhOIIc
	qR7ugzKiTfU0gZzD7VdDVDnWVtHCJkc+3XLq1dNUZQRvHWm1vlvm73wwrCxMf3cdG1wItoz+xLk
	3TSFBc2yEWl0Bv6OOaqEuz2yNXknQ6B7SlsVqDICW76yxnOSpxQVUslCnpisXwLrBqPkFS0jMJH
	7waJFt83KJ2D3G5JkZIeX9V279O4LzQa1nUhgNr6ypD5YnEmU2w==
X-Received: by 2002:a17:903:2f8a:b0:2a2:f0cb:df9e with SMTP id d9443c01a7336-2a8d959686dmr21163745ad.1.1769768872152;
        Fri, 30 Jan 2026 02:27:52 -0800 (PST)
X-Received: by 2002:a17:903:2f8a:b0:2a2:f0cb:df9e with SMTP id d9443c01a7336-2a8d959686dmr21163525ad.1.1769768871637;
        Fri, 30 Jan 2026 02:27:51 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414071sm69884635ad.29.2026.01.30.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:27:51 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Subject: Add LVDS panel for rb3gen2 industrial
 mezzanine
Date: Fri, 30 Jan 2026 15:57:24 +0530
Message-Id: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-0-a98714fa1531@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyHfGkC/6WQzWrDMBCEX8XoXAWtpPqPUHroW5Qc9LNKBLaUS
 LZpE/zulZ1je+tlYYbZ/YZ9kIzJYyZ99SAJF599DEXwl4qYiwpnpN4WTTjjrwDAqbKWDlPHAQz
 VyduScDHRpMUZA6c+2DlPyauBjni/q+BDCbRMWsM6xxpOyuVrQue/durn6akT3uYCn54m+cArB
 ptpDH11fLJZ8xd74ZRRzWqokQvJGvMecz7cZjWYOI6HMt42olYZ6eb4qa+EEbYFaEVZ0x3Kzlr
 BWeO01kbUAmQjpXbCka3bxecppu/9QQvs5f71iwVK4RqVbqVEI9TvwuS0rusP2/rAyZkBAAA=
X-Change-ID: 20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-f804dc09f072
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769768867; l=1170;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=zk7RIUdr/qwb9316gUR2rjF4Y+JkM2vUiJ6JkLRmO3o=;
 b=SBzJe3wKYHkLDwwqCtEJpdZAqfxFaoVNy8Ojj4bgToSnANaokmwQEUv9pWC43cryOGEi++qBY
 WWzex9eiwlZB2UZBHJ7G807S7XFtmVStiDT/ibG3oxO4bbgWsJ+QXRZ
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-GUID: AtvcCL-FTgXXPJSi6Fma0DgvT9TxDrmd
X-Proofpoint-ORIG-GUID: AtvcCL-FTgXXPJSi6Fma0DgvT9TxDrmd
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697c87a9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JNBCm2SvPWjoWrMFowkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NCBTYWx0ZWRfX7OzlfmHhgOAS
 ea/sh+Tv5vi0DhEaBdT20Wnm/E9AHqtF9uIBClGZKyUQPCwyiT3sQm5V4/96NRRSeDJNLs6YaPH
 vSUG26MOBVFEj1XEPWFzN4/aCU8kQnph0iU0x+mtvOAdW9YmZnAGsFDNua/KiwIyjoZQZDefG3H
 JV0Sgs23nXrFyGp0R/vvQoRS+tMz+p1EUQi4oJ+YjOYW+NlTBLBGQQa/ke95atwoQBX6psYJv3K
 TL/Y0WZWP+du/nknIxXwifJ5DxANaq/ju2g/ZGPHToZVAfWxiQBfnpWITajLZdSw1XqRbc08aU6
 G/MQykQzdMNnjac7ofFqhVqgQmvKzanMqitjysW08inDIqEdzwwC7Y40kRpwslrU15ivzucUBkl
 UbaVt2NChOHzBcibtqCOWMpZOVg49R3M82y77rMiw1IX+TxRPm2gOJzdXqtzrwPnKfR3kI4P0+G
 q6uWMkv8KDFLu8WE3wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91265-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkata.botlagunta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D230CB959B
X-Rspamd-Action: no action

Enables LT9211C bridge on rb3gen2 industrial mezzanine for
DSI to LVDS conversion. Add support for LVDS panel DV215FHM-R01.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
Changes in v2:
- Updated defconfig to load lt921l.
- Support for lt9211c LVDS by extending the existing lt9211 driver. Driver change link :
  https://lore.kernel.org/lkml/20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com/.
- Link to v1: https://lore.kernel.org/r/20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com

---
Gopi Botlagunta (2):
      arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for rb3gen2 industrial mezzanine
      arm64: configs: Update defconfig for DSI-LVDS bridge support

 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 2 files changed, 107 insertions(+)
---
base-commit: 3c3d81183061b9e49dd3207fbbbc36314744bf3f
change-id: 20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-f804dc09f072

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>


