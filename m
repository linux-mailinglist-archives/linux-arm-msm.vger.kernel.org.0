Return-Path: <linux-arm-msm+bounces-96805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJExB17OsGkKnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:07:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DF25A9F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C9D031BD135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D79A320A0E;
	Wed, 11 Mar 2026 02:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VY6xk4IN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB4B2DECBF;
	Wed, 11 Mar 2026 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194794; cv=none; b=Pw6f7zWoQmdKAQt3u1Mws5d5TONdcfgF60J46x88/+g3SgJvm2e9+T6ICfOG13EB1iRgMbgq6pzqSxGnvlUE1Eju36/3bYsLvwRm/a5kGHeiACQh8z3DhCbWzAQZxM7Ao2slxzaZLJ7toDxou3/PFJS1dB7xeCEj65mCfUogHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194794; c=relaxed/simple;
	bh=zZXbNosRUKcQ+xEBHocISUk7Y0M9cHP5Qv/ZJM/ctkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/ENJVTPryJRDM/B3U2RizIw1CHW2Xt06W8ACCF76dyCUZCClwJgSUBdt1rgm3vLXOQ0SR0+qGsUdS5+nl+rzLmWlL/xX4j0ZQtQUs4FIVdqmlvDPrRvG4y6Ol96Z0tmhAbCugjxAkQqyZT+/sT2pgaGB7r8YiMwiQnaQ7NADIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VY6xk4IN; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIYgvh2347887;
	Wed, 11 Mar 2026 02:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=j7bOfsafV6XVKSXHa2xkzQsDc+IFLqMrGihRvjPrxOg=; b=
	VY6xk4INSYlKqQAte3iU+IJJa03RVByK/daHizfGWRbU7XLeTYQRgJeI0GFxbcl9
	2rT9/PMDzHsPnoeu3zUhSXugtaBFNMTxyHLskG8xApS81hAa7OiA3Lw17LQxC9Er
	0GzeJoS2hyLvhV8V9Na9pG9NxdpSFWOyQ2zF+5ZQjsvdwceAIFPmuXpQXjjsL/8w
	Wl97StKkTDrpBaanRd5vfuctpjfm8usc8A48gDggZEsyu3UNcJk1oo4Dyfo28inE
	H7Cj3Du5OJF500a5sU2U6SW5ykTGwnUNa/BibVtO3JdYWrFZpCVZVW3ZY+nFy33R
	bevL8EtJZ0le+vGmBb2WXA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csmmac2vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 02:06:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62B1dfOI020383;
	Wed, 11 Mar 2026 02:06:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4crafewwkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 02:06:24 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62B26M5N002770;
	Wed, 11 Mar 2026 02:06:23 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4crafewwj6-4;
	Wed, 11 Mar 2026 02:06:23 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V5 0/3] Add UFS support for x1e80100 SoC
Date: Tue, 10 Mar 2026 22:06:15 -0400
Message-ID: <177289787685.2131580.5635014789066764861.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=988 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603110016
X-Proofpoint-GUID: dENTXrzodeb0ZDLTsj1gn5ju5hIdQ69K
X-Proofpoint-ORIG-GUID: dENTXrzodeb0ZDLTsj1gn5ju5hIdQ69K
X-Authority-Analysis: v=2.4 cv=U5efzOru c=1 sm=1 tr=0 ts=69b0ce21 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-ZyXfFwcfwoi6QT-urMA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12272
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNiBTYWx0ZWRfX4n2elvMUf+52
 ruixkjDhY7K0ldJ+XLISFjOicxdqtGm62k2j9EdjPI7iTD96nP0KiMurAILhWVRTVjyec2A0CU8
 ZUpeuV3F8gcKzV+zjYSQqAz5pvzOYSaVNXf7J2u2NoOznM8YN8NzhYmfUxOpmGqNeLw7msV1C7M
 82XCSZqaAS02nMRm8a01jmLcPfkxbx6FoQRZbs/EDC9kQ0huXmlInpgufZdtjew61UUEnrq4okp
 g8Dk+shDqPYepMXXE4gxMn3+tnDSXV57I4dldDRERJs7L2NwGHirmu75N5MWHBG9DfIzSIjQ095
 lTi72r61AZQQTm1UsNPOotKnt3xPEE8dJkXaCTTzTIwZGJarZyN8niUyrqC4iGEWU5uO/O4ObPT
 rf2Pn/YowjIbuMo+t6kezKBNG195STqH9ap4PcaWavZBr9cVw5RinTIHUvAHcaB/kYNEgHqScHu
 M+jvhW54c5z3lm29KdLboX1nWZy9O68nRc+UGvEU=
X-Rspamd-Queue-Id: 875DF25A9F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96805-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oracle.com:dkim,oracle.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 18:59:23 +0530, Pradeep P V K wrote:

> Add UFSPHY, UFSHC compatible binding names and UFS devicetree
> enablement changes for Qualcomm x1e80100 SoC.
> 
> Changes in V5:
> - Rebased on linux-next (next-20260210) to resolve merge conflicts.
> - Add RB-by for UFSHC dt-binding [Krzysztof]
> - Add AB-by for UFSHC dt-binding [Mani]
> - Add RB-by for SoC dtsi [Konrad, Abel, Taniya, Mani]
> - Add RB-by for board dts [Konrad, Mani]
> - Link to V4:
>   https://lore.kernel.org/all/20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com
> 
> [...]

Applied to 7.1/scsi-queue, thanks!

[1/3] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC compatible for x1e80100
      https://git.kernel.org/mkp/scsi/c/690d41fae92f

-- 
Martin K. Petersen

