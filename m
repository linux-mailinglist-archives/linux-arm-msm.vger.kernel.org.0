Return-Path: <linux-arm-msm+bounces-96508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LpQBqrGr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:22:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF7E246394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF6713019813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA00C3E714E;
	Tue, 10 Mar 2026 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpDvCTbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCWK9rIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A941D3806B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127335; cv=none; b=el5j+Eiwp4AFRX7N6Mawdogko7JKYqbEX3/tbGvrnGQtBVF3/eVGrSp8pCS6B04/pWCV8FneR4By3A6jK3LF3n7gse6lNe5xOdd2eYfE+LUuNmo4J4dU82bJEF5/P+s+N30wcHSS345Z8ULp0K26GYE/zCGYD16KWtPRTEFBWBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127335; c=relaxed/simple;
	bh=3wPl/p7STummudz4gDu/8803TKuECDOrkGo5XhXfE5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W8Uqb0Pa3UaL5oDwrCZZJ4+T+nQsQMDco6fK/Y9tbTjrPwlk+xBhE6V98Cr08A70GqQ4zPbap0/hhtmdEbqMdIc2Kn0ITP5ieY1aSWeYYkBKNPhJwYLWmUuy+TW0KhulYN6DePiOZmAYYdK1Tqjlxn72McDMQiOxArVd1+tgAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpDvCTbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCWK9rIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQYH2460655
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dol8ejvArCi8fxJhixn/pT
	rEdqItoDa+4yoar+GweDQ=; b=CpDvCTbWVfzzjjBdjvtU53eHfiepBYmAXeAOYL
	SlNq1R/EA2OsMbEXSX3wyqBsSYEnGenOYiH2PbawJoGoRajGz7rdIDbXFTbeM1q+
	vwPJimy7a7hcawJWEw/mZx/yuVolH/K5EiDY99dPhloTYLkjVi9R99WLwApko6TT
	9sKznzJJPt0dITRhDYqpITefatXi2YiVDN1lgWfqmavTe7pLcRJ0Rub+L7+r1eNC
	j7Lu0+72PYX8zf3NZK1/4mYsiDxdbDMhZf+yOA1oUIW+lWk9FEu0ejVbOEYXTcVm
	cRc6AA4I5fgaGfp1JPgmHlQ9D2529ha0m+ciLiMZnZuviRdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1b3cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso113118635ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127333; x=1773732133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dol8ejvArCi8fxJhixn/pTrEdqItoDa+4yoar+GweDQ=;
        b=XCWK9rIwsWdI0eQBnPxu8clG8+UKvAyk9KetcSSwtD8Q8WoAFbjWjrW1kbSJG57UV7
         rigQPFx/11oltoM6FwsKhlr24ILUjIjZ4KGEgZa6TRtwsK0RMVDxuRzkW0L8cWcoGYEI
         sjeYnUpGkniutWAvBAsHNkWKvVKxLaeMLGfDWgy+NHMPWNlqB1JF58J9vSgGk9wQRDaD
         7+WoHfaYmRYkaxZiXd2sWL5PqL4abQMPIvgZduDXh+ZuKzH3zfIm2e0v+H6b73nZBDn8
         Snk9JLWcz7kB5Mx0rpgzOnyepr8G+VvEaNLDUdKAdqpc7Kpfou/T3HL0kAID2pZ+h4EN
         ptyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127333; x=1773732133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dol8ejvArCi8fxJhixn/pTrEdqItoDa+4yoar+GweDQ=;
        b=xImIyQx6+sZK0S4YpLELrfxbce++xvJVp3xbPHhlWF6p67egMkfgZvu887kaArwg/3
         qwPVlrRBzFukIGfw+2vhTYQ3G1fw/yVGFUNWaVaLlQyNP22lIPxVRxmhw/oIY+0ShOyN
         Wx0mhqsyqFjCdkBsAeTZvHVBXwBz/CVtRB3yq+CSud9lsp8MyLvBedKRS2uka3CwHbGX
         edtJsPfeqG2X6AWIeDTXgjBES1rIzwVhX33QnBSsmCTfbEt5FYU0MtRnpNJgqMpn1INe
         aepKWrGR7bReMC76ZZFPTQHsl+idMUhCO90dpu/AsYC3s0Enha3pNWHuRRTEDl7ZrXYR
         Q4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVfFQt1sovb9Vw4vvA4mKqg1hm2Va5P1Znwp9yC55kDwF6MjixTr4tP2Lv1o5GnuPgH2qKbXpyCpCiOHAmR@vger.kernel.org
X-Gm-Message-State: AOJu0YxqycE505bHTEn7hg+MmD+NzvGQMOl8dMCb+HbjctQf/4ukOuUm
	kNYNr+/MHDKGyHLLBKtHhpt/AfFDdFbKFqroeg1++Hiq+h+RZ2XuRL3UdCFtv5E7C4FB/oFVpjP
	TZIKFhMojLDP6xNbdqJmuuSb6VUBo7LjWmz2jf+iby+LOmAYZt4gSFj8H7kz5IAKe5HMn
