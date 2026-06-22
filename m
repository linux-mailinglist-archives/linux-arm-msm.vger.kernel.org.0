Return-Path: <linux-arm-msm+bounces-114025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nEHGAmNLOWp/qAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:49:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4B6B0759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:49:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=N1Ld3ROi;
	dkim=pass header.d=redhat.com header.s=google header.b=h47st+Hi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFE5A30234E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD662EAD15;
	Mon, 22 Jun 2026 14:46:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87E2D739C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:45:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139560; cv=pass; b=NUdOsY/Z28Ql7IE36mf9XAVJv1SZHbEFh6Rh4vTgojK31VFeIpx4WHLQLhuHaEePSN/fCgoHTJ9C/Ivvci32RqTQFqhr39qzJm8kjuGsn0MQrj8kgL32w0UDr0rkbQeftsRjIP29teDlHYTUgLqou3xxZ87DAtFVCwgfwAwSnpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139560; c=relaxed/simple;
	bh=w3fTzJN8+V6jghxv1M/H15ZDVuy2F3N7AO/+lMqYKOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWrps4WldhMVULAz2KqaGwGNzo1K7+cQzl7mJKx2aujc2kg+HK8kmaXDw/yoQMY8Rl69JRwoLr74GfqNn810ZYdCmirwl3lf5nGw2V8VqNDEC1yjKVN0Gii9UUyPxRSqlsoYAwZihZBR7FGYHt15pQKTJgBQpb30s+jtythCmRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1Ld3ROi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h47st+Hi; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782139558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
	b=N1Ld3ROicGI4lFAfKKSVu6LOvUU/TDimpgLvts9jQJCCcWcL6niVfJr4E0yDJP48W6gApr
	OLwS5MuWFRD3wOgrM2BbAvMzAuzOA7t/rAIYJp3exe/uEaqSqnfzuc8cWE68dyS2C0FFFT
	un1EYvUjFiA5unDCzlxWxcg17j/Cf9o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-tkZLKunVPPuvGJASKo4y6A-1; Mon, 22 Jun 2026 10:45:55 -0400
X-MC-Unique: tkZLKunVPPuvGJASKo4y6A-1
X-Mimecast-MFC-AGG-ID: tkZLKunVPPuvGJASKo4y6A_1782139554
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-bf5ea9d140eso472714466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782139554; cv=none;
        d=google.com; s=arc-20240605;
        b=lP1iD75NRKVbOJiu79hMEBpLp+LbV5/ZFiEhjY5JlyOp2+VrwjabJV0zdwfHjdd8XV
         DmQiT5T7LHxX7vIeAhj2riDtHhZEakm5r5+89mbEqIG9gr8KSiSRYZbyruUenwi3ag33
         tzN81vrENxYCYOQ88gIMpYZdtuuk+RKHeo+/yCK7Br2dh8fhTj4AZbnPnfzYup8dLLHU
         kWqmckdfrRt3saUOPLVYKs0dCfjbKMWF76ABIVBF5sPHfZxWG8ZAcShCqjYCbWEzc0rI
         pFFnuWnEsSbd4kjalAq/cSUxySrVVIej56LXcHvRiNHJ/SkSrBirjZfURZ/dRxzXRs89
         wgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
        fh=p1SAAOxy4hQUGpQHv0sxrptujERlbw6O39R+eTgnytc=;
        b=BxbifcYSuSCisk4q6a1b3jNQU5cNka25GlvmHKaSts73ZiY9akufE8x5AvsfUgtjz+
         v2Gmn/nKac7zL39CjFndfs2iUWGlokKLvLDTmDGUNVz6Y0RYkmisM03eWdi3d8ZvBx4n
         TMMaWc88UYqY3NmmYycVYlQI1hEkDmI9Gwdzvab/2BiMuWd4K9X06eEjRp3oVGnRngXT
         5YEOeQMAD3mh8qAOhoCqNicK0nbXpPs9hpx9Nm0XoK4ux/V8MH1LNsfJLM0KqAOdYklL
         SOAw7WncSXOqaNpR7+L41ZVwDcAzctuKuSAJsfjmu/yrCaT2jKhI2JMgHoyNsESwX2xS
         vASA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782139554; x=1782744354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
        b=h47st+Hiq0jHFMHZnqjbV/gcHP1ShK52Wcrx4qokqC8tx1DngaPo5VlnaH8wkqj6Tn
         SPsiVdiiA+Z4YvFZCYui8UIPG1qUiOjcukKz3c4Fs3ubfHff3eEcbldnL0asvv+jnSLZ
         9Wn2c3iSXXtMTEXfpAarJ0nLvZNeA3Yrr8cAK5i7JWjAJlGUGW87JAA8WUJAn0Q9Vzfn
         37CJHTkAc3Xk/dzfpYw7NE0O/j3/CMUWfIN15EE58aysktCLf0fNTCYwym9NLhimwGGX
         T8IhlNzoBsOSSmpvsrwbU/TwFQRt4k4CtIPwebbRtj2qPumDg8/J90w/H92M6q2kSrcw
         Iumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139554; x=1782744354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
        b=Cn77SlmxisLx6Hp4zLLxAGU/gUTffPxYcePYhVR736brjfhTZuHYP4DChip5tm6iy+
         Mxcpw1XLxWHATDZRosE4p3FfrNjRpN8n41W66SZybEgUI7qb5gsT2YUHltC0XUSlU2+b
         KNOo4KDB0Jr4dG5S0W9kaFlC0OuM/h4LEvaF0xs6kJL9sqAZLT2a3RQICFCf3BPXQK0c
         aqS++FB6xAUuRvkRVKPl/SglxZEGpCC0c0qbHztLSFZUtnEh38gqJbarVDbYSZwHiYNH
         9Xr4Mvp63eR7hvVWHjA6NRXEyuwnl2+anGTf3Lpcen01CPMOfkzmzfhXFuk6+tDm/6XP
         tipA==
