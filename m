Return-Path: <linux-arm-msm+bounces-115577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsZ8L4StRGqTywoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:02:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AE86EA138
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:02:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K6dm5sSM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FFHGU8CW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A7E930057BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 05:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B7B391E4C;
	Wed,  1 Jul 2026 05:58:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E81531E8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 05:58:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885490; cv=none; b=S9r7B+ERJU1XtJOGxwO6xlB7zKork+6OdqtJu2NLuvUWOvX2GGQA3eqPmmiG3KGDzhNLAKD1xM3DvlhxjQxm9yPKt+OiDrJ9GxiXTjElDbOx92OK00m7BKhkg0qHU/x61I7xkvvAr094Pk5wSNLdsZDRSh82bMuJqJ5usV92STI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885490; c=relaxed/simple;
	bh=fzgLrdFqaGE/mRZaqKqjgHoSCum31HKjObovYE0bB6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZjX+eqX1zmqRZTi+oz2K9jBTt72EvTctTpDw5ktlJPXI4mRQc1yqoKXxRJszZa02iiok7y1VbeRhht5NZhVHABwei76mgP52jNloBoXj+f5PuCLDfGISOoeYAA7PIwS+YZ47KkTNaKGEKTmx9d6wIhl5fiksmKBsjsuiUpDXiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6dm5sSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFHGU8CW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lOBr102899
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 05:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=55kJi2SnGb1ozpyhdpZLPG
	5yCmn6dbu9QqA2uo11k8M=; b=K6dm5sSM6BOieA5aK/kIdWS5VfTolEk780PiRT
	9QWbhbLIVirDCNLmcPHXX5PUlkmbjVmh0LY7Qd2wFN77+H7eJKcNpUNL7a8XsBNm
	OQeDHDMScGxnR32Ozsll/Yrdl6UDA1lS7QhE+xmxKAG+onaRFzF+WwukcBdhiQIG
	Pole1MHU9NJTCi56MseOwCiKdfl5Pb9jM3PcuEkWqMWf3by+wZf/Si+xCvwChtdi
	ZZvFOn2BvcdAmOCpWmruJRPqoX27j7yEETp0LfigIB2ctAYp3mXQICV/Psxq015S
	ScbwoL/tuUuqAUySuzgJsskLLVvcgCB3oP42f3D2iOcbUm9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwa9px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:58:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so518279a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885487; x=1783490287; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=55kJi2SnGb1ozpyhdpZLPG5yCmn6dbu9QqA2uo11k8M=;
        b=FFHGU8CWcopuKyTmnSuWEgfBVs+PUbnXGLGrITX3aTL6ITojeZeNYanbSXEGZiqkif
         Ut5rJnFsrzTtutxhJVud9lg0LJlNJORciINEe4zgkxgZirZHyvF5QBHuxgvLzqLi1Y44
         yjkE4M3pT2FmV8CGODqLUm3sSybd+IZavjc/JXVIbzryg4wiG3TGXUNXWq/TpXK45Me/
         +6ZbRNawTgHC8CpceaCeifVwUSvS1XXUj+kJVlNewwHFp24Bwdhk/KWOTjwiROcjDWDo
         WNkkiLOP8P7bVU9ZcovbZ7gU/9ndkH3mjLHBSxLXnEInqkdpU3N3Q4MgC1iUNd1MEkGm
         mqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885487; x=1783490287;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55kJi2SnGb1ozpyhdpZLPG5yCmn6dbu9QqA2uo11k8M=;
        b=XtPwt9rNb3LBkSH5kNlQZ8q6Q+J9PIWiPsqcUoOA9shSp3yA+CFESvXYPLufL7R9eg
         jhoDHynzl2P/36QKQxhcLrxj2C7qlId+eDv0XFj4uHDX/ouURC2TasKVa2QR/dS/+am3
         mWuXTUydWrkQEip8zXviMVCCtEjHZcW4YY7QNgehFG+FSLleyrIypI2pVD706Raioihb
         DlH5656Hc6qEDwiYqFvP5nIKGOvEePFs9XxQpYsae5oKO+32c0Oux+QYftY359t0QGWO
         /t/iXBWG6TGI4PbjsiPT70mwiHcp5GEwC77wdU6ePNwLGg75wCkne9sP6UWCrhY0xjq5
         30Xw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7MJ9EAEje/VVMY4A4lnl+dEQpYlJX8vRS1UBZQQZUUE3xN6LAvbhsKXmRV6+AxsBRS1LWOCuxvn6HMeTU@vger.kernel.org
