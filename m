Return-Path: <linux-arm-msm+bounces-103025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMA3OcW73WmCiQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:00:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214F3F5646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 222B6303765B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0A43431F5;
	Tue, 14 Apr 2026 03:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGgOiD8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEh2SDBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693D133F5B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139186; cv=none; b=N6ncgMxLEvSElpdnEg8M0H/fXJGyjSjwr1ZMBHTr3n+apvaGdrqe9ZsPViFWwJc775RLxA3TorsUtlGmYqdEBgCA6llKPK6BPUiyhkLeHyecew/9HVcNBhOgcPfNG+JEe5RAjpyfPg3HoxXgDxuqJdK2KepvwKkFGwayjnPthGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139186; c=relaxed/simple;
	bh=Ce9+SAsfP/+CFmQPP39cghQOIDmK1UbSevA/koZEFho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgtZvoahg0qhqIkClK3A7XnJv05E6wZxnvovL9deM5rahUORdxzJasmaF5BGZMsEv+LmEeV0kEmtCNnTcOEmseOqp9aPKTgD62E/3WMsS3ulhIu2t/fKguolUvp1I+QS6ji3nI4FIvwDCJVTLFJgLbKYDinV2PUotEFOJmUn5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGgOiD8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEh2SDBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCden3505276
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tIla3JLeBXd
	KNdERyaSRd2/nhYyuYQKd6ooLh2sH54Y=; b=HGgOiD8VPZn5JAlsOB1hVye+xNL
	rXK6NjTXhMgqTExImDuhgZSNzm+AAni/4YCSBJyvVXp+rrZHRhGKALxY8gSX1e9/
	au4X3BXNW3Z1UVD8rArcNOJ2TmLoiMkA9GwGd2Ab5BwDAR0MrvBQhvMvVV4lDZ8p
	Opzwq1LI20H+U0pRWTW10ZHNHAKrsLnvyNVR8/n8vY/IRMxtKtKqM42SKnE0kpOW
	RftD4Dse57sStnFLcvre19k5qFeC1JHroyhfI5AeCp91Zx9G20Jo0Ddv2ksGmg7R
	THePQ4ccNPOUUv4H3bY4EqhVMAnigf4rox7Bdo0ZiJF0TFugNpjcJhXL2tA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870gwte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:59:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so7147255eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139182; x=1776743982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIla3JLeBXdKNdERyaSRd2/nhYyuYQKd6ooLh2sH54Y=;
        b=gEh2SDBiedX0Bs/KVIZ/inmz8uOozpu9thJwIBwM5hMOwkkXF08ll1XrQovNWPKRo7
         An+PZsbavahluBooyUEm5sgie7apArgJhoUTBTra/UgaunIs6GB21s2eB3I4nPtAsJjN
         OgAnjQ/Ox8LPh4G4sGVw/9bHGCVwQz8VaBI7ye8TbBPthvuKV28DArt8XrFDOZup48KW
         VRi1b4hZf5IhlYEwHuVBsoX/8kmmvzjHmnpmGjEVhTw96MBEB03Dj62sR8o0xIxwOP3N
         L801PIqQC6lN6P9aaV3JhzsCWHwS8ezHVb7PVgpnRhCOnzZ4sckUUt4Hspr7lb27M8ap
         fCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139182; x=1776743982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIla3JLeBXdKNdERyaSRd2/nhYyuYQKd6ooLh2sH54Y=;
        b=MJoen3AIiLmclHes/jVr4WDsPyTQl1V4SC/0tTK9mdZF73s+hlqhcuKBvjO3IdHAo4
         4jGV7gYftuQNAfxTlRPh7rOnEED5Jg5iToupj5Cd+XiabFNZS8CLe2UGCm7d4/tejnlR
         WR/kBcbODNsa7Cm/Cfu//PHSMURPUJGk9G4J512X8CgZIU27UjCVJj+6lggVJuY8Zqe0
         M1vuqs9ZgskPu3OdTObk39ugGKEAfPd244aV3vtIMBovAXA1GrwFHArzMTrLVGj+lz1u
         cwtSy3DqiAy1dDDAegDUWpz6tIpKQfRvnEwuctPj96Ad0eCETkpPbhvu9w4FCodpTq86
         d0fg==
X-Forwarded-Encrypted: i=1; AFNElJ8r1mGGsT+eob5oudfUPcFcEI6KbquhfdYM8fnXwWz+X43Ap4UbqDqIPaXpg0SJcY14XJi5KsrlFcaHQGU4@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaAn+Jhqv6gklkIO10HlvHHRs3OjOfC7gVUGzJvvd0QdmJ/RW
	+bMCBa0gmuNPlvq4D3M3ZqZ9ZKIhd3mCnt8Jj6SX3TP+snSeb86lR4OmuBdPkIRov7xqQF0H3ty
	gpJJ/nem8VHP5cRr4RLlFo5H9vStmSMSJgp7gMnaBKlgIxgNhMxr4Qhcq2Dyz14i5nkaFh05xSx
	Bt2BU=
