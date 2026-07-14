Return-Path: <linux-arm-msm+bounces-119088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gga6LCFwVmpC5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:21:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A4757598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:21:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WXL8B9bQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UOEbs00b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119088-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119088-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C89BB304243F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFDA4A13AA;
	Tue, 14 Jul 2026 17:18:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D830594E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049528; cv=none; b=aV1F9iRgS98DVD8RAAUBYBUoozWOhofgP/P0FPjCPeMVMYv/t13bSrGqWRx8/EhF7mLkDAt+Cnsi4SY3HZupplrGtu0FhBJiQe9L7+2yXfkZLEMGuehaqVDj3ZHYn2peZnQMLGraFeKI71csA5qqm8E0dH5AgTRCFQRwtcJM0Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049528; c=relaxed/simple;
	bh=kOJzOHPbdhQsKmeQIeYy6G9x3fc90kQ54JK6p6ylG7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqrtrEomjicH8cVl33nn5OvgUHPjpBWl3TVinZDhOVwJevEa86YqaY5QzWrVA8AoIfJc7mitjxZ3FKCOV4+Raynfe4n9O4tI1T02xbAmSVsK6tkvw/j+z0oG+QvKT0QBTbBIHcPq0WK+q3IkoFG1ktERz2aab7r76QgDn8j7et8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXL8B9bQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOEbs00b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6wJ11068859
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=; b=WXL8B9bQguMMatZ+
	nel8WLMgwkBiRf3tcfMMV+UESDdCx5LT+vWbGloU8cdejgUeuMEhrh1Lt4D0MMM4
	NATCKzvQg1jF/QrEc40SHxo4Fe3f3JzmpO7qDCLrTF1cszT8nxfSZlpTAnxQU3gC
	sYyWItlzVkBMfKIslCrG+gLoxgyUT/vUT7lXrrFDvPGdG830NX19H6RqMfTAcz8Y
	uDMGDoES+Nkzi10QkICUDcJk1Dg+EgKvWz9fLO13F/W7qX0W1LmZGB43XLyD9GO6
	BTf4R2DJWDPZLEMRoBaL2ebUpGwnN5uJ3fQJJlCzqib+givFxciMOxvSY14sTaxD
	FK1AFg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq1d68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:18:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1130789a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049525; x=1784654325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=;
        b=UOEbs00bAGkDO2vCVb04C8epGhSIQ6crNT8EXzkSrvknyYd217unoBFTnkWUO1mInr
         qBXMsj2zxgAUF0O/6B6e7iAXmCX+Qs2ZI7z/5Yt3h7QGKtxsSwBgqSGN9vra/UYmiXY8
         vF2doAo+pO29qwGyUsRHjj8TWOWInead9Ot2IKjrU5mQL69hJcwu3WeHNlDLoTJkAutW
         cKb+YByrWfZyeJsG9dLqvd60IWPPBzJxTw+2mK1YmHPigxGIcotWhG9S1oFRPd/zFTxX
         2+JLkUCzWL0IbtH/ghFZV5xq+b4YcQ1l0Zzi1UVQ6kKW945WowyBRlaktA6ymN89WnfM
         Ywjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049525; x=1784654325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=;
        b=WzDUMaBYEGN2Y/KslFdc+5c+aS3SR/0gwBTkQ4nLGHwz9RNErP/GFEgsgnSp7DLab1
         jp95NdyXGY2RWt6k+OVv0lRS3lbgMw2MqYJM06fsGvpejPyB1krgorKdcHti/N/7HR1p
         /Cb0z3lCEa9S8shJbqqiN4CMVhIovL5SFK0fWC7roRs1uJuAoGWVlUSMnNKH2pzeCeDV
         JwaTgNhsX9XmD1wpnKhEoJmpKB74RcqruswGO3onXoRGFA7yEsyOgwVbQakg8Vx6s5wH
         BDoM3Ikhkwrqa888uaNbLZX6UNsBNNN0HaifcATqL+We0cpC6vollM64JEW6tvsjFIHh
         Yj1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rogh6nSBiFzqmhmCPNn20jgm2DCiwrKSpBSk7TB/AduVHEQB+V1o+ZfKhwqSh6n5UBvTe2CSNoI9KsMqgOf@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZJj4WXav+PGbzx0s1G5tZxSZMRTlHqu0zy+g0hToT8IMfJ12
	9duDZGJznTZEp347Bo7jDmJtPZGG7u49H2uy3HkBpnFuSL8c3p6sioMyYqCeFgoDUnagtuGhunw
	C+4TVgmd1DLpk94vD25ZFy4YvR/DVAecYjLBWYQjAA4dOlxRoHS8TVXE/VzK88qq9tkyf
