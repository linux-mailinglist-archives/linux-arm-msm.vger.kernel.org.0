Return-Path: <linux-arm-msm+bounces-97375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFgMKdnSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36828025B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 998AD305CA84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BE934DCD2;
	Fri, 13 Mar 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaAcdcMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyuBSCt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D914387596
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392569; cv=none; b=FKLQHX/JqwFRGybEnRaNcs3VdAL153ipqK20DBQWGPt2VLdcj03qyEJvH+k0ogyA0lyapEvNsH6nRW7BFHFh12I1dj4F3nMlb3GiDjg1x22m3B2PRNA2Eq7gjfBdh7+my2b1p1FaJUbThUcjSJVPRSks9zjKl2sRE1gokXKCujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392569; c=relaxed/simple;
	bh=TRUgRjxu6caWSf8NNA4yHzQjaxaZUibOOPiOjT+UUGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hbwv+1SR8pUuqS2XiAv3JMwvQj8A1ksBczUPiyTiJIfUjHWIzBIgLYjnmvqZw0vm4oistNNObTtbMKporHsrx2OVEAfmR6pSzFohmk0mJVNpK+CAW9N/ztiy7Fd/1hIt8gkLLaokh4ovSuO5ek47xJi3A70OloEPOmxNfyMvqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaAcdcMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyuBSCt6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tkPc3342956
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=60I+72FHYxp8lguvGXZWjr
	bHUi0FNsPDzWDhjfxxrVs=; b=WaAcdcMqaJB56pqO3cTcrVD3ImcR4nyfIMDM9a
	aJ5eQIL9h+gh3UdgmsVVVGr6RBkQKI69oQxvcKlIivbEh4LUOAhntbBNFc7hOaIz
	iapYIcEzeufsnbJit4d5lS2r80U9w0cxbjHn3VxhHHqCBkbJzhltHx4vB4tAQcQA
	35Rt3+n/He+IrZZ944EB9AK9zmfMEN1oEEi/eIBZpswgVCmwVhADlj2LFmkM0I2R
	T6j5lLQsr6mHXo3/PaE6wNWSlpEis+QrtGmFxZ6dmxSZkbZentkAI0ykgY4r4DrF
	2xXudlX79kwxxYJoBpAOkjta5JO+zM7atoWwfWXVSeAhN7YA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w42km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecd4f7c37so6004735ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392559; x=1773997359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60I+72FHYxp8lguvGXZWjrbHUi0FNsPDzWDhjfxxrVs=;
        b=cyuBSCt6iYy6NvYe9/1OnhPUyD7kZE71O/Jk3Tuix+CtQMJp5xiWZcbgPZCbKBKYqy
         DGLOUwwQY4Xdd7Sb/M+/AqjodKBdySBRD0waMlcsOToEhUFMpgHlzU575BMeJzPfIyaj
         zZKxAE187xmm5oJ+Y6nGxmBzNLDBiSxlWjICacBtRFaOp2J3fhSYlT3C0FfnUhyWsdTM
         JX5Fb8XoURGT+vuOTxx3XYGVtx4AYWWuDz4Sy2ud/9Q2ncjNaq8e72HLVuZB2PbdX7jg
         rwUrNjdyKT2HaAQHMFT6rv7V3q9LtQGaKAv9FU1W7aGqDUUciD+2J9CwBgy0M5eDdBIF
         9cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392559; x=1773997359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60I+72FHYxp8lguvGXZWjrbHUi0FNsPDzWDhjfxxrVs=;
        b=TUPdN18GEVzjnCczwxgFCxbPXWCBBWBYY+RU+Zh7pZPdOEAzMw5NxEdsGg+G2xGXtw
         I/GdC78HvLguKwgO3E/+vqnVBaQbCkoG9D1MyWRJ+nDE5jzluGpNYbhAi1/VFcfLtheJ
         r82VQKdegtwlq7CBkywFZ9bacI1UqrVUtvJ4Pja1eez4XyKkxDt3+BrSeMW6KkMBTnXs
         z5KX2bI9X22+7dV6S+fVQAK/OcdrZANYRQE6AvjXCb3XdlJ5AhnSttMGk4yood8BUxfu
         AaiFr7p6GAlJ6SH5u+Zo16eo3IepPAYHo0MaHMP5Zata1DTgAfyF7jq2aDR5oSr9GqaJ
         m+lg==
