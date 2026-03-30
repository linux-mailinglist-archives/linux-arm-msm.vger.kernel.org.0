Return-Path: <linux-arm-msm+bounces-100703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH2PJko3ymlf6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:41:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCCE3575D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC699300AED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAF83ACEEB;
	Mon, 30 Mar 2026 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pqvq+vPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8935DA60
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860100; cv=none; b=PSjZ6jWl5t6JHqr08JSVtxGCfO7Rp2f91Is5faDOLL2s++h+eBLBIxs45xVLpD9QortTyxctSdeiXg2Zhq28vFBOw80vimjXgJyV8glVgAie8weTk1dbo14j/2Os7hFsg5G7o6kZpuXysOkstnYerKI7QCJdRCUM31C7yDKmhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860100; c=relaxed/simple;
	bh=U65ecWQ+3ujXzMrR7VLh3CQsmZsimsxLPg76iZzYBzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0V8CULZT9RteNs/OjNmdw+G4wSLsKmpAuougybTUZqB5vw916cmZuZX8YS3GFy7/mpU5TMRdHOwoAYf8odWfk/NTK/zU5a4og25PxP6c/+CxsV2xYNhHCG2nFKW7wI/QUDXNpF2I0niqCMbwEOj/wYZ4WJWCamTBUr4Ds9Qnek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pqvq+vPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E566C2BCB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774860100;
	bh=U65ecWQ+3ujXzMrR7VLh3CQsmZsimsxLPg76iZzYBzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pqvq+vPFesaGqGy/NxqSOAD9wHCB0HlLC1YlzTya2Jb38BUrfffS6UMn5Ukr6bUsX
	 Wh2AAaiXckMEJhy4X/SxOTfiogpdk8H5EeHvg5LkOVlQ85mWQGHsp5CV6p09wGD/uG
	 NBPs0IeQlyVwIN2HbEvkbbGkc5s7ycBXTpMqW7FzZ5ZJC2H50MerOdSLohTJ4Lmf85
	 FmRVriLnSvkYxVbyyeewlnM0a0lzHYUztD2kvQhWZn2J0gtrZePDnHGgA6X4fP4I7G
	 VxBhVmjPNgeK6Z/YFWTHHm9+GZCsNa24cGLKH77lTih+8XIDu53h70/pagOlSH5tVB
	 /V5zGfdYuLTOg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64d5a7926cfso5355352d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZjeR/44vnfbQuQxpQCIwuZOcXblbDKdNMGM9si9oIzQ/6VDpXtA2RaG7FIWObMUW4rzh3zGOsAGjvO8tW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWG4yFFHcOj6VBwiLwAKENk7SDFFqh1H3OHXiSP0AeQODTIEol
	YN17+PRp8Nis30BFn6c3j9M8ZIxBxCpRc64m+JK0wmjS68HcH1oy/JVb6z0Ao61deHWnJdGUCZ+
	fYw21ALssQpsXn504shiIwW72EFmPGL4=
X-Received: by 2002:a05:690c:e3c2:b0:79a:38a2:d8d4 with SMTP id
 00721157ae682-79bde08102dmr105999037b3.49.1774860099355; Mon, 30 Mar 2026
 01:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
In-Reply-To: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:41:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
X-Gm-Features: AQROBzDQ1t8tN43D-xspmwcX9PnTM3JQeCI6HGzVWZcFXP0APaCShoghCa3Gw98
Message-ID: <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100703-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DCCE3575D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 6:51=E2=80=AFAM Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:

> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
> Add the pinctrl support for the same.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualc=
omm.com>

Patches applied!

Yours,
Linus Walleij

