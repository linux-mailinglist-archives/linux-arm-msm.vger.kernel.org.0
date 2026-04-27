Return-Path: <linux-arm-msm+bounces-104631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEYwFE4K72l84gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:03:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD246E008
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0FB0301650E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B51395DBF;
	Mon, 27 Apr 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIPiJInr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP4+SEqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD2390998
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273294; cv=none; b=OPmMG7df+b6V0kQhYK6gZfgny/lOODfDEoGXUkzCsblNw3Rf91HYQP0XM19npaztR6yirWHPktVlXResDchp++VcGHcsBkG8I6sEe1qgcQvpKVeBALur2cUs96Lc+U3kxCvAu91VlSL2MOX17fznXw0iT1jO/6yg1ErZUs5iN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273294; c=relaxed/simple;
	bh=aCugtkMf6aJ0OVMPv0dnDT1aFITKTjqn3PBqRuiiC1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jP8NHCZr+2wM6Sjfr2uo3ZT4gwjTC88mA0Y/ecH9TPlvTT/y8AnulZqg4c2flMu0o5yY9oHiT+Id3OyysCVWAY0l+DGY1EySKLqddKj6YXJ1LTLT7OOSPl/z3m50fYHYuXepCSddzy+HNRFCS+D3ZjamBqlWoNAUmmJhB+fmI5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIPiJInr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP4+SEqU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKBTeG2490984
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZR9Qj+ESn6Wxh+5MA18JF0X50lTB4LGYiCm
	X/zZ9vQQ=; b=WIPiJInrWWamehNT0sk4nuar75mX4VXEN+1Bjq0BDRRqf9tt30S
	CCybQTOo6yBx5R8s+z6yr++eaD6pSJCMboBdrIYm1GB7L+QdfPszgK8RYfxXs+br
	BIcD/fHQ8TKNr5p1lfQRvmcSqx6h1qsI3vokcuAYEhzrfPAOyREgTKj9G7IFyQX9
	ypIIrlx2lIe+1Nfc+tNSYoTKkIO2vFmBA5ehfpGqoq+PQjK2ZPcVSZGfy6U/l9ZX
	LN7oSKokJ1Ucbs3E7ApjyBkI07B4x+08SK5wHiqRG1wLivX57YU1QxpntN4cl1O9
	99bYUnRiJVK5zCLCTMqFbcTb4gydAyX8wOQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxcuhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f694e2ab8so8304311e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273291; x=1777878091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR9Qj+ESn6Wxh+5MA18JF0X50lTB4LGYiCmX/zZ9vQQ=;
        b=UP4+SEqUnH5YVJ1wjM45T/IF1xxMOB8QCK2rw0NKdD0Ot9qkSOQua+S1CPFvE30p3m
         awZon83eTB2nr2hNyRH5CDPaLK9cqEtAL96bkGZiNF3aRIp4aLyj+0jKXWGzY22VFU3S
         WUz5LJLErvlOhAyO5qofzKPms2pBAwemUvQq9mQTsG+GQEnwBmafcPP5EqT7Zqtr0Z4f
         zAbZil085uq4RahYgKKTUlWVfF2blzjha/4WGp4ME26qnS9JkyELPg+hbweR7RahAAim
         cBI3tjpVyQy8kTXhu4ga721l+B454OrpKcV6k9lUm4l02NUMCl8X+pMYS8iGCBxeWuL4
         E7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273291; x=1777878091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR9Qj+ESn6Wxh+5MA18JF0X50lTB4LGYiCmX/zZ9vQQ=;
        b=GdrqEc9YTapYkbnHw9p1j2evJgFkYnc1snkdMpOaTt9oOy5VcTAiSAcCtHSB7/QrgZ
         88G80TULoLrUIrjJE7EiKeWXu5y/UniGv99/ZuPVnKkCysNxr+wLPhOoUdB20/xOhikj
         HsQA1VfG738DAg2v4f6fZMIcN8TT9XZETDvNrjskPhir4srSR83rgOYjrcrG+Aq082vY
         ehnDBk9W/wH4zShIt9DfOsdki/dOgBLacQjx7rWW8Kz9zo1rptzKgyUmIFkJ5jqJfYa2
         +Z0nr+0QPygEqYQO+wzzWkP3I5fTemjOxkhdM7Q39jTILla1uY+6JZaT7PlFlOr6G1BB
         m25A==
