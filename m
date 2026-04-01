Return-Path: <linux-arm-msm+bounces-101273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG7wBZnkzGmjXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:25:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB7B3778EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE59F3140F85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470883CFF44;
	Wed,  1 Apr 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1hNxi+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgLYwplU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7083CF662
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034943; cv=none; b=QSfqTRvzjOM9b31hJfJv2IVn1czryrcmRZARH4iku1CmmSB+JtZHUupdEO37Jgpcmu/3QPAZ4QtHtVIJ/9zrJ8qbYR7kiJMFS4JxsuaC2cXE230jwJMoSOBAkZxuR72yAfC2x+gXt31XA7beDnYd0GJgnDEmFgrq4RbgDzKginM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034943; c=relaxed/simple;
	bh=tx0he3/MmcRXd/XIsxErZQP8p/i8WWMq/f0HSUslY5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgW/Pm9LlM7+1i0KxfnhBp6LDBHpvprE2le4RMKmEmuGtAMW4aPcK5CXdFWL6Cv26F+XuRnU5iOneLoONlZUjBf5PDzfaU4dLY9QLDsjxavT1JFN/hmUEncMRyT317UwPlDCpqfQPHxK0oCtGFINOgWhOsMhCbUh2vt1bCqmiO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1hNxi+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgLYwplU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314NSfR3363269
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BBPB/FSLYg0K2Rdi+KbCC4Oq8XCYRTZKAKMV1mBmtI=; b=B1hNxi+x7UJMlbqX
	IF756CFx0sPtkld4EmSCDviV5XSMECNSOjv1IsExBYVjnh++8cDRFW7Alt0g+p3+
	Iyk8CavOw+A1McYfgZhC4oKsoiyFBJ8UpSdKesrlA0ZMjA2CZKZqRfBBcQBOCbvO
	odRApzqCZkburuTjb6JqGPuDkZmkEN+iE+DDT0w53lT98nuS4FJUr2LsW2UDxdTi
	PKx+pAv902e0kn8g95Fk96LpwemFPm7hfdfLU05wkKX2iLw7nel82ylBP162CTEP
	SYO2fHS56gaajfRzvuYkEo1CQ3DFnJz6CPDV5k5sKCkciTPYSVdDEo9a3l9HWjp2
	HvCCdA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddjmbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:15:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso7098066c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775034939; x=1775639739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BBPB/FSLYg0K2Rdi+KbCC4Oq8XCYRTZKAKMV1mBmtI=;
        b=jgLYwplUGGP0erSTU3J8ZBPclBQ8EKPP3FvZqzEAt+j7T4MCF1UD4q97ackhGB5eJ5
         G7nTs3IYdnwsFqo34NZQO1U2S80Go69MaYrq4KxAfm7eF5FmD5sOMqmad1bDdoUKwViO
         eDJ7eIRreR8RkUmrLrNJhf1/2Mmmn6tOPvSbuS9Ow6JcLTfODfbAyjNXeg80MFqeNlrp
         H3T67ve+XqlDOZUsYkLIWTr5nx2f+T1ez0eyKvT5BL0t+IPNFqjUGwCRmYx2Kekms9h4
         SckGtH+Rzypp/OPdkJ4l0DMSEdEVxMGoK7JS+XRIqnEQrdkeWsfCio8yDCPBL/pviIsT
         cE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034939; x=1775639739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/BBPB/FSLYg0K2Rdi+KbCC4Oq8XCYRTZKAKMV1mBmtI=;
        b=G+eCyiAOz17CLmcYsTBcj4CMJPTuFw9yLl3rGVumzglHEjpKgAxIMQqUp3/2Pglt8b
         USEU28FoNjYOSf+O29lCDv6DUsgy7RI67AkgQSDFu6nvkDmM7CqOO3CQMq/LJh1N2+QG
         nfOfkaITqz5AImt/7N8MuL9qp1C+w9AbJom4062VVbi6BOGNrJ++5HOklvXD6l5i/TPM
         emH56sXv4HnOqddaH4okHlA40w5wTWu/EEP6ZW+ishWslYVHEa14+nJyvxP7ImH1Cy/0
         gyjqgMHXcab6Rk3GisPPSBox5hVVMHipdFFZs+085mtbfzD/iJJHb+NiNneNrvtMGuvu
         xV1w==
