Return-Path: <linux-arm-msm+bounces-94493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHNXBL7IoWkVwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:39:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 943121BAE6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91E0430783B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4244E28D8D1;
	Fri, 27 Feb 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gDWo8zu7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrXfSlS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7B23AE62
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210336; cv=none; b=t82MbOI3V8u+14cU3akRZOwqSMFyIoHtRwXZCBnxe/BVwvYpKqkoHDZmtTPoD5m08/2QUgaoECNgssucEJJrvG7RvXBbzMQU1nGIattchUFHHnmDFzt+lVfQEM7jxGkOujsymjdd2AEZXfylNO6L8maNQN3iM2RBrkJsnFTD5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210336; c=relaxed/simple;
	bh=nR+w4zGkLQzjRTIc7kjY/q5/CbnV6sRdNO5FlWgP6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG20SD18EquXTTLw0nVtCX04VMqasXzV8ZPzZ+O6X7qkllnaw9NvDsc0aFC/m3DzXCOrzfhe3J89huAnttO++HRzdOGcKw8O0OtpZe2yN7g8X0GzIqgTC3erzTQUr4nX3ybtgv0T9ACdqrd2kTxHzJ44viIMJjncM5sdmAMtggM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gDWo8zu7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrXfSlS+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=gDWo8zu7dpxEKXhqX3ACKxxMgLjReINCDy/Ph0RAoxKSthSY2R+6ZiyfuZ00uozWMux9Lj
	sCBhzi/1YyLvlatMHxYT4+Wl89acxj+On8ygExuoob0bD6YRwyNH3SmtxKYFBZXL+bC6jw
	BDBUOGBZn8jxfQdAylmjpweI8XU+voQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-Z3OlQOLyPxGhspQ0jfR6sg-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: Z3OlQOLyPxGhspQ0jfR6sg-1
X-Mimecast-MFC-AGG-ID: Z3OlQOLyPxGhspQ0jfR6sg_1772210326
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899b12d76adso252225316d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772210326; x=1772815126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=SrXfSlS+H0dalfq8l9T4Lj/ORePVPXj2NP2c0yYmqmAPH3AWVlwzZifxXgRHMHTgo5
         FFDRggYKjP2kp/bPhMOLKG9BqrYzyaKe7zoXcTgcKvWBx6VXg7+l9XwHPLksoolLeU2/
         PlylD5Wj4Ln/FIkA5GBQAATzVrK+382+eEpEZnMgIvtY/VkRkCKL4o3ZIhuAZUp17U8Y
         t6J3MQufJWHNq6uL56CvZ7n5Z68IUEFsCS3uthxke2WUfv0hhy81cc7uJoMAk20SVnKX
         6FUny2U8rFu8e7SMQ58W6fzSSUEn8pWAVPd83ZvVMlkpWUY4wUHHIUxmya8QvApqHy5d
         IQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=Ds0Ge7A8wKt3G1iHa1cPAJUT48aq8/u+E9HBiJsR3YWbQynftU2KjRBymk17cYgoXc
         QLXy4XGl43lYTP7iKyxcVafiIpSoaX+AEYZh/buvxqbsp9dDJ8gWUZfFAlZXJbKwiu1e
         OV8twkH4aSyDaevTWOnlcUYD+ovZrlPV3E2VEwiY02Dc4E/BKokWaw771QcVraCtsOq6
         zGc85Y8whbK69X6ghHHRRwGpCpucu6t+oEao3GzzOfjSI4pR4riHc9FbzV6lylYE9cZO
         90guovyCi1cO4w/yCGorZ6Bdp6noL5K4ViAdukKYleg3zGNa0c6/ME7CtlDUjk4+8GzU
         aBCA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Dk9Hr/v+Y2vfosUD1vVwnGg46WQTVm5kYb5Ac6o3yIrA4wakBeEslt3C6bgqBwRq3XR7hxkukZmWjhdu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fTZzU4AvaOKwaBVwNjHJkxVv976RMBamllMNF223mGWxnrUk
	95CdhZN7C7EB65X1qHezPUEt9VIgNqaWTO1+Z2MBEmcyaq2dHgBeEMVDtjeFNOfonLA2lP7tveP
	GUYNgQv2xuV0ovTlfytLQFWHkvj368WidNHgUtqUCWvB4gQEkzyUdd27Hjru4hOI1cUw=
X-Gm-Gg: ATEYQzzZ9WHJg4HyaZ+h8+sbMF27iawYm9zHvbs9Bs5dTPGANn9cJyiG8+5gwZnFZwn
	lDcz5Kx5Dy5HCQ1OHwu65Lciyx3hT3Bi7zHbAjW/bShWTxTLg/MQE1Pt72lr3OcTu/qU82yWYzH
	2mYjKwZZSFYhUm8IHfn5qdZlA+2kT7g2TkxQRe8vgXHgbNhs7aOGUO9IyT379tqzd5MjidmprVx
	FmLN8M8oDXYJixT+uzWNyxfOIo6rEr2IZ48uOm+qxewTDzAU6jfYM+OPL51YDFtnfmGbLRXi9g6
	uXQ2QJ54P6OsS2Nm0seJyci7fYNVJCJ2byb9tzAu1A5WUDMoAY0FEBC+wSDrKzcq0tEb3/jpS3e
	rHMWqbBNpknyIKhGrQI7wDNyWLbo8MbwkvKuuMFJN2zO+hb4opOY2ESt4
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660166d6.8.1772210326388;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-94493-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 943121BAE6C
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian


