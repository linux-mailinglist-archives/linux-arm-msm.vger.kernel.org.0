Return-Path: <linux-arm-msm+bounces-112950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y4QjKAQaLGrALQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 16:39:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE667A419
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 16:39:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=nD3x6+aw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112950-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112950-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 809983153567
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD6335E1C3;
	Fri, 12 Jun 2026 14:33:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ACC365A13
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 14:33:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274798; cv=none; b=sNHVP5Iv57OPzO/AXDGS9DEm91s2Dft5WYx3MkrB6n6GILxyVnbcqWFzWk+1q8uu1HHfk80DAkXWGrJWSqteVxpB02v/qpqg8bUVHSebHZCttaYAKube7368yWqIWffkmqtZqwkQO4sK/AEnVRcKBe9QZrUyVv5hylti7uECL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274798; c=relaxed/simple;
	bh=tMuFqRJtSjW/BtSIGP7fEghEyWX1qeHJdf7t1D8fGrc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=i0rk7QiAmN/ZjmSsfUe95FU0E6dLrB3dHBVTRGoIo3JQ6eG1mw4MNwl4VBOV42eBZz2glJlfnv4CHTPpxmyIIudk2s5jzgoNikGQTtWHBWCJCtuadneYii1J0WJCGuwv6FBEGXf8i2UzerkrZ0Wbemi/UC6QeuTCjQwlZNhCOcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nD3x6+aw; arc=none smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bdb3fd39045so158144766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781274795; x=1781879595; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=;
        b=nD3x6+awdWyy26Ksyt968dbDCZ8Qpn3bIemKFD9LS0X1++6tQ7bvece/nKWDtBtsuh
         hAt6hwlxDXWWafeDGCRENBNqbLHjOh/UNwv0iLHubDlDHbuq5QHbFLd0g3YOecbEEs5I
         K7WfYomB0W/2J/mgxj1vAVocYnyhyZVMWWhwhtT0c8FKb+T8jguBpLQaIapdJ5+o7LU+
         r1cfWuq1CBr16kFmSjod5ZToTQWKHsIQA6TdalfCugDvV5kqpRY+UjM9KJF0m63Pigrl
         D3QZhb+LfppCTRo+aeuXi4ulSWlnv0K5lEHr/TYiamrkbCpwsB9qihEdl7/XTxmeJhiu
         MyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274795; x=1781879595;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=;
        b=WtogQqsAQDb1bFB++DfWcza8ei378lRm9tX0TW+iozO0iQDahBYmJ8GLXJ/8gbrHco
         d/FDY6BfR+jCuiz0l5arxmWXotSI5kHlCaVK0hoc8cTzxbyelqo5w/3C2slHIa38gXP7
         3ncnFxnmTLFWNS+I9Ys2PTiXY6TkFfw1NQdQ6PH+2IX9k+U8aJAeHc/0lRXI3GaXnZQ2
         xFij0NHWRMbPfH+jyqgvmhAJNdpObmcq8UVB+FHyoeKMmQfal2/Hv90TM6VQ80kEbnce
         zlztAvIxAmmd9A6PM9hX4SEz34DZ80myciSe3jnWvDglQMR1oSyw66v2uWi7A73yjKF9
         g9tQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+b8q8WA5IQHAFPCBbWt6gWSNSZSSz2NurOWru+79+IhJsZ80vfgm/8TRbqUVCtaPWr/bEpnS17vRTkRGw@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcTodFBucRJjCwcqanG8KsuNApbSlAeqg53J/oYLbweF3l57H
	66YV5h+2WeV9q+y/sNTHYPMhNoWuUPk7nN9kYDr1Jq5nOWIZlOwQgT67v8GDIYVb04A=
X-Gm-Gg: Acq92OEb43Fsr4WmanXZmYjZVfVRwsnE8k1JAq/CkRXyt0I5twmQQU+H8PgdFQUc6G/
	Pi8hYGWbIhKi+7iXFeQxzqTGDd4JKaX2+FerLJ/7X8c4xoKZfTpJxLqWbLr9RD8/D9pnORh4TBx
	9xRHevPeHXl7+0C/Yqk00TmUf3DM+j2xMvJp1Q90sOSxSM20nSu+maqrlp3YQH3VaUwCBw/IyhA
	IBDMq/kytoZCZhhWriZkQeYa67S2ni0kvwiAh6Ww8rt7HqmQzrfmJISqt+FtEpnCyC/+H18+09b
	SUwvfRX7wrtm+L4UUwASB+133HzkDii9o6+XgIlfrH5LcWgWK1GdMN/0yGN+8oRU6Xb0Bq6+7MP
	cFU2QGBmyz/V841uqWM1K7PF/r8HtwfUq/vec8/SlvShjMPnkcaWXsgljTf61jZpvA6PXFkZWIk
	xP9d1Ys6uSncoM5E1DEvQGYfjCeC2ZW6G/vtrAm/mvUSdwKK/jWGxXQfR/TXIa9E1yqb3vmwO13
	zGpOjZIZzJ6Nxm6/zFNT6deL9MokuMfv2WDCw==
X-Received: by 2002:a17:907:9994:b0:beb:bf23:ac78 with SMTP id a640c23a62f3a-bfe2aefcebcmr149500366b.44.1781274795114;
        Fri, 12 Jun 2026 07:33:15 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b32308sm110137366b.19.2026.06.12.07.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 16:33:13 +0200
Message-Id: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alexander Koskovich"
 <AKoskovich@pm.me>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt:
 Document WCN6755 Bluetooth
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112950-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:AKoskovich@pm.me,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CDE667A419

Hi Luiz,

On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.

Could you please pick up this patch (or provide an Ack if you want Bjorn
to pick this up with the rest of the series).

Regards
Luca

>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++=
++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750=
-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.=
yaml
> index 8606a45ac9b9..79522409d709 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yam=
l
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yam=
l
> @@ -12,8 +12,14 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - qcom,wcn6750-bt
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,wcn6755-bt
> +          - const: qcom,wcn6750-bt
> +
> +      - enum:
> +          - qcom,wcn6750-bt
> =20
>    enable-gpios:
>      maxItems: 1


