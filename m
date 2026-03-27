Return-Path: <linux-arm-msm+bounces-100493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHfnKBcPx2lXSQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:13:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD334C3A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B468304EF3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C21C3921E0;
	Fri, 27 Mar 2026 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJgc7qcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA43815EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653175; cv=none; b=U7cU1wqWXO3eyGEDSMF+TYOe8F1Oe+4ZDoSkLvNlWRm72iboJ7BPWSgz/o8ge+fjwwF8+qDE31pDpeIAcNJXueZw2WrZ6HX++F4WMiYDy9mWn4c1LfPa7cZABnDyiiC9STlQvh/p/qfA8jBgOzyOA3UOCeFU6Q12IF1EoPpkHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653175; c=relaxed/simple;
	bh=Dyf8Uep7z9AHl9YP5OrvvctV27DGLSkq8ucH6yD4WD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlIwkTyKzdftnQ1GARGisYWz+pk778IREb/DAl4/5SV4gvJL0MS3SdGfnSnb7w4KVmzppa0L7f1eJImY+TTONOs3PcslDMsoESe7ZVDkXvkQECRoZX8ir3mrBazN45qGU8ofWlND0gbwFkN8oBTGTIjuGz/SyERh3JESodEoYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJgc7qcB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38c6bd590f5so2163471fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774653173; x=1775257973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OziGBdC4J8yoVgtN1D7aBpVXci5U7b76YaSG2nVXofg=;
        b=mJgc7qcBThuqzmGoV0c9bPBxq2a5sHGbZz3prD591ntYVsw4E14cbBS0LbxtacgRR0
         Y+Rtn5+F96FxxkzMuom2xNMWtzA2YVYolb3iZZ1VQHKmvj0Lyw9KoxZjFkjK9IRtBImw
         Ztnjwar2rcdHoMIaL/BOoV1W3nv3y2zjt+OrLlb6NDS1Sh74tiFHR8tEBWVoirrSG6sT
         0ZODkh56/FcIMM/NUH3S1WK+wP2c0gb8aV7Q5xcfg/8vptgjrkJcSREx4dUr7o2u9ews
         coBX9jl7xWTukaWWGd+PZeogRVMvTlY/pGlSD+8K+8dITw6tUXSoog1lfwpdnsJc4SjI
         O8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653173; x=1775257973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OziGBdC4J8yoVgtN1D7aBpVXci5U7b76YaSG2nVXofg=;
        b=XxOc9As8UotTkxo5Ah0Q+14etKQ9N9p+ECP/BEoaNEOFpbXW0sJEosnBq2ztwadXjF
         XTWhymw7R5n1wU//I3PakUGc1yz23CPBwranYBWNoY7tmdpJK53mtmNX94MMQkQvfa5W
         EJBB/4aF99sFCA52YLO018qa5Z/Hwr6RgNz91uxmkNowyXFgCcBM2Tw1wlM9L+mTtMNN
         Wt0oJ/024pp2YofoC4Gb+IfI6aa6AAX4Okq4+u5tD4c0BTgfnEUCy7Omi7yz0jQEQ2bX
         bNzel1GhO1F+qlxUCF0gmrt9azCE2k5yOYdYJDdhVsSIk5rY23cfYmnxenwfrxoiYdTT
         AcGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBbIvnDaamqZKzg7KP3S5xa8Ke8VRAXxCB7L5CAzKmis1k2UQD4hJGtVJ+X/trTDKxaG6eP13QVc56pM9a@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWLQU9iWqgfgCMwrGc2rKaMsr9SpFICjcHa+O04pG8/btSEsS
	E10GsYUH71PqW9BLLESFOoxOs7xL7up1QKrbxEouGHtAFx0R1one9As486BjhOxkbOY=
X-Gm-Gg: ATEYQzzYRALhU6VFFq0I1i8b4hjCcwClLTCo/RnBGxl6ouXyym0Bgw19LFSszUBYuUJ
	Gj8k0h19FuqbBDNNvJX4fcjraSpNRiXAlW+uVxWabnsSM6lSbq9gNGr1qNCDB7wKeU+pMD63mku
	FaWBhXxw1/zFSoDM7E/q27UtJ1MNayEUAuE10eEnEgazM0wuI9b6wDJc0+Ih1tijsC+9jfxy9vt
	nTEiYVSHItVf9/ep5FXWuAFtJnp3ltONeOS667eFpLE7+HmGjTgzwGUnBWJgehQocoNx8z42cs5
	v1eDZ5l0NqRpfLtTtC5kr4iL3RF1BmoT+naKqGVB2a54BWj6qI5hLDEfdMu6D6LIBxGt4T6oyPL
	pb3DOeYE+QxhB5lf0VxOPIIR5LyhwrjNAv3kdDm9ffsq4X3l7/lHMWH1yZ4/mgKhlSVKJ7EJKbw
	iuQyfNWIyqHuFNqklMmaheuqmL/nXJTGZL86TMfkT9JR0o+Pr19BsTn7aOWDl6S/T8wz2SQbsbr
	+jDFg==
X-Received: by 2002:a05:6512:308f:b0:5a1:23fe:b047 with SMTP id 2adb3069b0e04-5a2ab5965c7mr751806e87.0.1774653172597;
        Fri, 27 Mar 2026 16:12:52 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4289sm81235e87.15.2026.03.27.16.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 16:12:52 -0700 (PDT)
Message-ID: <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
Date: Sat, 28 Mar 2026 01:12:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100493-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 46FD334C3A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 00:29, Bryan O'Donoghue wrote:
> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>> That's just not true. If you read the camx source code you can see
>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>> PHY to support.
>> This needs to be identified from the data-lanes / clock-lanes topology.
>> And once you do that, there would be (probably) no difference in the
>> hardware definition.
>>
>>
>> In other words, I'd also ask to drop this mode from the DT. This
>> infromation can and should be deduced from other, already-defined
>> properties.
> 
> It still needs to be communicated to the PHY from the controller,
> however that is not a problem I am trying to solve now.
> 
> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
> 
> I'll aim for DPHY only and we can come back to this topic when someone
> actually tries to enable it.
> 

DPHY may be the only supported phy type in the driver, it does not matter
at this point, however it's totally essential to cover the called by you
'split mode' right from the beginning in the renewed device tree binding
descriptions of CAMSS IPs to progress further.

-- 
Best wishes,
Vladimir

