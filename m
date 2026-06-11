Return-Path: <linux-arm-msm+bounces-112782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id klkNI37qKmpwzQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:03:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FAF673D32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:03:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=luUTcME2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OAyhsIhe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9981D34EF2F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6598633F5BE;
	Thu, 11 Jun 2026 16:44:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD5231F991
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:44:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196259; cv=none; b=alliXHwpkegEVVG5Dac4BMLLdRxhveD12vs5eoxJfzhGrpbqBLvIramd3igaY2On0R1nJ7uJzGdPLN1SzaruucyNVdqIbUfD0Omet/MgULCN+c8Liy+zdaDWIGPNxIeoZaTaWNae52NI1y5kIe6ZmHCLPHH/N7IbpQyXvkOT1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196259; c=relaxed/simple;
	bh=krf3HaMPJXgKzlKQ0ngepJZ/cQfVsLaulpxkrHsT8W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRtOmeREhpJJdmJGO1cVBbYm5HSeqt+55Zof8tFykvvrMVXL6L4oWCf/gYUgSDCHNlh9mdMPIkqAgI8ir9BLBRdBN3B7xKJ1QsmPqpjoAYGAs2Hc+T7zJdttcBYNgveyMS6FBQYt9/FQc8r8m/8c6bRuu2WzopIVkwuBD5QqyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luUTcME2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAyhsIhe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEs4Uk923215
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=; b=luUTcME2sUlw61mL
	ReMyeiq0+X/1aoZE9CvGwEOvIQlQuWzUOedDJ/3cUnZ45h/B+oXs8/UysFWThEy6
	qPEEws8zhWxe5KJCYqvN8DjWs1W1nWf8oundDLi97+kbAeNwDrdXq/5DOwZYb1jO
	9vYUWJOSGfFqsRdDvUDeg7N1EqGwQOCBWWILNEF8gpNAAPYq0OFbiyqzBH50IQbY
	KMizfSv8hpypr/f4KRf1GemUOhia9OAlWoQqdvy9Q5FLc8E+vxNya4n4iHH9sn+c
	n57r4ascIllM2zZFrW9Cb0eCASmchsxOOXvK2uB6UvGBpbyKyjYQaAuPGo70I8qR
	9m7qUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uvh72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:44:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf3636d6c0so277685ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781196257; x=1781801057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=;
        b=OAyhsIhetZoDjF/9TguDIwzxQOI3euHlr4hASQZfC4jYJHstzQ4J3Nv7PJG/H2SUVi
         zuvmSjtqa2gsX6h4F4cQZK8UGObcxUpLE6U/7UL+/Gi9sxBcD+j4eC+QPceiQ5+1eafk
         h0RqTjoW3ViXTTM48Ahe1Q+cREC+PcZaPE7RMLjISnRffiUdAcqA/Eq6q+kINZ/m5iN6
         k100QiDFxMOQ7ql5fvMh64Nhe3ZMGJvJjsHC3hZGJEcX8P1ZaImN0QXP7yFdXL6oO/w2
         Gczi6GPyoB0XEJ2xup4pJd0k+CN00gwQq4FTiG+fuM+EyN58wGWHX/WFmPAcQMeT7LRm
         9KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781196257; x=1781801057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOSSTINPYxoG/5DaQTGvJhl0JSwby/3qC3+a3z+0AOc=;
        b=Cav1NEyyS2ykpGppvgxTUyM7WfAuboQvtbOD2wntWPvCXNsdsCIkrGTEdQ9GPU4Fyh
         EY1z/s38IlEyA3xF51njmO5dKh5qBEmEsarKMRbWABYGuE1VWq1HplRWZyeB/uWw0vB/
         u5hwVXg9x3EZsGXo2Zg1NcLIxq9G+p2RYEdVGOA+NSVIkrlzLn13MX9S4C3hwgH6D4XA
         izORJNh6x1MYDpp4leqGIvkGHfYwyFaH1sG2mytajQdY3Qb+M6IKssM0+QFV71Saka0q
         XI/rCECjpHUuISV8OzZnHEJGpOXgiYQFBu+/AW2bh3r0vnJr2f3MIW/bYrygx+WGEfnO
         0lmg==
X-Forwarded-Encrypted: i=1; AFNElJ/lgBcVl0FNKoOD96oOQGnJzOAkhHn7DYJXr7Cp4zAA6k2jGF0fqALEAspFdrUvJ29nfX56+bpQV0740otw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+dTGKhsPmIhOhtJgLcheqV5ZpRXKvpC+ttLNnB9WkOccwoCos
	uuC6/3hL0IZlUYjEL4tMWUCRwRKb2JJwlX/p6WMnRh0doFHtNqaxD9+MnSTtDELQEX6u3Eyx+09
	PN3w6e4B98Nw4Ttieh0SnTppWbwcBwKvoOHY5JrrzfahZHALI8xTSMp47uKjD2JWnbav7
