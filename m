Return-Path: <linux-arm-msm+bounces-115476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qXt3IQ3ZQ2p3kAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E96E5A1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:56:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OqHxwc+t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LOWuWaVx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115476-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115476-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33DE33065352
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3C843D4FD;
	Tue, 30 Jun 2026 14:53:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDA43D4E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831211; cv=none; b=rOXOZu+Vhk95ySIk7qD/GmyHcZ49q4fP4QH4aP0A3tuiCKLBnnNt0aMJmSRuPgwCAPVJwdWdCvi2IXaCvzr2+9wGg5EGsehmGvfizv1ehsgM55DO/hY8mXUOsIPpHDOMSLauFS+rGhJ57vLJrkIbN3c5jWYT8EZdEFqYhLaqbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831211; c=relaxed/simple;
	bh=1Q1Xitm/BqGT7JSfwCpKK+MdBYH7XUEoYH8AR342OtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+gJhHDL31oDrUaMR0VPu1wVxOd4hD/VnwKEDqjTl5XbPk3C9pM7JNZ2eDIJxjLvWahxvtBUgHgWoYVrc3/XW55Ol83A+1xI0DtSOm1rJylsNlgfyYcKZ//lSPtMoBV7ukNfLTG1tDIpjqRO3KLkPiOMXotMVM/Hief13T+53os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqHxwc+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOWuWaVx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEE4Mm2226405
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyO
	HV9Tkl50=; b=OqHxwc+tGH8iXXh3rjk3vM9/Ijbh+Cvivq+7wlOxq5AnjJV8Rgo
	Gx7IWZ4k9kRCNgbhXNq3nsod3WqbPuQBlRzvRMMHLtTcJ//DIe+PwKHQn2XeiIWN
	ri8iIwy0SeqbJYuaOdyIHw2BEbahKYFDUJ9p5Ci0W5K4/VIg2kdkyVwnKjnolilP
	oq2kQ9m63zF1r1NT2Thh819BumIS9UAVi2cVDX3swSH2i8An10DuuXV7YozJh1/U
	6DGZvn+Yb1Gs9ExG5aFsvLzqdqcTcoNISop3RjkqTqXjt3DDTOtMkuAwLzeZtbeU
	+wFdn/Jtws0R02CcWb0UKqzN9Kbk+UjTxAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cvff2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0867a75ecso11584036d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831207; x=1783436007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyOHV9Tkl50=;
        b=LOWuWaVxC65yrUFHBCL/cVAnbj/mQFXFKzo9+VA9m9bAGFNJZIVLfKgseWKUzi8rZa
         xj4AnCWY0fVv5ItgIWls8HEMdxwCTr+I3gfsWLmTKs1cbDoMkL9C/OaJe/dghNuQepPQ
         KBuhMKChYAb+LN8fhpxhnGFF8pdFFiWPOynLnfW3gBXYNjzkld17rTUYHbRw0l01OucT
         AoutUL9geC/WLLSGPtCavv+JldHD31Ocu1BC679wbdPQTmB7t2/07gqZEBeaFk7wXkHe
         ehTeTXq8ZxuSDGUY6Z4AL9jiJX1ibowvtuhWQYTngLfUvfyZBKYJHvlEwFGS9Vhrj+Gq
         AkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831207; x=1783436007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyOHV9Tkl50=;
        b=rdfednUlhduagn9EtZ8raj1x3q3t04vFhGN63UXqR+T3nDOmAprfDARL7gCwDIgLFd
         bez/re+5BeiZZGR1ylHSuAfcdJmOwp71xFYuJ7WOJ5Tju7QLJbg1HReveI/Q1fZt/XIg
         67fCaDB01HBevuTJWRA/SpZiw1TWVKbZ7XoAyz1dcTKPmULG6QtO7y/K5XbSbOLFv59W
         5rUkXBumqw0rTx+PbBBZSDIDOIMEoWmzt7wqmGlDUZZ0ur7iwoBE+Qc0wXNds8y4Nib7
         iS2/KTUdSfFDPFc+8yufHmFFYh6nLJrpSEfkZ5Mgs9TlEKb5wd71EkLHIIcIUseS0g6P
         rZtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QXxaOKAyciaVbtJTrjqk9qFBy/xKKNR2HImEjiM3HUpQvHsvI74QaI8XhyiIghO91selYkBMxZCNn+QYy@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfVNr1RuzS0Vj9IiNu+ohhtu6yxTUFHMQS6gRtxm9Y+AcrGc5
	NMAHT/vGSJMDKm+esAxAEbxn55aflRX0n+57IOug10prxaDZZe23PclztIRscmVQVvo2R+g5Cc7
	8G3joX4oGikS/YTrBq3JPXMvRrUWg9UpjT7sAw4WyaKZtJpNzjQvIGtw0PVQUWuphYGfq
