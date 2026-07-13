Return-Path: <linux-arm-msm+bounces-118807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hHEDL+L8VGrJiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:57:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7374CAC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:57:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Nt8P/dPq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L0JJmx9W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118807-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118807-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D5AE3061633
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1F8319860;
	Mon, 13 Jul 2026 14:54:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993043900F
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954447; cv=none; b=SlYMbIqc91bvDiAj1QddJ68r3/UvX5QhY9PTjBC9COgzuAOfrcQ9z7M94DUYBQUwWsONcr+YcxbWhuBnTLtNYKb1xaZiv+5Jrvj66vZbdlXxKMK7NR+lhZME2JEmeEpClzaieFvk/DPhPtfoWPGbJ52NhEqxi91ZC4nsEpC51zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954447; c=relaxed/simple;
	bh=xDrhf+hYpRj/XsI+nW8X+UBpO4/NfiLKGw6nSH57Ofc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDMPlQ5n7sb65Fo0IYTKoSjd0E2uR9+tRDlX/R10lsR5IGoO+3RwzqYJMsZOW5QLMiJrUGWQ9aCcZM1T9PEJgkBSsg50G5Bwde4Xa9THaPaZ/iyRRFiFVa7PHGawvK1E53vApw8hvayJ9gXbqoH38Gw2BlXxC18cmTiDZiHzRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nt8P/dPq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0JJmx9W; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDw9E1494432
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=; b=Nt8P/dPqInMsrXpi
	dlCDBMJQJzffvCbFXu8HxvCWfhNW7plselH09h1PpRF9ze7K24Nnok8hJOLAC86q
	XJ8ig9cfD9EUAlEDbpNidNqBua279ln77PStvNLQNrJAdOl6dBeCiXd59DJ+LPiX
	c77ipG65tx9+a2lgegLm/CRtblHxV5KK45yb5zUO4t5NngOfghrxluqSO/ZVF4ol
	ctlAXd+oncuPTfLvseM/tQPmljH8c8uh+8Dj4q8MJstnYmCJGFBR1THnZYzByzZ2
	Ihd5JEjkF7jOwehekW6pq3y0M94WIEhczJmDyQPNsl9a1YEGO8k9JPubq0up3zYV
	JSDbRA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm3503-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:03 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455ce0bc783so1143403fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954443; x=1784559243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=;
        b=L0JJmx9WiYFzEepvthHi7yLZZXWtU5dnr1fhhbz64cXwqAA1dmOl0+sJ9KeOHsFBHE
         Fsma3/KYyz3t6iu0vk5lCra7pPhQQ3alvlFSoFnuut9xJDsa1PrlR40+cIfx28Y5KLOL
         9yrcv5POvd96kcKAEqIm/KZiu4i/8Iqe9XSbjekF9WevM1JH9GFt1C79CyBQHrv/qK8N
         HJN5GGvvshFXJhJd4rXItnzhMSEsZrBA0Ixdomy8JmQD255oxME0FiLeWW7hyCWsfhND
         ncH2RiVdF3JcB2s0rfEeJ9zmY+apsLCLQaamoTNuxjZFYUq1MFSWAFZap7GOoDINp1z4
         +EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954443; x=1784559243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=;
        b=X4pL6N/ccEKTfyIReKiKPjzAS20rjd3er6No8i5ixcANIXxvqLEQdTYMHV1aNwaQMF
         gLR1Zs4w+8M6XPF7yMU7Wpkw5l2bjh31Kb5wnJAvcX646mxIiG7VrZtV6cuG3yCD6lxP
         ShAZZLhvv2fmfxNz6jKvLoBIzgNoiMxitD87V8xnwWR5hQcfASPJ8MXuUr37ktdzTZG3
         1xe6IdYYm8CQSPzlaDQwxnW6a2HT9QbtVwa/1x+SRRwvlbGUZ4mrOTTFAYQXg7/8Xn2u
         Ix6ENEx8DU/cl8T9qM69toWLnmFhMu4WXkbBgf9nTSpA1i4MDBo3M3fTBTphEBTQuISo
         aciw==
