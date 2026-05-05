Return-Path: <linux-arm-msm+bounces-105952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANwFAHLj+WmlEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:32:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 658AC4CD905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D9630D3DA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CFC426EAC;
	Tue,  5 May 2026 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAaL/5Nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcB4USsL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED22426D2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983920; cv=none; b=n+5JdTgSefYkTgvI+Sjhg5XG2kdWjyYMzX08Esna3RaY2BG9rgNKA/S9O5y9YZGdhNF6SLSz73cCt7rw30knY5i6beSWW4CAkQHRaWGUV6PT3fUWm0b6UR6L7pIdL2B/sTCvXf4a3DJzew/JwEcKM7aDaM4Ap9a/eYF0/5gToM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983920; c=relaxed/simple;
	bh=85/U6iXBPakM0Mmmb5NPMjAPvvGqfJ6KU2VNXgLZ+Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARgt4q0bKKAwdVKU+amIaVzgiFNSQKqCRrbQFrwVIxk6FRh8QnMNxZWveXYri66PxYll08W+2I2wywJBPf6i66XVdJ3P/WkHnjCkw8UNPzk4nQar61EesgVd2OFkXxR1Df5TkyyF6kR0kqU96KgP4nJLYWT4iqNHlUPXSIlmqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAaL/5Nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcB4USsL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6kaM3091762
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=; b=RAaL/5NtaOtf/UeJ
	61uZt5QhzCTyJJJm7qnLWJcbdhiiZeVsNfEjlUC6woArxVpPwCTBsn4awDbGUihp
	27m2eWPYJKNON/xUpn+L9hzcGnm89BUF/dnxHZtnlwwB7mRg5QKxVDIu85W1vUn7
	QB0G5Gy3ZDJcxTkbr8k10lpd0xaDWK/i46+Wk54vw9AcceF3hjVkWUXrwgbYGcvn
	sYyHqRHQyheK6Q6aJ0nv9R0ijhpT0ota0WfayP1o1VrX2YDmmGIoU94djvlKHZ/w
	eojB50BIDZ26n5gv9+YFMedY9sIeJD53+3gtgYK5tppWQq1qaIT6v+7Hp/0RUdWW
	h/l2ng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct07fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:25:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e8fc8af18so477304a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983918; x=1778588718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=;
        b=bcB4USsLrSCZD23BYRp3R6TWmxFWls/GiOPg/+r4Q7HQ6ctIcQadcTgzjc6Iug6b65
         2vfdhhpN/5V7O5qUDMcsqdXeybMAZh7LHU+cA3EKozL+L9wVbcwu1lRfEeenxFB4vxKf
         5SnSzqSiSMfsiFIGqZgYX/TyL1tsgqaxbgfU+b0pBxdpUcblALsQyTv0zkqwFCIxHEAD
         YJxJ0+yqb3l4XF6TccAiYO7odPhBGO/EqfHj7gvpGOSbexgmWj5PDdwJBVPY9Jngr41u
         E2Sblvz1KVwAMCKzSmr1758GiQ7cXlcd1mBhW0ukiR4/ZMJA4SBCe47EMJUw9utMU40r
         z6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983918; x=1778588718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=;
        b=VzdgFZXZxiXnf4qpz2mSp6bFh3kXqqeZimcucyAtqLO09XFP0n+63ot7wJjcMRLWgO
         I8Q1EIxVlOZ2TiCXfj6xKP3CaFrQOvV8al5stR7euQoKbwa/27tkiRJdas0pHzQgdbOD
         sWpOzRbfZP7XmmQinVKLrKWp6bsPl4bdzfMlQxm+LKLypF3AMi678jVBIA31PtGHSP7e
         ay1HFPGlMqeXcmSlNHbG2lSc+X4iTi6Q7TnlGtoMs6SswkP6Ltj7n+ZMaPSVX2akCPqn
         KYOsvBmfxRNxSKc+YvQ/g5AmICqeRg3oWq7G1StO3+Yo1o0kOB5CcRh3SpXF+Uh5vGUv
         tuOg==
X-Gm-Message-State: AOJu0YzlO6uRIdDQGbTAd0KP5gqVUJbJ4wq+S4Nxe4aoFz/dGHt73pzg
	bbQrVy90vlUyr6XPNhjKDZXVa4rWcotk1mLcwpSYLAeAlNcxKnGiL0GrkqESu3S/5mURnYQA1Cl
	ku09msgUaO0AFysFDDk8WTiv4kk+ozS6ttmBhQ2iTkR3dlmGX7Z/0hLLjVfr5AP6kY+35