X-Gm-Gg: Acq92OG0WuALCkWOLWPcj9oBQOloOsnx2QANBYFSmIJ2nhqBNaWcyTYE08WoS1vxzja
	KbE4i8uta+Yz9LVGPNdqxflGLoG/10yL+ML/eONXNt0hquZCn9OcRCUkFgy/qcMlQlyd6W9bhro
	l+z4TYOoA2z82Ktb/HJgmjmQ76z4+MlC0FxHP9QYRXDQ7qkB6VeJVwfTI2Y4MBffgGflST3bnLu
	2vVv5GWF5grhmcl9JDfyEJmJyxEnxmW0/C2ocgd17uPTndTSwhe8q5HKt7mUWBEmrqPruuqgD19
	1kYfytInhzskcgPW8hbMvVCG2WhX6qsK1QUMFew0mSDY0sJJzWSTuncqrjAjp9MJLQYkN6oWIvF
	3ACkTABNnO1WPZgnbFbJ5sbmNqDmxYlXbY0f3vVUdwUI3/NmkksljpCDo
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr40351415ad.20.1781196256556;
        Thu, 11 Jun 2026 09:44:16 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr40350855ad.20.1781196255866;
        Thu, 11 Jun 2026 09:44:15 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.224.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm285676815ad.22.2026.06.11.09.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:44:15 -0700 (PDT)
Message-ID: <9b1eb177-3a54-4e27-878d-b0e66362a30a@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 22:14:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
 <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
 <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
 <20260611164211.GD1212816@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260611164211.GD1212816@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2ae5e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=7stYiaCvZhmFmS4NdBt+oA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=lPjybrl6nYg-Po44eRwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2OCBTYWx0ZWRfXycJujQFohSVI
 7pCiaH2VZ5iPgQpi1q8EWq8FeORiW7akT5X//ZcDxu8RnqYWfQE8o+6bE9LTxG+g6/5pJO/DpBt
 DYWT5f5vYhkk7Z+GNaQuVKhqzWFxyNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2OCBTYWx0ZWRfXxpLpIHvwfoG6
 aXvTJhBakKuwk9C1y4qPFpY7l7wlYZSf04vJ9E3QqXq7Z1hO65GOvc1mXePMjm8mLafRAVB+Hs6
 MehAhApZeW8JthlqZ9p34sSfntmHZ7yEimd9UOQKrjr6sX1h3Mvz8/g6qt4KfjVattWU89pd3jV
 uj3ASsfq1d49QRYvo1zMgt2dgAPHA6BCe6nToR2DbSHBb9fxH8wBEMEHxHait1UOgRvBrrdUaJ+
 inFP3ZsXxI6pzFOUUQ3oGXV4mRW0qvZz58gumca/tLlm3r6/gHJt96Al7+sucpKOjohOvlcsDgw
 Qoh0SH2/gBxOvFDYOqzGZ7/2+0HIzFlZnlg4VDZ3IiPtwMOfjm6aV16v+u0U+nM8iTCscguymWT
 SWXL7qIlvRw9OTmCp3PW+Jm3RUs4dQmkFJDIg24Ei8w/2CvoAYmGXJ3gtMk3mHyElbmbFPfJB37
 k/J8cMBwkrv+kWm4Utg==
X-Proofpoint-GUID: ZIozkqwKn-UojazKJnaT-c9M8aB6slkm
X-Proofpoint-ORIG-GUID: ZIozkqwKn-UojazKJnaT-c9M8aB6slkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-112782-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:brgl@kernel.org,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,oss.qualcomm.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FAF673D32



On 11-06-2026 22:12, Lee Jones wrote:
> /* Sashiko Automation: Reviewed (0 Findings) */
> 
> On Thu, 04 Jun 2026, Shivendra Pratap wrote:
> 
>>
>>
>> On 25-05-2026 15:04, Shivendra Pratap wrote:
>>>
>>>
>>> On 22-05-2026 14:38, Bartosz Golaszewski wrote:
>>>> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>>>>
>>>>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>>>>
>>>>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>>>>
>>>>>>>>
>>>>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>>>>> mind is something like a new field in mfd_cell:
>>>>>>>>
>>>>>>>>       const char *cell_node_name;
>>>>>>>>
>>>>>>>> Which - if set - would tell MFD to look up an fwnode
>>>>>>>> that's a child of
>>>>>>>> the parent device's node by name - as it may not have a compatible.
>>>>>>>
>>>>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>>>>
>>>>>>
>>>>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>>>>> have the child device reach into the parent, look up the fwnode and
>>>>>> then assign it to itself after it's already attached to the driver.
>>>>>> This should be done at the subsystem level before the device is
>>>>>> registered.
>>>>>
>>>>> Leaf drivers reach back into the parent all the time.
>>>>>
>>>>
>>>> But drivers don't generally assign firmware nodes to devices they are
>>>> already bound to. This is racy as in probe() the device is already
>>>> visible to the system. There's no synchronization of device property
>>>> access - properties are assumed to be read-only for a registered
>>>> device.
>>>
>>> thanks Bart/Lee. Any pointers to take this from here?
>>
>> Hi Lee,
>>
>> To take this patchset forward, it would be helpful to get your views on
>> fwnode based addition in mfd-core. Maybe, a member like "*named_fwnode" in
>> mfd-core and then a lookup logic, or any alternatives?
> 
> Can you please make your best pick and resubmit the set please?
> 
> I'll comment on a fresh set with fresh eyes.

sure. thanks.

thanks,
Shivendra

