Return-Path: <linux-arm-msm+bounces-115243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TxrvDYzXQmqkEQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 22:37:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8016DEAC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 22:37:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z8dbbSdS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jS2eqW46;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D762301CCDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 20:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273EA327BFC;
	Mon, 29 Jun 2026 20:37:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD3A36BCDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 20:37:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765434; cv=none; b=sdUmMdwmcUMhmDUURl7LAQ/7gE2KooyC2nRhyw+JPfwiMH7WpNRHduWptJD1SIH05ur3Y/YeaUDvlmaqELuuLcuaxZyHWhLHQ0EgMv0FfT7Qm15XBfkhlQGz4crk7IztEZw9fmvUm+2IE8ZtZ8e8T77sf+wsskA8+eEcIxIj9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765434; c=relaxed/simple;
	bh=NoBxgTpHGJnabz1qe5DLBuL00WEPQMYrLj1bACR4WDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R0DlhJAo+8gVc96tizyWRKpy7srxr4YWMAj3PHbC3O5SJyI09ZIumWT9LLr2pCvh1ZVUJ4OKa27V2L+mfhISz1OO+puDHq8EsB0Qnp2r4C8XN164XhFBhPua2941GF1Hi20ZGw+qH48gFhE2fZzNLmPXC6IKObW0BnN61EAuv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8dbbSdS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jS2eqW46; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TJsqBK3867290
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 20:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3tNDKhsz+AVRDAEgoanN+6
	KqNZh86ze/6x9MuT1XmOM=; b=Z8dbbSdSwJKAmhn+bamHo6Xhxbnp8yhQGxcrMN
	Bspp1t9/qsiu/pIh7P9rgmLLxQoccHHn8Ekq6veGeOgcW/7VI6iTPnIySJg8QwLb
	bld5FrZk8945FbLFOiSttQbdsA/1zUk30fZEFVvxt8twp2J1SwlREdSnM5n/O6LL
	PwstPud9xOJpnVusnJ9QEZzmkiYsFBy25iowPcLhQmsFJGqxe1lto/erDeoQxWLx
	RyTIZgDe124oBkwVOdS8siafK0lTp9nDYnJEyCLC74t6FGLBPE5MW1Y6NGe2e4L8
	CopYOY1Prd2KkoOD2IKQw5kS2JttlsGij0Ydr4VwidSB+3bw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j04kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 20:37:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0a27ad86so9206668eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782765431; x=1783370231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tNDKhsz+AVRDAEgoanN+6KqNZh86ze/6x9MuT1XmOM=;
        b=jS2eqW467g+1eedKpWNk9QQfiwt7cxse5UGs06S7gBLyeFIdY5Xjs/jcWawZwmBijC
         xKF3LVV7+NCKYmbIKsOEWBih7shARzUrJsD52Hgdjd0HnlQv0En3MwSHrEQw0xKyoHm+
         weMLymIHhKmCIJIq52XDbW5zU4qA6ltA87m7fr77iWXwBvudcMWzUDL8DWLVldtAYYgO
         RMf5fThKYrYqofObPyUGJdnjc/AB3cfDu6G5A+YJlvjS7/+YFwatgRYDECNEY6wfmQLF
         IrwXvOzw57M7w7X4sNiNlaOoCwJlu4GQ8YGygYFfkVFKX6M2Cs0TdbGptKMnJv0d75pN
         xyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765431; x=1783370231;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tNDKhsz+AVRDAEgoanN+6KqNZh86ze/6x9MuT1XmOM=;
        b=otCVY5gxaYMAL02a/7PLlO2iNMfsDNcK4PVL2vJLIS6Ti29bl/MKNlVhWXpx1FdJk9
         xR/3/9t/sh3vt1RHgXXga6j4+v0jLos/oC5xokcx2tYCojqtbZDMK33nipedcCDmv00k
         hMQhHsmYKdQEF6YozMAMSmJqXb6LKZhBM8dVUuXnqUIW16Z8qmAJzS7yi/sy86/5OTDQ
         Z72n3u8TfFu7JLgiFb1TjbjBzGp+uyq/oFxvP+qIxsA18oNHu8xiERC9G6GG/YgqtRJx
         oEomvieCwvDM4JyOXaKF4oqFvteM2ZmqikJxtV1kRg+yNPfpCiKsj/Dw5RUTxMXia26Y
         1WiA==
