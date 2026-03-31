Return-Path: <linux-arm-msm+bounces-100959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMeTD7Z/y2kKIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:03:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 899F9365B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE36E30C815D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B7B395260;
	Tue, 31 Mar 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlP7pqye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DO7mKONo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED13B47D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943704; cv=none; b=K+yToDlhfYLMdP9YLPiNUhCnpZCxzCdJd655Rg0RMF0eNSkMdySoN4StZgfoO+luoD5w1xipi+WhffHklFAnF1chWinUxZ0qN82UlZ1ARISvg1ENsJ+HibUGJyiWnkfoLvKeJ7WiWqt5wBAAbGaqXi9bYeR5BUwvgdd3+ftEylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943704; c=relaxed/simple;
	bh=mX6Hzo62QiFFFPty2xoTZGQ5APUUAosC17dPxM+NjQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t0Z6nQS4+b44lYwb34NSic0InhaamJBrAWz10MUlTmX2MGE5qC+T7jU2+SPw7RGgEnizF0Q3qOxdPLpIW752riVRKlY8QvSKzuLOjOLRmJUjJGnIW2+btCKWOG4vvKgKSMqLbht2iAZrSyg1A1DwK8Ba+qsJJOff6nUrjsQF82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlP7pqye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DO7mKONo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6TZGO1090309
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IHK86B6bLbgi3XxVshcJV5jPOos83lecrnJ
	ISvWY/Tc=; b=jlP7pqyeGDhcbT/teoA7K77ZYRUTOrmRATqoC2yFJPPpdTLxMw3
	R6b0u5VJKyl3ovvhbUCnnIkceztRME7mX9hp+dzwoRiGWXuC9PL4zpIUCJIhnqza
	SVizA5ozap91We1NKMc9bTZLNDaXAAVLRyPj0E3n7cz5osjNA8SeeLTBffWmICHP
	0H8uzCbg9ywDYbCQetwSSSBxJrPJzGNhoS3mnPUfN1XB8w6NXkSBssijy3dqZENw
	FqUpF2lah2pBJqioNkFmPeRE4SdPSVtFBVI5Cr4Se+ppC7N38h037WC7VPk6fs+j
	3ViTfCcVWTvDVPW2379s4HlEIVzJF4odkPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd3k65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:55:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so36592971cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774943702; x=1775548502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHK86B6bLbgi3XxVshcJV5jPOos83lecrnJISvWY/Tc=;
        b=DO7mKONoxV+ffRJN9RKYN9Qlix6l4G0oUHWuuLrDULPwGumom4hpON7aA9uEZ8vYHR
         UhaDFJwpEYaf7NN2wZr/yZ1MNFb3RuDhN7KZnkf/HOHXr2TQHWLQ10aucveuxFJtUllp
         EE75wVQiTXBRbtShDFWFZEeWWfva4hc2JcLX4XmuFsUPGN9SI9N9exI8WTr/DQ0iEF0y
         2vZuJHm9h28nV4gMov7In4pp+CsuxkGWauyT41hRFy9icKdjeNc2rPuOMGMKzE0L+Uz8
         CD290E5ly979CpdBB2uUwhBjDqGa9p/RGyS6SlrwXmN6Bestfl0vLD8RUFijU/l6KCkW
         21/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943702; x=1775548502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHK86B6bLbgi3XxVshcJV5jPOos83lecrnJISvWY/Tc=;
        b=X5KuQtiMasEI7QL8rBFHIGyC1MJrlfXDOmq7buh87qyYDkhOJfJPA7qB+5wEx+KK5z
         eQGO8uN/pd60HDfXnwXUHX/ol3oQWAgUBNQWb3WSmR/gqEUtcu6x+IMKXZrKGbjrLwbo
         Rv7NzDNM3m0OudGlT/Z7V27hWuEOfkGZaPRMYaWhc1ulpts83BODxDPd6lWCYzwZxNve
         L4mybJccfvIuZYfcUoroWH1tyuOEmAIxsXgmU0SdqpNzcKrYcfj6c05t3SAP2vefRuN9
         OvjTTvNRkzbpa+mKsRPxzAY8TW+P+ybEX+YLKTnkgc36k8EMoI8esjG7RByE1bVSK9TO
         g/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUMd636TtRPOK52K6qlDTbPOi68M4obeJMrS7sSIKXO3cCPONfRYDeeQ+eKDCcouOK1vkDTREApmC/mkQjB@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmi3TLCEmqu0rKbsvvJ3R1rYaROqOxg6kD2IlfRvGsIRAs7ZY
	Kr+XQdgTOGmt8cfTa2C7pYlA9d4Ru3TBykZ3zNChvwmIJTdwzD50E6WCLcD7qBg9Hpf/gUi1ws2
	gUOGl7mOypC90nclXvHccoGn1r2EBsA/Erk1gS6ACjtQqfTLxMrZDYrYWey7Wbf7g0IOe
