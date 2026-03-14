Return-Path: <linux-arm-msm+bounces-97646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAjCF0C1tGmMsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D098E28B19D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83591303EBB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2234C2727E2;
	Sat, 14 Mar 2026 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlkxhFpv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXl9Ennh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE069218ACC
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450557; cv=none; b=LXDYDVeXZyyCrfCIGceYhOAIWqDSJE+7nG+yNLV8TEuEWH1pjBI30FA1ZZXuUcsNnU2EVjQXOvA2kDX9iFGQKjTdcvEXkMoS+iY8QwjlJDzYWw2+jXqnToNj1EAnmD9NXC9w5FuX/z75DfUd1qLKDn1NnE5W8/KctPtZe/HoxyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450557; c=relaxed/simple;
	bh=eeRWqgukNoan+mjBSybHhhzqIjokDqIPuabMTOAdphM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BvD+boOvwndMcwbGqZPeTbBikp7Ie7sTtumZTUl7YTlw7oT6XLNdUfkNm6aPIEUz9w0OECq4eL8/jyomFmVZAZjNYebk+484Xj+UBbkDKnSgfZJrWKIoTcniiS4T/kRv/uw3XWHk4/6YNxp7WLNl+f7Ewb0SS9ZEu/sPrVqho9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlkxhFpv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXl9Ennh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DGM0aU481521
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HA6kLTIje0xxpYAd7mSNxW
	wuLfQQ/iuxyv2vtM2X73c=; b=dlkxhFpvD3/N+gDFEf5m9duBanS7lPq929mx1D
	NnKTWksDVwLDJyrZyW7pAo/l1xSTQ/ZYeJ2OibOVTZl5O+RqNWOEMF7Ptn042l9t
	XNdBviK+0xgbpM/jIt0rCOJutXQ4mFoh3XpbuIidx6QJvPtJxRMJSzlxGyHTsDR3
	c6PPsAg5MC50dK4FNaCbjzt4tbXh5Wo5zfCGY3oO/CmggQvEQpd7j5ad3F36sBlS
	KNp1qzh+ArILz4xMPtb+jMULC/ZP9fqOp5YSh4iuhMw0OEKf4pVXUPLVpMIOjdH0
	MJ/gZcfktoBU+U2V2m6cakd7uEDV7x9Ks+HEqQwoxUoz8lRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7txej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81c571a5so1605026585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450553; x=1774055353; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HA6kLTIje0xxpYAd7mSNxWwuLfQQ/iuxyv2vtM2X73c=;
        b=PXl9EnnhLj5suhXkD/7nKCTzqFF5EChKmYFhyqByb/hxzzYyO4LWnWM/gCw2CcbFVs
         Ukov1B7oYDzO683AbwR5Ypk5IiiHN8eR7C7SyqvABuLWMfcxxh87yvmnvtS/p1hK9dyZ
         KkyKmDLl9fs4nruyqYo7YbrQMHu0IWnzTmucXqnVtYw5SY53Li9ymdAyWNDMXS9dyRY0
         SnBMh8Q9HUpYM+XvbhvGPHc/Pbbrrn801MUZcxYmagi3fwy5FRKaiUPIuEaEKEOHPMv9
         spa0OQyxMzaLSSKeRPTrtTBXhg4Yv2RTf7bqKoYub7q5C89+LpIWQcQMf34nge4ZOtpt
         d0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450553; x=1774055353;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA6kLTIje0xxpYAd7mSNxWwuLfQQ/iuxyv2vtM2X73c=;
        b=eE16rLMyIR27tXA1+zazam2LNFm9jkuMXUH9zMyZW3JVYhEFrJuooHgwKrQxZ0VTuq
         jyiWWNL1VNPwSLy03FlhiyJSJh+JGsL7NT67fgDTHfBNpGo0anNAhLtcw/GEVTsY8kp0
         1gdxWKRsVhbBZHjFD4t0r5pSlEVSjOsHcVlpvSzNgKWLL+0S+44FigZ13tPYKthGVff0
         KccT1K+97WzsY3Hgfr4swRnbW2QYKgXIIJ2/w6k+6VnuPVpaH5Tuz9muKRdtoT7Hrlfl
         e+v7IUqjonvxQSuAUWqfcDiYIYtk+W5oJhA61xob5jmogds3YnUmSKU5LXUVcVPz2yFI
         +rMA==
X-Gm-Message-State: AOJu0YyA5QOqn3dKf+WZSb8nOs7ML+rKm8ernGhm5snB4Y5Dup31+R9Z
	Np5GHlSi2/LRt874HWfUCGGf25n3oycxlRfuSWv7NJbNs/OCkpUggIcx03ZIQFDgYmIo0qA4Rde
	GxCEFZ5Lcqi2Zc3Gqrik2bg03Mh5CHPrLlqt1kmQdqe349NEB1sLWqj5FAEYfpYrwW7Wy
X-Gm-Gg: ATEYQzwUBqhavM9HIt5SqJPsfrgjVBSppYhZMTF9+Py0R/YkZpBzgWd36Lvo16uhUAy
	h6ZvULY2OVsXtfrCJ1IcRdOANQjiodADx6VkN9X+0UjWW9QcNdagz22aG9bzDmiT0jc1WljfpNM
	C/CPS9L8xOTjMG7tIpiw73ISfbPb8h8RcDkS8JZRYLspKZVEwTJWTVw4hUzWv/bhGqwBvTrNvL8
	jSk7aVGEWQrPMqIv0Xz5XLJJkip3vjd1edww0QbO7TaH0lDm/yX+U9kQ1fpGtx5cdKP1pUAI0F3
	1g1DEukiTXogH59q2ON0qysFgoD9YxY2D2+ZK16P+6XLJ6cShVxReVM6fXXuPUyQIoPgpE645gF
	tcRExVugm142c+PvCNaKVFp2mtm73zOESHZIKKfOL5MKVpLvqCeNfSgWn0VeSKW2p0LzDqVXqKN
	Q4BAdb0C+sP2KCSMkeYoSD7g/o05/Wcq5WKx4=
