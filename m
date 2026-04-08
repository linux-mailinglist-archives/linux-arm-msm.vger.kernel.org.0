Return-Path: <linux-arm-msm+bounces-102293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL9FM/4e1mknBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:25:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E23B9D92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83CC8304A201
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDF73B27D1;
	Wed,  8 Apr 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zswt48vO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCQq1a9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9996739DBF4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640288; cv=none; b=lR2+6SmhQFpRFFZc7QWCfoGGypp+sKp3y8E2e6yOChPPce2nF5Zn7J7O6TrORJ6nVhF2Gr4CX4u/fR8zUmCVRwkV3S8o0FuD47KEEGDHCJHD11YHy51n9heK5C0O2gurxSO8+l4kDdPRDdART7ZOscCTxPwrgVqQuR251AFdRuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640288; c=relaxed/simple;
	bh=SeVhrCmMMgBwYneejcSFmSVfl//DyhXNi3vDveVJ4XQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HjoDahVZFEKgfQVglv3albpy75XgB8p+TYFbN09ivbZ+svzEssOV4PE7VxDryoLfWMv1g3oMxou9Irfhhp8ZH2uniYaoIMTLOK8CYiJCWLYGmbvgMASsPY18fM1/eV77N0ljyBz8lef2NOUgCbxdUDv3S9olk/8j8un+BPbwnhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zswt48vO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCQq1a9v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387GOKp2860736
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LYq4Jt+XYdQQaQAPEpxc1H
	QX+StRIGrVlzBYlaSQapc=; b=Zswt48vO0dNuieNTA2UoUtAsGGAslns48j/Os4
	2CdlH9RbT6EhZNuDzOc5F6IcnQcYSTYxYr28rAkvOlUCvsl4FYoG8NIPB/LO6H1A
	1QFzxqseSRSKEtADioXIm6jVXReB0oqfqeqb6QWGXJLZGYEJHrvQzTH1W+6Q23Ya
	3D0+Vwlzs0k8hLVVWxA9/ShSMN52rgzV8rTEuExznTskKFUrRt3xqpjEpIvwHUTm
	7ZB7ruyBgpbyIUK+7GQpAvWpEf9e9N8jQvGS4rtep0SnQoySutelbbVhZ9lRooWV
	mEN+zMQVJaiEBLGX/LnimBwCY9zgpP5CHcjzxjNQqueWkdGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8t2dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:24:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d92f8408cso7090537a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640285; x=1776245085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYq4Jt+XYdQQaQAPEpxc1HQX+StRIGrVlzBYlaSQapc=;
        b=DCQq1a9vrUh5Ut0D9Rep8TPg00C6+vphc0z6Ti/eFvNdb2lbsPgNLsporgo0cLGOJO
         Bn6Ud4Y0bWtYvqns8OmvR3MQntDNc8ccFh9/+psufq7gLVcaTmUCIc5Hpxuz+6OSGHmj
         IHo/nvWbUdMYiJAW340Nm61gtHHSdTAOEP+oKuZm1Eb4p1+CFVXbo+CRGOC3IETddJzO
         u0c20K7LrEphN5XMEWmZOuJFrbY030o+fuhEPvviHSBusDoVooQ1A9OOW8qNOwlGPjh9
         c5uux1GM42KGhYWFwtr+DptauROSBXBfZhnG6nRiPPXy6H6hVnj7LmxDmjIcYaZrktpe
         7W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640285; x=1776245085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYq4Jt+XYdQQaQAPEpxc1HQX+StRIGrVlzBYlaSQapc=;
        b=S9v/CE8Ai6DgQzxEWDMt4o8EV4/TU14itjhlZDtPAGRC2lo1RNbHXY8l7/kQTmrDxs
         UIrh4TrpJ1yZr3Cx2Zcz0sP208MPinsQ7qE+d6f97EomLwm3Vl0hyAMCmnmUhwkyvG/v
         aTbdrrZfhaem7/VAB/vcRDEWC5OEn3Fu+D5z7o5799QlMh6/1EShaiTD8/P8Oywu11zp
         qFI/mKMZXki+eqpUjvep1XSZfCg6ltvVUTzkJol8c02bGHWw6CpNCax5yCGW7LxqgIb8
         uHwc47QR1viL9WZY4sO5Frv/fp+rOgbUUWG/aVhvPfW5e4XEMoTkzFG4Hwf+Zetu4PV2
         6jaw==
X-Gm-Message-State: AOJu0YwcFnv2FyC2N5r3OVvzc4d6q9Om0kVs875EmCJWKstMqXgDPRCs
	+MMnlwzbMpAgbxe89BxHM/oTLdfyJRBc8KKay6NvPwy5goGa/u9Z0qkWti6sxXW/jIV5wJGIv+O
	JhDhQx14br9UgZYIrALCyDfzHMTDO5VynEpOK1kXg38uZW2woKtXSKlUlta7+Wum/q212
