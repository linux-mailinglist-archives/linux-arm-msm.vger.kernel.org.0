Return-Path: <linux-arm-msm+bounces-106638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJVwDdi9/WkAigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7534F5281
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BF93305AF16
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8CC3D3308;
	Fri,  8 May 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxwNF1L3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXvhoaIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59D3CF696
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236864; cv=none; b=CSZldFfF2c58j/raozmyn83QUSFJiX8TzmWajFA9bTbro6Cqpatf5J7HtoOQdSklLUJZkajIKblAXOvVGSz+5iFAlCEZBrHEZbDFRhA+ATPhOCyYFNnSh2WgKB0vUDKMbwSNKwoNJlfve1L7HW7Z1Xs8YsFLjGIfF3BCuDtNkbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236864; c=relaxed/simple;
	bh=mUPnjNuHqO/bEXTBdmLL/Yjo490bvMFC4mPOt6mriPU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NOFYxqeBrERXsxnJMZjq1RDGNRwIkncvN47TgaFDmpiC4ooDV8C06eylaF99sUlT8kMikYJwE2YjScgu3uoEBrRuAzp9/OB4AXjZaKCmG4REMKZmXGODwgDtbuj/eV6cnVQlhYoEukhlBC6YwKsjuwnGyxebimJ5P89EFTZe898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxwNF1L3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXvhoaIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485aEl62199588
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TmQHXBxc7t3ZNmR8HxQMlg
	NPCNXa7NZvV0yAvoaouS4=; b=CxwNF1L3DLP7+ElKmvvLfIOo4Cymuthi5o3UOR
	O64epeK0PeTitXmR3OPX6SJid+PnkMkgoZvl8daq1Wgdf0vTDG/sQRMMrDv5l0fQ
	/GExikl6Uh/v1cPw7wSr/+hTQ3Z+MzQgoITk5RtMqF+37jswu43NAwq2FVERmguw
	r4fLP0BZTrRS5+MSdMGLh41a7CvpLgE/xXaLyn2y4qmT74Poo7Ys73wsDPK9JtYM
	zMERB7AwjaR7MNZuAisFZyCuzxV5w7ysFCoOT2cZKwhzTc+qozJWYwP0EY2q9Pb9
	b6aZIrAGF4obaK+ctQ5Wxt5uacxh9O0vIQjdh72v+/L74+Uw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjwes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:41:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba15e384c7so5776265ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236860; x=1778841660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmQHXBxc7t3ZNmR8HxQMlgNPCNXa7NZvV0yAvoaouS4=;
        b=CXvhoaIM5Lw14vtlqONmd7yoEpkXFrKU9+OZZEUK4RY94nwLMiabrHQp33D/MhQnSp
         ie60HrF5isSdFIQ9XpmBCchQnD+1s5xjKrIh6T2IVb4suyw3rHtmbr5MZ6q7oo5jQrQ1
         0wK6gXsbj2/d7JDzayzugxmXkTtGXbs+HXaHdXMW7lCgZr8SPM7nOGL3pITG5yqoY5lj
         gvt/2vpr2t/whdLhWRIpipT9rwv2yNmc3Pz9h9fBFpVkd50CZsjRXTgkWd4mWg/lR4zq
         Rq6vH0b6YH4ajjvupYnokXsdxaYUHAWxI1amYmLd2czT/A1Bmt7NBP35yIpJKcm2jMbK
         nzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236860; x=1778841660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmQHXBxc7t3ZNmR8HxQMlgNPCNXa7NZvV0yAvoaouS4=;
        b=UNWax4qkP+usRBVftika/la+BjU6b08ZRivE8Kf4Thb8CnCl4kbWrLbIy1xz6Z+bBb
         pzPnSCnRc0MKy4d/bYB9d47rOS447HYNiARr7HthkEyaIXFUxlzV8cKqWyZyTmXsuHiD
         ZHysaI46/LVdIDWHOyV8jSJwIFfgmTDtBJroYNMcDoGoxUsxWtR/qbmatJTJua64qqid
         U61PqsE5jW+YQAkgYf8nlifN1sTi05bIiZAwx+hIFfaarvKIadJJSuxxgwB5x4MqxePw
         YmSiDLsR2tzPbOeuDB31Y5HMaiAJRxG70lJSlcQukjUE32Z3g3NaylE9Ce45mFSLmTEG
         /PPA==
X-Gm-Message-State: AOJu0Yy30zau7dJDR8mtzPmQuMGHw9c1T0YGgBiIegDYNBD//qa2G7ay
	xRhhzI/0tXQDqLiSfPL9KygVVtd2bTPZFEdoUkisthU2vMxOB/oWSe7XJm98zgtgnH6FPoWw2A9
	LefgCqL6a0M+2+U5SZprV30zcVBA4Bcx2asMnhmMcEtb7jcwFnXgyU8kpVN4+W6i46B2I
