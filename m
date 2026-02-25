Return-Path: <linux-arm-msm+bounces-94047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P4/ADannmmrWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:39:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B502919396A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 303C43031F18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0622F39DD;
	Wed, 25 Feb 2026 07:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YFt0B7kz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABB2F60CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005114; cv=none; b=IGlF3W6xq/H7+fhsmt+mJu6eCHpq9hzn3V9fMmBmEGYjFJ8UgcekoN/W5795j7zFtbUimEJqsD/DcoFJlk7X73c8qo5/EZbFBbiyRo6SivdLqgERpbKbQk95PPS6l4VsAqDACy1IvEefdY6EC23eOqyw7ox/JRnir+vu2U7IGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005114; c=relaxed/simple;
	bh=RBbXuWLXblfk6OwSd9oD/neH6OS15UC/fy5GctQv3UE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kxPe6FtUthfLk1s908oMPgjvFDhXUGRUBsOdhQWNEHQ/nP/eRRlfRlZDEWCjf9GqY16PvLsJm5dIpJb5enWGBLPUg0NcgPyi0CJZRwsRRHBy6LXVcDQEhETtgqvxZbEWCoRb/wmHEBroxWqoDGtXfH1G6CAKhmQ89aicpKRy3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YFt0B7kz; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b8f992167dcso762301766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772005112; x=1772609912; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBbXuWLXblfk6OwSd9oD/neH6OS15UC/fy5GctQv3UE=;
        b=YFt0B7kzDND5OVl2+MnPcsAB9HGkjCkn/jj4r7YU5tBnp4y36qwriwD2e5CJdI0c/6
         1sDt5AbR0J+c+HHL9iWMYCeX6umOneiuoC0ZlYQAXmOO0/iqYeTbkdfSkC17K8fzxtGq
         /zfB36IRQ6XEmyLqYLfAAdNlx+L+e8uYv0oyjuPlGY/5/FYMEHHOWNr1TkEwHRZnV0mo
         ML2hpvsd4YdzGSK6FtoOvy6TxNtdTaUvf7+r47vbkl/ciYb3wl0Cwq3OMvKh1e47NzxR
         zRI2ex3XM0JpGH0xJGYSrUPPiCbNLbZBcn1JLffUfpiP5p0Y+wK+WTCgrntBVYa06+eI
         xiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005112; x=1772609912;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBbXuWLXblfk6OwSd9oD/neH6OS15UC/fy5GctQv3UE=;
        b=wZ3hpFxXQWt0rR7hhmAyNqacsnLQOshYWb3vBL26guNa1bjUhaCG19P1GTBtplVtip
         PB4XpOdHzu5twI7LGgJAEzGytf7gm3TuxNCdwbOEG/n/ZYu3cCkObmCot7dXoXPrtZeb
         Du0sKD/PJlSvlVA25qs+V3efFgZJYaf9ri4SBfOmF7dsm826Hhl+u63UgHFuog0c/ejI
         0H0iiHYtNzmIdUcux/hYP5GE7GjWlC227hAIRSiO+C2PweT3EnU6uzUs/A7F3GNSLY70
         /X9BFhCRWFgE2gj4l05oNbek4yL7zGVDneWJeEd+QBzuvbuFRL8uhdmgRDGNyE0tN+6w
         Gthw==
X-Forwarded-Encrypted: i=1; AJvYcCUX2oWlbm2b71xMjENFKcc+Nt/ERQ9Zd/dYJ9rUMQZAJ6xVdjhkiSTIiSkbofFucGgkluTQI/GRJgo3WOjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2HAJL2XjMIXsuy0WaV1R0wp5mVMYIHxtDpeKSb3EjvL74mj5A
	HzG50i8rBEMqCr9Tyei5AYNTtyp/yaO3GT2OY+S1490AgsMAEAw7a6Lcw8BGB0wUTzs=
X-Gm-Gg: ATEYQzzmtT7fY0PK0Q0k1w7Ujw5xwVh/sliT3upli5pO8ejm86zltgs3gdjeIVL/I7N
	WkQRsYjrp4gruDeyauHVeTg1ffFdntpAqoM76gmuq9wB8WE7VSPhbA2F2Ar6olfnA15xX+kt6UJ
	t8DBbni40ZQYO6lwSoEzd1rC11P4B9W1eoosJRvhGmoxKN6GpR+o6I/SZ9aulRKRkkXgds4vXyG
	SaXMluRlJeAzmq533SLe9LUDP/FqxsAez2PKByuB8HDKRIft9TMq4DkW2gPIOHOfDEagcgMFMBK
	FVolyZs8m9kxfoLPCuP902C8nGlmmRPUVvFvvpWoS/ykRrmAEiyWBoKuLDLRMwP5jUc6fe6XQ3s
	/LaLMBG6RdJeyiSiGnIzz5m+Ozq0oUKeasUoFsdszkwuQzdvFGii+k71YyBwJKHGiDg6hSmEZ5y
	bEgPF3Ehw7MDvczMfHjxcp7qd6DlNJ1yU8Y8x/TIXXKhbtsG93G4mUnpQ0ip1nry3XEM9H
X-Received: by 2002:a17:906:eec7:b0:b87:c92:25bf with SMTP id a640c23a62f3a-b9081b23d71mr868904066b.33.1772005111791;
        Tue, 24 Feb 2026 23:38:31 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084cd4adbsm494528566b.29.2026.02.24.23.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 23:38:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 08:38:30 +0100
Message-Id: <DGNVDXQTH812.3MCVKWNCKR8B6@fairphone.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Avri Altman" <avri.altman@wdc.com>, "Bart Van
 Assche" <bvanassche@acm.org>, "Vinod Koul" <vkoul@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings:
 Document the Milos UFS Controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
 <DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com>
 <yq14in67xwd.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq14in67xwd.fsf@ca-mkp.ca.oracle.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94047-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B502919396A
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 8:19 PM CET, Martin K. Petersen wrote:
>
> Luca,
>
>> I've added you to this email now since you seem to pick up most patches
>> for these files. Could you take this one please to unblock Milos UFS
>> dts?
>
> Applied #2, #5, and #6 to 7.1/scsi-staging, thanks!

Hi Martin,

Thanks for picking up the bindings!

I'm surprised you picked up the dts as well (and modified the subject
line), these patches should go via Bjorn's qcom tree.

* scsi: qcom: milos: arm64: dts: Add UFS nodes
* scsi: qcom: milos-fairphone-fp6: arm64: dts: Enable UFS

I also see these in your staging branch as well:

* scsi: qcom: hamoa: arm64: dts: Add UFS nodes for x1e80100 SoC
* scsi: qcom: hamoa-iot-evk: arm64: dts: Enable UFS

Regards
Luca

