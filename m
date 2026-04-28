Return-Path: <linux-arm-msm+bounces-105088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML29HbAx8WkgegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 00:16:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6848C835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 00:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE6323016FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A72935CB66;
	Tue, 28 Apr 2026 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+Y0enTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E52F12AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414561; cv=none; b=Hvkc/WnB00YLGYHOfK8N4ImlueH3YJwjLlMYbj5wbfj5fBnKCeFmj0MkgQSU4ycr1sQew8CoA/iAsmv4QkC6qaMKWRaFa2KMhc9XUdEloL3aACwqgDJRWV7OCysO9J1jTjkfj544O871HwbUt2kn1WWi5qZEDdQoKg+B9QJyj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414561; c=relaxed/simple;
	bh=YRXa3SqUBnSgR/YtBhUZuZAmwoEQPel0vDrvl4dz9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7kjZah38E9WQZ7WbuWixEj96YsZv03lMPV7sgdFckdvBdE8yOoxWfviTEXlK99GiUFLTxOhvAoPYt+Q0KvI8VQLjscVBWDD6boPJxpFrbBevS0MkbYx+CaHSkAI9YkmuXrUOXT8SXGvb4/lxFbtipKyj8ynwhuCT0GRVzASWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d+Y0enTr; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2e221a71e19so12019713eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777414559; x=1778019359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=d+Y0enTrpOWWO4xe6U18GjzzSoS5d9ADQxWLx11uyITMLza3yHptDlg2sE56m8dVYy
         317JgmmSPSDR7cKxiClEijzpIBcWaCGgtktww5s9izwLd5o+5QgZCHaoWR9vVxxS/38L
         PoBaaYo9p32j6CN00g6p2Cq4ctKqOJDZODjPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777414559; x=1778019359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=HRtJjX0dJ8VUxVZVSSj5GpxO4Pi0sIouusUd8gBG2LkI3Bjz3PO8o/xPwyyAoEAzX/
         geHBwblYZOzbWNWtHttNBIhgJzQOpm1ZhV0QRQxP76ygkNpt2Zam4k0ill9dOqE/S0EJ
         xNlj3CdOSaKMK3Ur4986mzT0zo1LSNftR+j9l59Brhuwi/8I7H8W+9hHgmdBhQz7vURX
         fSk0gGIVWFXPgfANF0gnVVwU75mqcDI0lTXRRqLiNss5b5URD0O9P9jDbmXUhOKZ7Gzc
         r6EIjW6U1El8sA1nPQET1YFwyvPiI3k0BZsBTOXXZhKpt5q29vD7bc+ZUhRb7vpl4Y+T
         YdcA==
X-Forwarded-Encrypted: i=1; AFNElJ9TnhkZte9rFzOuFrIUGOfqya9Ba3xVhjBN06YiyWVGExmbp+CVsUEgqRs9es82QrkXSJfjsMxFNcqO/avg@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVB/mtu9mDtbeaUBk7DpX/ayxYaZX/b9Y6bd2LVHHILQHbe4o
	R252+fZ9Fz3Y8VOrxs1N3aPRU8KF8hf6l7oMS17Z/Knu5D398P1QchRbot9GNZVq3A==
X-Gm-Gg: AeBDieuimHHFmFjoafCojhAt5MetLJ1JWX+KANEOQekIsd0RFhKRktQ2smNZBEbXk5A
	SRzfc43bJnXAt6eMqgexm3ZoWfAE9CE6E2gho1yUh4+Cex0DzVGdl9G5VWP97ULVaKvdltnPmzs
	DbhxOjrA+UKUpkgrstfElBO7nJ1tHCwGS4JIlilhAQYew3WccDXxRvGlPJrVAfqkBp7Ix9qEweX
	nGTbtdovZh0tlfVv81Le5l8vosN2kdh3ZeV0Jj41fJcaNZpJl+i9IwIeY0M+GVQXOLUaxy84roE
	uJNZeR5n1lMeS96aAfCzjYEnRS5GnEg2s8DYzfG4wcUX89bNAlrhTjlm5h/iDSOTmJprlVgzWVN
	M1gUSnSHD0YsMR5p+7dKWvYrsTWGU8X7yVRjY/u7zVtlhRSnx6GkNRK8Bc6KszYF65JC2zDMV8B
	QrXGU/L1DKXOKRWksXhy+WBSn9JoDyudy7RZ7eMDDH0PagXR6z3mRgGnnEbBZ0OK3sEo0rQfuy
X-Received: by 2002:a05:7301:fa10:b0:2ed:75d:fe40 with SMTP id 5a478bee46e88-2ed0a084038mr2613645eec.15.1777414558981;
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed1c070523sm162156eec.19.2026.04.28.15.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 15:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <afExm9HeB-FMmP4P@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
X-Rspamd-Queue-Id: 6AA6848C835
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105088-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,chromium.org,lists.infradead.org,lists.linux.dev,samsung.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:dkim]

On Tue, Apr 28, 2026 at 02:43:21PM -0700, Julius Werner wrote:
> > I reviewed Depthcharge code history and found that this problematic
> > bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> > device. Older devices may have similar DTB structures, but I'm not sure
> > if they have the same address-cells problems. In any case, these changes
> > shouldn't hurt even if a device was not affected.
> 
> I can confirm that Nyan was the first Arm device shipping with
> depthcharge. Note that the Exynos devices are all older and shipped
> with an old fork of U-Boot that probably handled this very differently
> (I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
> so they wouldn't have had a `reg` node and should need no `ranges`).

OK, so that makes patch 4 unnecessary:

  [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware

If I respin this, I can drop it. Or if it otherwise looks good,
presumably folks can just skip patch 4.

Thanks,
Brian

