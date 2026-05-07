Return-Path: <linux-arm-msm+bounces-106423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDfYCT+f/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:18:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7774E9FDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B770309DFC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CD93FB7D9;
	Thu,  7 May 2026 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3PQ7/FA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsLTCKRT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1723F20F4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163157; cv=none; b=nW7iHe+JVTJRjz00vwcxbMfFr+XJBYEFGaaW3ptDR8nB2KieMt2VMai2EUC8xUi/ti+RCHbZJC2K+z9/lAQLRYjMbNDHFwodiYq/dNHS4ICml1XOzvGDREdtqR+Ern2zZGZopCIdhymAPKalakmWQi7iixT4fpzbD6OwEV9jdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163157; c=relaxed/simple;
	bh=lLsBdDNyUIFFkaxICfqNhHUfqhZRcUjumR3u0i6d+XY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ugCBcsfVwjmAKEUQNnpD19wgwDPSnd7aVgHoWyURTyEJ2ZycT24Kklc6ZSYDhmJUCfB6X4K1qeRMe+cQksEEqKTTiMEhqlJ9EX4bhSP9o/yhI+xUNJV0WFXReBAGZZCs0lFkNQLPra3BIEYc3v+rE1RknfpJ13GXdrC+mmMmtN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3PQ7/FA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsLTCKRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479Co5R3464724
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OdsDUl6EizA3a1UUXhhLFK
	1X1aImBFkIFG51CSZtM+0=; b=X3PQ7/FAE+VtwOXh/7jC8vun9WTJixyR0O5P9R
	bgR+Sdd3LK/DQKQTEKf4gsxOLVgm2nGZJvL6kHPzCU4t2BfWcRdkOeCoqen/WZt+
	lJV5cgoEzPDytRpo9xlm8RvLlpxq70Nzo+9iPayQqzIH1phDnEyy4JcXN5t+izfg
	KCQQqdv9V/Q4kQDDJSb1PxkJxvOU05JeWoJ3ovTs8OqQzKZxZz6d5g5w9Y/phw0P
	/z9A70zhJk57qk1Znkp8x7EzlgKkG1ZAqNKODwW6hOJzhtmJtv+88Qb9FCdxGNld
	+gVkE9z3d8qQ3is4hpgkfrJ26mmU61y/bBQTWngrSwA4Q4qQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2enq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so253791a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163154; x=1778767954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdsDUl6EizA3a1UUXhhLFK1X1aImBFkIFG51CSZtM+0=;
        b=VsLTCKRTQIsa+4v9AZ/M+64CssHl3qAhdXb0UHles8ZDJq3Ir8C4+6psDAsV1XPWkz
         ox/X71llWPRb/cyABwCwzrPHCU/KTFQPTgjCKjkLCLaT0+ynI9AmP98XdTKB2Y++7Agx
         M34y5E0VuMJcLoXI4m4SSnQy3lcnVXYd6C0SfCIv/zzARSPVwdTLGahAmJmufJfSBDFN
         R5NDHm21XKo+iPKA/qZStPap9KNr8Zfk5UQBAFATZbrnVxSjrhUGwUZD2xMS6eyawLdt
         3muIzWpc6UL75adPqOuyMdW+LpLgJhNSsQSuIbTNXLLJ1DHFg/G0DvrgS8tF0IhO6PVa
         UqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163154; x=1778767954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdsDUl6EizA3a1UUXhhLFK1X1aImBFkIFG51CSZtM+0=;
        b=KMc3FM11duJZUo2akQ9C3x4ZLf8sgc+t4NKar4Zepdgu7UCbLod9xNiWtQQHq5i6dY
         C5gC/3ziUqr3Jt8003bpjdOUYqVPz+chha1bvGVenM1W3Bxk16vmeMPkYbqTYvxQNTMH
         9TJ12x8y6hC+UNHPXuqoy8n/yk+Lyp+M0gWrnqGfXYeawmqhm49Cl0bUqhNzmzIUBWeT
         5vsf/c6VHaCBK/eaMe3gjO+wW+ehDSAWqQNgck67348tvj3S0GlQqQyZ3kch+ugfilvN
         3nAG9yesWwgY4MtyMJGHLTT/c6p+3UoZ8kOdz68v6BbUj+XCVHOJjjC3NSPrWisJ6lsJ
         i1Sw==
