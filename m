Return-Path: <linux-arm-msm+bounces-102442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LuhDN1n12lVNwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:48:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB543C7F07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3970B3014C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECE2350A1B;
	Thu,  9 Apr 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZkO6wPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXnJjKG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816BD346E4E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724398; cv=none; b=RILFv1hHXkLh4DDziEfr+xTgovql9jAbIdahUtiOX9vwpMK68tMhtNiq2TgsjFRPDL3OE/5sLk9+FisPue3rWSxO2Hudqzi2vqPL5roJQxdNbfMY/+KD9wg0Yh20uRUp84ORt3NNsIDegElOAZxbx0vgDoem2xGMr3WAbolIXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724398; c=relaxed/simple;
	bh=AxNG1SIV7H7xzS5SJWkcy16sFVfw9C5CQd54+0oHFM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kuhn/s5tkiwrnSHzgvCmJgntpsS5Z2scpjkxjykI1DfA0w2WPreDyrC2/SayuABpa6+OjKhgmyPLdJCDfY2aPheRQ7rp+x1HE9dSuS/uhxfzn1445k3XI3kvWn3BcQFLHX4zpu5nKV4lrEJ/s+JD3UNkpIlGMVgnB9hxYLsI3KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZkO6wPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXnJjKG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63956ICK254985
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=301Gg6hMOuIp6rGsJp6fTc
	iwq2YRnt1osADTG3aUyQg=; b=jZkO6wPTH3zG/n3IfY6ZBHHCOh1ckTVf5J0Wq9
	OwjaFwJQgVu6tpXQ9iEGWVSUnoPp13JtAYy5OKTtLYMgYAEiv7BQZNkjBcwvaAjK
	xn7FVNNdI7WWQfrvX7XH4TUY8308VazCxmdTp4BPBDM+R38IUtJfFUkP9AbOqIr9
	ent+Ci+/3FY0eKgPVzL7Vi98nMUHVSH8AOV80tlmxptaH8PuQ51VXhsI/MSlsiB0
	hxPYk2ooA/9d4YBr2sjYUVyOvhyAYnIyT+i3yPqc5yuLxLxFo1s/STUoya78ZzJ5
	Zz1KDvvYg+Kw+XdHljALuLotzcuwRrTJw3Jq5ACX8HItUhUQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6yb7c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:46:36 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12711ec96fbso2794389c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724396; x=1776329196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=301Gg6hMOuIp6rGsJp6fTciwq2YRnt1osADTG3aUyQg=;
        b=CXnJjKG0jHWpIkEZRRqloujO1yhynj+jT0fM7nhTbLcLe9GuBPijCbYgMuqaQUcFMU
         dobodtkWTUxSEZx3CfHHSyIvI3pQJI5mZW3EOwgcyJ2FYgy6WSsQlTcbZ+iZoHYYune2
         UPPLWkJW7nFT6OJHJ8mnT9ohAgbzZOBmxykG86I2rHFGAS3nwaYcdhSIO8P2OJfBZqO9
         /x2CLrl6tPDA1cznIknYV7UtaitIZkZRzOSYoOGv1ZK6xfyK27gMNi/QZpJ6RI7PEuiO
         ft2SUKg8sl+p1ca2aWLxGzVd608ujLUUm/tyOrdQIMCLKWoNxFR+HT5v9dx3nOlTqNHx
         a0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724396; x=1776329196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=301Gg6hMOuIp6rGsJp6fTciwq2YRnt1osADTG3aUyQg=;
        b=hm04ZTTqq5U9Z2SyHUoqkOQschK9A/ifaBM9fb2k9b55trDevj6/hGV8raoRNvXFvZ
         WDldXZ6HEqalR3X3PPGUrLyxXxo2dHKK/YtqfR+4YvsohA1hX/lgH+LCgz4FXXXW6Zu2
         sQ+5WRPZK6sflYJoaItPV2Z4o6hXmbF3i06mXAvFjxhOF0TqD0MC9SluL+zn6dGB/c9w
         bkn9KIGHbLQ/ggsCM/NSYjD0GhtF2qmZ9HFa+PFpx3EFwDuLJ/zcBWNm4Of/oCz0XVZs
         OYKi018nWdieWBbSw3mZGeRr5ZQhO0Y06xvKSwI8bd0BP7kLMMoMUpScyFrgC4HzTPKa
         C2rg==
X-Forwarded-Encrypted: i=1; AJvYcCW/XDrPjU0ITmCAX5tyPsuTuoZMQIk/KBG3U+chKcaNxpeW1i5clH9+VbA6hUYLIxU9F9R1pbKZPuQLf3n6@vger.kernel.org
X-Gm-Message-State: AOJu0YyVY31CsAs656Y59iwgtKclkywQtZNXK0+1sG9Hd3xj0UWJUKZK
	3R9mrWSfH7bZ6DaFxgJLj64X7Rvn/pNiPuIy5VoN43a4KnjNH1ZU3Quy38T3TaOv2aFhOb6H7hx
	f0GlGgyVWQ95QBjStlEPfvOx88J/TfckEhG/JTmqI+1tm/S2QNFG9RLaHzebFnSNEqBq/
