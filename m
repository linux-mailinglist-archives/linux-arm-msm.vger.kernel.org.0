Return-Path: <linux-arm-msm+bounces-106631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ+jBDK2/WmAhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:08:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5046D4F4C74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DD00301A50A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D333388E69;
	Fri,  8 May 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CN3Upoy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgOmnlFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEE3361667
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234834; cv=none; b=ADAeHN+I33Mfhg8czqDgaPRaXMKsdZaXg/yuyxrQOd0dlalALPci0U4RVD5EFhZlH7uewZOhmcHe5bOQqq7yWHqekJj4OWDhuWUzuhw87a1cPx/qLXWmbdUHMLluK1PjeQ/swI6t9z/rqqWWv0kPi8BeRHJgzc4dUlG8x/r1mwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234834; c=relaxed/simple;
	bh=y/GfofqIHQANQ5CHSFxmSZ4K6zI+EcLOlo/P5fAMq2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ikLY23iA7VgMeILOqZL/pr6wg1BpcCo4hEhURgH6nrssrN1tMZhMYKAiXhWXMHERmlQAVwgY6lltmckYVbvg4PpJplbhUgXAcD4x/gd+LZck4Lo1dd0KfeeVO1dabUI3o+o4R7EuaJmTd+30LqnliU9YOt+K+ZTEBmxv4r72zA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CN3Upoy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgOmnlFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489q4it1418397
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xsznKWdZhGfdpuJiM4vIT0
	VCeBhgZXrDmZgPnKnhX6g=; b=CN3Upoy3B5dpTIDfkvKDpPNR2pCrXSzBUxh3pf
	931ZnX6lOylU6mm9dpr76YA7sVX7MaSuJ97McOybCXcfH+I5sxPAWhSm8H3GFxmw
	vs7xRUFvc136KsttmL6buUoQOgrWBFYWVfF84p3ekvwlmn2gHbwQtpDtWowEB3+T
	U0SeGOfLI5P3fUUmaWgga4hbu6I9pvCCZuLEDNzLcLXsin2dEF6lKsFeeRhqRYmH
	53bYbATBel7wH7vkFJNco4SVAPHJndqEvSxipzAEXt68Q22l9uzTjt0rXc8egjah
	F6RyNC8BRp7BCWAG71DOpn8a9NRx9diAgB0qV1NpAgEiNohw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhk2ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:07:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso2398557b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234828; x=1778839628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsznKWdZhGfdpuJiM4vIT0VCeBhgZXrDmZgPnKnhX6g=;
        b=dgOmnlFeBzdwHYxxvq3HScGG5AmvdWR7BEhoB8n93JNQjITBp0GloaNHGQtWfMT1fP
         ETKviYFh2wKbw2JemGcV8SSHE1HHwV7bwK5cz2Imt+uLXtw+7P4cmyMuXh7L58bTFdGj
         aOjpFctrRDUCMZlPxWLrFDQCdDmEAvXspIamGAFIfp66KwZDt2S6k7x8PZVeGKJy45X7
         89ZaBAFSmnuzoA0DoCv8oGV0976//S3mPC15MH8Njo/0HlAszDEMan6TTXu1XSkUrCqm
         vTqgI/cXfI8cyQxy5O3alU6oIoNAE2+zP+rEObW0nhT9Bov7GVKuhAR/BtwohUS5APr2
         hSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234828; x=1778839628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsznKWdZhGfdpuJiM4vIT0VCeBhgZXrDmZgPnKnhX6g=;
        b=jbJ0YDA9nieOW/wMixX1pxexf6Bl3BErHSxHIuXC+ToDGEPimQzP6rhLegEYDXyag1
         IXINWTnFFwp42jzDfbwbiAnXxAWpZB3J+UUeLRzLhsx8CJ7DHuclgbY/MA3p+0t2OOfc
         eX54HkaeyL509J69SFQLK8TwQbUymUO/Ig5wqckCpi99UyNfooDDzDYqJIUc15RAVE28
         NidnkLIKe1Q8eC8CF8SVSmgLAboEK4g5OcB30zjo+Z/4pk4oGneA9HkAfnMglhna4jau
         b3OA+cpdnUrFaXWCTt5uMFJsIb1sCYdNCKA0rfU5nn5bFSuhPKl9YPM6mjYIk1XS4BLa
         kmNQ==
X-Forwarded-Encrypted: i=1; AFNElJ83rJwpqz43u0L7b0PfYEpVhBW4BrSVT/j5sntsjxa9JtqD5j+hMh8a3O7lbjTabjcwbvue+LtSjcTAHkZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4fusFQ6M+MaJ8CNiPEwUMQSqJp/tUXGRT/g1K9Z2ymlOp/5F3
	JKMjL7HF4O+VHspQkZTMQ6iJIxnF6IryRdCH8d6la7uW5H7D60SYOxPsEbZIYQJyqbZv149bIjx
	8ZN2tqImCO/BRgQQS4Ev0DPsA3/xZUzsSzFXZLW0rmQSQxFN1XsOIJVvZz8I0pSeaUkgo
