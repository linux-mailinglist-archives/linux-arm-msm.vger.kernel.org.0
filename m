Return-Path: <linux-arm-msm+bounces-103085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMR1KosJ3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:31:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0A3F7F2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B48B03010232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5318D3C2770;
	Tue, 14 Apr 2026 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Arus0ye4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epHSPUKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788B3C13FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159110; cv=none; b=J5xR24SDVGX2R5QKqOs95kWUsOjav9UKirUxolV7gJTlI1kziHwI4Puh0+nJblpebjEmo0wX3hA2anHdXlbvAWhbF+Kv5JXehB4nJb0Qosahw/BBa7jyF/krF5ow1/pIqbwM22Imx/Rb+wC8c8Al4aOIGYAznOyfjX10xNgxezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159110; c=relaxed/simple;
	bh=1DV8wn40yloWIVqC625tjVcC+VAluRD/D30m/TowZ1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I57ke89wIyAL/+H1xINMTYrkTIa4hE/8VfxxhckZKQ0p9rc2ZQx0Hr7iw6E3nB0FDInPR+t6WjQIjABgNiQ82YYufDosH1CxcBIMVzQ+o8Z4uID0UZjkgnReHlxf/eAqgtY/WkffMkIAKQK6M+2TNi9QWNxPNWEhQE/PgzHzIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Arus0ye4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epHSPUKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hgoA361498
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t4I0ceYasGeZcIvy+3li/bvUFtuLBCMTugD
	GFLqQGMU=; b=Arus0ye4ey4ZUZbTJzarhWNRp+qMDelPujH3McOgzHkZaumyeOe
	wU+mJ7ZpoXScQM02nDamxjt2m2MkOh5Jxg1qPc0etga+N+8wuverdCm8hC6fChvF
	Bb0mvIv77+GRinPiQHNj+nf1PDQQSazkcwm7NcalBCh1Fojv39kKq/uRGx2LaLZA
	wbyjSr0yOCvxioe8YiRxwMqbmE4GluB45H+lI6BOgl91zqpBnx7brc8HGlXjIMTN
	e8Nrp1q6md3CeYk9R9y0xScFpcKFQ1R+Y/MtcjhT4oanU1L75avbUwGxqavTZflm
	wY0TYZb1vPDH6FX9bJRB6v98eNJTKo9TchA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t3gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:31:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b0e04285so2332120a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159108; x=1776763908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4I0ceYasGeZcIvy+3li/bvUFtuLBCMTugDGFLqQGMU=;
        b=epHSPUKoc45e6dr+MIFByVkyTxhD+nVRfB8uY0h860OYtOjg3QtjXQCzwKoqz7IhdC
         vdd8z3HmDVdeDXKqIav7k5iL5Q+8uNaAxXljIXNBxyw4y7YIA02NNeMQ9apVQzK0VPLc
         R/+dVzx7ZZQKVbRZZTRmsjPzeuIsYOwgyEslgpXv4vzUW60m2FOP/KwNP/X/CgGatMHO
         v7KM3HfypcSVAImk+rnV9Ei0rUSHKGjTtjQBWvdGaircrjhyxJdjx1wz6FPJVQh4xZxI
         KMIdFfe3qptMPXLrYLSRmcsbBfnS5TXgiPH1yV0SRldRePy2iRZOkvhYQZSQnMXkflNa
         Gc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159108; x=1776763908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4I0ceYasGeZcIvy+3li/bvUFtuLBCMTugDGFLqQGMU=;
        b=lCAhn23FliTdIbOZTeblvDs2Lq9q/Sv8zJ76Jlfcsbb9Tc7FOEcGkVIMbj4Ln9xqRo
         hUwTMW2gXZSYxf/xNgIeNiMHXPsR8mx5wGfHg0qlmIJcbO93RqsisqVUdM8a5bWNm0bg
         6or55v7yuXJE75Mi6r4/mS2fIhpdeZqw+xnxtKPVfPgrq+6TAY9XEqbzysKwrbKziTlM
         ub0Ge+O5qmOkjaEGrlSVzGRJtBVsu6og6xkYhiD4ZmiBkQTvaE1f4mfqIqlGAAdbk+tk
         hVPwM3B0dwWayVlwUsELQInaUeAleGCnC60BkgRPJB3dSLptm8hXOQ4JYqh8w7QWjj0n
         /nJg==
X-Gm-Message-State: AOJu0YwSG9QJdmLVsTbfCeKiwvmcQDF8/5O8INsyxEdDEDYToes5lVWZ
	KBZR8xdCuQ6qzdnBpkt4mOAi/YpfoY0gURxqx7turjLcU1or881sYwB5CCxxJEYXhl9bB/TyAwB
	G+s6ypik2+agT70mJ76ExfoGKL0kiCl8R34CYOw6o1FauiWjYMcy+IoVUb44CLwREacmY
