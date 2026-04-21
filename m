Return-Path: <linux-arm-msm+bounces-103927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PlTIzRY52nz6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0544439D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8464B303EC2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7273BD63D;
	Tue, 21 Apr 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpO3vNKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6CQ8nj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C113BC678
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768988; cv=none; b=Mc9L40GoeiK8bMiUzTIyK7JjZc1QUXcjjla9dEcWHHo0ALSC2MJn8biAHrtSHLPqJBXZIDFOtVSIpUCaLGw93VPiPxUuzsdQoDliYIHQMNfDcGM63IAawDOFApnvsVQJw5T2CvKKKpihksTvnbem4Z2Z/F4xkJKVBx1zqnuB7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768988; c=relaxed/simple;
	bh=Vx/6zMoZ67at0R9rGbckd2Bbimfp8nN6trPQFzaFmoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RIvzVowgKvPK2xFS6h1JRFIRUNUCHIYocm/NrW1LoygoVJz8XcZo8y5iCjv59IiNv2xGHDOwp6KyXD1bwyiuzp5pmTXE8DHTxQTicp5Ggk5X6a7GzZD4mAHWBkN9wsEiXX2/YBMO06x/SlDsqCi8AJZq23HpvDB5PZFRZ/ONeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpO3vNKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6CQ8nj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L7PIGO1126123
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l4XZv915+OD8fVF5ebPBbO
	RlRX1ourZsFmrSJpVSODU=; b=bpO3vNKry4FXrSO5meDczYqrxOQQ7jRu3jdIju
	f6xbW92P/sqZaJlwbjPZhhNcqMOHlT24SmS94tSTuMVvWzxc5OhMQAbcL/Jell8X
	ArC7qp1r/pHLXdkA4trcXTxbK7kzqp19zzhOdYC9H6GEUoP/ipKz9o9Zq5zsx3A2
	xZJRZuq47fWmrlrVtcXI3xiIE2MPga7IwTqGGAlYGGtjGjYR6Liq+ykEWQduOklU
	w6HOroqFZ6qonGK5yJDlzRKzvkIRH20caATpnJ6HbScL7ERnyVVMfyjJgrkoMhh1
	F4hdPh/xMFmvW7kuz6U+coG/cD/tf4A/YZW3x4sL1OanGRYg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68t9k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso1843518b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768983; x=1777373783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4XZv915+OD8fVF5ebPBbORlRX1ourZsFmrSJpVSODU=;
        b=W6CQ8nj/c4M6No4/tfPtRBGprmamb9l4npa2zi3gbxpc3WM4YJxoPVZ3l7/fj27g/S
         jzGExyPjRWt9kau+zZg6t3AnoVh8QVOuqdRE2TzqFsGLjxjUa2x2Reuu0Kkxr7GT7fQV
         3AdoYZM4BS5TP6pF0ZhVx4CKfZ7lKmtPJVFJqm1wxVhiNIMHTAd4QmiVKvkm8mlW0EFY
         CvEmnw2RETNy1XKAZ7YgnKk5wX+100Q4iDEUu+hW2Z7B2Lz2Pf7vGz+S5Nwdo1J7cUQx
         i82VlWRO6N1vuSrC+EmK+9gCSXpAfDypBwXW6pvn7uN5ExC8OGgb2v1cg/CzxZSm9SAf
         NxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768983; x=1777373783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4XZv915+OD8fVF5ebPBbORlRX1ourZsFmrSJpVSODU=;
        b=MoXe7EpWHJ0Jzxy8SaCrT2A3Roo2v74RH9GpEfOFEC7Ol0IWTa30gLJ/MGLU7cAKT/
         rKYrxXLV/H/KM8EaDB2tBGmOlNhIjFqjZdmQfUYVtfnEcryOPiVKkTrUMSpi88VjFvLR
         IafPq0h6HJjLmpJz6KnYw75kzFU8gYEWQE94/4gBZLpkQvXukDKoc1NUEzEBsYUHPRuA
         ljxFtqmiYTFrkS5VxH/G4s4mgfB9mZHc7DQEqbDx/uZpCRf0IMyRob3D/YGPh0x2HWK9
         KIxbE7PAXhC4eolaKXyIonUvfsQmzqWmVWKmL2ZkjLEvZseg4OazlEaMqMLgVyrH6rZN
         SdhA==