X-Gm-Message-State: AOJu0YxeMQqhL/Cp+7VySW3qTpiMz3UfqE+UjxrxTrhnAQisKYVeEG5B
	nPKc0TBbd2qazByjc2Jvbuz4dtxI0/2CDBDSbogAdW0IvJ0kDk5E311lBWfqd6A7oiczQBaAdHd
	gt+65N8wKT0RJC2rr6yQNz7CTtnjWMH1iBhELnLCHrkkeScWGd/iPtbXdPGHSFonkvNDs
X-Gm-Gg: AfdE7ckth9xs7d6s2OB4afgfPDhPdyP9nTFQji1O2kpJDOrzaikprqdO2old+KjeMWQ
	z+zToArQGDwNkJwsKwu58omnUpCQ4+jW41UP2Q3BU41HvcbFJmPJPGNv9fQOwM+NMuhy3i7b4y8
	WyhRsXZTvjxzrHaX4YaeBawPv7rbrDq5nuJxg+LrgZ5HhjTdBuIOF7uCL4E1WUdKFwTSRV0s4WN
	Kz3JN5lWt94r6CSyuxSpmB2+xteG6ItxOPXpPRH2vQjhql2tO7iECA5LF17MxpIFWIMuEgeH5UQ
	ASNjjYP0HtWtrhrRY6gQOmCm2tOaWxpqQqdNTcyZkjGTrSOC6CioVYSJDQGQsnmqy+gyFHquVXU
	HMx0Hs2YwytepS+apqvLs3/JUSqsSeWn2LgwsACRfdjHW
X-Received: by 2002:a17:90b:2e45:b0:37e:9e9:6ff0 with SMTP id 98e67ed59e1d1-380aa0bd330mr327879a91.13.1782885487368;
        Tue, 30 Jun 2026 22:58:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:37e:9e9:6ff0 with SMTP id 98e67ed59e1d1-380aa0bd330mr327863a91.13.1782885486866;
        Tue, 30 Jun 2026 22:58:06 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d76381sm1146375a91.6.2026.06.30.22.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:58:06 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 11:27:55 +0530
Subject: [PATCH] serial: qcom-geni: add force suspend/resume to system
 sleep callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add_force_suspend_resume_to_system_sleep_callbacks-v1-1-38c9a721a462@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGKsRGoC/yXNWw6CMBBG4a2QeZakoJboVgyZlPavVrk0HTAaw
 t6t+vi9nLOSIAUInYuVEp5BwjRmVLuC7M2MV5TBZVOtaq101ZTGOfZTsmBZJGJ0nCDLAJ4nlrf
 MGFh6ILI1fd8Z+5DS+9qcDs1R75WmHI4JPrx+00v7tyzdHXb+nmjbPtLGCsuWAAAA
