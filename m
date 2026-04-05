Return-Path: <linux-arm-msm+bounces-101872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MItnCkKc0mnGZAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 19:30:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBF39F2EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 19:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FD503005664
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 17:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B802BEFEE;
	Sun,  5 Apr 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="b9W1fboh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5E17D2;
	Sun,  5 Apr 2026 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775410238; cv=pass; b=fuursaOU4Ro/n10BpQN8kC6nMw58J3GU1TpfU/mLDGsIk2XJU7Qmi0Xk/tMj05+15XJ+g4MxquyG4bJ7duTfBXSD6J3KRc/EMqSCZCiBH8D7RbgJfoRSMCPt4nVRIC54wfLjI/y085/s8hYz15U8vfsUwLhXrLqIm63DHUGxO4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775410238; c=relaxed/simple;
	bh=tbUp5zFUpe1TTvoQKrxt+Nlmg9h/6PCCg1ziNfU842U=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Dapz03E5jqSOiXWaHD+GmechXt9+G9deiemOAsWwd82TrSwr2xKT0AJt+RIJujXQ0AnQplUCtV7U1nmVWWF0/aD5POHn6K4suSidDdVB3/cxZi7sFwoJLkjSap1EHBNIjNqK7hsIlofgQ+QxC6eZ8ynIMIlEXifV3hw1EAmCriQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=b9W1fboh; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 53B867E143E;
	Sun, 05 Apr 2026 16:52:24 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (100-96-162-172.trex-nlb.outbound.svc.cluster.local [100.96.162.172])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E08DE7E1510;
	Sun, 05 Apr 2026 16:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775407942;
	b=eE7n/QU8ho6sM4MEqI3cgOETFOQlddv/whEYwCK35JiKnhqijxJTkwFPq7TPOrUBP9H51N
	TEAvtlopz9glGM2xETd5V9pvl1f08nN3kbvV7tLswiXXbDLshXs9m4Z8ssE5UcBWgmaLo4
	HENQn/ZXQYQBme9YBz7MViNhd1aQU56yIDiioEDtVhyJGErmLJIXJdQagH9HLvCeoH2hf7
	xKuVgvv66ASmDCoKRjVNkBAN04cr5zMlY2cuh7aOZUl1S1QeHin7XZ1yw+7I7ix6+DJH6Z
	aCpquTQh8Ix23RtROXPWHO17Kudsn1lqPWHiotskX+pcuYuM/gMK3+OmqzXjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775407942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Df6meE+IzbisONhLxipM53ma1q9jZudZjiD3KFI5uHA=;
	b=UlVy0ltt+6xA/QPFENgzboh8O5fyBvCBpBtvvwOJoISOgGfT1GAmfzQTbEbQkclrpldQro
	b34rVYg8wsXQt51jOD74A3Ps6cdLUrsH4bs53Sqij6RzlchI86SOveCB8dCRSnZ6Xt3ZvD
	l3XsamVPyGvYnlNahG2MLsxpURtiswI75dIm6V0lRGZe7C+xzXnXJ+EALpVwE6qRs0c4v1
	bFJiUonA31LmXmCsbm0tSBCZXDTm7uwoNcZc41awBiO/b+y7+CI6mrWTKBoqM/8sLgZl4d
	fR1wmlOrvMpQzj+ZuY/uGsotI0j36xc0PZ+YoDdxJPcaB2uFfADxxoDdb6r53g==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-hcb2s;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Ruddy-Versed: 5634013042ce584c_1775407944239_2452233281
X-MC-Loop-Signature: 1775407944239:657969050
X-MC-Ingress-Time: 1775407944239
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.162.172 (trex/7.1.5);
	Sun, 05 Apr 2026 16:52:24 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fpdmD06b8z1xmj;
	Sun,  5 Apr 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775407938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Df6meE+IzbisONhLxipM53ma1q9jZudZjiD3KFI5uHA=;
	b=b9W1fboh58wU8MaoPwQmhw5OkHxXlFRvjOqsSXNkaoSEOfwmNbkV3tWzFFvJU25m9Yrgo9
	G1xtri1KyU5WiRER8xTN0wIGMfTKV54CJnTkZQOd+JD8OArivr3C7PZ9OgrTS2xB/VeeXn
	LsxSAOFs4IooRBAcBFQG4I42O5H8EcwHi2Xr+N+pqcDLORFn6PAoBFdXR3f5kffDJXAzL8
	G7Ti9NiyKAtvDKnX0cFXa4yu+Ajg4rXG+8WOl8Yzq6qGawtnU40ZO70b7Qcxu6LAhzgzh7
	iZuMKnC7/0CP2PadFiK+iNjvL15+r+w2APzUZEKkNfr+N5YA8GSXdZNv0wys2A==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v3 1/3] ARM: dts: qcom: pm8921: add labels for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-pm8xxx-xoadc-label-v3-1-9fe179c283ec@smankusors.com>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
