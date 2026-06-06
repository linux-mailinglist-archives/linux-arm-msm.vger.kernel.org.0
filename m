Return-Path: <linux-arm-msm+bounces-111464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6t7iCSq/I2qwxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 08:33:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C464CB5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 08:33:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oldschoolsolutions.biz header.s=s1-ionos header.b=eZF3Rf5M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111464-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111464-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=oldschoolsolutions.biz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96A2930448BB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 06:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091382FF672;
	Sat,  6 Jun 2026 06:31:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413A2F531F;
	Sat,  6 Jun 2026 06:31:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780727502; cv=none; b=bYjxkb2c5fCuMynpO+j7x0PzrXk9pRtMR1jC9fSK2XTGXTCLaAbwXkuGAuZFj5Qd6ZWUvBowpY1/vFg4EMLe31o1nK9mzQUJncOqLx546wwgdWytLchotX3NZJBrgCodO6ObCaRbF80gYzghhA3qYbpNWLkbJdfOjaJXcfkSilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780727502; c=relaxed/simple;
	bh=QD72RYIoIp1ck83PJExb8ilYoyJogkNSWka3tVGMtPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDIiQLOH74CaI9ZenubK8wWyRpfk6kqyW1J5TN4fP8UQopHs1J6ON11lr6m+FhuCPTMdyD1YDc2sTCbqsJps35VWTUoBxRah+M/Wzvc+q+qJQ4lAHr25o4AkbC6jImYKlBW+zpbSIVMcyk/1t/XTbXzWKY+Cj0hVhY8/+s8PLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=eZF3Rf5M; arc=none smtp.client-ip=217.72.192.74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1780727481; x=1781332281;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=bS4GE3WsMKBfWI4zSltXx9GLVgFb72jinFbbXEsfmXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eZF3Rf5Ms1V14C49XLBO5OgFr5HnclnlJkiPSGvWRpxZaOxxmTBxOMxM9sRhh2D7
	 N+ZhTWxYynsRaUUx1n/5Fhs6UYT0Qd3Zi1f9n0dA6wHWcZ6xdppO/EJH7204N2LEz
	 5PhPU2VNHVpq/mRgRU5Dz149BRuunhFwu48pBeyoE8rPgteyY/v7d5rTLaFqI0JYP
	 vd3zk/bTOGvcddX5UV6VlccdCBkpWJEWdGMFKCX19hH3Dscats7/fOudnBW0tYF37
	 H8QmQPIq0wdY7UUdIaAmTyGSmbZjM04DNhE8NSQdxi9jViQh6fn2ZZjpkK6HEprG2
	 64d6nbAzXuKeKHVTmg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7sQ8-1wZaET0swk-00GI6Y; Sat, 06
 Jun 2026 08:25:47 +0200
Message-ID: <b732e65f-5963-4598-a341-06338044d90c@oldschoolsolutions.biz>
Date: Sat, 6 Jun 2026 08:25:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZvVLlbYB4mzAxb+is+mQ+9XCJQD4nL/esL+d947X+LTvUfeAWua
 KL9snhW9hprGIBggXoO+5tx96bX61whZulsmgDxYnFcZ3CMbJoey2+cwIBa9/KcZHOL3wQa
 oLaagrvJ+oy5iilYTUROtczqaLgLiINxrmOlsg1Vl7t/l2fDZyWZxbOgKIziNIxkTrKF2nI
 /CZ2MKtakTErRwa1nC/iQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uZ9no4EwEr4=;RkGoveC8OhaPAEKL9kwd0kfFAsZ
 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
 4ICZMAFPDjT67zxIHnjk9Ra8AIh8w=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-111464-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F9C464CB5F