X-Gm-Gg: ATEYQzzy8dFTP3B8io44s+3ETCFKEbBCgnpowOoTic9lfQYaYoCfCq4lteXnNIluWON
	QURbkLZamODWSlXEzZurT9PVO8kYREzxQYF1j4yT5w9ChLSlCudcWpT7asB/s0T9IXbb7LOXpaI
	0/pKpwV/r9bV82avOzBcQ7lWbqzc2Y0pJq0B8W4Kxg1scdh4TBpOns0UiXQ1i1jw472+/G+T/Yo
	VARLSBwMJPwy4jY1nFuRoV06zMdpgYjjHZkFpYqd0HNhSYHEcjezYQPvTNXsDYf50ytcXywTXr0
	Il6MMqa3nJ58P/xS3YwdPbggiBI3vaNg8V1Ff8Lq5xvvHp3uUJ5xsKwkrJxhZgJ5qFrkjlJ9HSn
	HxD6fjrEZFnrBb6E13H6W/SidDWs396P9cgPWElLEkawGgFy7sA==
X-Received: by 2002:a05:622a:285:b0:50b:4b21:781f with SMTP id d75a77b69052e-50ba388ef57mr211705491cf.26.1774943702027;
        Tue, 31 Mar 2026 00:55:02 -0700 (PDT)
X-Received: by 2002:a05:622a:285:b0:50b:4b21:781f with SMTP id d75a77b69052e-50ba388ef57mr211705311cf.26.1774943701522;
        Tue, 31 Mar 2026 00:55:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a4fc2sm9989255e9.21.2026.03.31.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:55:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Immutable branch between pwrseq and serdev trees for v7.1-rc1
Date: Tue, 31 Mar 2026 09:54:50 +0200
Message-ID: <20260331075450.4791-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8B5Q7ZI3YCR4mzg0xlfqmvc_Ynl0S-xi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NCBTYWx0ZWRfX8UEjANVQEOj4
 BDNrB+PnR6iSGwj7xPQs1aLwRhMN4GfRWZuku/c4CKhHElHeoQEeuLvBK6bjMkVyYDRntUQY7zz
 pIbiZI/20EENHpF+Rt3cHxrIRsSaB5TqLSj12YKbvQtLfzwOBQHBVGVqjvAZ7os8hOOymQ+aPRl
 WM0fow8VUFwjTRNWWtfSGF01lvD5yFxMvhfteyMJxe03dG3yd90ZbhN2ydW51oObdWgbnoH01c7
 JEur/KW9g0dIvfB0z4QTDtz487AXB/6B6aIdt0k/LNn/SPzr56FDRkoElReZVWrxfwPjLdbOXXh
 IAe4IwPgMRvbcqQ9T+Ykf2xTJVNOtc7oUXF09NVKSKcMYaTqpABkObIAtVlUnH6YBgfLK/P1+/d
 FYUddqYK5GqnSeukGJcQh3JHV+04lfNkHlcxB9TTwcg6QpUG7ZtsrTP4ZujS/njUHnZNHcuiOW9
 jUOXFA7Z27GXqhje/hg==
X-Proofpoint-ORIG-GUID: 8B5Q7ZI3YCR4mzg0xlfqmvc_Ynl0S-xi
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb7dd6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=LWPZaY4NSDFKJMcdi9MA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310074
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 899F9365B6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rob!

Please pull the following serdev changes I queued as prerequisite to the
power sequencing updates for the M.2 driver.

Thanks
Bartosz

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/ib-pwrseq-serdev-for-v7.1

for you to fetch changes up to 1785c7bc1495e4e22377edffaf0ff8c3c697647d:

  dt-bindings: serial: Document the graph port (2026-03-31 09:48:43 +0200)

----------------------------------------------------------------
Immutable branch between the pwrseq and serdev trees for v7.1-rc1

Provide new serdev helper for looking up controllers by their OF node
to be used in the power sequencing driver for the PCIe M.2 connector.

----------------------------------------------------------------
Manivannan Sadhasivam (4):
      serdev: Convert to_serdev_*() helpers to macros and use container_of_const()
      serdev: Add an API to find the serdev controller associated with the devicetree node
      serdev: Do not return -ENODEV from of_serdev_register_devices() if external connector is used
      dt-bindings: serial: Document the graph port

 .../devicetree/bindings/serial/serial.yaml         |  3 +++
 drivers/tty/serdev/core.c                          | 28 +++++++++++++++++++++-
 include/linux/serdev.h                             | 24 +++++++++----------
 3 files changed, 42 insertions(+), 13 deletions(-)

