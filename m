Return-Path: <linux-arm-msm+bounces-115547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HeKWAv4uRGrYqAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 23:02:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA786E7FD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 23:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=eZmKz5nk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115547-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115547-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82BFE301AA9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AFA2FE057;
	Tue, 30 Jun 2026 21:02:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5930E85B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 21:02:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853370; cv=none; b=rzJY/hHLB6gE3/H60BIyW+kMCw8Gfmzk6fp9nMB+Tn/35kBuQRaq2+1AWXldGha5TMNPXL5wYKODgMHRVugO9N02/41hI03YH2L9jpQBhZcpdxaJ5HEiXF2SXEbJ6TAPt2TmItOLDNfyO70DNXuiVOk+NoB6bX2o+SZeVhQFGhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853370; c=relaxed/simple;
	bh=am/loPvYVzdyGkax/MQb7j+deiZ5J2fIhC8Mv3BpdnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCXzILjdRHNV+l+C7BZEB8pQKTlxLc4zsWj9YFaLUrYuwGpndKYlfR4FCbw/jSG4Dk2S1lxwGA2c61g9xSvWbrByg3N15fLUt2P0VqNnvrGrm/WfVGmOS50crKLPnRVHo8kMJi0IdKGYr/RkiPOs8C2+zZRQJAVDRG/emyAZdEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZmKz5nk; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so172787e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782853367; x=1783458167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBDyBnY0nJ7RYEFWtLzKwV49v5iiA3WOTXV6Ek5GG04=;
        b=eZmKz5nkrP8o7yh/aBVfRf8KW+qF3wfDn89cOEievA1uf9SzjM+Pdm2cFBzyRshy3w
         7RQMI1mBBW7c625Zeq+B8s3Z7ilBLCxizBscKHGLnTUD7ylmExciv/5H/qz7SsJvB+Da
         s1H3tZiLvXNli2bJaQl+SROwHeNVzeegfYhRXNcwMUgfg3FZAXxhzsIXIrmjwtaTROKV
         Zw2kBrt96NPxBmhuLDefSshUeB4rj8LkojRXxdhG+VKxY0+KpxZIOIJzPhiF/66XyK0F
         AvTDbpbDtuK11/LVU8+tcWZS5UxFNkCJTs4oTNC7dNG0PBwtJN0NSowKNsd+k0dtaTRe
         GMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853367; x=1783458167;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBDyBnY0nJ7RYEFWtLzKwV49v5iiA3WOTXV6Ek5GG04=;
        b=ZyIsDwcLD+VyF/lqIATYV4VDzOlCxVgM4aiBemAv52UytxJmCSAyEGuOCleire7MQ3
         /rbp2njc4buhglj0hHmkADMg5YnGwM6pOGE3Sndtx9LYxXsEXv1fDCcrfKtvgOnvaC+G
         7GgjGHeR2QbJNNqawr9P+D0DYCp4T2WtzL/qz8ehwp6dCtQT4q7iSfmEoVw8CKY+upnL
         Gapk/81vwY1x93t4CCuUitgn+SIn6zCc1dvTtAojbnBfKIbLgSrBdikow8PkNRuh0Guk
         MgMkz4ADp3+xOXTjOj0LF03j1Rp0p4m/5Fu6j3B+K1XY5ZM3jEeqW5Q2n45eYcv60Duw
         PZnw==
X-Forwarded-Encrypted: i=1; AHgh+RpL6wyzCB7GnIBvBjJEhrd+S8H5g0s4BgmjGgNz+c2X9gPIXXgAC043LhRIZx1wPTtvUsVnwXPAqfTroacZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6gZqyO1dxlO0+IQi/qPMhLUdXwOpFW4f4QX+LFO321QnNx3w5
	QqSMYq1eGKHcYboCmF7hdEDJoLumqz3c80lYCoZOraDwHbdU4Aofy6AuoPyXU8xfEtE=
X-Gm-Gg: AfdE7cnM6XilVBUZpG3AZCKFwr4RrU+qEMxPjo7QuL24PfPB5hjFF/4fRvg4Fzqo3No
	OEyvRNydTK1NS+TfMNMF2pWQDi4GhiyQBfNyL0uZXyt86nVS6aUv420aFkMsb1qQOIUzeyGECbV
	4BT1FJe4GXcfd22g/TcNre/waKfdRGcoqcPS0Iur8FBMu7G4oT05J0BylU5ZLld/U6G9jYPbyN0
	nxs/FS+ZHe7qOETbZPXjJyFoCipTeexXHUao6BdtzGhPS79cboAucab2/8T6112kUVTjtLpGvOB
	nKlvCMFjnKeR72xK7PvFOOONK59iS4Ugs61i8VT2Qqbxja5vGW38IWnh9PkIfGT3tVCGCDn/SLb
	qW7Gf5ah8l1SfZgFDA6YopOeDR5ylmkSCEw6cZhYRe+5LXis1rrRoM6HPVlIWMUHNlZNOViIcfd
	c1whFmK5PmjgcjhmbN+C/NDMqHIjUHMvSYuQHOtqMx5f+PQ29xlGT7cRuxVG+uI9KSMyzkyKgfc
	e+jPg==
