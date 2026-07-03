Return-Path: <linux-arm-msm+bounces-116370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SF+RKl/nR2qDhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:46:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C036704655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z21KsOM6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fOYX1F4p;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116370-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116370-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BDB7300DD78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 16:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7D730214B;
	Fri,  3 Jul 2026 16:45:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FDD30ACEE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 16:45:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097109; cv=none; b=FnUKYmd77g5V/d8mYWv1lXLRCqJvjmspHDkeL6S7cGcgIyjz56pzjV4zrPglSzfp5dO96FEE0E6FFKtMd6hzVuprjpceNPCOv0f/d5KYIFMfljKRODu3m6PKACg6hY3tO4PAMNRBOrM6CuywPLZ3wfwjfwmmZdEQk6RWMUt6c+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097109; c=relaxed/simple;
	bh=CE/2Xbr/58pDQOZwnTM7GgYIfqAWeapQQX6dohOF0gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbPbJezexoV56DkDQgu1uzst3zVADr1muTd30oK3FJYDDxuIwJDop2rIoHBs2+mENpcsZN+ia5HmfkcxM33omolHCllT0KZ1Pw2rm3TJPJkzb8ofYWHwjwPN/TDgh3nNgo71FhM+VJJlXuxvygnzJIwFaFcHoFbrS1OlJqsRQjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z21KsOM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOYX1F4p; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663GJH0E492638
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 16:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CpU4+7kzlYuQ4cqm7uNACwpMCWQHEV4HkGa
	qgs7PwJQ=; b=Z21KsOM6CG2OIXQAqmkuIquiDaA9CjYp5mn24c0/PogwB0a7MOw
	yqsiTRBJq6NC5jEcQ2ACfsHX9E3rjpDec61NcBW5q9Oc0NoKHIyndIWjrPttAO+N
	O6v0CiX61sPWfpu7Q8fwkSzacv/Wtw6nhVxMcqesoN+oDlx0ixY3fnXF9WhHf5EY
	DDuxDfF0ea9ahPQZd7pVwjtx6Tpq3H21NXf2vTLfGC6RC4VlK1Hoa7BghEgRC/pg
	jcV9WCh7i+7KjFVJ4Cnqc/yzXDT+Sv1A4klh7x8mvQ5BlEfww04LyJ6gvaw7OFOz
	h/KzjMoi81JJccoFMNrZAQa7BVoFVXpllvA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkgr7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:45:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847e32ef4caso1224039b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783097106; x=1783701906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CpU4+7kzlYuQ4cqm7uNACwpMCWQHEV4HkGaqgs7PwJQ=;
        b=fOYX1F4prdjhH/+tA3VURnLjGIJh72XtcqYffh4CTHg2mpFIfYrOYeb+U4IErlf5QE
         g1z+TGy788qg020m0jY6m7DdNC06MHOhcxH3nb+NKyzSv76u33ctJe2aEu38tItkHWVi
         Oy9kamZ1LFcJZkdGXkI45EeBm7QC8DlSAOAb4MVbGgM/IUxl+TvM0QhHnCbcdcAfOj5+
         OHLWk+Qdi1Ol/DH847TVRJO07zaL0rRBU/CTb9P8K1IQJdmxSSoA2np9CNKHW05SsQmK
         5eLrZPljfj7G5b5deVoDeEFHTq5Rd4l0Xu5IfR7IkTylrL61U45YAvOifewwQdAH+QsE
         Z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783097106; x=1783701906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpU4+7kzlYuQ4cqm7uNACwpMCWQHEV4HkGaqgs7PwJQ=;
        b=AMy5vuOH7oM5QhD3RV0yfdc896okyc5KYlq+HLkkLDwDK+0IJoHvwWoFrwncmiFo15
         MVjng4Xb+Q4z8zOU4PzQPdTpdqGHmaa16s12epFLuG1nzwwPQ/Nkn1br9J2yQ/ubD6so
         qnJvOPXjx9FseFZ+YH13IViFnwflTUz+gNqmB9sq+4vEiRJrPICwLyjKXXkryvCZ/I0o
         Wjg/cPra7cjRoDUvtJ8mXkHY38arCayMaS0CqQ+kT4OE5XDbqUbheEB8eJ01ZKf/T9I7
         34VBi50qAAkNs/tDjj+xUtnxvUUOS4rzwqlyLqe89EuVtsh3JurzNqfjNMDEFhtsw3j0
         0zeA==
X-Gm-Message-State: AOJu0YxhxXWAcNmLJKpZOEzi0EH9HxA5HLikSILQBeUayg//pL2yf7zz
	y1+cKDEV6knUoMN9J/jKWBM3xizvq0/NTwyWDSNgLQRqDQqBqt14KIXpA17xF1AbrvKO/7h+vsI
	t5+DznMVrGQCrXR3Gt/S3SVBiylLEA6Q5iPVAIasczcLVJJ8Xyh833LQH1dKGsiBNdF9h