On 03.06.26 16:21, Brian Masney wrote:
> Convert all of the qcom clk drivers from icc_sync_state() to
> qcom_cc_sync_state().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
[...]
>  =20
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-=
8996.c
> index 0b40ed601f9a..0d920bd5a992 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -6,7 +6,6 @@
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/interconnect-clk.h>
> -#include <linux/interconnect-provider.h>
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> @@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platf=
orm_device *pdev)
>  =20
>
Hi Brian, thank you for the patch set. To successfully build there seems=
=20
to be a header missing. I tested this in my tree on Thinkbook 16 G7 QOY=20
and Ideapad Slim3x 15Q8X10 without adverse effects, looking good.

jglathe@tb16-jg:~$ sudo dmesg|grep "unused clocks"
[=C2=A0 =C2=A0 0.492547] clk: Disabling unused clocks not associated with =
a device
[=C2=A0 =C2=A0 1.178818] clk-rpmh 17500000.rsc:clock-controller: clk: Disa=
bling=20
unused clocks
[=C2=A0 =C2=A0 1.314479] qcom-edp-phy aec5a00.phy: clk: Disabling unused c=
locks
[=C2=A0 =C2=A0 1.327608] tcsrcc-x1e80100 1fc0000.clock-controller: clk: Di=
sabling=20
unused clocks
[=C2=A0 =C2=A0 1.544869] qcom-qmp-combo-phy fdf000.phy: clk: Disabling unu=
sed clocks
[=C2=A0 =C2=A0 1.614767] qcom-qmp-usb-phy 88e5000.phy: clk: Disabling unus=
ed clocks
[=C2=A0 =C2=A0 1.616222] qcom-qmp-usb-phy 88e3000.phy: clk: Disabling unus=
ed clocks
[=C2=A0 =C2=A0 1.690273] qcom-qmp-combo-phy fd5000.phy: clk: Disabling unu=
sed clocks
[=C2=A0 =C2=A0 1.726354] qcom-qmp-pcie-phy 1bfc000.phy: clk: Disabling unu=
sed clocks
[=C2=A0 =C2=A010.956342] qcom-qmp-pcie-phy 1c0e000.phy: clk: Disabling unu=
sed clocks
[=C2=A0 =C2=A015.858926] q6prm-lpass-clock=20
6800000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk:=20
Disabling unused clocks
[=C2=A0 =C2=A015.867120] rx_macro 6ac0000.codec: clk: Disabling unused clo=
cks
[=C2=A0 =C2=A015.867990] wsa_macro 6aa0000.codec: clk: Disabling unused cl=
ocks
[=C2=A0 =C2=A015.868589] va_macro 6d44000.codec: clk: Disabling unused clo=
cks
[=C2=A0 =C2=A015.970465] wsa_macro 6b00000.codec: clk: Disabling unused cl=
ocks
[=C2=A0 =C2=A015.973614] tx_macro 6ae0000.codec: clk: Disabling unused clo=
cks

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards,

Jens

=2D--
 From ac259285bc626800d5f1216bd5b276ada99295bd Mon Sep 17 00:00:00 2001
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Date: Thu, 4 Jun 2026 22:03:20 +0200
Subject: [PATCH] clk: qcom: clk-cbf-8996: Include common.h for
 =C2=A0qcom_cc_sync_state

After switching to qcom_cc_sync_state in the clk sync_state series,
clk-cbf-8996.c was missing the declaration. Fix build error by
including common.h.

Fixes: 20260603-clk-sync-state series

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
=2D--
 =C2=A0drivers/clk/qcom/clk-cbf-8996.c | 1 +
 =C2=A01 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c=20
b/drivers/clk/qcom/clk-cbf-8996.c
index 0d920bd5a9929..6abc70ebf6f19 100644
=2D-- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -10,6 +10,7 @@
 =C2=A0#include <linux/module.h>
 =C2=A0#include <linux/platform_device.h>
 =C2=A0#include <linux/regmap.h>
+#include "common.h"

 =C2=A0#include <dt-bindings/interconnect/qcom,msm8996-cbf.h>

=2D-=20

2.53.0



