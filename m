Return-Path: <linux-arm-msm+bounces-97859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hw9FFC5t2mpUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:03:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E24295F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA7EC3009388
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2243E354AFC;
	Mon, 16 Mar 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TC477T5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F07355819
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648187; cv=none; b=mXoa9+XmNx5P3mhwXABZPd5E/M5yxeap1Z+76H7V4Kmz5uCDaDqGmt8C+7UiVwHZnlR3ikhEe9vxpOSfa8UBgk9KBhP0sCCzEw/dO1qrFQLpo1h4rPkMnafKJETuKf/53eAXGO0wNgiKrPaJ1cmhnvLIM2/1f3GFsBjewKb3Sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648187; c=relaxed/simple;
	bh=I3ozpn0AlufRc2Jss5KsZyj0nVqY6AoUdItpi643AQI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P87RdLjApFnJ+zoVmhRDtpgsLvlCmRj6Pxn3wNTRK0jo2GApVY3pPWfB7Kni/r/cdwGiX9maoaDXgp2Mu+tWLKFgR+yx0Btp89mDsXMaB2J5p2gTsCfn9zwCqX9FNvLkCLNUQKLocqQeBa/px5ZBIJ6hp5WRACeR52l2yhkdLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TC477T5P; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b94358796a1so597920666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773648183; x=1774252983; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU3L+3tbACqITsDz16andVuW8wZL35d5pmOo8PiAQ1A=;
        b=TC477T5PvaGkjcNwJm7pCqcz8viqAUum5A18ihSZaEmGWIxEvx3ewsyFaw58OamBkT
         B0Ta3lk6ieThz7uSz6TzQnsQ+u/6+/P3GsJXcxxmjQF64EisRgGDi8hVZ+06+a7/QZHd
         KY+GFQ8v1xqBJSTshlsWqiCfDmbohnH4RavHs6OSRKK/gBiKgTUBh8Jnxl0M4ZBhjEnP
         qHQCNMwlz1dkd5k4iweQt9GhdTpt8OqGpPi+GN1G6w9jOJVbFvNChsG2i95SaYbiomss
         m6hazGTRuBHQW+eshgYiqfQp+T9eEGxYynYIXH9Fza02ByhkVEbnAiGNqWIRrcmLnKLv
         9nSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648183; x=1774252983;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU3L+3tbACqITsDz16andVuW8wZL35d5pmOo8PiAQ1A=;
        b=Iqf7GiC170CKViWgg1Sl2LDu9QcESowOHY1dc83w+86/0yg1gQGs65QdA9AgpH/MYP
         N352p7ev954OuCUhvmxeqb/gG90kndPWiMOd7q7IeMCr5gPkFb4S5zjRoqYlck8fXW/d
         NvW68nEdERF2Y+Vu3A63E/9pheuVVgtF/uJ7W8A0hXTOjCpjgaHh6mBR4IoWK0AqvfOS
         iUaSq90vhLRRtbuV+oYatzRFXEC+e+uG4a8wUyNdFJ8hZFnPIJcNs+fHOfXtRbTgJKoc
         AhPfh6F2A10VRbeKL5ifodKhBhxlM1QNDI0O6vG6kg+t/nlRLy9KoC5R9Unz9+QHOJlm
         omXA==
X-Forwarded-Encrypted: i=1; AJvYcCWidvz+2lyI7sWC+0Cxg5RkZfpsrsF5MrN18B9AKjIaISYA+ruzlBr2elRy+vNjzgl/lFWj0u6cNmuIKNOf@vger.kernel.org
X-Gm-Message-State: AOJu0YzWe9pGL27iVpSiBBLmLXnt6u7Q0XAT8tH0UDfOfuRryrPMUNjd
	8r52WyZ/Nqrzouji9LA5e2SFcTkgm/qcKFscDx2vRs6yqm++p1e6nxJr1dHT6WVIjrc=
X-Gm-Gg: ATEYQzyoDprlkNlcZsb1HRMHWnsAIJnWLnwtnEK890UGIfwVGaKPVapI97lnK4fYR6d
	3WzFGx3x5wSy/TLmvwWcqT7rOVXGUz2qO40dHygHd0sFEvxiKRodaP5IUpb4TmHVuSfjb3sy83E
	D2/gK7HgjFpjRukdPnEDPTV2p9PRzXydVzBxGbVEC5QkF4LgWtYkscB4G9vfNOfIwZhGhyUfLbr
	o2f2g5r9HEttx4v8KIK5SbIg1zuXB6GkDWjb7otd2OrpOgEy9BUzX3jLB5B8WzVuf+FX3OmKBHt
	d/EOR6npeHqKG9+k9cfVtx4QVUxSSejExpLEnWn8AWF2MBCnigMk4RQWz25U2vWCllvPJhFa3ck
	Bip3i5LLxyks92FwRdHWvaLGbf4S6hHlt8ny4XsCHkm+NP3MV/6+gCIQkoW06CDGMnSJRbmRfwB
	9P/YR4BIJOlj00uzi2PHl/q2eFDhyZoabvl64Ik8uLEgKjm5dSP5OugmiadmG066/h51Il
