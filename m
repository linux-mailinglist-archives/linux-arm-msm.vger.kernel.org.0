Return-Path: <linux-arm-msm+bounces-100147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHLaBIh7xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:31:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA2B33A1CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1AFC305BB8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D1739EF12;
	Thu, 26 Mar 2026 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng8H+v2f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA0346E47
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549717; cv=none; b=i5AxaoFciVR8WBEYit4Ab7eCd7i48uf7l5Gwgewyq9KOwUEfCIn24VcQPnu9NhIEQ9edRoYas0kUo3JLeYkHNQp7ATv7QLLz8TfaQQnrNQcQ1knumClLaRRdeomElYOBOORKlOHXDWdIGrJydsPL9F1ArjK2kQOxZI3Yt1sYuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549717; c=relaxed/simple;
	bh=Jc3WGM9+nSXAgx36gi73IUpaDeFuSOdmq7+OowChnuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVSepnw5vwwE91+K2TcTVX2FEVpYv4wFh420GI8JSQdYSGkIevU4ud5zNjdMoNkKZ84qT2nFqameE6UlQiZE1CjCa/s4kL/DsIbTJyc44KPfrKCc+eHfYylYnuzHViOUW++YCSWmOkNrwRy6uWlEKjE7ZTo0aOuqSYyP7CweSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng8H+v2f; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so818617a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549715; x=1775154515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=Ng8H+v2f2gb72FkTKL926Ur2LpFCywyblJxHiipmgBBoesWnFT9mK4JGhYLTFG+Gms
         CfY5M4yzKUScXweA9XyaI21nEB79fAFAgDRMbj6gMLA1sMWVRWBcSbmF4vyFm+pg6FTA
         okINvyZaUY5KdplTpCBaiPJhSW6cmDLzAgkoZxuJ1lXkOuwnVBYqxexny/0HhKkvEXaL
         L0jDS1WkN7jAHkjegdotknB8wEO9OLsP55Aibjwb0qORUDXWd3ZdTGp+PECnuCuClWmC
         kC7nUEyNcLXur79YXFvSJj6h8kFLoHXfFihbkjPGsq/ZJukbimctau5N50qkhz5kw2+S
         gntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549715; x=1775154515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=jmD7ADRnTDnLPLLZrfN53NTUmx3m6vcv99W1vQNasGb3uxC0YMAdRxvQU1gYFh4zQ7
         aGwNNWhPRgu2JLL56gs1rkWwE0Y0+sH9cxjHgZYJvdI9TU+9obgXu5ujFaxH0Qjv6nbJ
         JckOxmMvv+CeH+G/SV/0EAYbLYxXiwqAwe9QfeRISJULfHRS549e2Svw0HH/JFVlyrzm
         chqK7vtz/Ly4jTfNjGuXYaScpoYePnfELc5wB8viyLJirH4U4oaqupa6PsUlhnPYkweU
         uIsskJOyr2US7/aO8SOLCrlrMf336L3KStM1sZsGf9PNEkPtVhrEg7RhG73p0j7zhEkZ
         ZOew==
X-Forwarded-Encrypted: i=1; AJvYcCWYSV4jR/vNCV+ww7+imK/NDW3U7VlK+FtCaOlufDj8dcaLzvc9m+Ho8AzxI/FQ0yyE2jjVayhMNx7M7wrW@vger.kernel.org
X-Gm-Message-State: AOJu0YwNI7rWUHbeiCQG74yyTn6nQ7g1EgoBNAp/z+lxC2IKf1vxhzer
	e/x0h2NnaoJo2GXOLGVA79ZwuvnKnYLN5hQDgaZ8CaB+8M7zpip6vsgN143wtio2
X-Gm-Gg: ATEYQzxbhYRXPKUwzneJ1G8waKNVGCAnwC2PernqnYqXzhFJ8lReJ7kkb3C+jQ7ixHu
	TI0fJEYkG/wPOiRrghK0Np3cH7fmwq8ZPDWwhes9YsWbm7j98n/pKQRs8+w04HS50Ym7pwPwsu/
	8vFhCHDX6Kju/GFeLM8/Uj+9SLBi6qbTaDYwvLNvjm4VLw7EyfKGmUJ08HgfdYmivUseTPjRkPx
	IZu3FpNX4AwAwjNSKdN+qCLGrUdtlqZSwZwJzByrg2/lTv82hoWTJXPHIC4f+qrer76XHWACkh3
	vhJEzt4DWrWIClJBOAhyZSYYulAuL3TG24cV8Tvfl4hkBA1zFQLklNVCcL9/8ltL14koCnjPFzn
	8RIy/R7yBCW9vOQfzlOamNMk3ozwaio/g7IJ0c8Jl1/YKesZkcv/EXw8mhw5AiuyPOAQ1FqiZm7
	JYlAAj94S8dEhwf6qbTdxKESKcpcT4XR8=
X-Received: by 2002:a17:90b:3fcd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35c0dc813dcmr8363731a91.7.1774549715010;
        Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc795f08sm47816045ad.21.2026.03.26.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:28:34 -0700 (PDT)
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
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Date: Thu, 26 Mar 2026 18:28:19 +0000
Message-ID: <20260326182821.8332-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-100147-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAA2B33A1CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > Plug in USB-C related bits and pieces to enable USB role switching.
> > Also, remove dr_mode to enable OTG capability.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> I'm not sure what this is going to do for other 6125 devices
> that don't have the Type-C infra wired up.. Does just applying
> this commit alone keep peripheral mode working on your phone?
> 
> Konrad
> 

Yes, I have verified that USB peripheral mode is working with this
patch only by using USB network[1].

[1]: https://wiki.postmarketos.org/wiki/USB_Network


