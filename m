Return-Path: <linux-arm-msm+bounces-114315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j62SIGSoO2qpawgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:50:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B616BD0FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 11:50:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lsdg1egx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aOz7Nh6X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114315-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114315-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7032D3001B58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5470320ADF8;
	Wed, 24 Jun 2026 09:49:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B922B8DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294589; cv=none; b=UiX7rT/RU2KTz9fy/w1Hnp6xz6QYkednRo4kqNGnbzAzkhaOfYuHGjH4q6/kTDJ5rdsVLW1cZygyKye2uxe9aTvvt51IPkS9f8TYJ22A+NPkOc5LCitePkK/KJwulvvR5LKqzUgkr1sVtrGgAZGOC+pMDrt/pUGsJA109He7Gfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294589; c=relaxed/simple;
	bh=VcP/Q4tJO2REh/sFJ+3sJ1plbn436MCaqHKTnhy6iLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cjegQlC0kkJ7cUGkGFHIQ4pn45rCpqq7D/DCnQh4uil3xVqm5mK+1aH5hBK010HrvedU+LOVMaeYK56lu93zzbB3V4Jy5LzaYB+F2PMIqQQ/KLnibE2CVhySHSRyM1gvxuBHkAM6Qbg5O298IkVU04aKiVJQ7mT9bCA0+vEPCqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsdg1egx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOz7Nh6X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7Hmfg3753340
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TmWx5mlplJVO/aPdm2p03E
	imgzhiIPG+EYrUm6eliLc=; b=lsdg1egxi3g13WvSRiEs1oA4x7S3KeHlsiu3U2
	+6d/IuYJpg5tYoXOgDJ/ALaR6P/UkmUSQQZLaNBbnesLjsTdJ2sRyJwfP7sq4ICg
	KNtnC3g2YXYnYSRrhRBLzzss/17AgKXGohwPvIDA1dpsxGZ3wyJ4nRpY7/cRqecC
	oFFF7bFExAOTkINW4g9J9C6urleSHf+3PNTA7GqVidDGSzfo7WdXPK8326+z4q5E
	XDoMQUeCBs5WoOAa5jFZzj4a21hNl+UuLIW3H9RvS/XrZLxIh5w8HsQtL+gUI/FO
	v4BytP0FTzqA+xRCSCwl3iPL9ky6Tl3Z3RsUiVzl9wc1zzlw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp8j02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 09:49:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84245e2bb00so888503b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294586; x=1782899386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmWx5mlplJVO/aPdm2p03EimgzhiIPG+EYrUm6eliLc=;
        b=aOz7Nh6XPaP05XxfjwxzdjRFtad/qfqqAF3wi2IVWjUvH7rvAN3vOdyc4m7k8nZ5c3
         lmlVc8S0is8t87TtkgWuyDx7opMo0Ap0pCsjSj1JWATimphSVsFXT4bS7A8uxUW9H1mA
         Y/GyAXtf1ZiezQiJCtbDddDQN+RnvwDXk7GaG2bo7uEmkMtEIltMmRRRmVhSPAGV9SEd
         M90TKk8Le5brIlarBsAb05ExgrQ0nzaq2SXoAVJtra1Ui9CVXEt68p1zpJn1/CmAVd+e
         tImgR+P4aWX8czdGGoCgWcNnuCc6apjwhWchCE3qnju05Ibxc5LxB+m4ghqSSTlyo36m
         L2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294586; x=1782899386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmWx5mlplJVO/aPdm2p03EimgzhiIPG+EYrUm6eliLc=;
        b=CY7ktgsENEWzCp/yRODrdze4ZzDUwtX23CElCNGJ0ZVTW9DjKS3XW4uEOZGAU/iID8
         7/9yA5gaF2hY1YBE4B18jBo8qlnxv3mj28R0Pt/OnKDDOoxyFVZhQixEyMTALby9GK30
         Idh6m+EBMfKLB5TfzJ4ywNJvZihUGcur5pwTq1Mm/COFiDMCVIG2jSItCfPpVAVwMHAk
         NRMFjLz4BHYMvloNVpQYedParrCVKLeBAIz0fGFyVpO5Tli1Hmp2bB+TOt9gUEA22AtH
         lsSAo3qOjDWVGbKFP4OyNJytWTx8eciYXpqgFBLPnI7MA/YsuBELzSRA1IigLvX9jIq6
         Ftjw==
X-Forwarded-Encrypted: i=1; AFNElJ99FGbAG7ni2Ckqpd+R+gfFGspbpzdt+JNczW3U5myamAZX+Hwnb/4z1Xlhx4uoyI57W8qGUAe9jStjtZgq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5yVVHLk1z+48GIiQrGKMkCYnPvG7+VJp+PuBKP3oRCwnILga
	jGkXiwuXyTf/iQkrh28nsPHCNg0uOLVMTLAxS1T7QJqrTWZeThdK4n+eR037Cet1opEhg3O1z+f
	b8w1MwIG0u02dPP4dKuYgwIRaMhcfvSB46zFrbwmFTQPutwRIECddFU2B/JfVoNDWtARt
