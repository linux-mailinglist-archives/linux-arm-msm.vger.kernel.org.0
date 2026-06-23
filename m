Return-Path: <linux-arm-msm+bounces-114100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aRr0MnQzOmqv3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:19:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E876B4CB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:19:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZTNcwfpI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hkxuacW0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114100-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114100-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE3E9303D4E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9E23C584A;
	Tue, 23 Jun 2026 07:17:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437B331EAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199049; cv=none; b=LI2wUjwD03sb3rSyLZQ42AW3MuY3DV4/epBTGE4cn0TmMn2Iu30QXzL1aUpHQhKCRXqgxLHseBJisGgaO61P3UU7Z0aac/IYC8EAyjnLdu0gEV5yMANPq04MbWM5t3udrc0PTh0olMxZ39SjOhNZaeTggZW69klhoDLn5+iTLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199049; c=relaxed/simple;
	bh=vo6xveCTcHb9cNQ3BQYzxEVs0uKejx18eF6seucc+ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NA/YWIY0JAW+tdRI0t3v2HW+EARUk5965W/fwN2ythtmV9phl+1ckFSGxIx/hx3Etw8lgHHe97S/y2GG9HV9cegUyDH/oOfNX3GOwIhx1/IrxCOgg/M4fxWYK4Niu6jicUCSinwD3x1H5xrbRURmo/50WhJwbMpWA+3RdHTe8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTNcwfpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkxuacW0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cjqh3563987
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9
	jekdVq8k=; b=ZTNcwfpIRuaW1MEGUBdiLxGgbePTz2l/JmE5kXRvSRePdcnLz10
	iZ5atQ9N6ZzXbJKxFVKOyStstH59XspN4/Spfx6vGFyh5goKVTjaAx9/SNvDu2Uz
	or5oqVKkvwScKCyxMFYl+rc9D02R2O0zFs+0woNOcOEsvOsJ9sq4PXZ/1KGrrmHS
	+wsvE+MTxZ1dEE9SOK/M9rAaZuRCq/e0hlEW/vz+pbQEHlvlLh1jXjy4y+/ecm2F
	e/yaM8xD9qGGP8hjAgFesCA3Ihm5iPFET2ifRkkebBiCmuQ3CBePACC2yNySARzq
	3XZeqZ/Bvl3rEJsY8x14TS/aXmbZsobHenw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43gfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7645ac9b1so26705595ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199045; x=1782803845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=hkxuacW01BTMpRREkrigskjhaEW1KQUKgnaPwFTHf0/FzfmXQsIm2+cp8KauPOQnC8
         kpv0y7I3HeIusa0eO647u7sKkHxWW3A7CoaPB9ZOXXOf3x9UoFIGlvCE3s67OogWcKwV
         rDt+feOExBCp9gb4FuG1X7XbkfWqITVVBzQJXBbhrxQDejNDX3SLfzNWfZpjV5AaVv+h
         E8QT3r3pHa3DJnfqXCFUHAL+6JmPPV7ffm1FxpUnvTMjhli6jnvlJ88+sWlzcbaScqXR
         9Sjg4b8npYPc8WrNDrVQaKeJVpM7WWqGnM7lC8uKutVGKCdts0irXDerRNSVipCYpM/z
         Qp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199045; x=1782803845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=pbKmLXnldffnXw8Xv8+YPWuPIXthNsANMu4qB/KmyalRMVjg2lMbwE7PDSyKImRGdK
         dZF9aXU1xCLe2QC6gvjM1K/PjjhE7MoNM6reLmJZhbYMb0HJPW44Pr5pVOwzcH5Wq6py
         uk/TpzKCmeDZTy7flW5QlN8lGQOPNMcjKtHg3TlXgKog5blvROuxa5OA/fELcRKkU5fS
         A+vNGB1Vlm111z22WTql8/c+B2xmMtjP+j2nqaoUNAS54hbxn6oyL9gRkg3U3PgmQekF
         f98NKgRKAcUmrXNXNSsdWdgi7vJBHWK9FwRqVhxucmuQ/lPiRmKZWbzW4r9kW/UOBeit
         w6oQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNPdPqzurFYMwhZtWKC6rrxVsDNED/82eUtXd8GNeEm2iBisMdNFvMrfkxLs+LcLoGzbxeM/xvB8ZaeEwO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsk5VjjR2ue650nXTEY1u80/BmRH6r+VW70XJ6BEua7KHcc2AJ
	ZENqCL1VeNlwXAl5lGoQC8ngGigIiLHlWg1ZIXyzUE9omFXyJt68mH3monoTleNx4TJELQQDbjX
	huEArV3HWnyiN/wQgXKBf2n10nPnheF9FRQGnVpENPRXvY87lHqw1enNyGXFnRwQ0y7C9