X-Gm-Gg: AfdE7ck7rSdBd9bRCrE6VjsNOPBoqJq/5N5i77Nl7BVPLa2MbRO9bZ8C4vuxzvrb/7O
	g2qnKLBf6bBGtyq97pUpqwNn8sezcYzpVc1jMkkvAumNWcU0of+6j7fBaB1Ckifj4vo554c2JX3
	5NCE/i+s9z0G3Rp0tvHNTgc43NEzVFoGfnD1cPiQnzwpisdfhIF8VkAypdNehfv3h2cjSCBd1vY
	Uu+hikwf47yPMcPirMV5tQmaIIvjNXhpWFjgVA8DkHsCxIBJTkSdJFkt0x9PRrTIKbMHB+w6iI4
	73xULr9KcKWsfd4bqMUYSueRwdJ97xtSZoMomKkyjTfRamTDrSuKgDzb/UmQlMMq/Acer2vDZNY
	Iyg9cipGdTR108+18AILEgbArPf6xRZGI1zhQNg==
X-Received: by 2002:a05:6300:2203:b0:3bf:d1f9:b1db with SMTP id adf61e73a8af0-3c03e4f61bdmr177940637.52.1783097106300;
        Fri, 03 Jul 2026 09:45:06 -0700 (PDT)
X-Received: by 2002:a05:6300:2203:b0:3bf:d1f9:b1db with SMTP id adf61e73a8af0-3c03e4f61bdmr177899637.52.1783097105665;
        Fri, 03 Jul 2026 09:45:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm3908984eec.24.2026.07.03.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:45:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Misc. SCM driver fixes
Date: Fri,  3 Jul 2026 22:14:54 +0530
Message-ID: <20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfX/UWnwj/JM4uQ
 iU+Jehru/Jl6RgGPjjAS0lpR95szK514gTjbPkFrZY6Kq4I6UxC7T8VXigvkeC5RT5Aj+Qp8XpY
 rOlIP4gkvxVNdKdRLU5YCEShI7veH6Ev1v0D2K1LXr1U7hQ7m76sCplq4msX/pxziNuFcB4qWU2
 pR9yaTwY6QxQuxlBfVTcB4ubKQonqqylU6TXSj7loPlOrJR8jhUTfXnj3H+SJiJZhw0JImAMzWh
 nkvXuMbg7lB5paxTX83S3lZ80gv37vupxckn/ws2Z8EAcVtyx+rzBj5gxb2jGjzuK3Kpt8EUNq8
 EMFAV3H8o0DmD56cIg/kwQxUPoPBwFgKCP8o8msFpW84XWfkfW4NYkFN07eyjDfcJc6kHVPjU6s
 SlOhSL4QjA4h2c/wkEQlatXRNxST3Wl/C1HEyEoyhAve4HaxgtymP+ew+qZkNO8Mh9usJot4tXE
 ZQ3elg+8vdJoya6BvNg==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47e713 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qi0AG0XSDalV9LXtG3YA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7S-jz9mr2NYDM3QkFvSo4RrIfWKcG6vz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfX3/DGEtEKAHcD
 ATsgTWTNkAHQmbEsPXBanqcNW1wmapaaYhnfMqzfbYLaUQ99289AYUnKkrOomwy+cyjTtjEJykQ
 2uoskgCAuGO3AdwrASr4oGx9L+ZoFU8=
X-Proofpoint-GUID: 7S-jz9mr2NYDM3QkFvSo4RrIfWKcG6vz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116370-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C036704655

Some of the existing issue reported by Sasiko mentioned here

https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/

https://lore.kernel.org/all/20260624192418.92B761F000E9@smtp.kernel.org/

and the series is about addressing them.


Changes in v3: https://lore.kernel.org/lkml/20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com/
 - Added R-b tag.
 - Address review comment on ret = dev_err_probe(..);
 - will follow up devm_of_reserved_mem_device_init_by_idx()
    as a separate series.

Changes in v2: https://lore.kernel.org/lkml/20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com/
 - Separated the fixes(2/3, 3/3) as per review.
 - Added 1/3 as new patch.

Mukesh Ojha (3):
  firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm
    is published
  firmware: qcom: scm: Fix reserved memory cleanup on probe failure
  firmware: qcom: scm: Fix tzmem state on probe retry

 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 42 ++++++++++++++++------------
 drivers/firmware/qcom/qcom_scm.h     |  2 +-
 drivers/firmware/qcom/qcom_tzmem.c   | 13 ++++++---
 4 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.53.0


