Return-Path: <linux-arm-msm+bounces-119078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MVMaLXhvVmr35QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA37574C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jacd173B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d7Qa6nuN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119078-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119078-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2364B30465CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93B73064A9;
	Tue, 14 Jul 2026 17:17:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A492AD37
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049431; cv=none; b=dIVoaimwFmrqYHdq+51zFElnftArnPHfKNm3VcAId77+49NodD0LsS0rkWmUImkPKTTBzOQhKOlf2lshslr9MTP1vLj8rnum8aXAFudVBMUoCw+mc6rLU5GJd8JOuUeeP1hEm4LQ+NNTNY/mXbRV7eimF8p0BBgtC/RPIvapaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049431; c=relaxed/simple;
	bh=RVaPOCf997VpffmwFz5T1csAYPCpvDfat+ouqwNAreI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGsWnANo7mSfb4CLlqhdUowGZOnGs7gkxz++/AZ0cdWkl8fsax2kVIV2NMckckuEYrBP731zsrPHRMjLvZ7Z0KCUh0rS9W0mOOJHCRAVQM07jL5WWNeoNEfZFM+dzarRar1luQUaXwGXqQ4pidcY3uGxmdblfgDy92I6y7K3kZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jacd173B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7Qa6nuN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6wNu1146526
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjSyKzBP4WUNp0FLzrltMMh/GI3GE10855Ym1ouXjsw=; b=jacd173BaaVbPsqW
	Ai7TTzusn/WkK9YXA2ocjqh/vu3NQqJHzGqwS3TWUJ2bd6BT6OXFeU3o1XR3L4hM
	61u9ZwHNpv1rl7N2owTFRtK0XXoB9RD/565tALOJXKRT7ngcWnb/Fw9DS2kGH1vW
	GBJtKOUpliRKoi4WaLCwMsVeB9cbC0xtrTqi2M7BlFNvE7xU9ugedve+TbjvUnAO
	WdyfcQ9ZGNhZHl5yjhMHMcAvxgdQGTLocLSNI8Km23vOEUlXIeoi23daxbtYtfjj
	qID592WNfZJDrSfGhjyIHLnJDEL0fpO509QEWl+61SHpz2Jehw56EZouw+GcwKlv
	cmm5Ag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnus33x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso4748250b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049429; x=1784654229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjSyKzBP4WUNp0FLzrltMMh/GI3GE10855Ym1ouXjsw=;
        b=d7Qa6nuNxGmvJO+YUAJKQMR8wpPVhQ+Gqs7Xzct/7PaprOZgxJ+dmjxlj8wBq8O+Kd
         PyHscwhozTeyieU1BZ/NCcPM0pOWy8g5cmcMi2VXjM9M2tEeLsWRObfTKA+nWEZ8atoW
         d4xvgfRiVykVLmafvNcuJHOl4LJyEyTkKro5HYPI3slFWT7i+MnU97qXpXw2B0Wj+uPU
         kyLsgqveLFvXgUmdOn+3NigxPgFDBnc5Nbi+cLnz4bcxRtU1IKv9j1Wmb6Eg7vhTc2G4
         6+EW+lgLic3LjuafDPmhl/ILBE9xr390/PwvuPQ0DohAxG4kQE+frfiyQASM5n944FTs
         vsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049429; x=1784654229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjSyKzBP4WUNp0FLzrltMMh/GI3GE10855Ym1ouXjsw=;
        b=jjLbCd3X4jhUM0YmI2aq5LyPdKKhy9bkWdqy27Xq5C57dbl9j8Jpy17X5SHt/vYUVg
         uzJ0rsbmhUP38exy1Nvn6J3RxOwIKV3bhQUnfnJiQ6qdzA80RrhIRoQ+9LrIPlHpCgHc
         D2XStfyv29A5Bvcs+iFoMgfuga1bfY/vyUDBGqbJ+T9ZMGcDtFLVbuszD6a/QZGrRcvG
         6fgA+INXWEomnCJ5raTWRQ6NCgypcs355tAPqujoQkXctUg1Yskb4wcVmXOOnChqh0dT
         Frc+9J31n7IMipLyU3zuS532KsXM8XNc4ORMuX8Yjw/oq3xqgSkpxPTUkpmPvYRYzyIA
         g71A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3veLX6ale6aoHmD1PNARjHPLINZc/Pnj/bfUCLExsk1Y0QDuu5QU5aPsjxd/ZvIG0fxQLZAyIgeNmkUld@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRDOnFhGB2zEzkVqzyBjDvRgPCG8HZyCQxRYXP8FKeq6BibgW
	cW0l4pJKcNtuN8z1auRgTIw8Z4RcOECQdZMgTnlthGUZNWgGqOkTtVEH3cOt0HeCU96GesKQBcZ
	N3r9IWmeKABK6Y/zKUoc9gtdBX4Gd7iIVdOiiEOczYfXogdzJOLnblGX/S4Pa8SPux5mV
