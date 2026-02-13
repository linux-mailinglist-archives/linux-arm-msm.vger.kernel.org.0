Return-Path: <linux-arm-msm+bounces-92782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL6zC38kj2lNKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:17:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC86136424
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA1EC3032F45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C632C35F8A6;
	Fri, 13 Feb 2026 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2lcMPkFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488D03590C3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988611; cv=none; b=OItzHtKaq+CgjGFch32VQzDUQ+RC5wssoBBGhyC+K5IJG+SpF4HuBWT2u0RHigdPE1k4hHj5DJnWRlrNZKqN7d8f3NOhJsp+nrq05+FAt/61GdazovJLiqwU8/77ql+EKjSlq5WjYl4rh2yTAU5+AqRy0xmZAHXIbtr+NLeP6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988611; c=relaxed/simple;
	bh=sLl6FMj5rcoJoJnJtPsIJyDKQD5EE4IZ2V8G73qLWwo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=stI4KoHF5gP4cLG1DW28g6DulY4v7vk7F1xlI7RIqkMq1NxpGBNh9jrxyZ7IUfvTQzF0AMES5vh2lk/hrVpx/B1JVnecRuE52OARtVNL6lleus12XskcZ725hf0yYDjr6cAaO3IHCbo8p8oUG8lpIdfrq0lqigdqg4QSsTH0XT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2lcMPkFV; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8fa449e618so112894366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 05:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770988609; x=1771593409; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJBbVjH419c062Z3IzKiz9l8/ItT4jJ4UMp42HsCYlE=;
        b=2lcMPkFV33UOPujXvQB8/qXtwhz7YdGEKbgOQVxXgH0d6ZNVOsIQhqQ4tvbikHLe/u
         I0dMoFB+hukeRCXyUJGGyJvVbZYrdFSISeb/4JfoT0ChivOxfaq7u99fW/NYy2brNSpU
         8++8YHsjFfuvYoDZBeui60rES3qHWfddE57a9pYK2H0yQHNNmIB90Uy5HXv3IUnDpS/1
         OklOdaQZP4zeLXohClBbxo/0uqmYwMrpLDdsJEjmgUAovvSFDLIFB2xdnEvLocvaMRL1
         CtiHa6I1n3QIIb8kwBETNtnmHipuzr79CnutUiysGcPCevEi22SyFUHN4kjsI7t3+EQS
         I1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988609; x=1771593409;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJBbVjH419c062Z3IzKiz9l8/ItT4jJ4UMp42HsCYlE=;
        b=Ee6tNpbfXozY+qXzYaiF03YHoBWIBPUVkngc5Oow3lqxJY34X31FEHslArzQ5w5RmT
         7fvwjDowF06NVZ7DUPV9r45Gv3a7m52WTlASg8kdJHbzZYGSnuPXpIx33Zx8WRWSlvqN
         Mx28O6iW3qTs+ramnA2HF4mdSGoc+ti80jM6xOhmbikSbiPDWpJnhxFoqWgvLCyuq4bF
         emz4IaetTX6xSoLyZBU+oGjsF+WJul5/pEpBl5cZMrCyeB/UW82m4Br9OjFY5qNg9uO+
         IFAm6GCsxod4C+FNeXeRm67S4A/Gm+wFZgEP14j0pR+D4cSS0sXek8gUBoCS4gHdVNLZ
         I1+A==
X-Forwarded-Encrypted: i=1; AJvYcCVH5Rl5Xj3IqGohjmLVhc544HdGTyumL+gslxbAOTm8trhqTEzs3x+WEcSTyhBzFid76wr57HYMLb695vUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xInFuQ2UIujVSgl/VwHqqJy/p7cdxs0mbQXWBzlu0FXxlljf
	PDJvhMzb0xT8/WeU2etLM3+62B38n4shLe+YpFY7r+/pc1k7GgzeABJjCirdYBgpcd0=
