Return-Path: <linux-arm-msm+bounces-104893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKH9IaRp8GkOTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:02:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF547F894
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B5CE314543A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279A63A0E8E;
	Tue, 28 Apr 2026 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exdndTXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A76346E5A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361938; cv=none; b=EYgf8Cyr6RO+YJu0I/e90icF/cayiAg4zIEWbT5wePVCCv1yZVWFxHusWfi0FRdxOo+0YmgK5MWGKWyadvomJhY9jLqH73aUihbdY5h2NTXfLU8lFskoH069S/7CadKUYYWLADAm7rRHvM9WByJwF8LUbTeXC+AMUNySYt8VamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361938; c=relaxed/simple;
	bh=M8+6UnX+4lN+I7hSH5w2HlitnXoe39zLUp85i19lW4k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpCt/9rR/lPdb72C+/ry92vxt7tzW9YruSZsTdXtdzeXPxQ32kTkbhbkyEp6hc2OifAXHgGPv5mn91OcYuQnkmC2N0Gk95PNH26WHgoW58zXIRFv+8FjnJUJn2gonXOeRlEGccwChOa3hhaECYDGPABOAVeArHOD/G8aqxpGTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exdndTXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8456C2BCC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361937;
	bh=M8+6UnX+4lN+I7hSH5w2HlitnXoe39zLUp85i19lW4k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=exdndTXlRxThyJGPMZoGsrhIEXUARtyMvIjuf8op8WGky70Fh1CYQMazkjhVRT8Mh
	 wfx5U+58ChM4CAl1f/qOYKYgrHhAtnnMOvXqLIzDxW534t1c5vFoCjVwOmEwg2Wa8D
	 yW7geuXxgP/f9U2CiRDbXT+9WLp8ITQKYRubNXdx1DdRouyx7Xck4x1RCoU+Yc3R/a
	 EKukhLU4h9yNp4cu6QO68X4VOFvzQtojmKBsxMiE3LCL8owm6/PfgfAqg/lVN3VyTn
	 v6puGg+NRDEE/X4FaEAfmuLzBFLIvVLd/vEeni0dgKX8zPpsO1imHMsX+8no+Yj7XJ
	 1DhvG2hQOD+LA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso2105333e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:38:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hgGDQ+4PksRA4yFMCrOp9A4zPTrd4XClWiXHRU8vSyluNeVZobTKtOUVIKWa+2daoa42XguSksHqymSjy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84p9oQeH6+ANsasS6T9dbYWga/XQ17ctU6/54LEUTuLilqsDt
	aCgIf82uCT/LMLia4nrYYUoqj1VEvicDU54qBmcd89eA81CzyLam5u0rq8uFSl3iPeoTMKGbabV
	Z6u5dx7FroW9a2HttKMUxchSMg2V94nhLs43/bSxzqQ==
X-Received: by 2002:a05:6512:3f12:b0:5a4:17a6:9780 with SMTP id
 2adb3069b0e04-5a74660a971mr759395e87.14.1777361936359; Tue, 28 Apr 2026
 00:38:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:38:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:38:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-2-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-2-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:38:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=MevqR=ST_-WO_CAUc7stKmQU=_Qp7BTrewzvg40x=JiLw@mail.gmail.com>
X-Gm-Features: AVHnY4IrhreEwlQ0Dtd2BuvGIlLYNK7-acJ0gJkWUG1j_5wLe4XWVKLYqD4Vmhg
Message-ID: <CAMRc=MevqR=ST_-WO_CAUc7stKmQU=_Qp7BTrewzvg40x=JiLw@mail.gmail.com>
Subject: Re: [PATCH v21 02/13] power: reset: reboot-mode: Add support for 64
 bit magic
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7EBF547F894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104893-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,collabora.com,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 27 Apr 2026 19:34:42 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation =E2=80=93 reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
>
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate up-to two 32-bit arguments in below format.
> |    Higher 32 bit  |   Lower 32 bit    |
> |	 arg2	    | 	    arg1	|
>
> Update current reboot-mode drivers for 64-bit magic.
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

