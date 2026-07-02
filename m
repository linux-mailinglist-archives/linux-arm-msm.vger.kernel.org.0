Return-Path: <linux-arm-msm+bounces-115930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KQlcGvRERmrDNQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:01:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CD6F6555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:01:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AWTF2z/I";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YuXX1ZBE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115930-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115930-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04D823111EE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727E03998B2;
	Thu,  2 Jul 2026 10:22:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B725E39EF1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:22:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987764; cv=none; b=oA3BsM1g0YlgAAfcTqBA/NKOl3GDpfTKQkZqO5w9pueE6Zf8VgAW8F8cMLTZHjAa7K4WVA6evH8W/4MAeYxQjvNHHVuTA9h5WsSfwbGFd06jvU+Q8ssjWQ6mFNKCQDC5F+eaYtJwCSm4Wnm3g2NqtMOfeMs3yICkO8YrYXqJFwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987764; c=relaxed/simple;
	bh=o9tFLmNsR/+FbAtqghIZ3r5O3LeY6k36CTWd36OTwh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPzcPM2ShRgCUcMTzdnsJWjnUysbNZmr3uCODcqtnJx8lISECBzvr2LeBOnmD/2aCqqcosJYtr8YAM1ue8zl5ecMo82q4jNqhqmIN1oJW/gYd6nTuTvjknBELr28MvUrCa6EFCDKLJwwYMW2sUwOQAvfefIA5KNz6vp60nt+oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWTF2z/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuXX1ZBE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628YjMw3049486
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ukcBbTjMthKe2GNqJ+5N6ofiA9OEHfabMRs+DdH7aw=; b=AWTF2z/IkMlVsj0I
	kaKuoJVOXInwToOv58Uv+dB9TxSgyw3vL94GBLBC2Mfp8LdEz+ZfA6X6dXVYYUUA
	NWCFR5c8S3t59chmihgNX3kdg1GI5qDH/+yE4mKuYfYrqS9zJuR65wH5zWxGVSfR
	j0s6ooJzh2mZZKdNufhWi3wlL0t/M8eqDzk8YpXFqj9CDM/Nd8PthpdX4bZThkUN
	LM8JIJCAxI0zimjPaER2vOc+bsg+NUs5tMyq8bQAl/KfHK2Ts4gH1tPJhua5sLkT
	64i1KEFm+BntBGuSsaxs1Jap0R7rplT/sTKF5JmYjDU+T2jDj18cl3bJopKhW1FW
	D8j//g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v6ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:22:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so2762357a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987761; x=1783592561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ukcBbTjMthKe2GNqJ+5N6ofiA9OEHfabMRs+DdH7aw=;
        b=YuXX1ZBEUsWVuZPbXegg5h8dgkp9aIbgZuiuETaeZWDUIHzO0DDP90FzhK4QlTy8K0
         0Kuzq9QUHoBph1HzS8X9SoOER2GsWwO8WDxaNa3Wg65frTl/6SV6HLg9HirJW7V0P9rL
         mEAQMpCFwXQtNr74dTvLxda1KZyjXc4ADHp6x9u1peWUXfnsLbwgT8L/5HMPOMaJAIeg
         whvwlGXT1OOAf5EpUSdfwe9et8W0eY9AJY1vpPvcknJkp8467QU52k5sdrNDVzchmQQ5
         xkcey7lWa8OqMchli5BFOenVwPValoP3jaqvWxdZB45MdfTE/Xs2mwm0/dllMWRfU+yZ
         0BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987761; x=1783592561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ukcBbTjMthKe2GNqJ+5N6ofiA9OEHfabMRs+DdH7aw=;
        b=MoNxDUO2OJn7wxzySdc5IPNDDalVjHRMBJxEQEZYntfimrbtjri3PucisNkIj7KDyQ
         J9IS45cStByj8Kqx8ywLZ2OV1QISlrt2PCIM0laRvyvhGvg34OXAwwOM19hF3IsAwpH5
         Zntf383ZTBF4h7bv1SgB8SW6zyqenZRIeS1NFbb704VH/vMRqpsHBnQr452kx/YUttHa
         +WJtYBnLj3F9LrGSKJFDMMwB1j8z/ws2C76pg1MPMowAAtk6h5nk+CiYoBuDmGe0PhZh
         EBlIRlFdUnm2VUnPHqZnaQ/1ww8nPiuBpyeQHRrAXLbr7j58+Dh8nzwztIKl9NJCWO+v
         azLg==
X-Forwarded-Encrypted: i=1; AHgh+Rqs9XFS51VfpV1F3rEtl1oeJwE9tNc/f4iZRvJjHsgV8joBl2gNoeZ7QFKkhvPNcE+wUQRD0bT577KQKHMy@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJNLmRD3kFOYaFMNyms6QLtmgAFRt6QQIJRvuRuAnoFLHj1bO
	773nWZ/GPXT7tt+RAlxkXWlbXl8Izuawm0PYdN7bCgzCXDEAwwHJtqtYsgq6jW8OaA8KvPcZhnO
	AqtlXBF5LFqnE/coD8UIxjxbm3bcjI9yvwzIU/pox0uE9xrZ2f3RZuQgMIOfhhdx+gWqqzev4MS
	S6
