Return-Path: <linux-arm-msm+bounces-114746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ymiRIwmbQGpOggkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 05:54:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A96D30E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 05:54:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114746-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114746-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC48F3021B0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 03:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487BD246BD6;
	Sun, 28 Jun 2026 03:53:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3608223EA8B;
	Sun, 28 Jun 2026 03:53:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782618795; cv=none; b=qawnEsF2R8lVwvMZoKBFs9j9XzhAyw80qxyNB2RSdEkr27B7IKPNqDfn05xZAIjenO9IGClvCiS/qUMK/q0wx2pMs5fcLihjVMeVELd4/fLA+0IomtAEEjst4aIPfbVwc50QVkqaB9bZV6yqOVqj2oxbguwz8kz+hoe3fogSM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782618795; c=relaxed/simple;
	bh=4l+wqMths9Y6tGgCRMV3bKormV2+6aG8+Oz82kG8SW0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kMzy3IsX5Rij1+XyNLZf0q4Xk4gA6kjmCKbwR8r8jAcMvs9YC5yQ9AIdqqPyuwKSAM2xKK27H9ZJx9mGyvINZrRbVPhDcFt7+dhB9MgRI2EsHiPc/k7TlXs3stSwvDsWqBZdXJG1npWW5dTg6SGaVuqdz52AEDpDR+DsFiXkg0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Received: from smtpclient.apple (unknown [117.182.74.7])
	by APP-01 (Coremail) with SMTP id qwCowAA33NRbmkBqExKqAw--.34181S6;
	Sun, 28 Jun 2026 11:53:08 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] fix: accel/qaic: qaic_attach_slice_bo_ioctl: success path
 missing   drm_gem_object_put
From: WenTao Liang <vulab@iscas.ac.cn>
In-Reply-To: <20260626114359.32938-1-vulab@iscas.ac.cn>
Date: Sun, 28 Jun 2026 11:52:58 +0800
Cc: carl.vanderlip@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3CC7319B-899B-42C4-AA98-729288B9E95D@iscas.ac.cn>
References: <20260626114359.32938-1-vulab@iscas.ac.cn>
To: jeff.hugo@oss.qualcomm.com,
 ogabbay@kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CM-TRANSID:qwCowAA33NRbmkBqExKqAw--.34181S6
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4xKF4xGF18JFW3Xw4UCFg_yoW8GF45pr
	WagFW7trZ8XrWUKrW2vr1DWFyjkw1Y93yUKayrA34S9rnYgFyUZa45WFZ8XFn3try7CFZ0
	qr1jv3ZYg3W2ya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBlb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E
	87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8geOJUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwAMA2pAixEZagAAsL
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114746-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:carl.vanderlip@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E30A96D30E9



> 2026=E5=B9=B46=E6=9C=8826=E6=97=A5 19:43=EF=BC=8CWenTao Liang =
<vulab@iscas.ac.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> drm_gem_object_lookup() acquires a GEM object reference on success. =
All
>  error paths correctly release it via put_bo, but the success path =
returns
>  without calling drm_gem_object_put(obj). Since list_add_tail does not
>  transfer ownership, the GEM object reference is permanently leaked on
>  each successful call.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 75af0a585af9 ("accel/qaic: Grab ch_lock during =
QAIC_ATTACH_SLICE_BO")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---
> drivers/accel/qaic/qaic_data.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/accel/qaic/qaic_data.c =
b/drivers/accel/qaic/qaic_data.c
> index 1e4c579d2725..b17df7bf565d 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -1084,6 +1084,7 @@ int qaic_attach_slice_bo_ioctl(struct drm_device =
*dev, void *data, struct drm_fi
>=20
> 	bo->sliced =3D true;
> 	list_add_tail(&bo->bo_list, &bo->dbc->bo_lists);
> +	drm_gem_object_put(obj);
> 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
> 	mutex_unlock(&bo->lock);
> 	kfree(slice_ent);
> --=20
> 2.39.5 (Apple Git-154)

Please ignore this patch. I will resend a proper version after
learning the kernel submission process.

Apologies for the noise.

Best regards,
WenTao Liang=


