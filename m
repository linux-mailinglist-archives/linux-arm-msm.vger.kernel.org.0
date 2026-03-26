Return-Path: <linux-arm-msm+bounces-100007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJHzB46nxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:27:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C4632ECDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD5E30B8496
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34E339A7FD;
	Thu, 26 Mar 2026 03:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWP6rjJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44249399039;
	Thu, 26 Mar 2026 03:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495181; cv=none; b=VtL/jdNS4p2GtvPyQHV46nHWze+Zb5zYaB+dSOVcBeM8HpwvE1pa41bMX89gc7atnGeVEzB56JEynrvG8M2noEAQ4gSqEj/GzMBtL5nPd93+6EHhwEt8ZqAIrZ6p6QgLI+PFFc0SOiev6saEwgDW0vYbdDAhF6YKWbWqQ7nlwCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495181; c=relaxed/simple;
	bh=0/nUqxXcm8JzN15pZRTEhovWBFAJTewx2PWlC/yjdPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQjb5SACjriABsQxZ+R93BvCsQeyZRUl4wPsC5df1YS6+RuwwyOvDVn5T4uj1nohT+Lbal5K/qbpLBiw9fpZ1yvC4VTBdyxUUXugfM8kSS15GOBo7pt8pL+ZtxKGwi7N93mq1mV6dzMfrQeSh2xVHwEi3Ff+5X6XEf7o4U86M6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWP6rjJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A453C2BCB2;
	Thu, 26 Mar 2026 03:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495180;
	bh=0/nUqxXcm8JzN15pZRTEhovWBFAJTewx2PWlC/yjdPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWP6rjJei8RorSk6lk3H4y46lUR0y4aFB4mt+hAk4HYT8Uh/EfxxNblZL6pUD0hiR
	 SBCNDxnZgeC12tGiPoiVFRue1zNNZi+BpGFQNJHk7KrVfIA6d30owvQfUPpjEbDLDx
	 AV1rTlbS32DwJiugFNtx1FD2na7yDCyn63B3mJFjXzJho3lYwN0qZhKScK9csOIRuL
	 AUEhmtOkUARWNfEs9Du5st+YmwVMgvJ/qtuZ+2lnGMXC/ZfL6CLIUqZyv7XmflPjQG
	 OblGgA0YNjgrRcYZDjxuf7PtBhks09WFxAnsH6OJXclzs7Bn9MHqXVnooBl1xxVEkZ
	 Gvsgqv3BKDTog==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] soc: qcom: ubwc: Add support for Mahua
Date: Wed, 25 Mar 2026 22:19:22 -0500
Message-ID: <177449516616.60308.5993175793841251102.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324-mahua_ubwc_config_support-v1-1-037d35ff2317@oss.qualcomm.com>
References: <20260324-mahua_ubwc_config_support-v1-1-037d35ff2317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100007-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97C4632ECDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 10:14:57 -0700, Gopikrishna Garmidi wrote:
> Mahua is a derivative of the Glymur SoC. Add the Mahua compatible
> to the UBWC configuration table to enable support.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ubwc: Add support for Mahua
      commit: 85adc680c60bcd3b3ff83296410f13eee49f5df0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

