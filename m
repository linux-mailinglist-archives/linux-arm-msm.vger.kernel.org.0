Return-Path: <linux-arm-msm+bounces-88423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9AD10510
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63A4F3007C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 02:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067F32F5313;
	Mon, 12 Jan 2026 02:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlnDCzrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpLwOoLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656A2F5308
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768183950; cv=none; b=X1q/WX+MHC9iWEhsLHReFqZKn5STzD4eo1PqdDk2SDx7dOQXVVkzf9wx+hAPDxhFJHsYbuZ6jS9LjptgdL54QmHtdhAnx3dD2LwFVuHo9sZiFvHpSwEXf2cwP8zAIgkTSFyU7KqnQWai54w70NtbEMmq6AaEZLzXuy+0KkaY0LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768183950; c=relaxed/simple;
	bh=2BlhUsS4xNMTdhgfx+eAZEQtXcOCqdzdPpjVk1yHH+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XskKY0obN6cEKJdt8KbaabSYfhQtJoqsUfQGtNFfMGk0B2bwsxNMyKsER/NpGibcYTdzldDTKVXDE8JkReU39sJok2B8ZsfS7UCVHXxdEvM2y9bYoH9z8CDuY3z7S/zi4Pvxz/0reYZCmGwMqRn8/6hZmkw4ZcJc7AbrzywdfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlnDCzrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpLwOoLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNATpQ4175933
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j85QxI24ViGOOXRBcvaWOC
	hh8mwsIkwiVf/oKpO4hF8=; b=GlnDCzrDjnd4XMhjl2vfimEy9TCJm5QC8dZSvi
	VsH5Fd1e7hFr+zs6jp2/MwuSqx8PFNQKmyK4CKbrJBFmWnAMAccWQwhA7YCB3rPQ
	ysBjmdXJsAcHsWhQCY+YqeLA2amfvfImDDH2exh24sYmf5kuWYl3ims4cqzPKav9
	6HVZ07hCRaITnR6VGSojntH3NsjbUkfQkCCgH95Hyp5SIB1lF4zZ/05h/XsciCIA
	+lv3BVzAJ1xGEp1Mrv9S9qDUzFG0bBfBjnPE3pbcL0JCebgU+UNAD5QiQRJb3nk9
	qp+of8teXAdzYeJSzFUIemF0o/wVypYMVaGyUxDARNiq+wGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu37nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3a245d0cso1527295485a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 18:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768183948; x=1768788748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j85QxI24ViGOOXRBcvaWOChh8mwsIkwiVf/oKpO4hF8=;
        b=IpLwOoLw5sgYsWy3iI/dTUyEJWDrLvW4m7/OZW0r5kI/M5fQhmOTWvT4DF6FmNCFD2
         VTNPmre/dCv6sjeYZM2APNdldKZVrDX/+Jc+k3ho3NlpHzRMuE3vEYnihWljhVO77Vx4
         Um4WT+GczPGZpKYtCdXBNgmdE/0TVN3mSdzrhwuJa89IHRfm0eQKs8dsL/SYh/krCBy8
         VfpSlD8j50aikXnmnCA03zjImtHHBbN8j7r74JBuYHIeE++S+lTendHGQ8PMCjC/LBOE
         J0ro2FSsnvA/2AWpAu2IgDC7xSHex1+5h5oYpJ+GoX40YCoaPRU6zkpYcMHcqkkdd/Zu
         wZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768183948; x=1768788748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j85QxI24ViGOOXRBcvaWOChh8mwsIkwiVf/oKpO4hF8=;
        b=HLY5C3ZEdVCsSnRuqCTFp1JUpEXWVsYwg1o2ukK56oaq4savPfxy1mZMDbGLdrylaD
         4rpjs/6/jRTvSvCYhh6KNX9RwAf0fiYus+watTnvjWhuPENfWn/kE0ofpccfG1PDWE5w
         1lzJBys+ZGwvtZK1Z7GUbugg22UElWO8k0nhW6FjoKm8LDg1U3nwn+MEpWSC6rPWlp7/
         L7gTOAkYPMik5AYocKS/BobLRVEjMhzfUCT4DtUgT24AP4mDF7ZGE2tsnLGILjtNG4EQ
         kRSt9aA2R3AUbFkDubO2/lHDl9wsdD25IRbkRC58Co2zD78qnuff16YM1WWdA/9UaPh3
         2R+w==
X-Gm-Message-State: AOJu0Yz1BtV8D0RmlqX6Mu7QEnRs1BPWPYTOYff8FGfTTJ+A7efYC/+a
	Qe/+xj8XzyVOR2Oi0ZkzpuZzXBKPPKFqALVfd9lFQMz8WFbJBBGSr//gJF39KCFTuyRNzF6icnL
	vI27rEWHX3+q3G/EC+wziSJTX7bztj5+UvZ81RKzd/zvYmZbl0u2eNdMchdZ5F4MCyzp5
