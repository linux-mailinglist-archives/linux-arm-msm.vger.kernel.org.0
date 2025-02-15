Return-Path: <linux-arm-msm+bounces-48108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF1A36C0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 05:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED611895D87
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 04:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260C217BEC6;
	Sat, 15 Feb 2025 04:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DGNF3scO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD315A850
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 04:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739595255; cv=none; b=Rz5nA8nJbs3Sw3Jkgx5khdEUKl6E7zEWrFr0P74t0YFj906fVIvp8wBGk883PbKGbLfWcBpUQWJvdQ6t0MAbPEAN8e+Zo6+T5+1r3Osl1AMLbB/varowCSZEtCFRWUyL9sSg3QGsVuTusDfJYHC0JnPjnyEWVBIYpyJAweti2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739595255; c=relaxed/simple;
	bh=Qd+3HqLIBmzspnj051AjsoWB0jQ1fLQfmy2L2Kb+xZ0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRnhYb6LmBDLmP1q4EbTQmlWmCB3tihkNsvOyTuA9f1sx8vSbR9ptMxxnWPRQEYDg6LVFD+CqwJenEp5PJV9OoINt2oEejJqL31KOTvMETOe8Er31pKqHXeIYlcdUot+DKCKWRbW48lAbqtampl7PUMApvUhvG6UIuYYQ+PpaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DGNF3scO; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dd15d03eacso26612196d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 20:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739595252; x=1740200052; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk5ud9oKcdPfSa08b0yRfW7p4KmWGP1BqSd4dcIlPyY=;
        b=DGNF3scOsOiSGIfblQujujVvl9SAKWxkYh7Ey9iSrHzLbZnUoOMxC0vnuMZEgIC3fe
         vg3KYHfISFjKYGyUreKJcgi5FJwAT7VdsGWRqN1bmFapVunjLy+/t2OpTrH6iNGQRhlQ
         dJtmKbF0rdxpOnc0qGL1EG5clhwhSm9FPpX3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739595252; x=1740200052;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk5ud9oKcdPfSa08b0yRfW7p4KmWGP1BqSd4dcIlPyY=;
        b=gG0a1/JOupXB2l8alXsnkpPM0X29kyBBSN2OrMx6rtg/mCshP7R0UpxSF52mly+H8B
         f4OklaB1GM7hm+PgI0tuphsfIiCUeCIheOsGJRYOY6mZovbt329dnzz1IEDLbT7r2nYi
         LzVnSTlIVK+qzdzvv2l/0cQy4uPgkw6FtGNahNdwbERxzqye2tfGv5bxM4r8RXqa7mEu
         mFHnZCl4QNsKlbCx7dwxh0Nk1OznSnzHTLoOyB5HP7dA+VgjKXJAuProWL063bAzIi0j
         wNuzrL7ZIWqZSUeFLa3H+kiHx8Tja3xXUXDLQTRF8wIrqzURUfDt8jW9ZJh1sK2HyAV7
         bnlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd0IZ5WtuvwMQ+B/cOOMwgruYG6KXtJO30UR8zUyhaEe9gIytHOXzWSrMLHaclsp/rjq8035IXWXg7h8PE@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRor8UOg9n3jM1oiFX6GfBX8zJJr4d23YXEcOJK1a9rlURhXj
	dcYBPFjaps+gcs6bAgbm8WkbeRGlJplLxGLCPE+srYVHSlmNCGIbOrdG/N4T7IQqeYgKnf9SKlv
	PpAZb2GCeb8Z5rxeBsGkNEcTtQ+xtIC9tI6/b
X-Gm-Gg: ASbGncsZmLYSPA18j+6LB+DZJtqTKx+SUvhoDmtyZp6IrkQw0XP+dFsHajm/DB0VBT0
	o6oMcUDlYKgCCl4oR6CZIQKs/0aNZKg0i/r1mBxHpeJlj6E6sUn3o/Wg4zdM8yfL1mm2hoqK7kH
	qFpho3sSiKt4PG2jqTGOCK/rzv
X-Google-Smtp-Source: AGHT+IGzK9Xw2SmDlUW8aMokwQq0lVBTGu1ZfRfxjaN3RAOn85fLCKnVOv/nBSKRqAiwjG3tNqoev++XhSLCxsebavE=
X-Received: by 2002:a05:6214:d09:b0:6e2:49eb:fb7 with SMTP id
 6a1803df08f44-6e65c8c0796mr145135586d6.3.1739595252358; Fri, 14 Feb 2025
 20:54:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 20:54:11 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 20:54:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250213-amigurumi-shrew-of-grandeur-bb1a13@krzk-bin>
References: <20250210225714.1073618-1-swboyd@chromium.org> <20250210225714.1073618-2-swboyd@chromium.org>
 <20250213-amigurumi-shrew-of-grandeur-bb1a13@krzk-bin>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Fri, 14 Feb 2025 20:54:11 -0800
X-Gm-Features: AWEUYZm38Pxk6_mjiF-w5FYKquBrOAN7Cotkk66MVQ85J6cLXb_xLqE4js1sOZU
Message-ID: <CAE-0n53Q=HFtZqgTNN2iq-XEaedr2zMJ63=k5+Rn3PsOf69fiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo
 pin keyboard connector
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Krzysztof Kozlowski (2025-02-13 00:11:25)
> On Mon, Feb 10, 2025 at 02:57:11PM -0800, Stephen Boyd wrote:
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Connection to USB2 port providing USB HS signals
> > +    required:
> > +      - endpoint
> > +
> > +patternProperties:
> > +  "^keyboard@[0-9a-f]{1,2}$":
>
> What does the unit address represent here? Why this isn't just
> "keyboard"? One connector usually has only one keyboard, right?

Yes one connector has one keyboard.

>
> Maybe it is only to fulfill the usb-device schema? The reg is there to
> represent USB hub or controller port, which is not true here.

Right, this is to fulfill the schema. These pins are connected to a USB
hub or controller port, so we use that as the unit address.

>
> I don't have any idea how to solve it. I assume you need the keyboard
> child, right?

Yes we need the keyboard child so that we can make sure the keyboard
that's expected is plugged in instead of some other one that doesn't
pair with the device. We treat the detachable keyboard as 'not external'
or 'expected' when it matches this VID/PID we have listed in DT so that
we trust it slightly more than a standard USB keyboard that you could
plug in to a USB connector.

