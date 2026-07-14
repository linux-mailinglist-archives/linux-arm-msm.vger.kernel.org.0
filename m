Return-Path: <linux-arm-msm+bounces-118936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SfjBMR/IVWrwswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:24:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E17511B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/CnmIJZ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kcMbC6Am;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B73C30E1FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFBB320A0E;
	Tue, 14 Jul 2026 05:23:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046EC327C00
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006588; cv=none; b=MNyv6qYbsbpe3Y5zrt3vsJvYybSPqny4jtay+cC86Vd49hj4UAQ40s3b30coyGPSmkfKINz+m11abUj49P7EO/nAcNiCWE69dVjGKF7bWAnUXH2eOSu3lDksZDviuf3pzMmn+yGna1mc8iRP619jm3MI4LSMuQQaJSjWPJxtrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006588; c=relaxed/simple;
	bh=ObGh6NEsLBZOcf4NGA8sXlRs8XO89ICGKMwC1CWLiPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HkIsJd81Lk2EWvu+PZHWTRKBIkqKTYp0tYJ+MrikK1opP7c9FmFJ4lkXaL6OhFGyl7cp9EvT9jKvDT1+1+uMYi7PY/k9RnAJPP3n1LP+qrWK/xp6O6d3TKTz1XdWJtlHRRy+9abt+xxNM4c05eY2WmW5+Vi10QsgtpzM/Kbbsh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/CnmIJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcMbC6Am; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3eqBj3365310
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEEB/D86gDiSJGQD2TDAe5j0jijCyWfLYK9R96IiZSs=; b=k/CnmIJZ3h/kdLTa
	NaW73wG15bCPzYKeSm2YU0iaH+JZJIlcp567TfZRIJxx07qo9qWAfTcxRYCpkSv9
	c0Q4tO140JIyV0Q8m3lLAK4FMZDi0vENTJlQMEXG+pLF0qYa5CcYJRSiUdyj12eO
	bYWZ+WOsWY634IIA2Rpxs4RyXkWB5NrIDg4KZSG6CyeKCS1ESGLwuhe6GktNN3Oa
	Y/nx4jlfC6hypCmA/4QEeRY82CW41G+8eWiTkbluxqYhQ0POdsyah/yomQWWcxUS
	gvm+QyQsMGAyIO1mMwOtlmSk/TAuWdticBf9gATc3By62deIjUXt2F3dpZzpGx5g
	o/Qz0A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde08a0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894391f000so1363643a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006584; x=1784611384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEEB/D86gDiSJGQD2TDAe5j0jijCyWfLYK9R96IiZSs=;
        b=kcMbC6Am0yYezzQ/Gb/UrBOAEQO7ZJR98J9BlrNBNy8FccMAYbbzd6z3RxSxkEeW2p
         PXi3zY0QeILpNf8W8FvOkrHHAFccnLS/uTfEda0L7T9bfsKLLhV2zFja+x//z8I4FqRS
         KvNvomYX6UeohPoe9AxIttsYjrh458tgAa2kn9TfHvylwg8q2gIcRCyccQFnkPKdgX3z
         eRGER8lGVtQCoQU0EmHDtjS7reomNCTejZqu/vvGQOwI14J93OpKE0DNncN5rLtI5zh+
         HhEGUef0G8dG36IBWy62tuuqMZGoMyACyZTws6cFfPyNU+VO2htTFEocfyECFXBDtTwQ
         MiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006584; x=1784611384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEEB/D86gDiSJGQD2TDAe5j0jijCyWfLYK9R96IiZSs=;
        b=bA0ovend7b+AVNPxaJK2aQD3J6yIdnwiKqweoko7fC2kvO+pdzqdY99ycj6wTn4/nJ
         EgRI/uJZmjoU9rJJEsuZgyml1ZFinxJwGNrwFFrrZY0/cxVETDJ3HUNjdwU0PIP+bAmH
         NjDVBPVT1gEzyA4fIK/sKO07R1edUuHiJ3Mg1NUMxhAdB8UYFfp/fVSo3lDuMSXWF/sQ
         fz4LUQMK5/rIh7HsKkR1KhXV5hG8Znfg7RfbctxPk4SoODosPJivhMmn0HvP1qF/qAwP
         dhgLj+yBEST7isgekXxYfsCJiVGUnZHSzpmQg0HV/qb6jXtsqe/p48UQeuXu3E+rzWgM
         bRfA==
X-Gm-Message-State: AOJu0YwPtDG6+tzxa1b+LSq4ZkrkReJjUwAdN4hB/FiqrAgnVEPAwJWg
	Gxxo4tkW5Vtew/ipCCYFMargSyBod0JcfzbdKBJyAj9PEAHyVhspnhtCtLrn5/RW0AHgY/FzWCg
	8EfWfn5NMH46aP6fu5W9Y2EqnUPonwVRReqho09giMnCbpfxVNPOg9Ego2Gk58C/weSrr1QKDCj
	0FRWM=
X-Gm-Gg: AfdE7cn8EaDXGD6z7nIdqUAnFPuKC6QRxZpo755u7l9TbjONeEUUNRErhXNjl/feNIe
	4HiIazrY4fDj4prM/pxgYwMQGCrjHRXnR5nkGA0d4+1s3X/kXpCYJZu4Lxmihv1W78dAaY8NrzY
	+WR6Cq8RJATkyXvpv8w64BJOezCYMNXAr04I5D/0QK6a/80iAzCyS8fAk07/YHM2W/PHoQt+upi
	RNDCqwyQN1LA5AR2DZNXGFCcjEtwVOXkwjavs5wCyzInTIVac8Vws5LeoVFzElvNbr/EVv1IFS9
	uJr6lqnNfJQNf8/YdfI2FSbc+NysPCLC8WARhB3/Va3hiyQ9Mob/yVng+JmadcrTYci0cRYjqzs
	289uetVmWgjduEE46Xt3zuc3rPDQUpa+aeMoWUxwFflc6aNDnVsLYTI4Z3oKUD08=
X-Received: by 2002:a05:6a21:512:b0:3c0:9c1b:d0b4 with SMTP id adf61e73a8af0-3c1109f69d4mr12939150637.63.1784006583440;
        Mon, 13 Jul 2026 22:23:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:512:b0:3c0:9c1b:d0b4 with SMTP id adf61e73a8af0-3c1109f69d4mr12939029637.63.1784006581696;
        Mon, 13 Jul 2026 22:23:01 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm78609864eec.30.2026.07.13.22.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:23:01 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:22:56 -0700