X-Gm-Gg: Acq92OEWy2pDt3ELuww0+ZU7h/4wT66JChl7YRtmiU1f68X5jywBWEfyRxs8pGVPgY3
	UD5jN9zTFEawCSHJsjBTmCaHE6ANaEB+Kf28HNPlqpmHTT8y3PpSBQ+sBuWJsSs9JOT1IOg1qb0
	2JTzwAlmfaz66BXe2qOlQiXHUvv+nSWnfoix7CxSbEj6U4I3qAt65MQ5Rib02OaB5o0gL2kQSWI
	tvhKfGMsuMtH2py7NbJ8UgMKG3CyVqpoGfjobbhy8u0DL4cvKwo3HdOzxD3lGTgWGED35zC6XWz
	idoZW/z7ZjbkRJfWiJ4N1s7TpfLhqNmk926p3DYFsZVjDq3fi8FbILtE/DNtDX4NxQMmhEVV8EP
	/af69XtqVkd94FqV43SPNimpnbXWgi+2gLhPs/nq8A9eZeHBNaT0=
X-Received: by 2002:a17:903:124f:b0:2b4:5c0d:314b with SMTP id d9443c01a7336-2ba798a8fc5mr122637865ad.38.1778236860348;
        Fri, 08 May 2026 03:41:00 -0700 (PDT)
X-Received: by 2002:a17:903:124f:b0:2b4:5c0d:314b with SMTP id d9443c01a7336-2ba798a8fc5mr122637515ad.38.1778236859868;
        Fri, 08 May 2026 03:40:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:40:59 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add compatible strings for RPM and mailbox devices
 for Shikra
Date: Fri, 08 May 2026 16:10:45 +0530
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK29/WkC/42NQQ6CMBREr0K6tqQUpOrKexjSVPorP1KK/Uowh
 Ltb8QJuJnmTyZuFEUQEYqdsYREmJAxDgnKXsbYzww042sRMClmLqhScOrxHo73B/hpmbQar4+j
 1b0xcWlAODnCsK8eSZIzgcN4OLk3iDukZ4nv7m4pv+7d6KrjgdWGsavcKnFTnQJQ/XqZvg/d5C
 tas6/oB137VxdMAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=1378;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=mUPnjNuHqO/bEXTBdmLL/Yjo490bvMFC4mPOt6mriPU=;
 b=E6v6ihhLYwnYWKUw1zs74xf7voBZbjNZ9eeCunTwHJT4NeDUYPy4tbucGWw5S6MhJtqBg7e+5
 mi8oB3QZNnhA+RPmd359y8n+Ve6kp7TwACSar+PKun/WetleTxP0l8V
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX9EtpZ+bIjDtn
 vkw6fakcq1b+g/zGeLReYbu8riWVRLENZrHfcfZnnsehvw/fzVU+XvkkL3E3MC5SP8jc3Q8cqKq
 j0+DsmccQb1kfyKB9g97e5YgydMxirjiwg2KKBB+N5oQmPfzgWjxMyZZOfnNn2TyThN1AmQoOLZ
 fjhNNwe26kK1QuHFijhfqR/L3Ih8SKtPX01t2JZYc83Jc8lqWef6euXrLOfWKgXaSW+cuZiHQt5
 T3S3G9+W5vEw+qp2hQ6heenrPAfCR/UHa+RHhGwUzNFUfOFTk2/cc+HECD6egtOlGtVGCbMNqtj
 +it5STXTYxkN919JeFAUcmNta4wa0FvUcC0PdlEt/d3LaSZLssg6rDY7oBXKb/69j3r81fybdEU
 5jUDV7sD6JE0TrrOKGJ5P34dk3IUMuJeFcG94nb2aXrD6W/SEAcDMokDWm4d7vzC/5sz8zQGQHR
 7G/Ir38ToBiD8yWmFnQ==
X-Proofpoint-ORIG-GUID: 2PTY_gNHHnyA-8tzNEpBYpC3xidXZ93o
X-Proofpoint-GUID: 2PTY_gNHHnyA-8tzNEpBYpC3xidXZ93o
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdbdbd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JmJi3zLfmrkKxoK4IhAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110
X-Rspamd-Queue-Id: AF7534F5281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106638-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- "qcom,sdm845-apss-shared" compatible is already supported in driver
  and mentioned as fallback in device, so no need to add compatible
  support in driver.
- Link to v2: https://lore.kernel.org/all/20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com 

Changes in v2:
- Require "qcom,shikra-apss-shared" to use "qcom,sdm845-apss-shared" as fallback.
- Link to v1: https://lore.kernel.org/r/20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