X-Gm-Gg: ATEYQzyfSx8xRnvr8cptKWv7NwyfMsffl/U/f4U6ZdLr1B2z2ZYfTvZeJx1tGws09w9
	91abQWd179lsUpvDwtKvFeM2IGG0Kl7usQA/up68fxb+zO+ZLfaW005BPB5jMTX5xSYo2KqdroG
	AlKgdEa51/9n7fKdHazXFWiU2pS1bVFB/B18cGiUAaQWFa6Opd37+e5vtZVL4RoPUWhk9EwGuE5
	iO9EIvvAbdtcqSVfxmdaQt2e2Q6GHGG3VTM3v3qvp64hddmU0Q1phtpFTkAX+l4h9u7b8cpul5c
	EhGW89wWqf1LBwL5+WQ36FP5kAAQuAAYhI1xeAow5kHrmAFJ2lM9rtbMPa87lTKAwu8wCOs/CRX
	PLzjFpVwdEM+KeAvpc+BgtdC794ECZ4GoXqlyTudfBs9zEM3dQ7w=
X-Received: by 2002:a17:902:e544:b0:2ae:7edc:91be with SMTP id d9443c01a7336-2ae824eb08dmr124767375ad.27.1773127333101;
        Tue, 10 Mar 2026 00:22:13 -0700 (PDT)
X-Received: by 2002:a17:902:e544:b0:2ae:7edc:91be with SMTP id d9443c01a7336-2ae824eb08dmr124766975ad.27.1773127332571;
        Tue, 10 Mar 2026 00:22:12 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:12 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v3 0/9] Qualcomm Sahara protocol enhancements.
Date: Tue, 10 Mar 2026 12:51:57 +0530
Message-Id: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXGr2kC/32O0QqDIBSGXyW8nqGn1NrV3mOMMLMlq2zq2kb07
 rNgd2Nw+OE7cL7/LMhrZ7RHx2RBTs/GGztGyA4JUp0crxqbJjICApxkRGAvO+lkNTkbrLJ9Nep
 nNQPmHAqWC5GpVqB4PDndmtcuPl8id8YH6957z0y37aZkpABGCS2Bp0A5YSzHFN+M76zTaS1Dk
 CfrfXp/yF7ZYUhjoE03w1fx96s4BEPZKJEXNdOl+mFb1/UD2azRvwYBAAA=
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=5595;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=3wPl/p7STummudz4gDu/8803TKuECDOrkGo5XhXfE5g=;
 b=R+X2+4O6wl1uLwElI8uYBmMvkmi1hAd9Y17iMHYN8I3mG2QBTSAitqo0MBz7M1syDKRvRkM11
 bwLkwUA+HyIBLtVHaZSlIZHOcLvVHly/oznnoUyOzifKC8zILniRruO
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: ZCMCW-SMDp5Q3WpIZ6FMamc2ZPBOtCnW
X-Proofpoint-ORIG-GUID: ZCMCW-SMDp5Q3WpIZ6FMamc2ZPBOtCnW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MCBTYWx0ZWRfX7UCqkWp06AuY
 2Pz3NahX5Th860bK1W2IuiAZV05hJ3wYuizEjn+Kt1ZXdkWtU5Elg5qcLcVXxV4eV6grScp+UvS
 eCNSbBSnVTEYtEcWYzZ9m8otS+sOBhV9ehlCFMjZcuNQ4nkA0lSC2mRvNXEz/yo4oNEf2XNjQ0H
 Uhzd20LPw8LbrpfAvg/IVvaeQAumEdTThKzSgaPDxsdLhW/PaiC3RC1zCXP8y4MwljFit5T41nS
 wM2d0cbg+hCXBcatXaDdxNmjO+z4r5iOhDtGhHmGaHBdICafg1iWLfEiGz67/eGXv1pBw23xxRh
 OUmKIuPf21caNoztzATnUSPg0FK5fVsB69Y9cL05BeIF4wtmvDKXohQiPoJlXAHd6J8ygp1Mgb8
 J7qrojB38Cb3+cIZmfpZ37XqRMKomsmpEX6sEEvajTYExM1Rzn+JGP3fdwaj5gCwXra37nDHHhF
 nnPVpXbmwTemHmfflTA==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afc6a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100060
X-Rspamd-Queue-Id: ADF7E246394
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96508-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v3:
- Dropped the explicit image table entry for the boot critical image ID and
  added a generic image ID based firmware lookup fallback.
- Link to v2: https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com

Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (9):
      Add documentation for Sahara protocol.
      bus: mhi: Move sahara protocol driver under drivers/bus/mhi
      bus: mhi: Match devices exposing the protocol on the SAHARA channel
      bus: mhi: Centralize firmware image table selection at probe time
      bus: mhi: Add QDU100 variant and image_id firmware fallback
      bus: mhi: Load DDR training data using per-device serial number
      bus: mhi: Capture DDR training data using command mode
      bus: mhi: Expose DDR training data via controller sysfs
      Documentation: ABI: Add sysfs ABI documentation for DDR training data

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/sahara/index.rst                     |   14 +
 Documentation/sahara/sahara_protocol.rst           | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/qaic_drv.c                      |   11 +-
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/Makefile                           |    3 +
 drivers/bus/mhi/sahara/Kconfig                     |   18 +
 drivers/bus/mhi/sahara/Makefile                    |    2 +
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c    |  601 +++++++++-
 {drivers/accel/qaic => include/linux}/sahara.h     |    0
 12 files changed, 1869 insertions(+), 45 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>


