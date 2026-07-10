Return-Path: <linux-arm-msm+bounces-118272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8B43IuvkUGom8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:26:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E073AC30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:26:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=CbmP8Xxj;
	dmarc=pass (policy=quarantine) header.from=qq.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118272-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118272-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CB7C30054F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9536041227D;
	Fri, 10 Jul 2026 12:26:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9893F44C4;
	Fri, 10 Jul 2026 12:26:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686376; cv=none; b=GJOfnYLWbvNCL1VbxP0ztGTJ7Tmu1IygY8rxVYzPVwkJZalnFibbRI5ErtRJaSvFohjeUks309A96qo8evHW/pgm3JOerxir/BTDwn1nIv94BZhxQ+qkygXamaOKu+XinBW32jPEhPvmNZ789df0WL4iuJHq1De36BTk0gvVR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686376; c=relaxed/simple;
	bh=zOYgkiXzO0Pg5ZHEXnMuWgIu9IGNnLjmy2huYVTgh4c=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pY5qTxEFvwIpFrGNHj1tfqyIUm2Lkf47mtrwC4NMeOfNUkAUiCFA/sVNZHOzJE4XvlFFi9grCcFvt1+2mvHN8MAzRySlUTULu4dyLYWP5TYcpm1h/OT7jIrndjY/WWWQdXF1ru9BEGtOYqflMkm6pWZeUYiMBp+MyawD0Q6WWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CbmP8Xxj; arc=none smtp.client-ip=203.205.221.239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783686363; bh=X2PH8WVJY5w37XgpUt4M9+wE5C6gxrNVXc7CpzWIfMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CbmP8XxjZIXuG59JRvgVxJOKVHeVLDm4EY5nMUKLFy556Yz73aapTvRDxxA8U3RYl
	 aaRKirCMBViB95D18+hPPCDNBrLqmpopmKrXBMs1ZJjhck+EPIh4ymRyWPkJZEOuU0
	 bIX6p+Sq9beKbQcgwfWqVD1zfVI7zBtuF0b8RUlM=
Received: from 8qyomHQF3vPjMe.lan ([240e:3b3:62d8:f210:1216:88ff:fe19:9e1d])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 67A9D89F; Fri, 10 Jul 2026 20:25:58 +0800
X-QQ-mid: xmsmtpt1783686358tij4jka9q
Message-ID: <tencent_8DD1BC237086AD27A15C26D17B2CD8A49608@qq.com>
X-QQ-XMAILINFO: MpqXoPZ+m0JqQ/MnzwyNIdwWwtyfDaOA/HKYsTyj8lDh7ohH0gY09QOFmrKWyi
	 Ln0ZQzgbCBFnA+OSZWQZONyKwlu/afpa0G+FP3TXEoSWKc2igbc1yMqI6ZyWmzr8nQLCRWpag2GC
	 llk3zowAZ0fmL0eQRWvlFmM0nuq9pn8Aho8ODhmk3p5wH1jI/Wp7/1fYem/kmhhZeMMe8f/BR4DY
	 fEr6LHV8BsbWF0g7YaKFkIPlVucip4GR9C2JHD0nCSzChwkn5SiEy+Vpt3u1gAdxuOJTxebwcWri
	 TGHa3+SCzLdWzE47IX3RD+qKtrhcpSKzPPPG9sM0qckhXEQSJhxnJpDrpjnac3s8BevhFhI5HbEz
	 jWRqiaARgK3SivaKrpC+ivFiWqr/FwwvMiCIPKCNYTd+cSa71Q9WZzKPq1cNnevtIia8brOn+RHq
	 s6UKel07IdDcBdStvJKAT+lS6savuBxj7W71YHph9KC0rdAzVw+dhtdh1cMiYOAWSgOCS/5MXgFC
	 bJaKKPpU8j1UXAM/LtFPiJ4SnmInFcp9+aDrQZWQKVkh5Q243W7MeDtAYsPI+4T+1a2wg3unXdg/
	 p3H5WJeoSiAaM1gCQTnHPa5+ct5croG34BpkgPY5ucG37SMHQwEh/gzZekZNCBYp5owE5DSO7yRR
	 GVGcjqXTF8ahCJQ49zqrreFW6USCsmh4bvspfSgQa229cfMI29WjKR8EDclLCO0GewJk9HRyC4Wk
	 1jMxIWzpFgoGNGahRIAaj8NeJLUiebA8b7XLrnr9ToL7OHPVu7UzhfGJ1SondnXy7s9JxDiDJXLn
	 oKfJhZaIj+3SKid6DLSGc5pK2vZ6G23ZB/UDwpH6vf26zUeZmYlW8HsXjqkS7KNDmo4DQpuJI6y3
	 NZXgVTqgWt8Pq9s1vXvyQbvp7TellFLoXrqAYp4Xwdr3mT3vrijYe4nE4oL+7hTdewGmd/61ksuW
	 CHfk4mcdGGvDpeQ7+Tlxcr/B4lI+HorbfXRbJko4QbLFtr/ifBE5HVpgoWbc4OXps9OBCXfItmU+
	 kQymzTS8DdnMv1ofFD8HWH4y8CQFnQSNq08RDHWqek3pH4BHz/Zaun0kNnddmPV7LMUwpqT1mYFV
	 hwexQ+zqWiTsWs4MmpSJEJgrqUGRamnahIf4ARU4b1tN/WsKnwioiQN85c0s8z5uk0ucM0X3Z4QI
	 Vf+oEatCc0poa6bg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xxsemail@qq.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: Remove camera_front_active pinctrl
Date: Fri, 10 Jul 2026 20:25:57 +0800
X-OQ-MSGID: <20260710122558.18454-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e233721d-5e84-4edb-95ce-596f12cf557c@oss.qualcomm.com>
References: <e233721d-5e84-4edb-95ce-596f12cf557c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118272-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,qq.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xxsemail@qq.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:from_mime,qq.com:email,qq.com:mid,qq.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F3E073AC30

On Fri, 2026-07-10 at 10:45 +0200, Konrad Dybcio wrote:
> On 7/10/26 8:22 AM, Xin Xu wrote:
> > Remove the redundant camera_front_active pinctrl node, as its GPIO
> > 109
> > configuration duplicates the reset-gpios property.
> > 
> > Signed-off-by: Xin Xu <xxsemail@qq.com>
> > ---
> 
> The reset-gpios property lets the kernel consume it as a GPIO.
> The pinctrl state ensures the correct pinmux/pinconf properties
> are applied.
> 
> Konrad

Thanks for catching this. Since it worked fine in practice without the pinctrl,
I assumed it was redundant. I’ll drop the patch.

Xin Xu