X-Gm-Gg: AeBDievbkCYB4VjEo3W6ec3cNNpcUqWXfvuBQ/h0RPHDrFxUFQQGYmfVavh0KwAYATp
	u1ssjulBNT9cQdhXKxESNJGUOpFcaZY/x3IorcKxllLeS9FsneNqCWgxofnj3isHv0QgXo0XOke
	+iCVw7XUG/ij7Lu5C3JKCglh/ZmYfMWRHS+2cewWfbYBtH8rRa/5ejSzH4ri4PMriAtYdiFsVu2
	55YEClJH0NY15f+tCeWzEtUvzKXTjAv2jKMbPwuUkXE5F95GbJXBQYwAxF5a0mo/eioum0tnu+o
	dXAcZ4gSaWf4rzLXD+Bo8eI1hlaLm4fRAjCJ1PHVC4jE9u2hGf0NjqMrcd6kb3WBRnkJbXPkGKS
	dDfGmeHJCwvwKoUKu+b1gXao8/viUTjVwK7Hr8GKaFnWKeLPyeb1cbDieqbWUGmt6jKhwplYUYK
	77Iv9+og==
X-Received: by 2002:a05:693c:25c7:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2d58678f385mr9574996eec.4.1776139181669;
        Mon, 13 Apr 2026 20:59:41 -0700 (PDT)
X-Received: by 2002:a05:693c:25c7:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2d58678f385mr9574977eec.4.1776139181156;
        Mon, 13 Apr 2026 20:59:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines
Date: Tue, 14 Apr 2026 11:59:07 +0800
Message-ID: <20260414035909.652992-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfX0KmSWok4fjYh
 V3sMFkHOfiHnLy6m7yduV68I55FltwBpty7YaaxB40lDuFbQaWf4HRLiLj98FlY8q7zTFWNS0DJ
 yFFtGLnAT9CQFgz25Cykd/1H4TMo1PbvsYR3yKIuIpCpmYNEe163HgZ8XmXzCDfQKKuu5/T4FJa
 mVvTffAR+oAVB4xJ+I6hhoxFOmPqztPFEmVD1PNQ4cbM54gjj8vgTV3ILRR2k2nbMm3ZkPYtmm8
 khiftmMIzgKowG0OYhiC1gSpHWObL11pUhRFAgY0eYQRkwKEf5seEI5BqDzcU3NzF8NQ/3lX1yP
 0cZTZIX63zA9QO6O9ZC52E2tzof2UTSDAvSFe1MJPHKTYzzKEDLhE3+5u8g/QZNgYXtwv7KArqS
 YR12THry313+XlMDnAvsL6/HGuiRz/8+cmFUMKHXOKW2CVBrQgmRAfDq0F4IfV4QFh4iu8F7sUO
 a8wpeoGVntxqYeYMBtg==
X-Proofpoint-ORIG-GUID: mnVIM82xe_4xkjT_FFnQ7olL2BwOhTDH
X-Proofpoint-GUID: mnVIM82xe_4xkjT_FFnQ7olL2BwOhTDH
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddbbae cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6qMARqoqku_Fr_bgoQ4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103025-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6214F3F5646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some RPMHPD_* defines in the Generic RPMH Power Domain Indexes section
were using spaces instead of tabs for alignment. Fix them to be
consistent with the rest of the file.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 67e2634fdc99..74e910150956 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -7,7 +7,7 @@
 #define _DT_BINDINGS_POWER_QCOM_RPMHPD_H
 
 /* Generic RPMH Power Domain Indexes */
-#define RPMHPD_CX               0
+#define RPMHPD_CX		0
 #define RPMHPD_CX_AO		1
 #define RPMHPD_EBI		2
 #define RPMHPD_GFX		3
@@ -19,14 +19,14 @@
 #define RPMHPD_MX_AO		9
 #define RPMHPD_MXC		10
 #define RPMHPD_MXC_AO		11
-#define RPMHPD_MSS              12
+#define RPMHPD_MSS		12
 #define RPMHPD_NSP		13
-#define RPMHPD_NSP0             14
-#define RPMHPD_NSP1             15
-#define RPMHPD_QPHY             16
-#define RPMHPD_DDR              17
-#define RPMHPD_XO               18
-#define RPMHPD_NSP2             19
+#define RPMHPD_NSP0		14
+#define RPMHPD_NSP1		15
+#define RPMHPD_QPHY		16
+#define RPMHPD_DDR		17
+#define RPMHPD_XO		18
+#define RPMHPD_NSP2		19
 #define RPMHPD_GMXC		20
 #define RPMHPD_DCX		21
 #define RPMHPD_GBX		22
-- 
2.43.0


