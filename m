Return-Path: <linux-arm-msm+bounces-94851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIJUB15ppWkaAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:41:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D19701D6B62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 284EB3036EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8A63328F7;
	Mon,  2 Mar 2026 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4naTIpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FA13314D0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447922; cv=none; b=DlAFyT1wjkTko8qzzu/dLnpYE1BJWqhBe+BukApTOiNH6vN2wdYi5ah9u+bTDsaSm3CgJM8jeSTjttn/0I9K2af/8KzCqr6QaabcePkMqULWqdmJfZBT0tWCKOI6jZfTCHbJuiQkdPB1SgKSdChe6s/QH6Wvou0RTZjj+a5Wylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447922; c=relaxed/simple;
	bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=MkWDX5jmUn59BmShLppHjGeC8rq43ZdIj+tx0wIdZ10+777ETSmRbdCbTYH6hW+QY+8o8mJORFhhmQNrfuua/JI/NtkCGggNSjZlaqJqekXxp/a6YHCgkGmnLV5X/7CWXcwFDM+rYhiJZZMPsjH7u/iODFfj+sikEuYIuKCQ/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4naTIpw; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3870dec27f4so4979391fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772447919; x=1773052719; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
        b=N4naTIpwcuC/qx5sfNFTxitY68Caq14zq82+r0fa4bspB+RVdfAkTmN1qL/74nlshO
         mPnbQK9OXtyqewDgg0ffLhxkkLEOvtM6TyHdesDRA2nceA6I43RCI7SDQRIxIEso2+qi
         Q4rlDkYmAsvIhjc4YMpAbU84RSQt/ZofK0kiEef++PK4VkNbkU+stXzKWCSihkdDDSfb
         UjQ2izI7vQbm14WiqniUM5cBLxgl51H2wM0VXtVn5EW4nsPtPqTF5y169vDimbIYbs6x
         sf0n6+NQCmYA6xXxxLcsnmY21g7rzxKAgrsHXNqrqxVwnSjMFuvJ7eYdvutr0UKxT/C+
         3TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447919; x=1773052719;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
        b=qTQq9l6gf5Q6z617xjYYky/pqSI32iN5k/SRx5rSYU8lXVSueUFNxEvdNlxPW0xKQg
         novW/ioM6yXFL0gm8AKkXE5gWY7sxIk/umqwCX24n+m7i+Xk2B8DB5375dePtc3V87+x
         WZaM+wxEQUwg436mc0it3qiyI+lroSUyCmcb1jUmFYlC59CdIu0S0FJU3rpbM447xRO5
         oeAxzxWqazF1NBXwdV7kfKevzOu/ONn6op2jCUb7ARPMKhpwKHd14i0CRmiR/4/KkPF6
         +GYWk6+9pLGSchAppgKDNny7rErmo2gCr5mTt5cIF3SnxF43bOQikX3yKjXoduQeDZAv
         Eqkg==
X-Forwarded-Encrypted: i=1; AJvYcCVdYFDiIUDgulnZxryGHNGETj+MlKdqoeGb40xxxgnFpiOxtCzDBgckQdXjK8FbMNgoUuBoz9wEJb56KCnd@vger.kernel.org
X-Gm-Message-State: AOJu0YwuOBDbIidLFmzEwTZhb1YcQK7D0w6bg/H2CDifGni5HILWucms
	ItdnhBgHvbOA+P66Z94P8dRtgcVHnvj6yHiHFcMqA/w56V2c5feVztwj
X-Gm-Gg: ATEYQzxP/t7gNm2EgLPuImWX95IuDTLpVBu+vrKgRTMPEhOXSuBK8EH5+peSh/HogVo
	wkDqfn8SWbZR2zWRsQCYON4FpRCYrExHJdXTZta/JAZJZaE/Gm+AiGvaMOhYPB1NHsI9HYjiHa2
	5nCIcVlO+cnIr4VrHlm6XuupBdjxqTQcPICD7rkb3Nv4XmLKIfYiW5cAxernBZIR1qpuCeVQSjk
	3eozp9bsuhTBDIYifvIkua0NxpRwuOhCe82uZZY/zscZiLh5HwdqVX9JNBXpCS9ZWxM4j/6TTwn
	zUlhpnqRfP1lUKoBpCdqV4SyjNa6gVLm2aYxvGqfzTHnEGjUC+elsuTXpsOq3tjW12kQJ+2lR+X
	TdGYOJ9TqYD+o2dYIXVcQSWtpj7q2gPRM+A0LspTHhV7Nom87L1DA7+CjrQDDZkolzPeh1+oTJp
	JHnlQ1jj9Kml25Rz9UcVK2sDXNhlaX63ph9yFnO3GDEL4p/MVeRJ33oDkIVVdXa1fCbKdHKqNRI
	g0lR2JP1hzB
X-Received: by 2002:a2e:b018:0:b0:37f:d9ba:747 with SMTP id 38308e7fff4ca-389f1d73cecmr67253571fa.5.1772447918848;
        Mon, 02 Mar 2026 02:38:38 -0800 (PST)
Received: from smtpclient.apple (mobile-access-2e8433-189.dhcp.inet.fi. [46.132.51.189])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116de019esm1424664e87.3.2026.03.02.02.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:38:38 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Kalle Niemi <kaleposti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node through the adapter struct
Message-Id: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
Date: Mon, 2 Mar 2026 12:38:27 +0200
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Branden Scott <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: iPhone Mail (23D127)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94851-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaleposti@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D19701D6B62
X-Rspamd-Action: no action

=EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> w=
rote:
>> On 2/23/26 11:05, Bartosz Golaszewski wrote:
>>> In order to stop i2c bus drivers from dereferencing the struct device
>>> embedded in struct i2c_adapter, let's allow configuring the parent
>>> device and OF-node of the adapter directly through dedicated fields.
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>>> ---
>> Hello,
>> Automated driver test system bisected this commit to be the first bad
>> commit, linux-next next-20260227 was tested. Failed tests include driver
>> tests for ROHM PMIC and accelerometers, which are connected to
>> BeagleBone Black.
>> The failed driver tests all fail to first i2cget and the tests stop
>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or
>> directory".
> Wolfram: well, now it would actually be useful to know which commit
> exactly is the culprit so maybe splitting the changes is not a bad
> idea after all.
> Kalle: which i2c bus driver fails here? Any errors in kernel log?
> Bart

Hello Bart,

i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log. I=
 got two failures without the dmesg available (this is bugged test sequence,=
 and not a kernel crash), but those got the same stdout message "Could not o=
pen file ...." as all others.

-Kalle