X-Gm-Gg: AfdE7ckkmyMuAPNsZuqKh22oaAnmdtT2mo9sfc++4TcX4CwPUSAVPFSZ0Np3vyyHRAf
	g1lbyPoNt5Esls29QjZwLb6Fx11G27IxY3aiZs+t2AsZcPvGFQjZUUnn2Flaks+jP7+/Rm+c5CR
	QQi9zhxkHDXj/BcaDLt8dbKHWxHQImeDCkeJ2RR0kgum6zl/6Pm/9+valxYE1ZZG1F++t/PE2eR
	B41ON909G2B7+uM3tfQY3uB5ls/6J8OyY4WzeoO5Ct+Ip8ss3n2RtWpPkKQl0T+6s2+NQkQn67f
	1ZKGjUQYTZSkKyGgRmLXU947We/p7XDCimjq3PK2bfZzJ65Y1RNUww0pEO9HqEoCl5aA0xCXnIm
	huLLOB/lJWR6ZlWpNZzOKK13HxAvaQX+FsOqPXv4gv1+Scg==
X-Received: by 2002:a05:620a:262a:b0:92e:5cf4:9f1d with SMTP id af79cd13be357-92e6d813bc4mr167236485a.23.1782831206876;
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
X-Received: by 2002:a05:620a:262a:b0:92e:5cf4:9f1d with SMTP id af79cd13be357-92e6d813bc4mr167228885a.23.1782831206202;
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue, 30 Jun 2026 16:53:04 +0200
Message-ID: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+klMZMxqmCwd
 KFSihW0dKr2akYcqbYzXnqcBDg9zKqGrO0FcK5MJ8nHBECXlog4xcOQ89KEnBCtrySczsPbDd/6
 fUdfb42e6/npP7gMVApnDkmv8d5K+HrJZOHuKt9buuPYm/kvKe2g8CuF/DbMv7VGMxSWW4z2do3
 dnQsMUPNR8yuy06SSwQ4ry2NSyamuI31+RvMQA5ArvVtvR1wHBZwKflK7brsWmxrzNVgskFdJ4v
 ZAu/u136bKDWffHngE2x9otWVGhtbjIUqXu2Y3DaJZ5RXd0qfUSVE1vGBZO/jOkNu3/34DY50ga
 qQ7Uw0fd2N7KIj01dqx63GEGHtR4jD5bITDNexd00IpyXcsQNr5szAv98v/tcmfeGj253awjmyh
 yw2e5vWrhInRfWhj31WF2Lf3IHb1jCJSyYhwhTNUwT5+jPjGHyHbJtM9kCe0k9vULb6GhVpK/vu
 KRjcs6dtrHXKSiZho2w==
X-Proofpoint-ORIG-GUID: dmRVjexSTZn4YABp8KtDSY8sL_C433i_
X-Proofpoint-GUID: dmRVjexSTZn4YABp8KtDSY8sL_C433i_
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43d867 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=BPc3F_TA1yA0jLc9_u4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX/fj6baJ9xzV1
 vNTNQG9glU7VV7J1awZkF6AA9Kh3f8JReuB4GVPmUf1xddvuEBy652jJMp4/Dr7JP+mWYx3D0OS
 T8+F5adp2bw/FEvMqZ6zyRyVaYsNxnc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115476-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 162E96E5A1A

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

---
 Changelog:
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really


Daniel Lezcano (3):
  platform: arm64:: lenovo-t14s-ec: Add hwmon support for temperatures
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 174 +++++++++++++++++-
 2 files changed, 236 insertions(+), 6 deletions(-)

-- 
2.53.0


