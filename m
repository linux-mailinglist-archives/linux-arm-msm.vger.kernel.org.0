Return-Path: <linux-arm-msm+bounces-102435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL2WJhdk12nvNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:32:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE853C7CAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234163014BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4243A4503;
	Thu,  9 Apr 2026 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLLTJUh5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSRg/15v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536BF3876B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723525; cv=none; b=QecSVlE1kkOYRkgSYtr3rm3CV99lRsXZmf21b0hmu2gNgKPIaETiaxlhqKvzKl8oIM/ag91pYQIUbxCOgCV5wInmgaqaA2DYF56IlIdZy9nL7xjowSZB0vSKU8tcaX+AP9SBvqMB3AEelKlxQI/NfQKToIFyjmh7YjI2/m6jvM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723525; c=relaxed/simple;
	bh=EOBG6ZUalbLe0dCTG75TFDhE9ruR+7URO60Vi0OgI84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XM2wxnOQ8df/wJH7VLI+NNxfvzdk9onhvQkJh7l/buUXdQdEwLLW3RZYZJb73g5I4fJQzPST8fjVDRfwjuvXJ1gdHpL6B9V9kDYVnzlB+RDVqAQ7Y0itiEuJtxKRi/86ij1Ni1DecGS2HU6Vms8UtSg6fSeQiJH3NPCIpWFM64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLLTJUh5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSRg/15v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397GAYm2844945
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pYlY2MYU3AKF+o5KQR5gyQ
	VEi9BHV56WPDQ9FRiAQm4=; b=RLLTJUh5J9M4dIWlEesGh+2qToqOecwz32oXwE
	PgjDSCh2S7mIRbn0tXQW4mXXaZd4MLHjGgvTyCxWlSQaLCn+QvS0fPke+o8uVpIY
	C5+I94GAtkt8vCqvu6+px3zCDtISXuRUCqcfPvRx0Wn/XoPv34l4o2iQ5s0u/Tqr
	dPRJNl34uvsIny3TdbpzpKOyOqgC2r9I5Z7aPtvDQwWx9m3kudvMiCmC9VEIsQX8
	2g8DeR0tHM9ga0nAp0IiRoiuia2cZUw0qovlVe8mQ4nHZflZWksEpW7K2ztwfGpp
	6l/2/aba+byjACPkmkAqJ13D5THb7QWqJjfhGeYiKSgPBpJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hk5u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:32:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a6906e35fso573693b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723522; x=1776328322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYlY2MYU3AKF+o5KQR5gyQVEi9BHV56WPDQ9FRiAQm4=;
        b=VSRg/15vnQkprOlPgxl3vuFfjpgH2MmPwjtj13t1yUJFXoA0LUc5A2WYa9elCG7uf/
         Hd3vFVTAINlI4yU8TkWldr9BeUdwUNAKws2egGjOQipK7vrgrWe2rI79wEqbcP1jG72d
         QKpAaemQqwg3SKg4yIWmArf7IJZTV5Y5Ml5cQqd2XnNCTRgw5e/umiNNksXgMHDTJdQq
         uMNgw8oxG5SYd0dbx7WhaBnR/LaCZIlUU6DgN0eQPp/tWwFc7QAR6MimXjVIPGIkHmJd
         7uklaHWA7n9T/+KMp25TW7KxY+nvjdn+ikPLZR52yPXEao2TxuN+GvTJ1ucWJrPxtsxK
         h8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723522; x=1776328322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYlY2MYU3AKF+o5KQR5gyQVEi9BHV56WPDQ9FRiAQm4=;
        b=K+W3qCilGa1hNXq8vQ3IpvOYb/UtIjNPvb/i1KlojwRNiehSy4CIVeee6xdt71eHyw
         KEyWpuz9EAew2e9GE2h4qXopw0L6SbZ6+U5TRWePskjw/oIANDtgb9fAWxhSva5kkDpt
         ShHla69hF/X9imxhlNe0QVTIoAss0JqMrmMMIsh/b56OcQhCXQWh59zsrUvL9+WcyoU3
         R0GgTXwzm5u+oSHTeYucR7Gs/jCnY9xy/BC+sYIx2HqUoyhP0YRYA2cFbImWevr3mJE+
         aShvSaEHntyP/7IDvo+JIz1hhsp+BR7nE1qRzZgpO2lILBaKsdSzwZLbV7GfAv+1Axpx
         qiLg==
X-Gm-Message-State: AOJu0YxSUKg+A5UI3FHFkLiqtbYxZBQyLN65aAMporwCzxlFGXDPvSbB
	rAI6eKJBEdrsQX+Lga67nH4oo3O5ho4V2aMagPZjycS+WJfhHBLGODqrqQBuj0+W8Nh99HBTJ36
	U65ij1Vn3WmqlHRLPKenvdka8voUoAeC/MR2zNb4aRD6UyckxQYXyJo4NxAYY+t5MhGoB
