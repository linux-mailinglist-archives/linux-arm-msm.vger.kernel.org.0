Return-Path: <linux-arm-msm+bounces-112628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I0LBIGRYKmovnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:40:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2066F181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:40:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HPjqrS9G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Oo81yK7G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112628-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112628-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0449230241A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8152D73A6;
	Thu, 11 Jun 2026 06:40:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657724DFF9
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 06:40:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160033; cv=none; b=U8L8T4GWwgv612c6pQXMCTcYmHbgiCv5/j1oW4ZrZTovmLJIIRuTz/Kfn7e7VdtH2Gf/8O51NQYd3zaAssbLcbEF+xVIN0+nou2Z9/mw0rPZ+qj/GTtUCcVweOTLPLgRtWIsqFFp0e5S8M44GI9iPffoyps4L3xm3g078h9npGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160033; c=relaxed/simple;
	bh=WEN6enUdSVZoti3Sgb61JR+DdGvFFrI+DQw+w783iic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qc6YwnNYgZ31cKGZmxHjOfp0bIYQ9yaaVELpjeYRczyomeEWIuTetA+qYC8V63y5ovhFBQFQozjdFKH/oTpNnmxV/01F7Dd16xFY3GCvhxshw8zfH432wqZlusqBxHa9MkKmZYfC2y0Lb0DkCCLJeDxn4zoEZDOsV8hyY8Lji9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPjqrS9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oo81yK7G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GK3U2247976
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 06:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iTc6caBNoK8E4mY56oVkcu
	L9ZCDcRYCKia9JwhOoePo=; b=HPjqrS9GYKvLigfAik8WgSh3AvDdVgC5kYJADi
	58XWNh6uiewBC+1QsM/NwBjhF/0wExtZl5ILgCgvCMgHS6VTeogPvuxPsFAlwdsF
	YI5qtbc9MJoQSk9Q2kxeqk6ZifOKB+IeRdDf8CdoZn+gksM4Z6VimCV25YfAirxQ
	3sxSgFVa7MA78+BbtPJRQzWf1AdPyAzZhAHDquvnEkhLmtxA09N43yMbEetZKWaw
	f5Wuxcho8gl8bwZytJbwFWUTtH7gYfvC5IUnxexIOhc9Y9qPKY1560rdKXWge0mV
	usvuLzTNlF1VQWJiYGDyadXNnej7bIAtCsJGgR4LWeX/JOyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79j04g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 06:40:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842278a630dso9443711b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 23:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781160031; x=1781764831; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTc6caBNoK8E4mY56oVkcuL9ZCDcRYCKia9JwhOoePo=;
        b=Oo81yK7GIFdXPblDtMrZ/wD0FtNS6s2LD5Ta6+ibIhBzIQsi4PQUH7JeL4WxIBavl+
         EvudvYs2eye8uFF6D01GSFM1g2fDdkx4xIboOMNGZIGw9LcYUj9QKhu8ZTpe4i3NPipn
         8jAaCqiRVBS0iRFXJQTZODpKzU6WwYq6dGCst15qiGEfJPXH47y3aPxzMG7HbR781jgj
         ZVg0dro2YgSXv1ElpET7bB0vK5sZHmQxOmbd9zICWCprC3W9IaYIPyFbZRcK4AVd/nLb
         P67GlrHl9BS3JUwrPyTrItlX6hVb7m4Fyy+5H/HiA7i41jSvu3K/U+yc4kGXnAg/rRRw
         4d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781160031; x=1781764831;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTc6caBNoK8E4mY56oVkcuL9ZCDcRYCKia9JwhOoePo=;
        b=sjxpMGjAp3U5slWHpEp6WD+ZSUk1gBWpcfbSiFf/zkSv12FkSrQaayW6Qeog/SvPO/
         UGuhlV2mtnaTAUaTYU4HJ5febPPG5k0+fmGVrotoIjKR6usN167A+oDLthkuinoz5W8M
         9mAN+MbgSWC1C9vnwVyiEBwzv4f9+zoz/cJ/P7anMvRpDyyA6Bx0/c23kyXnHxnsME6f
         5Qz1OwUBKE1Sc50VX06fsIi+stK5OqPbDs/6JxxYt8/tl0TX5dYOv3g/4uLnTVbNIPdo
         Kodwiqasi2FustVMBZJcMnql7+vIFtKrm2T1F3prJqTEuVYt/u1reL61ow4byZYTdfOC
         VZ3w==
X-Forwarded-Encrypted: i=1; AFNElJ+D1v3nT7VhJCLqwCktEKyNVhCZf9gfMJf8tKaE7kQuxI+xW1HOp/mruAqWoVvBwwCC1GQHw2yW08rLTIPo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwtv9RX4UC2bsAzpH5EG+FIaeo/hxZ5LJfrsq4/88VIjuSJbeG
	AtuGpQ4snT2y2ho/fK/5OVtX1GMnCPP0z3dyU81R/RV3VzZodOs0FbZ4kZQMqb6sXL8OmSWeTnd
	5m1+edMETMVIEqhxZHZDQlY3sJ5KR8KqILl/3QIwocGswfjejqin1RqbXQYmCilzfA8Kb