X-Gm-Gg: AeBDievx+Gkj868ijXbRoDkhtwasp5N92rNHdR/cuNf3/rJSPDh/BZtBxOEPj4Hb2VQ
	zOYzsx05R4ddhiiGzqACV0xJQ4Is3Vw44hPBYp6/SS2OzIcU1j63JQKG9Jnc6UOBMU3Z72of/ta
	2Ft5FixtDsXD798vkZiVi3IA+OHI/hOZtVLxXJPpUfdy4It0cEnSKNHO9w3qkhPi4Mf80r0pbsu
	qTCfHeRSl8V+ZFyADeqE/WU7oAEFwjhe8F8PkZ1r6ZGrVYMW6c0DPJLVifenmB/CI/GECB70LNu
	obbqOe5x/4rzTSMpZhGOR1AUn8k6bp2aJ+SR3PGuMulTpxw6nAtWfQRtq8eJpuihgvyK1GbJ0jc
	wZdGpScs+U/wZ0vZ7Sm2Es8HcLIVl6g3zSdcx05kjY5rxCfdokRXWdwiA28Xt7Kaing7VnTPg6d
	sr5WaOshhieOWS8sntnbd0fDYuBnR9JVsCppYKodRIQKrEAyU2bH6fq63f
X-Received: by 2002:a05:6a21:32a1:b0:371:8e6d:27e1 with SMTP id adf61e73a8af0-39f2f07fdc9mr22171972637.36.1775640284529;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a1:b0:371:8e6d:27e1 with SMTP id adf61e73a8af0-39f2f07fdc9mr22171941637.36.1775640284012;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18274413a12.31.2026.04.08.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:43 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v10 0/2] Add support to read the watchdog bootstatus from
 IMEM
Date: Wed, 08 Apr 2026 14:54:36 +0530
Message-Id: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQe1mkC/3XNwW4CIRAG4FcxnIsZWGGgp75H0zQsDEpSlxbst
 sbsu8t60QNe/uT/k/nmwiqVRJW9bi6s0JxqylMrAl42zB/ctCeeQhuYBKlAC+B/4fRZqNKarua
 Jo1MuEoIEVKydfReK6f9mvn+0fkj1lMv59mLW67piGsTQwWbNge8EuhGN9cHiW651+/Prvnw+H
 rct2GrOeHekVB0Hm6NVUCPSQILGJ455dHTHMc0BIfzgjB91jE8c++iYjmObE60O6HZGqjB0nGV
 ZrpXiaFmQAQAA
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775640279; l=3771;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SeVhrCmMMgBwYneejcSFmSVfl//DyhXNi3vDveVJ4XQ=;
 b=3Ixz0fjpayAy6gvEgzSoITkCKWktYAGZdJTmtvbMxuW2ihh2I85r+/sbG1LVA6IxdfEyM+hq/
 XGhoeoX/+1hBP4N10qfL0muRXYReBMFtuvh64vLgb7cloT8q7wpyAaf
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 80sW6a5BudukcPMizBxil_L5Dbg7ku2x
X-Proofpoint-GUID: 80sW6a5BudukcPMizBxil_L5Dbg7ku2x
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d61edd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfXwzx+ieOII7LI
 Zy89Rjzd+l3hnqTZkNoLMSGtmx2milJls68c7NoL5McghVL5zYixvIDC/ls5eBPAR5zTDESMP6G
 QHcCIkJlklNAvIiWkSmV5c0/lIw05gRCKb6K6rDDXHkBvNdORvdJoX9kVOjVNamn0/utgXNhtwB
 E8UU3sAYBNnkbek4pLDExhTXwYlO21mTL9xu0YQswpX7tFr9cFSDi0kDXeWIGG05vUTWdU8zzPL
 ViC7j8ez49HcwJ00978wyP/K9ikVOAkgE3ATcmpM4SyzPTv3bTQQziLJCinXNMO4aJRvuVkfz0F
 rsknV+Ev1LeVpmb1lp3ZMAHj4S70dq/5PAU7WtsH7kpI4H78n6qNVSmaSu7P00FPvhLA3RKZHWx
 vbLcO0O2pmTxLSs9T/NihKW216j/GAurjHZRGMx6rpsCT0/PJfZfwLiX/+RC8sT8pGjXubtri1L
 AXxmHLFOpAFc7NLEVZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102293-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D8E23B9D92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
- Rebased on next-20260407 tag
- Dropped the DTS patches from the series, so that both wdt changes can go
  through the watchdog tree and once it is accepted, DTS patches will be
  submitted
- Link to v9: https://lore.kernel.org/r/20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com

Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (2):
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM

 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 ++++
 drivers/watchdog/qcom-wdt.c                        | 42 ++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


