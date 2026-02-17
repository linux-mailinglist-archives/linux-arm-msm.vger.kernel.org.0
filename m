Return-Path: <linux-arm-msm+bounces-93173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK3EGupmlGkpDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:02:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8B14C483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 499793024B13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15F23590AC;
	Tue, 17 Feb 2026 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+NCCHbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUVvn4ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712D358D37
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333259; cv=none; b=dBinCQW5l/CA9aQnE5sgHbRJ9dDPw8zhq0tbedG978ZaO64iA5nLr/hUFoI8M0TTD7HJASseGlb8fI1p8VgmUXWlxVZlQvZlTbwH2S1lOtAdIeVxWB4E7gdyEizk8jf1OjVmshZBCsBs8AMUzTDDMNH//YXc0VBQokT8Qa5ZtBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333259; c=relaxed/simple;
	bh=Umc4lJBE6iLRSvAa0gHSqwFC3beNVviVpyNP0jlUhXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DE/grQuPeufwUFUnLfqJvIz9coHgrMBpIBWW/rYnXOAmm1BeiQsJYMzW0bSp9REfNgd8XDcnRy+mLImEfNLrkEHHQw/5BhLNV35lEdlUkFbUtzZBwxWxlT3KvAJzYdZgF+C4NDq7UccYkdnwSWQ0HHubcvO77fFG4u0372nhWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+NCCHbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUVvn4ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54a532111750
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G4Pl2a+TrddTUBSj4hdHEK72CiVUyehsyV0
	LvzYlDXA=; b=D+NCCHbdYcYVbcA6qS3As/FiXN2dnBOtRhr/zelj0KGWYOu2orZ
	YigCQAWOkKKRw0AzBtM4A81Pg82a17T8bXw3SBel08B9bFK6R8NV6KgqEr/KqOTL
	f5qi6YvQRkcO5dhGEpSXgE/Frr3Szi7g9dac4KLaoNkB+209A9mUo1VAyt/vnEfe
	o4QvcO6u9xQv8bys4A8L3IFYG9zwrwwpylDyWmwB6XKLZPdYO6EtJBRrp5pQZIWQ
	IXeY57P2FSMAXl0C11Ac/0Ef4ECjc9VfPbkq3N1jOcVGhb0WBh7tqEHlWsl8PZcE
	jKLo9BuAFwmFteBXySOYPPltI+LwDi35J6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4h4gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so2360575785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333257; x=1771938057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4Pl2a+TrddTUBSj4hdHEK72CiVUyehsyV0LvzYlDXA=;
        b=VUVvn4efmuB/SAa8WoeOq8lyDm3fSIhyNWG85QhAcfC2PQs+v0qmOaAxhoC/UOidOS
         JYbuZElJUOX7M1yO8qacLWZi6G/x22tro6GwYyUhcFAR+4uEPdZGowF1DJ/gU6npH1aa
         62POtGhlrDxQxvT1vGtr5OyrjiWJ/qlQV4HKcgX9jsCCPH089UDyIdY2fshcfmUWWV6r
         3ZKEFvAm+k0+QwMI67WFR+lzaZHYJ5LHuq2oFePGCOqiuU+m0AF6oWxDLLa6dB254eqy
         fmpAY8LJqRc6PodN/kQfwiId6lvDOWWYyAOp2IeitKjpuViPUZB3himRkYGhlKtwH8wd
         PTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333257; x=1771938057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4Pl2a+TrddTUBSj4hdHEK72CiVUyehsyV0LvzYlDXA=;
        b=VLD+NRPS4nZWlDReKxcsX1Ez6p2etb+BAwwmkg5uiU7rdgmx6PJrLoxlmreWym5iRX
         cc5SirgZbPwjmNGfx6gdRElUmOIUH9NDC6hD6qBN2IuSMmLu2Dsr7HnodQC0ukVY6XHX
         RbUh63ZcAdjffNjhsPHcjv+0ZUWqGuLXBWBoBbLQ/Hf7rVo7mNHuSkNj96PYiTo1AXCi
         cnwCOrm2WcwsQowgJ7Q04iQoGYTCWM7w90klInjQuys0qXS5dpIFVSomadINeYmkCUT+
         5R1Z5MnfglAofmBUnbFq9By6GqGvAUbC3b3g6PKH+VNgpLXR0MEtJ2F0t7XQlbK53cXI
         TuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNbtrgF15r9RDrEj36Red3GCYiGwbEtiecUgU+f/dUjZNoUiufz/3Op83b/865NWb4wfQ58eHJBCrNMDDl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+P5X+/PzcRAgtQ/8o0lSIBycGvsE04NYMtkMh80BBPWauUTNu
	NwNdbQhXQ8tKnlkzXkyVjz/nPSWPHoGDnBaRQZXvmSjJz3nupHpP2VMMl14IQGmOYjqX/ok6bUL
	nY3djmn/yI7lQkjYpioTQcD6Ww9LVCk+Ou2lKeMrILreOTTbcMeRFS/4AiZM/A8TcJOTt
