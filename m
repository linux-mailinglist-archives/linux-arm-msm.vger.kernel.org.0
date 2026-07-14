Return-Path: <linux-arm-msm+bounces-119044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yz/ZH+E7VmrT1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:38:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA87553FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:38:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K1gx0cTZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Va97bLam;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C5A33095F7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37983191CE;
	Tue, 14 Jul 2026 13:29:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576C3128D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035790; cv=none; b=kt+mucsB/02NZ0iWStaupX00ZxBCYUC5f2cCa6rKTwedQ5EI8AV86VYvoDcsM8xwhDG1HgKcWFBpk/iXKxYcgyq4jlhCm4e8dAppFztHRvv0GVHVtrNVJhWjJmFxuKmo6YdrEp0Ka+meDWLwB39mPDCIL05s/NMPAih3KtH4MLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035790; c=relaxed/simple;
	bh=ddXIwzcq69bke5xNa9ihXe5S9Fqz3ubWOFlTMrMw3WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCtdt9RHIVpQ1ZkNm9APAmGaZKwZUONt1d5BTOOJaNiHqPx3SiZtnoHPqpf51OUpIDsJWmdkCsje46s/ONdU4vKgJsMscuVu0K/D0Z5M1rhRlRt6QLJkHeGrksCIl0lB/VmdQTYa8L62vgS1IdSHbxyB9zpaV9J7u2OIFFT/rvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1gx0cTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Va97bLam; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOEE9108634
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00Q7YH6eDQ6ptYXmSdMzfh3T8Q4kbHubaB7GwVpuRik=; b=K1gx0cTZoZ4ghvyq
	xdu1uKleqnvXartFRKkAxxsjNdTJy3e1tUpfdArTxn6GRzoQzk3hm4Ro2znKexll
	Dcz80Pos7mjoQvbjyRhf+qJZagMKJV/8uQx1B2Rd2TRGh98/jkzyEUrXqc7SVp8L
	QO+9xRqvyhv5MJSjTjDqw1zINRz/PdYkHId8T1UlVmsiO6E4FOCGgszMhwFkGCcj
	Qs1UqQsZSpVgNTzF3B7/2vHvBPu9OUB+U7aOi9e694LHlhzazuKPa3v1JgvbEmWJ
	z1jtgEZDUPLXkjjXdtbMFAA/8kMTy2/hZudsBD7rNVQiLcdNEklG0UAJu4KBCNf7
	dcjorw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa9uys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:29:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92efd2ca21aso543898485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035787; x=1784640587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00Q7YH6eDQ6ptYXmSdMzfh3T8Q4kbHubaB7GwVpuRik=;
        b=Va97bLamo9Rogk5kH57trTukVF+MFV+MKnmGmqzgiymV5H0266+pBOeAvOmL5BPlsD
         cSuyUhXbbafmghy+yW0qn2AgajRHQR10lFjWzQqMhIUaWryHPRF2vdj3nS/lbdV01H0i
         eSs1gI7vuFeabY0kNavzCX8Pt1tcKUAGnFE9ItGkrujAJ8A37v9NrFQXJmkhNd/XHymX
         R9KjSYPKu3bfOTGBPCCjKI2lKHGsS2j9gHu32KpMNIofkLCxPOlfgOhcG4GomFkqhWQ8
         wlXNeOA4ApAz5LXL7KXxO0WNEOSFgUIKFa6HGURT65tVNMBmUWoXgWoG3unpsKopCgiw
         b9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035787; x=1784640587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00Q7YH6eDQ6ptYXmSdMzfh3T8Q4kbHubaB7GwVpuRik=;
        b=Ip1XaN76gGHIpU4KVPpkLX4jJsEHdMQr3/dkDElY5vcBAgLcW1L+dPy3OzuEmnq8ww
         3KRzlKDHCjWvOd5H/6EazckjXwlxwKqCxmxEJwEXhQ+8cwKb39xD7YGyZHkhJhKIdU55
         PrvoIxpo6LNdgBaRduLODc/DDr72X7ah1GqcuSuQYQZ1uOtWoWOwbrfN/pE9pY28UVR8
         b2pEIsuJalp0ogqlRmQkQ5BbzCr+5cepuIRV8h/k0YgQVczWCIlI/7umUfccKJ+BeDb6
         J7igIihJnO7MBcXP4kr90lPZtXOxVWXJmuc2y8B7lli/65MPvVATJRFZuTnzLkjzK/UU
         V4sg==
