Return-Path: <linux-arm-msm+bounces-109423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOWhIJe9EGqjdAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:33:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC955BA163
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B308300AC12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99739379C3C;
	Fri, 22 May 2026 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvQcwwqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSFWRQy7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48506356744
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482004; cv=none; b=VIv064npG3T3VKyJYSYOhvQCaLEmjkOitNt6IJLApYvfn1Buy5PRyvdOszS6kt6k0qckrs8+i9a7FPq/SIEP7enXoFo/znspCJzy61f0MHwF9bCM43AtLqyEGnXj0+/44Je28Lct+JsBRQrg/IYnoP3gZFZoqSzzn3FnhvC4Y8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482004; c=relaxed/simple;
	bh=xiDCHFCDmMw1mfCNRPy2n3KxieEbCopmNMNgiN0B0Ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QSeBx1YNsgLfC1vAq9uyI40DR5d7AMVz+eswNdz+kVJLTbjLyIoE4N5XeMHViYGK6gzSsXAT659SfXwVHdZgMTClfbp7zFRWctJ/6s4BMHsk41L3QiYuk+TKYbQO2hs4iuH1y+fWQ9P0ouSlUqmsCct1lWHgNa9roZiC8RgFa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvQcwwqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSFWRQy7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGFkhW3005223
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gOK+R9U/j/C
	9n/YEFyMIKWRquYjE/YeWpmqvtSU/Xig=; b=nvQcwwqcukhxxAguGe1Xv7chshr
	T8yq6u3Eq6E6cJa5E4M+l47iatXN7Jwi1RpnCPV4oVXqqagjfc/+tRFUVU9raqNU
	0YmNryDdUB83P4ykFA57dA714cKT1L5qqLLR/WVTa2OYruCds0weWCzPbG93YXMt
	UxVGhurDrIeVU3r1PyxPsytbwHTz3j2x9bprkST06QG+NTg3xwIqDCIIrYM88ifQ
	aNEnxy02n7lKV2ejTdYufLl8wO3EF+fG91RqrqNF8/w4Jh/VIaIXiWJpMc25zzEf
	3x+NqGtcTv/ZwqySMJlonQAMJ+AO+4NdfFTHhqOHBRmh+FKzqOYMStlbucg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbtn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:33:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8386367b23cso5378131b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779482002; x=1780086802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOK+R9U/j/C9n/YEFyMIKWRquYjE/YeWpmqvtSU/Xig=;
        b=RSFWRQy79J6mEv3SCn2NvFxkYneGlh3QVUC7dm3+QzUKXIG5YkmmCThknumGZ+flDr
         8uhW3FJ6Xxeu66mmzBBvp9i37vDSz92XUnlrVhefudHY4xPn2hJbPcjlTbsztXXEsLEv
         EBL19eUWo2MRHPx78aezan6fSereJUSLdC/k8nNdBZKNwUW/KGtJEDDxa8tiqKBs9lo4
         ZVzGJftStZh02I4kUSEbapufJZfAxQGoYWvEqd4w9MICs4jesWVOwCst7XC4dv7i7yDt
         Jatuad0JRphXmZw47GFSZuurkzOVNzFRM/aAF3yUYUY5b7weht3KeurY9PAUfi0b2J3H
         TUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482002; x=1780086802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOK+R9U/j/C9n/YEFyMIKWRquYjE/YeWpmqvtSU/Xig=;
        b=iapDgph79JEMFR2cfcPFhHD1EEphbbLOUk/hqpS4/i+ompGZF28FC7YzZnMTUqTAV+
         RlSTq5tuRR1m1QhtjMvSeOwivBpzYSacnAAFC8Mos+2pBJDBX6a7jv3001X6+50eDN12
         z1b5f3ipSP9XcDlQukwLXdMKuFGaniDa8em+PKO5ivTvmQW2DLQrinD4+wTd5LU2BMW2
         EVz7Ykp705lyMsuLTGINi7lCQ3Y7JDBsFp8Jd/WgHgnFcBP4+U+J9V/9Ze047+8gzY5I
         IRFnY9ZxapF627kvMBn6uyRWAY7H1dzE6k5Y80Mt7S7Jq4knX/x8OCPDhEkEnIsb5LEv
         kThA==
X-Gm-Message-State: AOJu0YynOSQLg7KopeJ2Awz/uYx8X/zuYN6cOSn3Qz3Mz9P1K7NvHK9H
	IhdNWC4xorEfuQLehsl5EFBznA0+jQTT5SeyUhxbw3Lja/98JcfNzF6RZDM5T/AlAx2mi1q2cRo
	oq/sRvxA1HeJAMqgSFHRgXggTZyi/uFd4Cl/NCoIO40sHBb0Seq/JbPAr2juTKCwHnimf
