Return-Path: <linux-arm-msm+bounces-95353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDKBN9NIqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:59:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBD2021B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC6953173729
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F5C39FCCB;
	Wed,  4 Mar 2026 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RUfIXzkt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjVVg1zU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC3129ACDB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635835; cv=none; b=kayCOdf8hx8h/yhxiJlZfJUzWTl/pnUTUMd584VuJUzIta42WkqTOduIZwqqZa0WPKXFz2k/feLP03vTMyvRfSe3LT6gNisQACe4WYaJ6EcCuXipNXgx4Hg1jUJFgVcjxASRYu/03mim05rjJgjdUNghfT5DRgVrAZcm3/t5nhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635835; c=relaxed/simple;
	bh=YLChEK5cpivtab2HRVIHw//j9o0ApVnaqOCsVAAfv4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtOwVzO4Z+wi93xLWVIUR/4AoJWrjmq50XsmM9UfSqANPmiB6IXD8CX9fnwGHQLVJFnjNnH3HEH3poM2X16ySxGVEDpY9xhoAmWsdno/SRBvQTIMBLU6LlIfNhfI5rX+h5tUHbgmLVRHlzG1Gzo3DffcEYLP+pFWSlOcv5VFeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RUfIXzkt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjVVg1zU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772635832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjfja2BGLHgTQbzQaDUH8CPxR/uuEmvrQqAUKSSf8JU=;
	b=RUfIXzkttlfd5r54VvDiS1edofEIJk7KRRgOAC2bqMJx+yrC1NdjKHkzzhJ5ITwjqdNPiN
	ZRulQtMUyTR3k0l6pvEU5eqCmyqvPa2rsumUCygKQO3btaSQEPcT+wsCbDCdKvMk7500cS
	xkNPjMJYmwmeQ9bwRz4V9n6aPWLnJdM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-JfIlyrZNN8uQaZcpx_31eA-1; Wed, 04 Mar 2026 09:50:31 -0500
X-MC-Unique: JfIlyrZNN8uQaZcpx_31eA-1
X-Mimecast-MFC-AGG-ID: JfIlyrZNN8uQaZcpx_31eA_1772635830
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b4bdde91so505529891cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772635830; x=1773240630; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjfja2BGLHgTQbzQaDUH8CPxR/uuEmvrQqAUKSSf8JU=;
        b=QjVVg1zUiOjc8PQxQnPlXa5Zrn9uLMgtWUioku9SoLnrUAsgQI3weAKgYy9wGHHQ9Q
         FTFBNty5f2HfrNoiIXzsNVXE3eRnlo/Xv6GAjguWafeQwOks0RZXaLDpNrWvT3ilbUax
         nliqZOgzmXZ34wgZdayUYzZvZuqojZVB1YM2RZYHYD2R+nKOhxRHJA1F+BdV4yzQcxTB
         OTsY4q9CADoBR/phG4YW1Mu8RGjeIEbh14Brn1UAzySpIfhu/M+53rH/mdNJhBKCt/a1
         mQ0AaHodNACQZdwEhBISJ6mAPkce6t06hGvM+lo7tNYGhf61shNlmyPp1cTjSHY5Z2P4
         fZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635830; x=1773240630;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjfja2BGLHgTQbzQaDUH8CPxR/uuEmvrQqAUKSSf8JU=;
        b=mLpCwK1h0zblDywFRYtaypCBDrtWuz3qI22A6B2IT0uqGFuZ9lxS/zkwNlq30BL8TV
         wip3lPgVl0sgWgFC1+VvsajnUgiezw8Cu2c0s5gPGnhOW/V1MV8UJyG5DmyjB9DmPTFK
         p+6lBFkSqz0hfRm3woPCKR44VhKInzstnCWueRkgM6sUhpY9J0v5SHBpq/+vKXc2yaXT
         qSOeOCXDsWrxJXI04d3wPUVxaEcflnN1bYaH6IIiAGuCwct9Cju0W/h/CQk/of5kWyy/
         8kBMaqp/KdDIsrkAAwKBdrOhbxcvza2CwlXrT61rrj6ji/oFhJQjQ5Z8h2AJ3nE5jg3A
         wGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZwHYXVbu3QeuzcD772nj21tnLfmNHo4fo0iSMpqsr+qWqrleV1WCGLFneWq8xZ3JGMCYvOlsxPtJhO8tc@vger.kernel.org