X-Gm-Gg: AeBDietVX4MJZD9yoZhPJ9jfGtEpR62Z/pZxQAndYUGyM2HgJyeNvcvUqIE9ybmXROI
	CxZAgcUmVYoOUJao1H4V5uX7hrflDsZnAIiqgK2A4Vu8r9soKchYRdBV1QxuB4njnyfkgrbtkCq
	w/WaM7yleAdvuwYsT/nvhHigtlk/LKOrIvcUZIQ1hNoF1gAWTggW/6ZZpvylYquLfVeBRvr2k1P
	cbX05XaLcjyJOhwEWeLcc9wa5m4/DE+MShM0kzhzjsv/vaNM9DjbHhLfA64tqtQVOcTWo9hJ2OB
	pY08+mjDLvL9/7tBqgRSPO5KWyq6hHnFHnLSY/IJlFnr63oBGC1JzVqckoxIFLN3lV0Ppyu7oOn
	3lWo3lKROCQPptAF5/+xDrybg7uhi58DL0ZbtTR8dzbluSF/lhszDqLI=
X-Received: by 2002:a05:6a00:aa85:b0:81f:544b:3998 with SMTP id d2e1a72fcca58-82dd8b4ff5fmr2317006b3a.26.1775723522262;
        Thu, 09 Apr 2026 01:32:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa85:b0:81f:544b:3998 with SMTP id d2e1a72fcca58-82dd8b4ff5fmr2316974b3a.26.1775723521622;
        Thu, 09 Apr 2026 01:32:01 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm29741277b3a.26.2026.04.09.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:32:01 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable iface clock and power domain for kodiak and
 monaco ice sdhc
Date: Thu, 09 Apr 2026 14:01:49 +0530
Message-Id: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVj12kC/31QyW7DIBD9lYhzsVi8xDnlP6oIsQwNSWxiwG6ry
 P9eiCv1EvUy0hu9beaBIgQHER12DxRgcdH5MQP2tkP6LMcPwM5kjBhhLalJi50GAcOghb55fRX
 SGJeyBgPtLW81tVo2KKvvAaz7ejq/nzYcZ3UBnYrdLyPANOfItNG2EM44nrQfREm6+08IQo4mx
 13F4hPgpcYEA89taqWMhf7oY6ymWd6yaKjyKOabFSWU8qbpKl7vG8IwxSNAkJcq+tG91CkZAZe
 FS4fdnraW9twYYnpUjji7mHz4fn5roX+d/3vMQkvfTjHeKdvJ9kXf07quPzH0oiuKAQAA
X-Change-ID: 20260406-ice_emmc_clock_addition-e19f36c1fca5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d76403 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Ob87irwTtRhQHdzo7WMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: M22c5bkmYKeyKWLDym-6oqT1P-p4RWLv
X-Proofpoint-GUID: M22c5bkmYKeyKWLDym-6oqT1P-p4RWLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfXyoi47L4kU0c2
 atFJG+YyB5a5XE3qD9FA1ZAAuoD2g4+MTvBmJZqM8O6Mp1/gpE8w0Gg0t5Sm8hEiDSU4WBqiGCr
 ZgpHEIf24WxhV9reZ8kU4HXyHDQO6KB2w6nQYg7Z1pxMQpHuR6uNu/IX1ULoW6bIbw7HIIiwtyK
 b9IZOyQNC88w/Z/xfO/mLYzlLLmNld2/5xYLkee4SJrrasUgY8EwSoqYScIIWw+Wtfj5FTKtRNL
 xE00mkLKkaXNWPMQN0L0n31o83OS86gIcYhGNw/2o+XmHxdUWmXgO38c/0jZYWt4b7+m0BO7Fxd
 673Z7rA3iUkJujWHDNrNnmtovTm5OXO5oiQdO7ic/vjrRoUc5UUvaBSwvLwPUpfgYswZGFZDh77
 YiP64oCEGjsF7S/mzv2xXVEVrTAuS/o5Cqa7JYymZG6fTN4TU4Jj5mjTrR6gbDO+l9scHWFMXKO
 rZPlWPjRycaF0Jbdgnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102435-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEE853C7CAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Previously, ice used to exists jointly with ufs/mmc driver and not a
standalone driver.

With recent efforts of making ice as separate module after decoupling
from ufs driver. Update sdhc ice kodiak/moanco DT nodes to adapt power
domain and iface clock to probe successfully.

The patchset is motivation to fix ice mmc where ice ufs is fixed with
below series.
https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m5da5dd7a18318583b23ffeb42fa07ef1438042d5

Testing:
* dtbs check
* Custom monaco/kodiak device with emmc storage.

This series depends on the following prerequisite patchsets:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/lkml/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Reorder clocks entries in different lines.
- Add power-domain as it's mandatory DT property as per new bindings.
- Drop reviewed-by tags as patchset has some extra changes.
- Link to v1: https://patch.msgid.link/20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com

---
Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Add iface clock and power domain for ice sdhc
      arm64: dts: qcom: monaco: Add iface clock and power domain for ice sdhc

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


