Return-Path: <linux-arm-msm+bounces-117132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdqGLqqTTGrumQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:50:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A87179A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:50:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b7z4dGHl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DKkFT7Yt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117132-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117132-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A2F6302AD9E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148BD386571;
	Tue,  7 Jul 2026 05:42:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C669385D97
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:42:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402950; cv=none; b=ObBBCi11F7X+PFrMNpcGpzaR0YTQb4xddgqRtgMPmnlWEsHvzXLmA25NHvwn3EASAOfvIWLXD+tnSSqB7/dMUglpkmAXw1ZfGidrTtZOswYUS2XkBfogZ/E4NLZcOAz+S9kRep4VtlH1wA/TatHiOi09MZK1iAaPqOYRiQagLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402950; c=relaxed/simple;
	bh=SaJhfRfeCBEEdb51HU7xQP6Qi0RYIjzXwMnuKXaNLHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPL8QkMVtkIe1a3qiLF+KIsEdDwtop637jfo/jsipbpVBOguz+SKut4SfgoWnmToHcWkU30fiaLaP3TY7G6Mt7l4FIAhFacMOgdm/NLOvia2Nww9LLBTwFh5v6uzqwQk5QzdA5IdW9WHqlEKt4tv/FLOYv/W1JUlEY+n5hXsE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7z4dGHl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKkFT7Yt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495FV2498891
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAzXorLcGHEyoWUBEpjb+W55R9Exavz3+bJHHBPcDIY=; b=b7z4dGHlOeLApk4H
	sFQPhYMYmOHOfJZuCM1WMZ3T5QYfOjM2C4mczoEqaW5VvOMfjQsNfMCexXmuEhoy
	nsOjD+LPuku3K5b2IbWjRPioFk/0DhCh62uuyxV9/3p1TRVQreQA3qioeNLpH/03
	fpKaoYenWDNnpxGnggSIeo4TqPpA9rRvnefkMufPwE/UtIPM5m2EFpEvk6Fe4YFZ
	O/28qjpmHD0d8GDiTDl1gS/1R0eVubo9FqiF2tVrZ8HWQ5nGTY+RxYoFBXBUnzvD
	yJoe51nRCwy7H4d/f0Ii5PMH2jqy/GdpFpau+IhD3d/c9ReNiQ6e3oPJotT34NzL
	QGBK/Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscsvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:42:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so2983859b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402946; x=1784007746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAzXorLcGHEyoWUBEpjb+W55R9Exavz3+bJHHBPcDIY=;
        b=DKkFT7YtX7WEEpVYRUXOF0hGC1b+Hui59QG8Wi/owbA7/x6eJECgH8pdjKc6KT5VSn
         GcA2UQsQuBiZjA2ORENCYGqm5i0J2JwNyq33BjkZvi5l/w1ftgqzeLU8ST4B02z8pwaN
         ApHZKbQlbdLac+G2pBdeDNX7UsEdqx4R4cuYYbIaVprX1CgduaQ+PwzY2+sBCxGOnU3X
         /jZGoeqZH0R+//nmyKYNEHrNBPWelg7BnQfb7RN/EWDaCNSEmW1+bhlDG9ve14FJKp/Q
         bVQfDMS9zwZcSjF/aYns5kX3kI6VSmIbHiMhIVGkZY66b+DDRMe838A5rFIKEb/hBRu2
         lpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402946; x=1784007746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAzXorLcGHEyoWUBEpjb+W55R9Exavz3+bJHHBPcDIY=;
        b=eWdJ4U7GGFRkqYl/zIs2o4eC8TpvEGl2mS8xUONf5eqIQrtAmvZ9yQ77kOji/XGpxr
         L9joLQ+HZlD/ajoebua/HFs41Jn1RhFawYddQ3ax8Y2/T0DNQm8nG2YqQSZfieMwg3Q2
         CC/kEQJgXmW+UNzfDTkOqpqYs9o9nbhZj0WCcAqVTf0VOdDZ66vF5X0TWr68QXcIDOxG
         92P8lytGHPrHMGhNrmb0mEE5M6E6LUYg+FTvEwIA/GW4g4/gNA0ugPNJE2s6hvjnzCa9
         dTKmHHhKQA2EEg8wCrlnxs9AOAAppeVewIdHnovOQuWlbiRGcxUVQb1c5RhULHGpisnz
         hsAA==