X-Gm-Gg: Acq92OGwOU91eFDhmdbxUqlaDMK4mNRwfVa/MzLEAvbG0Cca2WWqJALUZ0JiEO8Gwxl
	tLNpIz0Xq95sLUjIZxIBjKBrbmVKhViFwJwze7D2HJV0vNM8ed3qyURzeqB98yCA+5TMWUxX6V9
	YFhG54eVmql32tZudVWrKHMMvDleuOMAyHd5fZ3rFhoOM9HlZ4LQGNqNYlcN1Gt7Cmo2xX8gcQ/
	OzvFFs/yK0Ztc08XiP1EWMrzMmZsbssxjK/w4k6QeKNBoIDIAoGnTq9y2pdObRtBO8gS4ZEVao4
	PHpNYYnHMmtESc/HzCz32d6COeB9pXOaISEvETRa6++8lf2d9FC1C2fb+COtTVb02cn8uG8aMy2
	y1C5PEw53/l2e95+E7wsaspWli/nwds8bjjUf1ocShV0e3C8/dQ==
X-Received: by 2002:a05:6a00:887:b0:835:41f3:f43e with SMTP id d2e1a72fcca58-8415f3f9783mr5324928b3a.16.1779482001818;
        Fri, 22 May 2026 13:33:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:887:b0:835:41f3:f43e with SMTP id d2e1a72fcca58-8415f3f9783mr5324903b3a.16.1779482001368;
        Fri, 22 May 2026 13:33:21 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9c77sm3062251b3a.2.2026.05.22.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:33:21 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Sat, 23 May 2026 02:03:02 +0530
Message-Id: <20260522203304.4065305-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10bd92 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AVCyWFV1gjYqDRSFLWIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwMyBTYWx0ZWRfX4eh68/+5N1pc
 Xo1Z3bjw2DlX/nERnarfhHQxzcAehnN4p+X7JJCgD3rO/9EEN6r+r9FneS0VRCbG4VmjfafOdCs
 /W9FJHPRtHGmw4Y2ppMqOIgca279dc9L410ZLgUBcEuIrHadZgBIVhaCZUmI4Fwf6/pYKj2PP5B
 NW7S54C0k5Z051xsA/EnMGUbtDOx97c9X8PNyrwEWPCRLzxHYnoPPSL1akyQtlE+bmzrRsTjdPs
 7w2aFDQUFNgPNOWWR6eHAC2Zt8du5JafswR2+9lbhK/Ichsf+OKQVUl7X0hlVmFZbIN8RIY+GOs
 Pc/XPlOwrIftm/p27nHnd1jcrUCX6/WdpoOMp5Rshnd5IxGw81BfWaQ8dmtNayyuRCjgZ4ncWO5
 rfi8nCxh0jvzTXlOLDKQJL4IfW7xUjm7fd2M1Fc70P1gBsNNZBbuUyzcx+zMLPKixJyoTgm65YU
 NKykT6GECKZtluLfngg==
X-Proofpoint-GUID: eb6m1GzqXldiSoj4fJmLXtUBOruwYcqi
X-Proofpoint-ORIG-GUID: eb6m1GzqXldiSoj4fJmLXtUBOruwYcqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220203
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109423-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDC955BA163
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series converts LPASS LPI pinctrl runtime clock handling to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The series is intentionally ordered for bisect safety:
- patch 1 wires runtime PM ops in LPASS LPI variant drivers
- patch 2 updates the shared core to use pm_clk + runtime PM guarded
  register access paths and adds the PM_CLK Kconfig dependency

After this conversion, LPASS LPI variants sharing the common core use a
consistent DT clock flow via of_pm_clk_add_clks() together with
pm_clk_suspend()/pm_clk_resume() and autosuspend.

Testing:
- Runtime behavior validated on Kodiak (sc7280).
- Wider runtime testing on other LPASS LPI variants is welcome.

Link: https://lore.kernel.org/r/20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com

Changes since v5:
- Rebased to current linux-next and refreshed the shared-core conversion
  patch to apply cleanly on top of latest LPASS LPI mux-path updates
- Include SM6350 in the preparatory LPASS LPI per-SoC runtime PM hook
  wiring set so all in-tree LPASS LPI variants are covered
- Keep PM_CLK dependency under PINCTRL_LPASS_LPI where shared core PM
  clock APIs are introduced

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/Kconfig                  |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 144 ++++++++++++------
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 +
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  19 ++-
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  15 +-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   |   7 +
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  15 +-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  15 +-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  15 +-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  15 +-
 14 files changed, 209 insertions(+), 72 deletions(-)

-- 
2.34.1

