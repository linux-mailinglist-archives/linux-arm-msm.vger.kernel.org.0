Return-Path: <linux-arm-msm+bounces-92060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA1kHMsFhmkRJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:16:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B88FF9B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E3B130666F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597C12848B2;
	Fri,  6 Feb 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3vUzNgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171F284B25
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390784; cv=none; b=t4SXPSU6CNWuhAg1zzQrEjvtnGwMh4z6wV0sV5W2yXlTnvL+QhicYpl09sGXyNGe4meHCD6IwCVOClmeUVMKqCwM0FTpURq/5JhAabbmRpf4ewDOF5wP6g2jK5zQde2GfaKaswaNlHGNSxH9BUrMT9wmZHO6N4VPf7WLrdiGe9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390784; c=relaxed/simple;
	bh=xjOVDKT/gqOUJFAfsyaZBX7X9mW0mQLPkR+mW2ZCvqI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flfuBpZO6T8v2le7sHkFjA/Tyitua9BcHqWoA8ZkbuWKuazNv6nN/kOJcSnahJZnO8ZhL83L342nKQdfJDqUQ/0CYBbtrAXohdToNMfKtWxFiL18iP+f55VzhgKOblYA3OTeWTCZgaous8CkpbiSR0GqJp23RIF/9vAx/YiMSLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3vUzNgI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C63C2BCB3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770390783;
	bh=xjOVDKT/gqOUJFAfsyaZBX7X9mW0mQLPkR+mW2ZCvqI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=b3vUzNgIAtOaZZf05U3bggBD32H6RnAUcP6ZjyLLeqZB9x7ltvEZJvDWvBxDYqcgx
	 p/4DoZ/enUHDfrD5U96usZ2AHUWk9QGorP+XaROP9J6qVqK9vcuaXDydqfXgbbiMNx
	 nJ1uocRdlngudeiHcAS9zR0eCQbNDW51/E9yqJpoF5B9NQZau0LecdPA4fE8UU9bk5
	 upuauK/WXN14JD4KHbfEedOtRAa4JLV++JIy3QPNBeKnNAnJhoqLPx7ssb0TCYjYAQ
	 DFlFMYJqDbFd4TEnTwJpogeUyGcRyCRuYn/CP3YMkxf6MwUJBATRt5JTM2GLAl5jbN
	 QPqoBfLiPZBxA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-385baa8afaaso20288611fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 07:13:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/JEpGRk066uhkZCDOx7a2DHNlsprXuWlaUyAjCA3ABAteZN7EW1SYEkq+kjBNwfHFoRBLcFhFcUWYKUVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMSz6rx5P1Mv70zc/nvzONYxZRQf9RHE6dagkiYdGnLU1lxQK
	rkXJezVnGRpiEsWWQ8fL5Hmb0IfJmZXRERiMHlOknyIUwprHkSPftMpq3mPLYcYJEG/hTjY0QRK
	eiX+5JMH+yG6yNpzbk1j+J1elMgHr+dpGNY9WkkbMZA==
X-Received: by 2002:a2e:be0d:0:b0:383:1c5f:84c7 with SMTP id
 38308e7fff4ca-386b68180fbmr9558811fa.12.1770390782264; Fri, 06 Feb 2026
 07:13:02 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Feb 2026 07:13:00 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Feb 2026 07:13:00 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-2-5b79c5d61a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-2-5b79c5d61a03@linaro.org>
Date: Fri, 6 Feb 2026 07:13:00 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdkPZQOze=A_orwCLRpu5s=GA=HOvSjpU72o-p3BhREdQ@mail.gmail.com>
X-Gm-Features: AZwV_QjSWizfT3josb5AhWS6l_uEgzoWQTjoTt1Hi3foFihUPkEQ01zIgsoa2yQ
Message-ID: <CAMRc=MdkPZQOze=A_orwCLRpu5s=GA=HOvSjpU72o-p3BhREdQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] pci: pwrctrl: slot: fix dev_err_probe() usage
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92060-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,linaro.org:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0B88FF9B0
X-Rspamd-Action: no action

On Fri, 6 Feb 2026 15:50:30 +0100, Neil Armstrong
<neil.armstrong@linaro.org> said:
> The code was not returning dev_err_probe() but dev_err_probe()
> returns the error code, so simplify the code.
>
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

