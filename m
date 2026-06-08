Return-Path: <linux-arm-msm+bounces-111720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GBJ6JcBwJmonWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:35:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3F653953
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:35:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=zXqWonrW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 043DE3012CFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F7E38F646;
	Mon,  8 Jun 2026 07:33:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B7A38F949
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:33:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904038; cv=none; b=NEeUChsZbkVXTwMvMbSwxQ4CC7TarzwfTfuSjUNGUho2u+qeodOp/7w1a67mXf3GoNVg4PFWRCbaAQFHqS6BO860asy7waBhNo82/11DjwwLnM8Z6wwLbDCGnN6UahUK/GzExGBunuiMNVEYHTs05k9QLeYdZua05Uxh04znkpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904038; c=relaxed/simple;
	bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=p4ekeJXZq12bNu2vsuhYjlbzY4X7kHXS54buTNXDQ/NNj6Ms9Gz4+xrGSxIeSKWHpLYn7Qpw+JbjxVb9tr7gmCQpvo0FxFJDOcLH6mn2BdamQeb9jIf0vomjoUexBCVC0bofTzrH1FKTfTkx9A+lDRnSZAK1EcxXO+zrITQ2z34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zXqWonrW; arc=none smtp.client-ip=209.85.218.50
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bebbc325000so465836866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780904036; x=1781508836; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=zXqWonrWFhauWO395Q9+0HIxwy4vwO+PkgEKGSBJ1qpZ1bh/XpORsolDvvzCSIAXQV
         gUnJRBUtelCcgqPdViQrVpbFb0SNlYumwjdWwxufnh1zbgg6W/0RotckB/ZtiA2UjMDR
         WE8U12rGibdjlyPDBrlyr+1/c9TOOlSXBEiwCCn4UxKtp4SWto0pfFfFDslBH6uKAo5R
         6mVJKPKmGI2wJwT6bwLQEQwmwF5zkAj3NOWtYwNkQ30frILx5J4D/6ZqTjemYVKew6MS
         gL4abfzJo0jsX0pBDpaO4kiKHplWefWimnG3emrWrb3zR/8EhLBbzFS/+OX43neTAl5/
         8LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904036; x=1781508836;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=gkWOmZdw4hmXIRVOz66WTKc/ITV7qGdU+9c6LG/PMNlpvp2RdtFJsnHrbf7sX2Kp1i
         08vbyocyetVctQissjQzQGfnXn0fC2VmZ8t9ewVYMrLzvMzeLAwvaFrifB96/saFc4aX
         gJM+y9QE9smAm3vOyYcUMsAF/wsgDz6Re+IXUFZO0mKVRhuMO0GPG45C4zYFeQPRq0bt
         OXLlepqdAbD/g+m/znw1+EmALDLVMPABvASqpo1Ip4KhDQXPDTpY19//SDhXodnG25wI
         bYGTn7kEfLj2V0pJQiTpxQ2nW530dZz2F6f1YJXh9kmrvk5gsXedlkFdXUA2peF0AYPm
         9XIw==
X-Forwarded-Encrypted: i=1; AFNElJ+1UtwwoA1yx9exI45f+el+meDJgslNyAqWU85avgQR7bLeiuG83nqAgy2CqIVN1vIncRhjZSMcmU50tZV4@vger.kernel.org
X-Gm-Message-State: AOJu0YxWaZw2Ri8d5VhT+lB34Y7+KD7eDh1LRh7GeYZWR26maxVvWiJP
	1FPqxVtclYXPTC97vG2IBYBb1Xf5jDo8ZISfuZa259lGejByX/e0HkJqmYflxIGxFfY=
X-Gm-Gg: Acq92OHt15f1ExzERxSzDOBA/BzTVQ0rxiolIMV7vHrRYsZwpWYEedk2wgsFhRMmUeJ
	xbXRZwWXwa+aAZ6qc+be4IyGTBfBp9gcWD3dlNBR4xeJ5StLFFq6fv+bvSSAbjiHQEBL7y7vKQP
	NqAcgF7qKLKHLsv3kM+NHMILiNzGRQ70F9NNNRx2aihQcD71T32u5ccjUQw1xuxxMPEuOY+mrwb
	AigeXjHkEX2DGl+x37EL8+OXMLlUrt1zwTYAZK+Xq01pamEb2NfIAguK6Fa3m7oMn8mQ0arI7UA
	ynPwM7Pre9s6tbImUuE2Z/YgqmApTBuA0uk964nNuNmDNOW+dDCOrBGh9DEaKM26Y3ZSH6htoh6
	udb9efGDnV9ai9faNm6arYGe34YZ6KpA1uML076wWdOp/ROHHt7mdkbKtb5OTLud5ugikDQbJHq
	z+RUamdbxNR+Qxc0b/B3Tw8qtXEtvVLaQxSOkR5PnkeBAjoXOc11XM1P4paXNiH5y+BAPSwULb+
	rF6EW4=
X-Received: by 2002:a17:907:6c0f:b0:bcc:e8f:c3a8 with SMTP id a640c23a62f3a-bf3738f1e4amr638949766b.29.1780904035800;
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0522834dbsm815190666b.27.2026.06.08.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:33:55 +0200
Message-Id: <DJ3HSJ8UK5MN.3FWLDU8CG2J2R@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111720-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09B3F653953

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

forgot this in the previous email, another kodiak=3D=3Dsc7280

Regards
Luca

>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