X-Gm-Gg: AY/fxX4wkp1jvxPi+3v1AOOdnLPvvA4+TpJf8dGw7hjgepKg+/6wxcsSNM/S6+sMByg
	eavYdTWXxrC5iwKgvYUYKVxlDbxq3V3UEJYCXs1jyu5xLefrZHS1ud/kWH3WjpPHDNGJtHETzh7
	+TCnUsKJnIDzYMZGj63LN+cSNopG4pMoSbMzCrGR/Ye9HxS3dApWoP92dkbdY3QbsEh63ug/Byo
	hRIuU3HKTlIBqfFSv5hwTPOhNbOnRkUvbmDhZ7ar1hkmqBYywR0mXl91Zk3uTk5Gciz5XDY6wCs
	VwEABvRQY+W9zoV+9kmSVU+Gqb4b11bt04ReiwfXgln9ThGjcKbHZQj9IZVaaUyGdAngNGY++6q
	JAlh0t53xrOJr32J3y0i90ncufkm9IrUxe/K5upu140iVGHmu0D2DRIICdEANy7YnFRtJJ4UusD
	Vte4tZLzmI5G7tH6xPw/+D1rQ=
X-Received: by 2002:a05:620a:7119:b0:8a2:45ba:1b5e with SMTP id af79cd13be357-8c3893a26d0mr2501017885a.28.1768183947801;
        Sun, 11 Jan 2026 18:12:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9EmI2cUvmWEdGcohzxg4g1rY/a+H8Sy5Zdnq4TjKqeD/pZK0vzS5CIgtbI3f2e2VkW+4vKw==
X-Received: by 2002:a05:620a:7119:b0:8a2:45ba:1b5e with SMTP id af79cd13be357-8c3893a26d0mr2501014985a.28.1768183947240;
        Sun, 11 Jan 2026 18:12:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d95dsm4499529e87.30.2026.01.11.18.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:12:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: dispcc: fix clock ops used for DPTX AUX
 clocks
Date: Mon, 12 Jan 2026 04:12:21 +0200
Message-Id: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVYZGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mj3ZQC3cTSCt3knOxiXTNDQ8uk1KRUg1QDYyWgjoKi1LTMCrBp0bG
 1tQBAuXyGXQAAAA==
X-Change-ID: 20260112-dp-aux-clks-6119bebe0e03
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2BlhUsS4xNMTdhgfx+eAZEQtXcOCqdzdPpjVk1yHH+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZFiIpVSahIzB+QwGT9cIQa0BgTTHt05wiMH2j
 EtYSLfl/i+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRYiAAKCRCLPIo+Aiko
 1Z4QB/wIOeg3/Tu+w47k96dZJz6yImD2p2uKjhW7cYsBgI4PA+yUuIRxqlJMzS0wFGAHJXhlBbi
 5kY+FsdaZZKsK/tonkqs/JG0FLKWnVoERxkFUP9GEiZjy8SVCN2iwU5gj3qgG+RmiIzMZe86GYL
 TuCh1X6fs+SjqGaUpxAAkSAEvHtuIXh42pv8g3wEvS/Hgb/28XiFKKcKUebL3vtqtnmDq5w0Omz
 dYvpqNzhFM5ee+r5YjT9VxbiMwZ1Rn520QVaSog/2/lRaB0s04JhO/mMRiRxhf1l59/nKFDHo92
 VAgsWsrSwlIVcBhWBweBb7k9brQJxN/AvgGoN2tJ9X2fDcEM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: q2CuSJy28ydZOqFk46CaqamXvQkUX2X2
X-Proofpoint-ORIG-GUID: q2CuSJy28ydZOqFk46CaqamXvQkUX2X2
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6964588c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kmOxBJin3Kk7R0DW-kgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAxNyBTYWx0ZWRfX1c0tClgo2hni
 1WIXxuLgzC9+wM5f0TM/PUXfkRXw0kpK+BAN4UR91+thCoolEvQT0lkMsHXCppiy3tUoPxqwN0J
 CfYmj6rT72aExx4+CuvTwlW7avRH64sTB/HcwTCbfcTgzHiRahrSCqrLtQgEWUnVPsUhUmsrixF
 27B/yg+nOyjBVxPTjgGU3Fyv7ntEhHj1gvJSW0hokvjaFGiyCc8dtJJFUe5DO+LKhevJF/+HU7v
 BqpKHY66ipzdCuaeCsGaqxYaeGpzmdzErRwTkh/zfnqroZbIBjqsy3yzR28RWDrM7PoC0LpsELd
 nK8VgwLw6tyv79x48QJUtVqRPhsDa0sy2lDGUsuWbUs5zKbwANgMkFdvift3IsUpJ/1vnhhgTiZ
 vaLIya/5v1T+PBILCX6N0vbOd1vAGg/2L+/MQAsw9UfJnZlJgzgYi8XvgZ61eMUpOTwMxDUJQ0M
 uUB1ai8c3ynkbd5Qbbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120017

Correct clock ops used for DPTX1 AUX clock on Glymur and SM8450
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX clock source
      clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source

 drivers/clk/qcom/dispcc-glymur.c | 2 +-
 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260112-dp-aux-clks-6119bebe0e03

Best regards,
-- 
With best wishes
Dmitry


