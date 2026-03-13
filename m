Return-Path: <linux-arm-msm+bounces-97433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APhlC0Tqs2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:43:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B0F281A6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A1313028B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E10D355F35;
	Fri, 13 Mar 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GiOl+Bor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D53382F0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398591; cv=none; b=m8Z4OsrbdUrByrC6MzSaJIu9nfGXg01oVwiL51w9xS1YTj6zSdjVKGWjdJ9UaEpvcbJOMo1WET77mgOgP9UBwVap87CMQz09o8yKs0k7971qcS+11vxGfVEf4XHT6pAgWwp4377dAt/kYvcmqKYvdrLWRyb/TOKcYaZFfw1vceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398591; c=relaxed/simple;
	bh=IzAPagSly1lyh9lc2NNBcj3O8Liafw3xfmgTZPjhZww=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Q59oU7VAYTp6VYS28+7yXI7tvvLlSCoIzodYe54D3SW69QEc6H+a1Ess2ZPuDYyMtdDWF1clS0L8DwJyloPAMDmouMaMrpELpnQuA6UQ9pXY7XE5YrMa1RZHnr95VPYHErp06Lt6rllsCU554kMhms8lzcFDZgAz5OjyXSsFK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GiOl+Bor; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b96dc65b886so556651266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773398589; x=1774003389; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN3CDzAiugNuzgkTXnjRsfjvoHTP1T2R94z8o6gBDmg=;
        b=GiOl+BorMU4NYKec777SB8jvhM27wzL0k6NzIJDpl5ynwBXl6Xq4sr0hTOoWvxScSq
         zRsnbV1+1F/+Ighq/YkRgMExVaQ0Ey67VJsMbHN+LDxvCfWv3O818Grhfnus3TD9Mfpi
         +0RuyVDrYa3+3cPc+l2px/a33o1K2t6Q+Lv9iTSW9hK4XuLQYaYyE6Nj06UHoFozZdUh
         eWh6fdgW6wDWeWp3/YO1Yf3XJUH/ctTzE80a13khOOox9sAGOBqXyg8tI2h97USQk3qX
         r0WF5Ej/sYH2o2TotRlHmz7TTfWvkNLA0waxIyhdGzjTlVZdz/nVCa0r+Uwppz94M0tz
         50hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398589; x=1774003389;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BN3CDzAiugNuzgkTXnjRsfjvoHTP1T2R94z8o6gBDmg=;
        b=ohG1gmts6cozofoq55fy+x7TGKXX0EfC5hoRUHV5VIPhjOrp0wh0kDhJjdjNbkXLE/
         xmkM/mXv8VPCJAiTo1prlNyTu0dAQb3HEGb3nXPvYjNj0IWiMhF5jyvP/AXCDjxj0rbs
         T1M8krwaXRtxDDlR24f4gnTUtSUw6vfSrWeqA7xgRPxmtJ28v4lsYHY0jc3zbpA8RPgu
         o65zORmwkv23ZZIcKs2UpvHI72sUAfrLTXB06KVfx0feCYJTVomj3Nld4CtLdWD10p4A
         4AUynXF7Is5qJR7kYMJIdESUSxQB3ZsGMlknLEs66uIf584OLfycsnp9zzfUAfXz+scH
         KZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQpDegVXsDUYj8xtF1m3bUCdZMuqccSa8zFKY7LMCKk7ckFH+VghfyAI02t9jCQa79v5E4Q40lp/2UnAC5@vger.kernel.org
X-Gm-Message-State: AOJu0YwJqyaCAxeDkmrEim2J4se2jNj9iSw4TcKAmbMidWTq2m6r7S0K
	BLclUGmPQ+OWgbValt2RCE4xnowCeemXaHzwb08BQ8pkkyGSNDN0Z9i/hS1EEd1O8wM=