X-Forwarded-Encrypted: i=1; AFNElJ9MmWFzq++gjzT/55HVGcOPIleKzUWwoOAnnAs+Fm7C3iFW0h/cMKSkcE5sfIuxt44aQ2HgBxFCdsxbz9lO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6hG6XiNPvDDAHv6mznZ936j1PbA0+PhE2RQU+/PGvx7PN+vc
	I5WHdqm80eeZTUB7ClEg8xxgyoOE81xJaSj316tpY6XDkpXge91oyv5b3VpxYOlUU3AviiMXQl3
	q6XHfQnx6iIoNXKc2t6kNFG+jhQM5dr1Uo4BUwljcWIGkP46ljGfMEUvlTHKFLYzCrUaO
X-Gm-Gg: AeBDietE9CLG7WcXnz1Com3oc+FHN+qSJ0xgSceX5HPvv0iqVBZgY8l2XCejzTNgvo6
	mjqq3ItaVO8YT9/Tdy/cP+lBVjVa3C8cc/CpxU+IiLkTfSPKLdx3GM1h0/D14xsph+lldXULuYL
	1mMuxy9tZRXXJfNud2/SHLKkJt3BFdUM1IZ+BCM8KwDLadywV4sQd7bJiv6PMLxT6WKuorcM0uO
	NVDMfFk2wgFDJ3xhCU/1uI2Y1EJozF+oLZMMU9MP4ys2DF770UCGGKnpOinuFsOvbICPjyeBf7k
	SbOsCw+7i6Wpcj/Mmd6RU5uktYPe8kUhCrYabCyt4SLYm38U5e4r9D0SixSGEHmErB/+fJZcnlj
	l7LhsVjZsYGnOaUmEPZDdYUWuKrRXB4RAx8FDZ4/0d4wWWKHHybNFzYfJxJs8T9+1RHS1XeW8DN
	zV25Ra4PpQsg==
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id 71dfb90a1353d-56fc6816e2amr15748387e0c.11.1777273291456;
        Mon, 27 Apr 2026 00:01:31 -0700 (PDT)
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id 71dfb90a1353d-56fc6816e2amr15748313e0c.11.1777273291032;
        Mon, 27 Apr 2026 00:01:31 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cc84a1bsm212002545e9.0.2026.04.27.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] net: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:27 +0200
Message-ID: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aCugtkMf6aJ0OVMPv0dnDT1aFITKTjqn3PBqRuiiC1A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wnHcmFBiV+HF1D49v82ttgrfqX1KJdE9qEyV
 vZQUWvEDTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JxwAKCRDBN2bmhouD
 18+QEACV7Evt/+EHLxlvc2eS7XruKHr2vUrIRtc99PAMhoFnUn0+yrBniF3Jm4rwRtyDScRCf73
 7wGh6UVVUu02Wm0DAnsrmUD4RaR/xv0VfJJgwnCBNaH2UoL+edaosqobOQC4VMD+shRV7nNRVaX
 8xuQCgPxE9CSXDFZpl2wzxHbitjTVcxlZUEwSjuWrshqNINcCaq0hRMWjVgWnZi6lzSBmIzkWHR
 hiQtoRTONzLzSh1JZMOPzzC0Z3ew0ePJQMWymGyKTxb5L3J0jghaQe4mG24P5rV8OYuRR1xbtBd
 Zx513s84I5+j8pawdguHA8oQsAr9w6+LEAqFGEBB3C4nIQjUsfGLGN1sEsTyzRkFGgLXOD5D/Jg
 ubN7ZAqFpMdoDckCmzSI2LOjuPOAZBSaQFnKuy1sLgdaJ/bCMu9pLTGbdRd3c4V98gKiuVOAEgX
 CF4mAFdDP+LIaciwowkxobRegKrGxC75LCE/FTAeARfCqVcEjZEQowooTiwxFDQChfBnaLz0bS8
 QPguE6Sunim/s4QyY+cKIRf+wtrA88BPsfZyhefvCsxecHbNvwlRhXTUJDFIxFYTuPnEub9xGIa
 4QZDX7IQnrnN0QsbpQrFVcBuXANcH/1HxVac+z/vg7vklg767FVilN9DFEJTwoyItT1W9XKk2Xi qlhmC1DQ6TnmxEQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aXBXi5rjZ7vDO4oDWOqzbgE_346yId6f
