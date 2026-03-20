Return-Path: <linux-arm-msm+bounces-98874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJxLJOKyvGn32AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:37:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337F2D529A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A45B3024A55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BE027FB35;
	Fri, 20 Mar 2026 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hsuIlzXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D61FF1C7;
	Fri, 20 Mar 2026 02:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773974206; cv=none; b=fcIiZyWwHXvKsu+m+xpcG0RuBkJdjsZVZWz1RXZvHyFekqRaIc3qBzjFkfUQzzrPYYA1xZQsvqQfqcXlXFRUWKQT8S5+0tMqRvI7zpQfCeg1Ix5lOlpJ0+2jCOpyMAT5+Zje0USiOvgLNazBYZ7ljG8i+M9z6zlvHCCjqizHFVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773974206; c=relaxed/simple;
	bh=pW/stipDKEd3dNGBo6dO5oJYwTTShCm6o6HI9gnkguE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1dPzKvjkM7dzQ0NXA3y7Hr3MB0jpiaHcc5hPaTKfXtt/zEBhsp3fHn5uUGuE2eQTYD1lD5KHB+wdSoYkhGimXnkkrYG9s6r22cVAG6mhCtGR7hO/K8HQ3Uid8k00f2E7DN02VWoumItayXniyiScOQWNySvMfGS4VLfZA5rxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hsuIlzXW; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JHUGxS2707460;
	Fri, 20 Mar 2026 02:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zPmLOESRdzo+vJ61tnfmifJJMUobjRTI3jjYydaffwI=; b=
	hsuIlzXW4B6nPQAfsk4WnhwDIYpV5BwZxN2mHbwtpGUBikKpD4MxKHDvdj6IlXCN
	Hkd3GA7dAcjzv4E49I4pZHwCNVKHI07p+EIJ9GRWqWiKWzqvvXn6sm+JmvdzwCJc
	LpuXjlxaaLppjin/kRGuC1ZctZ2Fmk2y4sfB3qjh00OB3q8VJIOQsETJKhG1+OBd
	ytm2mVuETXzxUExZqyoLXHm0a70647/10+Wc0guEeYVh3CkDpMpKhkH3aORxe2Yy
	vBNKRoKJ9oqBlVw5nPauozlWY157mAdoCl06SfCSf3JCV3L9ym9aebAeU4cyUxG9
	G0fbO/hEOAHo3WCR4HGqcA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxf48u8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2026 02:36:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62K2ZvUv014161;
	Fri, 20 Mar 2026 02:36:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4dnkew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2026 02:36:34 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62K2aIsJ027944;
	Fri, 20 Mar 2026 02:36:33 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4cvx4dnkeh-1;
	Fri, 20 Mar 2026 02:36:33 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS controller
Date: Thu, 19 Mar 2026 22:36:30 -0400
Message-ID: <177397022239.2845275.9913322660693343750.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311-eliza-bindings-ufs-v3-1-498b26864182@oss.qualcomm.com>
References: <20260311-eliza-bindings-ufs-v3-1-498b26864182@oss.qualcomm.com>
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
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 mlxlogscore=920 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603200019
X-Authority-Analysis: v=2.4 cv=ftrRpV4f c=1 sm=1 tr=0 ts=69bcb2b3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8
 a=0_hxvfNAyixzfgFJJR8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: colG4iul1gcU9flNn9UBcRyKfsNEqS2B
X-Proofpoint-ORIG-GUID: colG4iul1gcU9flNn9UBcRyKfsNEqS2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxOSBTYWx0ZWRfX5YvHyhnkBYNV
 lN6A3a02mJ0DCz15Qw8K/VnJRKtYu/Ysm3gNPMnNfPT0x7gWJ744N1PgTUfpqTubDPawR68FWmd
 ByBl5a8NjojmCVl+RpQwnGHo+u3GAm6e3Bj6CkNMU8f05chuEySd5UXB6qSAxF++Z62vJkFmIoG
 5uP+xOIjodLW0D+bh0KFUm/ViGoveAN15DN1iEIjcmQkZkdDH3FMoeF7XQZvXR4mh/XwK2SGQxO
 vkR/Qwu6vuBVQBbjX5d4UdhH+eKC84LrR7sGNbi1eDYO2VCIZHDtsVZ5JjYcJ2DACQThJvZViTI
 4lv+NS+G9p/CaCG/Ovkxiq0eeAA62EutzNZX+Yx9UgVzGDBdwphNuSfOJAf6H6Ez1HEX0vcd540
 Dx1u9zx5O+7OF6nbSv2AzUkom6J5Y2xBUS1Gy91AoMr0IfbLLFFgVCRoegKomMOI4Si7u1CKJjv
 R/g08Y/zVVIsCXEhbaA==
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98874-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:dkim,oracle.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0337F2D529A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 15:04:04 +0200, Abel Vesa wrote:

> Document the UFS Controller on the Eliza Platform.
> 
> The IP block version here is 6.0.0, exactly the same as on SM8650.
> 
> While MCQ reg range is also available on the already documented
> platforms, enforce only starting with Eliza.
> 
> [...]

Applied to 7.1/scsi-queue, thanks!

[1/1] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS controller
      https://git.kernel.org/mkp/scsi/c/134b898ccb68

-- 
Martin K. Petersen