X-Forwarded-Encrypted: i=1; AFNElJ/1/GdafknMp0qaJd2nktqGHPPMBFj3lnHWNkEkpUqMFiYECCr8y6Slx9ASPFBoKG+JlWb5yqWwEbGyoBgT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ALn0mCPuK0uHqI84MAutLalF4yFNBKd87boMGOQiTLBEQMBG
	mUnr+TpONai8GmbmXPDooL6GUVW0cbBHX2eJ8/O4Ad3zrsmPWSJz16mVVVJZLAYvxtVP0gYhHdt
	Q6EvdDCFhUNxmcFqd8KGxCHdrBCSMhPyS21H4KgPZA4aWs8rCxa5w7Liy3lN/jm9vVNyo
X-Gm-Gg: AeBDievB0WFbCFPmR9/PDmNU8IEve2mTHEE5NNfoRQX04/M749avyELyCHSRyRYD3c/
	U2W/UUAXA5IvI2jfpbsz6zRPZXfim0RwjDzTt6K2somQxzG1VPN+P6RXMLvlo72B6vJjeB2VnDN
	vHdv/DbXyOhcX+mnQ1PGZZaYX+x4zemjgh6ptpi5FQ/CIZ1DvZ6yrzowyivig8tcS7BuG1ZeLSm
	OvT+8m7mgd7DI4yDZhJm+bc/5vgHl/tRrZ2f3OUXEoNHKn5ZJ74uoUxOzwq5hzwMjxdxV+ooel5
	1mpsTBkYkdfvWsjVCitwSR2U4Fk8N1KHOowh5izZ+PiBPRPyH6A9JPPCaTDZp2TY5sUVPhbD3fC
	z7ufNQZi1g2C69RFXhtmSw7+uEJdqZcmaWAXAEpeKh939AHYC+NwG4o+bIYUzl4JlYgrZVoN5ZF
	tJJ+xI3Y5gwILfhiVxJts=
X-Received: by 2002:a05:6a20:3d09:b0:3a2:e0d3:37db with SMTP id adf61e73a8af0-3aa5a8fedacmr9497272637.11.1778163153591;
        Thu, 07 May 2026 07:12:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d09:b0:3a2:e0d3:37db with SMTP id adf61e73a8af0-3aa5a8fedacmr9497209637.11.1778163152852;
        Thu, 07 May 2026 07:12:32 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:32 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v18 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 07 May 2026 22:11:56 +0800
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK2d/GkC/43NTY7CMAwF4KugrAmKk+anrOYeIxZpakMkaCApF
 Qj17hPYDIuhmo2l92R/frCCOWJh29WDZZxiiWmoAdx6xcLBD3vksa8Fk0IaoUTLcfDdEXl3H5G
 HYcycUuZhDFdO5AwaaF1nidX7c0aKtxf+vav5EMuY8v31a4LmWf+Hratc8CCckwq1d2i+Uimby
 9UfQzqdNnWwJz+BfiNBLZK6kmCtJWiwV9B+Is0bKZdJU0nrG1C9BOhc/4m0v2QjYZG0lWwDKUO
 kNQXxBznP8w8l7qAsxQEAAA==
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=13379;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=lLsBdDNyUIFFkaxICfqNhHUfqhZRcUjumR3u0i6d+XY=;
 b=Ml1vY81DFfcUv8G6HCz51Se7cko+giBdny2tke8Ge8WhF0SuBs5XKdVW7D1Q32755cC/rtHD3
 JO/RYoxAW4+B0fchyoVnosni3uKsJ9t5JxVDDIHXtTEUaW1wI4uwazm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX1BK/wMnKR6UG
 SodnT6KUHW5shDVKdK6XUtIIvlofhMKDgY6oj4tIyh2RNUay2KfvTc/diAk3HxWmIcntOgaHpPH
 kB64CvLzeONOghtDsWLiHwNnWou6n/dd7ULD6na6ECeT1uJnBC2KnLad01hVeNdmCA/vnxGhcLu
 PNL5CxTv60+y0zJCGsHOXzbawOq1BqfPkGScHv05WwZ8h4asqBBD2/zIGbcvtXxbXIYpjS8Gfi/
 2WJCoHaZrGs3Zp2XrXcBHKG19S8V3k+l0LXms04HpzKBXgGBGPwD2IiUAvwTmNAYrYt4nnf1h1C
 jAr1YrEqhPS7pGpxMlzptHHJAb1kxLQplrAGVZkOS0gxeMsyZxFB1LSDcbIM7qf8vny0fl/1pfz
 1OGxoCFFL4WEVuHGu++kWyQTvvucICXoeUxuh1lnv6M5GPC2a8m1271hi7AO9npmUQSjpmMltaB
 m4uph9nC2xs+8L5uyQQ==
