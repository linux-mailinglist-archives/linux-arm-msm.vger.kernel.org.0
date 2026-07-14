Return-Path: <linux-arm-msm+bounces-119053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ukuVAo1DVmrD2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:11:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2C75590F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:11:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d9D2ZHqg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aNOyWymI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119053-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119053-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEDC7309F201
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96A44446F8;
	Tue, 14 Jul 2026 14:03:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083724113D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:03:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037833; cv=none; b=PNHISYdP3/Ia/9mi/MOp7QM6X762rL1BqVq7e01Lgb9imgOABtPpajMkGrEjRdf8De3ecs1vok2+JbuGQoY561hY5IoVT/3BPK9mDEHlR/BL7W22co2aSQyOxw7WT+y5hDVdOXt+32upoe6aP7YVxZV1n0By83Q6y4WZQ2kRbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037833; c=relaxed/simple;
	bh=1aeO1MQjhx0hsnBIndYNKzq5ekDuc3n3yQ0BKG1/Nf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBm1X7jH13THVR9PiRCqAqRRobGz61DubPWXiDvgGgBeB8Mid122QHLzitu0fNzaLXHkScu11YNex/SJo+t59hJnMFfHGlq3h2bClxmP0u6XXoDUyxyiQS6x49KzHhAMFknatCB/gVHolw4SXx3x4opJmXr92Q5YmlRmlKRToyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9D2ZHqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNOyWymI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBohPs263276
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aeO1MQjhx0hsnBIndYNKzq5ekDuc3n3yQ0BKG1/Nf0=; b=d9D2ZHqg//EULwB4
	FpqBxgro6jfHfWjaHUtwzIaq6fYV4Y207zmJ2rMJXLOMLmZlzpu+Qn7kzhpeQPBx
	xCeCGXng9G/BRlxeUUe0F6CHJPdKX4AZLUGxrhUwFAEN13u2kbUhumwYQojhDsL4
	S2JIFlbfcJwgyqh735J6AK212FBvz+hQgT+YJ8IKyySd5FM9PN4TiO8wm3OdB2pn
	rE2sFaCe7MVmER7xzWjGHHMDvRGAYlUxgvo81nuRE3uSdwRfkDdOCdk77w62luuK
	hTTFc04Qt4DJpYiJ8/cAzxQK7rYEkeofVyRJSyk67tUdyGfu+wSmaCc5LTW7Mcd8
	LUJTVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk0jad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:03:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso105658755ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784037831; x=1784642631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1aeO1MQjhx0hsnBIndYNKzq5ekDuc3n3yQ0BKG1/Nf0=;
        b=aNOyWymIm3a2g8l81YSj1JXY/u0sr0anpzZcSwo8hsGzd3pOfTKRGByxUqbfgf5KOL
         xT37Rin3RExWGBq7H7BpwcmpkoOiBT+s8SutWBI4yT76G+4FTak+MM2ZJNFuT+31Zu5x
         qAXcd4ejlp4lvtjcKwJR2kMVT5r35MCqOTfXN3KKQvJ0A8M0pJG3AqYjG+3eqUdvGpLX
         tlSk9ZvGKnVG6YfzSj3XfOS9LLpSjmQ2r83xAnSvEaUPJW9GJ8XQkch3iNF1igOcMUPJ
         SRNCLnt3BUXwML1OtY6RdB13ltQeicutAVeL2Ph+NbtcEb/J/gAydXE1+AiDJz5WWekv
         aQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037831; x=1784642631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aeO1MQjhx0hsnBIndYNKzq5ekDuc3n3yQ0BKG1/Nf0=;
        b=asCzBolI4PvJXdPciBvKRbYKxHcPK7ksjprMZUllwtmjroCPV8XKwCuBKh+EkTEJOg
         Mwkix4AvVoxbmnV6h4mS9wMQCbEpdRTPmd0KdUwjYNwOxJLx/cz1mxVuODW9RCzlkDtO
         T3uDaT13ks5T7V14BaVREAR1/zPqP1rrCTHf6GHhWpMcEXF+MYwva73WmrBoie3kQEY/
         dGsZx7J+CcNJP9oy0LujibdXScl2DHp2aB97V/z4CbyKurypWi0tWPOa6kSZpUDLkWID
         Q7i+iA7OUscgL30MxoTJrZklaRITSrabWYxqIIDC+d0BihRHPSBRolCGl0zehQ1WtTw1
         5ARw==
X-Forwarded-Encrypted: i=1; AHgh+RrdAu3EIS64xFZIuLIRst/m3w+Nhbn1QoluEFFCSv4KEhO/NBKiws75vYU3vUf7gPkEFU999PpI0JOZWHNC@vger.kernel.org
X-Gm-Message-State: AOJu0YwT00WS2aoKdpcGYnTvafi5HzzDNxYfNihiHCPqlSMgxAPy+WLD
	fFA1KBRKU5UCjGA38AMaLnbeWiFRreEl54E92kKJ349o4/5bhD852tALwjjhUUEu4sUc2CiVvKu
	miqZJE+mvUjMWkpOBB5UIfOrh84bb5/f080c+Ot+OFmllYztl+q5MIS3y82r0u5Az+L4k
