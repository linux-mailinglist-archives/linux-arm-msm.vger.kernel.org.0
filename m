Return-Path: <linux-arm-msm+bounces-91374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDdtMAYLfmktVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 15:00:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE36EC2249
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 15:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB4763006D65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 13:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F10B357737;
	Sat, 31 Jan 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqlkuveL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+Zw+Sna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53D356A19
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867943; cv=none; b=OjllzrNqWT9eyP3prMrdlZ7+8GznNbQeXVYYvpPanIffJj+I+Vd89fBzBChuYZuhMi67nyS5OVdqS9A6yu6kK6UIBGnp/d8m5qIzh3HTxX3o4Qcs4qYiDshxcH+EdVwMX0Feu5nXSEpDZX0iBx9Zo0xomc0RpNPGAGslyDVGtOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867943; c=relaxed/simple;
	bh=OzD4FTK6JV+5RvDrmyf8OgLghGE1je6zg8bW2QD9QnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iM3N8NratR4WeL05HADjt1O+zMtNK7UcM0iy9EfVT/Db50OspFuu2hZlu9BwJjmIgeoPyTxIt9UbYsM35nJEnURtSI9ver9UAuNwJdN/gqr25J4zfmyGZ7sx8BC2lwZKfWp1dYqs2fCaj4sC939V5Kn9ns4Ph8Gpm4TpR2uINNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqlkuveL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+Zw+Sna; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4UFC0308643
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3s8GuETxl5AklqxiZ+dsaNTgW8Onj8c//rAG+Um/F8=; b=iqlkuveLw/Hy22SK
	wsaAr3ueyeL1BSziXwrVia6uiyHqvT3hivE6dFV71lNYDdG8M/mOBYqXF+Yh6NIP
	iOzGpVwtlwyth9ihBaKxdNfoeOOboB4CZ5s+lTqGSFYgC1BHhSDt29WIpowXq5uO
	dpIFZR+pzRosP20MPm4P48wjbqUazM2XhiCQX2kWN71MS8Mil90rpVtbdarAfmNM
	tPSfyo4EUPKzvRrQ+d9tuzVcyMq3y/Pub7TsQ58JvJrc3zjgwC1rWD6VpgJ6Dx/1
	B3vex8NDdBhRwzQdfClHQdGHtYQNAH5y2ot0hbZLWbnh3vX8se7/nLiMc794sSbj
	M6aKWQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4rvcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 13:59:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9431a97992aso9586738241.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867940; x=1770472740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3s8GuETxl5AklqxiZ+dsaNTgW8Onj8c//rAG+Um/F8=;
        b=h+Zw+SnapzsM90hFCFpFNmYrDqOPALWJIWCPEsi/dCpqwSLnLl8Ll4sI4lKaylvcbf
         agbTccASuQL4YlEXg/y6PSVWBJ89f2qcSpGkAO+ym5IulpYrIgoaPE6B31HgteqybIMb
         XLWQv+5/EcpFUQexASweh5zfVUnkqEYh2vg1UcR7PSM2ATLKkEg3L/pTAr+R3HhTLY42
         MafJ/r53XxAdWOf4pmhx70gZDFfe6j9hidf72glC3FKAg+0Y3fekfaC3EZrqDnTrd921
         5dps4a8Nyq19xk4CWfp/3f7BZWgDXke/hStd8wNMTxwFfEeQyOVph0OVTweQU8c2AlNx
         xT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867940; x=1770472740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3s8GuETxl5AklqxiZ+dsaNTgW8Onj8c//rAG+Um/F8=;
        b=Uv67yndY4EXYkQlLyyRAT+ld3vtCk4uYZ3TAeUOsw/RH0YHjpxn8vtMg1D4rVbDFgi
         9BTaJ/S4MkHIKhm26Ge09GStv6ktFtjvbvlg0XbdQKC3nSc5vEL+gBZFhSPppfa0JMvB
         cXoB7iLIhnjJV8sd9XqskTVBfm5y5EYzYMYMa9M4Qt5QzsUpQujcs9vj+s40/+W2FYk6
         VKwSUJQiCRuDJNZpoHMr96a7DtPEesdJbt8fKUfRXvNswrbr3rIPne0Od/LC1AZY9qvC
         kkWZBthm/b3QskEzyvR9UGClx4iKxQKxLds75gOq2YDDPD8KfjxZ3qDmRUV3Sde4V/Pn
         JL6g==
X-Forwarded-Encrypted: i=1; AJvYcCXeQnbJfO1S1r8rTsfdtrRKvR4yVkO4nplleJMiH3kNqcZQ96S525BnaQ70y7RgmxmcuA5ayK8qY3HGynXL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5fK4qCiY7KHxKKsXYKI/kAzJEHSFcxO8RM/Wb/YQHiDwcopTf
	FJgaQg07NB5++30QUISfiqDnCsBzEffLytMqetIFjYZi6DZaQrbYHgKe3INJwgldsboxe6wLhM8
	ZbdX5RavEwVuRto4b2qj8+F51KHZpkJN8U+gW4ArM/m6Tk5mLwO2DTZejB59XvQpkNmnt