X-Proofpoint-ORIG-GUID: NHBGYqh0f0XYa8ITA5tY7iWb0dlBfBAe
X-Proofpoint-GUID: NHBGYqh0f0XYa8ITA5tY7iWb0dlBfBAe
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9dd2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=wytrw3nfpMjUIld83N4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: 8A7774E9FDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106423-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

Test Report:
=== Module setup ===
  CONFIG_CORESIGHT=y (built-in, no action needed)
  CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y (built-in, no action needed)
  coresight-ctcu: not loaded, running modprobe...
  coresight-ctcu: loaded
CTCU byte-cntr test
  CTCU   : ctcu0
  ETR    : tmc_etr0
  source : etm0
  chardev: /dev/tmc_etr0
  module : coresight-ctcu

=== T1: device presence ===
  PASS: CTCU device found: ctcu0
  PASS: TMC ETR device found: tmc_etr0

=== T2: irq_enabled sysfs attributes ===
  PASS: irq_enabled0 attribute exists
  PASS: irq_enabled0 readable, value=0
  PASS: irq_enabled1 attribute exists
  PASS: irq_enabled1 readable, value=0

=== T3: irq_enabled write/read round-trip ===
  PASS: irq_enabled0: write 1 -> read back 1
  PASS: irq_enabled0: write 0 -> read back 0
  PASS: irq_enabled1: write 1 -> read back 1
  PASS: irq_enabled1: write 0 -> read back 0

=== T4: byte-cntr read with active trace ===
  [step] cleanup: byte_cntr_disable
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  [step] byte_cntr_enable
  [step] set irq_enabled0 = 1
  [step] set buffer_size = 0x2000000
  [step] enable_sink = 1 (tmc_etr0)
  [step] enable_source = 1 (etm0)
  [step] byte_cntr_enable done
  [step] cat /dev/tmc_etr0 > /tmp/tmc_etr0.bin &
  [step] sleep 5 (accumulate trace data)
  [step] byte_cntr_disable
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  PASS: T4: cat exited naturally after source disabled (EOF delivered)
  PASS: byte-cntr read returned 35333968 bytes -> /tmp/tmc_etr0.bin
  PASS: no kernel warnings/oops after: byte-cntr read

=== T5: EBUSY on concurrent open while byte-cntr reading ===
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  [step] set irq_enabled0 = 1
  [step] set buffer_size = 0x2000000
  [step] enable_sink = 1 (tmc_etr0)
  [step] enable_source = 1 (etm0)
  [step] byte_cntr_enable done
  PASS: T5: second open correctly refused (EBUSY)
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  PASS: no kernel warnings/oops after: concurrent open test

=== T6: rmmod while byte-cntr read is active ===
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  [step] set irq_enabled0 = 1
  [step] set buffer_size = 0x2000000
  [step] enable_sink = 1 (tmc_etr0)
  [step] enable_source = 1 (etm0)
  [step] byte_cntr_enable done
  PASS: T6: rmmod returned non-zero (device busy), no panic
  PASS: no kernel warnings/oops after: rmmod while reading
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done

=== T7: insmod after rmmod and re-probe sanity ===
  [step] module still loaded after T6, retrying rmmod
  PASS: T7: modprobe coresight-ctcu succeeded
  PASS: T7: CTCU device reappeared: ctcu0
  PASS: no kernel warnings/oops after: insmod / re-probe

===================================
===================================

Results: PASS=20  FAIL=0  SKIP=0
---
Changes in v18:
1. add a NULL check for the in_conns instance in patch 1.
2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
   previous check for the return value is incorrect.
3. add more kernel_doc description for tmc_clean_etr_buf_list function
   in patch 2
- Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com

Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  27 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 304 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 ++++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 243 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 850 insertions(+), 72 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