X-Received: by 2002:a17:907:98e:b0:b97:554:f12e with SMTP id a640c23a62f3a-b97650c2f9bmr622693766b.14.1773648182486;
        Mon, 16 Mar 2026 01:03:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b5886sm504167566b.65.2026.03.16.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 09:03:01 +0100
Message-Id: <DH41T22PJEW9.3EO3P50QRXG8H@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Rob Herring"
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
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
 <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
 <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
 <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>
In-Reply-To: <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97859-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 54E24295F2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 13, 2026 at 5:18 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 11:43:07AM +0100, Luca Weiss wrote:
>> On Fri Feb 13, 2026 at 2:16 PM CET, Luca Weiss wrote:
>> > Hi all,
>> >
>> > On Tue Jan 20, 2026 at 2:18 PM CET, Konrad Dybcio wrote:
>> >> On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
>> >>> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
>> >>>> Add Milos compatible for the CAMSS CCI interfaces.
>> >>>>
>> >>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >>>> ---
>> >>>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++=
++++++++++++
>> >>>>  1 file changed, 18 insertions(+)
>> >>>>
>> >>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yam=
l b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> >>>> index a3fe1eea6aec..c57d81258fba 100644
>> >>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> >>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> >>>> @@ -27,6 +27,7 @@ properties:
>> >>>>        - items:
>> >>>>            - enum:
>> >>>>                - qcom,kaanapali-cci
>> >>>> +              - qcom,milos-cci
>> >>>>                - qcom,qcm2290-cci
>> >>>>                - qcom,sa8775p-cci
>> >>>>                - qcom,sc7280-cci
>> >>>> @@ -263,6 +264,23 @@ allOf:
>> >>>>              - const: cpas_ahb
>> >>>>              - const: cci
>> >>>> =20
>> >>>> +  - if:
>> >>>> +      properties:
>> >>>> +        compatible:
>> >>>> +          contains:
>> >>>> +            enum:
>> >>>> +              - qcom,milos-cci
>> >>>> +    then:
>> >>>> +      properties:
>> >>>> +        clocks:
>> >>>> +          minItems: 3
>> >>>> +          maxItems: 3
>> >>>> +        clock-names:
>> >>>> +          items:
>> >>>> +            - const: soc_ahb
>> >>>> +            - const: cpas_ahb
>> >>>> +            - const: cci
>> >>>=20
>> >>> Same comments as other discussion these days - I guess that soc_ahb
>> >>> serves the same purpose as camnoc_axi, so this is just last entri in=
 the
>> >>> if:then: blocks.
>> >>>=20
>> >>> I really find this binding terrible - around six names for AHB - so =
I do
>> >>> not want another combination...
>> >>
>> >> I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK cloc=
k ("cci"
>> >> here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).
>> >>
>> >> The CAMSS TOP doc (for Milos specifically, but I would assume there's=
 a
>> >> pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_=
AHB_CLK
>> >> and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains mo=
st of
>> >> the programmable IPs on there (notably not the CSIPHYs, at least not =
on this
>> >> platform)
>> >>
>> >> It further mentions that GCC_SOC_AHB_CLK is required for *any* regist=
er
>> >> access within CAMSS. Perhaps it sits right in front of the xNoC-to-CA=
MNoC
>> >> interface.
>> >>
>> >> This only enforces my imagination of CAMSS being a fully contained "b=
us"
>> >> (perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus=
)..
>> >>
>> >> +Dmitry, myself and a number of our colleagues were deliberating how =
to
>> >> best represent the hardware going forward and I think we at some poin=
t waved
>> >> the idea of putting every camera subdevice under a "camss: bus@ {}"-t=
ype node,
>> >> which would hold the reference to the TITAN_TOP_GDSC. This seems fitt=
ing for
>> >> housing the SOC_AHB clock as well and therefore concluding this discu=
ssion.
>> >
>> > How can we continue here? What change can I do to unblock this? I can'=
t
>> > tell whether soc_ahb =3D=3D camnoc_axi for this platform so I need som=
e help
>> > here.
>>=20
>> Any feedback on this?
>
> I went on and checked. No Milos's soc_ahb !=3D camnoc_axi. They serve
> different purposes.

Thanks Dmitry, appreciate it!

@Krzysztof: Could you take another look at the binding then please?

Regards
Luca


