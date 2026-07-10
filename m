Return-Path: <linux-arm-msm+bounces-118116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zJ6UGqJbUGovxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:40:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A77ED736B87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:40:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ENeThg6F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vckd+xk9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118116-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118116-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E04C30238F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694EB1E515;
	Fri, 10 Jul 2026 02:40:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E331715F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651203; cv=none; b=HUqO5/5uw7tCsmK4jRUmZaMWmti1ovfktVoNPmg2LRpimNxFCqvYq9z7Q2cUDlj5ieTH5ZKp9YbyTcyqefM1hYtJYvB6f1PL9tHA4KtGHRKePbGtAL/2TQkdNLScKhzJLyoTpdemb8NxB1242lX943iJII/ElFH6z23FMRUH0OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651203; c=relaxed/simple;
	bh=ltdgoUZ6tBDDcLfmDRkC7KQJz9iLegaPyl1qkMs19LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKT/sNGCjdbiOMi5xako+fn3etvD3LK5DLVc35hu5C76yEkSQEfIgM5b0Xx/NpyAHPRzVXP4BqVaNXoHvYa+UjpWIgbnP6uAM9oiyP42G7hyE4TlN/8uSddPjdYa7jXf/zcynL+oNCK5Pd4jJqo8eRrvE5r9ax4pzuovo4c+/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENeThg6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vckd+xk9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWrZC2563427
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=; b=ENeThg6F0zqhVDJw
	wkzjiBPw9g/1cTEV0O25Gvu5jfU1Q2TJbE5nWugoE7sK2L/z6FIszDIny1Bwtprm
	mQLlr1JBkdLXkpO2CnnprHSNg7tPJ2wGP9QRh2AqKnvO8hoLkiHwOLWJW3krJ5Y7
	wQukfNnVa415UqHLQdO8Y8R/G2b5iDsiS83zSHvdgL2YVc1nMQBe1zoFCRpL6sVc
	E1Y/2+Zy5VoK6EecrrIxwIDeQzf0llGOo1CnZpkCR2XMPni2AWDooChZvuqTX4fG
	5YAkixwVVOHJ1TcisDSb142BW6d2+KAr32EXEqIPzCbxbXwGug6KqMG/mbV+7qA+
	WLXcuw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3jccn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848452dd146so1202013b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651200; x=1784256000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=;
        b=Vckd+xk9BBscsBk8eenBW/Ioxn3UrlELI1NjFqzms71fAhBGQ6zdUp+mdp429gd+Yf
         Bo4vTAsmc+aQ3sqYgQiWbr/OXlNBz9nbgnUpVbs28puEVXkPgsN/0EFIXEvCSvvGgGlZ
         f3UFmypHnvIkv/CHj4vr20/WB4mAneV0uKKpOLgAyilgbibNGx8cXhA+Th1MlNY6cWmh
         sWmhNzGHtJqlEIlm5+s9eiOkBHREaurT08v7X6OYmE6ZqTdhKlkJKTOC0GKgsZKaDTr+
         cfuW/xl6UU3KRrRYVpn/6U4DAlIVDrIPswqOCKazGHaa/vEgIznHwTunJOb9iqRYdPhg
         ot4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651200; x=1784256000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=;
        b=BUg/B4r7B/Ray2tLohD3Kdnsx7+7KEgqFhtollsSyPIT828PoVepg4itiXOOQifEJB
         1TQmObma9iuplZVeF36Ec04F+uKKrQLS/rOzrSVJiVMhSFfBQjdjbDSUyqD9LC8pUMlx
         4fSwDBC/duPStLsECfGJJfgMlTPI7rSJ0hDJnBy8ZNZZdN9IhduDZCAkSd2svIsgLD4F
         QAB/iD8qi/zbS7v8RWMT3qnY+f3NSv/g9mVCrgBNirwmgN75ahSGtksyGIbpq8vSE2jj
         kQXDyxfsaWNbUK7WWlvlfzap7IGFuVRefXfzBVNr1MZbcPqz0VcdxTw3nLfqQveXbR/g
         7UOg==