X-Gm-Gg: AfdE7clqGyUwtqRek2iK9gM6ZOcMT1F1WlvYE2ZP/6CAd5sh47ULSeWTYIROxkEDWbi
	XYm/ckdKI0pb/lYPXN1rGDL7YGN1/wspdacCY9G4Pny+7CCJTdL9WFJ0RRRLSsovMN59lURMcPe
	KxZFgt/WObX832B/FlU9d+qUUNlapNhGsoaK9w4rAcRSz258sAbkZsiijGwPppZcZI+ZrCwoxMc
	JUXxHe0aRuOb2hsz4DB1fLOj2Bzpa3xT2x8NxxD7mAe2zyWnw0qN8usECMhjiokwiSrUyTsGVaG
	5YzcZAktlt2+LhP/yHEljhOnw7nnwpWzuy3yYz4H1Q2Hkp2g4+AAjGM3N2RAMnpaiL4uMu5kj+s
	If+bL4NGZ2wUdFDw+Og6BI9vVXVmCyo0m+/c/xvUuzPC63SM=
X-Received: by 2002:a17:903:4b2b:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2ce9e7a53edmr128278725ad.2.1784037830715;
        Tue, 14 Jul 2026 07:03:50 -0700 (PDT)
X-Received: by 2002:a17:903:4b2b:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2ce9e7a53edmr128278185ad.2.1784037830258;
        Tue, 14 Jul 2026 07:03:50 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm116115135ad.19.2026.07.14.07.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 07:03:49 -0700 (PDT)
Message-ID: <3a32a44d-4044-4270-beec-565171ad4bff@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:33:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
 <alXhHH0mGvFeUMd7@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <alXhHH0mGvFeUMd7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sZ-V4ZTbJzLFI_qlAYGai8W80k5_DyXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0NiBTYWx0ZWRfXzceR2C7bFBd6
 w4/DE0F+Bi0W6wAQ+E2rV19Dl1FX1LzNe4Msf/b5bwfGugxmegusvJO/IyQcqUzS+UlD9tsNS1E
 qhBMgkL2nvoVY0jmwwmsb731jTdU26afBjgMzlg3BwsKf6sAz7g5LiWFHrdXXFeF3Zb1iXLcbTh
 CzyxetNH9s/mOn0zqQH+JDduxIuK96MnOmaCPwzrfT/ueE12xVYklkaNTV+lX+qTt21dFpd2wem
 SAp0i7MDqjucCEhvbIRO+UR/lLVaQsL/7YqUZakp8XAwk42nybLh9g0PPGHXS2Fz2Cqt/0iLKdF
 nKPb7rPg9hE8OeZ6y1dSY/DMi1bGpp2YBVYbjr8M4If55J6fpQU7kNlgUuKA5pwqsQo032ykwJN
 2RT/8d0nPndRcLc49eAa84+JUj20m8frjeo1y6T6fsoWlAgT0FWQRlwCkSGBWN9gr5G9qjGcbIp
 A6w2LztTpmWqGHfp6OQ==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5641c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eaiSrzzrrFeZcQZn5FsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: sZ-V4ZTbJzLFI_qlAYGai8W80k5_DyXu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0NiBTYWx0ZWRfXxymaQyv8Xx6v
 mFJeWX96utY8IcLdbsPUC9wnedODOES75ONA1EBvpE8kG8OIYiS6TcPZt20JGAaKE9t+zRWrknY
 oY+fshzrXcWIwpoh+B/DlQFjruok4Sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-119053-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DD2C75590F


On 14-07-2026 12:41 pm, Stephan Gerhold wrote:
> On Tue, Jul 14, 2026 at 11:02:31AM +0530, Vishnu Santhosh wrote:
>> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
>> the XPU enforces per-region access control, each individually
>> DMA-mapped RX buffer consumes an XPU resource group. With only ~16
>> groups available, the per-buffer mappings exhaust the table and inbound
>> transfers fault.
>>
>> Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
>> paired with the generic qcom,bam-dmux fallback, so the driver can match
>> on it via its of_device_id table.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> IMHO (the DT maintainers might disagree) this is not a different
> BAM DMUX hardware block on Shikra, just a different firmware
> configuration. I'm sure the existing SoCs also have those XPU blocks,
> they just don't make use of it.
>
> Personally, I would rather describe this with an optional "qcom,vmid"
> property similar to your bam-dma patch, allowed for all SoCs.
>
> Thanks,
> Stephan

Thanks Stephan. Adding Konrad (Cc), since this compatible-string /
match-data approach was his suggestion on an earlier revision of this
series send for internal review, specifically because BAM-DMUX is a
singleton per SoC.

Konrad, given Stephan's point, would you still prefer the
compatible-string / match-data approach, or does the optional
qcom,vmid property (matching the bam-dma series) make more sense here?

Happy to go either way once you've both aligned.

Thanks,
Vishnu