X-Gm-Gg: AfdE7ckrOZN3UvrxV3n6f4DEjdoos8R9Rk2oPMITxXxHcsotgnjDe4V9p7zPo1FES92
	ab9sKmrSyGyCXw37qDHyUh9UG3/H/qN+E4q6SwPPodcOsK9bZzo4j4kgkoEqJdMiLW8qekFh0Mi
	0Ni/5bsh92os3B6Fbismju3507zLmr1ut5IkbGP0KBMMxF9pLpW+NXm8zQIX5FW5J3yxMQ6FZkD
	2/iqFetd1WZMrZsNBMh6DD0pskJrL/VWjYH3l5VcZfc3Mz/pcIw4B8YCq3PQwksH821FRMwBOTH
	C2HaCxHqYYdt9hfjk5n5RUGHOqWaNlYesVzURdSnaUMG0StrMtQ8hAlUwlK7bLaUIzMJsZb0MBL
	aqU1QJPNn9tw8UQAvw7GmUXpTCGNO8AJtgOymgT+Fcf2i
X-Received: by 2002:a17:90a:ec85:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-380ba868183mr4639877a91.10.1782987760680;
        Thu, 02 Jul 2026 03:22:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ec85:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-380ba868183mr4639854a91.10.1782987760158;
        Thu, 02 Jul 2026 03:22:40 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e160b4c7sm862810a91.11.2026.07.02.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:22:39 -0700 (PDT)
Message-ID: <65e9d52b-d747-40b2-a6d0-424ed03c9469@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:52:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
 <akIQFAX8LcZae29l@ninjato>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <akIQFAX8LcZae29l@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oxoRb7A7YJ_H5oBdIPoXt033uyC3LC4x
X-Proofpoint-ORIG-GUID: oxoRb7A7YJ_H5oBdIPoXt033uyC3LC4x
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a463bf1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NyuSsmef85SJCTiwSksA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNiBTYWx0ZWRfX+yZI6Q0jKqJ4
 0Euw3Tbs6Nw+5k3VDoDZBxTKdfoAAQodsvVc+NtrPM8F5Wbn7zpK++4u4pYMOKBY3l7Yc013P1O
 h5U84eX/lTj6EpIBLlykGcQ/5qUDRzCOg6VaMwWj46JtviW0Ws4RUnSRsopZsUqU5VIc2F4flvl
 WXZrtYPDFLmTLe/ijVhRrootTOZayClbkbKUHXs8CsF6txVC9mlqkh6+xVibH+CJpbxdwHuVBtD
 bDlJfRkWiSF8sVD3juoB+zPIeKsfEs7QtwuoyaDSzAWHn5rHmhSwvNML2eGqbv+arepUluSg4Ll
 D+UmhR3UO3cembP4AZutzr+o/wxUjqRKxkBY/GDvhOXvDy7UArj4ONf/EtbVLPrGW+Li4Lrn1SK
 irIGWnJtvG/8Um73CtbFnh7IgcTxPcnG5zT2PZ9TVY3WBFOfRdl/cdAVYTi4jwpbVa1aP/i3Gcq
 wokz4DQTsmW59OmIzNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNiBTYWx0ZWRfX4md6d4j4HFAq
 WxwAMHt8sgpqDUQexX8USP1s+4k4UdSxsu2vExlF6tW6PLQAIqpccMQxMTqqg2fBX7eOLppQVFG
 PREE8aRQvv5+Jpz8LInl5FaxgAIp8RI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A50CD6F6555



On 6/29/2026 11:56 AM, Wolfram Sang wrote:
> Hi,
> 
> On Sun, Jun 28, 2026 at 08:09:04PM +0530, Viken Dadhaniya wrote:
>> Add a binding for the Qualcomm I2C slave controller found on QDU1000. The
>> block operates only as an I2C slave and supports FIFO/PIO transfers, so it
>> needs a binding separate from Qualcomm I2C master controllers.
> 
> The official naming in I2C is now 'target' instead of 'slave'. Do you
> think you can rename that? I know the Linux I2C core has still the old
> wording in a lot of places and needs to be converted. However, if
> possible, it would be nice if not more of the old terms would be added
> which need to be converted at some point anyhow.
> 
Agree, let's change to target naming.
>> Document the MMIO region, interrupt, XO and AHB clocks, interconnect path,
>> and the 7-bit slave address needed to describe the controller in device
>> tree.
>>
>> Use the 'qcom,slave-addr' property for the slave address because 'reg'
>> describes the controller MMIO range, and this slave-only controller has no
>> child node where an I2C address can be encoded.
> 
> This should not be needed because the backend defines which address is
> going to be used? Can you share how you tested this?
> 
> Happy hacking,
> 
>     Wolfram
> 


