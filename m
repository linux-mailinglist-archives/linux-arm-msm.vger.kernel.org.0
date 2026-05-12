Return-Path: <linux-arm-msm+bounces-107086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOldLOMaA2pD0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:19:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E514751FFD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CD4B301846D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225EE3672A6;
	Tue, 12 May 2026 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdkJZqHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQcTUyGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A051B36A343
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588349; cv=none; b=M3KpvSeWpJst0WqyMNz51oP4df/C0ZdYnftW3S7xExe0YAmwVxV3cefZU/6loB7ED8d65IQdNQDYS6oZvaN/8nIpKSm5Y9xsiRkPTaRHuX3nGRMnLIG41ujeH/nRQzcz7JNJR+4ks36r6DtJvZKNe+fUqiwCP/Mcb3eTVfg6EpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588349; c=relaxed/simple;
	bh=6Sf8vas4PHtUAWVpKu9m1KQiPpgtKGBk/lLZaG0jX9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jaZUyNB/AyXMMDMV6Hbfpb/r2EtUSaYI056d04q5PC2cCNTvHJz2abI0rXpp0CTqZxqWbQ8z8hOKcjHJS1A+f4pC4EVHOjtVxUv/9s6N6E0Mn+ptDsOq9qbZdD51QfRzCHz7z7QXs5aYiRgmJhANMlDgMbo5AsgnS7gBuwIg+Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdkJZqHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQcTUyGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCA3s8144544
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxIxPL825Lb/iu/06hO2kw0SxnGFVq+Qz23EK2d+gVw=; b=mdkJZqHOSIZr2sHj
	So1oedgsi7dqV3s6y31cYZBWuJa4NSLDkMA9je5aGnAnvIMHR+j+bdZNCIiN0tYC
	tbhTWmIKCevi+DSvFxUO7cCmvhF2hg298wesrM+EV0ldCUQLhI6AK2+1ZGWt1f9/
	aGctfkbSAxQQC9yng0F8MXUKgBvm9xywA2vAe4p/QDlsA4BJ3FbKh7aR3YWR6ZGY
	nFRdRdYAJ4XuEf2G/z7IPyvrLvQ1kUhknT2bUFaQGciNQFFOMyXow3F3nCI0/Ttk
	RDDgAQ+PmVrY8c5AXh+dcFY+vbWsKDlvy+tes9Wqia6jKv4yzjvv92UTHN6RG2DX
	SHDaAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43yp80xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:19:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so93790791cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588344; x=1779193144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxIxPL825Lb/iu/06hO2kw0SxnGFVq+Qz23EK2d+gVw=;
        b=LQcTUyGXPJO6TO7Bd29epAMYlEwJgiRsc0as8lXuRCVvAQdj/3NhdM45t8Qj/c48Vu
         tYuzPuryuG7Eg+wSaqUrnWaGXXs0PgOpvMjS/Dv0v4V17/gDOOrQFzOZsoc8fF3Csbpy
         zGXXVhqN9k7Tv3yOrs1gSt2HAqnBv1QL38wSIGHPRRQ0I6T76C6Y9wh0gfOSBpj8NxyC
         rbkKz4kJ6H1boQw4d5B+cJGDVabVqnly3KSso41pixEDwciggUjiCxb9zaz+P2/4TztT
         VHRNdUeOZ4AUQhOPbizeOsGGfUYi7+wF+fcTbqwWUyHkHgUUa44ihy5vmcDzuD1nfBzR
         HxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588344; x=1779193144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxIxPL825Lb/iu/06hO2kw0SxnGFVq+Qz23EK2d+gVw=;
        b=sEDXcigoXNtSgdFz5EjGuLrDzVIkFk0NoR8pODVR6ND+zQnYCzv0TcLoZXMCu4+B33
         EUtX7P0W9ULIhruwLu4H9tQUfpjze7n0OcHOwcdWXQ080yQIjxL4kzFnhGks7vcFXBF8
         6CgCjIROD1StW+EuEQRrlViyg3obiwiqQUvPvBj5zVbcjppx/j/n/GuIaIjDClTm2qKn
         0172jQmUvCTNc22IB2Ob8b7RqIlJeTAI/h65TJ6RzQED6r9rdGImZTNBlZzlTcQH2DDn
         A1piUwRpZWUM0kn6sBSqTrKp1KOsTo1Lk+15VN6Yp5jjROhVGJEH0U3cT+tOywihP2EA
         LLwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ry87GpHmaQ9rv768dPCA9+r20nKTBvvudFCjVlLwDmF55SmNKED0MyXmiaAIMrK0WIIFmfHDPh8w4vylb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0tOIudoB7adY8izcus0KzhZL1wjubT9EcSeSSHGxs98BOmv0C
	qUCVrA2PRUmWsRwT4bmU0ufEBc6sRbshKMt6vpv8/oo2boULmIDo0KLDo9/s1o+cWYYPbln/9Ni
	rLLV4WCczA0a9zRcQdNS3qNCQygle1pIQ7JvbQ3TRjEYQY0eL2u77BE/hq4Caq+FVR48z
