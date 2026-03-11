Return-Path: <linux-arm-msm+bounces-96806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHIrCMTOsGkKnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:09:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B511325AAA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA09232030E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18A9325705;
	Wed, 11 Mar 2026 02:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r/xO1K/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F3F30F812;
	Wed, 11 Mar 2026 02:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194812; cv=none; b=QRsUGvvvzyOzOMqI+IwdfrydPnWhZjf/ENY3enDQfsTXwsMFoYk3umy1ju6HjXmlq/9v3u/O4ZDLKioJqB9ZhT7GbunE235wkBibIpnzuIFRZkD4iZO4WwouLd7sqear7zASnzSxwmZBUz8SbhDEdaIBm9xMyzsS2ycyl8Bwa4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194812; c=relaxed/simple;
	bh=UaLVhdvXWetzbH8/UhNuhhsOqPDDmNHqLePyoUgiblA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Om63K0PoeRxImNXyJ+EQNxLV+akkZ3Det92MpsgwHVNi5PN3SYr4gp4z3swTI98AG2eGlW9H/urdnLyziLCF4ao3TdQDwcO0wAPkNq7CY+pXUSQkAM0ZD+5EaZ/KUdXEek/aj7+j6dmTR4RQjWGgqpusmOSaP4NhOY7tpqIClxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r/xO1K/f; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIZD6L2911115;
	Wed, 11 Mar 2026 02:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pAAxYFFzFfWTOcBLF8XT5Q5KOsRMGDM9wOgpZHoM5vE=; b=
	r/xO1K/fKQXWxSJL7g5SYOtFMNcbIYoTB5jH8UR+qc+ueOG24a0Ybd9tNh45hLnu
	AGxoPSYJDDEjOPbstjpVjskGjou+bGQtBRrnE1GElwQdPMp06CZMEQWwyykrl0j0
	IhPsixhCAcMl+uyYE6gY/IJ8xLWeixEsCXPK0z390blyTJ+qIuPjx5ez943bwnMW
	lj+APr0sIzyeEFkX1/LRS9bcIO8H5E2zQsNccYmjR4h7PsPsCk9SRitrimVLuqlH
	10tdYeenRNyE6w5Q7oPDacBACiZU2Pplpf33j2Php+MhIbhns344Yq3KROi9T7F5
	4+PiAoMY5USWkdkEs3wmzw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cskua44mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 02:06:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62B1cDcJ020243;
	Wed, 11 Mar 2026 02:06:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4crafewwjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 02:06:23 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62B26M5J002770;
	Wed, 11 Mar 2026 02:06:22 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4crafewwj6-2;
	Wed, 11 Mar 2026 02:06:22 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Enable UFS support on Milos
Date: Tue, 10 Mar 2026 22:06:13 -0400
Message-ID: <177289787680.2131580.5421474366567386451.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
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
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603110016
X-Authority-Analysis: v=2.4 cv=Methep/f c=1 sm=1 tr=0 ts=69b0ce20 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8
 a=IOu2Ym7NY8O1g5AK-m0A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12272
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNiBTYWx0ZWRfX/4B9gGsOR3eQ
 OCrB0qlknbYbxRXzoXDF1gJfzToTWVd5cFSaSLa2lPVx+xHbEINrnjIrob5bSdt58/G/D7Ch6HA
 1BP3Ip2L1L/WjuA6tHobH94TsTIl2vlBZ6t5VvjeaXlU1nL5dGKx1jY//2c/Xr5ybyM+r5uo/0H
 0lATTU5XGkKUjD19QeGfiz+FGlp7lp4tyymURdsim0vd4sny5fkCTU/T4v1cxPAbxrbrfHYzLxp
 nd90SQOrBP1xKkpyyeohE+eXnTlvjknN8RBUOMKBu8ji38/s7jHiASjX1jteCbXgttQWD1C9Uhz
 Qxu3xII21Zo1LKv8t1QWf2vEHBM73AqzlPOYzs76aIPEWRIE9SBGREgUBbGTCByBy66Gm2MnFng
 91i3+J8QJLC5WtD/BoCtq25XJe5BMvf3j4JYSPhzc6wwxOM2/DqNjVz/seXEx5r0ShNi62QH9Lj
 w60Dd4F8ld03FdQC2tMHGPZczfVSFpxNGiSjMvxg=
X-Proofpoint-ORIG-GUID: 0iVz1MMjg1mg92z-0oju3n36A3WoI9_j
X-Proofpoint-GUID: 0iVz1MMjg1mg92z-0oju3n36A3WoI9_j
X-Rspamd-Queue-Id: B511325AAA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96806-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oracle.com:dkim,oracle.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

On Mon, 12 Jan 2026 14:53:13 +0100, Luca Weiss wrote:

> Add inline-crypto-engine and UFS bindings & driver parts, then add them
> to milos dtsi and enable the UFS storage on Fairphone (Gen. 6).
> 
> 

Applied to 7.1/scsi-queue, thanks!

[2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings: Document the Milos UFS Controller
      https://git.kernel.org/mkp/scsi/c/cf44b6369b83

-- 
Martin K. Petersen