X-Proofpoint-ORIG-GUID: aXBXi5rjZ7vDO4oDWOqzbgE_346yId6f
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef09cc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hZwkdpzl5lozqrpNwogA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfXzLtR+ICWedgE
 ahKnaD4kqJRZxEXy5qQJ/sMyI++vp4BHirFugALs8vLIGQen/9FaYvSUnMU37gHhWZHede5VpEk
 eAxD3JmH8ltbEm4mX/WKMDh3sfK9ain+S+ZaFIVsfGIbjnGa698gie2ZETfb97dE6CD5IVXEFK1
 Jh39EOAQ9el7WTiGIkNPxc0lScXJLQpCa3WJ6klUTOupPU63xnis1QumA4SAdgbLIC6sziGqVf5
 iCJ3rZXMWafqSZbzFTFm9kGyVSAbZY6XU+B6kH/3T13deVEX7RcWfyM+srDAR8n/6aJ4ijfOa9d
 TBvW4PUjtQElKZsBDU1xO/woczQkRd1SI48c5q4FGmpg7jSoEorHzNHdKLwF5CH/mq1FB1b9CtX
 9ZLkDLOb+PT/pq1oiXJxny/w/lOVTmNG2lIx+LRXApcK75K80M15O21U8oSFbp7xsJi0it+r8oM
 AyJZaobbgAYmAe4lysA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: 2BAD246E008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104631-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/net/ethernet/qualcomm/Kconfig | 4 ++--
 drivers/net/wwan/Kconfig              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/Kconfig b/drivers/net/ethernet/qualcomm/Kconfig
index ba7efb108637..57e1984d20ee 100644
--- a/drivers/net/ethernet/qualcomm/Kconfig
+++ b/drivers/net/ethernet/qualcomm/Kconfig
@@ -48,7 +48,7 @@ config QCA7000_UART
 	  will be called qcauart.
 
 config QCOM_EMAC
-	tristate "Qualcomm Technologies, Inc. EMAC Gigabit Ethernet support"
+	tristate "Qualcomm EMAC Gigabit Ethernet support"
 	depends on HAS_DMA && HAS_IOMEM
 	select CRC32
 	select PHYLIB
@@ -61,7 +61,7 @@ config QCOM_EMAC
 	  Precision Clock Synchronization Protocol.
 
 config QCOM_PPE
-	tristate "Qualcomm Technologies, Inc. PPE Ethernet support"
+	tristate "Qualcomm PPE Ethernet support"
 	depends on COMMON_CLK && HAS_IOMEM && OF
 	depends on ARCH_QCOM || COMPILE_TEST
 	select REGMAP_MMIO
diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 88df55d78d90..958dbc7347fa 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -38,7 +38,7 @@ config WWAN_HWSIM
 	  called wwan_hwsim.  If unsure, say N.
 
 config MHI_WWAN_CTRL
-	tristate "MHI WWAN control driver for QCOM-based PCIe modems"
+	tristate "MHI WWAN control driver for Qualcomm-based PCIe modems"
 	depends on MHI_BUS
 	help
 	  MHI WWAN CTRL allows QCOM-based PCIe modems to expose different modem
@@ -51,7 +51,7 @@ config MHI_WWAN_CTRL
 	  called mhi_wwan_ctrl.
 
 config MHI_WWAN_MBIM
-        tristate "MHI WWAN MBIM network driver for QCOM-based PCIe modems"
+        tristate "MHI WWAN MBIM network driver for Qualcomm-based PCIe modems"
         depends on MHI_BUS
         help
           MHI WWAN MBIM is a WWAN network driver for QCOM-based PCIe modems.
-- 
2.51.0