X-Gm-Message-State: AOJu0YxVas7I/9D4fyJBMTIY1/c039FvpEw07dZ7rLMapPUGFQTBOh83
	deIy0KHEyxgfuqVgaHJpsnXA+Gneo3Ed8fp9WAwBm8n+TcjO0hOabdFQmnsQHTv9tOAIZ4LI5ov
	ojfdsTvc8TIlYK6CsgQZr7M8wJDvlsy2sdZWhX6OOiPkaQTIHlP1PqH14XZKFpbAWJqY=
X-Gm-Gg: ATEYQzxR5Umj73erOUX5MaDcS7oTHCerHclLiHgy77ByzHHegvcCtXEaoo6QjY3IPUQ
	71IwDFWtjL2nRfVUcvUEV8g8AexwJ1qQh+jTkO+NfnofdoEFEdnqJhCvsHx2RVxrkYCzozdxbod
	+/9Pg2y71f5YU+7p4UB3Nhbc+9g43fIE0a48cPQlLD6Pjmmzn8g6aQGZAMYQsvIewzZ2BoV0TG1
	0g+ToPSHr9A+C4ocAr/v2ErnK4EX20SWUpeu7urpx0WYRpgT6f0Wbv6d6FFGsrieRAsHhiNf94l
	W0I6Lf/4kPBjYI0yTp+AUUG1atNl6A3UINeRvwd9zRRX0owJvFEJEq14twcp3X2Rp2vyr8ewxsp
	BQ95lmA8xXghg1pVO70etN327ikA9D7Jz+A8xAbDmcsYodKxPTVmc8xkW
X-Received: by 2002:a05:622a:180d:b0:4ee:4a8b:d9f6 with SMTP id d75a77b69052e-508db3a7539mr28470661cf.59.1772635830348;
        Wed, 04 Mar 2026 06:50:30 -0800 (PST)
X-Received: by 2002:a05:622a:180d:b0:4ee:4a8b:d9f6 with SMTP id d75a77b69052e-508db3a7539mr28470381cf.59.1772635829849;
        Wed, 04 Mar 2026 06:50:29 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449b4dc0sm149392321cf.14.2026.03.04.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:50:29 -0800 (PST)
Date: Wed, 4 Mar 2026 09:50:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <aahGtIkxtNPeeWKc@redhat.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Queue-Id: 39FBD2021B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95353-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Pengyu and Konrad,

On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > From: White Lewis <liu224806@gmail.com>
> > 
> > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> > byte_intf_clk, the rate-change propagates through the divider up to the
> > parent PLL (byte_clk_src), halving the byte clock rate.
> > 
> > A simiar issue had been also encountered on SM8750.
> > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> > 
> > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> > so that clk_set_rate() on the divider adjusts only the divider ratio,
> > leaving the parent PLL untouched.
> > 
> > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> > Signed-off-by: White Lewis <liu224806@gmail.com>
> > [pengyu: reword]
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> 
> Looks like more platforms have this issue.. thanks for fixing this

I hope within the next week to post a new draft of my patch series to
keep certain clk rates intact when sibling and parent rate changes occur
[1]. This will be for certain critical clks, such as the ones used for
DRM and sound. I have it working with kunit, and just need to clean up
some of my new clk helpers and commit messages before I post a v5.

I'd like to test this on some real hardware and I have the Thinkpad x13s
with the sc8280xp SoC. Can this issue be reproduced on this hardware? If
so, can you provide me detailed instructions about how to trigger this
scenario?

[1] Latest public posting v4 from September
    https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com/

Thanks,

Brian


