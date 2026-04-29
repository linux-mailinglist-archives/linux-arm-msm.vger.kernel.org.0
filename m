Return-Path: <linux-arm-msm+bounces-105149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCChC+7H8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C684916E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A8BD300F128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF073BBA0D;
	Wed, 29 Apr 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/JNdBFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUe/MZhN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937533BADA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453015; cv=none; b=p+SJFVG6ANZArHpkOQZVH9mYNTOdGz0cQBXncfhepqbsab+W21GZC/fkvaRMSBppzD/TD2domodMnSOAy2gqGG2qRId/38eGabpl5ByK6XcPdUa2J90uABlUTKJus2HSO1un2AS7VXz9wvjMtnOzvDh0Jx1mLceYxixFQ5FBmbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453015; c=relaxed/simple;
	bh=TSw8Lu57yJtkRMDylm/JyZTcFuBYPN1OtsZvoFLCZDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUCn7Xg+CGQQx2e78zuGHqCUPA6TYQmZ7w1FYuHqibRfTnNmNMGsE1J7L11eQumxSYhCVULVa0aGN7li89thc7QGsUcYUyb4BkP2MPnAGriVnLgas7k2eVtIY5Xo0BKf3Ja9Tw/110r/KBBYFi+Z4rcN1gFFksMs/+kjYD+Dm9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/JNdBFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUe/MZhN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvTv4001917
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=; b=Q/JNdBFZlWEJEZjz
	ezUs9IOt5bbQuMiNc8GBcByksDd5DsKj62PCERNfStLXyU8eY82Sqy+kCtnO/ioA
	etq6JUJFmFHD5yHRwgsfL6KQfttTjl9CT5H1sWCD4XVQI0e39M7e3gQBUwMHMgF7
	uv+W+ixrwh1xkf99Qgt2lbHEdtIsrXEijSos0tTzf4lFBCU/FHt2AhLlsBd5TdEA
	yZJpgb3SrC+urJ/nWiYCWL3fA5QxrDR9Bq2sXWnXwQXWR+XY0wlEzJ5beERuT2A0
	YMQchCGAXRGwsPyFOPjpgjKWUzGpzgCCc7JuFx9ChhKZyTQC88jhXluVwI+6qpQT
	z1qhXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1bmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d826ed6f9so14463511cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453011; x=1778057811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=;
        b=GUe/MZhNNipMSkJ10GgW6g610aUa7kXHmaxSDoHpUxeRuw+ZdvCcCA3lciMDIqsF9a
         qGkp5WAfOAdUOnGkHZ8CbWJZYC3Y5LkE771XrjIVAaqipbeWea7vrkY6fQx2JXTcAdFU
         FKiQZAHrFjWpWGZwhdSh8AzCjuDlxxWySg70DnoMeW4TluA6h221UNtRlnDW73KU9pT0
         Vh2kHQBNc8InDPtWHbZF14jbs2btZ2tcFBnO1d/MyXFHdrs5/MHi8DmVsfCbPur9w5Ah
         3bwf6+qYSdPQLkTwzNeJV42ukP/eQSG/ATz5tC04DBSy/97smanj8lCeIG+Hdfka0b+Z
         Af+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453011; x=1778057811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDO+Y2H++B+mQcB6VwRjZxZEKt/ePekgaKVfIVUJC/w=;
        b=ALZ/34+GHjMlNfylGttqQK1hyKFsET9PBEAxUoNYjXSlWmy8TWM6Vz4x3TqK+0bLjn
         L3EKNOun9CvAFkpY9Tjagb9NbAYeUCxPk0XdRkIaMPs9NH9ooi5bb/XohHaoQ13bvYrI
         cJLfOTzwFTZoMLa+xqFCtOI4DB1NIBy5zSYTTuwb2Bwgr9XqiBpTjyHUKOJMva3+cE4L
         k6k/gh21c0r/Z2aGM1fZLQIItRxD/m0asVHUjsl42P6tlyHHL4fNJ3eacHx5VyJ13cf7
         hP66NDwnBAwAOiP19Fr7OdS/d/7iLI5Dskx1NRzjmdjU89/tdUdOWcY466euREBOafJI
         5AtQ==
X-Gm-Message-State: AOJu0YzEaswsZTwtWxEwih14QzLiI2uiOgVLpFBbR2FIqoVFKXGoCBew
	yzG9Iui3IpfeO2nzhtEtp5yOdyFqzrQgWNvnMxFHViYTX7/PV0Va3ZPsXWZMlJk03H/0V7RpoXL
	nJqohenMwi6hi4VXFADkOSD8fhG8cQ29P4Ugc207rejnyIqBM6NIIJ4HD5bdHQJJJBgPWQmu1P/
	N7
X-Gm-Gg: AeBDieudMw0Q6MtZ/dn+M+bIjFPLCujkf8w+vKOu52L3TMgz1xTGjGxa8rUFZ6VPqOX
	33hZJ8E5mF6JilcuJsYr2Sk/rln89ehwNdImLoRuYPeMnMv1nM6Dqbt80D5O4WmdD8cD0okcO3A
	I0BlQwvo0Yp0OU5F6S7UgdvXI63GbXVFy7u/DiA3nFrTbzE5z/C8NsVqS/3JK16TY+lRhD+KlvQ
	sGMEkXkpcAwzJg09uSPVeJqWeT25ALihaq+CiCCaB2BpgHW7EhGg6mi2U0koUJna0ADPmBY7gl1
	NGfaj1Uptmx6Y6j+1VivP/jycuySFi8Ma7xEm7nF5EcpKnX9lE3QYGZKH0wGAsYlD4T7IIDNEfF
	j/SSdF+M3XBBnk8zOrqi+BQdkSYlCW2RGW2xw0HqnWrAWtr+ndafYeEI=
X-Received: by 2002:a05:622a:1305:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-51019a2b43cmr30656981cf.11.1777453011451;
        Wed, 29 Apr 2026 01:56:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1305:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-51019a2b43cmr30656811cf.11.1777453010898;
        Wed, 29 Apr 2026 01:56:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:56:34 +0200
Subject: [PATCH 3/4] soc: qcom: Make important drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TSw8Lu57yJtkRMDylm/JyZTcFuBYPN1OtsZvoFLCZDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfK2JCPkFNKu3/pW7B2ymTozGqCVyRMiqgkC
 RWSsag/OWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHygAKCRDBN2bmhouD
 1zqCEACVyQKMFvChuuLOlQQ0GyrEBhuYyQvmra5+px5friJjvUIkNcMGGisVVg5K/+54/SDMkYk
 1NATZr/BK8X7s8Bfjf08Nh5SfBPf8q628jL4tjlxHO74kcwgaa8DUOg3jt0T+S3mw0fIcSacict
 oI9h6qMIAKChKA/rn0I3pLLC78kGdGiLKxKJwQeSU0txnurzPpRiIQkdIIq6s1bxkNLeGsaDIDv
 Bo95HgLuvF1S8CSM9b5cP7LOumDZnT7Aw3mTIqFXjRRBXv9b+xAs7JVoQ+RzyodO/iVTcIyk5Dn
 byUflXYoi11Rmw+mw6XbsaD/2IZ9GHrOJmOqTFkNrd3W60uV7mHiHHddF4S3bzXa2/4Nx7Bz6Z7
 XBTeJfWmvlk6nB4p0inMS03ZDtSBxjD8LDF2NB8982XfF2rVve75TBLN3JlqC7UViz6r7BGJlHP
 Tst648VEbD0sQ/JdVr2cKs0AMON/4d1P8QCjl6FhYCIhP1Yd10yk58ermi1hyuSDAo4Lpjs6Gv+
 f/MT0v6aIR8f9bBu0nsrKDPD2uerPfosYNvt3Bh/ge2m/L7SFg9Fx7IaBNqr1DiwvoOLGQzWpNu
 S9hiNg8rx6F7moImhkimxZjrGBy9K4A691UL6tseFsINKkGoL+wdqMfSWbXVDRhYcPwEVtqt0fH
 ebivBLVC47Xlt7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1c7d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZGiyX8zb7ZTa2IDRS3UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: x1C_cl_Sf14_n3gOhnOVH0XkVEVe_3MM
X-Proofpoint-GUID: x1C_cl_Sf14_n3gOhnOVH0XkVEVe_3MM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX6ktHzqUXT0E5
 d8MLYmDdtv2I9PlIoI5QdcMK+F/f9aurHbc1tZtyrbRtzTegpCn1lOPEa0ZywFrK38WIehEaewe
 d2m6U12ZVnuKt2AMskjTTj4sVDyJkS1vZVJuCjSZOrWVDG+g1NXyBM0oiO7H746CjP6Qi5kighd
 5tpNfLUooE8M/RBGoJ+8R7kyNcXqqi3s+BMrjLYMI/W5LJ03z0a2AgCRvDQNIeIbAMW/qWRLQtv
 HkU0B17Fy3ccIxsI7bEkdzwk6q/EFF+n9D7RKaq7EkL2y5AjXtHdk+CMaTICp+4ymD4NaD9BUx6
 EmssYMuHvkTkl57MV3Wi6bMkBiug5TRU0wRwSAcdtt9jr0cbMDfJKuOVUc+DRt4z7RkWdaOBgGd
 tLB/MdlU9Y9O1Z+zUE4McwTJCxJnIA0Tun7qk6VeSqn4XLe2wS3YCq8m2HN3rkKS95EeELlXrzR
 c1dBH9EIE509L3gRS6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-Rspamd-Queue-Id: D4C684916E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105149-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The drivers for Qualcomm SoC components are covering a basic or
fundamental SoC blocks.  Usually they are required for booting or to
achieve basic expected functionality when running Linux.  These drivers
do not represent any sort of buses visible to the board
designers/configurators, thus they should be always enabled, regardless
how SoC is used in the final board.

Kernel configuration should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch most of the Qualcomm SoC drivers to a default 'yes' or
'module' for ARCH_QCOM, to match existing defconfig usage.

This has no impact on arm64 defconfig, arm qcom_defconfig and arm
multi_v7_defconfig.

The change will however enable by default all drivers for arm or arm64
COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
logical: if one selects ARCH_QCOM then probably by default wants to
build test it entirely.  Kernels with COMPILE_TEST are not supposed to
be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9a050ba1dbcb..108fbd0610a3 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -21,6 +21,7 @@ config QCOM_AOSS_QMP
 	depends on COMMON_CLK && PM
 	depends on ARM64 || COMPILE_TEST
 	select PM_GENERIC_DOMAINS
+	default ARCH_QCOM
 	help
 	  This driver provides the means of communicating with and controlling
 	  the low-power state for resources related to the remoteproc
@@ -30,6 +31,7 @@ config QCOM_AOSS_QMP
 config QCOM_COMMAND_DB
 	tristate "Qualcomm Command DB"
 	depends on OF_RESERVED_MEM
+	default ARCH_QCOM
 	help
 	  Command DB queries shared memory by key string for shared system
 	  resources. Platform drivers that require to set state of a shared
@@ -39,6 +41,7 @@ config QCOM_COMMAND_DB
 config QCOM_GENI_SE
 	tristate "QCOM GENI Serial Engine Driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -48,6 +51,7 @@ config QCOM_GENI_SE
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -58,6 +62,7 @@ config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
 	depends on ARM64 || COMPILE_TEST
 	select REGMAP_MMIO
+	default m if ARCH_QCOM
 	help
 	  Qualcomm Technologies, Inc. platform specific
 	  Last Level Cache Controller(LLCC) driver for platforms such as,
@@ -71,6 +76,7 @@ config QCOM_KRYO_L2_ACCESSORS
 config QCOM_OCMEM
 	tristate "Qualcomm On Chip Memory (OCMEM) driver"
 	select QCOM_SCM
+	default m if ARCH_QCOM
 	help
 	  The On Chip Memory (OCMEM) allocator allows various clients to
 	  allocate memory from OCMEM based on performance, latency and power
@@ -116,6 +122,7 @@ config QCOM_PMIC_GLINK
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
+	default m if ARCH_QCOM
 	help
 	  The Qualcomm PMIC GLINK driver provides access, over GLINK, to the
 	  USB and battery firmware running on one of the coprocessors in
@@ -135,6 +142,7 @@ config QCOM_RAMP_CTRL
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
 	select QCOM_SCM
+	default m if ARCH_QCOM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
 	  and exposing regions of shared memory with remote processors for the
@@ -156,6 +164,7 @@ config QCOM_RPM_MASTER_STATS
 config QCOM_RPMH
 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
 	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
+	default ARCH_QCOM
 	help
 	  Support for communication with the hardened-RPM blocks in
 	  Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
@@ -166,6 +175,7 @@ config QCOM_RPMH
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
 	depends on HWSPINLOCK
+	default ARCH_QCOM
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Manager.
 	  The driver provides an interface to items in a heap shared among all
@@ -175,6 +185,7 @@ config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
 	depends on RPMSG
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
+	default ARCH_QCOM
 	help
 	  If you say yes to this option, support will be included for the
 	  Resource Power Manager system found in the Qualcomm 8974 based
@@ -195,6 +206,7 @@ config QCOM_SMP2P
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN
+	default ARCH_QCOM
 	help
 	  Say yes here to support the Qualcomm Shared Memory Point to Point
 	  protocol.
@@ -205,6 +217,7 @@ config QCOM_SMSM
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	select IRQ_DOMAIN
+	default ARCH_QCOM
 	help
 	  Say yes here to support the Qualcomm Shared Memory State Machine.
 	  The state machine is represented by bits in shared memory.
@@ -213,6 +226,7 @@ config QCOM_SOCINFO
 	tristate "Qualcomm socinfo driver"
 	depends on QCOM_SMEM
 	select SOC_BUS
+	default m if ARCH_QCOM
 	help
 	 Say yes here to support the Qualcomm socinfo driver, providing
 	 information about the SoC to user space.
@@ -230,6 +244,7 @@ config QCOM_STATS
 	depends on DEBUG_FS || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	default m if ARCH_QCOM
 	help
 	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
 	  the shared memory exported by the remote processor related to
@@ -239,6 +254,7 @@ config QCOM_STATS
 config QCOM_WCNSS_CTRL
 	tristate "Qualcomm WCNSS control driver"
 	depends on RPMSG
+	default m if ARCH_QCOM
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
 	  firmware to a newly booted WCNSS chip.
@@ -249,6 +265,7 @@ config QCOM_APR
 	depends on NET
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_PDR_HELPERS
+	default m if ARCH_QCOM
 	help
 	  Enable APR IPC protocol support between
 	  application processor and QDSP6. APR is
@@ -260,6 +277,7 @@ config QCOM_ICC_BWMON
 	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
+	default m if ARCH_QCOM
 	help
 	  Sets up driver monitoring bandwidth on various interconnects and
 	  based on that voting for interconnect bandwidth, adjusting their
@@ -274,6 +292,7 @@ config QCOM_PBS
 	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
 	depends on ARM64 || COMPILE_TEST
 	depends on SPMI
+	default m if ARCH_QCOM
 	help
 	  This driver supports configuring software programmable boot sequencer (PBS)
 	  trigger event through PBS RAM on Qualcomm Technologies, Inc. PMICs.

-- 
2.51.0