X-Gm-Gg: AeBDievPtXs5TXlfyst2b6tIrj5YOgVXE+9Rz7N4kf7zwOs8Qh7O7BZ52/qo/oBPPTw
	Ib3leavYTWnkQ0KDlUyj8Sio95t2rTCELvbmF9yGeDrwl0ASmuVIx5Tk5dZW8hOLk8wWDsXXSY4
	Cv0ZvfnD5RNHVBu46IYoZBn0hF83EZH2UJBQRBooQUrr5WxXfIlVbV05qljoMLXpA47JCNhH9Km
	W5atZPVcHIRkwXZB5jyri6SEMteq+RuKCCxIzmSQQ10MQyX/fx+2b9HTo10xkPCT3/72Hv1vn5G
	Avv8KeNORhidgDJbkFtxIXmJ52D50vmncN9KRtTj/mzjobD3X4zo6HAO5PlDUFBHMKOWtmkL5k2
	ZWaEl/L76N8GWEpxTXoz3Bzet/B5kT3sXCmYBkd1siV91/70stHY+mLw=
X-Received: by 2002:a05:6a00:440c:b0:835:45bf:9659 with SMTP id d2e1a72fcca58-83a5e45319fmr11575602b3a.41.1778234827982;
        Fri, 08 May 2026 03:07:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:440c:b0:835:45bf:9659 with SMTP id d2e1a72fcca58-83a5e45319fmr11575564b3a.41.1778234827418;
        Fri, 08 May 2026 03:07:07 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm15876379b3a.49.2026.05.08.03.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:07:06 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] thermal: qcom: tsens: fix temperature handling
Date: Fri,  8 May 2026 15:36:58 +0530
Message-ID: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fdb5cc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=14Z0-YueNKWrp6JypdoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: pShSQdBEncMhqHDNovlGHUrn4npeEW37
X-Proofpoint-ORIG-GUID: pShSQdBEncMhqHDNovlGHUrn4npeEW37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNCBTYWx0ZWRfX/7K91cNHMqDq
 m8v4Un/kezhBpP76h+oEnQItRYTYZzt4tAVu15d8ZDESD/FZzwu7ctAtsy4WrfrBdW5SI1p37hG
 PMnitQekLJ2W214+3lagLAMxiXxdOzowls09fYQnRlKqhnMQxzR5n3JEPhLNjp42CrcofZr9k5H
 DPWhQKhN51MgN2vyj0V31C1f0ytAjckJM0w/NaPi5gT1U9f0ten0y59LbB9OJFeRDOB43JDCpk0
 vCurBoUaGRlyf3O+lGOgEAAuEOMgJxcwJKv206f1modpVgEQS1bPwHPi2bAjUazyl+cW2vWRhon
 Er0u+At8y7y1pA8VvCyq/b7tfSplyX4+kzSoDPgfYxvkc/Eeu05Wf0Gpzw7wF/sVN3awj3ocFSE
 gDKgIGncjFj8hNQO9yx3PWjoSvKbaZNRF92FHv1OJlCQarsSfn8uSSxPMr0oUr4/lP70dbTZq7L
 ygAtbEVfwcQHeDos/eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080104
X-Rspamd-Queue-Id: 5046D4F4C74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106631-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series fixes multiple issues in the Qualcomm TSENS thermal driver
related to temperature sampling and trip threshold handling.

Patch 1 updates the temperature read path to atomically sample the
temperature value along with its valid bit, in accordance with hardware
programming guidelines. It also implements the recommended retry and
fallback behavior to avoid incorrect readings during transient hardware
update windows.

Patch 2 widens the software trip temperature limits to match the full
hardware-supported range. This prevents repeated threshold
reprogramming and interrupt storms when devices operate beyond the
previously clamped limits on newer chipsets, while preserving behavior
for platforms operating within the original range.


v2:

- Reverted merging of the valid-bit and LAST_TEMP register field logic
  to preserve the regmap differences between TSENS versions
- Defined valid-bit support and last temperature resolution for all
  TSENS v1 and v2 feature structures
- Defined last temperature resolution for Tsens v0 feature structure
- Dropped tsens version checks in favor of valid-bit capability
- Computed masks from resolution to keep a single source of truth
- Minor code cleanups based on review feedback



Priyansh Jain (2):
  thermal: qcom: tsens: atomic temperature read with hardware-guided
    retries
  thermal: qcom: tsens: widen temperature limits to match hardware range

 drivers/thermal/qcom/tsens-v0_1.c |   1 +
 drivers/thermal/qcom/tsens-v1.c   |   4 ++
 drivers/thermal/qcom/tsens-v2.c   |  10 ++-
 drivers/thermal/qcom/tsens.c      | 114 ++++++++++++++++++++----------
 drivers/thermal/qcom/tsens.h      |   7 ++
 5 files changed, 98 insertions(+), 38 deletions(-)

-- 
2.43.0