X-Gm-Message-State: AOJu0YzpsgNoHodbI2OCsl35Y0m1VwNfawYevGVoBk2dk8b7xRQFYxld
	w94GHscXEQzLZWHz2lyLN5bwWnstvQCCqXnx2DeYX/8Pu7FQ5P9/sjF8tx4pvcVYj1lnCNchHv6
	NZSw7PXTTQYEs/JlYfwEpUvXSwurgz9kF3x7woIUOtg7lJ5vWxTFAgFVNjWglg3CL5EJt
X-Gm-Gg: AfdE7cnszZJJNXQFfxOS239Ur9HrMkJheFn65XIy0pwYe9Jy3LHfVzMxqJZ7bMEp6I3
	4P5fN4tbNjKgtSiTGFzhcTjyidNYFmLByYC4KBaegKcBuOwSOr6AhtIj11f8mMlfvgr6bGtB4a1
	64mZUoZGZ0+ETBVpsWj0VinwauIo9L1+UTpqzZdrzy1nixni8tdRShAHd4iNSW99agMD8Py8q1e
	jZSK2HjJA1/+9wr4dssq+R6Ew1dUlRG5BRIi7yKq6/zN3vXDi+U9Q+ZVxKG+sTX2YineJ+J4RDk
	FdHZJgfV7MlzDqAMz/zHoKXXrVUhhTzxBscbZuVONv8dQL/Gfd+FKMLR7Y4vK/a6XpINpiDGknQ
	lMBFF1+1VZ6uqc3PwaNXGgN/HS7AJcBVdGlBmRvp+C+hKuLPUgbPHzGLQE1V07vUW
X-Received: by 2002:a05:7300:2213:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30ee131ae36mr624161eec.10.1782765431303;
        Mon, 29 Jun 2026 13:37:11 -0700 (PDT)
X-Received: by 2002:a05:7300:2213:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30ee131ae36mr624140eec.10.1782765430814;
        Mon, 29 Jun 2026 13:37:10 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab20921sm699283c88.4.2026.06.29.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:37:10 -0700 (PDT)
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:33:36 -0700
Subject: [PATCH] pmdomain: qcom: rpmhpd: Skip retention by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-rpmhpd-skip-ret-v1-1-d94180ad9a29@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKDWQmoC/x3MTQqAIBBA4avErBtQ+yG6SrQQG3OISsaIILx70
 vJbvPdCImFKMFYvCN2c+DwKdF2BC/ZYCXkpBqNMr3o9oMQ9xAXTxhGFLmwbZU1nvXaOoFRRyPP
 zH6c55w/neP5NYQAAAA==
X-Change-ID: 20260618-rpmhpd-skip-ret-430a25af1cce
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782765430; l=3111;
 i=mike.tipton@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=NoBxgTpHGJnabz1qe5DLBuL00WEPQMYrLj1bACR4WDk=;
 b=yqJL8wqjDaJeajSkR2uRKj2NtChl4CnBuVvnaM16A3rn6cAB3/FgW++axnEGTBFLcZi4eK6KM
 AavL13yNnybAvKqrBD8jcOcDrcr3SMG2mxWdich/vTKBV9o4Rvwobv5
X-Developer-Key: i=mike.tipton@oss.qualcomm.com; a=ed25519;
 pk=vHBMZwmy10j0Vmh8WgVvBGg8Pt14yalDIN7LBSoSRZw=