X-Gm-Gg: AZuq6aLW15oGlc7PATjoo/8VjvFdJuWbdNeyC2uVbWmMGqmqQy3Srjmp3s8a0mGBEW/
	KY0DWPKEqnuf7x0zeGq4jfNX5CCZzR/pVpt4KEO9p4+VgPaJ++Cn0MRufHSloaTFqTqnLp/1Jrx
	lS85y4plY+17rQoG98hiVJdoJ+T0MA2mRUr2DSId8ZhLKC6/FmThJTrYH56zoZhmePHmv1hyydQ
	NTIWO/2k0H1NO9ag/Xq+4Vw6xgOZt3epn/g4Qy2ueE/4GFVVnT4lMYtX8aoUtOfAlMSejk2hTWA
	+0GLn8lm/EnR9S80Ut9jw9FV2X5KCMWFUUiBEA/3+3BOdlAnIOLKMu/gMnxr9S4SbjAzMaCnlZ3
	ge4BMfJDvYluzFI1wfga1FIxCSGQk0DBvE2F6yzp4eXRLuMh0nxCudFBnfRwT65d8z0gd/BhxWx
	Y+mh3qGaNkjebjCLFCC7VIgog=
X-Received: by 2002:a05:6102:5092:b0:5f5:1256:5e4d with SMTP id ada2fe7eead31-5f8e2464410mr2254918137.2.1769867939691;
        Sat, 31 Jan 2026 05:58:59 -0800 (PST)
X-Received: by 2002:a05:6102:5092:b0:5f5:1256:5e4d with SMTP id ada2fe7eead31-5f8e2464410mr2254904137.2.1769867939284;
        Sat, 31 Jan 2026 05:58:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:54 +0200
Subject: [PATCH v4 5/5] media: qcom: venus: flip the venus/iris switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-venus-iris-flip-switch-v4-5-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5432;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OzD4FTK6JV+5RvDrmyf8OgLghGE1je6zg8bW2QD9QnA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfgqcwACF4Kxly/RoVtv6V3U6XjPhT5z1WlsEa
 RnNJu+7oleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX4KnAAKCRCLPIo+Aiko
 1bE2B/9M9BoOKIhEY0BnR4LEyPnUl6Z8TFYtOzDaVOBiHp8Z7jaHIRgB4QJ8a/ga4l5D9v7MuYW
 0eYKg9ODeBV8SWtQRXazGzdEXKCmBIY74enV4lmlo1UFCtSPP7rU75zU+qwmQxDlcqwDVW5Li2i
 BfAiBRdqrGWS9eZR3UP2qy9cTItQCv/0xxrJxaXrDItERGX7JtODmCsqgrlPL8Cf0D3fW5XkvYt
 uaQ3cd0txT2Xc4gOjENK8NiEgdpaKCEaun9PQc9VNqtAf6LeKz40G88bPKjPVl3lnYdC1eZfwUE
 fK5jQM4IqDTiHxpUuv7Mly66B0B2oTvpRJ7uPPHADM/Zx7YW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: giQ_w02aCKurTWBs2JVJJ7Ycur8hdPQQ
X-Proofpoint-GUID: giQ_w02aCKurTWBs2JVJJ7Ycur8hdPQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfX78Ka9d2CnydZ
 vqg4eeFBSi7A1da77Aeu25zyrHWgMDqhjVCUYFRbGK9K2WiOSU2L/wUDGHkBcMPM7a+XjOGVimS
 Otwgsbf56tLQ1djqd72bQlbvzOOooPpKnddItmKpfIeoDMRgWaRnMhZ8G1+G6bytELEiHYAv/Y6
 4wbxfD1CGxJEFJGxXzfvEzWgfMfWPIMyz1NKAhCwrbSE9lLWoREIqdT3T5MuF82V21fi5ZZnhmW
 G3TdpLoeQZZ+lj9cNMvyDxLJhEfC9sxTyPAl9gWu360ZSc24BgWU7iGedTYdTMpm65JE6xo8r5V
 egoaG0Jk3bPa5ZDtjW1jeBRZYcQZnLg/9syk4myn8TBtfj1PaaRB/6UDM2dBqhJgNWdqT6Ecoe3
 2c738UP2fFd0fr/Hj+mvKDmF0EZTAGjV8ea2YdVkkwymiUfwsYgSTZYHxO8ZjmnjeMBnyhcpnfh
 IFQpX61FS6cXqzI0QEw==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697e0aa4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PTCOktDilvW4XOe9n6IA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91374-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE36EC2249
X-Rspamd-Action: no action

With the Iris and Venus driver having more or less feature parity for
"HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
switch. Use Iris by default for SM8250 and SC7280, the platforms which
are supported by both drivers, and use Venus only if Iris is not
compiled at all. Use IS_ENABLED to strip out the code and data
structures which are used by the disabled platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile     |  5 +----
 drivers/media/platform/qcom/iris/iris_probe.c |  2 --
 drivers/media/platform/qcom/venus/core.c      |  6 ++++++
 drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..2fde45f81727 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..7b612ad37e4f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
@@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
-#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 24d2b2fd0340..646dae3407b4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
 	.enc_nodename = "video-encoder",
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
+#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
+#endif
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c7acacaa53b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -54,8 +54,10 @@ enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
 	VPU_VERSION_IRIS1,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	VPU_VERSION_IRIS2,
 	VPU_VERSION_IRIS2_1,
+#endif
 };
 
 struct firmware_version {
@@ -525,13 +527,22 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#else
+#define IS_V6(core)	(0)
+#endif
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
 #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+#else
+#define IS_IRIS2(core)		(0)
+#define IS_IRIS2_1(core)	(0)
+#endif
 
 static inline bool is_lite(struct venus_core *core)
 {

-- 
2.47.3


