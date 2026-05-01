Return-Path: <linux-arm-msm+bounces-105451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFT5G5NT9GmsAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:17:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A044AAEC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68424305DD0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9A83624A4;
	Fri,  1 May 2026 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HShkWgiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ4ALkz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE366364053
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619765; cv=none; b=QuH6Tnonoqa4D/y0mTOp5gnZOT3McQfqtqXd9nXFeu98quCPtwJaJBXgonTcSzZU4UG9pdg+aU0FWm9I0eV+aclcYhTHBiOrbM+b6pCfSso/Pv5SJBGoLPWsF37N11RGRKqAvkWPXYgcgHXBGqi2g7BCQoIzoq321OL6yei3Be0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619765; c=relaxed/simple;
	bh=rC0MP+UDjJ6z4KBZ4VVe+eGGfA/Rj6utO4SFjboOF0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeD2D5WUz+8tRY/+Ows4k2ugP5bxXhntUotiKM3T5eSZwo1LHhykFrhy95rm9jRkeBSqu6uF5P6Xl+La+GN+7+zqeF7GYb9S1rBpJ9sCtTA06oJpjbGksWg+geYNy9N/WLx9JLDnQriFh5PiqkhX1YXO4xRzUBHs8lZ9sEbl3LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HShkWgiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ4ALkz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6416u0mc1953326
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 07:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3h2kXk//bdhSU1iT4/GR4vDmYrOEv2oj5XUR6ycJrE=; b=HShkWgiLvkDx/Dx/
	Vznbxzw91uwk/ppsaH+OjG7P3POVTYSRHNYhCj52vs5n+EFqQsuJZAarMmR8tVSb
	HvIWi5/YL0QLFTxFtJ3RSKTt8QUFf/endXpudGKYkQX5GlSR3LaMJVrMEgb6V7BB
	wIWWKMSoZb+om6ZeDiZaMVFWjomehSTEk9/RsUX5Y2qYTU+LUNIRfQPyma1tNBSc
	qez3O72geHra2gj4ugL9ChfqNeNbpgfmdpNi6IyUbO+YvihChZ0K0LIHoPlqoPX1
	b1DsUBZsntKIQSnheHUfeJGDNA5waSlS3oDQzDeM0zlWzz6aKShKeXrRTkao8zGc
	M02iNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchk9ug3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 07:16:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so2063695a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777619761; x=1778224561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3h2kXk//bdhSU1iT4/GR4vDmYrOEv2oj5XUR6ycJrE=;
        b=jJ4ALkz2150VMglfk9aJCnid5pJilXrmezyTKjV70Swz8tzUWyWUit1zPeUPTmtKyn
         NdUAa4dfEJH7p/DKUSvr04bfa5SQaODrmTy/O8ZlgGaB5lr31mnPfCI+VscVRZTguhyQ
         9t4htsvERimLJcIwU+Zbg/1i+XhiD3TqG36aTbw/ONjxjS4qxLHCl8ZZuTZpkf/CWyrO
         W/4UVUAOLWuvo4sHbrjshPUyQYw1yDUfq4dUH9SFxNcEKpQqZT8K9zFVrCbdPleTcWjD
         AwlsrSDpDVhTOw3rpFTyouEMuQWvtrSEQxZ5gd1JJUegDIqGUy3Xjf6o2VVPNaoK2Z9u
         IGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619761; x=1778224561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/3h2kXk//bdhSU1iT4/GR4vDmYrOEv2oj5XUR6ycJrE=;
        b=Xk/KNP0bUwwUMeHqAzs9IVcvCAmDkUx4831juSSUMVi46uUURSwS9KOZA+sIpWlyRb
         QdR7s6rwsjszRRY05dwVI1+8nRsoZYQuEWBZAqpLQqtWQh4rJsfzf9RgY0MA28XME11h
         XyPFc63dMHpnMCtHj+1tVr571xXOOfQyLSAsUzw+LdDXZUV/Wtaw3tIdmpwGnED9AjBB
         wptU8gH8m6LCDdIOU8w90D6Kw5eMDd9W5tEZubkcEdVnnkj6mJa8oe4itelQDfe0UYBn
         agNx12XUtEWznAT2m1UtfDHON92waiyiGqrrHBMhjOj1L1g5LSzy4Eg7S02+ryRf1IkP
         y6hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y3bL3AJekINHDWt37qCmfUpP92sGbFJKKD2OVJdN0mSlTZlQbeTLr8dU9VOque54HgRXPHuDAESAAk4/L@vger.kernel.org
