Return-Path: <linux-arm-msm+bounces-114468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fntiFhDmPGpFuAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:25:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F96C3C36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:25:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y0/nxr4g";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kxhUfiU0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114468-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114468-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03A79304359B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2FF37DAB3;
	Thu, 25 Jun 2026 08:25:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7F37F01C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:25:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375939; cv=none; b=VVHSqDJ05sQgvSpVS+c78Fu+/eLhJtQCuxwkmk0wGrZjzd7pD3Dtk+t+MhMZvITnlrZSSKWu8SU/xNoJBrdQkAEj+pxM+e7j+DCmOnLFFEwLmf8JVLkY5oXyvLZuCmexyut5ZgfpUa301CG1NfpZYN0j6bX/IE9TrNwxMsXEs20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375939; c=relaxed/simple;
	bh=OPhLm1rJuIi/m2Pvh96og04FAYQ1yIsttDFmqZKVvPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw0MFX+HHzPxAtAePjBwH9ld8s6Hm2O4AtUb9AzNUE0uLm73sm2aBwfnKmiskW7rtuNh3aHjlLwOa6W8P7gLwg0NZctgBtEiIj7Wlcyls8yAYY4pe3lw4WvF4XEmBb84jxxXwnMhaG4pwJ/Qlzv4W2P6t399lFDxYgaBvsc1ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0/nxr4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxhUfiU0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P6gjn81526984
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hkulWBVykslW4PgXVL5UYKLv2kiiaA3D+8uNzq2FGA=; b=Y0/nxr4g48zscEjE
	vs3fahqZWVg8cCh39meTKghe/FBOXlbW7HUTVWXKunt4w/wL0UOd8ZMidqvASI04
	sC15nSXITDL7PGM5nTEILjsYMLYKQBHcq/1Wg5zXdhTCVBloh42PALwhh2F+abXY
	laXylebvd9N6wH1DwSlbk1FQ/USqMcSq7P3d7/nDHEveotJfXTvuQNoKkn6bAkrH
	HXgjcZCXOkLjrAGTd7eLrTqFqDCegd9Ugf2N1fYKaL6PsB9rmOT/Pox0DzvrGO2h
	TlzDD/4BLTbFVekbFuZu8O0TOHkhcXKunu8ip069dbAdLAaXxZkD+Z110qEtIsaf
	vXxB3A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8rcqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:25:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8de97bd8459so6919916d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782375936; x=1782980736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hkulWBVykslW4PgXVL5UYKLv2kiiaA3D+8uNzq2FGA=;
        b=kxhUfiU0OqiNPEsmj/mRElOYvadwdxdjY5+wyaEmyTxApmWMl7AbohsNPLpy4gEQXN
         /wPRcD832yOuMJVTPQAaKwJQ+fj3YbSOrTeENbsuGCgBfmHLquJg7XfG4w8Wwlij4JSA
         0ZnoegLV/duNVG4wBurPiYN700EOlE8xUmBqWH4/joEK09LIVaifVPEs+9oONNEUPPAX
         QIXdh91+wc1zptubz+0vjYxL4vNRUMGUHQWIVXC2XOf8HefPMnGnm3nnErzPNYIwZxZq
         9PBCf/hPd/8oQk2Thl8QdoIsbrHwt7emz/Cje56l+xBVo+G0GKQMJOgR/iA70poxesr6
         NkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375936; x=1782980736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hkulWBVykslW4PgXVL5UYKLv2kiiaA3D+8uNzq2FGA=;
        b=A5roFcbtH51qkzd9kt0p0tHliBxTZqmmAMXXuRJyrWjcHvNZy+zQHWY6pGQGT/rKfw
         VDVOO3S+X5RPhIEAUczyToCAx4OZ59AYiacsZy+7Lrek0FfL1kiePC6sqx/BXqWT0xX4
         Em42qyZSM6GhpH/f6I/zAhmCn1YlXBDIu39uY89OK/CGkNL0VvEdN/NGcUMJo1kFmPE6
         7UIU+pYwGjKMp9mT+6qx5hLoHMH4gawYXP6ml7ZBM+6PZhtAPcwRUZyraILw1ie9cKel
         zoa+KQOF+kCm8J8OyjeDXP3a8cix3ziGFp6mDVo26ywEnQbvBlB6E8/NjrmVTKkXfqrE
         PfvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f+XQ6nzDvewEmm5IDzoyjRH9lf9HMrLEId0hxKiR92/AV+0sB6Znp2RE7b+6Ho0F3T3aChjiUUt0PAxCm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lwu4t7Ie07xduCCHWhKGdWHioaTsvlS1XIkwnPhi7tJBj/xW
	CC9D3gwTYTZVTAP90yhBAi3L3APL72hNa/m/t4B8dMM2Bu3uNKiDSh4drIA82/BHn0ANunh4FiQ
	bP73uU/1FewFhiYRZaN67o2UTPznthohpEyRwQLl5UTpXuQGtHPYpGxuGlhVDHxhYAYaj