X-Forwarded-Encrypted: i=1; AJvYcCUxiNK/JSyqYvmrnXpABniZC1XwC012nni52NlXjULRsrEsNP7jXt6DNpQpQBvb8o6kwEwmbai25UQJVdZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh6mmOEYpnqf5vZSzeb93jkkFbB8Pm1v4J+2EIdlkiSy0vNTIi
	OqOpKKI6WAZNHk5cdVRy49WnltelVu3abD+zsnemAYkVafUUD6iN526fQcHwFLw2LFzcKtYOq/o
	tbnfQCyQPQmpolW7bPyfuxTS6MHin6kVdQU0TkppLTDJu/l1l20aN75ebei5rXuk4la0C
X-Gm-Gg: ATEYQzyL//eKATPEwGE3ds5a8/3ocCIHFphIw4GWsqAK08ezwpdJqn7SEYJHIFaFi2k
	MgP0h8YFwOQtczDkOnAzTkZjx9xjEhQy1YjqT1xYf2SHIqk8o1p9WByI35lUipiopxgzluURjaK
	bEMe0RjEi3qFU+YhNUbe0O635pGxHdZBHmKHjzTCc14ze1VXggPysabxa/eweqCvSpgPIc8RvUd
	6QkPXewHxRVbeo8Nc+TUYYxcJTF579OkaeRakdUp8J9KHJoWvkXQLhZb1Q/NbXiaOZ5m5XfkN3O
	jxJFglvnZ4+3J2ompPfhPJXBzytM8uanHU2kiMrcWSbZadGg9VbgjLZWqpQp5MyJafsWVz1Nn9W
	jxtBXLZXPzTr1g0uqkLoxH6m5gLfeySLkseKrgaSetcQpnLDgQJDOm2lgry4UPMBq+1Fwt7U2/A
	==
X-Received: by 2002:a05:7022:7f12:b0:12b:ebb9:1c18 with SMTP id a92af1059eb24-12bebb920e6mr34938c88.31.1775034939278;
        Wed, 01 Apr 2026 02:15:39 -0700 (PDT)
X-Received: by 2002:a05:7022:7f12:b0:12b:ebb9:1c18 with SMTP id a92af1059eb24-12bebb920e6mr34926c88.31.1775034938658;
        Wed, 01 Apr 2026 02:15:38 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm18285025c88.7.2026.04.01.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:15:38 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:15:29 -0700
Subject: [PATCH 1/3] dt-bindings: power: qcom,rpmpd: Add Hawi RPMh power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-haw-rpmhpd-v1-1-c830c79ed8f9@oss.qualcomm.com>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775034936; l=744;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tx0he3/MmcRXd/XIsxErZQP8p/i8WWMq/f0HSUslY5o=;
 b=QesnCfG3bmd5H8wD5oO0AgsjYZw7/8oOfl40RuKe5J5FLfFsm6JMfe56Qs71Y9RBpeWBjaOqi
 KFxFmOqWLJqCbDIec2rVmRp3NgZTNouH+nI7qEf/F2mK1f+V2o/I1+M
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69cce23c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hqjnkh-R_53NPVJCVN8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: UpwmbKYY39D-HL54qIFn358u877aAnkH
X-Proofpoint-ORIG-GUID: UpwmbKYY39D-HL54qIFn358u877aAnkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfXzU6JZYcc0fdt
 90zEP7savZU8XRPVBNDmxFdm3SA0cxRBvGV/s1iKul6RKrIuNUj34IE/fZt4IBTHfYNK+p1tnUa
 S1WoZhvmN52oIixpu6ZWX70tPfhyn6acMoup1HNR/eLQE1ZBI3vwhnWzjy4entHzyv5qhC9pfVx
 jsfp3IH8aQp+zpJbr+ZCPTpVblP+5AJ78VvLgL66gIQW0bqEJhGJ7ZTQkXGKf8M3+etAa/nzEr5
 mrPonN7O3xa5AW9VNdQZ1UNHPeQbgf9c8tXbn8WRpgc80TA5P8kdC3Vibn4XqsMecvVyFGFuApr
 7UGKrlPxZwKTnFyh/CIQi9cSOFNNKlXdMz12aZWwx6sMHk+4kHALq7xn7F1HEscwJsgDc70aMHE
 L21yeTU0AuuImLf0a1haCLqdoIEQYlJovd+D+itjOx68bT6GEzdGiuqRMrknhWq3xjAlXCEeY4a
 J3LomydnFqsJDCBtrig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101273-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AB7B3778EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the RPMh power domain for Hawi SoC.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 27af5b8aa134..35a0e01c2015 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-rpmhpd
+          - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd

-- 
2.43.0