X-Gm-Gg: AfdE7ckFX03tiUBLICB5TEr8m3CRMemKOoyuKfaZOz2HNEQ5qJ9JEI27Tw4hdmb/dfK
	5hdYrUoN/fMDZ45pX23MERxG5X6kM1/FcGUxwRw/590ZubNemNEJL3cDZGwsD3H0aHNIu991NrJ
	bpLfhIPE/3JnmxHyggqTc3qQNKjx+qqKCl46e40LOKkdZlXe1xwCRIDfWHO7GVBN5h5SpXvei9q
	99ltsemh80KjMCY68628YN3iXuTEtxO9CtIg95/ctRharJh+lxgLwihfoNJ9oTl67PtNIf4JeNn
	JMF/cWat4AfI1dEuieROb8ka7+xeAaPWpVSnggS8VO+NUF0/s6Os+re1/KRnbExrYwP7yojkZ6B
	fomfN8BsccKwbRippk4yBnH0hg6MjcFOuzcyS77M8pYlwvxc=
X-Received: by 2002:a05:6a00:98c:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-84889633831mr13028907b3a.3.1784049428404;
        Tue, 14 Jul 2026 10:17:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:98c:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-84889633831mr13028832b3a.3.1784049427878;
        Tue, 14 Jul 2026 10:17:07 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:07 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:30 +0530
Subject: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3 magic
 values per mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=7567;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=RVaPOCf997VpffmwFz5T1csAYPCpvDfat+ouqwNAreI=;
 b=rq4dDcAfNnVyv7NIzjQzhAv7vmit/5zydDQmKBy6uONRaNy+yzNahFgU9SxCoO3u+EjCayaGN
 XIlYzUBTfKtBFaO1xJPnn+6dynQAV0OeijYDKIJ17V21sDb4RsIfq1Q
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 0GIXNsWfCTac5GSx9lKQ63y6hzegKWlm
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a566f15 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0v6kfwnqDUnfvyonRkMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX8yLQ7ZX4sNnc
 1zp9wCSFYDIm8nvVw4bKSkzlM3oluEJeLWpYkgejV5o0mplKJhLyoBwFIorouBJSRnUrNp8Ah+h
 1n6Ge/CUmZ0zJnMhiAjiwLn8Y6f8Bu/bu/CC1Z1A+p0Xd+Vlg7irg2r2Fe7vpU/x1eZ8c6lwtfw
 dYS4/0tdd56s9f7c8MzGzXFunzwCJA9sOrdVYfpnbEkgYl0ZsPqHGWsCzfuma6JqJ7Fc3o41G2v
 B3udicGZOOQK8KG4eEWW5RpsiohcdSNX55r6SJOgMRIj8YJQyCetvDjs3BMVd52Ws9hONXoFiVR
 PeD+IOG4IpejP1N1ka/O87+kga235uM8/rH5wmrIaXQt+oJDB7KpaI+m7cMV/ptfuBIzDHDh6Fo
 O+KH1sEj+tZ3IyFtzCoLLv1GBLDfeBHDv/Py58IEB0q6PSAw2Zt2iSlgsjRzP9B7gWHKmHlN/bk
 mbxZEgonzBWKrsw6dbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXwMv7MQhTiBSP
 fyWw1sFMbShUeWUoyVr6aOzKnr9eiiBNwCiBbEhQX0pF5H76b8tTEIIiv0xBu9yHUOp5jMGOSEo
 IFvoKgyj34vrecOjw7CEgRb8XHD8h5M=
X-Proofpoint-GUID: 0GIXNsWfCTac5GSx9lKQ63y6hzegKWlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119078-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:li
 sts@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 23AA37574C9

ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
cookie as arguments. This cannot be implemented via the reboot-mode
framework, which supports a single 32-bit argument as magic value.

Extend the reboot-mode framework to support up to three 32-bit arguments
as magic, per reboot-mode.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
 drivers/power/reset/qcom-pon.c           |  8 ++++---
 drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
 drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
 include/linux/reboot-mode.h              |  4 +++-
 5 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index d260715fccf6..ac69b5f39fb4 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
 {
 	struct nvmem_reboot_mode *nvmem_rbm;
 	size_t buf_len;
 	void *buf;
 	int ret;
 
+	if (count != 1)
+		return -EINVAL;
+
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
 	buf = nvmem_cell_read(nvmem_rbm->cell, &buf_len);
@@ -32,10 +34,10 @@ static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
 		return PTR_ERR(buf);
 	kfree(buf);
 
-	if (buf_len > sizeof(magic))
+	if (buf_len > sizeof(magic[0]))
 		return -EINVAL;
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, buf_len);
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic[0], buf_len);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582..a508ab26d03f 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,19 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
 	int ret;
 
+	if (count != 1)
+		return -EINVAL;
+
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic[0] << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 7a74f72a8313..db2129c72341 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -22,7 +22,8 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u32 magic[3];
+	int count;
 	struct list_head list;
 };
 
@@ -74,8 +75,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -86,11 +86,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -98,21 +98,21 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info && info->count > 0)
+		reboot->write(reboot, info->magic, info->count);
 
 	return NOTIFY_DONE;
 }
@@ -175,16 +175,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic[3];
+	int count;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (count <= 0 || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			pr_debug("reboot mode %s without magic number\n", prop->name);
 			continue;
 		}
@@ -195,7 +201,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+			pr_debug("reboot mode %s with zero magic values\n", prop->name);
+			info->count = -1;
+		} else {
+			memcpy(info->magic, magic, count * sizeof(u32));
+			info->count = count;
+		}
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..983b1fbf614a 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,18 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
 {
 	struct syscon_reboot_mode *syscon_rbm;
 	int ret;
 
+	if (count != 1)
+		return -EINVAL;
+
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic[0]);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d6..34a81e4b4f95 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,12 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


