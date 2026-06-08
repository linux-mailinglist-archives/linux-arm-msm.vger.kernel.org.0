Return-Path: <linux-arm-msm+bounces-111916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5g0lEYjVJmqdlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90005657754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C7WJPTtF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111916-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111916-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B82E307340E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E069B3D6CAA;
	Mon,  8 Jun 2026 14:25:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5CD3D3CEB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:25:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928710; cv=none; b=Str7nD/sSxRGgYbGfKVOeYdyNOTVmB2Ce+7l9ULmHXbNpyTY30bzG9wVf4ZMbvohXaUQUBde1iZeN93RJZ00i/zimWpT83KzyBBidu0+8uVWZbH+usCX3BQ+tKzk5zE3vhYSpVMW8T6QxEhmO959HdqjCnK/meo2aPBZ/gPnXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928710; c=relaxed/simple;
	bh=r39JWjk3eEXkxQF9LVlH6CaX8c7vjwP9g4eg5PVmHzo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLh7YaXJNf93B3RJICHNe6Owdjd5P57qtFIMYZeLrCBMrmIu3f4oSzJKbgBbMtGlBhlgiryagstB07zdKQfW0SL/dQy3bSG3gsy+KcZeIX736Vjv2TPppb8abA76i7iOtXN0BwjkHuI11AaCvHd0/gsCP8ef9kTmguS15sYkHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7WJPTtF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAC71F008A3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928709;
	bh=r39JWjk3eEXkxQF9LVlH6CaX8c7vjwP9g4eg5PVmHzo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=C7WJPTtF168w0LXhxWPp6pmkxAbRRbddws71GFa8KOBA6y4dP24N6TENZ6Dy30Jqy
	 4Z1OK6zEd5Bw3yrGpNswhH+WusL6GAlPzDD1T88ODHfSLO1/jdVoc+YlGcpkkFw5II
	 fYBZCPdvPeECvoB0U87xeX1++A2oJHUSsr883bTMPsDQp1yhqOWg+Yp88UWPfku9eC
	 TXV7RICLa9cwAcu0xm2CKjfRHWTqKDNq31OYtetRUgzOHEURE0KzV7pCNKKy5lIWta
	 Q7NhbszK6JLM13KrXn4uJb5lC8XIwM1vOS7A2WXsSu5hQRe3wmwcWxSQswI5SjxIkP
	 VMOyrBMShmzoQ==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1382c509485so621586c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:25:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywgmm5kyONdT3ba2Bly8q4Mv4fJKaJx6Bue/6R7xLCzCs8lP4UU
	OhRJySk58oA6E4FWposv0umuLL2jMMYIFKdxjUP7/OgdtJ/DH86oTGWmJm5XrFxCgEi9m3fT4FB
	1LLruEoU39Js8RtJW35I7+Eow6zVfa/+x1zAwQZi/UQ==
X-Received: by 2002:a05:7022:62a3:b0:135:d749:574f with SMTP id
 a92af1059eb24-138066d530cmr7679756c88.13.1780928709070; Mon, 08 Jun 2026
 07:25:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:25:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:25:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com> <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 07:25:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdiih9kFj9mWe_9cqd5T4B4Q0ekd-5YhJ6X+dgiqwLtLQ@mail.gmail.com>
X-Gm-Features: AVVi8CeA1Wijm5yAWA_-v3VlKzCbZNsMunOIP4iwNyh2boGjmtB7gJWUNbsUdIY
Message-ID: <CAMRc=Mdiih9kFj9mWe_9cqd5T4B4Q0ekd-5YhJ6X+dgiqwLtLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, quic_chezhou@quicinc.com, 
	cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111916-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90005657754

On Mon, 8 Jun 2026 11:17:02 +0200, Wei Deng <wei.deng@oss.qualcomm.com> said:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
>
> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> lemans.dtsi to allow the PCI subsystem to associate the DT node with
> the PCI-to-PCI bridge device.
>
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
>
> Also add the serial1 = &uart17 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART17 interface.
>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