X-Gm-Gg: AfdE7ckxKEv7PCvG9RhEXQvfQAgCus6x852nENX6FVwdChXsU35hMVbQf6s23SaVkps
	fgFyCkNDOUauquixqIucJhxJ7MbH38jmUv/jkoG4DzZDqlo+w8OTnbqsWMZRo+fIDMfy15vjAqJ
	rxD5380sewzjr1m16ESBIFHHwe/SG5LANAD8wWFfo6s5uOy2+zFNLw7FTleYMfDqDqEOqq4IQGB
	DC27QP7udwhI62i/jtOUWqgAS3g+YjRwGxdpUrcy0cL30w+R66ddgZOIeypIAYsxN0HPwG2FCeo
	MErGNSz49q0uxu4hh/YoPtnzekNv7S9e4m376NoRipTTAgb13IwJiu9huhKwUpzly8LxbZgSfbY
	pemj82Wzswjbw7o1puUSkancA53rr5/ZHJzY=
X-Received: by 2002:a05:620a:258a:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9293b572b56mr121495085a.2.1782375935573;
        Thu, 25 Jun 2026 01:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:258a:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9293b572b56mr121492785a.2.1782375935031;
        Thu, 25 Jun 2026 01:25:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa5desm128737766b.2.2026.06.25.01.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:25:34 -0700 (PDT)
Message-ID: <7d8064bc-4dfa-4990-ae36-d68cbc9cdc9a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
 <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
 <29806448-0588-4590-8540-a689ccf1e7b0@oss.qualcomm.com>
 <82253653-bd85-45b8-8520-e2bb213ca48f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82253653-bd85-45b8-8520-e2bb213ca48f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3MSBTYWx0ZWRfXwTXEw4V0mcya
 5uf2YvkX8jzHTVku1dbHXW5s8OmcDpl8h7U49XskgXlv1yGLIoOHpzvnhtQu7eLTCpQjNNOGwVW
 IyjYsh1WSlozIB8rrIJGfpHf5ekElm4=
X-Proofpoint-GUID: lhkcvUgnCjw8RqY3y-OJIgDesIIX1pEq
X-Proofpoint-ORIG-GUID: lhkcvUgnCjw8RqY3y-OJIgDesIIX1pEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3MSBTYWx0ZWRfXzi1cCd7ECtwk
 Px6O3i+C0GyoQN52/CZ1decOj6OCtc4chEu8fRT2MeOvAQsBuvh0a5CThPpAozXxBP6gJNdryzt
 T41UWqs7N0ANzgeTiGP9Slo/EyeWQcl2n+G73CJBushb25IAEnfqQkt2X5mzKnNcbB76RlRmJWm
 0af7iNnAEDNRZE7CrwhA1cTQFq98jAWmskDI7O/9Z0CCPhQk1g71d2rStPEJ8PtyQy1JbGkjnMg
 EQ/5I5af1qUX2f7vNL7O/miEycUKpFEysHqHcd565LRl7qJiIAd7S/YO6c4BUSwDHu/pVpc/eTD
 bXjj5W/kJQ9aCJWr1PorGkPiK4UjWHquuktBx+wKTUSo/OvBYLgaa1tMBWk7C6jSDdahBUUGaRO
 qxTmTKuM6fipQXd1NyAU3Qu+qk/WhEwPK5q+L5yp6g4TaOaaLPWIGiDyicEkl+pkMlSYvSuTjuV
 9bwRA65KbEnJ2j3Mipw==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3ce600 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NcuwlND7g3vlKZA_ufgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114468-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: C76F96C3C36