X-Gm-Gg: ATEYQzy4DeeldTOwGqPfSsJbJy3W1NVC2ydDdhlYJtPRCclIPvdLCy49jLUOo3P2f/E
	vg9ZOWFgHN0a/yFL1CHo1ah/OE6So6YAtT24qs8MEMDhL6fRcEiMsNccS61jZwC73pn7LXET8+l
	F05zneDlyilrlqI238egwd+PVN4/3CNaPMXpPXAD4Z5nsXUfvmLTixCGKhYh171mxp/KKUXdQvA
	jVnv6aK0rD8o2CdxY5SVXotGC1nQPRQ5JhKFZ2SfvjheIie1JPF/jR+m2h4Dxp78+56gpAHQN9m
	w+rrRmpjNc8+PbLr+maEfXHY19RofbIn0TfYX69dvABr2i4lVKfEck8vwEkRTBokaWJtCL9VlsE
	zNY1bRfW+K/euhUFDoIDyMtHiPwzhen0D+e+59JYVYnYG6t3erPHzfh6YxsZVwZtp5d9auOAD8v
	VyYW9t23RKIEiDjkkbpDpi7cNl6/MvJg8JI9braVjAOzVz9jWWc0DML3vgHOhm0ueIaOGF
X-Received: by 2002:a17:907:e8d:b0:b97:3376:7b5 with SMTP id a640c23a62f3a-b973ffcf3b4mr383143666b.21.1773398588543;
        Fri, 13 Mar 2026 03:43:08 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba2e01sm36929266b.9.2026.03.13.03.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:43:07 +0100
Message-Id: <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
 <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
In-Reply-To: <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C9B0F281A6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Feb 13, 2026 at 2:16 PM CET, Luca Weiss wrote:
> Hi all,
>
> On Tue Jan 20, 2026 at 2:18 PM CET, Konrad Dybcio wrote:
>> On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
>>>> Add Milos compatible for the CAMSS CCI interfaces.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 +++++++++=
+++++++++
>>>>  1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b=
/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index a3fe1eea6aec..c57d81258fba 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -27,6 +27,7 @@ properties:
>>>>        - items:
>>>>            - enum:
>>>>                - qcom,kaanapali-cci
>>>> +              - qcom,milos-cci
>>>>                - qcom,qcm2290-cci
>>>>                - qcom,sa8775p-cci
>>>>                - qcom,sc7280-cci
>>>> @@ -263,6 +264,23 @@ allOf:
>>>>              - const: cpas_ahb
>>>>              - const: cci
>>>> =20
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,milos-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>> +            - const: cpas_ahb
>>>> +            - const: cci
>>>=20
>>> Same comments as other discussion these days - I guess that soc_ahb
>>> serves the same purpose as camnoc_axi, so this is just last entri in th=
e
>>> if:then: blocks.
>>>=20
>>> I really find this binding terrible - around six names for AHB - so I d=
o
>>> not want another combination...
>>
>> I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK clock (=
"cci"
>> here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).
>>
>> The CAMSS TOP doc (for Milos specifically, but I would assume there's a
>> pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_AHB=
_CLK
>> and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains most =
of
>> the programmable IPs on there (notably not the CSIPHYs, at least not on =
this
>> platform)
>>
>> It further mentions that GCC_SOC_AHB_CLK is required for *any* register
>> access within CAMSS. Perhaps it sits right in front of the xNoC-to-CAMNo=
C
>> interface.
>>
>> This only enforces my imagination of CAMSS being a fully contained "bus"
>> (perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus)..
>>
>> +Dmitry, myself and a number of our colleagues were deliberating how to
>> best represent the hardware going forward and I think we at some point w=
aved
>> the idea of putting every camera subdevice under a "camss: bus@ {}"-type=
 node,
>> which would hold the reference to the TITAN_TOP_GDSC. This seems fitting=
 for
>> housing the SOC_AHB clock as well and therefore concluding this discussi=
on.
>
> How can we continue here? What change can I do to unblock this? I can't
> tell whether soc_ahb =3D=3D camnoc_axi for this platform so I need some h=
elp
> here.

Any feedback on this?

Regards
Luca

