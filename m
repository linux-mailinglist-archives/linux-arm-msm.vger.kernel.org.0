Return-Path: <linux-arm-msm+bounces-97380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIcmM7fTs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:07:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE522802F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5E543007ADC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291B9387596;
	Fri, 13 Mar 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ip1Ic3yC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zl/m3VVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30532386C37
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392592; cv=none; b=CLUQpKRTVxJGpAfIupFhUiGJNf0JN3jC+g0xEWdjNbdWva4UfnG/Jyl31YcC784SWO8KQNkBLcRsrj3PwjVgWHAK1cR32EJ6nsiZ7kgxCzYb6kFrb7lzkR0P2f3fFNgu+g0pJObBVzHPlAKQB60WZY7rQJZUiC3/hpsM8PsQ7SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392592; c=relaxed/simple;
	bh=XxaF0d4GsY8w76Qm6KBddVxedRFRq0jSH6fNohRSiiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fI2M6YYGVigSbv3fP8oWE2mNi6px4vx3YSPJb0QNtS1VTJ8bC/1XMWB2rDXae6eDxQDejNs+k+txSmzvbOwZX2/bNKlJQGOmUcrigvgANdGyH/9LGe0JWl35zsfJRQEBmXW8+KUhyM0Z+lCccI9wCwhyOKhzpixn/Cx/NI1GJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ip1Ic3yC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zl/m3VVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tZoP4140640
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4g6Bi/263JJhMEabL0RlzSYfRK5KWj5II2MW3Vr000Y=; b=Ip1Ic3yCYFZVHhQ+
	oIESswTIyX6yp/kGXZsvr1sqntZ8Gv94atSrUlbdDo4QNvE6dYYb3pkyGumbTG42
	pjS6PC4Ga9tlHjudvDg+WnFbUpCol2Ugn6hJhFR46rCLZaANgj//R+30OWTU856j
	ERiZ2WAZmXBGVd8IIQpZcQFJBjMEgfbR6JSOPQxhpSRLunxdNqAj0qbYeC0pRlT8
	hlA2An0z2ydUlueUGUR2ZYSmoylS8GesZUyeMZ3IUJib+detZKrGL8TsmWUuqE+S
	NCau/2SDOtp/ouSrXodKMh/Ovv8FtAorFM0nDARxu4YC8Vg4G4VKR98FeQf2evUz
	JNw9vg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn28w3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7385e8fa73so1004489a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392588; x=1773997388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g6Bi/263JJhMEabL0RlzSYfRK5KWj5II2MW3Vr000Y=;
        b=Zl/m3VVE5fDJDu5eOHpTBFZ8VmhPiq0zqjZ8gBMuY2y2g9x8Iv4Uzh3iWM3r/D8a00
         IH4l4tN6/nv/gzwgS8ZnvAX6ne38Re+hbpD1KePRgxYuyUfHexgKBLeMi6R0K92ocXaz
         NOCS3xs37IPFjHgPPEzJAG5/Fu3qGLNMRhew4qE2YfiZKxH2qkW1tFbnIYeUdsXjg+uE
         87RSn7ecDc8S7p5EaCBB63ec/N3z/H3rY+d0NCUxAzNsURE4raUjcl7/Ak2u9YVFGjxm
         yWerq0rECg2Lxmx1w+5HaLmHEU/OKqR5FrZNjH97QAxhUiNEK/rwH6vq7RTSlPmohyOW
         gHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392588; x=1773997388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4g6Bi/263JJhMEabL0RlzSYfRK5KWj5II2MW3Vr000Y=;
        b=KG4dL/Fkkw88xjUvwambX0W1O7ROhz6hF+jtOhWAhMXHh6cNYhCjvVojDj+8aywkpB
         n4Cgcm2JsroLR3oQO3RijEiJsDO+E524OlLuY0hB9lBdoVMAIWndMuCDKcrWctg1fwZK
         9H4yHSSUL4uqKUSdtU7SYMJwr/U5LyW54uve72brttU4OpBdYpmeZyvtUoboER8s9vb+
         bQ3MD6d/FkWQy66t1i2p6fsIvszaGDL7t3E1DMCkY2RwnIpnmQeam3yIyiDAv6hZm6MW
         xMNo6uGiO4qwAbutQridLQugsgM5Hh8O5YiN7eboDwvvPxSho7CoTfXERPku1V94vAYe
         LWww==
