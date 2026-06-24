Return-Path: <linux-arm-msm+bounces-114398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qm7hAAAsPGqakwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:12:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 715636C0E94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:11:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RC1HXMRT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cJAfX6Ma;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114398-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114398-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A4963051D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE0C3033D8;
	Wed, 24 Jun 2026 19:09:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607BB347BA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328172; cv=none; b=TdBk4oeyz+U8wF6HZ7jQ6jTGW3j/u0hoiJX/VxN9klIVJzHnA011AfQymUve27zlvA/SxW/T0j95IqjxA7Wy6yy0BSeft7xM6lbubiBcfiPY+ASt80O6dc0ae+AKhOGBbFhABeqG70N4cZwLi56XpQeOvtKd5KnZSiNpkkFAmGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328172; c=relaxed/simple;
	bh=PCR1Avg3wKF00OEiFfGAm/GCHDD772888WheuRaZJrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X69O+i/F9DsbMsoeg41nRcuGprf2+ulEeOzjgXJ3a0aF5yu+lKF2F1jTHZiSqqY//UiMgPJOlRRIb8wxfRBUINVMjW2SNUCVEOLQnOASmTcADuEdKdPT2/7XQDYSsJ19i6o0MxTlWsYsSCJm4S+XMYoJgnKAmTAgcRlRsUgyPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RC1HXMRT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJAfX6Ma; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHitsd977470
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sTQYAytRwag
	UR8kVm08B5B5QZF57Jt3LflBwX+0NUTI=; b=RC1HXMRTcpeR828ex4Jk6Ug18+Y
	HgnunOSWXGL/p/fJ4lLU+XaDSC2V96jFErBon/NYUoiOmM+ECx4Wk0TvetstVFDF
	TeGTI4VNSeAh4Iq4GsLztq2d06SVmq6yponsvqi1NlARS+OHh3vpmDRjhLR7tOkm
	KNQ8XkwN40F4WwLj/UGTyZo1Nmc6eLXiGXGJPrUlFEf9GyoZY36jWDSOZzSqorV7
	oJdqg4mxN2h5ytrm/LJkqHN8KOaNz6Sj1rsDrZX8LROunk5WFEqDyDG5XbmLTIJY
	SVuVQ4sroP0Atf0377iAujau4RTs3CN1RRyxsFaNGbijb8DOt3fK643vC8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpau7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso105685b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328170; x=1782932970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTQYAytRwagUR8kVm08B5B5QZF57Jt3LflBwX+0NUTI=;
        b=cJAfX6Ma/N+UghtTT72ECT44Xn2J1CmKKpeYZxZOH3ZFmiWjgnyo3diQ34d6Y1FJmU
         Y/tKkyB/Clnl0BYlPpXufzepPJWcW2zsF8gLbkO+rM6fUMhfv9jiGLxAap5BWpv6/hXx
         icbWGaoO9X684i7dPfgfWQ0oB2pw5jBE3yRfL2phXf6TZJzEXZleHi69p8UjM0fF7QZm
         +nqS0Ze4HGc4w/UC1Xa8fbhPicpCUlR5qYg6T1zo3j6akvgk5VheCMJY3PP3max54Eh+
         vthi8zPAsG6doW6p+HeoUs3JqskfJuOYzAGCzmx1/XxLwSdswUM/k3QELQV8ennWpsA6
         wRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328170; x=1782932970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTQYAytRwagUR8kVm08B5B5QZF57Jt3LflBwX+0NUTI=;
        b=RGA7nxLbTggOrPH1RCGyMh0VqalXNQFwBW4NgQ7GeTLe/NCXGG28hf1LWMfZr1rwls
         85kJ6JORnUxqnqW80MKrYdw+WRccAu8RUz6CJg4R6WzLxnHa3JiF0hsZKoFPObsXw9Rz
         ngGgiBf5DB0EGAE+rB9eq8Oeh4iGWpNqPqn/MDcOQyFEjQ57DDtbhD/MgfUdXRhHoEtE
         aqfFni8UhkW1Ynn4WMA3Sn61/42OY6c94fjLTq9PcA1KHwMD+p8nAoFMy+yRYbICOcKA
         OzqWuQWPbCEM9Pv57IAmenQJ2KvAuwIoK83MVz0bTKzwxRFrUW3gp4zR6lspOEN0rYlt
         Z+pw==
