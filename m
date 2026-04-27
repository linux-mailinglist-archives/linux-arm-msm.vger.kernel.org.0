Return-Path: <linux-arm-msm+bounces-104588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MPqNX287mkaxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED946BF0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAF5B300185A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C6B2036E9;
	Mon, 27 Apr 2026 01:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMaqNRru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFFIUYzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA8F25A357
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253495; cv=none; b=sviEXwOK2LsAKLTzdqzSk3ju1TsvpRSZkc/JiIyX6FeZNlqxyU0vJbr448VlDltTyPwQb24X4snLkLdXl0GBQD/W5oKX68GJXNy3jYoR9J6nb2/Nw+fzva2w2w3vgCxPuTOgPbgKeMJd5yUfGTYG4/jLRpnVVnGyJdIF61B7NZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253495; c=relaxed/simple;
	bh=CF/VkGSnULA8sexSCH7XNQhxVz6rJI9RlejZ4QQZ/iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcYknMmgA7mupq7yl5RTzS9MGI9w/mNhJNStQktVepvlFvglVRdTTW+ALBSUia27voXh2l8tb7Tn2YpzEfU+K5SlJoCZUiPHV9io/hl+Vs/ij0MkPlcmI6NvAJkp7DP05TnodR7IAkkbpU6CAj4RePXOw9iJ0NRdntFED1gHsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMaqNRru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFFIUYzB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q9pr0P2257999
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ykU0Jg/GL/
	a1gB+8RXaCy7Z3yIThudpi0vPFY9q8Ws=; b=jMaqNRrupI8ZS3eDfpZxynfLOIS
	ZGdbChWy+b6f49EHilVgDtQUpMj2NOrtWF/GeqFcFG2loKd4N1unoMr+9COe3M49
	cMnQt0YDBTViTEfTGAUehy/Ws++lo1nyNzzcOYG/L9rzLoPBZghyZ4+sofDSMLiY
	iWHHHZEbfTuUACPzvliL4kd+CXP5i2MWM22eHdupFVCgrh4a1GwmITjVEalpnqcO
	CmPAIMODhX4swyytC2sQuZZXlHDfzz24XJbWkkimSV7AXAA9Gs/ZX1TmxW3/xIZe
	GFsS3Ee9QC3T82MEaq/X/hHUZX2cJM4QK8M3LoYBHm3fNglVLOyZAxqMTQA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3wyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso12523038eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253493; x=1777858293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ykU0Jg/GL/a1gB+8RXaCy7Z3yIThudpi0vPFY9q8Ws=;
        b=KFFIUYzBhdvRLUsa6IdNtpKzPVVBs2tFqU9ypGljmiIIJN8rhCkatklnstxpDHR3uE
         804TXOS4SBgRNk9sacbjohlZ4n1a4saf8WgOq5PhNs/rKabR+fU3hbvRi48TSxlu7nQM
         LxLdVPFlBaOqWa3xwgz4lBcMrj9ghsO+6JT9TQ6vSSctrTSLr2gylsFVS6ZosrUEmoaM
         nIv1qUH29PWS2Cdn9h1fqjJ02qnprJeskNxHKPjeQJlNTrz6GbNBBXjHzzL8G9qaLG2G
         UUEflYS4Mdj6W+kyCozB4tMouG/twY67iv5FcQtitl048KKTZvezYYtNA3nFy3iebjKL
         gpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253493; x=1777858293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ykU0Jg/GL/a1gB+8RXaCy7Z3yIThudpi0vPFY9q8Ws=;
        b=NepNI/DTbsXi/m51+gQDFyY/NT5Rljmc6IFIXWcQO4cGJOnoq4qNr4Ga8wxGZUiib2
         o+zl1aQJu0qXEczVeYoBr51LopeJCPsQOkm7dSy8wJcaQXgd6BQG4ogzjS9SjiZKo4Ow
         mZ8GdMTK8tPk6xUYJ4G4BwlJ1ZKGFl+g6TjPY/effnl9rHTe3eEysXDfFi4lpb60jJEr
         KrjnKRj0H/Rgk5Fn7KVljiNxVinMDVtL/L9kQyYy+S8p/p+UccgOuD+843nVaIfvJj0D
         QSbCNb8eGfBQ4Bc3v+jawQ20PruInrPVW94L13cXHMxlzY3qB11jjh36DO61uUM9kQbJ
         2SlA==