X-Received: by 2002:a05:6512:8353:b0:5ae:a6fc:171c with SMTP id 2adb3069b0e04-5aebdba8241mr427628e87.3.1782853366845;
        Tue, 30 Jun 2026 14:02:46 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4a884dsm814235e87.67.2026.06.30.14.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 14:02:45 -0700 (PDT)
Message-ID: <a77f2042-8dad-4b6c-bcd8-b317f464f0f3@linaro.org>
Date: Wed, 1 Jul 2026 00:02:45 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
 <_zZ7OLAmvphzTdIURTW71m_LKDwA-DEQ-a40gIiLYSqgDrdOOEf1bElz53zTbmSaDoqc8PDFyQXa7bycFaSTXw==@protonmail.internalid>
 <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
 <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
 <IDwf-TUUNejblXqaFbAmpHIv49qp0PH0KB_H5HGcm1Wlj5zYf-q8Sota7H77GgDFcvhI2RHMCYmKRaDn0Q09fg==@protonmail.internalid>
 <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
 <257f9f48-4831-4f36-84c0-f7e6c257dd3a@nxsw.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <257f9f48-4831-4f36-84c0-f7e6c257dd3a@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CA786E7FD4

On 6/30/26 23:24, Bryan O'Donoghue wrote:
> On 30/06/2026 14:32, Vladimir Zapolskiy wrote:
>> On 6/30/26 16:19, Bryan O'Donoghue wrote:
>>> On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>>>>> +                interconnects =
>>>>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>>>>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>>>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>>>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>>>>> +                interconnect-names = "cpu-cfg",
>>>>> +                                     "hf-mnoc",
>>>>> +                                     "sf-mnoc",
>>>>> +                                     "icp-mnoc";
>>>> Since the proper option for describing this hardware is to have it as
>>>> a child device tree node of CAMSS device tree node, which should serve
>>>> or be percepted as a bus, it makes no sense to repeat and moreover rename
>>>> bus/parent's resources, here is the list:
>>>>
>>>> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
>>>> * Titan GDSC power domain and all four interconnects.
>>>>
>>>> Only "jpeg" clock and iommus are left specific to the hardware description
>>>> of this IP under CAMSS, right? Thus, it should be reflected like this in
>>>> the dt description as well, and the complexity of shared resource management
>>>> has to be done in the driver, which might be tedious unfortunately, but
>>>> certainly doable.
>>>
>>> JPEG should be able to vote for its individual NoC / CamNoC dependencies
>>> / requirements.
>>
>> There is no individual interconnects, JPEG interconnects are equal to
>> bus/parent CAMSS ones.
> 
> Not true.

This is exactly what is present in the dt binding, if it has to be changed,
please report it to the author of the change.

> As a matter of fact, the JPEG encoder has no use-case for the ICP MNOC,
> now that I look at this again.
> 
> Even if the list is identical the clocks, bandwidth, opp tables
> represent individual consumers with individual votes.

I cannot parse "the clocks etc. represent individual consumers".

Anyway, it has no contradiction with what I've said above, all shared
"CAMSS bus" specific resources should get description in the CAMSS device
tree node, all individual subdevice resources should get description
in their own device tree nodes, that's so simple.

There might be no SM8250 CAMSS subcomponent, which operates without Titan
GDSC or cpas and bus clocks, then these are "CAMSS bus" resources, then it
is immediately known that every CAMSS child needs to acquire these resources
from the bus/parent, and it means there is no any single reason to repeat
them in each of 20 CAMSS subnodes.

>>>
>>> Both GDSCs and interconnects should be described in the sub-node.
>>
>> Why to do it in each child, if GDSCs and interconnects are CAMSS bus/domain
>> specific? There is no acceptable explanation so far.
> 
> As we've already established some of the power-domains are function
> specific - for example MXA in the PHYs.
> 

It has no contradiction with what I've said earlier.

>>> There's no functional linkage between CAMSS/IFE and JPEG - they are
>>> peers within the CAMSS power-island. Over time we will migrate to
>>
>> I do not refer to any "functional linkage".
>>
>>> individual nodes for IFE CSID and these too will appear inside of the
>>> CAMSS "bus" -> JPEG etc should describe their nocs and power-domains
>>> individually.
>>>
>>> camss@X{
>>> 	camnoc@{}
>>> 	csid@{
>>> 		interconnects = <gem_noc>, <cam_noc>;
>>> 	};
>>> 	jpeg@ {
>>> 		interconnects = <gem_noc>, <cam_noc>;
>>> 	};
>>> 	ife@ {
>>> 		interconnects = <gem_noc>, <cam_noc>;
>>> 	};
>>> };
>>
>> It makes sense only if the lists of interconnects are different, this
>> is not the case.

-- 
Best wishes,
Vladimir

