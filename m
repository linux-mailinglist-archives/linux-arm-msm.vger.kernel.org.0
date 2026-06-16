Return-Path: <linux-arm-msm+bounces-113478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 28NjNNW7MWpmpgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:10:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9446955C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:10:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=WKZFCGTf;
	dkim=pass header.d=redhat.com header.s=google header.b=jCcLnJLo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113478-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113478-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59DBE3199297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFF737FF6A;
	Tue, 16 Jun 2026 21:10:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA573A7587
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:10:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644232; cv=none; b=gFChipNWtXl/SuXMm4QoQTQ4vXwgEYGAUwzGxT+zq9S9z46SWyWFwJlDSAOezlRYQ247KnEty3zJhSDOT1scZE8dqeOuVjyqaBSWRl0hOCvfebup0aH/0Oubc9QJEFWTsmItU0MnzjnBSq+FdFF7U7EOhpRxGU2VJ37WZhwU+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644232; c=relaxed/simple;
	bh=LB7cu0y7X7i7aLFAGQATmrNEtDSjcczHxFVVWqoV7B0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FqR0Ub2Iquv3DwASV7VQK6rhWJTNCMbSkgCS2Eh3xhZw0BpZPWkDN8cbCqf0CxS0RrEPaEHcADcLzrBl/J8P5A5eYBT9YPfwit0w/5LTK6np/b4aKqQrZS+yTCFJU9l4db93F9wHCvM+x8NucqlvR/ImaGF+OKZL1TbOxyLlc/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WKZFCGTf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jCcLnJLo; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g7hkkPYTAo54xVvf7CutgDLi6l1qv7WwNcNRFYT9mDE=;
	b=WKZFCGTf0lONfjVG+gTLJpOu0syIgu0xWaR2ZKRPBQPkZ56g5IUBcBrucEfnUoJKmXX12v
	xEudGv/DRg9y+rfIHCCuSIpDV0qQa9VGZD5PIzhET5XKme2oT7vC1ERUEkTasKlyEKmGzR
	zqJhydprf/XfatnoUSZXb9qWMozzZ6E=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-rSveyR-BOIC45VWnwp0ntg-1; Tue, 16 Jun 2026 17:10:24 -0400
X-MC-Unique: rSveyR-BOIC45VWnwp0ntg-1
X-Mimecast-MFC-AGG-ID: rSveyR-BOIC45VWnwp0ntg_1781644223
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5195827a23eso71255581cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644223; x=1782249023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7hkkPYTAo54xVvf7CutgDLi6l1qv7WwNcNRFYT9mDE=;
        b=jCcLnJLoauAKFPpI1PSuBibcBAl4dS9pzktiRaxclkszv3RubOwdDvJmte5Safj3q5
         tnAEFgCSZ3CfgRYtWd/RLbM8BAgC3QalhES2QhdXJiGb0zjhD8UCcQy7NPNOHggKfAPN
         30dDnWvPwpVZSLqxgbSu83Qx2FbVVYVbrmaihCJISIqxDhxTwOXlZpzhj5gWKTuGwp9u
         figzK900EAAS+bsRhchHkiFAToxhFJYJ6xKpkaOzsT8MneBZj4EjdcTYVF8sA+8rrYdT
         V2BRKyxOFJ5NqjWvTIGpPtG9SUM12eY1whM3zPBgcP77Aqicsq+XMg5eUW2rLEQlnz/V
         Z68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644223; x=1782249023;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7hkkPYTAo54xVvf7CutgDLi6l1qv7WwNcNRFYT9mDE=;
        b=Ieqgo3qHo/WtlKmGSLXUnkpxa8PaAJapwuCHUmTYUs3tVquEAQkCgwkmeuDZQD3Tu4
         yWkrliDPZW60lRoR+vj4kbDDl1CeJRe3tANTBLgscZH/elQA9z/dnN3YwmHGN/xY079C
         TWTbuAnNQuDtb+lg8vMD1gn8wBnBFN4MUDH/Z3k3oEhBIfLn4Q6D0wcXcBS2eTMcEOo7
         WLTFm9qkOyYzMylh48q6Y+z3p/JNWFvNey2CYlvpOgc2oOl5PlCyuwf8eiTmzrfIoSOx
         uY4Sti1GzJ17SxpyJwhgbjdvUG7qk3/Sjuurw9gN/gaZYAJt7P+vjGqFeBAVKLNV2lHY
         NCmw==