Subject: [PATCH v3 3/3] input: misc: Add Qualcomm SPMI PMIC haptics driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260713-qcom-spmi-haptics-v3-3-c931bb7cb94f@oss.qualcomm.com>
References: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784006577; l=35104;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ObGh6NEsLBZOcf4NGA8sXlRs8XO89ICGKMwC1CWLiPY=;
 b=SAC+L2+3wLi5G7dMJS4Jnl+NrynMklbqvxSDRsLnn5nwBzmywA9iRa31+hXDnE5BjorxX4bAG
 fr+2C65s7BvA9hUdkmJELe9TcZ3t0U99JdkHw9HFUlbAfIolPiFFioa
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXxVQRVarYSxiE
 zRrvDvV4GaGdxZa2wVkuHLOdpiifvIH1ELIW6A3GoOYGuC6jhU1mFhPtZdWPy0yWVJOFgB8pQxW
 PdhPNwc9Fb+kI4JEEx24y1OrPF2US5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX4Ea7Qwut7TLd
 XYDdfKykSVaUrC7k220B7tapIU2HoX3jUMnH4qcreO6L79OS++v6JCX7MwW58sp9onyuVf/VAaN
 pbuz/wgp0mPYknwr0mobluPrhRSro5f/PYmTT7Vr1AtYn/tCJffxOZPCYm8qMYfzWDlk6BJwbXR
 KCLt7u2sI9guVRznnrGz9zIahCmLDx73PtUNWMczr7xh0IxyBShTfFYv4+x4Oyy87W4JUauu0YU
 HyLLLcgpvxNZh6tSJIKKoAwpWdPTUZy864ZLEhNSduv12AWy+I42A24mE6DgFr2sckyi4wzbUej
 TiFmZDh9KEkLn+ag6fZUQLnHNgFddF5Kjg/QnwpLa1IEB5Fu6imVcgCi17JbQ2jH0Km9s3opxGB
 FFxPZ7l8C7VLEIMQ5BnlyNvKqQgey6c23t+DFkhlbFkFwZx52jMrZ/phtz772HoLGfKlXXsyDec
 PGFMSRzoPU5b1A/1D5w==
X-Proofpoint-ORIG-GUID: S5sf2LrDb9nd9mSTln3ZnAHU8l7mU63n
X-Proofpoint-GUID: S5sf2LrDb9nd9mSTln3ZnAHU8l7mU63n
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55c7b8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tiPXcSdVw975Ug70q0YA:9 a=wVMyrRT0KRx5ck5g:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118936-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF6E17511B6

Add an initial driver for the Qualcomm PMIH0108 PMIC haptics module,
named as HAP530_HV. This module supports several play modes, including
DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
and hardware data handling logic. Currently, the driver provides support
for two play modes using the input force-feedback framework: FF_CONSTANT
effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
waveform for FIFO mode.

Assisted-by: Claude:claude-4-8-opus
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/input/misc/Kconfig             |   11 +
 drivers/input/misc/Makefile            |    1 +
 drivers/input/misc/qcom-spmi-haptics.c | 1160 ++++++++++++++++++++++++++++++++
 3 files changed, 1172 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 1f6c57dba030..4f40940973e4 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -236,6 +236,17 @@ config INPUT_PMIC8XXX_PWRKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called pmic8xxx-pwrkey.
 
+config INPUT_QCOM_SPMI_HAPTICS
+	tristate "Qualcomm SPMI PMIC haptics support"
+	depends on MFD_SPMI_PMIC
+	help
+	  Say Y to enable support for the Qualcomm PMIH0108 SPMI PMIC haptics
+	  module. Supports DIRECT_PLAY, FIFO streaming play modes via the
+	  Linux input force-feedback framework.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called qcom-spmi-haptics.
+
 config INPUT_SPARCSPKR
 	tristate "SPARC Speaker support"
 	depends on PCI && SPARC64
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 2281d6803fce..c5c9aa139a11 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
 obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
 obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
 obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
+obj-$(CONFIG_INPUT_QCOM_SPMI_HAPTICS)	+= qcom-spmi-haptics.o
 obj-$(CONFIG_INPUT_QNAP_MCU)		+= qnap-mcu-input.o
 obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
 obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