X-Forwarded-Encrypted: i=1; AFNElJ8+8aE6z6TDbe0xAFl3WIpJi8pxnvCJSOeX2YphkTC7gI7b2zYBRxfzK7UPlKyIcPN8q+1WXZOF4PDBznrp@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDqlLdXRDWwRtPzRXtV2I9lWtggFXLu8gf3HfCGMCZhrTbnB9
	nsxxrYfExlnWp+R6ibdRCBNB4CqiI4viAJ+chlGB9QjwYL4SzenlJ0oXYJ+bQMNUUU62qnamCFo
	CoSMV9kFRl5xLrsqZpErlaQOvke+fvx7h5qyKmsfDqj3lOW3D4H15JeVhvyACNx38pAKFeGiHB7
	jz/Ngrvk46rgWEputcvWYim0gpNDRphxISQdsze9kcrg==
X-Gm-Gg: AfdE7clm3jLGSgBCGy44i+mSHMssOMcRpU9+U0ZKGKCiHjuamtMhUahH9dDK/+lB/8u
	5v/TpcH+aRdpJcpCjyId9JWTHryFisLyftp9GGP10V5wtQ5d/RjO5oNyX5rDhihsyINBZWBvPLN
	HQXhhxr3trwnxi0N27fjPOQtzE00+PiLJsAU9FW1HqK7d+q3zqCXUJAyBb6KxK7kDf6BA=
X-Received: by 2002:a17:907:d84b:b0:bed:f8a3:23a0 with SMTP id a640c23a62f3a-c09b9681321mr579184166b.25.1782139554025;
        Mon, 22 Jun 2026 07:45:54 -0700 (PDT)
X-Received: by 2002:a17:907:d84b:b0:bed:f8a3:23a0 with SMTP id
 a640c23a62f3a-c09b9681321mr579173366b.25.1782139552037; Mon, 22 Jun 2026
 07:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com> <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com> <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
 <ajRfSbkAYusH5H9H@redhat.com> <4d25f656-1372-4ddb-9e52-8f381700abed@oss.qualcomm.com>
In-Reply-To: <4d25f656-1372-4ddb-9e52-8f381700abed@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 22 Jun 2026 10:45:40 -0400
X-Gm-Features: AVVi8Ce1-J6LDKN2KknD7FF-dHwgiaeENbfRoipsV0ONHSsZwj0DjQd9ngtULlA
Message-ID: <CABx5tqKHLz3XqMcmf071woGy0KKcdU1e-BaOKyP+XKcvq0LeZA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114025-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ulf.hansson@oss.qualcomm.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77E4B6B0759

On Mon, Jun 22, 2026 at 6:35=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 6/18/26 11:12 PM, Brian Masney wrote:
> > I am not aware of any clks setup that way but that's not to say they do=
n't
> > exist. Stephen, and/or some of the folks from QC would know better.
>
> I'm not sure I'm following, but we do have this bit
>
> qcom_cc_probe()
>  -> qcom_cc_really_probe()
>     -> gdsc_register()
>       -> of_genpd_add_provider_onecell()
>         -> dev_set_drv_sync_state()
>
> and this patch calls dev_set_drv_sync_state() again in __clk_register()

This is what Ulf brought up. In my next version of this series, I am
going to change it so that we can add to the sync_state callbacks.

Brian


