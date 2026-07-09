Return-Path: <linux-arm-msm+bounces-118033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rAGDK8KqT2qhmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:05:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF10731F72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=loAYXPu8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BpKGydAI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CF723049210
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B901BD9C9;
	Thu,  9 Jul 2026 13:50:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872CC1DED63
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:50:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605056; cv=none; b=ra+S4519bPmLknmVZxUZhHqQkgDNgNjAVPIGbzTDp1SvTWMgYZcVLcka9FkZOQNqklJZDTeN4GxL6+j6CfAHI1r/+TV044alJ+xu5x94ct/oW47DmZVQ5htriSwxIs/++P4LuSxngfl3pnob1JlrcBV4equJ3WZaqBj2iWqxp4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605056; c=relaxed/simple;
	bh=4bhzePXsk45cKfSWd7zbd8gyHh/ChfbDbRzNemPGowg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nfi/7L95ruDj6/GPLAoDdB6nMwaZjgp+WQYY/zRvUB55TcGS4EzdVv92Cs1Ab31N4AurtcYeLBGNKDhzFSvf5m5xShr3u/fH1ZnP/Z3FLSYsLLtDfzIQC1GeiZDTMBJ8x9bomuTh3xf7pr+75KozOrcY56HLNh8qTlCLxlNeflY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loAYXPu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpKGydAI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNSk01489081
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kdZbWYcf48BHpBU54CAGOf
	fCNaSOZ4BlLcolSyXOAOw=; b=loAYXPu8SIqEfML93azzr5lsM7s442dF5sKpZA
	OR7x/bWg79fc2WNaOREofTngGMJTsRaE0tnGH5Ad+CtUVBbaLyEuYawXUSDZmXCP
	/+eZNext35vnmxGuPpm280NhfgqZ5Ivr6P0ImFjiXr8nIyCuo5OsxHc5ugO6hkMk
	jkFszg2LiDwSuIoF+bmLVaiQKTGH+5d0BsKLHYRXimJ+6ycDK8XgV970bXh0zbnS
	BDhMlYHCGZAOHSU4NZwyJRFxT8aLHadk5ZHvFcP7QAMJXRI3XymZJdzkWh4gkBq8
	mDCK4jctGnBQwV2Ca8eC1T2bx38DLL4F9lEcJhw7bhhxTd0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfuh84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:50:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so43823225ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783605053; x=1784209853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdZbWYcf48BHpBU54CAGOffCNaSOZ4BlLcolSyXOAOw=;
        b=BpKGydAIkg49R0neDgjc4RjEZwfKHM7ZiiERvxGod3FzWDB63ICZ4CxsGZnPbdOTnS
         tilxBROTb1v0jMK+Fr2qHC/PwSPtD5cqPJsveOy93iKZ46Qs0kIomIxCcVIQD6kPNrfx
         mutCLAarRKHaM+HhusXH91xiiwv7sAILF3UCYf0o5hnqE3qNlKldEXqJwTFv7mURX9on
         kPqMxwzeuzkbYbgSv+BNsTVhABSNLTtOKiNJ01wgRQgVLma2VtcY1/9T1ROGmib7DJ+y
         vNDavQJkWfm7doWGY1usttiO5Jupc+AlWpUTtHeFKHusS+X26Jg/gJ+HXGMigH0pFwSA
         T7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605053; x=1784209853;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kdZbWYcf48BHpBU54CAGOffCNaSOZ4BlLcolSyXOAOw=;
        b=mkPta6+NqkHSvaW3F0nmLWMLwTjIcfciH2D58lxF3F2QlXPnEeKRmffJyq0y32ULz8
         QUNVzoH822JZ0ijr6c6WRnnoUqSOOykf9/Zq0z6Yd0a96zFlu8MN5XyuKj5i+7xE/S5P
         KT3C6L7J3b/cfi4x/aBz0XOcS/ivdsLI+D1nJGzVilT8Yhm8qIiv4xRN/XVNYnGgsOmo
         BRreaEgliG69xFheTM7JvMV3WRFy6vmLoD2yYZ3m6SDFagrQDUnZjeXyWr5L5bEcYZTw
         ckeyRMqmg+4McNYhlrk3Mq2ydxV4OJmnkBBcTAb3k11uOIt+Ne5KUzjqSSz/4UjSQMSZ
         eNOw==
X-Forwarded-Encrypted: i=1; AHgh+RpNjT/EmDxoKCDNkHm+oTBeaoQnWGrPNkHS0SZVbA05PPFu283JpwT73R12coJGW/KyO/lnB4pFWpsgZVnx@vger.kernel.org
X-Gm-Message-State: AOJu0YweAjPgpWFxU9vo0EmmI3yXCEYajP5H/NkE+HO7FmWIZ62n8h68
	nL6dmsBZm2osvm/ySgpFRdC0stdB3Texh/htdDAq1IB068hxRJPW9CBHNkv/wituFJU3gJlDH4G
	r8b+I+xZiT5wAw6i0dd9L9uPt4dOMT6SszsfXtlZwGPMXr4I+5fFCvtFryna2WkcVNg9I
