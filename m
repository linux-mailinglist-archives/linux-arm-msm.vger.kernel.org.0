Return-Path: <linux-arm-msm+bounces-96675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHUOMGgnsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486E25197C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BE71342953D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50D73AB269;
	Tue, 10 Mar 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OoK0N5Yk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED653A75A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149342; cv=none; b=pqTRth4CGuQNfXktc4ijbzPRm24rqvrCHqPi6JWHJehd0RKbJtsaV5YAD+i3bH3lvlS0jQwNM3sf9XmJWw3zErne+QLtGRpc25a+UJ8hDXYeFCdBF0uvXyVVFzJBuwFU5h3fgHtvR5tZrx1H7C7ejrqYzkvc4rqD+mW0YZt8SQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149342; c=relaxed/simple;
	bh=MxLH9HOJAo2vgJWO0wXZjkSCDdY3gjegU3+RSMDwagI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ap7jAHXba6IiC009TxGreoByK6WLSnAXmp9b+N90H/Cyhtuyt1kuqKu5OLZXwR5Ra5gjZL6TchpDmZuCHHQiVPGVk4C6K9SpU7jOWGH6Fh5BgEh8c0xtaw+wWnSTFCy9ZYPmrYeIN//XPNemUg443CYUiUF/lrlc5xG1iFKMABk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OoK0N5Yk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so31510755e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773149340; x=1773754140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SlnpmqE+7GX79FgiT2u7obzSde1J7itNg26O/QF5e8=;
        b=OoK0N5YkGJylfvpDaSSmWdJiqhlxssjXyN7O5BrZSvPAg4vUF8yD29RuMTBJszanty
         2IY62O7dyh/2vIiW8lr+KKG8St6jT8eYIt5IfecFpEXd1xhj00a15LftVytRF+LKql1X
         zOxvTzM7k2sN5NwP4Y9/u1fGzoRQlj0I8kpJNOHfXysGcZ5ixEUOhCcP5hySEsUr2kkI
         //EPZ4tJK5CwBPDkD0vEHYMZgLt90pJA9Ux5SO1j2EhQTReeoJys+4GPx9OmlLOIYQhU
         cqngegPWUA7NJuQjyRUtvijtucp70BxxJNt7c2P8B8YuabPy+rSVNt6xx7kht6X9zTio
         00/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149340; x=1773754140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SlnpmqE+7GX79FgiT2u7obzSde1J7itNg26O/QF5e8=;
        b=P+F+XAd2l7xrUZyjnFy7r9Yj72cmSbQ0yfPumr7Wy+tctIpjTQ1rAMFUj3KA2j6fRN
         +fcjnWzJgz9n4oUUTHLPbhVlMAcs/cDoZJz3Fmkmq5GXkxfmxrkkhbXZk53uqSnQvNcS
         s4I1STd/d11BTlvbLzq/3rV/ZFOCfMqLT5Z3u8BCt17UG1Eg9KTM1azoHcDCpE5Z8SPO
         rey4Emsm215MneLWvLlGo9bkqpDLBkSus7PXkw/SVomnHCg+R+iYk3OyCEiz/M4lhtEV
         24bF3+O9NU/p9G5FxtiJ/OnagN67Lull1M1twDyKpmWaeMETUjrowvYZ48MpPyMMLE2p
         imoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXybtuPzDXEC62V1X1m+KIsRcfH1aOdmbpDQDDmcUMfwBHyMKdpIKSLxTbAOAkgTkovRaFvwxG9YotQLUzr@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcgpqu8PDqROyyO8bM3d0gZePNNZbbd3qKVI6JGbhoSETu+zD
	B51rVerApjZAHnwFOCsTI3uo5Cyl8+aD2VxXQLa054IYBgeEipa9beFRMfCRcNR9G04=
X-Gm-Gg: ATEYQzxi48WSefiuVrD2pQ8PcsIr/UOLvMa7A+z3YDMwadwYdQhMFABN2i+wJcasr+w
	H1nR4FdhYPtySk9LQNyeUeaVxS9rwGPj+UAs6gCkopNDXH0uP+uFKYhv0vAB2bB4NxNcrydLo8o
	D0k3C1unxaKcHmjfEaO9XhPvUb4k+oEEPYZ3IBABMf8xeGkZNhmjXVuiX+IQUT3APr+JqF4gcNv
	deY2sQoVtQZcfjBgdV7+ATn7tmMvaNtqNGFbcVT+woN94mdjkSahDhfKERQeOMPp2PgXR80ZFSq
	18QO7uM+yrmOK/Jmkxq8mQif84e0tI7JbQbBu1kJFT/RRtesq0Y1XhM/T08VP+F0rqW+CXlpTp0
	lxWkIvZGDXWD9E/1nVrDso8D0+zyC2k9VbsA3zHrmVv0HqhSQvbJocVQAJxXg1sNNRiQ8SL5heW
	beyQzp5VPEPJas0x/0Xxe/irxSN2QnRmYEqtyuFefLPX7H
X-Received: by 2002:a05:600c:350e:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-48526916bafmr228566465e9.3.1773149339840;
        Tue, 10 Mar 2026 06:28:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm132464235e9.10.2026.03.10.06.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:28:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Richard Acayan <mailingradian@gmail.com>
Cc: Yifei Zhan <yifei@zhan.science>
In-Reply-To: <20260310002606.16413-1-mailingradian@gmail.com>
References: <20260310002606.16413-1-mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v3 0/5] Support for the Pixel 3a XL with the
 Tianma panel
Message-Id: <177314933906.2052605.4793016196479634687.b4-ty@linaro.org>
Date: Tue, 10 Mar 2026 14:28:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 3486E25197C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96675-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

Hi,

On Mon, 09 Mar 2026 20:26:01 -0400, Richard Acayan wrote:
> This expands Pixel 3a support to the Pixel 3a XL, starting with one of
> the panel variants. The Pixel 3a XL has two variants with panels from
> Samsung or from Tianma/Novatek.
> 
> This series depends on the IMX355 front camera devicetree patches
> (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: arm: qcom: document google,bonito-tianma board
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8bcf6264b73f5cfa24e734c0027a69f207e26445
[2/5] dt-bindings: panel-simple-dsi: add nt37700f compatible
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e0102c94ec12640a6b66037adc6e9ae5c9c0dc27
[3/5] drm/panel: Add Novatek/Tianma NT37700F panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2db443036fe9daf170e5919face475307d486641

-- 
Neil