X-Change-ID: 20260617-add_force_suspend_resume_to_system_sleep_callbacks-ff2a94756306
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782885483; l=3242;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fzgLrdFqaGE/mRZaqKqjgHoSCum31HKjObovYE0bB6k=;
 b=X/3Xg2ml/r+mDoC7g+ThTtawJlEnLJwotN2atbbOrLAHe1lsqs6VkAND+/LoxoBjy2iHwwUR7
 dKPXSn+MiZKAPsI4htvdgt0qtHzaSNM4xoeuKpGl1dmgcm0Ro6Z3ZmN
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: FzTinUQqUe_jCWFxcimBWLn2jjCiVCHB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX2HP/8sS5ERdc
 1bVPkQOjbfINEVTnJZ4ACJkowFbu+UUqGtWXfNdSxpNSdtpSV7wgymn6CdVKcbXCUmq+NqEnYVN
 j2rNHfnjFTVmDIoAMcFEue2KFzYw3rs=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44ac70 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rFQNHX_iIj8PGKCmY4cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: FzTinUQqUe_jCWFxcimBWLn2jjCiVCHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfXyUR4sOsmOIfJ
 fFG+cXVBYmsXFxsBAHVnudhMpKb82bncKnfKOBRV89VpsoT0cW4X7sMq90l55cyAT4IN5Bhl9cR
 elImXCyqC+5AurHnuk1E2Jrz/54SE81FL/dy5tKRmMdnBp2m6j2NvyNxorLBy79K20Xc+YQ7UWK
 xtWqL0u/PwjBtqnK/dBSHoIRjhv/U8d+KeAuU/SrF18IUu+achuiP/uvSRpZ72kGKC+E3Smvndb
 veEeI+zXSxwKn5Mq2l03W4ClEV0+cRnbuXcYoY0kvyN553VGYFZhEAVeXg6CAwInT1o142cOo3v
 lGWGoiRXXVTkKrT0gBXnIggue7eq0qhsWVo45HlV/ELmrDlx3dEr47VditQtk9dCODP3+XYEefX
 sX3Trjx5+gzXkRLB/Oto+eZDbL7Bsguv5kONIaDrRNhr1OYHqt8OIPAnhOOd1oSKQ39nkzAxSiZ
 97pfzqqK3HAgAfRYP0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010059
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
	TAGGED_FROM(0.00)[bounces-115577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14AE86EA138

During system sleep the hardware resources (clocks, interconnect) are
not gated because the runtime-suspend callback is never invoked from
the system sleep path.  This prevents the platform from reaching its
lowest idle state.

The system sleep callbacks qcom_geni_serial_suspend() and
qcom_geni_serial_resume() rely solely on uart_suspend_port() /
uart_resume_port() to manage power.  uart_suspend_port() drives the
UART PM state machine to UART_PM_STATE_OFF, which in turn calls
pm_runtime_put_sync() and eventually the runtime-suspend callback.
However, if the runtime-PM usage count is still elevated at the time
of system sleep (e.g. the port is held active by an open file
descriptor), the runtime-suspend callback is never invoked and the
hardware resources (clocks, interconnect) remain enabled across
suspend, preventing the platform from reaching its lowest idle state.

Fix this by calling pm_runtime_force_suspend() at the end of
qcom_geni_serial_suspend() so that the runtime-suspend callback is
always executed regardless of the usage count, and by calling
pm_runtime_force_resume() at the start of qcom_geni_serial_resume()
to restore those resources before uart_resume_port() re-opens the
port.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e6b0a55f0cfb..ea8a1f0a9e3d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1954,6 +1954,7 @@ static int qcom_geni_serial_suspend(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 	struct qcom_geni_private_data *private_data = uport->private_data;
+	int ret;
 
 	/*
 	 * This is done so we can hit the lowest possible state in suspend
@@ -1963,7 +1964,19 @@ static int qcom_geni_serial_suspend(struct device *dev)
 		geni_icc_set_tag(&port->se, QCOM_ICC_TAG_ACTIVE_ONLY);
 		geni_icc_set_bw(&port->se);
 	}
-	return uart_suspend_port(private_data->drv, uport);
+
+	ret = uart_suspend_port(private_data->drv, uport);
+	if (ret)
+		return ret;
+
+	/*
+	 * When no_console_suspend is set the console must remain active
+	 * across system sleep, so skip the force suspend path.
+	 */
+	if (uart_console(uport) && !uport->suspended)
+		return 0;
+
+	return pm_runtime_force_suspend(dev);
 }
 
 static int qcom_geni_serial_resume(struct device *dev)
@@ -1973,6 +1986,10 @@ static int qcom_geni_serial_resume(struct device *dev)
 	struct uart_port *uport = &port->uport;
 	struct qcom_geni_private_data *private_data = uport->private_data;
 
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
 	ret = uart_resume_port(private_data->drv, uport);
 	if (uart_console(uport)) {
 		geni_icc_set_tag(&port->se, QCOM_ICC_TAG_ALWAYS);

---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260617-add_force_suspend_resume_to_system_sleep_callbacks-ff2a94756306

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