In-Reply-To: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775407927; l=1924;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=tbUp5zFUpe1TTvoQKrxt+Nlmg9h/6PCCg1ziNfU842U=;
 b=2CqmTLbLhUfCILiV+IlIJs71ChZ3kOOD87rzW12xq20KPHQa+6DoDZz5twB26fQTBJJ8HsqbO
 UJ6W8V3kzLCB9cv+JdYLmbAYLv8eAZJO9cP0kh+qMpz8Yvr9VJv5MXA
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun,  5 Apr 2026 16:52:11 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69d29342 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=rt3x4hDEALvJiYIjBx4A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfA/IKxqvFQOP7VDXLiSMGTo4HyrkQk+du/KO39bBhGarA/AK25aYeKDBpSA2ULL45Fz2nGU3XgH/xXyqw9pTE3ESvoMMFzFyON1fbv6qjLFRW5tjZKCa eA3sAtIY9z0Ezshp11/vZxLzMI19i1FfxmVLMCJQQhU5sav9VgwNPEWbNxnjclZY0nBd+7xCo5qNHwn73crJ3gnDLA+MWOB8amPIwpFvubrA3VMsGN96jHO5 f56gJlqH9e/dU0zHdyVPztPXmg+TbrrTgMjiMXy8AzFa5rGwXP4s/+4E89iKxGicZP5ybHw458eoXxZq80Y3Fr1KSbBFESw+OYNEk8AS6bYW+TmTic+AJtd6 aT+jLU4Y5kVqtBOkQAjkDRR1GfaSygEEDYAWc3VS99/WBfPRLDINrwD+ZUrtK92AsS4OhZdqbVDlsvsXx4GwGa+o6mCLaCDL08DBO58A3yG4fYTyJZaQYX+A IPeRmIqLTJpRkKjm7sOws8Dd0NcrfIDqcXC4dsJD9wbXr0sLXc8yjTnos48RSKvgOEqK5XLYv+NBhYU9yPXuR8fygROwLtHd6N0kvjzOVnNAyYI89LazWo8q g9otrk34KXdB6OhXmUb4qw+6DCQswHIcROF5wl2XtAONVWzbahIM9YXL2Ja3JakqjtLy4rFwn2e0LW8P3+OgoVzmENrbXemCgJFyDmfxGHzz6iZujVa7PUKA xEgOCULNbC5PgBzyEHds0soienYpupLN2bUoJJ90v5hB+3W91OebsQ==
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101872-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CBBF39F2EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
device tree. This allows userspace and drivers to identify channels by
name rather than relying on datasheet name.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 535cb6a2543f69bc30abc89bff4e14a19147ce38..15246f4bd2672ccd4fc3359b66541d53d4da88b4 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -75,50 +75,62 @@ pm8921_xoadc: xoadc@197 {
 
 			vcoin: adc-channel@0 {
 				reg = <0x00 0x00>;
+				label = "vcoin";
 			};
 
 			vbat: adc-channel@1 {
 				reg = <0x00 0x01>;
+				label = "vbat";
 			};
 
 			dcin: adc-channel@2 {
 				reg = <0x00 0x02>;
+				label = "dcin";
 			};
 
 			vph_pwr: adc-channel@4 {
 				reg = <0x00 0x04>;
+				label = "vph_pwr";
 			};
 
 			batt_therm: adc-channel@8 {
 				reg = <0x00 0x08>;
+				label = "batt_therm";
 			};
 
 			batt_id: adc-channel@9 {
 				reg = <0x00 0x09>;
+				label = "batt_id";
 			};
 
 			usb_vbus: adc-channel@a {
 				reg = <0x00 0x0a>;
+				label = "usb_vbus";
 			};
 
 			die_temp: adc-channel@b {
 				reg = <0x00 0x0b>;
+				label = "die_temp";
 			};
 
 			ref_625mv: adc-channel@c {
 				reg = <0x00 0x0c>;
+				label = "ref_625mv";
 			};
 
 			ref_1250mv: adc-channel@d {
 				reg = <0x00 0x0d>;
+				label = "ref_1250mv";
 			};
 
 			chg_temp: adc-channel@e {
 				reg = <0x00 0x0e>;
+				label = "chg_temp";
 			};
 
 			ref_muxoff: adc-channel@f {
 				reg = <0x00 0x0f>;
+				label = "ref_muxoff";
 			};
 		};
 	};

-- 
2.34.1