X-Forwarded-Encrypted: i=1; AFNElJ91p0EO3QH535jYyD1MK4fATtMEZHe/z7EZZhxUcX7tbG/gCowYYvvdsmpzmbuF1rW4jvhHm+YTEMkPZgyf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUloqQ758K6bX1ix2YVqhjjGV8qrnBuI1D4DrC3NPMB6xFKsu
	Z5GyP6ekc3uPqFuq+WsXGxKYGufQa1kIeWClGnkcYfX5SnmUA04/ew3CnSFN+2qRhZ7HeYLNpnj
	6j2gLh1baAKLrpq6RiBgsgUkF+nlSkyjfxXVkcOAjQEbLGsJL6ehncXTcMddgfeAfazbX
X-Gm-Gg: AfdE7clnIPtAIRzGVCyxM1u3gA8CasI8Mx18ps1do8e6tl/BemrDivMZMGf/P8VMeUd
	LnT2/IeJWs8/NvvDrDW9f8iVqXbeoveWgB2jIVGahJC1aT+69ioENtshhcerLxHthzSyZhKFwF5
	nJOnq63pI5XeYKqdOSzLSQzKOtqqyUhHyO2JbCVqdbH9256HvSVvbVIe9t3wkJA5IGIArhl5jv0
	jMuh+Ed0iVeyFkoWCz2vQX0iRnOvGBeBL4zGGv8LkGI2HBzRrlNGUHzXRhssh9BJg3ljBWEqwKd
	kpErlJ7O+UDs6Us9FhhYHHij/eLrNAkI6X6vAjAeptD5BlWui5anobYSf/YB4tD/U0qfjoXmRzT
	PMuii0Sd2lqFWXmFNLuI9ZViRB/y5DrdT0hg=
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id 006d021491bc7-6a39a5c80camr3402663eaf.20.1783954442869;
        Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id 006d021491bc7-6a39a5c80camr3402630eaf.20.1783954442465;
        Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:39 +0530
Subject: [PATCH v7 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: VCScUHLMAWlkpma2JTwJZ_9ClIxLXC3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX0xNd3dcmoUbW
 NLYLFxJr1776oVKDuEZLaTP1Lco3+aQcv+y3nrEWSuXiVhf0wIrnLf4f6lESFHHqi9LzI1mRAFn
 kf6GBcyi221qX3Sj2pmFmwLvm0jqAy1NyiJFNuJmg1WntKMr3geLvZN+NG6PWAVc+nIYtGkwzm0
 4mkjvcrh2u62lXcnK/qimI5Gvx1ZHOOAFNM6tjmsSgnba2fLHS6FHx6i96UwPai5ZgMEPmcPy5t
 OShjNN+mmcjLxriP2T2uejLs3bm1UUJ285/iKA5UMyxnjTDdimss7P2eqovKqZ6uUSUXAcSOsm1
 x7paCFlBe6UDznpwbtrOWttIRAZiSKcpaJ8RdTfZRP16oZCxzqSyYmQvDtlWlHiZqJx8qe4GnRg
 WX2hsy/twMyA81rhWec3Q4ZDJhHTdBhRDrkMuf55hDvTXFsFuWlWoHpynbqbZyvSA9Q0Uditt/g
 +5InDuAprwy4TS5Rntw==
X-Proofpoint-GUID: VCScUHLMAWlkpma2JTwJZ_9ClIxLXC3S
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54fc0b cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXyIKAcqHqbK7O
 /iCnkGqGhLxd5SqERy5uMAF1NigH8JABJEDSZgNjKpTjS+Fk1RHPNqaS7sY70q1+/mQbc+eV/jg
 tatNkRUHz4OuzHBcYJbRaSsUvR2Z770=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DF7374CAC2

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1b98e60dba27093737ec84b66a899..2295e7627ec9feb6a67f3ca952e6192a31cce593 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,9 +25,21 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -37,12 +49,19 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1


