Return-Path: <linux-arm-msm+bounces-115659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2nA+AoLwRGqM3goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:48:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD26EC5C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:48:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aSt7NKha;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="E533xT7/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115659-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115659-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 164FA30194B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5977413D66;
	Wed,  1 Jul 2026 10:48:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940F2264A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:48:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902912; cv=none; b=gc9LALLddj136YRF4hph6uqlR597tNipa75TZpao8+FY3jWNnHYRcXyITmITewPvbvjYg1dulD0dI6gYPTmTDzlXmD6cOK/8I3y/fdpG3oTkh3/fFdE9tDXTFxalXABuIvFH7K2/+r2qK9cmwEgQR+WboT2ceWmR+TMmAooo24E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902912; c=relaxed/simple;
	bh=9g50PUmazOslif0C8RMDuv10dvMS23VETASvpG5MZQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVK3OFKwgSq+2+2SPn//08Ovt0S0YPnuxvDwXqN22rhXBxANU0oNxwhdJmov3RR5ROoeRQGMKvcOKbUj4jS/J6a2gSq7mzbfbz4sYiibLGT2l2/DrB6KUTUqjocIYu10Uhxbb/Pz5g5za2G0Xq3uqMPfjIHSUWooul9/EK1bQis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSt7NKha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E533xT7/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGXjL794114
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rtdfjn6wXasVp2+MzPUAaUEwkTUjgFP+l15
	5HST+Nlc=; b=aSt7NKha1HJSenXBkJMu50NAtk4sNCna0S+aQMJb1rPBKKL1RTp
	wvX0fE2te+flL/uNHQiv6XH5i2gUBVM1PuNy1h95bdUfAXuwfUEW2zaIQToQiEpH
	7+sKOm5z8IG5vCxR0kfZHuEeN1n/pHWe3WkhNi2dqimwDJiofM8N+4aCNgUc7gDk
	2b9aYZTEvciMrcVdcG+9UdabxAGjLTL9mkIoZHVKZn7fcIRFOiJOs7o+uzzjOhg5
	7Ii4SJWrzhWb68I4PXouCMha1JscteWXYqeeJ5oGlTYpJgDe3qNdBJqaTskrOI8w
	Rvqmy1O9rk9JCoAjNSuq6ZaCPSkGMIZfNRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag4t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:48:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso99402585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902908; x=1783507708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rtdfjn6wXasVp2+MzPUAaUEwkTUjgFP+l155HST+Nlc=;
        b=E533xT7/Lvzauy2NPaijkyyr1LvUzzO7ntbmyYf98Dqb7Na47St/gHHorQJXhgdeDS
         F347wM34Evi6HIUHGJFbHUPCpJX9I4aM79+urFSHRt7+MZYSNmNCvS9SL4toFgOxmDCC
         DyW8061flyyu+/tn55vzKvLC8Ij7nBNJl673fUK38WzifkWpryX3/OYji+e8UN/QjjHf
         XPvQ5kq4MiMPyNsKmgADtFCgS6MnNL8WJhUriVAjqLYhEu2/wo8T49jUuguxUPu9TeJq
         32To0LQYlQOv+lm4LaMyB2dIYzoHtKanJbA1MYGniaM/1A7UFZd7Ly+EL0Nl3CVSqo3H
         qUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902908; x=1783507708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtdfjn6wXasVp2+MzPUAaUEwkTUjgFP+l155HST+Nlc=;
        b=BIqiyOVWhUFWDCFD04DyK6CTj8d0cJBTSvrE//MgRotTF+2afNJue0LojudnFCPmfP
         fOqIhGKo+W6ykgVYSmj60WBb8vQc/QEnXJU3Wgefpc9yF/iuL5saUnnMPvzPNzMxwD2F
         v2ZZQxxGnpU/j12yttY5+Qttlqdw5CwNCIaiQeVKaOnBbOoX/WIDE2I/+m71mESiaV1c
         9DU43jREaPg4LLcL7hP3azM/WGg8wbk6cE1CRn7u8KltKrCB5Q9Ah/gGxqjdoO0INnMv
         9VHQ+rkO4TDaIxDrIbs+kbWPvog3LK8MPYUs2W1VYD/PBhHTsE6vL05Hm2jyWW4eH7TQ
         AXdg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tir5ByLywPqtsUcTYTzf5gAM2JY+6LWp0tlJQ3PRx1GVSyz5NSfa8sknq/1DLoZQnu3aJgs7q+ZoE5EvN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsnhbf80MjHnmzdyHV+ATnRmWuK2ykVR1Y/CNfm9hw0RztJ/o1
	7+ndU5dtxXGu3qhiXeru85hmGbJGdXNzryJSr021OVrI4uguCuK1tFBmtJ0EtZqYiHt5ct4i5DR
	caUOR6DrykomWv2tE9qR13blaXL3Sx1rXVt3AGbJ9FMwbwzvUggnipzQuFkYl4GUZiKgQ
