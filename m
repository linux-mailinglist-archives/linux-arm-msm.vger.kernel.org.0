Return-Path: <linux-arm-msm+bounces-103459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILEiArBl4WlyswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:41:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493041549A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 829EC303780A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590CF38C42F;
	Thu, 16 Apr 2026 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MpN50Jyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D33381B02
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 22:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776379263; cv=none; b=dXEDyNmJaO/UHUYYLAPnhmblTtlGa1j8vWAlds0haOb27Q9j5mgn3OBs62/CQ6ppqukFMMClhbTT/++CXt2OGqE0fXruuOxN+ggn0IN1fCCqEi1cQau2QePEAhTjmFyY4Byyp9aDtczYnX5dBgZ/+eK94kw7QZys2f/1jb+OnEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776379263; c=relaxed/simple;
	bh=nHmEjiaEYFAIVEc4iIy6Jn/r7ND952ytTcb3N2rDNvE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjyX7O9Hdtc9X6F9ArU25RkEGNfMjGZne5Wjun+0bNgS+VgXk8a2DqRQbTxG/B8iz+GDJ2k0JXLVbfzUCX0DuZRT4A2hpGtyoDOcyaMPvlctIS33eKowV4+sBv6Wy2umbinJ1cr3fLPMrvZuNu6aQ3rkTyvUzAXE7ByedPGaSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MpN50Jyr; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776379259; x=1776638459;
	bh=o0AMJv9mAwYEESX7/0Q0ql9BjisVYh0Mr/rNKfBIFWk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MpN50Jyr9Mn2xANj8zghyNjFShSrzKuw7nLTdRSwt6DYcVfhApn/IqnHMSC1rLDmC
	 cNi1LN2PW/TkQHp9j3rbIrzX593qmD0uttxNtSLN1ZJvsDwLmnNTN0hCnQDL97nb/u
	 iLSPjTeq9Nd9/TDIgwhXgDeFUjmn6J6tn7rwKL96HYTRlos+n8Vz5ZTJfRlJxoxOCo
	 1TKoeVNoTrEB9n+HjbNNwm2zVVhwr9xYFPK68pPT0NSYoZ9AacYacH0iBbws3fd/QW
	 V057CsTfGetkg2hFB/YRBcVOzvkMg8bw4LzFnoZhDlTNiaZNVeYcEullpcz3aPHejS
	 de5HKOw8V2nbQ==
Date: Thu, 16 Apr 2026 22:40:55 +0000
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 2/4] net: ipa: fix IPA v5.5 configuration data
Message-ID: <20260416-eliza-ipa-v1-2-f4109a8e43c4@pm.me>
In-Reply-To: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
References: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2b8256ccebaa33980c3767e22e9f09f664f9440a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103459-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2493041549A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct ipa_qmb_outstanding {
        u16 ot_reads;
        u16 ot_writes;
        u16 ot_read_beats;
};
[IPA_5_5][IPA_QMB_INSTANCE_DDR] =3D {16, 12, 0},
[IPA_5_5][IPA_QMB_INSTANCE_PCIE] =3D {16, 8, 0},

IPA_ENDPOINT_AP_LAN_RX:
        [IPA_5_5][IPA_CLIENT_APPS_LAN_CONS] =3D {
                        true, IPA_v5_5_GROUP_UL,
                        false,
                        IPA_DPS_HPS_SEQ_TYPE_INVALID,
                        QMB_MASTER_SELECT_DDR,
                        { 17, 14, 9, 9, IPA_EE_AP, GSI_ESCAPE_BUF_ONLY, 0  =
     },
                        IPA_TX_INSTANCE_UL },

IPA_ENDPOINT_AP_MODEM_RX:
        [IPA_5_5][IPA_CLIENT_APPS_WAN_CONS] =3D {
                        true, IPA_v5_5_GROUP_DL,
                        false,
                        IPA_DPS_HPS_SEQ_TYPE_INVALID,
                        QMB_MASTER_SELECT_DDR,
                        { 24, 1, 9, 9, IPA_EE_AP, GSI_SMART_PRE_FETCH, 3   =
     },
                        IPA_TX_INSTANCE_DL },

IPA_ENDPOINT_MODEM_AP_RX:
        [IPA_5_5][IPA_CLIENT_Q6_WAN_CONS]         =3D {
                        true, IPA_v5_5_GROUP_UL,
                        false,
                        IPA_DPS_HPS_SEQ_TYPE_INVALID,
                        QMB_MASTER_SELECT_DDR,
                        { 22, 7, 9, 9, IPA_EE_Q6, GSI_ESCAPE_BUF_ONLY, 0 },
                        IPA_TX_INSTANCE_UL },

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/net/ipa/data/ipa_data-v5.5.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/data/ipa_data-v5.5.c b/drivers/net/ipa/data/ip=
a_data-v5.5.c
index 741ae21d9d78..f6ba3b944700 100644
--- a/drivers/net/ipa/data/ipa_data-v5.5.c
+++ b/drivers/net/ipa/data/ipa_data-v5.5.c
@@ -50,13 +50,13 @@ enum ipa_rsrc_group_id {
 /* QSB configuration data for an SoC having IPA v5.5 */
 static const struct ipa_qsb_data ipa_qsb_data[] =3D {
 =09[IPA_QSB_MASTER_DDR] =3D {
-=09=09.max_writes=09=09=3D 0,=09/* Unlimited */
-=09=09.max_reads=09=09=3D 12,
+=09=09.max_writes=09=09=3D 12,
+=09=09.max_reads=09=09=3D 0,=09/* Unlimited */
 =09=09.max_reads_beats=09=3D 0,
 =09},
 =09[IPA_QSB_MASTER_PCIE] =3D {
-=09=09.max_writes=09=09=3D 0,=09/* Unlimited */
-=09=09.max_reads=09=09=3D 8,
+=09=09.max_writes=09=09=3D 8,
+=09=09.max_reads=09=09=3D 0,=09/* Unlimited */
 =09=09.max_reads_beats=09=3D 0,
 =09},
 };
@@ -86,8 +86,8 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpoin=
t_data[] =3D {
 =09},
 =09[IPA_ENDPOINT_AP_LAN_RX] =3D {
 =09=09.ee_id=09=09=3D GSI_EE_AP,
-=09=09.channel_id=09=3D 13,
-=09=09.endpoint_id=09=3D 16,
+=09=09.channel_id=09=3D 14,
+=09=09.endpoint_id=09=3D 17,
 =09=09.toward_ipa=09=3D false,
 =09=09.channel =3D {
 =09=09=09.tre_count=09=3D 256,
@@ -135,7 +135,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpo=
int_data[] =3D {
 =09[IPA_ENDPOINT_AP_MODEM_RX] =3D {
 =09=09.ee_id=09=09=3D GSI_EE_AP,
 =09=09.channel_id=09=3D 1,
-=09=09.endpoint_id=09=3D 23,
+=09=09.endpoint_id=09=3D 24,
 =09=09.toward_ipa=09=3D false,
 =09=09.channel =3D {
 =09=09=09.tre_count=09=3D 256,
@@ -168,7 +168,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpo=
int_data[] =3D {
 =09[IPA_ENDPOINT_MODEM_AP_RX] =3D {
 =09=09.ee_id=09=09=3D GSI_EE_MODEM,
 =09=09.channel_id=09=3D 7,
-=09=09.endpoint_id=09=3D 21,
+=09=09.endpoint_id=09=3D 22,
 =09=09.toward_ipa=09=3D false,
 =09},
 =09[IPA_ENDPOINT_MODEM_DL_NLO_TX] =3D {

--=20
2.53.0



