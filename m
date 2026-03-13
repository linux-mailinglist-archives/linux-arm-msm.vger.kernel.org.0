Return-Path: <linux-arm-msm+bounces-97526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPFhAZkatGlLhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:09:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28B284971
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2A9F303903C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69B131E820;
	Fri, 13 Mar 2026 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FSGfmcBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9DE31F981
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410465; cv=none; b=QVS1tIRwZfkOR3JRMwxCbBH7Xd0w/uqFAmzwmeifgQ+HCePvmS54WYIDL/RjolRbpD3nSHuDgnRFfJ5jDCpCzgs333E50VaJPXYGaVnWXjUbrSfK2RrzqguKpe/ijEAj4S66KcjcjLGg0jMrsnIwy2FxFbdNSODlQfXWu7SjeN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410465; c=relaxed/simple;
	bh=X2YXoo5oelC/yO2ZVmRm/ASMJDAS7BiQnBAfPRY5clk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tmsM5vf3NnCAsHRRzGYhmNGGMu7hG1V8KsXK1F+8GPUuLbp5gnQuQhs+SSiwFFFow/xge63QY591LaNO88tPN06KkVlrXaKBRE2leB0At5TeABW9WCmQFPKMn6utV6qqkAo6Co/pGMtmdzxMw2thPYWmY2hm9I0UVPa7leNm2CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FSGfmcBH; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso3147181a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773410462; x=1774015262; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhAra/BMCH0n/XOw/db/nSkVgG1PExpVOvX16LQ7Y04=;
        b=FSGfmcBHqRtqrE7Fk18MOZx9o3FRpU7JxXWfxQoDokwxTzBwpFV3FACYRbxijp1lHw
         HN1u8NCEBF0A+6KUT8hTJyYkr8enWR0xf3gJv+8OzxPe4ZL1TehJPSBzE//uzzFayQwv
         vc97UoXGtsd0Qopxc0vbApSx1leL9jfuve5DF9f8x2hAfxsxe58HpHV6r7JYLhXPcRif
         WHy03mKAG3t4wk40TJa+2ifSq1Hup2QDLRlXHiJhzsFipldhnahEKpTwLHU1N/Tpw5cd
         MlN01FhH23d4OHBNdDbheLyt7EKMpNo9ZSzhRUYfXo05JqoAbYYA8Ei92lbgeVdToMQ0
         uJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773410462; x=1774015262;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhAra/BMCH0n/XOw/db/nSkVgG1PExpVOvX16LQ7Y04=;
        b=AOsmEU4VAKdHJTZpFASlm+U73Vw3+Wn8ZcAYdUbsWLCKZQddFfQVucek68CD6meRaI
         iJkHVGGqojZpBUPaJLTUvjvwkJ7E/UEfq6j65JHDK3tqq9CbLvfKOhvDQBVsZjnmwYAa
         Z4y/2y459rIzk4PGte+rJUOOYGf3ZIh+WAwPssDQaxYWX4CfEjV+O5yfLwpHmq1f5/7i
         I3yd706vcbKZy6tIiM4CTPENkBDSVnfJ5h71XAE3Y8aZDwz4UIxIAWyccXK8mVQe2zmp
         xYE246ZA2daehLJuoj566nQlSMkHaUwVIyekrZxq0tqFsYRI1KA80KaSeXTP0EJT4cn0
         vgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4NwSVxpUThhMlzN54qWmAim1fZ5BiTB+F/oGI4h5WgPXhhS/e2kM7s1FW1bUlbA1TahuA5GSRrFAqF8ej@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhWXAkpW1aH3rFjWc0e9NAkz5Cm3D7fK//ne4pkWapmOUYa1s
	aQIe9ya+neXlSf8C8lt/5bFotavd9WmCcN/JcW1iE0MYRQthJ2P49gKti1/j1bLml2Y=
X-Gm-Gg: ATEYQzxF6FyQEp9jSKyXgRpXRXXE4IKeptAhC4wntbQc2+dbisnhiCK/986uEQDK+mB
	NxM5Xgm+r0w9KD3WU8qwCLMcuAm/7d3r09ZI3yxwdPit/WcXGgpX1Fk2eBma4mLIMrFri0Nq8tG
	ReCDP4ubqttdanCekk0xBFCczyrTWONDkdkw18ktncP9xEradYn2jmX0IA4B2VCJBlWMFH54TAw
	qWxzHFMwHzRfv6M7nGaKFF6xjPHvVzvFPeJ8KSRrf6qewHIoQuZmegsOvJvYb/KXkNeZ+bXQjwa
	sQKqtVjUbV+T1aSgBxdba7qT/pTrKNWqI5pNuB+XoczbHkpeHdxG8/0T7VkAZBQw0r5tUBpWgwv
	I4XSps5LTpeYL+rguLtmnYM3ZkS8qd2gim/mSp3cbGKETBQmCK8vojhQfb9cgKzWZd286mcO2Yc
	+9IfO4Y1zn/C3SdIUB0r/Cq0LgOUsbELoZCnXYyrxF5XbZcH5S6C+s6DCtDnQzLBcrvUEp
X-Received: by 2002:a17:907:7421:b0:b8e:d4ed:5eab with SMTP id a640c23a62f3a-b976534655emr128493966b.31.1773410462146;
        Fri, 13 Mar 2026 07:01:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba2e01sm48940266b.9.2026.03.13.07.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 07:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:00:53 +0100
Message-Id: <DH1PJFGWESQU.1OEKLN0CX3IZE@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
 <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
In-Reply-To: <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97526-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: BA28B284971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 13, 2026 at 11:40 AM CET, Luca Weiss wrote:
> On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>>> parts.
>>>=20
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> 'clocks' to the PMU node to make Bluetooth work.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++=
++++++++
>>>  1 file changed, 174 insertions(+)
>>>=20
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/ar=
m64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 52895dd9e4fa..cbe1507b0aaa 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts

<snip>

>>> +	bluetooth_enable_default: bluetooth-enable-default-state {
>>> +		pins =3D "gpio53";
>>> +		function =3D "gpio";
>>> +		output-low;
>>> +		bias-disable;
>>> +	};
>>
>> Not sure if we need to drive that pin.. perhaps a pull-down would
>> suffice?
>
> I'll give it a shot, this pinctrl is coming from downstream but perhaps
> the downstream btpower.c driver is differing in behavior to the upstream
> PMU driver.

Seems to work, but honestly I'm not sure what the actual effects of this
change are?

-               output-low;
-               bias-disable;
+               bias-pull-down;

Regards
Luca