X-Forwarded-Encrypted: i=1; AJvYcCXnXBFe4nKgbTcidhsc7IsOYo+2jXz6INYAcg84JrrFmQ9SScdyssjpW1wWrrDDgf8OQLTZP4d3R8/hyJS7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lzkm6J+14lPVsPmT5Pi5RFLE2oKQespXJ2gmw2nwsLwqvlJj
	xbqmHKkoSkxzcaxfp0CQxMAmpTi4pwb+0+KqnE0KnChLVSkKMLpATx30qIN7WijXlNGuecPThZi
	k1bLcLrAV7Nj0q/Iv3pZO7lHFz0MOOmjnpOXe80RRrNu1CESKkcCfFQMP0NPUWTZPxOWL
X-Gm-Gg: ATEYQzxhIAUL9x52HWDJX66rmKCK/5sO/lWP860KhDl6oNusxugyAitcHPsIdKkydTL
	rfxRiFLYFqA5A9OG7QOi1hTez/eYSA84dCNTV7i2eCFD0F47vqy7opYXIA+UDzJiAxeLOScyBEB
	z3mQBxEL5N46fbuVasYR17m+qzI1eoxXWc0A9vffDg1ENCoUidhKHXIWNDXCQm4i+xlZxKOCk3t
	Xo42I+h0Y1yzbKobrTfu0sWu1Wn/wEiUQQ9C44Hf2FT5Yet3oy7eWri6pW7C6hY5UTm2j0Jy4uE
	5G4MxxfPrvSgpYRZJmuovDz05T+lxc/nUV1G58Ms8s572DZxT3CqeFKmwubUmu5jDLbAQJTqvJS
	I1gBODmlSmR7GhxQknuFzGhNCpKbLb5Th00UtfUvhWD6ZrjZ7jRrx1Pse7vrxE+W7YAMO1ci0Xu
	vtvh14k375
X-Received: by 2002:a05:6a21:48f:b0:398:8dbb:d22 with SMTP id adf61e73a8af0-398ecacee85mr2113296637.28.1773392558856;
        Fri, 13 Mar 2026 02:02:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:48f:b0:398:8dbb:d22 with SMTP id adf61e73a8af0-398ecacee85mr2113250637.28.1773392558239;
        Fri, 13 Mar 2026 02:02:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Fri, 13 Mar 2026 17:02:03 +0800
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIzSs2kC/42NQQ6DIBREr2L+ut+gVopd9R6NC6SfSqLQApoaw
 91LPUE3k8xk5s0OgbyhANdiB0+rCcbZbKr2VIAapX0SmkcOoGY1Zw3rkKwcJsJhi4TKRo/aeVR
 RLai14MSrTgwXDXn/8qTN54Df++xHE6Lz2/G1Vudf/A82V5GhYkLUDbVSEL+5EMr3Iifl5rnMA
 n1K6Qu82UzlzAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392551; l=9084;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TRUgRjxu6caWSf8NNA4yHzQjaxaZUibOOPiOjT+UUGg=;
 b=IDTZ8xykCdia+iPOjz0pb37G831qi5Vxa4pOnwBW9IIyVdUXqnokP8MYQW7GuTyPRVD7SfUWN
 c/P/n9jyhz6D2UdMksY3nq2F8N8ObFV9e/v9i4ceptymozcTsR8LCWV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: V7z-czuUWzkvqCaFA4OcTda6gwUmVbhj
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3d2b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=6IPhZ7wLu3BbSa2q1HkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX3HSFwwt6t7cJ
 eWagWMm8xvfyG9+wDZ8ZF75b1jj1PHNop+RPdawqSgGgIBwS8sGtaj7vsAahgiz4Wpl7olYXg4x
 C0/ROZsmlv4djruCPmLjf9hKYIv97dCfDEvtjJTDFtbz5BjAcKlUuZDUFtYQqUXUiRRm03pDrnq
 HnVfVxq7NLooATayxmmDBdv9H1OLEiGaqGjR0O+16zAMno+xiRQsOspVd9IjdXDmjwy5amLCw6L
 GVsdMkMb6FB70MulhcU0wYJBJmxshulO0g1Hrs45rS2JznBXjyrGmx3bBc0BDH58aHmzh4bNgyy
 HZSDQPBsNpCbDMSUgCtipw+9n3szIDqhx0at8rWS4cQWOo7DkboKQIZDwyaq/fLYl0TtIcNVL8R
 xx5w/GoaE2m3EFckrichKJO3mKick8p540Ug/j6VYVoPRYoq/nO40TMA+k0pSGoN/wc4Xyvm1UA
 AWvdxmFZfytrwAXIGNw==
X-Proofpoint-ORIG-GUID: V7z-czuUWzkvqCaFA4OcTda6gwUmVbhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97375-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: CA36828025B
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
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0

---
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
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 286 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 123 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 237 ++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 800 insertions(+), 72 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


