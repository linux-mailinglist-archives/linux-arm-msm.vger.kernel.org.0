Return-Path: <linux-arm-msm+bounces-114114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DG4qK3FJOmpz5QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:53:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F33176B56FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:53:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="TW/woD4i";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114114-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114114-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E29D304D27B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3283CF1E4;
	Tue, 23 Jun 2026 08:50:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032D3CF045
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:50:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204647; cv=none; b=AABBwvYf/MgILBQY4AWGWucoFdaufx/4DY5crx6rGDzGGAB0FbspPTE2kBZvvoksJBUVVaHyj5WdiXgis7+k8CoxqgZxdADYbjqZzZK1plmL/9wRO6Cl16aMCGGTGxeEnBULVCGkW1EOL2/j/byA1XxSfrqBNxaVG9DX/NHl5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204647; c=relaxed/simple;
	bh=lQrJMG+oRjVwEKTOgm0bJKPrf+fIaCAydYqGu0p806Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAH1whgn+bp6uIEhyGQcdrWAUS4KScXLIzk0oN8UAIRYQHgRpBj4IXyY5MHeuEUWiDX9wnMJIm5Tgh2ft1Dr5cOJqMajRByTFA8rn3BQPVYdxNdPniDPNgrQ6BjlxTByTutBPNuZq1flUIYZJ2/7aFJiofaT77RjOBgh3cCPE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TW/woD4i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7831F00ACF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204646;
	bh=lQrJMG+oRjVwEKTOgm0bJKPrf+fIaCAydYqGu0p806Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TW/woD4iyjWoTNoUb7QmAM80IQq7ZQlz0eo9cOCoBooSI52XotZ/Wiy44SPqlF1QU
	 +E1v9uiIZ7qOxzMFnX4LU/9keo+YWHaJmugkSI257POPrP2XCOtNcPKHFGA0rjo1wi
	 4GSB1p0w3OK61cV7UaCstXO3J0R8qlpAduujf1Pn0oSl+YLmL+i/Q9NsF4QDAysWVF
	 /kG778LGDUzWY9yBl5o7a5KGWEzvflqCsl/bSRBSZrpfq0XWRO/k1SEij9TrG4jMHI
	 qQ7GFELbQoCBmxdK9UNj60Jj01tgzOEDiMr0FqIF1Fk8PBoD851CpFgF8+HBIrt3Q4
	 +F8+uOr3AQ0+g==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3997a448ecbso43592631fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 01:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9r+HbrCp+oLy8PUHxPaXROxnc1bCI42KO3lW9JEc0spczMDUFIDCwsjEruSoXknbboiMm4Idipj9Mhs29y@vger.kernel.org
X-Gm-Message-State: AOJu0YwmlOv0rga6u+hNIZBrYLoSxFNwGruQ9Rmmu2roSgYs223ElcjM
	4j1Od5pwhV8C2EiiNaDkbXMpQZLOAl1O/u8e3fVXt912XqN22uB//QvCEcEcb/joVbz0LI/sBwp
	uoJ15MwVXGOBtKu5I1w2NSdcIoPg1FDhKmYLEqK152g==
X-Received: by 2002:a05:651c:985:b0:396:71a0:7753 with SMTP id
 38308e7fff4ca-3998bc2b449mr48824751fa.5.1782204645067; Tue, 23 Jun 2026
 01:50:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 04:50:43 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 04:50:43 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <xzps6lqo2k2w2onzleg4baycsnzsejiwhhefilk5rt5e547u6y@orl7l3yklhuh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-1-11f936d84e72@oss.qualcomm.com> <xzps6lqo2k2w2onzleg4baycsnzsejiwhhefilk5rt5e547u6y@orl7l3yklhuh>
Date: Tue, 23 Jun 2026 04:50:43 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdtBEzmyYfzSwEdB+98AYU3U0doWEGrMsh9TqZ4wLXu9Q@mail.gmail.com>
X-Gm-Features: AVVi8Ce6muOBExY_sx2VA0iK617KV5_AeHGJxiAk_NT7sUmW0a6PpDxvimltQj8
Message-ID: <CAMRc=MdtBEzmyYfzSwEdB+98AYU3U0doWEGrMsh9TqZ4wLXu9Q@mail.gmail.com>
Subject: Re: [PATCH 01/13] Bluetooth: btusb: Initialize @priv_size at
 declaration in btusb_probe()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ben Young Tae Kim <ytkim@qca.qualcomm.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114114-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F33176B56FE

On Mon, 22 Jun 2026 17:30:25 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> On Mon, Jun 22, 2026 at 07:52:14AM -0700, Zijun Hu wrote:
>> Initialize @priv_size at declaration to reduce a redundant assignment.
>
> This is obvious from the commit. Please tell us, why?
>

I think this is what "to reduce a redundant assignment" says.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

