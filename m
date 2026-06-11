Return-Path: <linux-arm-msm+bounces-112708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sv0tJwqRKmofsgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:42:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD7670F02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SJSXMf5X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VeVZqbeD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112708-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112708-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5579C30209C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09B13CE0A3;
	Thu, 11 Jun 2026 10:39:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CA73A1E80
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:39:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174391; cv=none; b=UFDS8W6llhR8J9tWayEyoiEufXYqkWzNuXab6V1GAYxWlDtwD5O53N8fS6iYO4f7A0lm3Gp1b/jOW5MH7j92WZbhu4tevO+DSXvpE+xr9l8PJiS+VHSYodc8SzcueoVF8xHbmLY+NM5/iNHG4nk9fy4+vQ1zzCJ/oIjpDsitd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174391; c=relaxed/simple;
	bh=nkgay7hRGOR1whwbuzJRnzKBSyfDpBe/79l8q3FKOVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEdhzd9pl1/vSTztgn7JSAUVrgwX28ttRLqSdDbnF+DAcllVcZggQz7UEIaFmmaEQ8KPqpfUgdIsuU/TdPQOtkBlPrW0mV7o1rbwC6vG2R1ysuTVpAWNtS6SQvhM3jCPqWnld0BAO/6fN+3YXkbTWY+pQJ1c+pVpnd8vLPGScPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJSXMf5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeVZqbeD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0uOe304010
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmGt7JFBXRq8q3sZZr+m6Uul68lrJESQFFfzp79mWes=; b=SJSXMf5XkipBxAHX
	E5lCsW29gKqHeMun8+gAKY2hqBTkVizRlhKeCHUuReKhfQ64nvZjv5rxFq14rDBZ
	dY+CptxUClJ9QgfIz00lGISx4rLpjVhOxQtN+tLcl518xTbGvnp0zrFRgAoj0TQU
	qpEWTB8R6g1YdnXyjNStgEpsVTsT07gjhuEbtqsH39R1oVpZj/YoGWyPx46ioW7v
	e4gX7CJQhbJzkNwXY+iFQNqkiMtI2qEB8375otms4z9zDd+PbvQSNIPYxR/NJI//
	ySA/eE/XfVeTZdC1DOuG4d6K1NiMNhj5A1NSFNr7pzFEI3+3wXIqqPJ6lmD7/i9+
	ah1s0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5g9fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:39:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178a632a12so21185261cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174389; x=1781779189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmGt7JFBXRq8q3sZZr+m6Uul68lrJESQFFfzp79mWes=;
        b=VeVZqbeDrn9g57ZC1DfSSyBp6rvBbNgrqkfUG1vQMdAYRNhLcyKjvStEVUGjo/vHnn
         YTySv8jX/qgYJ3xDTE/NG4vQr79CpvzxhJdc0HwQfFUMCV8ktefwB593EtRpr2AexrYo
         VEcHirKJoe4holY69Kp4IbX5rs8TS7rW/Ml0UXcpWm2eG1AAp2YbmL8aUwtByb2I8P3n
         w5Xn7YKmUnXtEPmGOHIH/9vtQNs23PBXHEJKedOuoUsRAn9WYJ+mTd7RfpwW2oLYb5/c
         tGi7zJb4vRkj6NSiVDgvDgVsazJSZHKln58bLZ37jDsp3ySuyw5mPvYTxZ7q4prcNdhu
         blcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174389; x=1781779189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmGt7JFBXRq8q3sZZr+m6Uul68lrJESQFFfzp79mWes=;
        b=augaEqQHkSiYYwKXQjrJvASuSEZgEeuPSokgR+AYvasyb559yYQg1R8KFtIml6qz7K
         6TTtN2KDnhU5eNSj+ES6oxrXExrS+vz+D/Ou9wEVY0d6RSxM6fhVb4h7czLkEJcswQGc
         v6th1ctCtjLqtog6dVcKLdLy+vAQTf3JW8P/MtCyudNEJk9Tu6uWIkkTDFq9bqEOTYHM
         XATAmXGhLW2c+y5KrSh3qG4/VlGMVkFv+y4ayZ1/fRuR8jlKofdkTCF8/RlWid5rik6k
         69PKSugVuZNUPmS4htqUCaU+a7wakrty4eGnxpqfP+fEpZ6/WsxeW3G5oNesx5/Hud5X
         dSgA==
X-Forwarded-Encrypted: i=1; AFNElJ8TSTejqdPcjrfCBbYNoYzXdNxX3mpZbb54En2Pm3KmsxVdXE7LdYiw/ZO3EPN+IcoEsQHmLt9Ph7QAmcjl@vger.kernel.org
X-Gm-Message-State: AOJu0YyNEkmJw/CTF5zHn/nZ4FFmQxVDGfXY3y7RJPPZ+FdG7aV61y2t
	CBG2w1zq/E54/TAdR+FzO8ttSedbdy+t5N9fKFP1cKF7lWVF3qPycksOWhL4O+wbL3iH1qUxq+Z
	LDyL+Rsn5ZN/IW/kTQL6TvDja3EZWeDf+eOOSU+pLrhEQSrdc18wwX8YbzVZj32eBzVFd