X-Received: by 2002:a05:620a:471f:b0:8cd:8fb7:7b13 with SMTP id af79cd13be357-8cdb5a41872mr743318085a.10.1773450552931;
        Fri, 13 Mar 2026 18:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:8cd:8fb7:7b13 with SMTP id af79cd13be357-8cdb5a41872mr743315185a.10.1773450552374;
        Fri, 13 Mar 2026 18:09:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/10] drm/msm/dp: Drop the HPD state machine
Date: Sat, 14 Mar 2026 03:09:04 +0200
Message-Id: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADC1tGkC/3XRyW7DIBAG4FexOJeU3cup71HlgPFQI9VLwLFSR
 X73jm1Vaa3mgjQwfMDPnSSIARKpsjuJMIcUhh4L/ZIR19r+A2hosCaCCc20kLQdGxrBWzcNkeY
 KhK61NoJZgltGXAm3jXs/Y92GhG1fmz7zdXaHcs7/QjOnjErpausKIb1Ub0NKp8vVfrqh6044k
 NWbxcMoWHEwBBq5V8AhV9xa+cSQP4ZhnOuDIdFgBQgva9cIYE8M9TAkOxpqfUvpyoZ78FLwf4x
 lDyvC5YqRT3tipLYJ6NoUpirr4Ta9djZNEMnv36iy/ViuaDNid9/Ddux6B89MCcbUzlhfYeDnZ
 fkGehb2YeIBAAA=
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3608;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eeRWqgukNoan+mjBSybHhhzqIjokDqIPuabMTOAdphM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aWrUZlMy9csnGPbQ57HdTaUbJxR/3sW2dYzl3vbnmx+
 M79rCrXTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBM5KMo+z+tbe0L7TtOzfs7
 d//kyrfNZf3HVBi7BbMXqeoZHNay16r68upWnKFYugNX0ZrtfD/lOdf9Ci3UXi/62O1k2OGkAJm
 otMCcaXXnH9zJeZUlyvr1MuO5NwXXNgVHqs9akrX5aUNZjsQdhyJZ18lbcyZ/F7c1SrqpXhKfJW
 t+SCY2+XmrXFd6llBawO8jWbtyYr9/Um7Za33wZojiTs/uAPt7H6su1VR6Bede3s9fzR5l0qIk9
 vVKcYjlE+lnbmct9nRMlQrce0WifP2D4lOaLA9YS9rv81mdrp8eLhfbxezJaOfC+ub1nAWKO3uP
 t3ZFOq+tXnzkouoSvl7hN8wPHHwl+fLf3NvQdHxZtn0IAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Jps6eyzoQCcfRYWplqLWwYqtWtza4jm4
X-Proofpoint-GUID: Jps6eyzoQCcfRYWplqLWwYqtWtza4jm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX5PgNuA667Qu5
 G6BIXjjChRXmjRgp4ijiVG4gg6ujOSKtpXDNGVYBlHGU00MUGyffO2d0z77AU4wIh9jkDoPQsE9
 hkWkuaGduZnSPAi/QOGIgotolUowdMITEEPugJISltoVkWIWORJek1f785BJ8UofHAN5HKQnLrJ
 0dryufWVWqjHL/zMQKbezwlAhn0SxsgHYchVZEJfgn4nVj5yyqFlxtKUycqZc2WzmTYT+EgdlnR
 3NatT/LpqQz6wsT0OIb3mu2aP5ZttM14NgewHdchbfrlPqbkQ/Yt197j7OwtsrGql3G8MVOmuwF
 2nHwfEMp1V1Wftikjd8o230Gh2NQX23orPArzOV6aZAAoBo/2vyhzqGenlxnhSy+jeV/5dXoVfU
 XFgQXGTVKbRr6j5eOQZD3EWnbVyCHdSaXunhakPY+vHGjV8CSWgbD0vpdD69+0iyeyLXcZohsf/
 BKAA9dAQN2bltzQc7dw==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b4b539 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Bp5APB5_ZGd9cemfosMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97646-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D098E28B19D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

To correctly detect the displays which are plugged on boot on the boards
which use dp-connector devices, this series depends on [2]. USB-C and
eDP panels are handled natively.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
[2] https://lore.kernel.org/all/20260314-dp-connector-hpd-v1-0-786044cedc17@oss.qualcomm.com/

---
Changes in v5:
- Fixed the EDID clearing on display unplug
- Fixed the initial HPD issue via the external series
- Tested on eDP devices
- Link to v4: https://lore.kernel.org/r/20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com

Changes in v4:
- Fixed PM runtime handling
- Fixed several cases where the HPD machine would loose its state
- Fixed the case where detection was ignoring the plugging in display.
- Link to v3: https://lore.kernel.org/r/20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com

Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dp: drop event data
      drm/msm/dp: turn link_ready into plugged
      drm/msm/dp: clear EDID on display unplug

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 714 ++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  63 +---
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |   8 +
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 9 files changed, 249 insertions(+), 570 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20250523-hpd-refactor-74e25b55620a
prerequisite-change-id: 20260314-dp-connector-hpd-f069e66bc6af:v1
prerequisite-patch-id: 90db75e3fb8bc9c81c67547db7bbd4eefd5d6c40
prerequisite-patch-id: 1c4d030b93a8cc6c98b3447a8685da24eb1f24d5

Best regards,
-- 
With best wishes
Dmitry


