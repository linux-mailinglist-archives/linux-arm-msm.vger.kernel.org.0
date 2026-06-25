Return-Path: <linux-arm-msm+bounces-114514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aq2mE8ASPWqXwggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:36:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E36C52AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:36:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b="m+sf80p/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114514-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114514-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61CAD311335B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6183DC4B3;
	Thu, 25 Jun 2026 11:30:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCF13DA7F2;
	Thu, 25 Jun 2026 11:30:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387023; cv=none; b=RpOXAPdSOHkSdYkaZ7Y+YB8Y/r1VRtvrffeH6gyzdqHyDg8idPXItm8E1OFL7Y//jLbOvzz2slV/218qimMqNn13tQKz/2CagokjRvWPk+8Fx3CkiXLt3yIvDmkvuZD/19G9EL3iofY83NiMnkEVLXM2pNjX3ZTNCAhCwydGG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387023; c=relaxed/simple;
	bh=Db3EkASkQjLz94/SI1P/fqFTbOE7tiV2mUDnCaLsJ9k=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOnWxhk8SifRyJmHlOoFUZI73G3FjQ9wLPClxljYh8YaakDXbU9VilDpN4B4hAeq++SGjD0L7G7w978lFbIx7xrfDRPogXyFtSNXaEZSUq6+OHTDoweICSoSBpYQfy9Up6ja9RfSxhTDFG6Pvshh5GdtvSKrlk8kSwIPkR1Tbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=m+sf80p/; arc=none smtp.client-ip=162.62.57.252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782387010; bh=Fv4oZSJdLTal8lEHvz+rNSAGis0ER3jtNNKHHPKK0NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m+sf80p/Y4M9nKxkRFqYnzsGc+EcVHrmckJoXR3iQabrk3HIdnSSiNF2JUE0G9DMe
	 KGmHRPBNZX771+u+25mV22OF9qtUT045vcIF+eWy/GLk/GNeou8N8inyo8P7pA17NH
	 enKbUmjae26lm5R3mtCV0uR8qX8wi/wgidhtJbrc=
Received: from 8qyomHQF3vPjMe ([163.125.234.242])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 787274ED; Thu, 25 Jun 2026 19:30:07 +0800
X-QQ-mid: xmsmtpt1782387007tux9nn8km
Message-ID: <tencent_3E47B20CD14FB6B8E6A26D590A48A3A29D09@qq.com>
X-QQ-XMAILINFO: OOookkd9cy4plLAKMU6gCgH/B0+1Es9+9QK0QcLtkNdUu1sTLRL7cI7TjZXqdf
	 dc6fqHVK0ZQhIf+khdQxkTa7u1ySvI7sX5paSGXKDy//McToqqUyXZzTfvqzxqqnbLrlfd6yxjwD
	 Tynve+r2vasK9kiOXdMuUylv/uGeaeb0TOGdj+ahGYVRJt/iig+vew1GKSwGd7w4PyKP5f/7D8mu
	 R9TrQNHNRWCSN74uZA0u49HiZGPMfx9x9P1jEgXyzsJCUYKC1gpxdjZHJf2QCPKx50ko1Zi3wqbo
	 j8dkh3m41O1wUYGgJiCE0VbpYSkW7+KxBf/iNYYNeWRqB1V5kHhUAXBCyLjyCcP6gx8S0iC5QJK9
	 xiiGmpsx0hmuk8GZXsQ7y0emm4UXUHdpfA30253bI8lCo2OXWMtm92m1irF/zp6amTgNgVlZqj2J
	 YxGxGCYTyf+AjKkP4k0zewHVQVd70qD21gSnf7O8zRGcuc/gDXKTfwMxCJy3DyTouNzC4tqqpONy
	 OxxUD0l0DGkJ4SN6PjP62wewuMlL7c47B07z41uhxUOWjQIC6ib7KZIScVcgW45iFRspEqLtAoPA
	 1ukjcnUnVEuyVvEbAWD4YFW7798sU91i9BvDmh4FoP9UYvn+lRzymO8RC9+49Qy7VtBbX5PuTCxx
	 LV0lLvpNRnsK5Fbuw4ypKBpHyUTcUSTgbaWnNx7YkGD3CsGMemuMWW+bWDyIrx8jBgDl9kXo39/f
	 NbPS6gHJ3NGZVp7kWmhYh5TCEVa9rC1lvIMVAfoNVUIvvT/8LWlucWOh+xEd3cTZMWZ/AOm3JB7j
	 BjETdGY0wq5qC36R99YGG9eQCdMXTiBkI2cJHeIguxZ2YVpzUfEths/rT6YJV7yAvzWP2jsI1nXk
	 x2ponl0YM585ExsvyMlgtNhgK81kByUOy++NdWOh6yGdCmcb28lxVTbgVYPHc0wFXpUNTAXF8nth
	 z0I+1h075qOaYiwNdaB0ZLSFm8KWXUHDpnzUjOaNIeYzFbztsFJ8gmqStecFjC5uFNMY2CQn0rQS
	 hEBu2SkgqrC6FyJddgWJNcKUrKDk5aneaXStfJ/E+zqqoXfGc5UjbotAd7NFLKuiRlHd1n/RYo5i
	 4YplfrrpBR4CNF3zWXpvd46IeKIw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xxsemail@qq.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856 front camera
Date: Thu, 25 Jun 2026 19:30:05 +0800
X-OQ-MSGID: <20260625113006.14728-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <896f3704-e7bb-48da-a501-0c9b0228573d@oss.qualcomm.com>
References: <896f3704-e7bb-48da-a501-0c9b0228573d@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114514-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,qq.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xxsemail@qq.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA3E36C52AA

On Wed, 2026-06-24 at 13:56 +0200, Konrad Dybcio wrote:
> On 6/22/26 8:52 PM, Xin Xu wrote:
> > Add the ov8856 front camera, connected on CCI1 to CSIPHY4 and
> > powered by pm8008 LDOs and other supplies.
> > 
> > Signed-off-by: Xin Xu <xxsemail@qq.com>
> > ---
> 
> [...]
> 
> >  &cdsp {
> >  	firmware-name = "qcom/sm8250/xiaomi/elish/cdsp.mbn";
> >  	status = "okay";
> > @@ -877,6 +933,20 @@ bt_en_state: bt-default-state {
> >  		bias-pull-up;
> >  	};
> >  
> > +	camera_front_active: camera-front-active-state {
> > +		pins = "gpio109";
> > +		function = "gpio";
> > +		bias-disable;
> > +		drive-strength = <2>;
> > +	};
> > +
> > +	mclk3_active: mclk3-active-state {
> > +		pins = "gpio97";
> > +		function = "cam_mclk";
> > +		bias-disable;
> > +		drive-strength = <4>;
> > +	};
> 
> nit: other nodes have drive-strength before bias-disable
> 
> Also let's move the mclk pin state definition to sm8250, it's not
> specific to this board
> 
> Konrad

I will fix the coding style issues in the next patch.
Also, in the next version of the series, the mclk pin state
will be applied to sm8250.dtsi in a separate patch.

Best regards,
Xin Xu