X-Forwarded-Encrypted: i=1; AJvYcCW8NprGb9l+a/6qUebxMpODgv2Oo9bMwvuRVVlZBP+FHPyEcB6yavWCUIxoCfOSsT9UZsJ8P83+4DJXQ1E7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPDowu0sqnwZ9ootB5c+v2zid2OT3dOhjFs+J2ySiSC/F8YJYU
	n6twBHChzp0sRp9fnYLW/c3+M46Momxd3HfKAO5Iphj5ittSBqzY8LfzOeAwdywwVCHsRIWNMdl
	ofnaF8kDaL16Nfhj7rscuvSJbxN2/dXHVTLDCoayo63Ux8EwbBLM1xDzaQMDnbMJMZufv
X-Gm-Gg: ATEYQzxZkDh8d9I4/eIZNZHDVCPcunT8HadZwYGJz5acTgjBg5ZplD7Mc9uFIE/9srt
	OhJwmhuf1NP+Wq42aEWX6i5jUhijV0KSQVd71uGacHkyrC+4F5Q4JMpuUsIrAkWvbmlSNLjSlHf
	986sWQ469PCqDubCgjzxY2wNZD3cjD5yHn2bsHc6AnxanksIAHCsKNiibo/Rtb2eMkpwRREYAwV
	NKbUzmpjKrh1pF71joQdgj6tkyvU0TiHkhm36wYC8IDood39r4UCS1dBinecfw6rkjrLYQW40LS
	3jG/c9qodwik65nm0vsGs+g+56JJYeU9UHd01W/vCZN2kDZb6+L8ZZh6VCMX9bQ8zLi3M0yXeKw
	oL8aNJQAgDIrmhPpavkyqEg3GvNWPSZ35Iadbw+igSXQg7Mh8MkMZWfjv22X/uTiIV7Sq3kDI0j
	KU1DNi8ME1
X-Received: by 2002:a05:6300:49:b0:398:aaac:a08f with SMTP id adf61e73a8af0-398ecd55b7bmr2094475637.51.1773392587806;
        Fri, 13 Mar 2026 02:03:07 -0700 (PDT)
X-Received: by 2002:a05:6300:49:b0:398:aaac:a08f with SMTP id adf61e73a8af0-398ecd55b7bmr2094412637.51.1773392586993;
        Fri, 13 Mar 2026 02:03:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:03:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:09 +0800