diff --git a/drivers/input/misc/qcom-spmi-haptics.c b/drivers/input/misc/qcom-spmi-haptics.c
new file mode 100644
index 000000000000..ffbef7453459
--- /dev/null
+++ b/drivers/input/misc/qcom-spmi-haptics.c
@@ -0,0 +1,1160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
+
+/* HAP_CFG register offsets, bit fields, value constants */
+#define HAP_CFG_INT_RT_STS_REG		0x10
+#define  FIFO_EMPTY_BIT			BIT(1)
+#define HAP_CFG_EN_CTL_REG		0x46
+#define  HAPTICS_EN_BIT			BIT(7)
+#define HAP_CFG_VMAX_REG		0x48
+#define   VMAX_STEP_MV			50
+#define   VMAX_MV_MAX			10000
+#define HAP_CFG_SPMI_PLAY_REG		0x4C
+#define  PLAY_EN_BIT			BIT(7)
+#define  PAT_SRC_MASK			GENMASK(2, 0)
+#define   PAT_SRC_FIFO			0
+#define   PAT_SRC_DIRECT_PLAY		1
+#define HAP_CFG_TLRA_OL_HIGH_REG	0x5C
+#define  TLRA_OL_MSB_MASK		GENMASK(3, 0)
+#define   TLRA_STEP_US			5
+#define   TLRA_US_MAX			20475
+#define HAP_CFG_TLRA_OL_LOW_REG		0x5D
+#define HAP_CFG_DRV_DUTY_CFG_REG	0x60
+#define  ADT_DRV_DUTY_EN_BIT		BIT(7)
+#define  ADT_BRK_DUTY_EN_BIT		BIT(6)
+#define  DRV_DUTY_MASK			GENMASK(5, 3)
+#define   AUTORES_DRV_DUTY_62P5		2
+#define  BRK_DUTY_MASK			GENMASK(2, 0)
+#define   AUTORES_BRK_DUTY_62P5		5
+#define HAP_CFG_ZX_WIND_CFG_REG		0x62
+#define  ZX_DEBOUNCE_MASK		GENMASK(6, 4)
+#define   AUTORES_ZX_DEBOUNCE		3
+#define  ZX_WIN_HEIGHT_MASK		GENMASK(2, 0)
+#define   AUTORES_ZX_WIN_HEIGHT		2
+#define HAP_CFG_AUTORES_CFG_REG		0x63
+#define  AUTORES_EN_BIT			BIT(7)
+#define  AUTORES_EN_DLY_MASK		GENMASK(6, 2)
+#define   AUTORES_EN_DLY_CYCLES		10
+#define  AUTORES_ERR_WIN_MASK		GENMASK(1, 0)
+#define   AUTORES_ERR_WIN_25PCT		1
+#define HAP_CFG_FAULT_CLR_REG		0x66
+#define  ZX_TO_FAULT_CLR_BIT		BIT(4)
+#define  SC_CLR_BIT			BIT(2)
+#define  AUTO_RES_ERR_CLR_BIT		BIT(1)
+#define  HPWR_RDY_FAULT_CLR_BIT		BIT(0)
+#define  FAULT_CLR_ALL	(ZX_TO_FAULT_CLR_BIT | SC_CLR_BIT | \
+			 AUTO_RES_ERR_CLR_BIT | HPWR_RDY_FAULT_CLR_BIT)
+#define HAP_CFG_RAMP_DN_CFG2_REG	0x86
+#define  AUTORES_PRE_HIZ_DLY_10US	1
+
+/* HAP_PTN register offsets, bit fields, value constants */
+#define HAP_PTN_REVISION2_REG		0x01
+#define HAP_PTN_FIFO_DIN_0_REG		0x20
+#define HAP_PTN_FIFO_PLAY_RATE_REG	0x24
+#define  FIFO_PLAY_RATE_MASK		GENMASK(3, 0)
+#define HAP_PTN_DIRECT_PLAY_REG		0x26
+#define HAP_PTN_FIFO_EMPTY_CFG_REG	0x2A
+#define  FIFO_THRESH_LSB		64
+#define HAP_PTN_FIFO_DIN_1B_REG		0x2C
+#define HAP_PTN_MEM_OP_ACCESS_REG	0x2D
+#define  MEM_FLUSH_RELOAD_BIT		BIT(0)
+#define HAP_PTN_MMAP_FIFO_REG		0xA0
+#define  MMAP_FIFO_EXIST_BIT		BIT(7)
+#define  MMAP_FIFO_LEN_MASK		GENMASK(6, 0)
+#define HAP_PTN_PATX_PLAY_CFG_REG	0xA2
+
+#define HAP530_MEM_TOTAL_BYTES		8192
+#define FIFO_EMPTY_THRESH		280
+#define FIFO_INIT_FILL			320
+
+#define HAPTICS_AUTOSUSPEND_MS		1000
+
+/*
+ * FF_CUSTOM data layout (custom_data[] of type s16):
+ *   [0] = play rate (PLAY_RATE_*)
+ *   [1] = vmax in mV (0 = use device default from qcom,vmax-microvolt)
+ *   [2..N-1] = signed 8-bit PCM samples packed one per s16 (lower byte used)
+ */
+#define CUSTOM_DATA_RATE_IDX		0
+#define CUSTOM_DATA_VMAX_IDX		1
+#define CUSTOM_DATA_SAMPLE_START	2
+#define CUSTOM_DATA_MAX_LEN		(48 * 1024)
+
+#define HAPTICS_MAX_EFFECTS		8
+
+enum qcom_haptics_mode {
+	HAPTICS_MODE_NONE,
+	HAPTICS_DIRECT_PLAY,
+	HAPTICS_FIFO,
+};
+
+enum qcom_haptics_play_rate {
+	PLAY_RATE_T_LRA       = 0,
+	PLAY_RATE_T_LRA_DIV_2 = 1,
+	PLAY_RATE_T_LRA_DIV_4 = 2,
+	PLAY_RATE_T_LRA_DIV_8 = 3,
+	PLAY_RATE_T_LRA_X_2   = 4,
+	PLAY_RATE_T_LRA_X_4   = 5,
+	PLAY_RATE_T_LRA_X_8   = 6,
+	PLAY_RATE_RESERVED    = 7,
+	PLAY_RATE_F_8KHZ      = 8,
+	PLAY_RATE_F_16KHZ     = 9,
+	PLAY_RATE_F_24KHZ     = 10,
+	PLAY_RATE_F_32KHZ     = 11,
+	PLAY_RATE_F_44P1KHZ   = 12,
+	PLAY_RATE_F_48KHZ     = 13,
+	PLAY_RATE_MAX	      = PLAY_RATE_F_48KHZ,
+};
+
+/**
+ * struct qcom_haptics_effect: A haptics effect
+ * @mode:	haptics HW play mode
+ * @vmax_mv:	peak voltage of the haptics output waveform
+ * @length_us:	vibration play duration
+ * @amplitude:	DIRECT_PLAY mode output waveform amplitude
+ * @play_rate:	FIFO mode play rate
+ * @fifo_data:	8-bit data samples consumed in FIFO mode
+ * @data_len:	length of the FIFO data samples
+ */
+struct qcom_haptics_effect {
+	enum qcom_haptics_mode mode;
+	u32 vmax_mv;
+	u32 length_us;
+
+	u8 amplitude;
+
+	enum qcom_haptics_play_rate play_rate;
+	s8 *fifo_data;
+	u32 data_len;
+};
+
+/**
+ * struct haptics_play_req: A haptics play request
+ * @node:	list node of the request
+ * @effect_id:	effect index of the request
+ * @play:	flag of starting or stopping the play
+ */
+struct haptics_play_req {
+	struct list_head node;
+	int effect_id;
+	bool play;
+};
+
+/**
+ * struct qcom_haptics
+ * @dev:          underlying SPMI device
+ * @regmap:       regmap for SPMI register access
+ * @input:        input device exposing the FF interface
+ * @cfg_base:     base address of the CFG peripheral
+ * @ptn_base:     base address of the PTN peripheral
+ * @t_lra_us:     LRA resonance period in microseconds
+ * @vmax_mv:      maximum actuator drive voltage in millivolts
+ * @fifo_len:     programmed HW FIFO depth in bytes
+ * @gain:         playback gain scaler
+ * @play_work:    delayed work that plays the queued requests
+ * @play_lock:    mutex lock to serialize playbacks
+ * @play_queue_lock: spinlock protecting @play_queue
+ * @play_queue:   The list of pending start/stop requests
+ * @active_effect_id: index into @effects[] currently under play
+ * @active_mode:  mode of the effect currently armed in hardware
+ * @fifo_empty_irq: IRQ number for the FIFO-empty interrupt
+ * @pm_ref_held:  true while a pm_runtime_get is held
+ * @irq_enabled:  true if fifo_empty_irq is enabled
+ * @fifo_lock:    mutex protecting the FIFO streaming data
+ * @fifo_data:    pointer of the data buffer for FIFO streaming
+ * @data_len:     length of the data buffer for current effect
+ * @data_written: number of samples written to the hardware FIFO
+ * @effects:      table of the effects
+ */
+struct qcom_haptics {
+	struct device *dev;
+	struct regmap *regmap;
+	struct input_dev *input;
+
+	u32 cfg_base;
+	u32 ptn_base;
+	u32 t_lra_us;
+	u32 vmax_mv;
+	u32 fifo_len;
+	atomic_t gain;
+
+	struct delayed_work play_work;
+	struct mutex play_lock; /* mutex used to serialize playbacks */
+
+	spinlock_t play_queue_lock; /* protects play_queue */
+	struct list_head play_queue;
+
+	int active_effect_id;
+	enum qcom_haptics_mode active_mode;
+
+	int fifo_empty_irq;
+	bool pm_ref_held;
+	bool irq_enabled;
+
+	struct mutex fifo_lock; /* protect the FIFO data during play */
+	const s8 *fifo_data;
+	u32 data_len;
+	u32 data_written;
+
+	struct qcom_haptics_effect effects[HAPTICS_MAX_EFFECTS];
+};
+
+static int cfg_write(struct qcom_haptics *h, u32 off, u32 val)
+{
+	return regmap_write(h->regmap, h->cfg_base + off, val);
+}
+
+static int cfg_update_bits(struct qcom_haptics *h, u32 off, u32 mask, u32 val)
+{
+	return regmap_update_bits(h->regmap, h->cfg_base + off, mask, val);
+}
+
+static int ptn_write(struct qcom_haptics *h, u32 off, u32 val)
+{
+	return regmap_write(h->regmap, h->ptn_base + off, val);
+}
+
+static int ptn_update_bits(struct qcom_haptics *h, u32 off, u32 mask, u32 val)
+{
+	return regmap_update_bits(h->regmap, h->ptn_base + off, mask, val);
+}
+
+static int ptn_bulk_write(struct qcom_haptics *h, u32 off,
+			  const void *buf, size_t count)
+{
+	return regmap_bulk_write(h->regmap, h->ptn_base + off, buf, count);
+}
+
+static int haptics_clear_faults(struct qcom_haptics *h)
+{
+	return cfg_write(h, HAP_CFG_FAULT_CLR_REG, FAULT_CLR_ALL);
+}
+
+static int haptics_set_vmax(struct qcom_haptics *h, u32 vmax_mv)
+{
+	return cfg_write(h, HAP_CFG_VMAX_REG, vmax_mv / VMAX_STEP_MV);
+}
+
+static int haptics_config_lra_period(struct qcom_haptics *h)
+{
+	u32 tmp = h->t_lra_us / TLRA_STEP_US;
+	int ret;
+
+	ret = cfg_write(h, HAP_CFG_TLRA_OL_HIGH_REG, (tmp >> 8) & TLRA_OL_MSB_MASK);
+	if (ret)
+		return ret;
+
+	return cfg_write(h, HAP_CFG_TLRA_OL_LOW_REG, tmp & 0xFF);
+}
+
+static int haptics_enable_module(struct qcom_haptics *h, bool enable)
+{
+	return cfg_update_bits(h, HAP_CFG_EN_CTL_REG, HAPTICS_EN_BIT,
+			       enable ? HAPTICS_EN_BIT : 0);
+}
+
+static int haptics_configure_autores(struct qcom_haptics *h)
+{
+	int ret;
+
+	/* AUTORES_CFG: enable, 10-cycle delay, 25% error window */
+	ret = cfg_write(h, HAP_CFG_AUTORES_CFG_REG,
+			AUTORES_EN_BIT |
+			FIELD_PREP(AUTORES_EN_DLY_MASK, AUTORES_EN_DLY_CYCLES) |
+			FIELD_PREP(AUTORES_ERR_WIN_MASK, AUTORES_ERR_WIN_25PCT));
+	if (ret)
+		return ret;
+
+	/* DRV_DUTY: adaptive drive/brake duty cycles at 62.5% */
+	ret = cfg_write(h, HAP_CFG_DRV_DUTY_CFG_REG,
+			ADT_DRV_DUTY_EN_BIT | ADT_BRK_DUTY_EN_BIT |
+			FIELD_PREP(DRV_DUTY_MASK, AUTORES_DRV_DUTY_62P5) |
+			FIELD_PREP(BRK_DUTY_MASK, AUTORES_BRK_DUTY_62P5));
+	if (ret)
+		return ret;
+
+	/* Pre-HIZ delay: 10 µs */
+	ret = cfg_write(h, HAP_CFG_RAMP_DN_CFG2_REG, AUTORES_PRE_HIZ_DLY_10US);
+	if (ret)
+		return ret;
+
+	/* Zero-cross window: debounce 3, no hysteresis, height 2 */
+	return cfg_write(h, HAP_CFG_ZX_WIND_CFG_REG,
+			 FIELD_PREP(ZX_DEBOUNCE_MASK, AUTORES_ZX_DEBOUNCE) |
+			 FIELD_PREP(ZX_WIN_HEIGHT_MASK, AUTORES_ZX_WIN_HEIGHT));
+}
+
+static int haptics_write_fifo_chunk(struct qcom_haptics *h,
+				    const s8 *data, u32 len)
+{
+	u32 bulk_len = ALIGN_DOWN(len, 4);
+	int i, ret;
+
+	/*
+	 * FIFO data writing supports both 4-byte bulk writes using registers
+	 * [HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes
+	 * using the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is more
+	 * efficient, so use 4-byte writes for the initial 4-byte aligned data,
+	 * and 1-byte writes for any trailing remainder.
+	 */
+	for (i = 0; i < bulk_len; i += 4) {
+		ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
+		if (ret)
+			return ret;
+	}
+
+	for (; i < len; i++) {
+		ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
+{
+	u32 fifo_len, fifo_units;
+
+	/* Config all memory space for FIFO usage for now */
+	fifo_len = HAP530_MEM_TOTAL_BYTES;
+	fifo_len = ALIGN_DOWN(fifo_len, 64);
+	fifo_units = fifo_len / 64;
+	h->fifo_len = fifo_len;
+
+	return ptn_write(h, HAP_PTN_MMAP_FIFO_REG,
+			 MMAP_FIFO_EXIST_BIT |
+			 FIELD_PREP(MMAP_FIFO_LEN_MASK, fifo_units - 1));
+}
+
+static u32 haptics_gain_scaled_vmax(struct qcom_haptics *h, u32 vmax_mv)
+{
+	u16 gain = atomic_read(&h->gain);
+	u32 v = mult_frac(vmax_mv, gain, 0xFFFF);
+
+	return max_t(u32, v, VMAX_STEP_MV);
+}
+
+static void haptics_fifo_irq_enable(struct qcom_haptics *h, bool enable)
+{
+	if (h->irq_enabled == enable)
+		return;
+
+	if (enable)
+		enable_irq(h->fifo_empty_irq);
+	else
+		disable_irq(h->fifo_empty_irq);
+
+	h->irq_enabled = enable;
+}
+
+static int haptics_enqueue_play_req(struct qcom_haptics *h, int effect_id, bool play)
+{
+	struct haptics_play_req *req;
+
+	guard(spinlock_irqsave)(&h->play_queue_lock);
+
+	/*
+	 * Coalesce with an already queued request for
+	 * the same effect instead of appending.
+	 */
+	list_for_each_entry(req, &h->play_queue, node) {
+		if (req->effect_id == effect_id) {
+			req->play = play;
+			return 0;
+		}
+	}
+
+	req = kmalloc_obj(*req, GFP_ATOMIC);
+	if (!req)
+		return -ENOMEM;
+
+	req->effect_id = effect_id;
+	req->play = play;
+
+	list_add_tail(&req->node, &h->play_queue);
+
+	return 0;
+}
+
+static struct haptics_play_req *haptics_dequeue_play_req(struct qcom_haptics *h)
+{
+	struct haptics_play_req *req = NULL;
+
+	guard(spinlock_irqsave)(&h->play_queue_lock);
+
+	if (!list_empty(&h->play_queue)) {
+		req = list_first_entry(&h->play_queue, struct haptics_play_req, node);
+		list_del(&req->node);
+	}
+
+	return req;
+}
+
+static bool haptics_queue_pending(struct qcom_haptics *h)
+{
+	guard(spinlock_irqsave)(&h->play_queue_lock);
+
+	return !list_empty(&h->play_queue);
+}
+
+static void haptics_queue_remove_effect(struct qcom_haptics *h, int effect_id)
+{
+	struct haptics_play_req *req, *tmp;
+
+	guard(spinlock_irqsave)(&h->play_queue_lock);
+
+	list_for_each_entry_safe(req, tmp, &h->play_queue, node) {
+		if (req->effect_id == effect_id) {
+			list_del(&req->node);
+			kfree(req);
+		}
+	}
+}
+
+static void haptics_queue_flush(struct qcom_haptics *h)
+{
+	struct haptics_play_req *req, *tmp;
+
+	guard(spinlock_irqsave)(&h->play_queue_lock);
+
+	list_for_each_entry_safe(req, tmp, &h->play_queue, node) {
+		list_del(&req->node);
+		kfree(req);
+	}
+}
+
+static int haptics_start_direct_play(struct qcom_haptics *h, int effect_id)
+{
+	struct qcom_haptics_effect *eff = &h->effects[effect_id];
+	int ret;
+
+	ret = haptics_clear_faults(h);
+	if (ret)
+		return ret;
+
+	/* Enable auto-resonance for DIRECT_PLAY mode */
+	ret = cfg_update_bits(h, HAP_CFG_AUTORES_CFG_REG,
+			      AUTORES_EN_BIT, AUTORES_EN_BIT);
+	if (ret)
+		return ret;
+
+	ret = haptics_set_vmax(h, haptics_gain_scaled_vmax(h, h->vmax_mv));
+	if (ret)
+		return ret;
+
+	ret = ptn_write(h, HAP_PTN_DIRECT_PLAY_REG, eff->amplitude);
+	if (ret)
+		return ret;
+
+	return cfg_write(h, HAP_CFG_SPMI_PLAY_REG,
+			 PLAY_EN_BIT | FIELD_PREP(PAT_SRC_MASK, PAT_SRC_DIRECT_PLAY));
+}
+
+static int haptics_start_fifo(struct qcom_haptics *h, int effect_id)
+{
+	struct qcom_haptics_effect *eff = &h->effects[effect_id];
+	u32 vmax = eff->vmax_mv ? eff->vmax_mv : h->vmax_mv;
+	u32 init_len;
+	bool data_done;
+	int ret;
+
+	if (!eff->fifo_data || !eff->data_len)
+		return -EINVAL;
+
+	ret = haptics_clear_faults(h);
+	if (ret)
+		return ret;
+
+	/* Disable auto-resonance for FIFO mode */
+	ret = cfg_update_bits(h, HAP_CFG_AUTORES_CFG_REG, AUTORES_EN_BIT, 0);
+	if (ret)
+		return ret;
+
+	ret = haptics_set_vmax(h, haptics_gain_scaled_vmax(h, vmax));
+	if (ret)
+		return ret;
+
+	ret = ptn_update_bits(h, HAP_PTN_FIFO_PLAY_RATE_REG,
+			      FIFO_PLAY_RATE_MASK,
+			      FIELD_PREP(FIFO_PLAY_RATE_MASK, eff->play_rate));
+	if (ret)
+		return ret;
+
+	/* Flush FIFO before loading new data */
+	ret = ptn_write(h, HAP_PTN_MEM_OP_ACCESS_REG, MEM_FLUSH_RELOAD_BIT);
+	if (ret)
+		return ret;
+	ret = ptn_write(h, HAP_PTN_MEM_OP_ACCESS_REG, 0);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&h->fifo_lock);
+
+	/* Write the initial chunk and initialise streaming state */
+	init_len = min_t(u32, eff->data_len, FIFO_INIT_FILL);
+	ret = haptics_write_fifo_chunk(h, eff->fifo_data, init_len);
+	if (ret)
+		return ret;
+
+	h->fifo_data    = eff->fifo_data;
+	h->data_len     = eff->data_len;
+	h->data_written = init_len;
+
+	/*
+	 * Set empty threshold.  When threshold > 0 the hardware fires the
+	 * FIFO-empty interrupt when occupancy drops below the threshold,
+	 * allowing the driver to refill.  A threshold of 0 disables the IRQ.
+	 */
+	data_done = (h->data_written >= h->data_len);
+	if (!data_done) {
+		ret = ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG,
+				FIFO_EMPTY_THRESH / FIFO_THRESH_LSB);
+		if (ret)
+			goto free_fifo;
+
+		haptics_fifo_irq_enable(h, true);
+	}
+
+	ret = cfg_write(h, HAP_CFG_SPMI_PLAY_REG,
+			 PLAY_EN_BIT | FIELD_PREP(PAT_SRC_MASK, PAT_SRC_FIFO));
+	if (ret) {
+		dev_err(h->dev, "trigger FIFO play failed, ret=%d\n", ret);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, 0);
+	haptics_fifo_irq_enable(h, false);
+free_fifo:
+	h->fifo_data = NULL;
+	return ret;
+}
+
+/*
+ * haptics_fifo_empty_irq: Threaded IRQ handler for the FIFO-empty interrupt.
+ *
+ * While a FIFO play is in progress the hardware fires this interrupt when
+ * the number of samples in the FIFO drops below the programmed threshold.
+ * The handler refills the FIFO from the effect's data buffer.  When all
+ * samples have been written the threshold is set to zero. The HW would
+ * stop the play automatically after all of the samples in FIFO memory are
+ * played out.
+ */
+static irqreturn_t haptics_fifo_empty_irq(int irq, void *dev_id)
+{
+	struct qcom_haptics *h = dev_id;
+	u32 sts, to_write;
+	int ret;
+
+	ret = regmap_read(h->regmap,
+			  h->cfg_base + HAP_CFG_INT_RT_STS_REG, &sts);
+	if (ret || !(sts & FIFO_EMPTY_BIT))
+		return IRQ_HANDLED;
+
+	guard(mutex)(&h->fifo_lock);
+
+	if (!h->fifo_data)
+		return IRQ_HANDLED;
+
+	/* Refill: write the next chunk */
+	to_write = min_t(u32, h->data_len - h->data_written,
+			 h->fifo_len - FIFO_EMPTY_THRESH);
+	ret = haptics_write_fifo_chunk(h, &h->fifo_data[h->data_written], to_write);
+	if (ret) {
+		dev_err(h->dev, "refill FIFO samples failed, ret=%d\n", ret);
+		return IRQ_HANDLED;
+	}
+
+	h->data_written += to_write;
+
+	/* Disable the interrupt after all the data is queued */
+	if (h->data_written >= h->data_len)
+		ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, 0);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * haptics_stop_locked: stop play in HW and put runtime PM
+ * @h:	haptics device
+ * @put_noidle:	a flag to put noidle
+ *
+ * Stop HW play, clear the FIFO data if the active effect was FIFO-mode, and
+ * put runtime PM into either noidle or autosuspend based on put_noidle flag.
+ *
+ * Must be called with play_lock held.
+ */
+static void haptics_stop_locked(struct qcom_haptics *h, bool put_noidle)
+{
+	cfg_write(h, HAP_CFG_SPMI_PLAY_REG, 0);
+
+	if (h->active_mode == HAPTICS_FIFO) {
+		ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, 0);
+		haptics_fifo_irq_enable(h, false);
+		scoped_guard(mutex, &h->fifo_lock) {
+			h->fifo_data = NULL;
+		}
+	}
+
+	h->active_effect_id = -1;
+	h->active_mode = HAPTICS_MODE_NONE;
+
+	if (h->pm_ref_held) {
+		if (put_noidle)
+			pm_runtime_put_noidle(h->dev);
+		else
+			pm_runtime_put_autosuspend(h->dev);
+
+		h->pm_ref_held = false;
+	}
+}
+
+/*
+ * haptics_start_locked: start to play an effect
+ * @h:	haptics device
+ * @effect_id:	the index of the effect
+ *
+ * If an effect is currently active, stop it 1st. Acquires a PM ref
+ * if not already held, and then trigger the play based on the
+ * play mode. Update active_effect_id/active_mode on success.
+ *
+ * Must be called with play_lock held.
+ */
+static int haptics_start_locked(struct qcom_haptics *h, int effect_id)
+{
+	int ret;
+
+	if (h->active_effect_id != -1)
+		haptics_stop_locked(h, false);
+
+	if (!h->pm_ref_held) {
+		ret = pm_runtime_resume_and_get(h->dev);
+		if (ret < 0) {
+			dev_err(h->dev, "failed to resume device: %d\n", ret);
+			return ret;
+		}
+
+		h->pm_ref_held = true;
+	}
+
+	switch (h->effects[effect_id].mode) {
+	case HAPTICS_DIRECT_PLAY:
+		ret = haptics_start_direct_play(h, effect_id);
+		break;
+	case HAPTICS_FIFO:
+		ret = haptics_start_fifo(h, effect_id);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(h->dev, "failed to start effect %d: %d\n", effect_id, ret);
+		if (h->pm_ref_held) {
+			pm_runtime_put_autosuspend(h->dev);
+			h->pm_ref_held = false;
+		}
+
+		return ret;
+	}
+
+	h->active_effect_id = effect_id;
+	h->active_mode = h->effects[effect_id].mode;
+
+	return 0;
+}
+
+static void haptics_play_work(struct work_struct *work)
+{
+	struct qcom_haptics *h = container_of(to_delayed_work(work),
+					      struct qcom_haptics, play_work);
+	struct haptics_play_req *req = haptics_dequeue_play_req(h);
+	bool rearmed = false;
+	u32 length_us;
+	int ret;
+
+	guard(mutex)(&h->play_lock);
+
+	if (req && req->play) {
+		ret = haptics_start_locked(h, req->effect_id);
+		if (ret) {
+			dev_err(h->dev, "play haptics failed, ret=%d\n", ret);
+		} else {
+			/*
+			 * Re-arm the work to stop the play or advance
+			 * to next play after the play duration
+			 */
+			length_us = h->effects[req->effect_id].length_us;
+			if (length_us) {
+				schedule_delayed_work(&h->play_work,
+						      usecs_to_jiffies(length_us));
+				rearmed = true;
+			}
+		}
+	} else {
+		haptics_stop_locked(h, false);
+	}
+
+	kfree(req);
+
+	/*
+	 * Handle the remaining requests if doesn't need to wait
+	 */
+	if (!rearmed && haptics_queue_pending(h))
+		schedule_delayed_work(&h->play_work, 0);
+}
+
+static void haptics_clear_effect(struct qcom_haptics *h,
+				 struct qcom_haptics_effect *effect)
+{
+	guard(mutex)(&h->fifo_lock);
+
+	if (h->fifo_data == effect->fifo_data)
+		h->fifo_data = NULL;
+
+	kvfree(effect->fifo_data);
+	effect->fifo_data = NULL;
+	effect->data_len  = 0;
+}
+
+/*
+ * haptics_fifo_length_us: Calculate the play duration of a FIFO effect.
+ * @h:	haptics device pointer
+ * @rate: FIFO data play rate
+ * @data_len: FFO data length
+ *
+ * Each FIFO sample is played out over one play-rate period, so the total
+ * duration is the number of samples times that period:
+ *
+ *   length_us = (clk_base * data_len * multiplier) / divider
+ *
+ * For T_LRA-based rates the period derives from the LRA resonance period
+ * (h->t_lra_us): DIV_2/4/8 shorten it, X_2/4/8 lengthen it.  For the
+ * kHz-based rates the period is 1000 us / freq_khz.
+ */
+static u32 haptics_fifo_length_us(struct qcom_haptics *h,
+				  enum qcom_haptics_play_rate rate,
+				  u32 data_len)
+{
+	u32 clk_base = 1000, multiplier = 1, divider = 1;
+
+	switch (rate) {
+	case PLAY_RATE_T_LRA:
+		clk_base = h->t_lra_us;
+		break;
+	case PLAY_RATE_T_LRA_DIV_2:
+		clk_base = h->t_lra_us;
+		divider = 2;
+		break;
+	case PLAY_RATE_T_LRA_DIV_4:
+		clk_base = h->t_lra_us;
+		divider = 4;
+		break;
+	case PLAY_RATE_T_LRA_DIV_8:
+		clk_base = h->t_lra_us;
+		divider = 8;
+		break;
+	case PLAY_RATE_T_LRA_X_2:
+		clk_base = h->t_lra_us;
+		multiplier = 2;
+		break;
+	case PLAY_RATE_T_LRA_X_4:
+		clk_base = h->t_lra_us;
+		multiplier = 4;
+		break;
+	case PLAY_RATE_T_LRA_X_8:
+		clk_base = h->t_lra_us;
+		multiplier = 8;
+		break;
+	case PLAY_RATE_F_8KHZ:
+		divider = 8;
+		break;
+	case PLAY_RATE_F_16KHZ:
+		divider = 16;
+		break;
+	case PLAY_RATE_F_24KHZ:
+		divider = 24;
+		break;
+	case PLAY_RATE_F_32KHZ:
+		divider = 32;
+		break;
+	case PLAY_RATE_F_44P1KHZ:
+		clk_base *= 10;
+		divider = 441;
+		break;
+	case PLAY_RATE_F_48KHZ:
+		divider = 48;
+		break;
+	default:
+		/* Unexpected rate: fall back to the resonance period. */
+		clk_base = h->t_lra_us;
+		break;
+	}
+
+	return div_u64((u64)clk_base * data_len * multiplier, divider);
+}
+
+static int haptics_upload_effect(struct input_dev *dev,
+				 struct ff_effect *effect,
+				 struct ff_effect *old)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+	struct qcom_haptics_effect *priv;
+	int id = effect->id;
+	u32 data_len, level;
+	s8 *fifo;
+
+	s16 *buf __free(kvfree) = NULL;
+
+	guard(mutex)(&h->play_lock);
+
+	if (id < 0 || id >= HAPTICS_MAX_EFFECTS)
+		return -EINVAL;
+
+	if (id == h->active_effect_id) {
+		dev_err(h->dev, "effect %d is under playing\n", id);
+		return -EBUSY;
+	}
+
+	priv = &h->effects[id];
+
+	switch (effect->type) {
+	case FF_CONSTANT:
+		haptics_clear_effect(h, priv);
+		level = effect->u.constant.level <= 0 ? 0 : effect->u.constant.level;
+		priv->amplitude = (u8)mult_frac(level, 255, 0x7FFF);
+		priv->length_us = effect->replay.length * USEC_PER_MSEC;
+		priv->mode = HAPTICS_DIRECT_PLAY;
+		return 0;
+
+	case FF_PERIODIC:
+		if (effect->u.periodic.waveform != FF_CUSTOM)
+			return -EINVAL;
+		/*
+		 * Minimum 3 elements: play-rate code + vmax + at least one sample.
+		 * Limit the maximum data length to ~48K so that it can at least
+		 * handle ~1s vibration at the fast (48K) play rate.
+		 */
+		if (effect->u.periodic.custom_len < 3 ||
+		    effect->u.periodic.custom_len > CUSTOM_DATA_MAX_LEN + 2)
+			return -EINVAL;
+
+		buf = vmemdup_array_user(effect->u.periodic.custom_data,
+					effect->u.periodic.custom_len,
+					sizeof(s16));
+		if (IS_ERR(buf))
+			return PTR_ERR(no_free_ptr(buf));
+
+		if (buf[CUSTOM_DATA_RATE_IDX] < 0 ||
+		    buf[CUSTOM_DATA_RATE_IDX] > PLAY_RATE_MAX ||
+		    buf[CUSTOM_DATA_RATE_IDX] == PLAY_RATE_RESERVED)
+			return -EINVAL;
+
+		data_len = effect->u.periodic.custom_len - CUSTOM_DATA_SAMPLE_START;
+
+		fifo = kvmalloc(data_len, GFP_KERNEL);
+		if (!fifo)
+			return -ENOMEM;
+
+		/* Pack: one s8 sample per s16 slot (lower byte) */
+		for (int i = 0; i < data_len; i++)
+			fifo[i] = (s8)buf[CUSTOM_DATA_SAMPLE_START + i];
+
+		haptics_clear_effect(h, priv);
+
+		scoped_guard(mutex, &h->fifo_lock) {
+			priv->fifo_data = fifo;
+			priv->data_len = data_len;
+		}
+
+		priv->play_rate = (u8)buf[CUSTOM_DATA_RATE_IDX];
+		priv->vmax_mv   = (u32)clamp_val(buf[CUSTOM_DATA_VMAX_IDX], 0, VMAX_MV_MAX);
+		priv->length_us = haptics_fifo_length_us(h, priv->play_rate, data_len);
+		priv->mode = HAPTICS_FIFO;
+
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int haptics_playback(struct input_dev *dev, int effect_id, int val)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+	int ret;
+
+	ret = haptics_enqueue_play_req(h, effect_id, val > 0);
+	if (ret)
+		return ret;
+
+	if (val > 0)
+		/*
+		 * Queue the play.  If a duration re-arm is already pending this
+		 * is a no-op, so the new play waits for the current effect to
+		 * finish before the worker dequeues it.
+		 */
+		schedule_delayed_work(&h->play_work, 0);
+	else
+		/*
+		 * Run the worker now, cancelling any pending duration re-arm,
+		 * so an explicit stop takes effect immediately.
+		 */
+		mod_delayed_work(system_percpu_wq, &h->play_work, 0);
+
+	return 0;
+}
+
+static int haptics_erase(struct input_dev *dev, int effect_id)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+	struct qcom_haptics_effect *priv = &h->effects[effect_id];
+
+	guard(mutex)(&h->play_lock);
+
+	haptics_queue_remove_effect(h, effect_id);
+
+	if (h->active_effect_id == effect_id)
+		haptics_stop_locked(h, false);
+
+	haptics_clear_effect(h, priv);
+	priv->mode = HAPTICS_MODE_NONE;
+
+	return 0;
+}
+
+static void haptics_set_gain(struct input_dev *dev, u16 gain)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+
+	atomic_set(&h->gain, gain);
+}
+
+static int qcom_haptics_probe(struct platform_device *pdev)
+{
+	struct qcom_haptics *h;
+	struct input_dev *input;
+	struct ff_device *ff;
+	u32 regs[2], vmax_uv;
+	int ret, irq;
+
+	h = devm_kzalloc(&pdev->dev, sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return -ENOMEM;
+
+	h->dev = &pdev->dev;
+
+	h->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!h->regmap)
+		return dev_err_probe(h->dev, -ENODEV, "no regmap from parent\n");
+
+	ret = device_property_read_u32_array(h->dev, "reg", regs, ARRAY_SIZE(regs));
+	if (ret)
+		return dev_err_probe(h->dev, ret, "failed to read 'reg' property\n");
+
+	h->cfg_base = regs[0];
+	h->ptn_base = regs[1];
+
+	ret = device_property_read_u32(h->dev, "qcom,lra-period-us", &h->t_lra_us);
+	if (ret)
+		return dev_err_probe(h->dev, ret, "missing qcom,lra-period-us\n");
+
+	h->t_lra_us = clamp(h->t_lra_us, (u32)TLRA_STEP_US, (u32)TLRA_US_MAX);
+
+	ret = device_property_read_u32(h->dev, "qcom,vmax-microvolt", &vmax_uv);
+	if (ret)
+		return dev_err_probe(h->dev, ret, "missing qcom,vmax-microvolt\n");
+
+	h->vmax_mv = clamp(vmax_uv / 1000, (u32)VMAX_STEP_MV, (u32)VMAX_MV_MAX);
+
+	ret = haptics_config_lra_period(h);
+	if (ret)
+		return ret;
+
+	ret = haptics_configure_autores(h);
+	if (ret)
+		return ret;
+
+	ret = haptics_set_vmax(h, h->vmax_mv);
+	if (ret)
+		return ret;
+
+	ret = haptics_configure_fifo_mmap(h);
+	if (ret)
+		return ret;
+
+	mutex_init(&h->play_lock);
+	mutex_init(&h->fifo_lock);
+	spin_lock_init(&h->play_queue_lock);
+	INIT_LIST_HEAD(&h->play_queue);
+	INIT_DELAYED_WORK(&h->play_work, haptics_play_work);
+	atomic_set(&h->gain, 0xFFFF);
+	h->active_effect_id = -1;
+
+	irq = platform_get_irq_byname(pdev, "fifo-empty");
+	if (irq < 0)
+		return dev_err_probe(h->dev, irq, "failed to get fifo-empty IRQ\n");
+
+	ret = devm_request_threaded_irq(h->dev, irq, NULL,
+					haptics_fifo_empty_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					"qcom-haptics-fifo-empty", h);
+	if (ret)
+		return dev_err_probe(h->dev, ret, "failed to request fifo-empty IRQ\n");
+
+	h->fifo_empty_irq = irq;
+	platform_set_drvdata(pdev, h);
+
+	pm_runtime_use_autosuspend(h->dev);
+	pm_runtime_set_autosuspend_delay(h->dev, HAPTICS_AUTOSUSPEND_MS);
+	ret = devm_pm_runtime_enable(h->dev);
+	if (ret)
+		return dev_err_probe(h->dev, ret, "enable runtime PM failed\n");
+
+	input = devm_input_allocate_device(h->dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "qcom-spmi-haptics";
+	input_set_drvdata(input, h);
+	h->input = input;
+
+	input_set_capability(input, EV_FF, FF_CONSTANT);
+	input_set_capability(input, EV_FF, FF_PERIODIC);
+	input_set_capability(input, EV_FF, FF_CUSTOM);
+	input_set_capability(input, EV_FF, FF_GAIN);
+
+	ret = input_ff_create(input, HAPTICS_MAX_EFFECTS);
+	if (ret)
+		return ret;
+
+	ff = input->ff;
+	ff->upload   = haptics_upload_effect;
+	ff->playback = haptics_playback;
+	ff->erase    = haptics_erase;
+	ff->set_gain = haptics_set_gain;
+
+	ret = input_register_device(input);
+	if (ret) {
+		input_ff_destroy(input);
+		return dev_err_probe(h->dev, ret, "failed to register input device\n");
+	}
+
+	return 0;
+}
+
+static void qcom_haptics_remove(struct platform_device *pdev)
+{
+	struct qcom_haptics *h = platform_get_drvdata(pdev);
+
+	/*
+	 * Unregister the input device explicitly at the beginning
+	 * to avoid the input device being used after the resources
+	 * are freed.
+	 */
+	input_unregister_device(h->input);
+	disable_delayed_work_sync(&h->play_work);
+	scoped_guard(mutex, &h->play_lock) {
+		haptics_queue_flush(h);
+		haptics_stop_locked(h, true);
+	}
+
+	haptics_enable_module(h, false);
+
+	scoped_guard(mutex, &h->fifo_lock) {
+		for (int i = 0; i < HAPTICS_MAX_EFFECTS; i++) {
+			kvfree(h->effects[i].fifo_data);
+			h->effects[i].fifo_data = NULL;
+		}
+	}
+}
+
+static int qcom_haptics_runtime_suspend(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+
+	return haptics_enable_module(h, false);
+}
+
+static int qcom_haptics_runtime_resume(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+
+	return haptics_enable_module(h, true);
+}
+
+static int qcom_haptics_suspend(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+	int ret;
+
+	disable_delayed_work_sync(&h->play_work);
+	scoped_guard(mutex, &h->play_lock) {
+		haptics_queue_flush(h);
+		haptics_stop_locked(h, true);
+	}
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		enable_delayed_work(&h->play_work);
+
+	return ret;
+}
+
+static int qcom_haptics_resume(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+
+	enable_delayed_work(&h->play_work);
+
+	return pm_runtime_force_resume(dev);
+}
+
+static const struct dev_pm_ops qcom_haptics_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(qcom_haptics_suspend, qcom_haptics_resume)
+	RUNTIME_PM_OPS(qcom_haptics_runtime_suspend, qcom_haptics_runtime_resume,
+		       NULL)
+};
+
+static const struct of_device_id qcom_haptics_of_match[] = {
+	{ .compatible = "qcom,spmi-haptics" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_haptics_of_match);
+
+static struct platform_driver qcom_haptics_driver = {
+	.probe  = qcom_haptics_probe,
+	.remove = qcom_haptics_remove,
+	.driver = {
+		.name		= "qcom-spmi-haptics",
+		.of_match_table	= qcom_haptics_of_match,
+		.pm		= pm_ptr(&qcom_haptics_pm_ops),
+	},
+};
+module_platform_driver(qcom_haptics_driver);
+
+MODULE_DESCRIPTION("Qualcomm SPMI PMIC Haptics driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


