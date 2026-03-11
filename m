Return-Path: <linux-arm-msm+bounces-96789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAK9BZa0sGkHmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:17:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF5259A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23D103035A92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A362D7D3A;
	Wed, 11 Mar 2026 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nGks4XoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD22D77E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188190; cv=none; b=DdTL9KbmngoR0j6+FU7BsdyFO8XMqYU5QvPqBtWwPzX0m7XKIwx9wxraPhfewpspmKhL4jvUmQ+ImjN+WwqJvUDDvkseIuCFFXoU4z8vCNRgaG2XcbPD+Tm1tAMfCULG5eJOFintaidnW3+aU/gWOspmGCyiI+o74GE2TAqEF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188190; c=relaxed/simple;
	bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhwPHvFqe36OWS128ap4DGM3L1XlAo25zQ6bfzTdWVxYNV374I8fF4AQjwlQCq7THsR8A3XGsEgVP2D67eVDOsy94hWinoQa+p2xWk0DffV1ydbQ6KcTVg720LAdT4Xf6gx7h181WVvIs5a12Q7d37+G8mb2UswizvvpzEFe3xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nGks4XoU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so5714113a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 17:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773188184; x=1773792984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=nGks4XoU7gn7qw1avmmDDi984sIHFEzbRLBnAPrq3tZ4St8OjAwVpg4hgzFuKTdu/U
         zC6R+FYQYQKb+Ai/CiP0yXf8mj/WASdNYVPfF9QNroYm0LHgRMCD8EgrsnygX2ba+UDl
         /ch+/Er379YQ26RVpaeo1j+4c27jLu3UOMJq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188184; x=1773792984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=WA0x9VP/l++N9zzgfdMWPIYeY+iuZjDGgx9Z9VDcDOQcpuUUvjegZo/ZcVwpI/ynuI
         JurzeM1f8GnMu4JUbJs0tvz/reTnyeKyAY0nrF3FE/4L2oBIO7pu8QuD+Zz90XAj50Y3
         Se8iffnUR2aCDL5HB+GxGSYMB/0elllEHhgxW+JRqD/AM3W472RmefRjK+weiMI0w4I8
         rVKXN4/P/D674JUeRobGIO4uEKgSdfwe1XkW3OFHr6SBsHwu9vIHplev/RQ+xaebBCdj
         8MZwe30SxkZmqx6yl5q7hPJxWQokHBrH065MmsjW8bA0JAcOPVPiujTBAovBIRm3Fijb
         ECCg==
X-Forwarded-Encrypted: i=1; AJvYcCXsxs7eED+LQeFwmGCQTyXTV3qDxZJhuErcX05zYVp7LYYhkTY0i9Bm+ww+HkpUhnGDDg6/VdQK/UpZ80zO@vger.kernel.org
X-Gm-Message-State: AOJu0YxqLnJjk415+c9WQa01zQweRi+kEaZF9QKO1+uJC5s0VGIlREb5
	lB8fwbSW+dFA4bFzgmI3Fd5hRduF5k3UNv9+sFcmlLjt3yPq9lLAiPb5pF8Y5K0hU9jh0yRVmS4
	fzoM3Z3kT
X-Gm-Gg: ATEYQzy2QESwC7Q1bNUMQAzhn+D0CkadzEHRLMENP0sqw0Q/57GgZBdOuhUU9zPxH0T
	KWdeeOmi+6UvRAtjq0914HdhLfXEy4XB72n5QmkspcNOcTVCfdfddSixGR3hUWvaR8QvajfJM2g
	i7N1AMKNOVkUvFRfqtD0DDNSHNBa1gv1S1jsgxe+T7STQHu/+omLenBRmIkSJyAikqrxYWWorOh
	0in08+lFzAsaXmu4wM36GZH8MbSV9j4Z9MWkkczARpXjH64b1TcMczvNhYPoCEpSt+Sl50wy4kf
	idnNWK+sDEqlQ764fbh+X8E/U1tjIWuq8UcgIXWaJpg97ROU6/9dl3zz9naGjBtCmLCsI4vQ61D
	EXA71n1RXf8cAXAVeDh/6UnA4VgiIi4DPa0ltztk40EPBk6B6Tb6Bq/2TnXo4FaslfQ56AJs+32
	HX+uNx/fYJuEps0rhtJNqkaXc3kVhQHhBwk2ympjwiKTuOyE6orGBCt5UF2Mwmkw==
X-Received: by 2002:a05:6402:280f:b0:65f:9c21:e67f with SMTP id 4fb4d7f45d1cf-66319cd1e69mr268689a12.20.1773188184251;
        Tue, 10 Mar 2026 17:16:24 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66314482257sm188828a12.9.2026.03.10.17.16.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:16:23 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so9077446f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaKjvyUrHaGhBhkdwppusUs/17JNGJAjeMeDd8pJrzMRU99yV1jbbJb0Iy4/+Mg2Qz37orulE0W36shICC@vger.kernel.org
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id
 ffacd0b85a97d-439f81c8cc0mr1467675f8f.21.1773188179252; Tue, 10 Mar 2026
 17:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 17:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
X-Gm-Features: AaiRm50L1dSQfXqKqL2lF5VIOHGsndPMM8bpxj2iTcUPN8asbNOQBrAMfnlkmEo
Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 00BF5259A4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,pengutronix.de,vger.kernel.org,arm.com,gmail.com,lists.linux.dev,amd.com,nvidia.com,lists.infradead.org,google.com,suse.com,linaro.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function

In case any mailbox client API users want to comment, Jassi has
proposed an alternative to this series:

https://lore.kernel.org/r/20260310234616.334498-1-jassisinghbrar@gmail.com/

Feel free to join the conversation over there. :-)

-Doug

