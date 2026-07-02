Return-Path: <linux-arm-msm+bounces-115976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6S2HOp1QRmpVQgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:50:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A36D6F7072
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:50:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e2Z52gn8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AcjpJDF5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115976-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115976-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8284F3100387
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D3F478E36;
	Thu,  2 Jul 2026 11:42:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62D3D6CCE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:42:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992539; cv=none; b=YNoKIlzxhh0CdnscLO6y9MrZlfjwkC+PIuirlX8ix6az3FuoKdswYjTZJMJ4TlR/jFwr/KC8mmJnU4KxSUoRYLVt2opcmSb7XX3gO4cx6Cj/CoMgXEm/+ydx5Pj7nV8AFzLU/jA6yP0+bdu0t3Yxyt33RuKQhjd14fgpz8qzQUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992539; c=relaxed/simple;
	bh=HhI7UpvSknhnFNbcEbOCngyE4YZQ9GavkB23UFY2kEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e14SjyXogjEns0HKr2v6VNIMCvYVe8b8uSCuKevVgBeb00ipzzY9pPPGmcnDn+yLeJC5CjvgMKEk29JntqTt7y+bYobc2c1QFlyQ65w1f1JfqAmeOvpa0cTivtD0/QiG6jWajdpRorZXmSmo55x0TW71F6seLhAuvO6SeeDj774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2Z52gn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcjpJDF5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AkDMW3592277
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nzxpecyep97AV+PFFM2s8J
	7aEQ5A9VbWiiK0LxrKfB0=; b=e2Z52gn86L4F4ZMZns31DEk+vE++kUUKogqZtc
	432bhBqVlrpjdNOYsru73wTFEurhecPBV2LyghMfGTI8kJUY/k36UwLIq5QcwsHp
	+mShEnB6Dp8LsXnT6U3c1/k3cKFSFNUhJewvjq9Rwu4TJHp/BdtiI0ou1JHMylQv
	HhmTmfFYvDlPMcaINbY2Sfm0adjodlPuUs4ioPlqxwaUFbx+4EMHW7OAqJcz93lx
	ByCicG1eDM0ZIX0HuOrU4nFGYYJru9Ioapkf75/v5beODoeyFfH2o5mw7zQnKDx7
	do3kKcI3g5A52SeCQcoJtEygeIgcIk658ukQL1Ba/hHz4akw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9gsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:42:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84777e9b51bso3362348b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992530; x=1783597330; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzxpecyep97AV+PFFM2s8J7aEQ5A9VbWiiK0LxrKfB0=;
        b=AcjpJDF5tSsr9RkZ40dZ7TAKdSXI8KGLTcUStHuigaT3yRGWhLrHWkQdKbfjmouEtx
         zNRwqQNfe/4U3upxczd0q7PzcnIPV+cKyF5l1hF4B5dC/JROniDipk0dz9csx+pKa7fu
         R/CSOXVoAiWjTiz5KNM60MLm6x9qaDWjsecyNL42DaVZFcSOQOFZ1ytIWsQgt4G0s57s
         p09Ua4TCLDJ3ilnQnUNLC/eUwGjZtCyh9Pc/kUV7tkbgcL2RPKkx3aR73N+BHU5Dp0DC
         evt9/b0nzDHNNeTPeKhDR7Y5YTaIjbdJuU2ztZ5ZHwNBNmHlDDqDMd+nxkqdkdHKFghV
         dIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992530; x=1783597330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzxpecyep97AV+PFFM2s8J7aEQ5A9VbWiiK0LxrKfB0=;
        b=It0ocFxnQHRW0dgQlBzAHI7vSTHmoVdgSx1ECMXyyQAcLMCocF9dQXVgnteoDRkffK
         rIjnnD4S/7qcZ6vi+l+rEQqAWfjYMQ6XY/ePL7ADHWQ4fmqJ+BRSXCgPKcNrRG4GFDzW
         DX4SLsXjUioDhhPGupgo8Ac66o3ku0a5hlhxkCrF9r6zoKQxSvLR0s1B4bcN25ZqUt1v
         saigU2lIRxHFNMlCkAuBpFnbUD8BdmKgcuCfWjPOxlCUBn7y96t06zNKJW2cXMaS8k7m
         v/KTH+2L+M88H3SxPFdEIaGCuP8TVKczOb9VsN/bxfWX1Vuk9lv0+IiSxC4BfFWrs9DX
         Le/w==
X-Forwarded-Encrypted: i=1; AHgh+RrbY1d0rr8edB5bG0vG7e1xwGSZMGXaEuO4ZJCsJWMdsRM6i0bWeRbhUbyXnNxwbnp7VWaZ6CJJFrzPxl2g@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLkfZ1JBPqicNMUJAfyJNQe1oDUWj5ZeIY1SYx5QSQ7azOYkM
	Bp+EAE00gxDhKMLcG96C9houDF7JzxuPaf5rkhs8Q9ggpEuDf7opUOVecHLrq33wT/3QATv2KO1
	PvBxs+c0m61QdvJyNb9OBSLJpdAfNNFv5rlVo2QArE/b6HCofVXgq95vvACA0yCklytZD