Subject: [PATCH v15 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392553; l=28446;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XxaF0d4GsY8w76Qm6KBddVxedRFRq0jSH6fNohRSiiQ=;
 b=M1uftfVGCZOUu51wfkI5NZ3hdr6bgDkTp6H5hFi7seeJqdk5VUjG6MyDSTh5XZ+mwaRJMz8N1
 WxF3quX2FdUCWwfppnIP/wm7gOJ+/rBtEH2XK4cv61ZzzcliewNAIDG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Mwzii3rE9uU9dU1FyVY_UHBpLz0Pp6uc
X-Proofpoint-GUID: Mwzii3rE9uU9dU1FyVY_UHBpLz0Pp6uc
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3d2cd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6MhHx5wqrWBboxSnaDoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX0/hM69lMtr02
 Ws1DCtIEopHl/4NkLPL9cv93rwR64J4Cjczsu5ZV6HmcqagsNqXZse2frH7EA9ABgupcdPSFZtq
 r8QgmkZrv6pFaMJkjYzMdz0Ib7c9V7OuokN7rstUyetn9My8pWST/UAZeQZdcYzQF9hePzQbabD
 /FCxzi1Hjxt1gN6fmBIny+BTTwMK9mEh+i1P4CgcO/ZD4rEMcGayOrzn1wP7WvTOhDRlGtYWzmb
 CBQKxO3sDSCKjmEouOEVD8wommTINkkTIOEux7QDvxzhncDGEACBuB+ZPGQgJjyzJFH8SFsHH71
 gGZYM/IgSWe+r1pwiLFIS3ieaY8L6rF3ZjYVP+faFy3Tp1NqYFRlPlaCdVX+7D+eqXzlET2gyT1
 +o7h/8Qz8bFvbHcTQlm/wYj9KS4dToqXQn1DI4FwTZZ2kXk3NxtkYGiquJZ44ir5McXAY+NKiJJ
 U9o8CCevf/e/Mtm+Hqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97380-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CE522802F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
The synced buffer will become available for reading after the switch.

Byte-cntr workflow:
start -> ctcu_enable(ctcu_byte_cntr_start) -> tmc_enable_etr_sink ->
tmc_read_prepare_etr(jump to tmc_read_prepare_byte_cntr) ->
tmc_etr_get_sysfs_trace(jump to tmc_byte_cntr_get_data) ->
tmc_disable_etr_sink -> ctcu_disable(ctcu_byte_cntr_stop) ->
tmc_read_unprepare_etr(jump to tmc_read_unprepare_byte_cntr) -> finish

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 286 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 104 +++++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   3 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 105 +++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |   9 +
 8 files changed, 572 insertions(+), 25 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..f17a6c0382c8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,9 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_enabled[0:1]
+Date:           March 2026
+KernelVersion:  7.1
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the flag to enable interrupt to count data during CTCU enablement.
+		An interrupt is generated when the data size exceeds the value set in the IRQ register.
+		0 : disable
+		1 : enable
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..56d73f91d47f
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct ctcu_drvdata *drvdata, u32 val,
+				   u32 offset)
+{
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
+						 struct coresight_device *etr)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(ctcu->dev.parent);
+	int port;
+
+	port = coresight_get_in_port(etr, ctcu);
+	if (port < 0 || port > 1)
+		return NULL;
+
+	return &drvdata->byte_cntr_data[port];
+}
+
+static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
+					 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = etr_drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!etr_drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before initiating the switch */
+	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_DISABLED)
+		tmc_etr_enable_disable_hw(etr_drvdata, false);
+
+	list_for_each_entry_safe(nd, next, &etr_drvdata->etr_buf_list, link) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		} else if (!found_free_buf && nd->is_free) {
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->pos = 0;
+		curr_node->reading = true;
+		byte_cntr_data->buf_node = curr_node;
+		etr_drvdata->sysfs_buf = picked_node->sysfs_buf;
+		etr_drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Restart the ETR once a free buffer is available */
+		if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_DISABLED)
+			tmc_etr_enable_disable_hw(etr_drvdata, true);
+	}
+
+	return found_free_buf;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
+				      size_t len, char **bufpp)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct device *dev = &etr_drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct etr_buf *sysfs_buf;
+	atomic_t *irq_cnt;
+	ssize_t actual;
+	int ret;
+
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
+		return -EINVAL;
+
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->buf_node) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				(atomic_read(irq_cnt) >= MAX_IRQ_CNT - 1) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!ctcu_byte_cntr_switch_buffer(etr_drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
+				return -EINVAL;
+			}
+		} else
+			/* Exit byte-cntr reading */
+			return 0;
+	}
+
+	/* Check the status of current etr_buf*/
+	if (atomic_read(irq_cnt) >= MAX_IRQ_CNT)
+		dev_warn(dev, "Data overwrite happened\n");
+
+	pos = byte_cntr_data->buf_node->pos;
+	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
+	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset buf_node upon reading is finished or failed */
+		byte_cntr_data->buf_node->reading = false;
+		byte_cntr_data->buf_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	}
+
+	return actual;
+}
+
+static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int ret = 0;
+
+	/* byte-cntr is operating with SYSFS mode being enabled only */
+	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
+		return -EINVAL;
+
+	if (byte_cntr_data->reading)
+		return -EBUSY;
+
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
+	if (ret)
+		goto out;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	/*
+	 * Configure the byte-cntr register to enable IRQ. The configured
+	 * size is 5% of the buffer_size.
+	 */
+	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
+			       etr_drvdata->size / MAX_IRQ_CNT,
+			       byte_cntr_data->irq_ctrl_offset);
+	enable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->buf_node = NULL;
+	byte_cntr_data->reading = true;
+
+out:
+	return ret;
+}
+
+static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
+		return -EINVAL;
+
+	tmc_clean_etr_buf_list(etr_drvdata);
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	/* Configure the byte-cntr register to disable IRQ */
+	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
+			       byte_cntr_data->irq_ctrl_offset);
+	disable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->buf_node = NULL;
+	byte_cntr_data->reading = false;
+
+	return 0;
+}
+
+const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_byte_cntr,
+	.read_unprepare	= tmc_read_unprepare_byte_cntr,
+	.get_trace_data	= tmc_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	/* Don't start byte-cntr function when irq_enabled is not set. */
+	if (!byte_cntr_data->irq_enabled || byte_cntr_data->enable)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = true;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = false;
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i;
+
+	tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		irq_num = of_irq_get(nd, i);
+		if (irq_num < 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING | IRQF_SHARED,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		byte_cntr_data->ctcu_drvdata = drvdata;
+		init_waitqueue_head(&byte_cntr_data->wq);
+		raw_spin_lock_init(&byte_cntr_data->spin_lock);
+	}
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index e8720026c9e3..56590f22ad79 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -18,6 +19,7 @@
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
+#include "coresight-tmc.h"
 
 #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
 #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
@@ -43,17 +45,21 @@
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -62,6 +68,85 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_enabled_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].irq_enabled);
+}
+
+static ssize_t irq_enabled_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	if (drvdata->byte_cntr_data[port].reading)
+		return -EBUSY;
+	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].irq_enabled = !!val;
+
+	return size;
+}
+
+static umode_t irq_enabled_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_enabled_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -140,11 +225,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -195,7 +284,10 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -209,6 +301,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.groups = ctcu_attr_grps;
 	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