X-Forwarded-Encrypted: i=1; AFNElJ+Go6Fe92AcTbQtw1Pfcwc+EGgtnftOsI1WhSCj5lYf429zBR5qJDF34lBLUAHfBQAeeNzljcDiBNMNM2Xz@vger.kernel.org
X-Gm-Message-State: AOJu0YxaekCcgRw08FB8bc7P6Afw2G7yHkEoRDZGiBWFzKlN1CgMZEM9
	6Bc+SHw0n5heoURmvs9C0r1+XX17pjOA67zEgl0WEZ+NNDJVfT36/DNtqIDda6I0Ui0Ub2S6fsX
	nk1y2U4iNG8rK0hxSm0MbIyew+CWn4qK8CIn9/69nJfYh2t6S6CZbfn+VCXAEM3CySbY=
X-Gm-Gg: Acq92OFAOf0eJ3O7Ka7E5sT2Z4bUfSoJZSkTQ4SwXJEXucgwXv4ToJlyn4lHYz73bE/
	oAkDnoao9xqTCd+0Nbi9EuPMZRpiqt9+/P9e/ybM+9ncaBqAaesqyyrjziW0iRVvESNJsr6XInc
	0SbecywRd3Rbv/4mau30shTv2z9DZYzeS1zVka0/w+S0S8dmldwXOToO0TCFNDPsaHi3agwg+FQ
	xABOrG1YeGIt4OJVss5ZESOpQMQXWK9sPUi9cmJWDzSGIeFl6leu+bt4Q2u8JiMZe+uowFBxSkP
	8iDKQ4AI+vPITTrkZKceFbTiZwpy23DxEqR0o4rBAoxVUKnoGwgIpp8ngX46XiUSmSs6cvoqSAS
	R44SUzhxueRbL9Anho9LqEbfOglFSPhFe+EK5ZycyzZ9Q0utnyYVdASFffpYIpg==
X-Received: by 2002:ac8:5c92:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-519a8dcd1ccmr20911591cf.14.1781644223474;
        Tue, 16 Jun 2026 14:10:23 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-519a8dcd1ccmr20910941cf.14.1781644223007;
        Tue, 16 Jun 2026 14:10:23 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/5] clk: implement sync_state support
Date: Tue, 16 Jun 2026 17:09:42 -0400
Message-Id: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQrCMBCF4auUWTsynTYVXXkP6SKkUxvUpCQhW
 Ervbiy4cfk/eN8KUYKVCJdqhSDZRutdCT5UYCbt7oJ2KA1M3FFHjOb5wLg4gzHpJGhINWejVEN
 jC+U0BxntewdvfenJxuTDsvu5/q4/qvmnco2ErTrVTCIDE12DDJNOR+Nf0G/b9gFv1WMOrQAAA
 A==
X-Change-ID: 20260602-clk-sync-state-c0539c5530f4
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LB7cu0y7X7i7aLFAGQATmrNEtDSjcczHxFVVWqoV7B0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd29KkefLOp3SwG+vvP42z+Ln81omJe14smu5QTR75
 /ZWodnZHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyE/wwjw59F57frl8R1h2kV
 fpNTrupJvefsGqevdOh8Z9muFd3fvjMy/HS0kF0+/VHiug6Ph4aR0XbvH593vRUzY85zpdlNB1e
 94QMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113478-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E9446955C5

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

This series:
- Adds a generic clk_sync_state() callback that's initially empty.
- Adds a generic qcom_cc_sync_state() for qcom SoCs that need to
  interact with the Interconnect framework.
- Converts the 7 qcom drivers from using icc_sync_state() to
  qcom_cc_sync_state().
- Implement the framework-level sync state via clk_sync_state().

This approach maintains bisectability.

Changes in v2:
- Split out clk-cbf-8996.c into it's own patch, and don't call
  qcom_cc_sync_state().
- Clarify comment above call to dev_set_drv_sync_state() about
  the -EBUSY.
- Added Tested-by from Jens
- Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457120eed200@redhat.com

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (5):
      clk: introduce stub clk_sync_state()
      clk: qcom: common: introduce qcom_cc_sync_state()
      clk: qcom: convert from icc_sync_state() to qcom_cc_sync_state()
      clk: qcom: cbf-8996: add clk_sync_state() call
      clk: implement sync_state support

 drivers/clk/clk.c                | 76 +++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/apss-ipq5424.c  |  3 +-
 drivers/clk/qcom/clk-cbf-8996.c  |  8 +++--
 drivers/clk/qcom/common.c        |  9 +++++
 drivers/clk/qcom/common.h        |  1 +
 drivers/clk/qcom/gcc-ipq5332.c   |  3 +-
 drivers/clk/qcom/gcc-ipq5424.c   |  3 +-
 drivers/clk/qcom/gcc-ipq9574.c   |  3 +-
 drivers/clk/qcom/nsscc-ipq5424.c |  3 +-
 drivers/clk/qcom/nsscc-ipq9574.c |  3 +-
 include/linux/clk.h              | 14 ++++++++
 11 files changed, 100 insertions(+), 26 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-clk-sync-state-c0539c5530f4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