X-Forwarded-Encrypted: i=1; AHgh+RoDHJJA3OACq1YMoKnbxlLbRJOWfrIu0It52KITCsVRpuygz2SQMvBAEkbZ6jPxZxK9+b75oBMjISHQyG1U@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjDx/bW7nzIzoEL5FQMe39wyTrk2OLk9ANdHiyccBMWw7ckrc
	hSvI3MQ1GxhgL5kDnMwxjqaTPorYI3AEu3UZ4fLW7Lx4Djp//seSM7S3I7y+r8CmxvDi+dfqDky
	BeaPf0beLlYA7YDLRdoz8gwUHxiUFVrOMU5kcUxFktS9OUyjURe/gGTOM5wdmwngfcDyv
X-Gm-Gg: AfdE7cm7Xh6avw8VizuSsg2KHN4M8GRZLgASAOjNjA+hw62/Ftc+rP3o+kR4RjVz7ML
	2Qcqhd0y/qjgyAslmd1Gn4JD27yIDcN1G7sXc7FF0VIgnuiJn35v+ountwUTMqWQkFpH5FEBJCf
	NDaEsg5fzLGNpl/qNpvg4L+1Zu9shnIAXZYnnzP0ubP17DubDp4hSnTFYC91cl0ct/VaTLP2UR6
	aOQYXmGL++g0+twlivkJxuzcS1tABv7lOj/1quidxp8/hs1WUSkfQ9nOhteOoJgMshijYMjItMf
	uuqPtATy3S4anbJJTMk7E/nBwLSaiqo6KVZ7zi79eH4Jj/opgtRj1IgNZp3pN49bub3MDO2TzL3
	U+hgmLZlSH5gU9juukP2zkldKsiSBBvF5jop4vL3wWx+NGrlaKBluvDgPMsuuRGTqdFXjCgdHBE
	xzaxMj
X-Received: by 2002:a05:6a00:4091:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84826d3e479mr3223195b3a.31.1783402946556;
        Mon, 06 Jul 2026 22:42:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84826d3e479mr3223164b3a.31.1783402946056;
        Mon, 06 Jul 2026 22:42:26 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d496besm4787914b3a.36.2026.07.06.22.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:42:25 -0700 (PDT)
Message-ID: <9f938b35-9102-486b-b4b8-0967b2aed1b1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:12:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com>
 <178285172702.288391.13610342196466613275.robh@kernel.org>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <178285172702.288391.13610342196466613275.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zgc4U-_hsO66imC5lP6SEaZYLlh3FApy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXzRB8tqij8SbO
 Zi4zbfIhwa/jb39svE2laC7TfjHcF9dn5EDGjzdAd19TW1oY182ku98oJSah7mh184dwjF30lt1
 hwVQhsuOOezMYbgN3WbM4reXwGKZB3x6ZH6kYDhpK+nnMmFjfB7m2a9y8uJhGtNP+eYQKnLUm9/
 Jtftr1unAHCbo7VZpiOu734DXQe0u9sXSfgxKfaKUgwbqwqTgSDXiSjkPgwWK9bV+plnogYhTrM
 pmRDZLoeh5UCSNyV5idDfAHMy8rf/hhEDRQ10HDL9cL7/Q/N7Hc4ww61ZJxsP5Wuaf0tObqQYSw
 dLlZxCrbnlCmYfSizK9QQLbyQ/Tx9T1RwtDfTSOJMMSi4lueW0yEu/gQ33+cL0DSkqARufvvv4W
 poeCNZVUQyq+zNMtjsnvm66dcIVOudWdV15wF2PU//zzmH5wEU69XNCv/sN21dTXcpCst2adicG
 vYFNgtGNIpzE/Scwi1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX10OT5la5KgXb
 VsvdRhxILFsI90XosVM9oPlShu2fcgHOH7+sDI0N4mVbTWTsLEll1QybxcWGZ33wFMlJ8xTGOfd
 pMQZ2KKcHm3mIVSWUUO9rfK1OXBEEU8=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c91c3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QcnDgq45NsFIHwn4wVcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Zgc4U-_hsO66imC5lP6SEaZYLlh3FApy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117132-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:kwilczynski@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:brgl@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mani@kernel.org,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:bhelgaas@google.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C2A87179A0


On 7/1/2026 2:05 AM, Rob Herring (Arm) wrote:
> On Wed, 01 Jul 2026 00:32:45 +0530, Sushrut Shree Trivedi wrote:
>> Add devicetree bindings for TC9563 GPIO's which are
>> used to control endpoint power and reset.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml:32:9: [warning] wrong indentation: expected 4 but found 8 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

ACK'd.

Sushrut

>

