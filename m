Return-Path: <linux-arm-msm+bounces-119077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bi/8AlVvVmrg5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B677574A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:18:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pQRQxA+/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gyfzShLk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119077-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119077-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A7AA31308D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA2E3321AA;
	Tue, 14 Jul 2026 17:17:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB703009D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049422; cv=none; b=Pbt7oZ645K2ow3egMFEVI1EYl7G6/XQIB84pTP5DDhQmYN4eoewgIKyf53HcSUXz6DWe8bIMZVd02LuFMuuW68WjkJYqEgTFVIQTl6d/vO65FlYlZGJv5ojcIoOyG3V3Erw/2l5inznnR4W1JArPN4+SzGDxjCP7GFSpaYGX/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049422; c=relaxed/simple;
	bh=/IxZw+rPFwV39zq+p6TpSHd4rD601RR4H9Jp0jIyzsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/L/+V+Z6A57UZmlt8muM6i4FmsL6CGCFOHVJPQsTPB5uH5/Jy65oPJrChT6VpnI+gaUCymD7NRP4trbnTvquTgftmgn/vE+6Y5FB+o4NqXZ+DNmubX5wTEFJ9VdJcdU+vqNSr66P1EEiqxJaxbZX+c01H3K/+V+2dWH//9IdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQRQxA+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyfzShLk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6vYT975563
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=; b=pQRQxA+/1t/wHLtp
	9bH7qrghD7GWtYyd9/rP0xceQn03HfHHxwiReLYufo6O1c6lp/JoD801sHtZ8N8M
	eCDc9vRoIJCAO8bGYEZLUzaNM8PSbpLYzjgZVomAHZeYv5VMH/Xt1b8WwPasbGDk
	yOWEjTUkG+IJ6+DxBPgjkVAbS0ArwGpcZRwy7+90saDzN6TA9yGHDZ1vfiKzFgu9
	jbiLv8Vw7LwANZ797B899Bh07TFr3HOT1lvxflM9YoNeuYx51zMUuYOeGc+Tv/x5
	Bvqsy2ssn87mR2JOQ6cSXHYvPg47uvT/pP8dSeHR1p+5K2Afo7cZHCbEN9GLPvY2
	iEgeeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2d15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:17:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so11326231b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049419; x=1784654219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=;
        b=gyfzShLkt33ffA492CKvj/nHgcxx9a/tlkHMIYO2IzJ4y1bhNBZxPrcwcf+APy6VMJ
         Jrl8mE5R0AzXCucXmPyxMBIcyJQWi4LSw3zKv5QANzvVlwmkL6d9+QoUbHai/12yXx2J
         baTiBuat2vPCcln9VY8VjdG6ytTZrf2JKmzbe4uh2DP/p2/NPz2hiQu1q4/Cv2KTGt8q
         cBG/ilv2R+FMUwqyTOchFpmLSuyFV7a2MYihXnF8ou3w0Eal8ICTOdZsNubO/w8jVCuU
         V78+rEvZiq8F5ZvhtIkN1jrMAZH+RV5Xo+D6VqUI3Oq+QIn5rjVvzsubwKnzQLrfAA2E
         A4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049419; x=1784654219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=;
        b=dmuDUNWiHdUaBDw3sH/m75HampAnPRaGoIyLsUbSqmMS5VWIn7LWlbShbvImuX8iU7
         eAibVG+7PgRD7zROa4t59Ij0OnhAM5uY+O9SzuVQoTT0dYG5T6c3cue6fNyrKYu+xs/L
         mgo7QMOBZ0fmQ7Kyh9o0NBzqy8ziwM1fkRYWMWZm/zmgxN2Vwz4VIkMXjuLEsGw7rN0d
         j3yaddj7PnbA1Adw0wbrlYwq0QUE2oiWGNuMPE7aXogggNH85vTVLnZHSrhHwyk7riUH
         3rP60IS0miZwWkafuLJitHo5QLLCzpI4PNzhVLbvvoXuYUDB7dTlRonQd1n62vQVJuru
         1NwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXUN5pTwvi/jeFffQSsX4HGR1/FmUdju9/d+wpOW5G90vzx/LwGeTNphFJmW89pGuplwhskFXrmTA2Yz/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwwRJoiIaS3mIxWjJLBw/qzYWIkjTPiv6eOvKKa8RemxBzfX2Kc
	lWyRGD50/dtUOhe1tYrP0Ihs4MIxcVC7fVw+bf4k+MinCLAX3aA2jb3GnP38P/gDkr1J2Xs3sV4
	svUwYlKWL7OfcFTsnA4ldsTRpuxtRmIkc1RhscPv/XVb3aJboUy2LwHZJ/WaVE1hg543m