X-Gm-Gg: AfdE7cl4FJWfCrCrLPZc+14UkTw1HTOnInnYa4h9G/ZrR+klh1nGVEDkwaAcMIZzcB4
	p6H1RWxhj/aBQ0OG8aw3fFNl+NaskzrrGNusQhOiml0o9NmSNv1bmspJpPm1G690Kwr6CAr3j1a
	fQk5pADRBi4MvonN8nJt1E69XfwLhhSGyUkR1gb2HUgSv1A+iclTyOGL17rlC83Td82cG/EPlNd
	BrzVYoN5r4B9k3NyUF+/ANwrJ5whnC9+kbjJzdzkT7WfXttk4nfCrupnP+wLSJlfm4mHMlQOP81
	Kx0Krbdfh8GQ5vlaIZs+/b9JmOduGvdCotuOnElbVfM3SNV9wwlDi//7IIQvKyjHqkwG6l9rIZL
	/RbU5FWcukq5e7ndezIq0ATgAb9qp/sx/e/pLMBY=
X-Received: by 2002:a17:902:e88b:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c7c76e9d8fmr20432605ad.25.1782199045477;
        Tue, 23 Jun 2026 00:17:25 -0700 (PDT)
X-Received: by 2002:a17:902:e88b:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c7c76e9d8fmr20432125ad.25.1782199044927;
        Tue, 23 Jun 2026 00:17:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Tue, 23 Jun 2026 12:47:05 +0530
Message-Id: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX9pjhS0K4PBz6
 JRUcwrhHCRHMwNS+ZQjiCdHoS6mi/ngI1+bg1XEHLjerZ4ttNmKbTXL0Nz19xI6ZCDsBWeRJIkj
 QOOlSVhV3AX9MOBeJ3Hc1p/4XCt6I7M=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a3306 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JpAD5C703kRQSb3sVZkA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6HYdF81qtLcozAlqGtCeU_PLtq9YGnRH
X-Proofpoint-GUID: 6HYdF81qtLcozAlqGtCeU_PLtq9YGnRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX4Y7lbdaZmwIT
 aBHRWL4qhBgQL5kO1rblb18hICg93DzUddC4QfXq1+b0dscuiFDGZRZU3aniiHtpI1L/HuzVaIN
 8NiGbtDxRbYv/9t+UFt6ETNM9HRxj4R+iEcX1PNhjP5l801zDnxjp9PuzqKS6c4tYoppjOqAl1M
 fOC0UV8jV/EhDmWvXWjX7B41fynbLfIUB0vJokJ/BXg5a/JZmt8vYnq74hRDnFGFBVxlMnaIIiB
 vyZ1u1GHoNT13E2OBeGPL8vcx+6nAtQEstQnGtCPmZUFm2Zm/K2nZNEXwZN5RvPZGs+95M6wNXs
 8s4VyQniG9Ws2OFlh4MH5yVFcWfgWTYAEzP079pkF51TzKGfma9dTsT1IGegnzTL7ZMcqJXMHp8
 9gOBfozp1d8IPhmQB9C/ipnRGeaHjTNPyAvoXzBxGtYakKx7BXa+XIpAHP5k0dGVYxhiCZYFQ5l
 X8C1zGIBIbtQnoV+anQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-114100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21E876B4CB1

Hi,

This series converts LPASS WSA and VA macro codec drivers to the PM clock
framework for runtime PM clock handling, and keeps WSA MCLK-output clock
registration resource-managed.

Changes since v5:
- Rebased to current linux-next/master and regenerated as a standalone
  series that applies cleanly.
- Added `depends on PM_CLK` for `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` since PM clock APIs are used.
- Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
- Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
  patches.

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 142 ++++++++++++++++-------------
 sound/soc/codecs/lpass-wsa-macro.c | 128 +++++++++++---------------
 3 files changed, 134 insertions(+), 138 deletions(-)

-- 
2.34.1