X-Gm-Gg: AfdE7cmQX5mwKm9giFLYYAIiDNG8nWjUDwmkOgOgTUTSs/0Ro6KzRj3FwPRvcrM8mXh
	tTbxJ12wsumQbo1LvvJgJr/+y8Oaf46AIgYgnXJl1cE9V2c8OekBBCC+oNSJf10mjrYJfRG3ZnY
	xWcq2lwo4Zw/MpNeq13+3RLpm+Z4eQPHiT3ICNCSw1qbKClCfwjp210DCHZqc23NvfAyR6YEJdS
	U4q/YBZamqMwMaUNEgTWm2T7MAdSu97WwNaXDYb11AemzxUA6rzSZthB1LWqutGl7cUAPe6dwJf
	uzn12sM4uucvJ4Ebqyxb/Fzzs4tfuM4pfQTw3NoC6kYoK08Z3ziBc37ioQ+y5nPy8y35O0vSN2Y
	NXEUmcvmqSxqrebfbBZA3TXeBaMU8i7c2R3InznN4a/GMT/c=
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12967995b3a.36.1784049525195;
        Tue, 14 Jul 2026 10:18:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12967962b3a.36.1784049524575;
        Tue, 14 Jul 2026 10:18:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:40 +0530
Subject: [PATCH v23 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-12-e7453c548c21@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kOJzOHPbdhQsKmeQIeYy6G9x3fc90kQ54JK6p6ylG7k=;
 b=ESGx5r3AQTBnDLh7oNOdrBzmCSNSjUnfykfNHJyYl+Z9qNPaSE/ou7JEMTQ65oKELFQeNIKrf
 gNtsrQ7u/c0DYCpwV0Jha+KGoHoHt0fDHHSiGc934ncbOOknuX05b9L
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a566f76 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: iDNBBllzT26bwwnMYGUvSJ_eumEq7D9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX+Vgnbwwz+KUh
 d0ZGaFvxZOyYaekCvI50l8itInJ/CEWVcv1q4U7StOGhKchwJFAa/Zfw7MvuDhNPGJHXIPto6ds
 gaQJgmHYXOPme6cnF1qKmmmUlGtTlgrXQQPE9l+95M7vNilsZ+uMUNRgU/Ehc5BkEqY9cgG8bhi
 COqAw8ztCFermSQfMDZ1Ln/oHPut4oW8NJNTAm0kjb55YeU4WfMTs/4t5fRG+DHh7oFnD1GtqVm
 ZceqPmjalttP0ThJkHyrbQs6suHHbAC+w3U305COFvEWXDM+kfWZFI29Mt7+JDUzsIT+038SMfw
 VlTTyyyuok5I201M0igfE0bvfCVPh00OlebVtj4LAkmiuUr7HpF20LR+auGTYbbqz8kaxy5PO3F
 +P8QWZDq1FKo82c7oIfQPsUPrrGswSveYwUknLLRialPHNyZiJor4nehkUC+jFHftK3VgOoK0ww
 59SEpaCWQsmWwOIfAcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX01zWaYLm72+g
 4m+YjfOcJezG4uk543H2OsvHRuVGBkwPe0zeJSZMKLf7a1VYVnXYgeKGlyY2Djw9fle+8Tr/wsF
 Lzd+Pu10BE+lRIUbTuYbQHbQ/ZgLNdM=
X-Proofpoint-ORIG-GUID: iDNBBllzT26bwwnMYGUvSJ_eumEq7D9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119088-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@
 kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2D9A4757598

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..df668dbf2bc6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..824ec3838c75 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3ab5ae3124ed 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