X-Gm-Gg: AeBDieut2ilHNrwIgU0GeyT6l4PvSKOXx0UaGdaKz6//yWz1b8lDSrpMKd4I0JGdJb3
	H9v8wwfW7+TF5l83h+z3vd/2LxRx6NUGsPcThb2oN1sr7udPZ9CqeILNEMJ8HbBF9HlNfTfQkYm
	iml9fWPuQ1P+MMHwwU0qajrMjKfW+QS+qOclJD8ofuYPQOwJqSuxucKrdwgivcqt2AKTTMys8s0
	JVALeEjJJNU5WN0cxrtDOtCdaCeBgxR705Am//VqrvtENr916GxYpPtxVVXWcoU/t/E9BR7YvHO
	uCwVMhs1euy2jP2WxHQMIfVHkmcSFu/PRByFaXrtq8OUihtR26IPSubSPLbx848G45X0iQF1Qfb
	9PLGJ2l3nLMuU1Jn3kyp3ixYIYX0SiMcpBa2BXrj7urUTeNpp5VwUAiT5cNq5etY=
X-Received: by 2002:a17:90b:2f03:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-3650ce1146dmr7079550a91.4.1777983917987;
        Tue, 05 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2f03:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-3650ce1146dmr7079533a91.4.1777983917473;
        Tue, 05 May 2026 05:25:17 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:16 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:48 +0530
Subject: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=1723;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=85/U6iXBPakM0Mmmb5NPMjAPvvGqfJ6KU2VNXgLZ+Sc=;
 b=uAueX0E+J7mO3vSlmsfq2s5T3DTennvda5xbsWtVnYuvom+4lJANe1HZ9CTFuHCFI9bv0MzJh
 UVBLIZVfoxaCfAJSibykZ21OmsQSeQN479uLTCjjakaC2Y6xWj7Te3x
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-GUID: SWQwdPr5E52FCGdkzhnKUwMKVnkx4Fpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX0GJJ9BC5X0mv
 YSdQzTeqY18GXXyv1yxUAEWsGGJVJB+JWyEVMiUnimltJcABq5jsKYqwxTWWy3REcfCJOO++t17
 YbbUVemrfhbDlThUf3lt0q4zSbtvZGxGIaa3MG/p4A5KmjVgX6ZG6ECJFYnRjvByyAsGRjiRoQl
 WUN6YrjDqsPKMLMctOehLpKyHpuCgd7zZ4lLMFmXKC1Yf0FTpT8WpAL8xJdwhErpl9fdg9rQIJb
 o9bUKdXWG2YvJvVpuZNXgqOQVKQ+5QAXUU9dko9yJxsgIib3ngm6iFm4nKjni8GfZIp/TbnBzfN
 59AR0/lBFo6rDULsZy3PZh/PiN3JNWAaGg/1huGfBoIXbphAKhDRPPqz54S3p9nwgKX594v+VPm
 TApJ/+CM5LiseFjhnG8dZMWwC4Fp2WfKFrXVSvFeVVWAZj6sxN4Sj90ncKv3Deq7eFe0JGh0Gyx
 dVqsvQzHuf2fQkDYHWw==
X-Proofpoint-ORIG-GUID: SWQwdPr5E52FCGdkzhnKUwMKVnkx4Fpe
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69f9e1ae cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y-mMqNAVNQw5A1T741kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-Rspamd-Queue-Id: 658AC4CD905
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105952-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The driver unconditionally calls panic() whenever an unrecoverable,
uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
for the user to suppress this behaviour, which makes it difficult to
test UE injection or to run in environments where a kernel panic on
every UE is undesirable.

Add a module parameter `aest_panic_on_ue` When set to 0 the driver
logs the UE and continues instead of panicking.

Usage:
  # Boot time (kernel cmdline)
  aest.aest_panic_on_ue=0

  # Runtime
  echo 0 > /sys/module/aest/parameters/aest_panic_on_ue

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index b4f4c975da1d..9ce782a66edf 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
 #undef pr_fmt
 #define pr_fmt(fmt) "AEST: " fmt
 
+static bool aest_panic_on_ue;
+module_param(aest_panic_on_ue, bool, 0644);
+MODULE_PARM_DESC(aest_panic_on_ue,
+		 "Panic on unrecoverable error: 0=off 1=on (default: 1)");
+
 #ifdef CONFIG_DEBUG_FS
 struct dentry *aest_debugfs;
 #endif
@@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record, void *data, bool fake)
 			aest_record_info(
 				record,
 				"Simulated error! Skip panic due to fault injection\n");
-		else
+		else if (aest_panic_on_ue)
 			aest_panic(record, &regs,
 				   "AEST: unrecoverable error encountered");
+		else
+			aest_record_err(record, "UE detected, panic suppressed\n");
 	}
 
 	aest_log(record, &regs);

-- 
2.34.1