X-Forwarded-Encrypted: i=1; AHgh+Rp10599wkd8Mvnqx59dqgHbePmKOD94jCWBK1Kjvho7tOi5afEyDgds6FsPTPoge7z04xIFkF+pdY6m3dw6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyly37nKABOX/TcWkvWO6HhEv5BGXBrCqELRFn7ETlNPkxldPTP
	nRcBAW/pOINP6leHWbQtuNGi8P27H75Qq8vKuwJD5eEdzEpVhV45pcAQuDKujmRL6exeIdAb1VI
	ncKxNkoLCIFNDOVQRiIltagg5wE32Q3Ahn02rPwg03bOjfyRLkkF8od7JNtZZ+tKfd+hQ
X-Gm-Gg: AfdE7cmuAlo8EgehGEdVes2dFXtAXTXpwbhZa1sXhTrnsulthieqHJ+buyolYgjTHTO
	4TpmpWWEv5V2CYFvu4otjdAK4JZpGTbjCdlfELL+K6OPZojtht+7eYYx7Eobmx9mbJgbeUbxbNn
	HdDBKIRUVI1gmsorP9O2f7lQcZWt6m3k2tOJeREWjoOr015BiUPgQPQIXBMU9GTuM74JKXpXo29
	1//ba94l6aWCRFGVvXvtx0o+cXcdjnh4DIi6qoGciBHbKzc2FNBS5Jq0Esrcz75SOGodT6Aq7/U
	afgwFU/Nm6NWa5J3nigCk9DVAFE16tbJxxdaIknMfpWdIaEUPcOsIZv9qlCVBaDSMzj+cSvdO8s
	s1UyyzRLgw3QREU8Q0B1P/V8ws6N7ulgHhTuh0/fsUtwCzGD4SuKqv0yV3vHtyLnm4BigFPiSYg
	==
X-Received: by 2002:aa7:88c9:0:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84860a25381mr4199176b3a.42.1783651200305;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
X-Received: by 2002:aa7:88c9:0:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84860a25381mr4199155b3a.42.1783651199850;
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:00 +0800
Subject: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on platform
 bus instead of AMBA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1904;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ltdgoUZ6tBDDcLfmDRkC7KQJz9iLegaPyl1qkMs19LI=;
 b=x6U8ATUjYt1nTIesdNn0TIKfMVJvoPUBd42Ap+ISOb1F/nvyCx0LKIGzdKwP1HDzxEC34he3i
 1Fd0UF3+A89D2tnB7KwCVWId/Xb42XoWIJGeTXBLOngreWA7K3mLQJw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX9JhLOeM8eUnd
 ZrnBDlXPhgtLXGAZLQnUa6hpR7P4QA1n74uiepgPebeGq7Zr5PlD+2DPMg6Y5HWyHntNufvwI0L
 fsJsUXZrlT1zaxkZER10RhvM1oJq9BNBpF3RiBKoAB7EXaLBaQMHHfsnla4Zc9UnFFLVdSUG+yW
 4r2TcIWsnOhOd2sHVslrLZyI/B+9gZ+r0hbg0IeXGovbPYVcqbBURlVFIBbqftmYJSFfeb3cPbZ
 f7hmopxgQdHKvtPeAbvMxEX818JRXDORGoCcufM7SfGY9amJRhU1aOGSHRFnsIeIHp9UM8A3ZNS
 HbLWSoZQCQWdygJjXdRimEiipIhbTCI1Xg4Gu0cHkcmHEz/Bq26pyWqHrYQFf5zXFZZ5rcWEIwN
 7BVoosKcFgYvt2zDV66VfqSoXY9nCloaGrMHoOpNaZdKnEzkTY2A6thucAtSkGnX0apIHv+NGHE
 LkwANvAbFkcvaPr06Wg==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a505b81 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vX9vLbfq_6l8qkBHxBYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/jr4cl0e44EB
 mORsIyiGOtKmZ2pEnLNM4sxBniyLXjcuqNNrJXaynsA07nGSKZlRXCKCDJ211zUVMNNcjsfl7C1
 noCcl76XgOJlrrqLg16RovoXqhADbqQ=
X-Proofpoint-GUID: aHYR4_w4XA7d_gkLyVLPmaqcOODsyQ4A
X-Proofpoint-ORIG-GUID: aHYR4_w4XA7d_gkLyVLPmaqcOODsyQ4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A77ED736B87

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

Describe the Aggregator TraceNoC with a dedicated single
"qcom,coresight-tnoc" compatible instead of the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell". This creates the device on the
platform bus so it is bound by the platform driver through its compatible
string rather than as an AMBA device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..72fb1210e22e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000  {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1