X-Gm-Gg: AeBDieuhtKhzsYPaWs/Ugcy97JDH77X3I2oKKLGud0nlwl4mDCwMNjyHoCRC0nzb/eP
	ZLYvarCLzeLhA2FMFD0O0YJPEYY0foZ+F0ZVzi/ms1GwgIROVthn4C6BvWfS1CpErVt0a9hN20Y
	1NO1znJiRATpkSSCPgA0ks3BjpBgyr6ZQXN2Z8Vo0cAV6Ebq1TdvqSAlCcTACgN9Vd+dOezHr0I
	SPZdL4AuncRuJX0ByhM4oPcEvQfUtI+rwLYWmA3f/4whZZj0AINq4nlRGXF2y3hKhoCwPQJpRoW
	y75gQ48Rd8li2YqJbGNryDMAhKucIXURgBA8l/eR0WnWRwYLGN9Y37buoJ0YrsSKpEINvmexLIL
	o91L6/OmNmmaV+qvQJ75ZsdtZUpbpj8AIX6+0C7ajW89NMcJHjDZJOARc0cGTdY/RXklA5Z4I
X-Received: by 2002:a05:7022:ea28:b0:12a:713b:896a with SMTP id a92af1059eb24-12c28bfa04cmr1674741c88.17.1775724396067;
        Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
X-Received: by 2002:a05:7022:ea28:b0:12a:713b:896a with SMTP id a92af1059eb24-12c28bfa04cmr1674726c88.17.1775724395450;
        Thu, 09 Apr 2026 01:46:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28451931c88.10.2026.04.09.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:46:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: improve robustness for rproc_attach fail
 cases
Date: Thu, 09 Apr 2026 01:46:20 -0700
Message-Id: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxn12kC/x3MQQrCQAxA0auUrA2kUynWq4iLdCY62UxLUkUov
 bvR5Vv8v4OLqThcux1M3uq6tEB/6iBXbk9BLWFIlEY604S22pKRt41zRXV/CSYZ0kRlLNQPEOF
 q8tDPf3q7h2d2wdm45fpbxeYCx/EFcj1lxHsAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724394; l=898;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=AxNG1SIV7H7xzS5SJWkcy16sFVfw9C5CQd54+0oHFM8=;
 b=W82ysG/fLw5x67VsUNOLWoVhK9yS4LWwmdrxpu0R5Nu4a2CFpVFLTfBItA6+n6sLqzmXUPGkJ
 ycxe+9PT41jATvo1I6E2Yi9QAByupWGP1Qrr4deV7w+KTahlgRGfsDG
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: aGAg-qO11hSr8QphFVQ0mbPSHkeBFTEC
X-Proofpoint-GUID: aGAg-qO11hSr8QphFVQ0mbPSHkeBFTEC
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d7676c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tP0EvHTfAmNnroA1R7sA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NyBTYWx0ZWRfX4YuS8cwqng5e
 aqMwtbax15Toidl7lpsOmPwmIS6ZpU+mC2n8r5GaShw+tUxGdYRsZRKxLRfnUtYv1Wq8x9/YMQa
 Q6gEv+fq2WOq+uL/qsRyHAjMvtdvOhulv+Ah/s/KrMtaADVwAXR3+KEYspAE+kbk2eo4vS3447m
 2J2BnmHbr0ZTjB3qW9910hHdmTFa1itxQ3eYfFtHxzIIA1QWhUGy393vHKADKkN/oY5Zdnp38eS
 xJuRKkx0nS7UWKajJsKkJ9hOfc8mM2rB5VTcOZebMcDFo4DsMvXW+pG7uKx9i5LiSptyZJ+4GmG
 K8WfHRVykyRm5SQDbkJlC4Nqu5qLIn5CPOaos828vF+k8W4it+Db7Pd0vNXyseg+ZfffgGpwp35
 mPp2HIvhOo6ZvNJJRizttD01TuDL95y1UfZe3KpVv7PbrE3mX7NLxjJ9Z0H4CCyEwWKBbeq8mcl
 i0uuaSEWqUcJ+aOqjOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102442-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FB543C7F07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Failure in rproc_attach() path can cause issues like NULL pointer
dereference when doing recovery and rproc_add() fail, improve the
robustness for rproc_attach fail cases.

Previous discussion:
https://lore.kernel.org/all/9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      remoteproc: core: Attach rproc asynchronously in rproc_add() path
      remoteproc: qcom: Check glink->edge in glink_subdev_stop()

 drivers/remoteproc/qcom_common.c     |  3 +++
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
 include/linux/remoteproc.h           |  1 +
 3 files changed, 16 insertions(+), 8 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-rproc-attach-issue-2e3290d6d013

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