X-Gm-Gg: AfdE7ck4rdFj2ruTbTK9mYVNTlKfwouT7HGKy4ms+AGyH/4a898LLI0NZkQazqb4eQV
	oPMFn5G6uitn8zZN0DHY7cZzDbDDhXOUP6B4hgF2mvEdyvHaLgn2lsab+d1jMJTcis3vg6YXZHZ
	OllC08LmPApdMxa61rUI0STvAB749wvMjs3TotrRxS3v3pfgU4fBZJwqWbyiCwesdpTD5Hn8+ro
	PBB1SLF4/DKbvCE5aVTjhTc3J3g3l2Zj3QYIlhBpfvzaWtm2hbLAWzt6LTRLSmHAN+cFErDL1Ei
	7CbxcNpsHlcX8JjOXYB5vxCBl3Xjm+WAnEW/BILhXxuJlYVvOsJAeqC0Zx6rGJyDC+ZZNhniSt6
	dbd+3p7wlmGih1CAmqQlLrbNIyeDGitxGmlNEI1GwWAuGxduQ0t0LYDZYvjC/s5Z1Lv2KvOoBYw
	==
X-Received: by 2002:a05:6a00:1405:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-845a2a76d70mr3347702b3a.7.1782294585830;
        Wed, 24 Jun 2026 02:49:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1405:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-845a2a76d70mr3347676b3a.7.1782294585393;
        Wed, 24 Jun 2026 02:49:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix traceNoC probe issue on Kaanapali
Date: Wed, 24 Jun 2026 17:49:24 +0800
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWoO2oC/42NTQ6CQAyFr2K6toSZAIIr72FYDKXIJMLgFIiGc
 HcrJ3Dzku/l/WwgHD0LXE8bRF69+DAq2PMJqHfjg9G3ymBTW6SFzbDzb5yjIx4D4RRDowmRhZG
 KzFats2XbZaD1KbJmj+l7rdx7mUP8HE+r+bl/jK4GDTZElzI3VdlRfgsiyWtxTwrDkKhAve/7F
 +QsnJnHAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1063;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VcP/Q4tJO2REh/sFJ+3sJ1plbn436MCaqHKTnhy6iLA=;
 b=wIf6sFcLx3XxcdanGybD2LYXgyMPABJkNEpu7/0s7b5C1LFcMoeY6yDYGekgtIa7WERZ+kkf5
 Tt53FTdg/qEDaLwlsKpM9HQiJnbI2UnFNwoI0a6JJXCsgkBU92H2Lxn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 7xpJZdddcvmiBsRsmmbVfr3jLmqwVyLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfXzVnkAE3rF1V5
 0FJds2wUydzQXWMCCjBpyQnOu957HMMJrMfIEH8s9UuSLVIlTGwqtZc8lv471FmirmSpkNOIQNP
 1xePdRAAElggrBhK3nnpmxpTCU/O28MmMF5lb100Tx6j6UmquY4yWtCkn8nFDsDvshwjqonGobK
 UsEnxyjZ5pMloh995MQ4w7MCTmsTLq7D9h7AlwlU7+NZmfx+gvB4Fv6MTbRRgQN99cLsYdhCcuB
 8XdEmhUkXPVIouvcoKShi5k/NjWWR+yeV83VdM1Y7nMwIO945od60rrf8vb5PCxQZxR43RKOZWz
 pYdmx06wWy2U+kN9MJfoS4Ieyw79gwApTgen4wTmuib2/l3yAy6PqxeyhD3MmnBcZsk328KmEhA
 vPhvINwFPdcdjXN95/Cy65piDrR41A==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3ba83a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UTefLX4YHh8himS-NM4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX3xZ1VPPkEFnb
 Cw6hwsOD3Q1tt6OcEjvmpnVginHa3rGWzKI4bTxEXta8CPJkH9tDRpCuUixJVHxi562oNvzF7n/
 nMsc4FkKqVMQsHmwNTOehv3CRjtppFc=
X-Proofpoint-GUID: 7xpJZdddcvmiBsRsmmbVfr3jLmqwVyLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240081
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
	TAGGED_FROM(0.00)[bounces-114315-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1B616BD0FC

Patch 1 changes the binding to allow the TraceNoC device accepts
arm,primecell-periphid property.

Patch 2 fixes the deferred probe issue for the TraceNoC device by
adding the arm,primecell-periphid property to bypass the AMBA check.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-tnoc: allow arm,primecell-periphid
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue

 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi                        | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


