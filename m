Return-Path: <linux-arm-msm+bounces-103648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EACoLtKT5WnqlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:47:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680D42663C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BA25300AB1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4572C37E2FD;
	Mon, 20 Apr 2026 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwqbEApO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diOumwSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88235DA52
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653263; cv=none; b=HPCaREbrIWTj48dIdBxRkvPpkxkPcmphZeYDUEOD/O8rpf5DUy/0R5zQ65xwhHLp2gYrXgZaGwsr+XJIQBPnG+xCW6DDcMCutSjDy70wZ5qpfKVO+JqStYLUV5PAhLLHh8mURMQcQdHfl4zFKV+571i3VsQNduzZpn1nOICONYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653263; c=relaxed/simple;
	bh=Wp3CSi18xegvgEKWF9WH9BY5lqobEMM49cHQeJC+W1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncLIJ8AVo9trvhs4DsLnps5G2s2l8iUC4dAZE/ZQEcSwoF26J3vPVVb06ld7QpZ9W6fZi3YDaTnH8bgE7iNnEOONm3fFkqSOoRSEynMZXc1YtDgHBUV0PyPkQVKSJ7oF0TSRvaO3+Be/H/XyVhy4IgKZe2b8GL3FkyNL4dXRNqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwqbEApO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diOumwSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNUQ1O601266
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nXSJSkc7XgeF7PeZndZjSyhwT9/b3ztRPMA
	uBTEuxX0=; b=dwqbEApOdtcvUhdnQdM4E87BXYdiHtqmS+rcZAXOy2jvEWAQxGo
	vEfW5LQo0cSAZiE4VdITiiedCOE7QKNsv4aBF1BkX+Eptng+if/1R6E7bTaIFk+W
	Eya4s6qke1kUZz4+YISSTCbaII3KoQtT1IZOwgC6W0mKaWstl2vcbPsmWju8VowC
	bAT5ERMynjdBv5PTfh7YhkJ/wAm1mgFFD3NfcbleQ+FcXkaotQETPoCQxV4yv5f+
	Sa4yVZAHIJd3tCeiJEYYgstVDSBnYrEIVKn71OYba7HotVrG2/6Gn+6UOfEO9C+R
	wTd/kf/cobz/6gXcQzOOQCdCL94WxcOn0Zw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261uqag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:47:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2655540eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776653260; x=1777258060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXSJSkc7XgeF7PeZndZjSyhwT9/b3ztRPMAuBTEuxX0=;
        b=diOumwSJhVlHTL7PqGeTKxuva0WJ2FvsdbopYq2raJHU5hCqfvFAMY86KVtLMOwM9Z
         tc0YO3fOV4gCoj5KJCWoIYLeJX6n2FY5u19YXnnRGN+Vr9suSB2PkYJq9DoymqH/yxMA
         Lfcye6DW7uu5L2bPZPHqDCV/fSb1Qbrch8fmPNojaaAFVW1dG91EJv68crbbdGQZeuuu
         Mc7pBCD8LRhQxqCPgd8H2/eyi+vBlDzyiLru7/Hur0IaUSxw3X6Wa0yPvqk/EBlcxnLf
         gyGdcV5DAZ3c71BhAcyMkLm5TZSKJYBKBxUJ3WXVfDWpRx1WSDve6dGJB7kf1Y0ORYIR
         hYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776653260; x=1777258060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXSJSkc7XgeF7PeZndZjSyhwT9/b3ztRPMAuBTEuxX0=;
        b=ZUtW3c+yJTasiBJYRK3mhYLFhwJ0X57OJibEnudKWq5aYvltnEmakr1xwvZcNoWhar
         i62RZc2VTYdcI3N7uJkNZaf8It/XOdqkLuB0ZQ+YkvVRTwz4NENjhxAJ76GBnNV40G/G
         Rw2gS6sNtxOesNyxbMHAYX9Ha7G9dIvKM9GvXr3v1lL1QH2gltFlH14R3pi59AoUfhrA
         1hB+CH0xxhXkbaCM3/bm2/xlEIl1e86PVZ8q1IBPQgo2yk9StdQhPAt7O/UKAX2u8u3r
         Bp6T6R/e1CzL9gfcHoRYoJZ9eg8Q44YPud8Ffg4RHXJ/b1z3KJlLES/ckTtiVtbF30qI
         /s+w==
