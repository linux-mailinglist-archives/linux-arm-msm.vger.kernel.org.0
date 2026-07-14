Return-Path: <linux-arm-msm+bounces-119080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KFR5H5NvVmoL5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132A7574F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FSxVkGw2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RI0Z0ZSq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119080-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119080-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFEF630B23AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E60F34A79D;
	Tue, 14 Jul 2026 17:17:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BC3009D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049452; cv=none; b=ggTzqr9X4BL+Fytb7ECWnara0UKZ9Sw+f0gbIRH77LtxQKlew1slKqVJ0jJmrO/SgPz6Oa2Bus2SAhJ2sFx3RO67Y5IvcO8D7MJ/DwSdeo9da4F6if0ZikpkatkGv3Rs7/1EKrnByH+rg/J3nQclR7biuzu9p7za5N0vJDSB2DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049452; c=relaxed/simple;
	bh=ctQvLTJKfrXPTV9ySg7oSX/KcelXwjfNCdBeL0pLEu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmRuU+W8iIoy03LXRf/Uts1zv6iHMDamuCBN3jCVVcUinPLda89IMHprKTiU6aQyiGZvCXEJf+Pv3pmYRJwK7DtacYcJlEwUxPLoRWX5UlgGhavMP0W72E6C/amwQUQIk23FZkxP+oO+UjqzVvvFUSCDrNj1SYe6vAMNRIdoSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSxVkGw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI0Z0ZSq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6wK71097304
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=; b=FSxVkGw2uYfpzVjk
	oYLqIGkjTfxBsP/xuJL8NAT8OuDiLN8J9Sf3u+u91wCqhhUsUqy34HNqsEOvUZRz
	4DClD0BuMasCT3MX6+EO4RGQi4UhUwWGCFMZDrdb/3f8S3CW051RzenA4Jt8uPyn
	AbO5tNiKkY/thNjp013Dhe+wGdHaarfH08Lv7X0eVhqpUqSTXOtu99elPqZFKzsI
	e9KrOf6VZKaROjALQXnHV6jLaMja3XAsE+GHGyeFe9fiyGll0wbg3UjGaHUryrY7
	xL0jyMYoJPhsbcSsmmL48mWBTaSqlmRkOy92PfbVNth3bMKcjX4/M/HOjYxBENjC
	KHaFTA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqs3s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8488ac68185so7056534b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049448; x=1784654248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=;
        b=RI0Z0ZSq6wn1aTVqatT+i8zYgnB+ICjhmu3tSHVEyrt+vmQ5SAlnhLJvINSLkYhDnq
         XlIKPP/2BkZkhhYbyuUTY7maKtGC4Dn8J+H2W0mNvigc66cZvQGIoGpEvfYgpRGaj7+t
         sH1Jr80JPszK+q+Y44KDMpQfb6RPTdFVqdLfCwUNPZnRaWEDfgiUtzd7376MmYq8VAss
         rcS+ekIFu7upCEMq+Jf+F3eIC8guIZEZKeTxSvtB2krK9uNLANW5/lAti7xwn6Mf4Wzs
         TWdlHNuCt6DMdWUhcz3MfUCQaYMc6zBeqX+PFSmL5aROrjNKesAXyAwFq8JqSZiQyj6W
         IYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049448; x=1784654248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFHN2qyJOM1iC26km9OAgCA4h/0y1+tM0gE8VpSZk3A=;
        b=bUPvZD1vvjMiz8R3Q+4/gjnSQEVTwG+biBV8HRJbGUBrkD6MgiCIcdOsfeFENqDaHC
         GkSpk61vrvdJQu00/3Yhja5lcpEOBOt/VRvm1lbkaW7lilFUqim53AzhQl6EpcErDBJ6
         HoWD3LsXAB5AR5NrrrxdJu7Qz4r5HOQ+qe1JiWFdBR+7LSBY0ikpxurjDtZwZO7Te+dy
         7J1v53w2acgnbgYSHZCnNl28PaXvwW4pNgOE5Jl5bTnjZ+Cu2SC2AtIdp70vgKfRIYO+
         SqaLfsQYdub2eyAUUhx/qzo+fDHYcTtdeF7bj7rw4punfmSFgN/BdAD03/y/QcSiCeF5
         atoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj/8o/D4QFxbt6TM+yfvZbAPsEqPcukW5Fmav9RjXKk8KZyjXGbuPYzqD5CB/bbghpbOZpQ1keakDOxOZg@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAL+tqxIHg3KEPieJ7epsdsgkETkgMbkcHdFKbktcZSP/Vklz
	Ku2Arzj8FNlPqLq/gvqmoiTOEplj64WiY7OC33KFzCgcojsUZ7MObGef6+plEbte3rAo+Z+ZImi
	49kfimCmBiverMnVdU+PkRXTz6OD58/a6Zh6vLFZwAo0nRDqwG73MyZdC+UJkhLzZ/npA