X-Gm-Message-State: AOJu0YydyJwN/s++vs+imTs1PhdImLNBz3icDggX3NpMTHIUqczBLogN
	UwIfLn4N0Fty62+2NSjvEXuJE/BKEvQomlmPraQq+l2pO1RRrVJEjqB4heKs9kijVj4QzytS3Y6
	PBtgyd9AyHRzKohVmv/MpfX1lhZJcAVN7S088YD8d8PBliSGw+sMqaSBEDfyixWOaZ3WB
X-Gm-Gg: AeBDieuS/ziatM2DvTU0SIs4WqMZDjLM1aTnWuYysw7q9mDvNFfVkLkndP0yZCeuKbn
	Ww9/8zrCkYSaRi7X+jX4OSpvwLoa3WU5G2cO2xLh/isDtQfXHpiLG1yxv7cx1ABtNJVnu07/x+W
	E1jQM15jC7l1G/tiFKdKB2isRKmN7pY7OL/Am55e9MiH3+x9WKubWf9L7rPmkyMykiEzhGxBJRg
	PqyYEd+hXXMtQluExjsDMS6vEI5eWAc99Dwt8wRsHY8Rcx6W+Ic3ujEVNfOpom9rztV9dYBC9Td
	J+ehDc/gKSEphintCJR+Pa3517U8K397BjSH/vAVZuUKRowDVm931PKz0F5C5AfDUdyBkt3mEES
	ulUEjO1Q4s472Qupa33T0sW4ZQmhLhVrDU1VnnVGBHF+Wr6vGcBQdfRm6bClJqGg=
X-Received: by 2002:a17:90b:1c04:b0:35f:b5df:448 with SMTP id 98e67ed59e1d1-364ef650aa5mr2022337a91.24.1777619761225;
        Fri, 01 May 2026 00:16:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1c04:b0:35f:b5df:448 with SMTP id 98e67ed59e1d1-364ef650aa5mr2022296a91.24.1777619760604;
        Fri, 01 May 2026 00:16:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00b094sm1424265a91.9.2026.05.01.00.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:16:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 01 May 2026 12:45:44 +0530
Subject: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ
 Hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
In-Reply-To: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA2NyBTYWx0ZWRfXwZNuonrxh7kn
 rv/wyrWs/dBUJZiFSDdC1k1HDNnKuU28Ihuvi9ACi/Htj+MwXw32e1gS32ihrywtGIql+fMLQOd
 vmrM81Va3kCFhnVL7V5vDvJ9K0l19xktRSfopjIXu7MG2iyGztZcyImFPkWfzAl58vD3jBYoVzF
 8rlGXSlAU31jIGCbiaqGIG1Y6ninadl8kvLlk9PBrHwrmJyOc9c+9H5cVAHXKX3WZmu+7YaVymK
 aQlTPlKOuZpMguI4RUqLOnEPgV128qhA6v5qEpddN/EOlbVObyjoBLnfjP52UQPNCZHgbcHVKew
 ukiUeR8/4mk8UPpF8qPlBqDys+LiTYiSKgoPiAMxKPrqskK/VzWtZFrPI5kQaY8e19P7fzhmAm6
 RflQNu5XaKntycgeU02LsE3Fe+KiU1LZuj11N1H+J4T3Wd4cAw49ThJ9zCSzTHgSGHS7U/uMXGl
 9ypneWRaSfm/UMM0BKQ==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f45332 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pnvWlMMwaXXunzEpw0YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qUz40oPhZK4Wa6JKlrMD3C7DLA1rvz6N
X-Proofpoint-GUID: qUz40oPhZK4Wa6JKlrMD3C7DLA1rvz6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010067
X-Rspamd-Queue-Id: E4A044AAEC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105451-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Introduce
qcom,cpufreq-epss-lite to represent this constrained EPSS variant.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff1727dfe78e77a7f725d1dcab438c3d0..a04f0556dff88615a5b5ee759008c43342f49e11 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -54,6 +54,12 @@ properties:
               - qcom,sm8650-cpufreq-epss
           - const: qcom,cpufreq-epss
 
+      - description: EPSS lite CPUFREQ HW
+        items:
+          - enum:
+              - qcom,shikra-cpufreq-epss-lite
+          - const: qcom,cpufreq-epss-lite
+
   reg:
     minItems: 1
     items:
@@ -144,6 +150,7 @@ allOf:
               - qcom,sc8280xp-cpufreq-epss
               - qcom,sdm670-cpufreq-hw
               - qcom,sdm845-cpufreq-hw
+              - qcom,shikra-cpufreq-epss-lite
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw

-- 
2.34.1


