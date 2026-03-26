Return-Path: <linux-arm-msm+bounces-100153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMUqLkeAxWkk+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:51:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665533A6BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B24A23112172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E20A3A3826;
	Thu, 26 Mar 2026 18:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0/avLhY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146D3947B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550501; cv=none; b=qa0IC1pUfAvvFGzYi+GlreI4av2c+f/qhTD3P+E0r56NTs945EaiBzK7krRZZ4ZDU0ReonbwowVq3jvcmyYTDY5mfxVilLEbDFui2uPZFDFDY9Uq/0kfU7jpU7uC+95H9i+Wmv1qdRPVlH4xl1anYIsP2nsZb0x14oB2mZqTYEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550501; c=relaxed/simple;
	bh=bJ6aPe/Nui+QtwM6pXeCZFiQSEzOXhL5o526MBBhQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y81EnO0Dx1mMKmWRyuCo7LnBTp12fbxubfsYMqlBBhzuQdJnwZOppdWCPdWFN57CZzxKGmW+Zj6KIS+LH92S4YVZzAohQMV2UjyYFdeVTK8SHKcc2Ve1SusIQw0Ho6inYREq+GQoOAijlCwJT9pljxL26d5mVUY9vd7AFP7S9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0/avLhY; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c766a95a72dso954436a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774550499; x=1775155299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwjCW0nYj9p4CO0/GU2nqORuahjWsn3xAn/vBQiDUkM=;
        b=g0/avLhYWeUQAjbmFQB51pk4QoETWtzlA3Q0BknjGbf06jt/6R9vn4B3WQhXXLjZnZ
         6SQaGWu7aEj6MWXJ7Kxz1a+uPvgWuhV7AV85G54CLZR7c4mqFqNbRJPZzrMvOfk+D3a8
         hwyOO20Cpyzg4euDTEikpGe1V8t4dEqv0hsNQ7JmwsIoW2TI079ACg2e68YCtincfnhh
         GDou0kXJodeK1I+cWrS39G2RMH74/lZScCrA759yMO6QKZYiOz3ZTgvVeYXVxyfKnhpD
         pelNt5MmZVcNZbohGy8H6Nk0IOfcQ4uyhxg8hAyHN4qm4j62FffWbKzFymWQVIC3P12m
         D3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550499; x=1775155299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwjCW0nYj9p4CO0/GU2nqORuahjWsn3xAn/vBQiDUkM=;
        b=E1Azaa2ugne+MTwHcWSMQCusuSraU/Tbf2kDjGZiZemOp1mfHVHrJwNOFyd0IIep67
         FHGPDOH/LupOsX4rCutv6/0HbVgH868rqiKJRAsQYlPI5QX2KZYQqXLMlVXKcjVU3v3T
         AAA++iiGxRYrSXUxSjo+3WeIfnLZY6EmIl6n4Fuy0PeZ0jFlQOAVQmJuh9mj3gZB1rti
         sBjPvOntxIgGZGBoyHWkaYQwArYD2oPa1N0idfUjkst1Q+v+soS2ow1rR3OQ3WYZ7oRr
         A7Et7IknaMr5ykV/Y5iHkHa7OpqrrF5LUOmX2R7AccD1hcnNF8HFRRUhKcsBhZfZEwU5
         Tp8A==
X-Forwarded-Encrypted: i=1; AJvYcCXP8k0/1p7189vbZhJZO8rlxuyoxBOY8rYZorOLeBKxD+sYM0U1Cz4q0yN2pMKCrHFkHg0A9q+EsfMvU7pV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/c3qd2QvMvtw5Xh94h+v+voxCgTSGWRs7IpV2EDh7k192G8l1
	tmS5pNe29MKfTMmMvIMUJkcLKnuh6VAyhrJVLApQ2zppPJRTk4PEPQP4
X-Gm-Gg: ATEYQzw6U9EF9FjFIFfJAlnZ51wk6YL+d3KGXs0PBEyMNkM1x3s0FJogx1lNUsNCSZZ
	I6SRVnzZhzuVOOdy974tlhbsroNKt97Px4FwBpAIUzvzEunrsimh0VkcmmsiZozw0dDy3UUf+TL
	PjR6KbRmXQYyaPwZtPijaQqMOedvuj4JKSw5O3VbGDUrpmd01vgd2hOvCSfoKrPe91uCtI8i3tB
	L/Lv/5upN6QvICJafVt+45H1XgJdReHmkmQlopNFxJ+DK5pbzQ8cObMUDcryHF+rbZmR75WW8KO
	PvuwnMJcxZk8dqfjHcmOs8W8dVSU046yOSvk8KyvXEF6LJdDtiVLpVn90yOgibU50Cf9STkqr9W
	74mJIEeEF+CmE3viBcZHfG0crBR5kK4oxyUzgiV9jeIX/nvtBy4m23KwsSOKmZFDJ03dT7JN7Yv
	l9AtlJuqqLj7BTk1EoNVn2
X-Received: by 2002:a05:6a20:3d81:b0:39b:edcd:d936 with SMTP id adf61e73a8af0-39c4ab8beb1mr9569115637.16.1774550499135;
        Thu, 26 Mar 2026 11:41:39 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c76737f42dcsm2983400a12.4.2026.03.26.11.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:41:38 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
Date: Thu, 26 Mar 2026 18:41:24 +0000
Message-ID: <20260326184126.9280-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100153-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2665533A6BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > The IR transmitting LED is connected to SPI8 controller.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> [...]
> 
> > +&spi8 {
> > +	status = "okay";
> > +
> > +	irled@1 {
> > +		compatible = "ir-spi-led";
> > +		reg = <1>;
> > +
> > +		duty-cycle = /bits/ 8 <30>;
> > +		spi-max-frequency = <1000000>;
> 
> I see the binding allows a power-supply handle - do you need one?
> 
> Konrad
> 

I have tested the IR transmitter with my TV and set-top box both.
power-supply is not required and not mentioned in Android devicetree.


