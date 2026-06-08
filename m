Return-Path: <linux-arm-msm+bounces-111747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WvGrCzR/Jmr8XQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:37:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF96541FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:37:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kvOg2VOe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C95C30575E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9AB3AEF34;
	Mon,  8 Jun 2026 08:28:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com [209.85.161.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63403AE71C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:28:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907333; cv=pass; b=Dp7AoLUhSY2QNkmPO6vTnHJCO5WIIskbdRUXHYOm6d11QTrtpZcN8ntKuG4wX+bMnlNHTXgM72f5D+zqKiL0/lk9UV6o/W/Fg994pNI9exiMJsxY8FjPyqvo5RXLBrvvVl2JYM+b9Ox8mQFBkl3JIXjnnpHg4e2eaQlCJN/NcTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907333; c=relaxed/simple;
	bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0GkaLOLm1yahLwmU3kmDYDciPJjooPCYzbWeeuAE3HyqjwDXmmhVwUQXRkZODGJ4GViLG/YJBP0aB+iYRop1wrucYbxheERxjimGEC40cPzGGSsgsLhWuDggHByrrrnWyQZ3rUMKdDKQA8bRqBvaSqdnUqyuB0jKy13htwKTA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvOg2VOe; arc=pass smtp.client-ip=209.85.161.67
Received: by mail-oo1-f67.google.com with SMTP id 006d021491bc7-69e1f777bcaso3028302eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780907330; cv=none;
        d=google.com; s=arc-20240605;
        b=F8g9ZaqASXTGAU/XgWiPwvpsNI7lp/liYyK06FtpZtzvQtC3mXkr2YZYH/jijdoxqZ
         5REYjJeTJGNF1yBgAxnOhhJJVL9+uvP36tn1VXgAeDrmWvNHtgz/NjoJL69p0A0ZGTo0
         DuKuLLdPT53PNI2kE8auv4Pz73iLwp9DSv9OFFP5Td90pZI4JSZTPCimolWmrYB20+nV
         FdQMMoclkqfJZchdEO3xlZohqdDNmp/a1ghKBXOw4z2a6MIFReEgcbYuf5WabbD4ph8i
         v/WWpzzynuBIhwkPqgGODWXtLcoiXLavbBYfrDMGCaxNO2uXIOJ6fAcMhgBzdLPa4NTN
         k47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
        fh=D3cKgYrx5fh/kEtIoN5a/soihKet6skE0ZBIPGwulzU=;
        b=NLHBQ5wwrQZ4PW/RtVE7glht6DKJSx6batghviqXx3uaV+gvRitwOXTr3Zy3S7ZAoH
         Qwyf9u1plbQf2JWatnHatwK9MCte/DqYbIQ3Qu6qkgr9axmBs3iLInJSMMHDNnjLBqW1
         KRfEs93Ft3vZ11YpeUyDGaOnYWNuNYCjZpsMYkHf/8rOGi7gWmIpvEWPwoQirMTb7MIB
         qgkvbH33uG65Ki2mLYMNMBNC0yPQus40nt8gdj285boTpqUG232yuAJiyF/vvrvb7Np5
         ijz1pmMKy/CLJQHjn+LzaDTT/yas6ve6fO0hTh4oY1+AaSJKRE1sO4X5oSQKPKRp09eC
         bRrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780907329; x=1781512129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
        b=kvOg2VOetVXbxuhPcxGSQRdFgM6tRD793X7DcJ+XkWG2/Tdl2g3ju98QIjQhvTID53
         dLDTicr2NQsu15vRBCi/DCYffMXPsFpmC3PzXzl5nGiccemw0jdxDff2Rb/SYxr/kgKh
         oySX8MSQsyfrQeQ9miOq0t6E038UJODWPtfUZ0BKqGyEoMBHsgaPOvySytoFwJAjq0B9
         JHQwaPUvCxW4COYF6ZvwLd3Lt7uBndeMUiabHZAfjAoaC+X7EGroFzjFKsrljEH38wHp
         uhByJVbAed8RtHGAnQTHAhluRoMv6gay0XbS8xQoZiBco5pVoUKGVQRdzeTeegW9M8Z1
         dZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907330; x=1781512130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kyrtUyTTfzFV8/d4eKv2gNhlXqnhCxH61wlDqa9yQ4=;
        b=V/w1XkKsBFg+uifMzpQWujd0YT5xGdNNACtEaChFd7XJjXqOJX8HpphGZxJ71ft8NS
         bcmsZ83xcoBbX6BfeSnQPiCqoCia0Ak2ipCfmYEHtl1urH9YvyIQ4HxtYXZ5ORfjtPf/
         L9UVC5aGj0mndz1dmaiIvOtyoIIzrm2gmT1zzDzJKnZ0viTf9F3J+4mngP1CzTe/1AWw
         LzqFuGP4VtM+9DfCw40LP9DMmd60n230CNv6k7iFodJnbCPDrvnB0twqv4gsTLUsIFzR
         nSLomO4SJjG2nwxDMAaQoYYcZzIDcndehAhKtzkWQILTzL8XTcbwBufq+3FjS5d45iqN
         hnWA==
X-Forwarded-Encrypted: i=1; AFNElJ/rVr0G6+OxSD9psZBKkzQGlg8bFbVhKfBWyNvgxk84+XwTP9hHB9uX/UG8f1AIX4NgSjGAbc2MIIoelc92@vger.kernel.org
X-Gm-Message-State: AOJu0Ywplnmhwgu2iOo9Aibpb+2Tb92aFa3EG+zBNirEFi9LNuHrL7LZ
	92zHtPmvXitnBHhbniEJB+rHhsMwH0TYVMUt6zCRPOPLUP/JFM9IMZHBokMNmyAWjSxAEM9UfVb
	ZfKX4SGCR13u1dhA/2bO69ahbi6ds2zw=
X-Gm-Gg: Acq92OGQGDWSAamUwo47eLyPbWiUD5vg0/hAlIIC8Um4G5eZ6m0WIihAAAZ5hPxUkT6
	8GqYCeEeUV1nTNBMhJfTSbSYbTrhBcxcvmVxvCD0piaINX0nNQdtBn757w7hnCmFN3MOWcnWh5s
	Ci8m1dMucgSxQCzvwmxjE11u1DSgXS4w4bBvDouy6sBWwA2uigMUVSPlRv3Aq/Aztds+JRTzY8H
	CZaBRbFqDXIQNOs5KRYBV2wXddxpKigUhk/10Gcz79WwsOU/IkGRhQbzWmXdpjawdVIrhR24YHt
	aM0nPGYqBwBe0tgaHJ5J+UXUV1utvfNkuBIwAGfEUy2stYheUg==
X-Received: by 2002:a05:6820:4cca:b0:67f:ace6:2fa6 with SMTP id
 006d021491bc7-69e6d2fafbemr5660501eaf.3.1780907329566; Mon, 08 Jun 2026
 01:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608001128.80090-1-dennylin0707@gmail.com> <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
In-Reply-To: <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Mon, 8 Jun 2026 01:28:38 -0700
X-Gm-Features: AVVi8Cd12ce3qZkErmMP-Cc4dXmDmPZSlqJ5AVm997CY3MwL6bNiOIJJus8fyC8
Message-ID: <CAGEkeHdK6EwVtJwSHNqJr8kufkqBsbyMMiL01SpCkzSF4bkjGQ@mail.gmail.com>
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM check
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev, bod@kernel.org, 
	mchehab@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84DF96541FF

> Have you actually hit this issue, or is it purely theoretical? We
> shouldn't be receiving interrupts at the tail end of suspend callbacks
> (and there's a disable_irq_nosync() right after the HW is disabled)

I have not observed this on hardware.

My concern comes from disable_irq_nosync().

Its documentation states that it does not ensure
existing instances of the IRQ handler have completed
before returning.

Given that, could a queued threaded handler still
execute after the VPU has been powered down?

Thanks,
Hungyu