X-Gm-Gg: AfdE7clQaqZHlyMZXLb5m+vuKmtR1oq+Q+t45n8R1VC5InRD6fwCz2HbZdjxwlQXcuf
	fofPYe+0J8g34KuXX3WILruY6G4fpNQhkD5dwool0ijcjhVDG1ck6jP+Zd1hEppJ/3p9YvOF6u1
	QJ5YbFyfTHk0UdzYvwHoolzh51U7nTNIQ3liIT7HL6us7rhyLkmzPw/ef+ODB35EvMUzzqyIU1I
	9F57Eo2+KKeesR/rRF6CbbIh41DDhIdypCxYnI62/N8Yz5RGoXk4P5jCoiPZuS/akWmLgGLYi+g
	ePrVWAeLGDVbdqVmU3CAMkNQIh7qivuzWGytDHXV+8OXA7LemUxlAsK/m6YtXWiIDU344edH1c3
	VF7QxZOW0f0GXi03o4nQRfNFMsZmliE9PksCakqLDNSk4f2g=
X-Received: by 2002:a05:6a00:b8d:b0:84a:2d58:15 with SMTP id d2e1a72fcca58-84a559b1b01mr3518019b3a.57.1784049418885;
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:84a:2d58:15 with SMTP id d2e1a72fcca58-84a559b1b01mr3517967b3a.57.1784049418391;
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:29 +0530
Subject: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=3945;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/IxZw+rPFwV39zq+p6TpSHd4rD601RR4H9Jp0jIyzsk=;
 b=FOkQfPXWoK1qKl0kI0Ie+LmI64jVoDcFZgWGS8EMP1eqQh+aDqSNIUpOAP/s/w438Ry6H1wC6
 tPpdm8vhetwDWabHr8DUbmoiap1etgE61m9idry1GmUboP18+EMoF3E
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX9QOjF9BB315J
 FB+zcwXVUanTqJ81y8Id90OQ7gDP3U23XaGe6+09DjKkKSENIZWoExYOYbTIBIKM0GSiy9B52BZ
 vgCQP8mraS/2PZzp4wkoN5jyQtkc1x8vhpTCsPjk7zEArpgOL16p6XrRH3Y/4/8kdjN5uVlZFAI
 oZqQsqZaFO9q390ShPacLjL9Wxj4MVVpVVs8IZIxGyvlWuBq7McXM4FJD1wqGJxTJR/V7JobIlk
 TmsSFwOWO9pOzNoqK9ugnNs6qTtyQjmJ2BWRHaHrWAmOqPLifi/Ffp2Vd+urDCM2CBUfzsjouTJ
 /JATiILjQ5YOGwg3irnld17cPu0SpRwhryEFRhFBtHTZL8Wq+Iq3HItZGl94EIH5JYBv59eaQ/M
 Cm22+5piWzmGn8P9Ysq8B4+RjiNAWRPY/XXnnHWZ0jzBC5822neY1wJL/POHfvuSDJIdQ6vbU6w
 pRBLlqfIz1zmlnumcCQ==
X-Proofpoint-GUID: a_c0ir40JxKDsJIoQTNDJIXsXb8n1I_4
X-Proofpoint-ORIG-GUID: a_c0ir40JxKDsJIoQTNDJIXsXb8n1I_4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXx93f5AlzTVnU
 TF2Z6uVUF81iZQx93OQraGZpL+XZmR3bPT4RYFBaaHOWktjUtkJad0iLuKE/cr7H3uzoMyuvJgM
 gyQ8RnUyvk7n3LSF8IfjXycvRUzgQkA=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f0c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-119077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:sebastian.reichel@collabora.com,m:bartosz.gol
 aszewski@oss.qualcomm.com,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 95B677574A2

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index d20e44db0532..7a74f72a8313 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -10,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 #include <linux/slab.h>
@@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
+	struct mode_info *info = NULL;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			pr_debug("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -200,12 +203,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
+		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -218,6 +221,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
+	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -261,12 +265,16 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1