X-Gm-Gg: AfdE7clsBV049eAsRx7SqQVZgdCMyedcXX1amgMXRlp9xNTwQGBgw48VcMPwowI8a+/
	fdANmhhHAN/lNj0s6g6V9nYJg3AAt3iJN1FW4NU1j+YEKc6QjXp54GM9e2x8WKcapR1efUCcysd
	pllF3xzmzmHqexU0OeCRLgCZaNIu9T5w4eJuCwuRjhBUZB9jx16+m1CNErBTEEYGp/ukx6aynLA
	wjKli19EegRD+SMNJQBvjOYWVkFzoYdV6InZzbYLohvmVoSQ1Yp6T2E2efxVif5s9Ax5i3REFpA
	0/Zowm8Q+DzIOjHol6co2fNPYk26hjJ7axuVdTVOoHUey55EjulIO+gGbE57TpaoqbFqfWtKaZL
	Fy5yLQlsUZhZYntPOWtARTFfIexRhlP9EQhjuNiZyuI7RX5E=
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr13898056b3a.48.1784049447553;
        Tue, 14 Jul 2026 10:17:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr13897994b3a.48.1784049446949;
        Tue, 14 Jul 2026 10:17:26 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:26 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:32 +0530
Subject: [PATCH v23 04/13] firmware: psci: Introduce command-based resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=8392;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ctQvLTJKfrXPTV9ySg7oSX/KcelXwjfNCdBeL0pLEu4=;
 b=SOUs+g6IvT98LaENeem1JD2kteiBbRMeyl3Y6VWdoJ2jkc9hBDg+UwF7+zs1bhbk+6Hx582Zb
 eqzB67lz5wMDeYTxYesBdv47rKnUS3QCBc8BYfNfaPMXViQeoX8ZXGQ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX3qw2nvh++HAl
 zGb0JJuB6tkpBfCdD43UrgLfjQ+lGYFrPAztBlz6Wlm2cOLZKfo0FsjhVpnufOtCu38vflfinui
 hTqBJwahikNgDQDRoxpX2YuXwzejv/cC++9Oqx8m1PcQ1gS8qxmuiVzXOoYgCdL9MzxJsk7lLtO
 bOShv0bUa+rRm/Qpid8Z9hNYpwfAAawfEnpopPLz7bjdwo1d599FwThzsFHiAwzfK9d9UzXk74e
 cy/f8L136LpieM7T5BZSaYuEkxc/gbFMqdBArvHluykrKVe/uIXPTx6Pd3FiTO5943uFsLnKNjW
 VfOocLyGcNDuX33DMInB+UGJez25aDBfEsc3fI1lhc3YjMfoJU9Nm+w+EWtpoYBE11a/a6L0Ioe
 Nrvj0reU7Ywxfo7NFLcpnBgk0W0ogFXOeaJuC7+6As9h4eBYp2+b7bUKOZZKiiiVi5OXn5AzQD5
 1xoW+GMfUnUTlMxtknQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX3ctOshD/ZOE6
 2q/vlszCrt/ao3gJS3jG7Dx+wu+lrf3sTNSTeDhMyjmLbXogBi8ITXz/S9Cz9uWdqH8jFvHgSFx
 L9lt/P5UUnH1JkflzJEdKeST2zGCUUk=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a566f28 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g7gMiRdxR7lOOi1eyjcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qgrTpKj6zyZHCOvaZquvsFLUPLKbV8U9
X-Proofpoint-ORIG-GUID: qgrTpKj6zyZHCOvaZquvsFLUPLKbV8U9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119080-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:li
 sts@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2132A7574F6

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows external drivers to set
the PSCI reset command by passing a reset_type and a cookie.