X-Gm-Gg: AfdE7ckVRNnMKdX4RCO9WogevtY5Fl9lc4WqlBexpAT4vfE8R5DIbuM2mZgFm4EbRYW
	UzS+Q2VJA3RgNqXrhZ1s1AxFzaWq9t2nzwBNrmdCvL++cm4ZhOWBnRLWL79CtJ+rtTEF+/9PE/V
	0jrn8zWZ8lWCS1H84XY/pNi10cbS2A9Iqm10wTQtU8bsj9oxmIH/X+WFe0EfGewGOz3CMl7/1HB
	rQkGLbm8qoGApJ8igUL69ORXeo/hUxtAc+oHYGY9oy4MVMomlyNWkcpV7thgpdo+VLkK7JcV2EC
	R5rU25oAxelvs95tLVI6dTdhKrmUx5HQntH3PUaK66N5EWdValUopZLFR4oP47pOo16z/NF5tdX
	yWpIgooyjhQbcoOFKkfYS3U5JUc8YJtUDoKJ0zF99TU7R
X-Received: by 2002:a05:6a00:2e08:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-847c5105992mr5024521b3a.31.1782992530237;
        Thu, 02 Jul 2026 04:42:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e08:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-847c5105992mr5024485b3a.31.1782992529663;
        Thu, 02 Jul 2026 04:42:09 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9db855sm1231089b3a.55.2026.07.02.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:42:09 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 17:11:50 +0530
Subject: [PATCH v2] serial: qcom-geni: add force suspend/resume to system
 sleep callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-add_force_suspend_resume_to_system_sleep_callbacks-v2-1-b79e254a7015@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH1ORmoC/52OWw6CMBREt2L6bUlbsIhf7sOQprQXqQLFXiASw
 t7lsQN/JjnJZObMBCE4QHI7zSTA6ND5dgVxPhFT6fYJ1NmViWBCMslTqq1VpQ8GFA7YQWtVABw
 aUL1XOGEPjcIaoFNG13WhzRtpWQqdJelFxkySdbgLULrvfvrID8aheIHpt6etUTnsfZh2q5Fvv
 UMgZfwfgZFTTuOryXQquE6kuHvE6DPo2vimidYg+bIsP9NhbNwNAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782992525; l=3586;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=HhI7UpvSknhnFNbcEbOCngyE4YZQ9GavkB23UFY2kEg=;
 b=LvUsIrTmtABzRNBUXaRIRfbnulkMCiI3DcqB6m8s9ZtDYXqcfNHjMeLXGbbI19kXC4nML9vjr
 Jrlr6rpzxJSCZZsHtRKH50Qqk+bZ8mRWdd4NCtKor9mmEBKUXDSfMnp
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX5jouoQPlJoeZ
 fUmAx+qZ6xZSPsxLUOsV7J+7EyT+1o/iHdNELdOOIIyqtlRhhr+bZd+WVu9KtUpf6Sj+PYXVMiJ
 TdVDWO6ZZChtdSga++uJn4RpJGdDySo0HXk7E+w02Dbf6/df2mMPEU/dF/u0DIJFATQ9B9rYVX4
 v3ixKf9j87xsAyn3v57NmadTeVWN+WbmSHWR7/OCR2IDa2KLqc2w8qOyY+rYquwnAAaVUjJvSM4
 OP7bODiX/+MDjDe8iy/uEOlvZmiKaawiAUs9cSRkcxAy/Meru4wGn+qBRwT3dkDihKhml0g4uv5
 3R7ftaSzp+VI9AiwSFLsW9i6rPM9eDSM/z3c5VjsBT+Pu060aRClZRRLsyDIuWF94yd7LvVqry6
 5fxDaEXSFIRz6x3avJ7uHX7W/yT6su2Ka8m06UdoQRfiGg05zrG9K+DV+qhNiAAG1D/xbBR+ajJ
 ktDbasX/ZJYVQ2zpKwg==
X-Proofpoint-ORIG-GUID: U6nenW7CNdfG2cci5oifREgRDwlDLYOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfXytLUYfzBzYcy
 OiD1XEnfaXB0cjw5SoKgRN/SadL/eqVhrBYqvCGS01my3TKCwhE+HS9qt8jwqiI/HtLYcKed2vV
 82vfpmLQFSb57kteFVXgyTHyTPr/X6c=
X-Proofpoint-GUID: U6nenW7CNdfG2cci5oifREgRDwlDLYOn
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a464e92 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=rFQNHX_iIj8PGKCmY4cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115976-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A36D6F7072

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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260701-add_force_suspend_resume_to_system_sleep_callbacks-v1-1-38c9a721a462@oss.qualcomm.com
---
v1->v2
- Used console_suspend_enabled instead of uport->suspend.
---
 drivers/tty/serial/qcom_geni_serial.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e6b0a55f0cfb..55c9d716bd89 100644
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
+	if (!console_suspend_enabled && uart_console(uport))
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


