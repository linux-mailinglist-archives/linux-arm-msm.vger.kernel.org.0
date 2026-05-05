Return-Path: <linux-arm-msm+bounces-105962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M+bgKZDr+WlBFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:07:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF154CE283
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22E0130309E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C63A439005;
	Tue,  5 May 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSVwNXQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE4F2580EE
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986444; cv=none; b=KnzN3+upL42W4n7ABs+CuAabxkmoNYzrhVTrTsSn3Sns3go9QVecpubGx9vROp2c9KtwAod70VA26Olu3+TzLwGEs7patqoMefWYclEZH6K44alvoPAz8isJtGY1v4aXDKH1YTZ8BulJr3PHX5+ypHWqx2AYDhlUNl0PF1IpzOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986444; c=relaxed/simple;
	bh=k522zUuMn9sacMhN42z+H89jqUmO9HqplfLaFSv/g/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3LHCwxbSYj2eHVqsont5BdGuyHyFQAlVz+Ys0b34nHKz4ipdDI1lZG4FdZdQx5HTx1AJQ17RCwhHi7KR31JK6UOTKuqRuH7mzS/5GeyECTFqfYpg5Di9S9o/R+W43dPhkkX6Sn7IIP8urZGV1RWqR0VhZ7aX13tL3iE1qJm1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSVwNXQb; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7009551eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986442; x=1778591242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3w3nNiNCoJv2dXKyaye8yTSfZ1rSI+EK1/c2kHTWpRw=;
        b=HSVwNXQbfkG3QrOYRi1kKA3RT3ONCNNCGDODPlQPrcxJ7C1ftdAkLNkhDNqYBLkazF
         iKWmqd6TLjqa8ecqnlNTpcMzKORA6DZOJ5EpJN+ev+whLhtDdM+LE8xdQmD3p/zXPps+
         Za5m9qGbIIvsPejNix0NGJ/XnfTbnXaWhfI4/zfJRIyWWq5IHwEy6oRr97x3i6CjZMZ9
         6vS81HgAQitvlzj0j1Gf2L14AavCX8dB3hlTJBxxuReruBVKs1AdwEZ/dxd4hbPuEzkL
         8RzRwT9+d1nluISsgHFWlORyebzP8VgtDMCvrM8e38kFc4j2ABKsXcYpnnlH3iCuurfF
         v/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986442; x=1778591242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3w3nNiNCoJv2dXKyaye8yTSfZ1rSI+EK1/c2kHTWpRw=;
        b=gO1b48Ug/DmQ8Q6FmiMHeAQb0ysGYtZZehGIZ4UAVhRSJjtdx1mMhazHx+1S1pnAYa
         aDD5fnqx/QEEwzZ/quCNcPqS9+dmoFbI2VeUCQiQWS318yzd4xSULcZ4K1SPcufNhjg/
         Q/NPMc+NyvQxE1M3Ck/YkjB0X7eXFQbhQekhNGG+P1Smi8J8H8SdLxIuziKJVrk967Ta
         kOsILSz1c19BSt4huwc9Hw5jFeo5uCOSR737ARr8/coLGPyL16Imh7E6iM5jBTk9CZev
         RPWmuBpl9pgGzT9YQg58LmMrRCRgUDsvjPB2eEp2neNuiHXQV5/VogJ4T22PLrC7VXke
         cT+A==
X-Forwarded-Encrypted: i=1; AFNElJ9zIVYV6ICEs0xqbASU6NPXGMWznIZh2zNExo0PpzrxWtEIeOgBtzOrFyfZ0O68pffsZoNgH/OpDOGnzhHm@vger.kernel.org
X-Gm-Message-State: AOJu0YyGocCQUv09bjAWMkPk+s1eggDb1ZKPMHDbwzgY4i57pExDuC3w
	69tvnBnTw/v7kjxG0Imdix9quIrB87yfUwb6WuZLtE/vgFqyRK7C6H/R
X-Gm-Gg: AeBDiesRMmLrEH84kTaFqfWrrdLT8qwEc41CXg2nqj4CG/hhewodfyi6x2ck3AG3OQg
	DIOWi+seWGikT7E0smf/GW7nvLxQ9lVWxZ2wMjti76fr+8pckhR8Msyh8/fiDa59mPiJXNSex5Y
	1Iq+IXLcNJScm2EFMCiSYjsr1oB+jhifncgHKUcWgDGAfYfpcvI409uSY2Mg2QD2md8Xlybji0m
	lTIuQz68V5b6aszk6/+Wbpg2JqMrKGKINo3Q8tgvjihuzBMO4RFSIAvpbNEAFbahkg5x9wmHJFM
	TSsiIs+VUCRrgFtzeDyb78NPgnZEx4M3FrXKImtiuCvnjF04fZ5Etd7JkiCdsuNZH4gJuVYABT5
	GNEFzNnRhVg8ZeeUiD3JkmptM8s4QNgSK0fgqXBcRu+3mWVhAw6JR6S+0HAsEnyk90PJhGrgwkj
	G/0/bRvOQwSf5LyFfb2sc59B7z9qnUvjtb7qduxZo1Ni7Rfes=
X-Received: by 2002:a05:7300:b54b:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-2f40a18f9d4mr1458206eec.29.1777986442074;
        Tue, 05 May 2026 06:07:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d634sm24278078eec.3.2026.05.05.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:07:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:07:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: watchdog: qcom-wdt: Add compatible for
 Nord watchdog
Message-ID: <e0faf165-123d-4a1a-82dc-23693cf09963@roeck-us.net>
References: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5FF154CE283
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-105962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:mid,qualcomm.com:email]

On Mon, May 04, 2026 at 04:16:43PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Krait Processor Sub-system (KPSS) Watchdog timer on Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied to my watchdog-next branch.

Guenter