X-Gm-Gg: AfdE7clYLkf+MbXxhpgw40tHj6LrvQeG3N5Iu13KVhFyP7l1QgD3Bmr1Df/ozwNR/Wk
	XwVE3O8/rIUZQzbMzNHqyooOohjKKIM7E8E1cpQYMD8Bv5bE8ZwHrg4bUHlQXd9eVesRnfvdc0R
	0J8Own7dU/L9B/JAIWj+BUGkFMdF8VuXf6QIYukO33DO1Talv5ovjfkOJJtm2D3/1BFaX5RAeUm
	ae+fZACKhCUI8zooXNpSvrm+NWLNtqdBfKOrrPP2ALsIPMfyfiBgmnf8zRnLSguKzRd5l5GprB+
	VH/grsXgtIf6NIpB64OWetQbuSkgvxzvOQwk9KyNd5sP+dceel0WU368rB55hp83xPjmFFQG49C
	2+b3SxHh0SRjxtxmqh15VqXY7
X-Received: by 2002:a05:620a:4109:b0:92b:81fb:87b7 with SMTP id af79cd13be357-92e781d35c2mr137634885a.13.1782902908476;
        Wed, 01 Jul 2026 03:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:92b:81fb:87b7 with SMTP id af79cd13be357-92e781d35c2mr137633385a.13.1782902908111;
        Wed, 01 Jul 2026 03:48:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4cdesm17099115f8f.13.2026.07.01.03.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:48:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, ekansh.gupta@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: fastrpc: remove inactive maintainer and add reviewer
Date: Wed,  1 Jul 2026 11:48:21 +0100
Message-ID: <20260701104821.3120719-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dEzEW0yaOTD3_3U_CY4yVgGdfizw-KrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMyBTYWx0ZWRfX/Eh3mfffm8i7
 Pg+e1ptsHTR+1E1CgGtNuKn1Ua6FXboCYQO+hZDqAGlDhOVdLNd+TyQ2AtVNQzgpjQBN/sC05jM
 mWVb4kHyb0JAJkqeiTpYFTHu92Zqmeg5U1lHPTcoBcoq1RUb/rTABKK/7iSxfBB/WcyvOZ3YOXy
 zf34RGfXhUrrO7iMQQrZAYvWMa4NliXPla1twIEHWPE7ptUzpsFvvkZ3niDr3TCjuBU36NEcTLV
 UW7aQMEso696qxKUSdRgLLjp+Lag3/Us4VhmToKm7Vy9tH1cVvSjEkYtPQ7p6VrvofQfq2L8ay3
 LZvDgUA9/TZgKAS6w+FYV80lo/CbyjiGGcAci34JuLTX7Ae+B0nN4lw2VMfUfDX8coI2FXb1RK0
 3ilZX6du+cM8f7mvv76TkqiL/akeKZYRr6GnfTDB9xz54z9QJiJKDDNy4qVbQhkgAHT9JpeJeaO
 9eQskZ4grItG88a1Vsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMyBTYWx0ZWRfX6VTgeTwfhCrc
 mpb+BHUSa7cifR8nZECGIWMAIsGiCn3oMy6BCPZN1L+/gVi0CO5fciA2OjGaI0eNtqiwCmPs4Wv
 aHVsspRGmERwTrzqS067LuznFMvUOJ0=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44f07d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=rxdMid7QtmSFOHtU1qcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: dEzEW0yaOTD3_3U_CY4yVgGdfizw-KrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:srinivas.kandagatla@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DAD26EC5C0

Amol Maheshwari has not been actively involved in the FASTRPC driver
for some time. Remove him from the maintainer list.

Add Ekansh Gupta as a reviewer to reflect his ongoing involvement and
active contributions to the FASTRPC driver from the Qualcomm side.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e11dd741d9f..3023fe8464c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22199,7 +22199,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER
 M:	Srinivas Kandagatla <srini@kernel.org>
-M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
+R:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-- 
2.53.0