X-Forwarded-Encrypted: i=1; AFNElJ9iHpane/mPWSoxE8owpbLe3u14A30EawXzZTsWd+UAyAjW8fwrB5n//IMhSx/8fR52qly9BIjBWRCk9sTz@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmR8QCj2SFIJfWCJdKqjRq3DxV+6IPosMUJae3XK7VJMNOsf1
	k0iruiFbLom6vHldXveDNXoztRaPVcq7d0ISj+7uU10OQYe80nF5kupAIbCj7U9ipli5lUN5czj
	Ruer0GCScP+PmLSu3eQ9svPA7JQySoZUCP6L2Xue2taHCWG7zXOLJ9ItzYf4YxEFmHD3a
X-Gm-Gg: AfdE7clBQZjSnWDRYxzH0koQYqjDvQYApfRO6COquaaSky1aeUdS46p2SZxJHQaGwdo
	uNax+i4nHqcxWazxGvXCCOasEt62QiLUTNGP1MfiWVuiyGEiXmRnjgE+HxkHqM2+WleW7cSg4Uf
	zaklt8J3bWY/TDIBdwCTS2wn4DOgbfz7HN2y3ImVyOgUysEmCE69pnLPN4S6U1PjZefvggS5pZB
	hFFH8InnffsOsdVM2HuyL/0u/YCZjOHxuh18/KVMAauTghP2advyfv1bYoGFcZBiw77kA4yV7ap
	+doXkZb/NVsVu/K/Mf6Ca9SfltcOir8xOAhUMxGIdgCEDfNxRb28mJnqWCyXvU4XXg+p2DBjMOv
	gIQUj8tR6OcbABuJEWMwLgTTBOK0RnecbXb8RbA==
X-Received: by 2002:a05:6a00:1acd:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-845ad30203dmr1475698b3a.21.1782328170135;
        Wed, 24 Jun 2026 12:09:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1acd:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-845ad30203dmr1475667b3a.21.1782328169606;
        Wed, 24 Jun 2026 12:09:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 12/19] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:23 +0530
Message-ID: <20260624190830.3131112-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ToMNbp2AvP8jZJXO0kJFRzBG6R6obPbG
X-Proofpoint-GUID: ToMNbp2AvP8jZJXO0kJFRzBG6R6obPbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7qFf3pqETyOb
 7c8Xnzl9T8Ljeiam1kakkbENKYItOwCdFSLd5Rr77joOyVm1QMYBP9tBBIbYADkqNK5IcreEpD1
 fObykgKXKux2GhCoECbohAPQbsiKN0jP8LeYoQrETS1gGDZEfUG0v7wmV9QhMd0Rf1Lxc2jWwB4
 FRZPRYtaqWML2P60mD1tdi9cBd2gocKuDJvTXy94xSTpeP5cd9tNpkGN2YKPwGF6YiexPISIgz9
 5lJCyQlrj7/N+4aP9+xKZElPsz7q7zieynUM+za1DI89/6Tx93k7pAPRg7a+VSY57VC+HZUBR6b
 mLNmxN6wKRDV63F075s1zIzM+JJ3VHmM8c2wpTQnnYG4isyhz6V7yO/QISmHpMWO/B9jfD/UWcu
 LFl47MM8tIb67bmRcTDjopJWbJlQx8AgIwmO9NxJeitqjbr8Vge6w7SG2sk+Ciy001nUyx88T7x
 s6tCl6jbAWcAosBSkQw==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3c2b6a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXxiatrFskv5ke
 MUoceKXFZzRS6zGxdHUTZQwsf18g1C6lSXtiSehUSI7wBdkHZ18VIqlRzOolWuhZaME2bWFfD2G
 vlU71uJRAiWoPr+NBHnsI9toFUe43nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114398-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 715636C0E94

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..88751d3b72cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -645,6 +645,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7091,6 +7092,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0