@@ -248,6 +341,7 @@ static void ctcu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	tmc_etr_reset_byte_cntr_sysfs_ops();
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..a2ae0a0d91d0 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -1,23 +1,31 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(3 * HZ)
+#define MAX_IRQ_CNT		20
+
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +33,68 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @irq_enabled:	indicates that the interruption is enabled.
+ * @reading:		indicates that byte_cntr is reading.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number of the triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of the byte_cntr_data.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ * @ctcu_drvdata:	drvdata of the CTCU device.
+ * @buf_node:		etr_buf_node for reading.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool			irq_enabled;
+	bool			reading;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
+	u32			irq_ctrl_offset;
+	struct ctcu_drvdata	*ctcu_drvdata;
+	struct etr_buf_node	*buf_node;
+};
+
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
 	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
 };
 
+/**
+ * struct ctcu_byte_cntr_irq_attribute
+ * @attr:	The device attribute.
+ * @port:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_enabled##port, 0644, irq_enabled_show,	\
+		irq_enabled_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 110eedde077f..9f4fd86e8c32 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
+		*ppos += actual;
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index eebfe45b82b9..8b8bb43197b6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1168,6 +1168,8 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 	return rc;
 }
 
+static const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
 /*
  * Return the available trace data in the buffer (starts at etr_buf->offset,
  * limited by etr_buf->len) from @pos, with a maximum limit of @len,
@@ -1178,23 +1180,39 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
  * We are protected here by drvdata->reading != 0, which ensures the
  * sysfs_buf stays alive.
  */
-ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
-				loff_t pos, size_t len, char **bufpp)
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp)
 {
 	s64 offset;
 	ssize_t actual = len;
-	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
-	if (pos + actual > etr_buf->len)
-		actual = etr_buf->len - pos;
+	if (pos + actual > sysfs_buf->len)
+		actual = sysfs_buf->len - pos;
 	if (actual <= 0)
 		return actual;
 
 	/* Compute the offset from which we read the data */
-	offset = etr_buf->offset + pos;
-	if (offset >= etr_buf->size)
-		offset -= etr_buf->size;
-	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
+	offset = sysfs_buf->offset + pos;
+	if (offset >= sysfs_buf->size)
+		offset -= sysfs_buf->size;
+	return tmc_etr_buf_get_data(sysfs_buf, offset, actual, bufpp);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_read_sysfs_buf);
+
+ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp)
+{
+	ssize_t ret;
+
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->get_trace_data(drvdata, pos,
+							  len, bufpp);
+		/* Return the filled buffer */
+		if (ret > 0)
+			return ret;
+	}
+
+	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
 }
 
 static struct etr_buf *
@@ -1248,6 +1266,33 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
+ * @drvdata:	drvdata of the TMC device.
+ * @enable:	indicates enable/disable.
+ */
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
+{
+	if (enable) {
+		tmc_etr_reset_sysfs_buf(drvdata);
+		__tmc_etr_enable_hw(drvdata);
+	} else
+		__tmc_etr_disable_hw(drvdata);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
@@ -2050,6 +2095,35 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
 }
 EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
 
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops)
+{
+	byte_cntr_sysfs_ops = sysfs_ops;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_set_byte_cntr_sysfs_ops);
+
+void tmc_etr_reset_byte_cntr_sysfs_ops(void)
+{
+	byte_cntr_sysfs_ops = NULL;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_reset_byte_cntr_sysfs_ops);
+
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size)
+{
+	struct etr_buf_node *nd, *next;
+
+	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
+		return false;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd && nd->reading) {
+			nd->pos += size;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -2060,6 +2134,14 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		if (!ret || ret == -EBUSY)
+			goto out;
+
+		ret = 0;
+	}
+
 	if (drvdata->reading) {
 		ret = -EBUSY;
 		goto out;
@@ -2097,6 +2179,10 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
+	if (byte_cntr_sysfs_ops)
+		if (!byte_cntr_sysfs_ops->read_unprepare(drvdata))
+			goto out;
+
 	/* RE-enable the TMC if need be */
 	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
 		/*
@@ -2115,6 +2201,7 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	}
 
 	drvdata->reading = false;
+out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free allocated memory out side of the spinlock */
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 00a0b3597348..eb8b34b3741c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -211,12 +211,15 @@ struct tmc_resrv_buf {
 /**
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates byte_cntr is reading the buffer attached to
+ *		the node.
  * @pos:	Position of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -480,5 +483,11 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops);
+void tmc_etr_reset_byte_cntr_sysfs_ops(void);
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size);
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp);
 
 #endif

-- 
2.34.1