X-Gm-Gg: AfdE7clkryBqro3PBugccoNTBbF7zq2Xk7j3KnZr7jhINFuMW/EZC6N0Dx921nykXa6
	PsZ+IR1nCr5tj84RdnoXI8lutEgnxzYUH/HhfCFL+tocC/wdOnfr8cPXS/GQFM4pr8UXcjhHW2P
	Hi4XBolYMwr/vAfST5bWQW19Vl8HDgkKl5Dn0A6TeDI4I2gG1g/lYKutudN/ERc+1sXYkviakIM
	yLSXeQb5U5TYfe8aq8m6lSlMrxZpPyIbjcsgfbvcFJNn9CaQYfjPDzc72kgH4H7H7aWaQZ7am2c
	jjuTsbkqUaCypYBBiO6NN5n4rgchuI+67LUGclu6a5y1oLd28lyrx5a/Hfk1EaZGDqXYcMh6kMC
	M/7cmsqzdzhEjpMeTa3JSQ9JEaTk+tzRVeXozOJzxBe0P+8ClUuIRRVl8TGEV4AVXUYiWwIuQF3
	NgnFfy98ikIF/Co4zCGDuN+LMyUwwAFnQ=
X-Received: by 2002:a05:6a21:4d92:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3c0bcb977e0mr9352041637.0.1783605053460;
        Thu, 09 Jul 2026 06:50:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d92:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3c0bcb977e0mr9352000637.0.1783605053020;
        Thu, 09 Jul 2026 06:50:53 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643cd6sm3877306a12.26.2026.07.09.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:50:52 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:20:44 +0530
Subject: [PATCH] arm64: defconfig: enable GPU and video clock controllers
 for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-gpucc_videocc-v1-1-80ee0f3ae313@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADOnT2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNL3fSC0uTk+LLMlNT85GTdNMskE1NDA1OjVKNUJaCegqLUtMwKsHn
 RsbW1AHfctUNfAAAA
X-Change-ID: 20260709-gpucc_videocc-f9b451052e2e
To: bjorn.andersson@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783605051; l=901;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=4bhzePXsk45cKfSWd7zbd8gyHh/ChfbDbRzNemPGowg=;
 b=Lvgc4ybrbr4P+dpUZc3U+MOahBrBWf8ivXyEc0ajp3scJK4pPvKrKhHSfHZ5gF0/3s/Ptl1OU
 L0aJUah3mZsBIlvFYXCdpDckftEunpxVXHYLSzCJrE19RZYPdCIseHW
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNiBTYWx0ZWRfX3c8BiY93Xahp
 PYOnpQ15+7pgul/nFzTe2jZH4C5rAxYWdLpuUfAJCOHrXSZRBtDb+gl2QxS/4C1OKWXAup++Lid
 plbEc2V31Xm3tb/9cbEtXKxwqxCrLUcVFAwa4VYApzbIfNcKiz/PJg8J2NCeCwpqLxHXQWtZXG4
 rIikzVwHYpXLQlt3lrxqH6eSQlnBRNrbgncLVEsCsvpnwkmWkC9IQNWBAhfomucWAXLQgi9XnKJ
 XLnheL99WaI9Bwyhe/xfGakHvM8G/P8kL2wEQCu5cB/e1GdYiwPtam1phgfxlefCnoSkJYer8UW
 fqrMbckZA/NUmmXTt7C/BCcsfivQ4BPdjx9IIzvALGRgiMIS5VeVPfHmCOF+IWg+rDot4g9xcOw
 g78ArOkXWLPqx5xd0PY3rnOSiNCzrgAoNKDtZFdxzYw+1y2JEidDBr5TzDW0golvEpX5oTyfg8h
 KrfPTi3BGoArHWum+sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNiBTYWx0ZWRfX6yb0L02B9YEM
 Z8ZqktFPryjJrvclgKGCyUJqKZvCAZefDXyYR+pbRaQrr0Ljohy/4kAsSqZ1iU1gQlUCBoigKpU
 EfPDiKE06ejTk9fIA+LUOr8MzLenDfE=
X-Proofpoint-ORIG-GUID: IKflXS-COi7eSquLy8xr9dgJUTCX52R_
X-Proofpoint-GUID: IKflXS-COi7eSquLy8xr9dgJUTCX52R_
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4fa73e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pORNuk-A3vih_EDH34UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:pankaj.patil@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CF10731F72

Enable GPU and video clock controller drivers as a module for Qualcomm's
Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ad3bd3d9507b..11882b20a1d5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1469,7 +1469,9 @@ CONFIG_CLK_ELIZA_GCC=y
 CONFIG_CLK_ELIZA_TCSRCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_GPUCC=m
 CONFIG_CLK_GLYMUR_TCSRCC=m
+CONFIG_CLK_GLYMUR_VIDEOCC=m
 CONFIG_CLK_KAANAPALI_CAMCC=m
 CONFIG_CLK_KAANAPALI_DISPCC=m
 CONFIG_CLK_KAANAPALI_GCC=y

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-gpucc_videocc-f9b451052e2e

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