X-Forwarded-Encrypted: i=1; AFNElJ+grwcjLpKVCXcIHauFEhqtBpzxL10t0aAwqPr9IKEDlXatUuvu3tRMN2rlE+QO+iyq9JkUzLPHjvufcYmi@vger.kernel.org
X-Gm-Message-State: AOJu0YwDd/BlwTSWV/DCI9Su584l/PprbAgCXCqxD5AlTYJaEQ1/rI3p
	eV+4I2GeMNAD6EB6k5Y+rwQszmWACDMYzVLSrZbbDoeKJhy2+bck4/ro+Y7K9sfVuJbVt93LU/6
	AQA2SspylZI+U2T4irzGR/rrmrcnd6Rj7IAprSu8GNcp8h3s9/V+Rnl6wwifuviXO1WFs
X-Gm-Gg: AeBDievc661ZPWi86tLhHQbQU9OYSz9lzkGXjHcNvIKIg5pvFQRrY5PpuQYf9+TOlQH
	9xsp40GBtthPrXHV1V9gHfSRfYPfjS7r4MpyzYZ7oUTb+pHsh+m4ZslN8tC2HLGHCHe6Aky1eeh
	SdcpMdY2wMq/c3tPolI0TxJ6B6NQbdHfnmhU9tNtVXi1U4ROKxSE0BBvq/qrwCVc74+Ds6v3IIp
	LLCGDdbX7LvWSqyaKmlh0YoW6lGYtWxwd3StycA6s/hSNpqIsBsuQWK7QYFhQN4jynCeuriYvv8
	2o0YiJcB76ZeJimpvxJeNiusr/WQo7A41AT6IQx6pM2cvPyZiyvxDnGDlPSJXtJ5FxEp8eaXZJm
	mNi4VAZBwJd82n7bmLlUTiKFA+RcFkTyjGANra+ffhu08OhIsygaJg4xOYuApTuaeQhmT/cB5B/
	iDLYEJ4OXj7jlzE7w6siQ=
X-Received: by 2002:a05:6a00:2191:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-82f8c9ed41emr18207784b3a.49.1776768983094;
        Tue, 21 Apr 2026 03:56:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2191:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-82f8c9ed41emr18207760b3a.49.1776768982524;
        Tue, 21 Apr 2026 03:56:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:22 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v17 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Tue, 21 Apr 2026 18:55:49 +0800
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALdX52kC/43NwQ7CIAwG4FcxnK2hsAHz5HsYD4wVJdGhsC0as
 3cXPXlQ46XJ/6f9emeZUqDM1os7SzSFHGJfAurlgrmD7fcEoSsFE1woLnkD1Nv2SNDeBgLXDwl
 8TOAGN4L3RpHCxrTas3J/TuTD9YVvdyUfQh5iur1+TVg963/YsgocHDdGSKqtIbWJOa8uoz26e
 DqtymBPfsL6jUT5k6wLiVprjxV1EptvpHojxW9SFVLbCmUnEFvTfSDneX4A/nD5l3IBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=12973;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Vx/6zMoZ67at0R9rGbckd2Bbimfp8nN6trPQFzaFmoQ=;
 b=6xuUf+QMgfun9VRU2HhezJR3AkLNWTOJsKHg1GmazRnm8PphCxFshax4jgP+F998I171EFmzK
 WrlBdSdXhmoBCHQqq6w4w0UWd3TbJgPqPxsLS63SsNWxDyh9gsHLUzC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Tfpdldvctnssdg4IH1uzyJbHcBUj6YUW
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e757d8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=sQzbMOkpazfUrT1JE7AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX8ras6IJKbflZ
 JhIGREHdW8wwkDToRDx2DewJV6ycE2x0XmI7UbfNx+uZNnOctJmy7qnO+YM6VbL4sr7YVvmhjjf
 HpcDKyOoMLhwlkRpxc9/yYLMz2eI/jLMylh3XD51E1B/zvRjuCrm1ZMIQ09oe9Dd5PVNKBGsI2D
 qU4uWqoPzybJ5WfPBL4p9IQxDfbTZl/ggf6+P2/qyM/HVfcAm/oVhoCWES2wjADWeLfKMUOQ9JO
 f5IhOIbyDN00HkZG+M1NMvv7HkUMoD2PWl4bsuzth2eclJOin5FnX7KkL0+UiFmou9gVordKVDL
 trXqGaOynLDE8Qq/xIoetb1WzU7FvWAb5X5EG0b7bhyk7m2itk2eMEkMmqYTNUTRa8xi5cNCCyP
 VYlTZQVXLDOlZAlXb9JVADI3vPsT6bHIvhoXInjiMy3hfsgQFYXY6ZEpt36rBg3YQQOkQloXo+4
 N3Rx5Fd5kPAjRhqREMw==
X-Proofpoint-GUID: Tfpdldvctnssdg4IH1uzyJbHcBUj6YUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103927-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,intel.com:email,arm.com:email,infradead.org:email];
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
X-Rspamd-Queue-Id: E0544439D46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 298 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 143 ++++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 237 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 832 insertions(+), 72 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