X-Forwarded-Encrypted: i=1; AFNElJ86x2UVPS3XCUX8oA0WUW7a+RCR5rTNg8+0/Wn5HaWwj9CQPnLHEuOGkedbah+3ad/94ptN6Q1siAmesdGm@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCSzxFfCiz/nkEMjbPnk5K5n1gYWWUhU/eFKraVsRFwM9shYE
	cYRJTykpqGBJJWJNuOAXbmG99K9pBpcChQiax2Iz+ziOLAwhwEKiCKoKbSOXXSGhgdcmcCoDrwJ
	d4pyaKkPfxnkuXRgzU25bp7vwDpBM8MAAQLSx2oSUJXnxAD0BLWwtiBAu/lohhs3B+2o3
X-Gm-Gg: AeBDievroSTkbeuYa422rYIkYSTGC7TcpH9BcCdXYEPqn/riJBVQvRg78YGz3VLVXoM
	c0Ltq+XE9LI1drvZdKqWGTuT0k9z3/boyCwmL1UZGJSRJvdYWiIQVbr7ruqJHCfJH/mRM9W35l2
	OpF7WTXlCEfSeZeTtBB49Bn5OxwJY8BGb7gO/0CXVRF5HDLQcg4VliQerC2vRfdVwfChLyYg0T1
	gJ6xswWt/Gn3iP9iImOcDrfZE0eV0BHINlbVLlBnDydMivuFPRFOuZxDIcAiVcicWSKWXMOtjgR
	Kkm/2JBP+dAhIiW3RO9I2ohZ1nuDxkO4pLpw0JYVxJ2OvITvG88d4UcRBOGK6nOvB/X8/oXifkH
	qoHMWF37hpXfDtPOQ2tQFy/8upruNMmng4ee7C/cdg0JDO8lQ6c34clzzYLz6vUeQ6HHb8q0Hxu
	yJovEoqFtdKbD9l3xH
X-Received: by 2002:a05:7022:6189:b0:12c:44a5:fb51 with SMTP id a92af1059eb24-12c73f74b2fmr5563130c88.9.1776653260386;
        Sun, 19 Apr 2026 19:47:40 -0700 (PDT)
X-Received: by 2002:a05:7022:6189:b0:12c:44a5:fb51 with SMTP id a92af1059eb24-12c73f74b2fmr5563110c88.9.1776653259844;
        Sun, 19 Apr 2026 19:47:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b056fsm16237815eec.29.2026.04.19.19.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:47:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 10:47:33 +0800
Message-ID: <20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNCBTYWx0ZWRfX9Hhoe4HXL3ao
 pAbvx4l5GscVXpz1XA+VvD8PCwdWcLiBnAnh9/JDaIyd6HO5CI5ohAK389epNfXMYhkb6xDloa/
 H0CmTR4TTdc2ILOjmztWtf0pvyJ7pP1T2ZMlubh14C0weEuYpHweQVQ8mtosslcFmcVymc85Bzo
 zeeAgnXRBTDislu2pk49iV9R8lkegv0S4RLN3V3JpTh3K9rNfIUp6JlK5rW8WKR0qhSh0QEkNmv
 +q56KE30JtkMUWfvDdBqhERtdIdrgXTTL4F8E37H+JulSWbetmac/06E3u7D4yr09yG4F1AUSBx
 EW5+ERwD1VX52Jj8ytVaO5DcyUh9zeTrObsZWFIR8Wft7yLHFSS1np3rGKDwax9morBT+2Mm3Lx
 hSfkQlRGRadZFEFn7ReMwt9xZ2P6lEbqpHJcuDMmsH/nG9I+Wbcs6YJ455T+XyKnqT9pIdhCIYJ
 k2XxjGD0KGoZgYdGR7g==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e593cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=el2WdEhFk3zaF3xyUZEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: AdRjtGhpg4iTssueCGxu2nWaiEQuJlXH
X-Proofpoint-GUID: AdRjtGhpg4iTssueCGxu2nWaiEQuJlXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200024
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103648-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1680D42663C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Power Domain Controller of Qualcomm Nord SoC with
a fallback on qcom,pdc.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
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