X-Gm-Gg: Acq92OHxFUn+mM+FkIYQeAreMyRV1LpvnVJ3QMfZj2ko23wM6EAKGIJYhDgrm9/x9QO
	OydMvIAE9NplrDf7y93XAjqmq/wytgTSlHqBSC4138V8CrFLdQicZP5moY8Mq89HadV+bGXG/pW
	NBf1tHh9m63DSXGCF3rUBKHTGR1T3ZJwdNKogPU0mihzb8yYTEIwrfzEHpos59yhrAZpZ4AreUQ
	NrqqvIuhNwLXLrtiQ/6R35mHRi1qiZV2qeJ0d43Mlie30NScLcDK4yFf0jtDWiUVaiG6fSn7Brt
	0tQ7nkZ/YCAtIOadV7OiIPxl5VaHfhcoTtF4cZdoYTZl6kpVUtPhLaW7EVcbdJkn1zXaBosjHzP
	7TsOq3NAOFNE4kW0DyhI8p0OFLmi/AA==
X-Received: by 2002:a05:622a:1181:b0:514:5c9f:6d9a with SMTP id d75a77b69052e-51461fdc806mr398384101cf.53.1778588344228;
        Tue, 12 May 2026 05:19:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:514:5c9f:6d9a with SMTP id d75a77b69052e-51461fdc806mr398383631cf.53.1778588343702;
        Tue, 12 May 2026 05:19:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm33700213f8f.6.2026.05.12.05.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:19:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:18:52 +0300
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1
 slave
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6Sf8vas4PHtUAWVpKu9m1KQiPpgtKGBk/lLZaG0jX9A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxqxciVrsREC24LhNZY/CuAOWpX/y4FRkKwGR
 R1yfn4a9S+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMasQAKCRAbX0TJAJUV
 Vo5SD/9TFySVxerE97NdogvRiYi3IHn80SK0Q4xFCTri8qohcB+2VTbpcB32LcKWTwgtOj7uMis
 MkQk0WuHCEWYhJw5GGNJCPPS6sdgKLb4rs88YLX0rQZJFxGTnvcwWhUkrO88Xzv3kE4fjL3vXzm
 BpELa+r8Z9yC7ae6aNBhaoeRXtLG/cgvek5yfKDIJflPs4/OVCxtEeChrkedfb5Tg/pTxhEuGqw
 6Trck7wcBHUqA76Z5439wI0HntZaHmqZM8MRIKBt+CICM6IDaOXfbabCPvNUEEF7wKvbCKu+wxu
 WQTFTjto8VYe/ht7nUBdfIx6/y7BMRTyOTGCxO1IhQIY6zRVGow5Z6YU33DtpM9cZ7O9N44+Tuz
 WdQdDFWGdzXHokoIpqptdFStZPG4Dk5Tnz5oYy8S//S479gMGtO76i6BaJFMLe4YJ4/6toamor6
 wCNqDixd8ynWQu4xtg1igrRVQM/KLxchyU90SfiVi/Ypce4MQKtWIRt/cL2uHd0FWvcRNnCjyzT
 Ehkwg34QcWUenBoEVBMDO934rOXwjibayG1mVr4lQK1CWoqFSKeIIY2OzfCX1WDdwkWcMAJLJZ8
 72BBtHAcFQgEmDQn1wB66VFxNryMPWS1WvjEI8cy1MN3ggQ0xZuHzX6C1q9MGBpeBbL3M2NId6h
 gmf4UNnMnWnlRJg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Jm7tWJ4r4Wn8QH5giOu4bIYBUoG8-9-s
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a031ab9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xi85gMORp529Q7Pi2tIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfXx4lFyJp5wFt7
 sTzX90CNvBMgz6EwRMmUvEYKKdnTbu03S3LQY4xuum9C1MylF9JvGKFGNytkDpIeTt/2D5ZZlM3
 699+arnOpwOw+h8GR4VGlPpvjIzWGurVNaQ6nr+pdzHXYVjB6Su5qvhZqrt5UjDuwzcQ5tRKCjS
 64P8r3R9aB7s9cb1z4Bj07mzqq7bxTtTtGtDkZnQR77UPw253wCGPZTIHicsAf6Hjxs2SItwPRW
 GIgXmqAmV4AYvnZpJNX4g3jWLRMfymEnA0QA7600yvh4kmmwgnxYcRciyyhAEADwfs5oJ1wwS9h
 8Aj36fTJrxQaYLXaoKGQLQ+PU86HAMFFmrjRRJowRBEOd5NDFBtld3Njro9uL5KOs7SkXzpbyHu
 2UvsPJoho2SS3KQJP7IylCB1WAV2rvdtJ8g9PKD57wvHpiyss/Wwb25u/l5YuVflxM/Ohlg087W
 9dwfio1ZhR5ucRUDnqw==
X-Proofpoint-GUID: Jm7tWJ4r4Wn8QH5giOu4bIYBUoG8-9-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120127
X-Rspamd-Queue-Id: E514751FFD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107086-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
slave ID. Add it so SDCC1 consumer can describe the corresponding
interconnect path.

Append the new ID to preserve the existing ABI values.

Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/interconnect/qcom,eliza-rpmh.h b/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
index 95db2fe647de..dfe99feefb27 100644
--- a/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
+++ b/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
@@ -57,6 +57,7 @@
 #define SLAVE_PCIE_ANOC_CFG			27
 #define SLAVE_QDSS_STM				28
 #define SLAVE_TCU				29
+#define SLAVE_SDCC_1				30
 
 #define MASTER_GEM_NOC_CNOC			0
 #define MASTER_GEM_NOC_PCIE_SNOC		1

-- 
2.54.0