X-Forwarded-Encrypted: i=1; AFNElJ+4odMeVt8dqYAF/9VAVHyUONICGV29HF6DfUWhxNxSJNJmRWFrNsR0q5l5fNAR+LDbR4MYL8Uyo6NOZULC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tOYejo7FjWHjilyHV5DClW+aSaLI9teEBg0sTy22jnNmBugZ
	Bal/Ic5Me8OzBPpEJXt68aNnQveZMjx2LkIvcHVnPsNcvZbM+F+GB9oGR02ct+RAWKx+ZEdgxKW
	Rj3tvAZyir22RsOSrGU3UQTmx8pSqgTYUU+MeQ1/wnrIjUaDhWO1fpEt3uns0Rni2n8Mz
X-Gm-Gg: AeBDieuI4J5Zvl6JMoPn/bRL6Ai2MamOuQiP38wlF96OySE4X7PVf/4iwwQ04QHzFEC
	G2GXsfj6zmF+D1EE2KDHDJhgxd2CagoUfA1dT7hnLNCbdySpB0/F738JFKXHI/Xfsq0cbDM/+dY
	tgJNj054HxvA7bVoog8W2nAEmOnI0JgP3oyA4QqowVr9zGnztBgZhbkPX5ltVrPVHPU1zGoQFrJ
	6d4gqeMgHKpG3MKH3cxlhwax6MPnxLj0cmg6BDUFsq5qdHwQ91+qbNVA5NNrjN6L0UgrLEKH+Wf
	THwODQij264boIznqOUNieHprxb0jod0BfIwjuSttXLWpvDDojUfuBu5uRRSa27cTVky0zyUUUv
	u5TnB2hgRLI/DpEUgLRACocQ1YO2OyMGLoIlV3tlwdYqI+KteH55MRCJf7dkPw2nXpt5oggv6Mg
	DXtVFAWlHFsn4VfTfH
X-Received: by 2002:a05:693c:40c9:b0:2e6:ff79:e344 with SMTP id 5a478bee46e88-2e6ff7a04bemr15279277eec.9.1777253492754;
        Sun, 26 Apr 2026 18:31:32 -0700 (PDT)
X-Received: by 2002:a05:693c:40c9:b0:2e6:ff79:e344 with SMTP id 5a478bee46e88-2e6ff7a04bemr15279255eec.9.1777253492218;
        Sun, 26 Apr 2026 18:31:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52749042eec.8.2026.04.26.18.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:31:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller
Date: Mon, 27 Apr 2026 09:31:14 +0800
Message-ID: <20260427013115.231731-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
References: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfX8PLZ6JBoDeYt
 SMNPk+54R10EL1zcI2wLaLavQ62kxG8R6yqzJutG2pHJlKEHkyJIZySWQwhI8D5nC4tYsqIfGnw
 u2+yFrtSYeSZPzPm038mcZla43W+RrGnfS0ZaTucxapQdlXIfutIIVBSyJinROfmUTnkI0n3pWr
 l3/Sd759ITMoezRhF5PVyZzYTkq8HzWIzNZcYg6v2M6cXbGnWVPWBnG8G3z9pmcLTAHAxfbNrsF
 rJA5jQPv1CNxokQHtcx+z+RZmf/9bSqiLD+i+7mqYeCgmNoEnEGpsxg1gdJA9hIae7P8eS9dPnV
 2MN86vP7suLDRi5400mr0izWwxljGcAfPXNqsBJ3UAI5hDRUQ11Ui9HRLRKPE9bewmZjtT+am7v
 4PsJ5Mc9FJ3TUaUCbkGXk072Bh73gpSBydjApHZrr0pOn3gUmtqG6JaF/VdxwCSQvIu+27LzL9G
 Vam1q+U2wE/w1RRCAIg==
X-Proofpoint-ORIG-GUID: Gr4kn-I3J_WgXbJIhMg6uFD9RG9T73CK
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eebc75 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=o674AwMwzFixoRFAmicA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Gr4kn-I3J_WgXbJIhMg6uFD9RG9T73CK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270014
X-Rspamd-Queue-Id: D4ED946BF0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,sin.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-104588-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document UFS Host Controller on Qualcomm Nord SoC. Like the Eliza SoC,
Nord has a multi-queue command (MCQ) register range in addition to
the standard one, making both reg entries required.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..900d93b675cd 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -17,6 +17,7 @@ select:
         enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -74,6 +76,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,nord-ufshc
     then:
       properties:
         reg:
-- 
2.43.0


