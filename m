Return-Path: <linux-arm-msm+bounces-104577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA32CFa37mlfxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:09:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17246BD0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2511300CC24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457A723A9BD;
	Mon, 27 Apr 2026 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g51L4nst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLqng7by"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23E776026
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252176; cv=none; b=R24NLYnUZYuakINTkS8woi2GrFDczBcj1UAFwTXBGzc0tH3/lKGKSCzlifMR0Z8Hj024PYD/z6PkZHxxLmHzlAJ475YLQ1OVNmka1/OhFk4noCGscGpvAUiz7DGmwSRBpbyuYgWJiwDbfV2ZD6jZOkYcFXiVcYBGyrhu/YlA0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252176; c=relaxed/simple;
	bh=fNyV4DTw0MPKBMC+hc2ip1G1nLqAU3cUP0RrWYPknn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6XHAODJ9EFuowJ7jrxaTsj10stgMuRvMmYD/Unq2fUkxLpnqoBmK/oa009UDFFY+PNxkUj/SDrVuCqtor8Yt8d589kuKkF80mJfzpoL8c3KUclgLaPduehUHeXvK955h/+llFo6NJTtEFB49Ay52CHCrbWrK1d+fYMtMRemXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g51L4nst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLqng7by; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q9prwc2257999
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N+7l19QPmgoLLlehiycg8lhjtzp851uBEKd
	JIned3Jw=; b=g51L4nst/P6oMWHlMpY7xf3BFb/CQRESVX0jLaeyA5XLT5Bnzrs
	NBzrfcwPPx7UFaUjrcRZf4psQrxGKanBSzABfId1Ss69o5z6iYrr2WvPuVwuCjZq
	Dg5ErQxQ2mHVnDCET1iz3LGcvniqSEQ+wmucWzdsalFXRYx9D5biEyElOD3TD55Y
	EN1ByFV1CweMNFDCh9FYTXYak5Lkt52yOXQKkZfgO8tp+70zfcmgJh5n49Dh6jvg
	xcHJizImiHUK4ERe6hOYGkFsnl7pObylb6FWjjqeJxKafZcDWxejsGv/gs8CTauq
	6pnUfpYNYw/imzWTQOZaRSG63BRc1UDZY8A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3vnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:09:34 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12dc3d81736so1502965c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252173; x=1777856973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+7l19QPmgoLLlehiycg8lhjtzp851uBEKdJIned3Jw=;
        b=dLqng7by1uKlmCIfdViBivwBnPZWukkG5ZwlBqOsRdEremkmFqKny77WqKy0Wzsw50
         HVEZcJegG+XxE1xndhuW/hfxsI0OHp4BbYUSPzcv0qnmpymJjk6KV/x1U2bSiw2+aZ+m
         u3PyDADVtam0+2qSReSxJtPjqtZpzMh4U7Lz7LIrmbb1rigekQqV8sVV4yUqcd7ydHqF
         XCyPEGz2S+ll1UifkX9pO1BSBTzDdgLzQ4nxOP7eX86IExI8JieN86Fhz4n9Z8vmi1oU
         +jghcYtet4op6Lgq9FNnSxUP3B7fa1yrYAVuC4zOu4kWZ+bgA2v//XsRrV34X1stBp4C
         6Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252173; x=1777856973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+7l19QPmgoLLlehiycg8lhjtzp851uBEKdJIned3Jw=;
        b=CNBtkeElsWwm6O7x9hjzAIYALAmnhw9nYoQJPO0sxBPSvqoH98PaJ2gTIE4oTzr6oE
         +6/uX3lIFyBYdf9BfzkX4Qu6kdH8yGBLBTLrO7yHeb7f/Mm7m4vzXbebKzVpNsUfhwA7
         Qdwo+pm8Zd2fThl7FvTiSX2oqX0LuIddjNtIsRn4MuO8AgtpH81qhUxg57Zj9/wVg1fu
         R7RhdraBErGDQf2Zqol4ECRczPlcpOH7BrsO64WTBNjqzZxU+hPSYspFg6tLLf3e3RCV
         t1ZRAfyvyEtzzGIP9x6l770M6YnM1Bz48JAB78R8Mlp56D3A2sEf1oLHRe4HTQWJEFfL
         Whfg==