X-Gm-Gg: AZuq6aIvl+USp8m17CtbW9DWF4D43kAZ/hYyU+cn91HLPGuVdOy+Cdn3cRdAQvLUoCU
	Q8DBarncmUYZM4/mUK8J/OPCBUrN/naieOcSfBLNHBslAF0FUTh12fQkYtmekDuEN5vFj+akXA8
	fUM1MDEujxeDeDfP0zkg4OVWrXMA2OFexO4l1fpLuZn9k4AMe+P3H/jOyi3iRp4LeQF988oXbid
	4suQvZdD24A1OgKnhI0HQ0tnCuzRi9zU95cFnTe4mom8FLd0wiKwkbvVqw97jExWN0mmHTykUmN
	9inVZFRjLiNi4k9yVx9lPWq0Yzf7MpJKZj31T7Qn5L8IVUww6/eQWvkyWQl8Z2YI35PKmwDtbza
	sfwz1jscW55WH+JUak9v7+PzCtOHLWOIsKt+xbA==
X-Received: by 2002:a05:620a:4096:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb4c01e2b0mr1489888885a.68.1771333256528;
        Tue, 17 Feb 2026 05:00:56 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb4c01e2b0mr1489846985a.68.1771333254202;
        Tue, 17 Feb 2026 05:00:54 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm35009268f8f.26.2026.02.17.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:00:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc: De-acronymize SoC name
Date: Tue, 17 Feb 2026 14:00:48 +0100
Message-ID: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Umc4lJBE6iLRSvAa0gHSqwFC3beNVviVpyNP0jlUhXk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGZ/AwrmrAYNmt0vxWk7ycUPw8XkRaqgeXuCH
 8ukAsLlPVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRmfwAKCRDBN2bmhouD
 13TdD/0c5nVKtwPnS/jATjU6ITNG1HVfMoXKkbQd5O/J+a3MzA3VLvxVCSx0OYr4CYEe9fxfW6r
 uI1NhsIMEWocOOQrZZOM4CxLRrA0M5X5wtLxxSXVvxa29qfbIgRYtLNCgSBGkb6bOK7jBgYHCsh
 3zBtv7wG/RPWX77U9tFdtmpK4zX2Ts4m7mD3w8wOuwFHASneasXnk8pWu5sm8vEoWd7PPfm47Be
 c0EjlsQhsTeXLKO5p9/3nMCk+1Mkr3Xl3rT8m+GiSzn9/msvp30QQbTIIO6AZZr0CfMMpwn/uFl
 f36/iBYNCJ6CzDS2cyBbnpHdkvgvdK6Tyan8ej6ihGXC3+ng/Bcrz+lpmuljjuPDfxUTuO6yUqN
 iaVhBWwVtqrRLoNtY1fAfh76GaOCukg6cVtKkZ/EAf/moGrzbVHkilfcnOd+uDBwDiS8cOoMvZ1
 LTM40kB8mEsNQc6qE8AoFqscXIZwve4m5ec9iPf1+ru1gvp9Gov5s2f4JuPLBBZiwvHsfMi9JCM
 t4sMiLyeXnrGQ/KjJ9/GD9jDTWAZv+Mh6PVCfG2Am7KsKuTqg9OM+SVW/MCEzFHJsEjApX/gC1Z
 ZzCkXMO7SSiRIhRwacbpMhsc2h2mXwTg8/68tXqvjEudpMPWjnM/FBbO/0zSa7BmwyuoieBSHG3 PzjjFup2eoSgKFA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69946689 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=UdcbsA6SMs_yTIfmLdIA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX1B3YPCSNb3XJ
 qIwnixXhjX64jnhQIdCTVksqJucNd2yDeKHZv+qmjJeF6xqBIl6FyykAYI9u333MiZVRpChpSQa
 hEANeHjiMMtDM2qIzPwUUkR+X3P2H6aiqohS3gubD4agih7Y018DsS6IpeP2x9hOtOxe8FGmMr/
 pFpgclB3uJ/HBZVo2adE1odXJxJ9mJPFlGHflEVMSW4S6lJWE/9YhoQ13/vXakTfd5MnNfO2QuO
 K+D9Xpg0NNKS2XXjnXXYruEYeqU6Ok95DWE1ioYgr7nfcC0JOrkJ/jPOWtO0meDZoKsfkupwfZ2
 eXs1bI5K9CzMqXpPGB0e8KVsOYqpgtCTjdhf66wMJAwaBuaOQRniH5ZTxzTU2fgP7/K88wsMrnO
 qPouTrViPBTJ9OeAQGwtFK5oloIL1P7wdFdwpkBIKboQaJS43XJ06Z/ImsJzBoQxisFFnvSq79h
 G5VSCBQbKFgBZpGX5ug==
X-Proofpoint-GUID: dPx1IuwEWSmrRzPZT2uVxnbfSXLuS-iw
X-Proofpoint-ORIG-GUID: dPx1IuwEWSmrRzPZT2uVxnbfSXLuS-iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[taniya.das.oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58A8B14C483
X-Rspamd-Action: no action

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Split from previous patchset, because I messed up commands and combined
wrong patches together.
---
 .../devicetree/bindings/clock/qcom,glymur-dispcc.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
index 45f027c70e03..9de4ba71f1d9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller on GLYMUR
+title: Qualcomm Display Clock & Reset Controller on Glymur SoC
 
 maintainers:
   - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains for the MDSS instances on GLYMUR SoC.
+  power domains for the MDSS instances on Glymur SoC.
 
   See also:
     include/dt-bindings/clock/qcom,dispcc-glymur.h
-- 
2.51.0