X-Forwarded-Encrypted: i=1; AHgh+RoFaCUsti7V9ZkW3oSFxJT7uJBCMyGLp5F0/ybuN03JafHv3Yk6WxHkZhhqtGXXbfa8jPpkLyPM28WXZ586@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPCZgCwmr0Oe/1jKo00T/ZVO7sxbmh4rbJ44+n9QS0ygnYAjX
	zVSD8e7F9XKyE+IBzvoSS+eeJyjmBP12Kl3oRIkQixLECHa+xgTqK4a/H5IlAEvwY/s6CdMR4r/
	0lhcF2KbBo4cHQ89P96PLLyaa7e6hzm4++WQvaUkMm5d4bDmW0HHYacpnn5Admif7pFp9
X-Gm-Gg: AfdE7cky5cYEpIGv6rqPEMQ6GWhYB70cBZSXYPoq8cpEqPzO/lFpdxTWOyMDVb9XTom
	3OW72NCYxtgnrMt5yEOkFG9kSoWdnQOYwMKrhQD7cHRRbv9Gg5rTjRVTfOuQr2sq9i6LteNZAFf
	x2q/6+z/jPXA+8YXjZkGYR4j4jK/cXXH2DEN3XmMqMnrRCfobmqf89GWn0Hsck81OUFsVDhH2Xz
	LYDkwlkwZp0B0XvJq61NfLv7jD1Bj9+2GPB+c4nD6F7cxpD15kbBWZLn9agmWQ48S/2e0Srm+nX
	ovUAalQhhrotx9qgxtzt6K0R5XcQNL0gkfismkSG37UuBwv1yAk6i3Y50x1AB/ZZrpxKTu9OEIL
	Il4Esgct5dMijdjcIh9rJ/HTkjSxQGA0bfnPUSfwv
X-Received: by 2002:a05:620a:469e:b0:92e:c117:9ea9 with SMTP id af79cd13be357-92ef2e303aamr1315625385a.87.1784035787633;
        Tue, 14 Jul 2026 06:29:47 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:92e:c117:9ea9 with SMTP id af79cd13be357-92ef2e303aamr1315621985a.87.1784035787277;
        Tue, 14 Jul 2026 06:29:47 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6c28bsm1503753785a.46.2026.07.14.06.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:29:46 -0700 (PDT)
Message-ID: <e83dffd9-e54f-45a8-b997-e84b5beead71@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:59:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
 <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX62r8Qe8N6FK0
 uEBTnMbKDnmp6pKTAYLDjTf66xCBB7b4dE44fth1n1X1jqbIQtvLvTo0HEgfSCSy7drRQUa3jlP
 bVHiMXLSeD3u48PUFilQcS1AyyyOHSk=
X-Proofpoint-GUID: Yu8j50uAyNUg8E0mOJJoAK-uSAu403XC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX8a244s0qvCPX
 GJD9Sn0t+Hrhlz/ASEjMF8DUIiZfKg6i1Xqiwlu563HhXt+B/vUYUt8goAiNbFwaxXTE8f0gz9f
 XD4Xb5333xKhhFLTptge/S4JCkJhQe+WNOvUX/T4OB/FynpAYEToxJwbuMmQ0FS3UVjU4YTHdkI
 qKDXAbuoXp2xpclBPxbYOx4Z+90ywVZ58ELA5X5D02xey0PU/aJtSawgYZ0HT8AT65CIIcP9b7t
 N02aVy+s9oeFgnjxFeordIZbnS+EFKtUmu9l0E0G1f0391MnY2gdxNs56HMrFRHJ2zYGsBn4CIC
 vcIUgZk/5UDFeF0BVhTQRW12q5plfems9AsIZR3XhhP2oH0DTNoLSoYt04l3dx36EuvPiNmOpaq
 X560OCc1n/nZyMfA6avEayLSc3xYvx7yuEHSTXHrSHbiUp+SzshZExb6QCvCuJjLWo2F0vVuX+u
 WgemAoc70Lc7GoNOTdQ==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a5639cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=LIVxzhUnV8PAbWL9GmcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Yu8j50uAyNUg8E0mOJJoAK-uSAu403XC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140139
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119044-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulf.hansson@oss.qualcomm.com,m:m.szyprowski@samsung.com,m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,samsung.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5CA87553FD



On 7/14/2026 6:34 PM, Ulf Hansson wrote:
> On Thu, Jul 9, 2026 at 1:41 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:

[...]

> Without detailed HW expertise (still learning about the UnoQ), it
> looks to me that the HW may have been modelled upside down.
> 
> The power-domain-cpu-cluster should probably *not* be the consumer of
> the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
> example.

Agree, There is a series [1] sent out to fix modeling similar to how rpmh-rsc works.

[1] https://lore.kernel.org/lkml/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/

Thanks,
Maulik