X-Gm-Gg: Acq92OEBY20RLgK8SWDqG42CGP99dnGk59VHaYvhtxu4iPyCaRzWVUOWXPCVydP0WQ7
	nHWwga7FWGwBSNtAQ/LNQqziq2k2koO58r1sOnTegTGY/9m16gKzan1+qquUDUiaJIkQ9xT9NXZ
	DZIbVFFQy0h2H//I6S1L5d5pWrDIgufUJpHzrGOyAcwWA+AK+OoYbQp8iV8xqHSgy1wT1Ok/Kdl
	e1HsNNFxpUpf5+cZg7FcIgmOQ7vMuTY256U/JTxLpF1QcNTIA9kAWvMaTQiTXQyLw03hU/nOeVg
	OoIJOOYW34qoWiu4g2XC+IBTHvE85rC9cRrv9IiOoTHg4ZL9UKPfzZbqGGhiRR6sWGVqFanPgTV
	bkL2Oiyze1rvWKL61qmX7HU9UJwoecyHs89G8B6XVhAm80fBoNOfXzJ/b
X-Received: by 2002:a05:622a:a06:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517edcda9bamr20986841cf.2.1781174388901;
        Thu, 11 Jun 2026 03:39:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517edcda9bamr20986591cf.2.1781174388555;
        Thu, 11 Jun 2026 03:39:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1608a71sm48817066b.21.2026.06.11.03.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:39:47 -0700 (PDT)
Message-ID: <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        github.com@herrie.org, me@herrie.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX53w3BySQcLE9
 ZeN+/caC0xbEhRw7Z5qABavSW+XYT9CGjrC+0qxnjihfTN1ax8XIsEHGm0IKT65bJVIeJGlc470
 LJAsxzta6TDTISeDoRZJl1IvRyiev/OGGnJcyyr0YhPXIYCbFlzWDGMXfBgFndW7XMm9Z0CrdNc
 4edPFcCNUWC1xh5DCThNN1zBcwLM+//Zuj0J944Xy7BD/5TKIhL4OTweveBxkD+3JvcDtDDoMPn
 J9EyQQuWaoDcL7YmMm9KCyYH50Qbsi1wPikd2shnI+NgwRtp5rjg9+Khjccv1gwPuzhkBvsn106
 Eomybnseee5nLtDXPXaCJIo4oV8BmvT8+JqvLueKhxRxu/y8mWY+vz55C15QBXjxRW0RYSTMsrM
 6SLiURL+xd7nuXjVowqEIVN3krxzG3OVMWb+XM/QeXYKo5GrwX8DRckXtb13ZYzbPDtjFAoZca9
 5grZNAS1IOZ6HNBYKRQ==
X-Proofpoint-ORIG-GUID: Qvf2zOM-jNDD6FwrBlLENFWzkoN_Za8b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX/Xcv1AlLPXzy
 piuG9/1Ob3HqlcZ1xAQmpvTbRoIwkz7ZR8Wt3rZLoy4oXFcTdXK54SwpK93RlWoBFtyp0vWOcKD
 ZbS/I4NuEZ56gxiC9aXL4Rx8WAW4KcM=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9075 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=cTwmTnRGAAAA:8 a=vFWkIUYBD8dAITECdtoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: Qvf2zOM-jNDD6FwrBlLENFWzkoN_Za8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,herrie.org:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:github.com@herrie.org,m:me@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAAD7670F02

On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
>> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
>>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
>>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
>>>> (address, value) pairs that are written after PHY reset.
>>>>
>>>> Unlike the existing "qcom,init-seq" property, the address field is
>>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
>>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
>>>> class hardware needs this range to programme pre-emphasis, HS driver
>>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
>>>> via platform data.
>>>
>>> Are those register writes specific to the device or to the whole
>>> platform? In the latter case please extend the driver to write them.
>>
>> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
>> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
>> devices), the writes split into two groups:
>>
>> Platform-level (same across all MSM8x60 hardware):
>>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
>>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
>>
>> Board-specific:
>>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
>>    devices use 1. This clearly depends on board layout (trace length,
>>    connector loading, etc.).
>>
>> So the platform-level writes should move unconditionally into the driver
>> behind a match-data flag for the MSM8x60-class compatible, and only the
>> HS driver slope value belongs in DT.
> 
> Looks like it. Please hardcode the value for your platform in the driver
> (with the comment), meanwhile we can try looking up the actual values.

Do we have the values for a MTP/QRD (or whatever they used to be called
back then..), like we would usually put in there?

Konrad