X-Gm-Gg: Acq92OHLO4/TbNfafCXGDJkKVOMNd5k2bKO90PPixhrSQXuR8U/PLwNYUVpgAWyTJyW
	biIi+wO34NUgGLZJHf6fMM9gHuaHap1lzuOkFlK8oIGIXiCdIjagNXhuhc9liJx90MXTAGYGbXC
	NEV10omhhTqV9MC45Ng3/3MKM+blY4CExTfvDO+3G/iMifWJWo7qDKDE8vI1JnrH/I3WG0fv2X4
	6+xe4ioLzbwbwCpZQds8jf07SSiEJ3xEdukW2hMlsIh/4QoPYkWAp9he3kkpe9qxI1urX9imA19
	NAKICb++b3Y20HtgZ7NsfwA+idx0feOZf8Zo+3siItLFm5BIdbloP1IkY32iyO8VNf/erLACt6a
	02X0F7EqSo46qt7wvve+p+J9G/lnFsIyen+7lLR8Va18um6jM8nNO4C23N7wWPe2JuJk4
X-Received: by 2002:a05:6a00:3386:b0:82f:3828:a009 with SMTP id d2e1a72fcca58-843367bfb41mr1594440b3a.3.1781160030888;
        Wed, 10 Jun 2026 23:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:3386:b0:82f:3828:a009 with SMTP id d2e1a72fcca58-843367bfb41mr1594405b3a.3.1781160030434;
        Wed, 10 Jun 2026 23:40:30 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c9307sm803592b3a.29.2026.06.10.23.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 23:40:30 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:10:10 +0530
Subject: [PATCH] arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEpYKmoC/42NQQ6DIBREr2JY9xtQi9pV79G4QPjoT4pUqMbGe
 PdST9DNJG+SebOziIEwslu2s4ArRfJTAnHJmB7VNCCQScwKXkgueQmz9g5UcLICg1b7ydIAvXJ
 g3LIBypojln2jtGDJ8QpoaTv9jy7xSPHtw+e8W8Wv/de8ChCg66bhZdteja3uPsZ8XtQzzVyeg
 nXHcXwBZ5OPVtEAAAA=
X-Change-ID: 20260603-qcom-arm64-defconfig-bam-dmux-e670ee3b8ac1
To: linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781160028; l=1001;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=WEN6enUdSVZoti3Sgb61JR+DdGvFFrI+DQw+w783iic=;
 b=QDWePyjHYnwIMHtgV4eecsecoXKc8DNExk71opdr8gtuhunnwhw6ydZj+tTM1hKw+Wq4Rw6bT
 scEnNqC8Qv3AWZNXbHbEaA197NSX6Ipi44UpII/74xZTXlUhvoNfRSA
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: QF-o1CezQtmzDpN93VtjZ4OylVZ1FFY1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2MyBTYWx0ZWRfXzxm6u4K5COb6
 hiQ+mam6sqr1TipMZs/h31mydUtE9rV2z9h6LJ/ZxHtUhT6FwB4Z1piRGhaTdRzLULQ8byCaFYx
 Bw3UroMzxhUiT+PhQ+Za0L5DOjOEyakR+BtcHGkLnUjYtMfC1ahF9CXh3ic6J3at68vm3/mLBQY
 zPm/fzK62V7/UfSvS8dORvxQivgz2R+BhOwrIWX1cyMf/CU7CzXINYkshfklV7sqlwQIAvrUJ0I
 v/zUkB5xyhaoVoEyh6N7CQpLc72XjPTtIsIgDj5ZNhSWcr2Sv/qh2jqzP8YzTnria7CHw/ySGy8
 3O/L2QmI8CaMOxp4K00Ivpusl2dnz2QphialoPKNkP/++MHvRgso9UafGyEBw2NtnzvF6xgEwe8
 e9n9+eRSLwFuRGJMG6yudKew5ldump0biVHOReWwFYlS7DX+8JrxSpuOYK0NJFhuFEZbAHXebcE
 rBM7gShItXK6SsYMebw==
X-Proofpoint-GUID: QF-o1CezQtmzDpN93VtjZ4OylVZ1FFY1
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a585f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zsOhBi5B_Ltmac-edAcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2MyBTYWx0ZWRfX6LuM2In1gj5f
 nQRn7ooNBbwiTUcYhZ7fy8lbbocPMDPDTahsz/lmyYBC1R19UlWyGrTYqZBXpm0d9MpQbEC3WZu
 dGLXnrqTIHPOn0FEA2ZyMaFOd9buQtk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112628-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0D2066F181

Enable the BAM Data Multiplexer WWAN driver as a module to support
modem data channels on Qualcomm Shikra SoC. The driver is also used
by other platforms with A2 BAM hardware such as MSM8916 and MSM8939.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96ce783f24e722923b7fc69f9b57f811914a2168..3bc2e9474b1fbbd89980aadda36fd8147a9209d9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -473,6 +473,7 @@ CONFIG_WLCORE_SDIO=m
 CONFIG_WWAN=m
 CONFIG_MHI_WWAN_CTRL=m
 CONFIG_MHI_WWAN_MBIM=m
+CONFIG_QCOM_BAM_DMUX=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y

---
base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
change-id: 20260603-qcom-arm64-defconfig-bam-dmux-e670ee3b8ac1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


