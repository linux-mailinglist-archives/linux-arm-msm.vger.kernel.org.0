Return-Path: <linux-arm-msm+bounces-117746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZBBoMtxqTmo4MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:21:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54D727E98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:20:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ji5GUXQ7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117746-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117746-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B934310004F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62855438005;
	Wed,  8 Jul 2026 14:57:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40800437130;
	Wed,  8 Jul 2026 14:57:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522678; cv=none; b=NR7Ulr1UdCj7IUcWQGIM8UKedpFSz9PJFiq0O8jCBKeGQ+Jbr1UcXPQmt8Lsm+TTwhUwDetxzEyWHYB5RyFl48ep5ECXg0g1le25CEO6Gm7DxBLxPeWgAqhjJZGkeqEjqvRQcSiZYO9xLPvRdNOWFRiwUb52bpcOo420eQNVUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522678; c=relaxed/simple;
	bh=w6kFCr2gkvLCp6zPrBGKfYafHJOx14HdMyBeg8s4+5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQIuLJO45UsrVm6c3G9qYQe8VNSqqFwPaPbgLJIeWzm0BE1LOnYDzeBeSk2g8fCDihL7ow+BBOdcY7U/zANvHyeY0S03uUg3VDYrw9gXGsVnSYILjq1s3ycqYO1QG/1Xq73npZjIyFC1/z7F5lDFQrJgER9wNGkwrpQ/Zxlq7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji5GUXQ7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37871F00A3A;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522677;
	bh=yvsPKq1kz5jm41pEOhntXB+dktSpmiUQ8ox3Qzu68S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ji5GUXQ7kECVG428RlaXn9Q9RPtbQnIijfGqhxaW17Pm2cA2x1nKfQ78/uI+wBomh
	 JZXXthdiJH8aqLZGzjWVhWFlQqjrbGP1HfkaYZsYZEFSg3fWbSi6pep1xuxCU9Alt5
	 Rp3+N5YdxQV+WcbT6LDGO9XBZf7dCHXoCReDpvCNTtAYNXOKVKwM2UuHkKfpja6JHr
	 hhg1l3ZocPSYj+umK83LQrH7JM6DvxGbTOdk9FcKIXqicfcRzOv1k9c6mFISlnKhPE
	 8MNQOnScOrxz2XfdTvI97w4mYQBxDJHK/XVVe0F9LAYGuvle6OVwB9AN+AcKgKecVI
	 R3zPfk8Z2LX+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_chezhou@quicinc.com,
	cheng.jiang@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	jinwang.li@oss.qualcomm.com,
	xiuzhuo.shang@oss.qualcomm.com,
	mengshi.wu@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: lemans-evk: Enable WCN6855 BT via PCIe M.2 Key E connector
Date: Wed,  8 Jul 2026 09:56:58 -0500
Message-ID: <178352261641.2235436.14042420784644529836.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wei.deng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-117746-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF54D727E98


On Mon, 22 Jun 2026 12:11:55 +0530, Wei Deng wrote:
> This series enables the WCN6855 Bluetooth/WLAN module on the lemans EVK
> via the PCIe M.2 Key E connector.
> 
> Patch 1 adds the PCI-to-PCI bridge compatible to the lemans pcieport0
> Root Port in the SoC dtsi, which is required to associate downstream
> M.2 connector graph endpoints with their PCI devices.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans: Add compatible to the PCIe Root Port
      commit: 4af0537223d511a903f0a2a6b63d712b63184a08
[2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
      commit: 5bbb7dadda0cc4b327a1fa2fd055dcb2a6a8ee37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