X-Gm-Gg: AZuq6aLlG68zEygZ5qUoBqyzW9pklNARgHhnYJFeJpgPFqv06AWxN2rVA596JrX9G9Q
	QrGlDO/JoJvmRQp8I4n2tQSwAwCpYjll2IS2adwr+0KUv25IX7uXcROExv3AeR2BTSoeJx+tOX5
	ub4RMSFeoAtahkE/s86aVEedhHqlOFHLia4NEkfmEPaDO5JmCSkcewZhhl1j7qX+xXHSW2fGoFi
	ueTLoAJpMmODjrJl1t570bBBaSlp5eAO71iZe9Y18ITwtgSU34J15NS5CSDi3/J9l8EvYmRnVEi
	GKP4EAlzXOqohqyffKOizoIPfueSQdjcmkivdlnzUTj23i976RP0Nr8lS4BV7sWz3y/yAVnTFs2
	k3Lavj20QN8P2c11vJ9Uf2C3evtCrJP1m9BT8fAbgz0O7o9S3U4MHAwqGDl00DMEoeJF7RE7W01
	Rq3004kCCN0UOoINBGeKQG5TACfDxDV61ht+2YHrnKC7kgRktzhXoaMTOiU5hQL4/TaXLB
X-Received: by 2002:a17:906:6a16:b0:b83:b7c5:de2c with SMTP id a640c23a62f3a-b8fb41937e5mr107585766b.10.1770988608590;
        Fri, 13 Feb 2026 05:16:48 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd60edsm251679566b.41.2026.02.13.05.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 05:16:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 14:16:47 +0100
Message-Id: <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
In-Reply-To: <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92782-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDC86136424
X-Rspamd-Action: no action

Hi all,

On Tue Jan 20, 2026 at 2:18 PM CET, Konrad Dybcio wrote:
> On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
>> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
>>> Add Milos compatible for the CAMSS CCI interfaces.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++=
++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/=
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index a3fe1eea6aec..c57d81258fba 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -27,6 +27,7 @@ properties:
>>>        - items:
>>>            - enum:
>>>                - qcom,kaanapali-cci
>>> +              - qcom,milos-cci
>>>                - qcom,qcm2290-cci
>>>                - qcom,sa8775p-cci
>>>                - qcom,sc7280-cci
>>> @@ -263,6 +264,23 @@ allOf:
>>>              - const: cpas_ahb
>>>              - const: cci
>>> =20
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,milos-cci
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +        clock-names:
>>> +          items:
>>> +            - const: soc_ahb
>>> +            - const: cpas_ahb
>>> +            - const: cci
>>=20
>> Same comments as other discussion these days - I guess that soc_ahb
>> serves the same purpose as camnoc_axi, so this is just last entri in the
>> if:then: blocks.
>>=20
>> I really find this binding terrible - around six names for AHB - so I do
>> not want another combination...
>
> I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK clock ("=
cci"
> here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).
>
> The CAMSS TOP doc (for Milos specifically, but I would assume there's a
> pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_AHB_=
CLK
> and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains most o=
f
> the programmable IPs on there (notably not the CSIPHYs, at least not on t=
his
> platform)
>
> It further mentions that GCC_SOC_AHB_CLK is required for *any* register
> access within CAMSS. Perhaps it sits right in front of the xNoC-to-CAMNoC
> interface.
>
> This only enforces my imagination of CAMSS being a fully contained "bus"
> (perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus)..
>
> +Dmitry, myself and a number of our colleagues were deliberating how to
> best represent the hardware going forward and I think we at some point wa=
ved
> the idea of putting every camera subdevice under a "camss: bus@ {}"-type =
node,
> which would hold the reference to the TITAN_TOP_GDSC. This seems fitting =
for
> housing the SOC_AHB clock as well and therefore concluding this discussio=
n.

How can we continue here? What change can I do to unblock this? I can't
tell whether soc_ahb =3D=3D camnoc_axi for this platform so I need some hel=
p
here.

Regards
Luca