X-Forwarded-Encrypted: i=1; AFNElJ8Km/WnvpyLOnBLr7LnlcyN1qCoagf40U0pnaRc/6nwyX1JvWxaE7Ngd5KhEuMcMRnka59tAf9odJyBJjD0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1629rc3onrP0ZwKt0f70iEnGuco9yuoPxebtQ+wNAx4KYJnT
	SdiNRydul63ZpMyJQo13o/eLTdqCUuN7uPHNZl0rNbEQ2bf9LK5d6O3Cd0MEJHBtwrg0I/mcAv2
	eWxcDpdvA99FQuP8qp6ceWUqyY0ibN7n9d8FneMsUXv7fBfOOE0khL5C0gD8DkRRgEQWA
X-Gm-Gg: AeBDietgM7lDQwZQBZDbFX6xiLqDbiwpeZ1kmYV1V7LLOCF8CPHWUKiokl03ijFyGwp
	D8U8vADcNCX2dyPeEdkcBo4oBbDn3y3ddjdo3fPllKVzkqw+0D8eDNzSFVtEWxi5d9GWniAUdP0
	URFQW3d2ElFz7b3cQuSpX2Cb0gKr2txKWFTId3rdhxzPKMBtyv+0ZLhkfQsY6OK574BP2vF/u1l
	89VxRgTBX+p+HNqvIlt8cZFGHpFkW8zCexgAPt6lq6pln9oSyLJ29mSPBgku8gkwMNthQqEIFlK
	8yp1YdDMRJX8PmgTtc//ihG9IPEVw8R6nNXfphYMRQm7vgcI2MwyfEq+Y9ZmCRfbnOmgJFKsD/7
	BXIQju/MfW5xSmX+wmLPKLyUCsUQGGTmDBXs3hpaa+5vWmIl8xzmq8mcO9hAZdKJHsmU0307sDP
	7V0bnnMKj6xNZYrlrj
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3459276c88.31.1777252173035;
        Sun, 26 Apr 2026 18:09:33 -0700 (PDT)
X-Received: by 2002:a05:7022:23a1:b0:12d:ce34:3f97 with SMTP id a92af1059eb24-12dce34406emr3459254c88.31.1777252172397;
        Sun, 26 Apr 2026 18:09:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dcbe079c3sm9502573c88.2.2026.04.26.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:09:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC
Date: Mon, 27 Apr 2026 09:09:22 +0800
Message-ID: <20260427010922.230586-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOSBTYWx0ZWRfXznVNpTQo9+5Q
 JpK6XEC/1XkSw7z/G+3UQDpP9omn0eAa+ekP6pAv0l2JCsZKaeWLinV3589fme9vLTRgzfqMKN+
 pbn3UMHHeR466JDzk5U9QxIph1v+CnI+NASwV2Tpj5WBy5W8ndqJYrzNlgeCLX9u4hBNDKN+SNf
 GoG6/5nWw2PP8PuBB5jITFGKFf6ZMRx57E5m7aZKGHzARU1LvWgTlBhHAZdzyuCqolnqW1Mu/Wg
 EAXjoFZrnpbGIWs786jrveY08pXZcipfbxmyD8IyOqk4Ia6HFTt/xM0QuKvlLzTRdMHCpHSIayO
 Qke6ieGLTdWQZm0eIpN1m6NO0Vqmd5hYYuR1BqOn4d+svy7v8LYObHEKRyDSa+1AMP3yTwgFjFF
 lqSfIQoWolcF3rY2RHPjVDEI2+rnXh5itZmfGKVZ1P5fAPufJY9YZO94qw5zAo7JIrdzWJudWzJ
 zxiP2RBEtdvIxOFW6IA==
X-Proofpoint-ORIG-GUID: T4qEUZIOkd6ZlNWx08JeiC6zeUXTQ05e
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eeb74e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_dvTtxwuY7_ow4vAqu4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: T4qEUZIOkd6ZlNWx08JeiC6zeUXTQ05e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270009
X-Rspamd-Queue-Id: 7B17246BD0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104577-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document Power Domain Controller on Qualcomm Nord SoC which is compatible
with 'qcom,pdc'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b4942881b9c9..07a46c5457a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
+          - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
-- 
2.43.0