Add support for the following reset commands:
  - SYSTEM_RESET2 vendor-specific resets.
  - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
    cookie maps to psci_standard_resets).
Unsupported commands fall back to the regular PSCI reset path.

Default to the existing reboot_mode-based reset flow unless a reset
command is configured. If a kernel panic occurs after a reset command is
set but before the final PSCI reset is issued, ignore the reset command
and follow the normal reboot_mode-based reset path.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 106 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/psci.h         |  36 +++++++++++++++
 2 files changed, 140 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..881819d09911 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -12,7 +12,9 @@
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/panic.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
@@ -51,6 +53,14 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_system_reset_cmd {
+	u32 reset_type;
+	u64 cookie;
+};
+
+static struct psci_system_reset_cmd reset_cmd;
+static DEFINE_MUTEX(reset_cmd_mutex);
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +90,62 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static u32 psci_get_sys_reset_fn(void)
+{
+	switch (reset_cmd.cookie) {
+	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_SYSTEM_RESET_COLD_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/** psci_set_reset_cmd() - Configure PSCI reset command
+ * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
+ *		firmware, or 0 for standard resets
+ * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
+ *		of enum psci_standard_resets when @reset_type is set to 0
+ *
+ * Supported commands:
+ * - PSCI SYSTEM_RESET2 vendor-specific reset:
+ *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
+ *     vendor-specific resets.
+ * - Standard reset selector:
+ *   - @reset_type must be 0.
+ *   - @cookie must be one of enum psci_standard_resets.
+ *
+ * This is an in-kernel helper intended for built-in reboot flow callers.
+ * reset command can be set only one time per boot cycle.
+ *
+ * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
+ * command is already set.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie)
+{
+	if (!reset_type && !cookie)
+		return -EINVAL;
+
+	scoped_guard(mutex, &reset_cmd_mutex) {
+		if (reset_cmd.reset_type || reset_cmd.cookie)
+			return -EBUSY;
+
+		reset_cmd.reset_type = reset_type;
+		reset_cmd.cookie = cookie;
+	}
+
+	return 0;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+EXPORT_SYMBOL_GPL(psci_has_system_reset2_support);
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +372,24 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(void)
+{
+	u32 psci_sys_reset_fn;
+
+	if ((reset_cmd.reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
+	    psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       reset_cmd.reset_type, reset_cmd.cookie, 0);
+	} else {
+		/* Retrieve the psci reset function from reset_cmd */
+		psci_sys_reset_fn = psci_get_sys_reset_fn();
+		if (!reset_cmd.reset_type && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +402,26 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	/* The function psci_handle_reboot_mode follows reboot_mode based
+	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
+	 *
+	 * The reset_cmd is configured at the reboot_notifier phase. If a kernel
+	 * panic occurs between the reboot_notifier and this final reset, skip the
+	 * command-based reset and let reboot_mode drive the reset flow.
+	 *
+	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
+	 * calls to reset the device. If it returns, either the reset failed, or the
+	 * command was unsupported. Fallback to reboot_mode based reset flow.
+	 */
+	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
+		psci_handle_reset_cmd();
+
+	psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..39fe0edec651 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -8,6 +8,7 @@
 #define __LINUX_PSCI_H
 
 #include <linux/arm-smccc.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 
@@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_standard_resets - Standard reset selectors for PSCI reset
+ * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
+ */
+enum psci_standard_resets {
+	PSCI_SYSTEM_RESET_COLD_RESET = 1,
+	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +56,33 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+/**
+ * psci_set_reset_cmd() - Configure PSCI reset command
+ * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
+ *		firmware, or 0 for standard resets
+ * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
+ *		of enum psci_standard_resets when @reset_type is set to 0
+ *
+ * Supported commands:
+ * - PSCI SYSTEM_RESET2 vendor-specific reset:
+ *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
+ *     vendor-reset encoding.
+ * - Standard reset selector:
+ *   - @reset_type must be 0.
+ *   - @cookie must be one of enum psci_standard_resets.
+ *
+ * This is an in-kernel helper intended for built-in reboot flow callers.
+ * reset command can be set only one time per boot cycle.
+ *
+ * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
+ * command is already set.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_set_reset_cmd(u32 reset_type, u64 cookie) { return 0; }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