X-Proofpoint-ORIG-GUID: xcG6ONKpjJ13IROP5kKf-EWAR8kmLrSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE3MyBTYWx0ZWRfX8PRLaB0Yepem
 xFGdTSOgNcEj+m3w4w8gyXcHjoKVQ8KjvVlPF6LL4fcu/ufkL/qbrrpLJAliQTnPQEF69AqGB1o
 ASl8UX4p80tv05whNdv+AxIU8NuJt17iBQMz5fsq48G7Ykkb0+wupz7j3s9YiiFJ+Ua7w78ZHbp
 r+2IoN4qD2kerbFukMK0ggH/nBr3HPgXJDmXa7fEvBfDj4fLvEIpMWK+jwn+J4jyQPPlqVxd8Ks
 sfq5634bXRgrPx/wliX2r/2+G96yJvL1lMOYaAMFN0zCYCLWWtIlmJpw4wwBKRLsmFj+fymLLAk
 8Vz3/Cy0BmWXyZF6A9Rx8ChHjuVZmAfRN2wNwPvEpGXbuAl0vKbC8uK96k6af5E5VyuXG6a1akz
 s+19IuhFi+vY/lNV8NMcWA0opEDskOENX6reUZXgAbIa3BHpXS4YgAQFwpv5xc++qkihYPBiMCv
 QRVn0mW77dQO7hEsGDA==
X-Proofpoint-GUID: xcG6ONKpjJ13IROP5kKf-EWAR8kmLrSC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE3MyBTYWx0ZWRfX7kefHt4uLCq+
 4jHgmyU4jdHYscRUNZ1+LGHkqa24DcsVzhPonRiCjZ3mpQ1UIcrpvGFfYq9wflJFtIUqSn2FXwD
 NGD1em27VzDqvddNOXBcG92MxZi4pcE=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a42d777 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r5Zemlu_opgY2UB85KYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,m:mike.tipton@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B8016DEAC2

Retention is very rarely an operational corner. In the majority of
cases, HW cannot operate properly at Retention levels and so the minimum
operational level when enabling a rail is the first corner above
Retention. A small subset of always-on use cases can operate at
Retention, but those aren't controlled from HLOS.

Currently, we allow Retention by default and only disallow it special
cases. But this leaves us open to various failures when the PD is
enabled without first being voted to an OPP above Retention. Such as
when a child GDSC PD requests to enable its parent RPMh PD. In this
case, the GDSC would get stuck powering on.

Newer chips have started supporting Retention on rails that didn't
previously (such as for MMCX). Instead of adding more special cases to
skip Retention on MMCX, start skipping Retention by default since it's
almost never desired from an HLOS perspective.

Signed-off-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 63120e703923..35c598b33ac9 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -41,7 +41,6 @@
  * @addr:		Resource address as looped up using resource name from
  *			cmd-db
  * @state_synced:	Indicator that sync_state has been invoked for the rpmhpd resource
- * @skip_retention_level: Indicate that retention level should not be used for the power domain
  */
 struct rpmhpd {
 	struct device	*dev;
@@ -58,7 +57,6 @@ struct rpmhpd {
 	const char	*res_name;
 	u32		addr;
 	bool		state_synced;
-	bool            skip_retention_level;
 };
 
 struct rpmhpd_desc {
@@ -191,7 +189,6 @@ static struct rpmhpd mxc = {
 	.pd = { .name = "mxc", },
 	.peer = &mxc_ao,
 	.res_name = "mxc.lvl",
-	.skip_retention_level = true,
 };
 
 static struct rpmhpd mxc_ao = {
@@ -199,7 +196,6 @@ static struct rpmhpd mxc_ao = {
 	.active_only = true,
 	.peer = &mxc,
 	.res_name = "mxc.lvl",
-	.skip_retention_level = true,
 };
 
 static struct rpmhpd nsp = {
@@ -1093,7 +1089,15 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
 		return -EINVAL;
 
 	for (i = 0; i < rpmhpd->level_count; i++) {
-		if (rpmhpd->skip_retention_level && buf[i] == RPMH_REGULATOR_LEVEL_RETENTION)
+		/*
+		 * Most HW won't function properly at Retention. The minimum
+		 * operational level is the first level above Retention. The
+		 * small subset of HW that can operate at Retention isn't
+		 * controlled by HLOS. Skip the Retention level to avoid HW
+		 * failures when the PD is enabled without first having an
+		 * explicit OPP level set.
+		 */
+		if (buf[i] == RPMH_REGULATOR_LEVEL_RETENTION)
 			continue;
 
 		rpmhpd->level[i] = buf[i];

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260618-rpmhpd-skip-ret-430a25af1cce

Best regards,
-- 
Mike Tipton <mike.tipton@oss.qualcomm.com>


