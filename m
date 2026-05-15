Return-Path: <linux-arm-msm+bounces-107697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH7fE4t4BmoUkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:36:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC054871F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3CF03032F66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 01:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BF635E955;
	Fri, 15 May 2026 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7vS/yh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA0833F58F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808964; cv=none; b=trRNjCeRGdaV4DQo7lgmqP8nW8D0BZ1tC75K1xDdci3oMuiRlnpH9vJwSKYfI2C6c1t9yN+unYlaVl/c612njtoU2ZeY7ImG1LuTaujQYLOoAd/xNW6f9PhToWPNaWe8T98VJagKufKGYBjxSKRjD5ERcZ63IxjKwt3mQLAfUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808964; c=relaxed/simple;
	bh=qyG+SWsCYJzW6ePta0HqJQ0JlnEc88TZlimHgFAjJAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHFDsfnH7Gyl/DdTIcxuVmfshvZagHxqkH2L+F697m30cXBC5HCVrpcCumT+TOypAweJrv6DCwWht9xu9xNQEGk5DK/32UON6igj6FQA1hUQdGRml9aJwdMsEQGcwoxaUmxGYN7/KKxLQPsn2CIw39eszDJVAZ1nDciKVqLZzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7vS/yh/; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c15849aa2cso11817455eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 18:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808963; x=1779413763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krEBTTXiK5mCDN2/ksztHps+97IcSWBntWKsCM99zy4=;
        b=a7vS/yh/+bXHSvfjhxxRKShavtNDHg3JqYLQFNg+fynr101ELtBp1OePyLnelfpk0p
         T/AGq9b+3n/KkmVYgOP+26qgiT/K7+Rbsg/HFlqG6hDVcLg0LDXcBzsRJtaD5yxafomq
         9dfzWLEzVqcIHnZtpnTpR0ckANM4KeNVFOWlhqRK00ZsuuhHSNBsgRoGQwjjUh6CNeAQ
         6CqCJQpjjn1rLkTe18Uu4miqgmYbn2FxoyTDrjLg2qwb5zOwpaORs5H81C4beXeR+C2P
         Flfusr8cgkKKT7PZFZuRA7SzlB/mRDAcB0uehU/VCapqPMjrLiKpoTswkrzY5fndsUVm
         2Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808963; x=1779413763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=krEBTTXiK5mCDN2/ksztHps+97IcSWBntWKsCM99zy4=;
        b=Q6hWpiVNghQz5vQ7BLtHpPtUwFc3Ph+KP8EtJUfF3b3yXluRlZfd8EYdq2GfZtZTJn
         1u+zVThV0ne75fnQ7dPyV6tf0CMcjHZ97CwJ/Z6IH6bhX+t74NiUZVXkPRxrVNIDL4ws
         fztKhK4W5wuG2WTuw7LaTDXxnRnGClWLb0Cuc2a14pfK6L7Jb5VBnZIWZ3eGs2tovXdG
         ynp/Y+AczyDu1aaH7V9uC8pO7XdS69fIs476/CrYKE38R0xXOpsUmql3PyZXLgIt/AnZ
         BxUvFH1zuHaoQiVYykfE6r8JIJTFeai2I3k4O2bPtzyKyOLH+lxLB37Gx25wwA34akSs
         iJbw==
X-Forwarded-Encrypted: i=1; AFNElJ9egO0eFRFDnZ0UgK2vj6w/0VrR6o2ttLjs5LXrHOqG/gQrI8YXvZmZV5+wA+1kpG1ycN3SPohieELbB/fn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7TcW22sST9ozr/rIcFG8tXmbLBs+qN27CF6yPDAKc7s1nkoEc
	BWktPxN1PYmetoFifp6ZqOhfGdX8Zvop0GaGcaSE5S6D2L3LLIHuZPNP
X-Gm-Gg: Acq92OFYmIprtkWC8G3Itf+J5UFm7i9LJrUYvQ8AC0Rj6iimZFLs8KLajydGcEGNF8Z
	RKlmUfNeEHRfGEKKu/EjNWsJp35ZxNAN4MAHbB5vnB0a+6A7LXZw1G91WVGCUpG8bFld0L5HslC
	GtgIWEg+sx5DOF/5dNnQKeNIvMuwBrWIr9u7tsK38EfOjcSumED5v8btSRn4cDtM8PmidbK/zeB
	LflRlFlBSbH19Se2rTms5MNguby2Ku6y0vou3nh5xTJba/Mg9Y0e2o65CYl8VUB9c3C1sXbGKst
	rN4qumKtFmj+XqqHtN1Dlpk+yjMBHKXZyzfW31AoLr+YGicWXxxmr8hBOL8LXobbPNwoEx1EIfV
	pIA6EZc8ehlzBrzF6YdjFa5FB787s3tin2uEStnLYAJz8VhUFcxapLTQcUfH32WWkghWBHtl95H
	ZVN0gd0BqpMkNRY0N6GtIZ7tTT09ehbCl0DNyo
X-Received: by 2002:a05:7301:600c:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-303982b788dmr969693eec.8.1778808962665;
        Thu, 14 May 2026 18:36:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm5316673eec.24.2026.05.14.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:36:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 18:36:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Document IPQ9650
 watchdog
Message-ID: <d06d3948-acea-4f92-b032-5149735733a2@roeck-us.net>
References: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
X-Rspamd-Queue-Id: C0DC054871F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,roeck-us.net:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 08:10:23PM +0530, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