X-Gm-Gg: AeBDieuT9HIHh34L2xLsQGfChwwI4/qEN+PkHJsu4x6kDAwY2OUwspi7PJkeaIUz5BM
	1Bn1Nw67QniXCaX4rVy2oaWp1ZhaKIC8cYt455CTbnGxL6LNv+2oMDBbONdwoOuiau0AL0Qth5k
	cSt+nWh9WYCcu8jCy3/A3ShTGBB1N8+HNYoNT7bv7dGxzZ7Ia875uVsIyX/xoHdU604asMjgGvm
	f3TLcQbtn+axy+TeKUWhRAUq/biwinpglgVPGSnAI/Q7Pa3Qsn/FDaHlYS6rTk09+FyC2XbibnT
	5fS6gUG9pz5/jc4oqrT+ZDvZd6NBx1KvnfGEjdckRfaZefhzGaBHPhkJDeiWNUh7aDNIvbY43MT
	Ns+SS/AbIupa49fwF2r0iffgGPumux5Fq3K2vEWYgn1mMPSjfc5Cd0A==
X-Received: by 2002:a05:6a00:12cc:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82f0c2783f2mr17093601b3a.18.1776159107557;
        Tue, 14 Apr 2026 02:31:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cc:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82f0c2783f2mr17093568b3a.18.1776159107038;
        Tue, 14 Apr 2026 02:31:47 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c35194asm17321642b3a.20.2026.04.14.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:31:46 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        shawn.lin@rock-chips.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V3 0/2] Add post change sequence for link start notify
Date: Tue, 14 Apr 2026 15:01:33 +0530
Message-Id: <20260414093135.660725-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de0984 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rbNoiXgGD7Sd92Kb1yEA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfXwzV1FJIeahu8
 qfo+6gZWk+BkKZBYIayXEmpM3R2VW7o+4m6CVjKKuNvp9BsRA4j3g7Q/WEaEX6aTcYKBFNNoIh7
 UOd9lIeSqy17dM89RK9G3pZMIyaP6wfabcHwFjtiyalH3XOiEg3NDTDu6uGYp3CnoTMu+E0cBHo
 dkTk2OMoQWKG3zRfrDYwiXC3M3mL5QBEcHGPX3PRLCd5fTEmFoUmmMmh5LL2uAGG1PtgjodBa3J
 S5/3qnxj+Wukn+cDhkdrYIzFf/SkoqiJm7TQ9YPHP1En9spn3+lpI7wbojr7CnxRyXSYc/tJvqH
 G8HYDPBbFovS5ClJjXCtHeMXk//1H8ZawEhOxLlHG2E6hAQYmSpgEDsCaF5+tbNFHj213fv9McG
 aav/om2sb5tzAMEwrDOq5Zp098Wvv1uu5azBgJC23+i34c7jUguX8tyFoBzBHNBU1VeaKXATmlu
 uhYiUV/uBXCKHAkUXRA==
X-Proofpoint-GUID: n5Qdhse1QTC_naQQwgzWUvYrKE3Hu_Go
X-Proofpoint-ORIG-GUID: n5Qdhse1QTC_naQQwgzWUvYrKE3Hu_Go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140088
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103085-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1A0A3F7F2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This patch series introduces two updates to the UFS subsystem aimed at
improving link stability and power efficiency on platforms using the
Qualcomm UFS host controller.

During link startup, the number of connected TX/RX lanes discovered may be
fewer than the lanes specified in the device tree. The current UFS core
driver configures all DT-defined lanes unconditionally, which can lead to
mismatches during power mode changes. Patch 1/2 ensures to fail on this.

Additionally, certain Qualcomm platforms support Auto Hibern8 (AH8), where
the UFS controller autonomously de-asserts clk_req signals to the GCC
during Hibern8 state. Enabling this mechanism allows the clock controller
to gate unused clocks, providing meaningful power savings. Patch 2/2 adds
support for enabling this feature as recommended by the Hardware
Programming Guidelines.

---
changes from V1
1) Addressed Shawn Lin's comments to fix comment to connected lanes.
2) Addressed Bart's comments to remove warning and trigger failure 
   incase of lane mismatch.

changes from V2:
1) Addressed Shawn's comments to fix commit text.
2) Addressed Bart's comments to remove variable initializations and
   indentation fix.

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 37 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 58 insertions(+)

-- 
2.34.1