On 6/17/26 12:12 PM, Fenglin Wu wrote:
>=20
> On 6/17/2026 5:30 PM, Konrad Dybcio wrote:
>> On 6/17/26 4:31 AM, Fenglin Wu wrote:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ptn_bulk_write(=
h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 for (; i < len; i++) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ptn_write(h, HA=
P_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> So if i'm reading this right, the first loop will always write
>>>> 4*(len//4) bytes and the second one will be entered at most once,
>>>> to write len rem 4 bytes.. should this be an if instead?
>>> I should put a comment for clarification. Here=E2=80=99s some backgro=
und: FIFO data writing supports both 4-byte bulk writes using registers [=
HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes usi=
ng the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is more ef=
ficient, especially for waveform which has several Kb data, and it helps =
to reduce software latency when loading effects and reduce the delay in t=
riggering vibration. It also helps prevent the FIFO from running dry duri=
ng data refill in FIFO-empty interrupts. Typically, we use 4-byte writes =
for the initial 4-byte aligned data, and 1-byte writes for any trailing r=
emainder.
>>>
>>> So it still needs a 'for' loop here since the remainder could be more=
 than 1 byte.
>> Right, I mentioned len rem 4 but failed to notice it's a
>> single-byte write.. anyway, a comment here would be good
>>
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Configure the hardware FIFO memory boundary.
>>>>> + * FIFO occupies addresses [0, fifo_len).
>>>>> + */
>>>>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 u32 fifo_len, fifo_units;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Config all memory space for FIFO usage for n=
ow */
>>>> What's the not-"for now" endgame for this?
>>> The hardware supports more modes than the two currently supported in =
the driver. One of these, called 'PAT_MEM' mode, also shares memory space=
 with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved an=
d waveform data to be pre-loaded. The entire 8K bytes of memory can be di=
vided into partitions, and it is configurable, with FIFO mode always usin=
g the first partition [0, fifo_len], where 'fifo_len' is set via the 'MMA=
P_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data preloaded =
in a memory bank defined by the registers 'PATX_MEM_START_ADDR_REG' and '=
PATTERN_SPMI_PATX_LEN_REG' (they are not defined in the driver). Since PA=
T_MEM is mainly intended for hardware-triggered vibrations, such as a sig=
nal from a dedicated GPIO triggering a short vibration with a preloaded w=
aveform, and although it also supports software triggers, I haven't found=
 a suitable way to support it well into the driver under input FF framewo=
rk yet. So, I am currently allocating the
>>> entire 8K FIFO memory for FIFO mode only. We can adjust this later if=
 we find a better way to incorporate 'PAT_MEM' mode into the driver.
>> Sounds like a plan.
>>
>> For the other mode, would that GPIO trigger need any OS intervention?
>> Could you speak a bit more about how that works?
>>
>> Konrad
>=20
> I'll try to clarify the 'PAT_MEM' mode further. 'PAT_MEM' is useful for=
 latency-sensitive vibrations because it preloads the waveform into a fix=
ed memory bank, then it doesn't need to load the data of the effect in th=
e HW before triggering the play. When playback is triggered, it plays the=
 waveform from the specified memory address and length. This memory shoul=
d be preserved, and the data is preloaded during boot. Unlike FIFO mode, =
it doesn't allow data refilling. The trigger can come from hardware via d=
edicated GPIOs=E2=80=94currently, three are supported, each mapping to a =
memory bank set through specific registers. Software configuration can be=
 done in the bootloader or in the driver probe, but the 'fifo_len' should=
 be adjusted accordingly. After setup, software doesn't need to manage it=
 further, relying on the GPIO signal to activate the playback (for exampl=
e, a pressure sensor triggering vibration to simulate a physical key pres=
s). The trigger can also come from software using
> SPMI commands by setting the play mode, start address, and data length.=
 I previously tried using the 'FF_HAPTIC' effect by mapping 'hid_usage' t=
o a predefined effect in the devicetree, but later I found it unsuitable =
since 'FF_HAPTIC' is mainly for USB HID touch devices and not general vib=
ration usage. If you have any suggestions for supporting 'PAT_MEM' mode t=
hrough the input FF framework, please let me know.

I don't really know much about this part of the kernel, but at a glance
FF_HAPTIC seems to be roughly what we're after - quoting the cover letter=

of the series that introduced it:

<quote>
Haptic control
=2E.............

The HID protocol described in HUTRR63[3] must be used.

The following waveforms should be supported:

| WAVEFORMNONE             | Implicit waveforms required by protocol     =
      |
| WAVEFORMSTOP             |                                             =
      |
| ------------------------ | --------------------------------------------=
----- |
| WAVEFORMPRESS            | To be used to simulate button press. In devi=
ce-   |
|                          | controlled mode, it will also be used to sim=
ulate |
|                          | button release.                             =
      |
| ------------------------ | --------------------------------------------=
----- |
| WAVEFORMRELEASE          | To be used to simulate button release.      =
      |

All waveforms will have an associated duration; continuous waveforms will=
 be
ignored by the kernel.
</quote>

(i.e. reword 'press' to 'trigger' and we're mostly there?)

I'd start prototyping in that area (maybe taking it out of drivers/hid/)
and see where it goes. However as I mentioned, this may as well be my
wishful thinking.

Konrad

